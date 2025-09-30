Return-Path: <linux-arm-msm+bounces-75613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3200BAE5F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 20:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B2461887051
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 18:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12CFE2773DC;
	Tue, 30 Sep 2025 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZzDaXOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47071C68F;
	Tue, 30 Sep 2025 18:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759258579; cv=none; b=pU44lGRaqp1hNzGtJUXs6Flkz4xJK153kogcdUrEDUEKZ5QgvRQIQ3x1Utku5XntEB0+EknD4wFh+58RYBn8Gucyw7pCVNn7auaNDxm9Lv+QerWJDuSX0u9fo7pLejHsnTJXuF+sygda6OHTVqdNiyLTduclBrlrBkT5JoBtIHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759258579; c=relaxed/simple;
	bh=mUeekxKtedoNsLVnVlVq/6yyrmeXlspfpWHsLGKYkqY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BEE1JbVMHZJou000Moib63u+0iMfaQFjfLS8OWIs9YiAaoR11zgLe2lCKwPeIlvZFeQNzciHwW4Ud7p00nHzHexYZpeigZ1ZxOTDeypRvB8gQFbi01ykAGGxQf6JydjaYqSVrUP4B7ZAKO7oCB7Ta0xhukhRkTStZPbpinZ7JRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZzDaXOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447CDC4CEF0;
	Tue, 30 Sep 2025 18:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759258578;
	bh=mUeekxKtedoNsLVnVlVq/6yyrmeXlspfpWHsLGKYkqY=;
	h=From:Subject:Date:To:Cc:From;
	b=rZzDaXOzbHNbpyMZOrZ3a50lBYjap1fHj48+WcXVpvrqQkbmVApY90C3GnFqCmJjd
	 Yab7InJTIRlLKRD77xzu5T+cjbI863lerCmC4GjkAXdR9ySQVR0BTrBflS8DhrPH5Y
	 ildLTGL5r+VW2ZeaAG3bVrMm7SJ54uDBVFOQVywRxpQ2RZGE3DKOOGIB5abh9VO6YQ
	 Q8hY6OdtgUcV0rIqrNB2tMJC9ncHhI/Xzi11n9wdirKEd7d28Uvs5LvxUu9NKEQ5cb
	 za+Jfshhs740F++nBvIo07q6KR7rk30OorJ29gFMFGFqJzKxuh9RL6+3bTLVkmS5jK
	 uNLxurwh+zecg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] Kconfig fixes for QCOM clk drivers when targeting
 ARCH=arm
Date: Tue, 30 Sep 2025 11:56:07 -0700
Message-Id: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMcn3GgC/x2MQQqAIBAAvxJ7bkGTgvpKdIh1s6XSUogg/HvSc
 RhmXkgchRMM1QuRb0kSfAFdV0Dr7B2j2MLQqKZVvVFI+4YXhQM3Cn4Rh4s8nHCOB5pOa8ukDBm
 GMjgj/7L045TzBw79W/FsAAAA
X-Change-ID: 20250930-clk-qcom-kconfig-fixes-arm-3611dec03c3e
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=593; i=nathan@kernel.org;
 h=from:subject:message-id; bh=mUeekxKtedoNsLVnVlVq/6yyrmeXlspfpWHsLGKYkqY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBl31M/fa45WsApTfx8sOO2+Y+XLg/mrj8hN3JG8+erih
 HzBxF7OjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRn9MYGW5zu688wLF5r/sE
 FbNFf7nuLdy0+tZNZf8ZTPdEHzv8FWlmZNji8skhg7FTaOKTO49ZLV9u/WbS/HX23lMiz9QS7Df
 /PMANAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi all,

This series resolves two new Kconfig warnings that I see in my test
framework from an ARM configuration getting bumped to 6.17 and enabling
these configurations in the process.

---
Nathan Chancellor (2):
      clk: qcom: Fix SM_VIDEOCC_6350 dependencies
      clk: qcom: Fix dependencies of QCS_{DISP,GPU,VIDEO}CC_615

 drivers/clk/qcom/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)
---
base-commit: 30bf3ec8cb6b2d2e2f8715388395cbd27cbe4fc9
change-id: 20250930-clk-qcom-kconfig-fixes-arm-3611dec03c3e

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


