Return-Path: <linux-arm-msm+bounces-78783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD931C09384
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 856821C23969
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FA6301022;
	Sat, 25 Oct 2025 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATPLP2ia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BE27280E;
	Sat, 25 Oct 2025 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408646; cv=none; b=XOk/3nHSllSknhS6CdB0lDtGaek0sHqCeZ4wJsmx6sgs7gOkr1xg6w0LxBmNng1tFJsE97hodJmI4A1Am+VbUp18sJK76+pUxJycRKS4HkZwQe1rmdx4Svjh8Lx+lp/88mQZhd7+H9gbbFIWqABfWU2PIlRMBL4PY2oD1hs13ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408646; c=relaxed/simple;
	bh=Vx7I584o4VZRioawcIh4LGiXCbJ4/nJrnpjZePfmpcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QCZgarajLjxtdikF/d4vC2eUPyPtVz6l1NdBDjqUF+QJqBRqw+bioqwIp4gZt4hSU5gnvOdm1PPUsvMeAoAhw32L9DudqOkdGVVE/sx2Zgo+nssT3rtZQfh7XYCi56xux2a1vxlmfwXE4DI5vB5cjKXo0zpPqC6hnGXvnyd4coo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATPLP2ia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED529C4CEFF;
	Sat, 25 Oct 2025 16:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408645;
	bh=Vx7I584o4VZRioawcIh4LGiXCbJ4/nJrnpjZePfmpcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATPLP2iaegTEbL3Vh+qlTQqJ+LkWNs7XyRBzrdsl0g2gqh6m5YJj2sq7g+T+eyHZC
	 Yj9Wb0iGgtbajw30e3q7ow0BNdhI1kooGWqx4mK+hGr9nOdQ0iX1RsY2XCfVFeO4uY
	 fiC0HTbuZKDmqvTIdk0RyvgRmIyEIMw9EmjzqcZA6K0Uj9Hcu5RWAYMOvldCniqit+
	 4u/qxI+0hY4BD+3Fkjq/B4aqRz6f0CaAEyH5uCQdmP2OQDrquqLbWu5Vs5vsnzwVSX
	 8B4LGlUsrkH6EFEHuO67PeVim+yLLZ/gK0ljkm3nNGpGqMnjBQ7XNV9VhKkO/kr9OB
	 eEb1g/Yk4VtzQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Palash Kambar <quic_pkambar@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] scsi: ufs: ufs-qcom: Disable lane clocks during phy hibern8
Date: Sat, 25 Oct 2025 11:54:22 -0400
Message-ID: <20251025160905.3857885-31-sashal@kernel.org>
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

[ Upstream commit c1553fc105dff28f79bef90fab207235f5f2d977 ]

Currently, the UFS lane clocks remain enabled even after the link enters
the Hibern8 state and are only disabled during runtime/system
suspend.This patch modifies the behavior to disable the lane clocks
during ufs_qcom_setup_clocks(), which is invoked shortly after the link
enters Hibern8 via gate work.

While hibern8_notify() offers immediate control, toggling clocks on
every transition isn't ideal due to varied contexts like clock scaling.
Since setup_clocks() manages PHY/controller resources and is invoked
soon after Hibern8 entry, it serves as a central and stable point for
clock gating.

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Message-ID: <20250909055149.2068737-1-quic_pkambar@quicinc.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – the change fixes a real power-management bug with minimal, well-
scoped risk.

- `drivers/ufs/host/ufs-qcom.c:1226` now shuts the lane clocks off when
  `ufshcd_setup_clocks(hba, false)` runs while the link is in Hibern8.
  Without this, the lane clocks stayed on after the gate work forced
  Hibern8 (see `drivers/ufs/core/ufshcd.c:2038-2054`), so clock gating
  never delivered the expected idle power savings—lane clocks previously
  only dropped during the much rarer runtime/system suspend path
  (`drivers/ufs/host/ufs-qcom.c:739`).
- `drivers/ufs/host/ufs-qcom.c:1192-1200` symmetrically re-enable the
  lane clocks before the controller leaves Hibern8, so existing
  resume/ungate flows remain intact. The helper already handles errors
  in the same way other call sites (e.g., resume) do, so the added
  `dev_err(...)` path doesn’t introduce new behavior beyond propagating
  a genuine enabling failure.
- The patch touches only the Qualcomm variant, relies on helpers already
  present in stable branches (older trees use the per-lane helpers but
  the hook points are identical), and doesn’t alter any interfaces or
  broader subsystem behavior. Backporting just requires adding the same
  on/off checks in the older `ufs_qcom_setup_clocks()` body.

Given that it restores the intended low-power behavior for idle gating
on Qualcomm UFS hosts and stays tightly contained, it’s a good candidate
for stable. Suggested follow-up after backport: exercise runtime PM or
idle-gating tests to confirm the link enters/leaves Hibern8 cleanly.

 drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3ea6b08d2b526..2b6eb377eec07 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1183,6 +1183,13 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 	case PRE_CHANGE:
 		if (on) {
 			ufs_qcom_icc_update_bw(host);
+			if (ufs_qcom_is_link_hibern8(hba)) {
+				err = ufs_qcom_enable_lane_clks(host);
+				if (err) {
+					dev_err(hba->dev, "enable lane clks failed, ret=%d\n", err);
+					return err;
+				}
+			}
 		} else {
 			if (!ufs_qcom_is_link_active(hba)) {
 				/* disable device ref_clk */
@@ -1208,6 +1215,9 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
 			if (ufshcd_is_hs_mode(&hba->pwr_info))
 				ufs_qcom_dev_ref_clk_ctrl(host, true);
 		} else {
+			if (ufs_qcom_is_link_hibern8(hba))
+				ufs_qcom_disable_lane_clks(host);
+
 			ufs_qcom_icc_set_bw(host, ufs_qcom_bw_table[MODE_MIN][0][0].mem_bw,
 					    ufs_qcom_bw_table[MODE_MIN][0][0].cfg_bw);
 		}
-- 
2.51.0


