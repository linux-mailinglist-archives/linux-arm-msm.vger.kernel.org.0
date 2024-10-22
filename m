Return-Path: <linux-arm-msm+bounces-35384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EAC9A9F04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 273C4284284
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E89F19ABAA;
	Tue, 22 Oct 2024 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axzX5GmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537BD19A281;
	Tue, 22 Oct 2024 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590369; cv=none; b=I7EbZEO3IDNd6J9AfnX/Wk5uortDsmHZX5ODUU111wIHVxzN9Sh25AoWDNrhF3INKh1us7hYHL9k8QrNtGsuNVjcL/7DkZZsr4WnDHV1vlwMuAoEmWu0U9arwAIPYyzbp2ddOT8uXUch2HiDrj2ffRtQbAkokYoI4NqdLVOkhO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590369; c=relaxed/simple;
	bh=I3A80qnRg/24foK1MGb4E+l8Yi0cv2nSf3OCJrtqpF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T6ArPpDSQg2RjEu+w4PIPm58x2Z38pqt1pTJ7vzYcR3fslwP9InGtH7SW+PyhCTWUJILbbuiVRehcMJu+NY16t3wd4VUO27xNUdLZjaLV8ShwUUrTPYxfNltvOVkBRwwHpVHNsq8L5OsvQfHsK7OUUr4bDXtsn3MSe7Jpg6Xh6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axzX5GmI; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so2140313a12.0;
        Tue, 22 Oct 2024 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729590366; x=1730195166; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wa/NW0XNcXewHOtopIil9gZAv+Os9ZksCyFaYiqCPFY=;
        b=axzX5GmIKPwe3Dvoa/X5ZW2a1IrSbvBPWWCB28fUhHwne5TfH4G5drLa/F5vvDyDdD
         +J29P+qjeyDeIg/ijmbBHNUCOQJV1Bjjsm7BHm8XJGhM9PO36VTmQY2SRoveqQ96/V/l
         B4LhI6aD1c/nyvsxPNOthm45RK2qTGC+wRmWPdqRNvpwm9+aHWFxHpLC2BK4TU2aif9o
         SlGfOz+3/peRiYnMVpaDAYZ3H/UHy64FpaZlkaz3M0Oo1JnNLCd1nZb7iHbW8W3x1GFq
         aUqyDC/9KA4b5iwVdIRU908J6V5CdR6yBXA06yTCdEd6hS9wKrI3vOdfy5+AbrTN47rh
         JY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590366; x=1730195166;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wa/NW0XNcXewHOtopIil9gZAv+Os9ZksCyFaYiqCPFY=;
        b=LTYpQ16fiwS+q5ig3KB7hNtKzTvOTFz1L1XpcBfZcpsygyHir3DQTSIDK1gT0q39EE
         n2RhYc6usXeEXIKFA5p5VaHEWp0HaiWn4tBcHmphEgfno8SXIyOnsQOuRxgt5dS49/ha
         ZmeWv92bwxNMgiRcvGJyG+PJS9PB3EFR9OBhTzy5kcpDrX345ZhjgfKyuTKRYoFyqf7K
         8fv3nQbQJBetTmafue9L40QcvbL1UdEeZcahbE39G4wutQyUdPToBT8AUMRNkMnqa5+r
         ZVBnsYaYW992boXWWnVZc3emx5Z/sIFcnaXQvOSBI5lIXf95MytC2+gduuummSWvNSlK
         e+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUWDe6qVpag0X2F5YQPVNR0Ro02tL8dCoPOyG5bLuo9dEhS2N+rUj88oL3+LzhrlqQkr+FUrFqbFPV3@vger.kernel.org, AJvYcCW14WJnFYBn7c1BpL9AFkDSn3q9Te5mVHdvVE5MUCOD7swcwhNpDH3fQyHktqakdD+k/Ftzv9Xl@vger.kernel.org, AJvYcCWtIxDj8I18xvOr/H3x1W0VWbC2za5nAMsqp/+XtBvzgAUZ2STwonTIpqSdG0fPEu6F15eY6HJexKbo0UNj@vger.kernel.org, AJvYcCXqkES16LY99JGMZ38U3eFvQwIzI7/qN7D8y14jyBRBSArupmwSuBy8zyOIdx4Ps/SRgRPD+DZ6XqoOjY7P@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx+xixkWco1BcbYKkzS+v7iHbqN6z97NWqXpaNW85oU68kg4jc
	FMsjwTx+ksOfhpz6K16CZzRPcIlIdzCpAycRs26ZQAwLSo7l0wK2
X-Google-Smtp-Source: AGHT+IE/PSXZdNZMTrnXKZL8iufhEBfDpd9zUhvLIUHtTkYQu4PTZakuYQfLZ8wrjxiXwh0xPI1HRA==
X-Received: by 2002:a17:907:969e:b0:a99:fb10:1285 with SMTP id a640c23a62f3a-a9aa890ab77mr276977766b.20.1729590365280;
        Tue, 22 Oct 2024 02:46:05 -0700 (PDT)
Received: from redchief.local (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9a912edb6asm313237666b.49.2024.10.22.02.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:46:04 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 22 Oct 2024 11:45:56 +0200
Subject: [PATCH] clk: qcom: gcc-qcs404: fix initial rate of GPLL3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-fix-gcc-qcs404-gpll3-v1-1-c4d30d634d19@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFN0F2cC/yWMSwrDMAwFrxK0roplu6XkKiWLVJVdQb52Egohd
 69plvN4MztkSSoZ6mqHJJtmHYcCdKmAP+0QBfVdGKyxnowlDPrFyIwzZ288xqnrHAZH3rkbP4Q
 DFHVKUn7/7LM5Ocm8lvpyjvBqsyCPfa9LXW33K1lMTNAcxw+yY9yfkwAAAA==
X-Change-ID: 20241021-fix-gcc-qcs404-gpll3-f314335c8ecf
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

The comment before the config of the GPLL3 PLL says that the
PLL should run at 930 MHz. In contrary to this, calculating
the frequency from the current configuration values by using
19.2 MHz as input frequency defined in 'qcs404.dtsi', it gives
921.6 MHz:

  $ xo=19200000; l=48; alpha=0x0; alpha_hi=0x0
  $ echo "$xo * ($((l)) + $(((alpha_hi << 32 | alpha) >> 8)) / 2^32)" | bc -l
  921600000.00000000000000000000

Set 'alpha_hi' in the configuration to a value used in downstream
kernels [1][2] in order to get the correct output rate:

  $ xo=19200000; l=48; alpha=0x0; alpha_hi=0x70
  $ echo "$xo * ($((l)) + $(((alpha_hi << 32 | alpha) >> 8)) / 2^32)" | bc -l
  930000000.00000000000000000000

The change is based on static code analysis, compile tested only.

[1] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/kernel.lnx.5.4.r56-rel/drivers/clk/qcom/gcc-qcs404.c?ref_type=heads#L335
[2} https://git.codelinaro.org/clo/la/kernel/msm-5.15/-/blob/kernel.lnx.5.15.r49-rel/drivers/clk/qcom/gcc-qcs404.c?ref_type=heads#L127

Cc: stable@vger.kernel.org
Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Note: due to a bug in the clk_alpha_pll_configure() function, the following
patch is also needed in order for this fix to take effect:

https://lore.kernel.org/all/20241019-qcs615-mm-clockcontroller-v1-1-4cfb96d779ae@quicinc.com/
---
 drivers/clk/qcom/gcc-qcs404.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index c3cfd572e7c1e0a987519be2cb2050c9bc7992c7..5ca003c9bfba89bee2e626b3c35936452cc02765 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -131,6 +131,7 @@ static struct clk_alpha_pll gpll1_out_main = {
 /* 930MHz configuration */
 static const struct alpha_pll_config gpll3_config = {
 	.l = 48,
+	.alpha_hi = 0x70,
 	.alpha = 0x0,
 	.alpha_en_mask = BIT(24),
 	.post_div_mask = 0xf << 8,

---
base-commit: 03dc72319cee7d0dfefee9ae7041b67732f6b8cd
change-id: 20241021-fix-gcc-qcs404-gpll3-f314335c8ecf

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


