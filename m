Return-Path: <linux-arm-msm+bounces-78785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B6C09788
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D6634F8412
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC60305968;
	Sat, 25 Oct 2025 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iujTM3QP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A346030ACE8;
	Sat, 25 Oct 2025 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409001; cv=none; b=DGzLzlx2JIv9lz+pYxkRiIxASKNgJms7sOTXwo5drFOKqrklzodbuGBntYW4X73fDAC1s/uNBHkN8furzQn0WW7gDWvta0pAF/uN3v2U2MLKjsqGrE4asmRmZmBmqyawfUpqsEIOhC/SiYhr1md9Lc99ApWocZXe5WeoLbuChjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409001; c=relaxed/simple;
	bh=0DiN0DSS30aJOKfK0GaeAJCDUFPsH0AHzAp/5NqMP8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g9O1mj9vfaNfMyIQ2fuYpK+uSjGeje1prUQvnNkSWnBIOlPf1ANnP3irLgOipjArfawzpw0/YPy/A+Zz4arGHOmo9Wy5oReABeNzTjg5UtlQ5b2IZGLNCgDmxWmKjadLlvPjp93rHr3xrsyG6oRt+bHG/5545K3q/e64iTE4QlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iujTM3QP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6FDC4CEF5;
	Sat, 25 Oct 2025 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409001;
	bh=0DiN0DSS30aJOKfK0GaeAJCDUFPsH0AHzAp/5NqMP8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iujTM3QPzkS7WgjVo3gElK55HEO19K8NDNZKddEkb3cmhhnoMO/oI2ADblnkWGQZE
	 ZOpfTUZyc23VbIR69fa3IsPdGGJQECZFWCAyhNNwFWu8xOhIN0P0OWdtXe778bho2v
	 CGmxSDWxMmmuSjdJHpv36giKH+LksFIcDT7jrNqdSIhNTVULCZEl47Ci/H5sCnDrIR
	 +FUzkTU7JJzhb8O2bSwwNBFXBlE7HpqtoJyqAsyoTZQo38EeibnGbfbdJzmCotRkpK
	 Dx5yTRHyQfpGnP85QDGkXaaYC/Xvub5dVQJqPhG15M8Dxc8tf8rBWUXNf2plWwIrHo
	 hLZWn+BToUZTg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Palash Kambar <quic_pkambar@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] scsi: ufs: ufs-qcom: Align programming sequence of Shared ICE for UFS controller v5
Date: Sat, 25 Oct 2025 11:56:41 -0400
Message-ID: <20251025160905.3857885-170-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Palash Kambar <quic_pkambar@quicinc.com>

[ Upstream commit 3126b5fd02270380cce833d06f973a3ffb33a69b ]

Disabling the AES core in Shared ICE is not supported during power
collapse for UFS Host Controller v5.0, which may lead to data errors
after Hibern8 exit. To comply with hardware programming guidelines and
avoid this issue, issue a sync reset to ICE upon power collapse exit.

Hence follow below steps to reset the ICE upon exiting power collapse
and align with Hw programming guide.

a. Assert the ICE sync reset by setting both SYNC_RST_SEL and
   SYNC_RST_SW bits in UFS_MEM_ICE_CFG

b. Deassert the reset by clearing SYNC_RST_SW in  UFS_MEM_ICE_CFG

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Reasoning and code-specific analysis:
- Fixes real data errors: The commit addresses data corruption “after
  Hibern8 exit” on Qualcomm UFS Host Controller v5.0 when the Shared ICE
  (Inline Crypto Engine) AES core state isn’t supported across power
  collapse. This is a user-visible, serious bug that directly affects
  storage reliability.
- Small, localized change: The patch only touches the QCOM UFS variant
  and adds a precise reset sequence in the resume path, tightly scoped
  to the problematic hardware revision.

What changed
- New hardware register and bit definitions:
  - Adds `UFS_MEM_ICE_CFG` (0x2600) to the QCOM vendor register map:
    drivers/ufs/host/ufs-qcom.h:85
  - Adds ICE sync reset bit definitions local to the source:
    - `UFS_ICE_SYNC_RST_SEL` and `UFS_ICE_SYNC_RST_SW`:
      drivers/ufs/host/ufs-qcom.c:41-42
- Reset sequence on resume for UFS v5.0.0:
  - After enabling lane clocks (drivers/ufs/host/ufs-qcom.c:755-757), if
    the link is not active and the controller version is exactly 5.0.0,
    issue an ICE sync reset:
    - Assert reset by setting both `UFS_ICE_SYNC_RST_SEL |
      UFS_ICE_SYNC_RST_SW` into `UFS_MEM_ICE_CFG`: drivers/ufs/host/ufs-
      qcom.c:759-764
    - Read back, clear both bits, sleep 50–100 µs to allow flops to
      settle, write back, and read again: drivers/ufs/host/ufs-
      qcom.c:764-773
  - The gating condition confines the behavior to the exact affected
    hardware: `host->hw_ver.major == 5 && host->hw_ver.minor == 0 &&
    host->hw_ver.step == 0` and only when the link is not active:
    drivers/ufs/host/ufs-qcom.c:759-763
- Correct ordering with ICE reinit:
  - The reset happens before `ufs_qcom_ice_resume(host)`
    (drivers/ufs/host/ufs-qcom.c:776), and `ufs_qcom_ice_resume()` calls
    `qcom_ice_resume()` which reinitializes HWKM and waits for BIST
    (drivers/soc/qcom/ice.c:274-287). This ensures a clean reinit after
    the reset.

Why this is safe for stable
- Minimal risk, bounded scope:
  - The behavior only triggers for a specific hardware revision (v5.0.0)
    and only on a particular PM transition condition (link not active),
    minimizing regression risk to other platforms.
  - The register access is vendor-specific and does not affect other
    subsystems.
  - The added delay is tiny (50–100 µs), and the change is otherwise a
    single MMIO reset sequence.
- Clearly a bug fix, not a feature:
  - No new capabilities or architectural changes. It aligns with the
    hardware programming guide to prevent data errors.
- Maintains correct init sequence:
  - Reset is performed before ICE resume and HWKM init, ensuring keys
    and state are reprogrammed after reset. The resume path remains
    coherent.

Stable tree criteria
- Important bugfix: Prevents data corruption on affected hardware.
- Small and contained: Limited to `drivers/ufs/host/ufs-qcom.c` and
  `drivers/ufs/host/ufs-qcom.h`.
- No broad side effects: Strict hardware version gating with link state
  check.
- No API/ABI changes or architectural refactors.

Conclusion
- This is a strong backport candidate that fixes a real, user-impacting
  bug with minimal and well-scoped changes.

 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 9574fdc2bb0fd..3ea6b08d2b526 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -38,6 +38,9 @@
 #define DEEMPHASIS_3_5_dB	0x04
 #define NO_DEEMPHASIS		0x0
 
+#define UFS_ICE_SYNC_RST_SEL	BIT(3)
+#define UFS_ICE_SYNC_RST_SW	BIT(4)
+
 enum {
 	TSTBUS_UAWM,
 	TSTBUS_UARM,
@@ -751,11 +754,29 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	int err;
+	u32 reg_val;
 
 	err = ufs_qcom_enable_lane_clks(host);
 	if (err)
 		return err;
 
+	if ((!ufs_qcom_is_link_active(hba)) &&
+	    host->hw_ver.major == 5 &&
+	    host->hw_ver.minor == 0 &&
+	    host->hw_ver.step == 0) {
+		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW, UFS_MEM_ICE_CFG);
+		reg_val = ufshcd_readl(hba, UFS_MEM_ICE_CFG);
+		reg_val &= ~(UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW);
+		/*
+		 * HW documentation doesn't recommend any delay between the
+		 * reset set and clear. But we are enforcing an arbitrary delay
+		 * to give flops enough time to settle in.
+		 */
+		usleep_range(50, 100);
+		ufshcd_writel(hba, reg_val, UFS_MEM_ICE_CFG);
+		ufshcd_readl(hba, UFS_MEM_ICE_CFG);
+	}
+
 	return ufs_qcom_ice_resume(host);
 }
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index e0e129af7c16b..88e2f322d37d8 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -60,7 +60,7 @@ enum {
 	UFS_AH8_CFG				= 0xFC,
 
 	UFS_RD_REG_MCQ				= 0xD00,
-
+	UFS_MEM_ICE_CFG				= 0x2600,
 	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
 	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
 
-- 
2.51.0


