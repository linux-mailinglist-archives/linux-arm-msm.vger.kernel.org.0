Return-Path: <linux-arm-msm+bounces-58707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A08ABD651
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04DB117B8B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C0D2820D1;
	Tue, 20 May 2025 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mz2UvUl8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F521CC40;
	Tue, 20 May 2025 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739290; cv=none; b=e0+MpjQ9htNgJPqdW+eQaFJzKuQaq8cvz0QpJmz/YPVmJRB07hdVlflcJRG8xgnAv1fFmmnL4LCbcvU4MQrRJ+SkfZvLJOyJo8XHJ8166Q2Tnz0DEawEbqiDhB97Eo1Sy/j1zoJscAbMkJ1rYOYmz02YhZxU0MmaEDNCG2TTKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739290; c=relaxed/simple;
	bh=4tmWDYzvwj1y9lI2C+vGP8GIEw9zo2mq6d+/a/gWS+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oPUQq/70Gz84LUMU3uJ9GQDMQYNYZPT/yMGJFxz4HXNPTSaT/SLQk4ZsPL4v25+FxsNpRwDWAvtBGjrCqNz+gnvjjaaqhIDw/EoLUR+IGRdM5GN73GVEyhlyVSMBaS9sC0g13eYUqQuEjYwDaWPxtDw27wuqCGrHzWQJu66A+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mz2UvUl8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BDAC4CEF0;
	Tue, 20 May 2025 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747739290;
	bh=4tmWDYzvwj1y9lI2C+vGP8GIEw9zo2mq6d+/a/gWS+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mz2UvUl8hwY45sYLWcsd1nfOkmQ00ptodHBAHSKQf7/2hgHu+I7CP3ln+Z28Ckk1N
	 3pFIjQvVxHIYZ9PsrBuKQP73GOXQoDu9CQKP/fws3GLeLQNL26vB+DoSMTa+mYQC4E
	 bUzNrHGtE2JJhmAJzQdG2hhiKg2mY1cy/vktHx6dlfcVnlKz39VyOPxZ63dyESMcJJ
	 CmaZDwWPWUVJQ52Rg9Yl4RbnLf32vA1ok2H6pWBiycxF5EPB3XSeu3WW/I9nqmLduI
	 JYrEYASRDUypvpH07hg1qgUUo5cx/QOLZfv3FF7QGpqMpfqn8DNZVGdX3SzwBRO2nD
	 JOjcDFpc/PwVQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 May 2025 13:07:16 +0200
Subject: [PATCH RFT v4 11/14] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-topic-ubwc_central-v4-11-2a461d32234a@oss.qualcomm.com>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
In-Reply-To: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747739236; l=1051;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=mePTO5eShzpvP9SrgetoPs6IstbtUBqJ1f/YlpNYkRE=;
 b=pj+eCR0Bv1vvctSiINqmF37dsAz5nSPdwDZ/8fHKqbHc/ikYRsEUX4g6M8D2XoQikQ0A6rmoj
 7prJdtpg3SDAYUxcwiJS0+yPHImUjtCYFEsE6BhWr8rmSKeu2vDAW5q
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
swizzling) is what we want on this platform (and others with a UBWC
1.0 encoder).

Fix it to make mesa happy (the hardware doesn't care about the 2 higher
bits, as they weren't consumed on this platform).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 7d220259829f0e57268f30b323ae985cf44672f4..7002744631341796d08fa197efa2202b3018cc3e 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_3_0,
-	.ubwc_swizzle = 1,
+	.ubwc_swizzle = 7,
 	.highest_bank_bit = 14,
 };
 

-- 
2.49.0


