Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F0C3AC15C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 05:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbhFRDeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 23:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbhFRDeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 23:34:12 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9256C061768
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 20:32:01 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D89848365B;
        Fri, 18 Jun 2021 15:31:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1623987118;
        bh=icXFn/msrOuqMkrebhSfUl6enhuqfpR81SDfGaApTdY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CHk6gPSz4xqp1EIeJcmI4N56BOMhucO6ZP/YGRD62R0FlKxr/1sEdbYxpXusBH6YI
         sDTD3Gb4PXR/Wf8ZBXzL0j0A2FNZZhoahCNiY5D2p0cxjeFj3bzMhEF3lhSzRBFW8W
         z9QfJkKCYiZMZXSRKeYYdSYlwwYIlm0vS//VRer0hEK1aLR4KXOsjDalWK3IFWuigc
         8Z1N58taYtrk8aw1AgdJ848O9Pr9676OCDJBZXMe9r00Orc0DZeG7prCgGjWviiWUx
         H+A+0RuEkOTHXdmD7Wm10I01+oaP6KTFasewXD8tjK0P/r1EHgXOpfTLupE3XtBJ4n
         UmksVIDlvMoYA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60cc13ae0001>; Fri, 18 Jun 2021 15:31:58 +1200
Received: from pauld-dl.ws.atlnz.lc (pauld-dl.ws.atlnz.lc [10.33.23.37])
        by pat.atlnz.lc (Postfix) with ESMTP id 91E0B13EEA3;
        Fri, 18 Jun 2021 15:31:58 +1200 (NZST)
Received: by pauld-dl.ws.atlnz.lc (Postfix, from userid 1684)
        id 876151E0523; Fri, 18 Jun 2021 15:31:58 +1200 (NZST)
From:   Paul Davey <paul.davey@alliedtelesis.co.nz>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Davey <paul.davey@alliedtelesis.co.nz>
Subject: [PATCH 2/2] bus: mhi: Fix MHI DMA structure endianness
Date:   Fri, 18 Jun 2021 15:31:32 +1200
Message-Id: <20210618033132.24839-3-paul.davey@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210618033132.24839-1-paul.davey@alliedtelesis.co.nz>
References: <20210618033132.24839-1-paul.davey@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=IOh89TnG c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=r6YtysWOX24A:10 a=T50nBIMryO7xOGcRkmgA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MHI driver does not work on big endian architectures.  The
controller never transitions into mission mode.  This appears to be due
to the modem device expecting the various contexts and transfer rings to
have fields in little endian order in memory, but the driver constructs
them in native endianness.

Fix MHI event, channel and command contexts and TRE handling macros to
use explicit conversion to little endian.  Mark fields in relevant
structures as little endian to document this requirement.

Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
---
 drivers/bus/mhi/core/debugfs.c  |  26 +++----
 drivers/bus/mhi/core/init.c     |  36 ++++-----
 drivers/bus/mhi/core/internal.h | 129 ++++++++++++++++----------------
 drivers/bus/mhi/core/main.c     |  36 ++++-----
 drivers/bus/mhi/core/pm.c       |   8 +-
 5 files changed, 119 insertions(+), 116 deletions(-)

diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugf=
s.c
index 858d7516410b..d818586c229d 100644
--- a/drivers/bus/mhi/core/debugfs.c
+++ b/drivers/bus/mhi/core/debugfs.c
@@ -60,16 +60,16 @@ static int mhi_debugfs_events_show(struct seq_file *m=
, void *d)
 		}
=20
 		seq_printf(m, "Index: %d intmod count: %lu time: %lu",
-			   i, (er_ctxt->intmod & EV_CTX_INTMODC_MASK) >>
+			   i, (le32_to_cpu(er_ctxt->intmod) & EV_CTX_INTMODC_MASK) >>
 			   EV_CTX_INTMODC_SHIFT,
-			   (er_ctxt->intmod & EV_CTX_INTMODT_MASK) >>
+			   (le32_to_cpu(er_ctxt->intmod) & EV_CTX_INTMODT_MASK) >>
 			   EV_CTX_INTMODT_SHIFT);
=20
-		seq_printf(m, " base: 0x%0llx len: 0x%llx", er_ctxt->rbase,
-			   er_ctxt->rlen);
+		seq_printf(m, " base: 0x%0llx len: 0x%llx", le64_to_cpu(er_ctxt->rbase=
),
+			   le64_to_cpu(er_ctxt->rlen));
=20
-		seq_printf(m, " rp: 0x%llx wp: 0x%llx", er_ctxt->rp,
-			   er_ctxt->wp);
+		seq_printf(m, " rp: 0x%llx wp: 0x%llx", le64_to_cpu(er_ctxt->rp),
+			   le64_to_cpu(er_ctxt->wp));
=20
 		seq_printf(m, " local rp: 0x%pK db: 0x%pad\n", ring->rp,
 			   &mhi_event->db_cfg.db_val);
@@ -106,18 +106,18 @@ static int mhi_debugfs_channels_show(struct seq_fil=
e *m, void *d)
=20
 		seq_printf(m,
 			   "%s(%u) state: 0x%lx brstmode: 0x%lx pollcfg: 0x%lx",
-			   mhi_chan->name, mhi_chan->chan, (chan_ctxt->chcfg &
+			   mhi_chan->name, mhi_chan->chan, (le32_to_cpu(chan_ctxt->chcfg) &
 			   CHAN_CTX_CHSTATE_MASK) >> CHAN_CTX_CHSTATE_SHIFT,
-			   (chan_ctxt->chcfg & CHAN_CTX_BRSTMODE_MASK) >>
-			   CHAN_CTX_BRSTMODE_SHIFT, (chan_ctxt->chcfg &
+			   (le32_to_cpu(chan_ctxt->chcfg) & CHAN_CTX_BRSTMODE_MASK) >>
+			   CHAN_CTX_BRSTMODE_SHIFT, (le32_to_cpu(chan_ctxt->chcfg) &
 			   CHAN_CTX_POLLCFG_MASK) >> CHAN_CTX_POLLCFG_SHIFT);
=20
-		seq_printf(m, " type: 0x%x event ring: %u", chan_ctxt->chtype,
-			   chan_ctxt->erindex);
+		seq_printf(m, " type: 0x%x event ring: %u", le32_to_cpu(chan_ctxt->cht=
ype),
+			   le32_to_cpu(chan_ctxt->erindex));
=20
 		seq_printf(m, " base: 0x%llx len: 0x%llx rp: 0x%llx wp: 0x%llx",
-			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->rp,
-			   chan_ctxt->wp);
+			   le64_to_cpu(chan_ctxt->rbase), le64_to_cpu(chan_ctxt->rlen),
+			   le64_to_cpu(chan_ctxt->rp), le64_to_cpu(chan_ctxt->wp));
=20
 		seq_printf(m, " local rp: 0x%pK local wp: 0x%pK db: 0x%pad\n",
 			   ring->rp, ring->wp,
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 87cc0c449078..9515a6c50f23 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -291,17 +291,17 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cn=
trl)
 		if (mhi_chan->offload_ch)
 			continue;
=20
-		tmp =3D chan_ctxt->chcfg;
+		tmp =3D le32_to_cpu(chan_ctxt->chcfg);
 		tmp &=3D ~CHAN_CTX_CHSTATE_MASK;
 		tmp |=3D (MHI_CH_STATE_DISABLED << CHAN_CTX_CHSTATE_SHIFT);
 		tmp &=3D ~CHAN_CTX_BRSTMODE_MASK;
 		tmp |=3D (mhi_chan->db_cfg.brstmode << CHAN_CTX_BRSTMODE_SHIFT);
 		tmp &=3D ~CHAN_CTX_POLLCFG_MASK;
 		tmp |=3D (mhi_chan->db_cfg.pollcfg << CHAN_CTX_POLLCFG_SHIFT);
-		chan_ctxt->chcfg =3D tmp;
+		chan_ctxt->chcfg =3D cpu_to_le32(tmp);
=20
-		chan_ctxt->chtype =3D mhi_chan->type;
-		chan_ctxt->erindex =3D mhi_chan->er_index;
+		chan_ctxt->chtype =3D cpu_to_le32(mhi_chan->type);
+		chan_ctxt->erindex =3D cpu_to_le32(mhi_chan->er_index);
=20
 		mhi_chan->ch_state =3D MHI_CH_STATE_DISABLED;
 		mhi_chan->tre_ring.db_addr =3D (void __iomem *)&chan_ctxt->wp;
@@ -326,14 +326,14 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cn=
trl)
 		if (mhi_event->offload_ev)
 			continue;
=20
-		tmp =3D er_ctxt->intmod;
+		tmp =3D le32_to_cpu(er_ctxt->intmod);
 		tmp &=3D ~EV_CTX_INTMODC_MASK;
 		tmp &=3D ~EV_CTX_INTMODT_MASK;
 		tmp |=3D (mhi_event->intmod << EV_CTX_INTMODT_SHIFT);
-		er_ctxt->intmod =3D tmp;
+		er_ctxt->intmod =3D cpu_to_le32(tmp);
=20
-		er_ctxt->ertype =3D MHI_ER_TYPE_VALID;
-		er_ctxt->msivec =3D mhi_event->irq;
+		er_ctxt->ertype =3D cpu_to_le32(MHI_ER_TYPE_VALID);
+		er_ctxt->msivec =3D cpu_to_le32(mhi_event->irq);
 		mhi_event->db_cfg.db_mode =3D true;
=20
 		ring->el_size =3D sizeof(struct mhi_tre);
@@ -347,9 +347,9 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntr=
l)
 		 * ring is empty
 		 */
 		ring->rp =3D ring->wp =3D ring->base;
-		er_ctxt->rbase =3D ring->iommu_base;
+		er_ctxt->rbase =3D cpu_to_le64(ring->iommu_base);
 		er_ctxt->rp =3D er_ctxt->wp =3D er_ctxt->rbase;
-		er_ctxt->rlen =3D ring->len;
+		er_ctxt->rlen =3D cpu_to_le64(ring->len);
 		ring->ctxt_wp =3D &er_ctxt->wp;
 	}
=20
@@ -376,9 +376,9 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntr=
l)
 			goto error_alloc_cmd;
=20
 		ring->rp =3D ring->wp =3D ring->base;
-		cmd_ctxt->rbase =3D ring->iommu_base;
+		cmd_ctxt->rbase =3D cpu_to_le64(ring->iommu_base);
 		cmd_ctxt->rp =3D cmd_ctxt->wp =3D cmd_ctxt->rbase;
-		cmd_ctxt->rlen =3D ring->len;
+		cmd_ctxt->rlen =3D cpu_to_le64(ring->len);
 		ring->ctxt_wp =3D &cmd_ctxt->wp;
 	}
=20
@@ -579,10 +579,10 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mh=
i_cntrl,
 	chan_ctxt->rp =3D 0;
 	chan_ctxt->wp =3D 0;
=20
-	tmp =3D chan_ctxt->chcfg;
+	tmp =3D le32_to_cpu(chan_ctxt->chcfg);
 	tmp &=3D ~CHAN_CTX_CHSTATE_MASK;
 	tmp |=3D (MHI_CH_STATE_DISABLED << CHAN_CTX_CHSTATE_SHIFT);
-	chan_ctxt->chcfg =3D tmp;
+	chan_ctxt->chcfg =3D cpu_to_le32(tmp);
=20
 	/* Update to all cores */
 	smp_wmb();
@@ -616,14 +616,14 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_c=
ntrl,
 		return -ENOMEM;
 	}
=20
-	tmp =3D chan_ctxt->chcfg;
+	tmp =3D le32_to_cpu(chan_ctxt->chcfg);
 	tmp &=3D ~CHAN_CTX_CHSTATE_MASK;
 	tmp |=3D (MHI_CH_STATE_ENABLED << CHAN_CTX_CHSTATE_SHIFT);
-	chan_ctxt->chcfg =3D tmp;
+	chan_ctxt->chcfg =3D cpu_to_le32(tmp);
=20
-	chan_ctxt->rbase =3D tre_ring->iommu_base;
+	chan_ctxt->rbase =3D cpu_to_le64(tre_ring->iommu_base);
 	chan_ctxt->rp =3D chan_ctxt->wp =3D chan_ctxt->rbase;
-	chan_ctxt->rlen =3D tre_ring->len;
+	chan_ctxt->rlen =3D cpu_to_le64(tre_ring->len);
 	tre_ring->ctxt_wp =3D &chan_ctxt->wp;
=20
 	tre_ring->rp =3D tre_ring->wp =3D tre_ring->base;
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/inter=
nal.h
index 672052fe3b44..44634153ed04 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -209,14 +209,14 @@ extern struct bus_type mhi_bus_type;
 #define EV_CTX_INTMODT_MASK GENMASK(31, 16)
 #define EV_CTX_INTMODT_SHIFT 16
 struct mhi_event_ctxt {
-	__u32 intmod;
-	__u32 ertype;
-	__u32 msivec;
-
-	__u64 rbase __packed __aligned(4);
-	__u64 rlen __packed __aligned(4);
-	__u64 rp __packed __aligned(4);
-	__u64 wp __packed __aligned(4);
+	__le32 intmod;
+	__le32 ertype;
+	__le32 msivec;
+
+	__le64 rbase __packed __aligned(4);
+	__le64 rlen __packed __aligned(4);
+	__le64 rp __packed __aligned(4);
+	__le64 wp __packed __aligned(4);
 };
=20
 #define CHAN_CTX_CHSTATE_MASK GENMASK(7, 0)
@@ -227,25 +227,25 @@ struct mhi_event_ctxt {
 #define CHAN_CTX_POLLCFG_SHIFT 10
 #define CHAN_CTX_RESERVED_MASK GENMASK(31, 16)
 struct mhi_chan_ctxt {
-	__u32 chcfg;
-	__u32 chtype;
-	__u32 erindex;
-
-	__u64 rbase __packed __aligned(4);
-	__u64 rlen __packed __aligned(4);
-	__u64 rp __packed __aligned(4);
-	__u64 wp __packed __aligned(4);
+	__le32 chcfg;
+	__le32 chtype;
+	__le32 erindex;
+
+	__le64 rbase __packed __aligned(4);
+	__le64 rlen __packed __aligned(4);
+	__le64 rp __packed __aligned(4);
+	__le64 wp __packed __aligned(4);
 };
=20
 struct mhi_cmd_ctxt {
-	__u32 reserved0;
-	__u32 reserved1;
-	__u32 reserved2;
-
-	__u64 rbase __packed __aligned(4);
-	__u64 rlen __packed __aligned(4);
-	__u64 rp __packed __aligned(4);
-	__u64 wp __packed __aligned(4);
+	__le32 reserved0;
+	__le32 reserved1;
+	__le32 reserved2;
+
+	__le64 rbase __packed __aligned(4);
+	__le64 rlen __packed __aligned(4);
+	__le64 rp __packed __aligned(4);
+	__le64 wp __packed __aligned(4);
 };
=20
 struct mhi_ctxt {
@@ -258,8 +258,8 @@ struct mhi_ctxt {
 };
=20
 struct mhi_tre {
-	u64 ptr;
-	u32 dword[2];
+	__le64 ptr;
+	__le32 dword[2];
 };
=20
 struct bhi_vec_entry {
@@ -277,57 +277,58 @@ enum mhi_cmd_type {
 /* No operation command */
 #define MHI_TRE_CMD_NOOP_PTR (0)
 #define MHI_TRE_CMD_NOOP_DWORD0 (0)
-#define MHI_TRE_CMD_NOOP_DWORD1 (MHI_CMD_NOP << 16)
+#define MHI_TRE_CMD_NOOP_DWORD1 (cpu_to_le32(MHI_CMD_NOP << 16))
=20
 /* Channel reset command */
 #define MHI_TRE_CMD_RESET_PTR (0)
 #define MHI_TRE_CMD_RESET_DWORD0 (0)
-#define MHI_TRE_CMD_RESET_DWORD1(chid) ((chid << 24) | \
-					(MHI_CMD_RESET_CHAN << 16))
+#define MHI_TRE_CMD_RESET_DWORD1(chid) (cpu_to_le32((chid << 24) | \
+					(MHI_CMD_RESET_CHAN << 16)))
=20
 /* Channel stop command */
 #define MHI_TRE_CMD_STOP_PTR (0)
 #define MHI_TRE_CMD_STOP_DWORD0 (0)
-#define MHI_TRE_CMD_STOP_DWORD1(chid) ((chid << 24) | \
-				       (MHI_CMD_STOP_CHAN << 16))
+#define MHI_TRE_CMD_STOP_DWORD1(chid) (cpu_to_le32((chid << 24) | \
+				       (MHI_CMD_STOP_CHAN << 16)))
=20
 /* Channel start command */
 #define MHI_TRE_CMD_START_PTR (0)
 #define MHI_TRE_CMD_START_DWORD0 (0)
-#define MHI_TRE_CMD_START_DWORD1(chid) ((chid << 24) | \
-					(MHI_CMD_START_CHAN << 16))
+#define MHI_TRE_CMD_START_DWORD1(chid) (cpu_to_le32((chid << 24) | \
+					(MHI_CMD_START_CHAN << 16)))
=20
-#define MHI_TRE_GET_CMD_CHID(tre) (((tre)->dword[1] >> 24) & 0xFF)
-#define MHI_TRE_GET_CMD_TYPE(tre) (((tre)->dword[1] >> 16) & 0xFF)
+#define MHI_TRE_GET_DWORD(tre, word) (le32_to_cpu((tre)->dword[(word)]))
+#define MHI_TRE_GET_CMD_CHID(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 24) & 0=
xFF)
+#define MHI_TRE_GET_CMD_TYPE(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 16) & 0=
xFF)
=20
 /* Event descriptor macros */
-#define MHI_TRE_EV_PTR(ptr) (ptr)
-#define MHI_TRE_EV_DWORD0(code, len) ((code << 24) | len)
-#define MHI_TRE_EV_DWORD1(chid, type) ((chid << 24) | (type << 16))
-#define MHI_TRE_GET_EV_PTR(tre) ((tre)->ptr)
-#define MHI_TRE_GET_EV_CODE(tre) (((tre)->dword[0] >> 24) & 0xFF)
-#define MHI_TRE_GET_EV_LEN(tre) ((tre)->dword[0] & 0xFFFF)
-#define MHI_TRE_GET_EV_CHID(tre) (((tre)->dword[1] >> 24) & 0xFF)
-#define MHI_TRE_GET_EV_TYPE(tre) (((tre)->dword[1] >> 16) & 0xFF)
-#define MHI_TRE_GET_EV_STATE(tre) (((tre)->dword[0] >> 24) & 0xFF)
-#define MHI_TRE_GET_EV_EXECENV(tre) (((tre)->dword[0] >> 24) & 0xFF)
-#define MHI_TRE_GET_EV_SEQ(tre) ((tre)->dword[0])
-#define MHI_TRE_GET_EV_TIME(tre) ((tre)->ptr)
-#define MHI_TRE_GET_EV_COOKIE(tre) lower_32_bits((tre)->ptr)
-#define MHI_TRE_GET_EV_VEID(tre) (((tre)->dword[0] >> 16) & 0xFF)
-#define MHI_TRE_GET_EV_LINKSPEED(tre) (((tre)->dword[1] >> 24) & 0xFF)
-#define MHI_TRE_GET_EV_LINKWIDTH(tre) ((tre)->dword[0] & 0xFF)
+#define MHI_TRE_EV_PTR(ptr) (cpu_to_le64(ptr))
+#define MHI_TRE_EV_DWORD0(code, len) (cpu_to_le32((code << 24) | len))
+#define MHI_TRE_EV_DWORD1(chid, type) (cpu_to_le32((chid << 24) | (type =
<< 16)))
+#define MHI_TRE_GET_EV_PTR(tre) (le64_to_cpu((tre)->ptr))
+#define MHI_TRE_GET_EV_CODE(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 24) & 0x=
FF)
+#define MHI_TRE_GET_EV_LEN(tre) (MHI_TRE_GET_DWORD(tre, 0) & 0xFFFF)
+#define MHI_TRE_GET_EV_CHID(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 24) & 0x=
FF)
+#define MHI_TRE_GET_EV_TYPE(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 16) & 0x=
FF)
+#define MHI_TRE_GET_EV_STATE(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 24) & 0=
xFF)
+#define MHI_TRE_GET_EV_EXECENV(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 24) &=
 0xFF)
+#define MHI_TRE_GET_EV_SEQ(tre) MHI_TRE_GET_DWORD(tre, 0)
+#define MHI_TRE_GET_EV_TIME(tre) (MHI_TRE_GET_EV_PTR(tre))
+#define MHI_TRE_GET_EV_COOKIE(tre) lower_32_bits(MHI_TRE_GET_EV_PTR(tre)=
)
+#define MHI_TRE_GET_EV_VEID(tre) ((MHI_TRE_GET_DWORD(tre, 0) >> 16) & 0x=
FF)
+#define MHI_TRE_GET_EV_LINKSPEED(tre) ((MHI_TRE_GET_DWORD(tre, 1) >> 24)=
 & 0xFF)
+#define MHI_TRE_GET_EV_LINKWIDTH(tre) (MHI_TRE_GET_DWORD(tre, 0) & 0xFF)
=20
 /* Transfer descriptor macros */
-#define MHI_TRE_DATA_PTR(ptr) (ptr)
-#define MHI_TRE_DATA_DWORD0(len) (len & MHI_MAX_MTU)
-#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) ((2 << 16) | (bei <<=
 10) \
-	| (ieot << 9) | (ieob << 8) | chain)
+#define MHI_TRE_DATA_PTR(ptr) (cpu_to_le64(ptr))
+#define MHI_TRE_DATA_DWORD0(len) (cpu_to_le32(len & MHI_MAX_MTU))
+#define MHI_TRE_DATA_DWORD1(bei, ieot, ieob, chain) (cpu_to_le32((2 << 1=
6) | (bei << 10) \
+	| (ieot << 9) | (ieob << 8) | chain))
=20
 /* RSC transfer descriptor macros */
-#define MHI_RSCTRE_DATA_PTR(ptr, len) (((u64)len << 48) | ptr)
-#define MHI_RSCTRE_DATA_DWORD0(cookie) (cookie)
-#define MHI_RSCTRE_DATA_DWORD1 (MHI_PKT_TYPE_COALESCING << 16)
+#define MHI_RSCTRE_DATA_PTR(ptr, len) (cpu_to_le64(((u64)len << 48) | pt=
r))
+#define MHI_RSCTRE_DATA_DWORD0(cookie) (cpu_to_le32(cookie))
+#define MHI_RSCTRE_DATA_DWORD1 (cpu_to_le32(MHI_PKT_TYPE_COALESCING << 1=
6))
=20
 enum mhi_pkt_type {
 	MHI_PKT_TYPE_INVALID =3D 0x0,
@@ -480,10 +481,10 @@ struct db_cfg {
 	bool db_mode;
 	u32 pollcfg;
 	enum mhi_db_brst_mode brstmode;
-	dma_addr_t db_val;
+	__le64 db_val;
 	void (*process_db)(struct mhi_controller *mhi_cntrl,
 			   struct db_cfg *db_cfg, void __iomem *io_addr,
-			   dma_addr_t db_val);
+			   __le64 db_val);
 };
=20
 struct mhi_pm_transitions {
@@ -499,7 +500,7 @@ struct state_transition {
 struct mhi_ring {
 	dma_addr_t dma_handle;
 	dma_addr_t iommu_base;
-	u64 *ctxt_wp; /* point to ctxt wp */
+	__le64 *ctxt_wp; /* point to ctxt wp */
 	void *pre_aligned;
 	void *base;
 	void *rp;
@@ -649,10 +650,10 @@ static inline void mhi_trigger_resume(struct mhi_co=
ntroller *mhi_cntrl)
=20
 /* Register access methods */
 void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db=
_cfg,
-		     void __iomem *db_addr, dma_addr_t db_val);
+		     void __iomem *db_addr, __le64 db_val);
 void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
 			     struct db_cfg *db_mode, void __iomem *db_addr,
-			     dma_addr_t db_val);
+			     __le64 db_val);
 int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 			      void __iomem *base, u32 offset, u32 *out);
 int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
@@ -667,7 +668,7 @@ void mhi_write_reg_field(struct mhi_controller *mhi_c=
ntrl, void __iomem *base,
 			 u32 offset, u32 mask, u32 shift, u32 val);
 void mhi_ring_er_db(struct mhi_event *mhi_event);
 void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_add=
r,
-		  dma_addr_t db_val);
+		  __le64 db_val);
 void mhi_ring_cmd_db(struct mhi_controller *mhi_cntrl, struct mhi_cmd *m=
hi_cmd);
 void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
 		      struct mhi_chan *mhi_chan);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 8ac73f9e92a6..a8c68220d764 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -82,16 +82,18 @@ void mhi_write_reg_field(struct mhi_controller *mhi_c=
ntrl, void __iomem *base,
 }
=20
 void mhi_write_db(struct mhi_controller *mhi_cntrl, void __iomem *db_add=
r,
-		  dma_addr_t db_val)
+		  __le64 db_val)
 {
-	mhi_write_reg(mhi_cntrl, db_addr, 4, upper_32_bits(db_val));
-	mhi_write_reg(mhi_cntrl, db_addr, 0, lower_32_bits(db_val));
+	dma_addr_t tmp =3D le64_to_cpu(db_val);
+
+	mhi_write_reg(mhi_cntrl, db_addr, 4, upper_32_bits(tmp));
+	mhi_write_reg(mhi_cntrl, db_addr, 0, lower_32_bits(tmp));
 }
=20
 void mhi_db_brstmode(struct mhi_controller *mhi_cntrl,
 		     struct db_cfg *db_cfg,
 		     void __iomem *db_addr,
-		     dma_addr_t db_val)
+		     __le64 db_val)
 {
 	if (db_cfg->db_mode) {
 		db_cfg->db_val =3D db_val;
@@ -103,7 +105,7 @@ void mhi_db_brstmode(struct mhi_controller *mhi_cntrl=
,
 void mhi_db_brstmode_disable(struct mhi_controller *mhi_cntrl,
 			     struct db_cfg *db_cfg,
 			     void __iomem *db_addr,
-			     dma_addr_t db_val)
+			     __le64 db_val)
 {
 	db_cfg->db_val =3D db_val;
 	mhi_write_db(mhi_cntrl, db_addr, db_val);
@@ -119,10 +121,10 @@ void mhi_ring_er_db(struct mhi_event *mhi_event)
=20
 void mhi_ring_cmd_db(struct mhi_controller *mhi_cntrl, struct mhi_cmd *m=
hi_cmd)
 {
-	dma_addr_t db;
+	__le64 db;
 	struct mhi_ring *ring =3D &mhi_cmd->ring;
=20
-	db =3D ring->iommu_base + (ring->wp - ring->base);
+	db =3D cpu_to_le64(ring->iommu_base + (ring->wp - ring->base));
 	*ring->ctxt_wp =3D db;
 	mhi_write_db(mhi_cntrl, ring->db_addr, db);
 }
@@ -131,9 +133,9 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntr=
l,
 		      struct mhi_chan *mhi_chan)
 {
 	struct mhi_ring *ring =3D &mhi_chan->tre_ring;
-	dma_addr_t db;
+	__le64 db;
=20
-	db =3D ring->iommu_base + (ring->wp - ring->base);
+	db =3D cpu_to_le64(ring->iommu_base + (ring->wp - ring->base));
=20
 	/*
 	 * Writes to the new ring element must be visible to the hardware
@@ -432,7 +434,7 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev=
)
 	struct mhi_event_ctxt *er_ctxt =3D
 		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
 	struct mhi_ring *ev_ring =3D &mhi_event->ring;
-	dma_addr_t ptr =3D er_ctxt->rp;
+	dma_addr_t ptr =3D le64_to_cpu(er_ctxt->rp);
 	void *dev_rp;
=20
 	if (!is_valid_ring_ptr(ev_ring, ptr)) {
@@ -537,14 +539,14 @@ static void mhi_recycle_ev_ring_element(struct mhi_=
controller *mhi_cntrl,
=20
 	/* Update the WP */
 	ring->wp +=3D ring->el_size;
-	ctxt_wp =3D *ring->ctxt_wp + ring->el_size;
+	ctxt_wp =3D le64_to_cpu(*ring->ctxt_wp) + ring->el_size;
=20
 	if (ring->wp >=3D (ring->base + ring->len)) {
 		ring->wp =3D ring->base;
 		ctxt_wp =3D ring->iommu_base;
 	}
=20
-	*ring->ctxt_wp =3D ctxt_wp;
+	*ring->ctxt_wp =3D cpu_to_le64(ctxt_wp);
=20
 	/* Update the RP */
 	ring->rp +=3D ring->el_size;
@@ -799,7 +801,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *m=
hi_cntrl,
 	struct device *dev =3D &mhi_cntrl->mhi_dev->dev;
 	u32 chan;
 	int count =3D 0;
-	dma_addr_t ptr =3D er_ctxt->rp;
+	dma_addr_t ptr =3D le64_to_cpu(er_ctxt->rp);
=20
 	/*
 	 * This is a quick check to avoid unnecessary event processing
@@ -938,7 +940,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *m=
hi_cntrl,
 		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
 		local_rp =3D ev_ring->rp;
=20
-		ptr =3D er_ctxt->rp;
+		ptr =3D le64_to_cpu(er_ctxt->rp);
 		if (!is_valid_ring_ptr(ev_ring, ptr)) {
 			dev_err(&mhi_cntrl->mhi_dev->dev,
 				"Event ring rp points outside of the event ring\n");
@@ -968,7 +970,7 @@ int mhi_process_data_event_ring(struct mhi_controller=
 *mhi_cntrl,
 	int count =3D 0;
 	u32 chan;
 	struct mhi_chan *mhi_chan;
-	dma_addr_t ptr =3D er_ctxt->rp;
+	dma_addr_t ptr =3D le64_to_cpu(er_ctxt->rp);
=20
 	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
 		return -EIO;
@@ -1009,7 +1011,7 @@ int mhi_process_data_event_ring(struct mhi_controll=
er *mhi_cntrl,
 		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
 		local_rp =3D ev_ring->rp;
=20
-		ptr =3D er_ctxt->rp;
+		ptr =3D le64_to_cpu(er_ctxt->rp);
 		if (!is_valid_ring_ptr(ev_ring, ptr)) {
 			dev_err(&mhi_cntrl->mhi_dev->dev,
 				"Event ring rp points outside of the event ring\n");
@@ -1531,7 +1533,7 @@ static void mhi_mark_stale_events(struct mhi_contro=
ller *mhi_cntrl,
 	/* mark all stale events related to channel as STALE event */
 	spin_lock_irqsave(&mhi_event->lock, flags);
=20
-	ptr =3D er_ctxt->rp;
+	ptr =3D le64_to_cpu(er_ctxt->rp);
 	if (!is_valid_ring_ptr(ev_ring, ptr)) {
 		dev_err(&mhi_cntrl->mhi_dev->dev,
 			"Event ring rp points outside of the event ring\n");
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index bbf6cd04861e..0faf173fb963 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -218,7 +218,7 @@ int mhi_ready_state_transition(struct mhi_controller =
*mhi_cntrl)
 			continue;
=20
 		ring->wp =3D ring->base + ring->len - ring->el_size;
-		*ring->ctxt_wp =3D ring->iommu_base + ring->len - ring->el_size;
+		*ring->ctxt_wp =3D cpu_to_le64(ring->iommu_base + ring->len - ring->el=
_size);
 		/* Update all cores */
 		smp_wmb();
=20
@@ -420,7 +420,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_=
controller *mhi_cntrl)
 			continue;
=20
 		ring->wp =3D ring->base + ring->len - ring->el_size;
-		*ring->ctxt_wp =3D ring->iommu_base + ring->len - ring->el_size;
+		*ring->ctxt_wp =3D cpu_to_le64(ring->iommu_base + ring->len - ring->el=
_size);
 		/* Update to all cores */
 		smp_wmb();
=20
@@ -986,7 +986,7 @@ static void mhi_assert_dev_wake(struct mhi_controller=
 *mhi_cntrl, bool force)
 		atomic_inc(&mhi_cntrl->dev_wake);
 		if (MHI_WAKE_DB_FORCE_SET_VALID(mhi_cntrl->pm_state) &&
 		    !mhi_cntrl->wake_set) {
-			mhi_write_db(mhi_cntrl, mhi_cntrl->wake_db, 1);
+			mhi_write_db(mhi_cntrl, mhi_cntrl->wake_db, cpu_to_le64(1));
 			mhi_cntrl->wake_set =3D true;
 		}
 		spin_unlock_irqrestore(&mhi_cntrl->wlock, flags);
@@ -1002,7 +1002,7 @@ static void mhi_assert_dev_wake(struct mhi_controll=
er *mhi_cntrl, bool force)
 		if ((atomic_inc_return(&mhi_cntrl->dev_wake) =3D=3D 1) &&
 		    MHI_WAKE_DB_SET_VALID(mhi_cntrl->pm_state) &&
 		    !mhi_cntrl->wake_set) {
-			mhi_write_db(mhi_cntrl, mhi_cntrl->wake_db, 1);
+			mhi_write_db(mhi_cntrl, mhi_cntrl->wake_db, cpu_to_le64(1));
 			mhi_cntrl->wake_set =3D true;
 		}
 		spin_unlock_irqrestore(&mhi_cntrl->wlock, flags);
--=20
2.32.0

