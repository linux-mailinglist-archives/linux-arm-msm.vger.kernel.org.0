Return-Path: <linux-arm-msm+bounces-57749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C7EAB5C63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 20:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDE83865E7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 18:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB5C2BFC6D;
	Tue, 13 May 2025 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8Y5tElc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1478E2BF967
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161546; cv=none; b=njimK2MeHyQFBvRpGZWPmxcbnM5yDs+NgPGe7vMXOqMugt+Ggwakx8DRzrJggNEk2wYniXQPTyT4E56F6ImxW45x/NkcD/+NtwQ7oW7BYzDA10qnD6mTEoJPDO+KNu2dpcvLtgwGBQHRql1nA5HnpttqnfZobxT+O047OUdWHLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161546; c=relaxed/simple;
	bh=T2RIv4LadExb2Reg9DuIE9o1rh9NeDHCv+KFAtqIUWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eoU1CM3yVGtzbWXp/vc+QBJ3AJjMRar+kUUIoTM9BoTEU/vu+vl39n6FLvVf+RjnapLiZkbaUnfMxvIEK4cU6pv0NkXtVA5kl0RIm9CMr3l8d3G5ZUjPpSRTB5+y8BnH/1dQyTJxARzUxLUqAECLE4Ds61jnGkhwHLsPl7Px9/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8Y5tElc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIRv0N029493
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 18:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nTC2gb9r2yWGJZtRgDhjlFghIYXR6WJTyRfEKQtEklI=; b=E8Y5tElc56TLjOKu
	qTtWweQtCiJzstYdDUp5cmFDq/4Ti/8W0ae5bGitkSpx2t2TTCQDPYjIX5tdFRiS
	0i5VI8b+bikU9EQ0Bq5wcVBJ3FxhxNz80aRK67mZG8xeaEjcBypkOBAZrnajypVa
	YEis14G5RAZQiW5wO2fxroVFiIQhhoLoS/LGmPs4qWJnUtYHW69Dlo5WQqM1I2Wx
	qph+G7uCiJkI5QjJfqYSRZ3loJZcuGavI7xaUGFqGC1tjKq8cH4BN/yX8pfZyoyf
	LOMlrRV23ma72G5qOU8jFJHuDR22qCEhE/sWQ8GgDor4fIgo1nHgChdiP22GpEf3
	onFIFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcng13p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 18:39:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c92425a8b1so31127485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 11:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161542; x=1747766342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTC2gb9r2yWGJZtRgDhjlFghIYXR6WJTyRfEKQtEklI=;
        b=GF/C6Jt2ozZIRCfknN2u7N8sLJ0fPI5C/L5it9fIlKT15m7vjB2poWvlCk0waWcG11
         zoBaUVxybPrbL67np7XbQRnAnkbsEA+tebA758VpDjeERPzJL9V2EZt0zP5pinDPV2CA
         iHtAPUXHT04CEVDPxUnghI0fL1pRgZrrS/xD/f58adDFvbafNqj9RJYyIpPkkOHpltqA
         SYfwE2RkL1YsuWJ79rjkWh9hfEhrrehpvpt6vVM5rRFspGV81iR+gZk3RpENKWP3dxz1
         yKutG3IAWWgLsvpiFHV/QIgnYER5wzr5Ob7yI5Yc5QJy8ozJ77VkVaPBGooKGbA+7ucr
         bcmg==
X-Gm-Message-State: AOJu0YxAtCg1SdKKK/BJE080dYWglBQpdf5auNjx6TQEGhPJa5pBPQ7W
	+g8N/EOYyaDtydAO+DfVcfroomTfC/2J3ozuNvXOFSHpHGvjn8cOtD/W+5s2KOi1ehIol1HyDRQ
	LB+EdknuJLZ6Z59uq5+T0Dil1YoEEb0tRj7pkMgamsZBKpUMbSrHlhoQX3a1YvGrh
X-Gm-Gg: ASbGncuE4xT2CAoDFFkO0lR92Pk3PKFGrkizEkAIiwSixnXWkQdIt19k2PdXUzy2DBx
	KT/MKlGVcDdxBhBrQYLC6jRIEa0AO/EwiQjbZLwKvnBvheNMC6cuMrGIfHc7i/atr0yPjX0/rJG
	Hg9fTSYHYk2DBmf68gDgFuQ0hvYExguNmsg/P1MzQNCokTdLntfzwqDxin3cEOwuqkP2hPH5nEO
	I5oRqj7wPj0yg5jmMECf2WA1KAmIz8G1rmEnzgWnBNcFXvdZqNV5rPDqcQijcBl1TkIOmFerAXS
	Gcf7p4Wo4phUOw5gECr3GOjr4wQWbmhlWezNno8BLlb0X7BQfnB5qwapX2h39jdIg/rsggLj4jX
	fHQhHcaRS3rA0o/RpJUzW90kA
X-Received: by 2002:a05:620a:6015:b0:7c9:5ee5:719 with SMTP id af79cd13be357-7cd1de91286mr794025885a.15.1747161541829;
        Tue, 13 May 2025 11:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmCoDhYSwUsS+pdhyEeiatm58QEOYzVcT7tHbJZhLrZOzYGJFpqAXBxnTxOmdX4dgGgNMDyQ==
X-Received: by 2002:a05:620a:6015:b0:7c9:5ee5:719 with SMTP id af79cd13be357-7cd1de91286mr794020685a.15.1747161541302;
        Tue, 13 May 2025 11:39:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33c12b7sm17383921fa.50.2025.05.13.11.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:39:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 May 2025 21:38:57 +0300
Subject: [PATCH v2 1/3] gpiolib: don't crash on enabling GPIO HOG pins
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3328;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T2RIv4LadExb2Reg9DuIE9o1rh9NeDHCv+KFAtqIUWE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4byxEMCX9x27VXk8j7ou321yPvSx7vfF0/7+D54ogZLT
 /RyzYc9nYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYyMFXHAxtq4u4lbjfzXMN
 z9nIuaK286j9x89bj25ie2kx//OBlC3s0WnflBtS2qfyO7S6HdvjUGNXXdHeILWho62rPWhvT+i
 pc6v8J5wzW2M8l92we/6lxuwW5+ynp/+brz/JsqQkcmPYmsSkDeIXi6Tms1n0z1Y7db/o2l+v1y
 pnKx4KbFx+SHsX/9QNZ6q1XFaf69Hf6tXYq+vg9iXueXV9gEPQ7Ql67fWmk81zH2fyq1V9lDCZs
 3yObafKHZua62brjX9cEfXZ4qZck+f3zyfGN/X0qrBfvH710vPTZM5VMHRkqSasvDxRxLDhaIKg
 J7/29Wk8dztN/Z2cF12KbjT8KpPmJOdzNm9jd01vxpxpAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yn-PcvWEfq3COVXMznAq4qFaoXqg0kue
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=682391c6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=F7q04jUIKJRoJ265B_sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: yn-PcvWEfq3COVXMznAq4qFaoXqg0kue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3NyBTYWx0ZWRfX9LCuRCjnmtJV
 2Ou9ZaI/lps8lSe278dBQHCDFz9nVXwg4md3nWTkkQDLpFNr0K0xb8psV/gSwquJ8+y2kfGWCnA
 WHiB7sCh5mk+F2NmWEH9EH3sfE5v0DnjmNLbfpchS4MqrA787s4CT9qG97sQWiDi0cBNOHBz2S/
 x/uE7igYvZ0tT45vhbw+az60TvViJze3KwPpszfSvMTXqPMyS8C9L0K0lCBxb1cOt9wjBWW4ho+
 PpgqIHexgyLEnhyfaE4rZbxzKjXLSTv6gvnqCIS5XMQqlXoPxNNhxUH42G7ckRRHpsnRhPmRySP
 B2GFOQ1SGGqMyM2XjWWmWtJc9He4P5ys9nmfjW2AS0XlxGal+IH+Zw6S1iOtM665iark/giSx5s
 cw7yTsQDdRr2lHVkIQvwRBTFHE7SNvkcAnuPas/Hgcw5/RmW60uKJcmglmnvL51nuZ3WByt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505130177

On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
valid_mask from direct assignments") gpiochip_line_is_valid() uses
gc->gpiodev, which is NULL when GPIO hog pins are being processed.
Thus after this commit using GPIO hogs causes the following crash. In
order to fix this, verify that gc->gpiodev is not NULL.

Note: it is not possible to reorder calls (e.g. by calling
msm_gpio_init() before pinctrl registration or by splitting
pinctrl_register() into _and_init() and pinctrl_enable() and calling the
latter function after msm_gpio_init()) because GPIO chip registration
would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
registration.

pc : gpiochip_line_is_valid+0x4/0x28
lr : msm_pinmux_request+0x24/0x40
sp : ffff8000808eb870
x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
Call trace:
 gpiochip_line_is_valid+0x4/0x28 (P)
 pin_request+0x208/0x2c0
 pinmux_enable_setting+0xa0/0x2e0
 pinctrl_commit_state+0x150/0x26c
 pinctrl_enable+0x6c/0x2a4
 pinctrl_register+0x3c/0xb0
 devm_pinctrl_register+0x58/0xa0
 msm_pinctrl_probe+0x2a8/0x584
 sdm845_pinctrl_probe+0x20/0x88
 platform_probe+0x68/0xc0
 really_probe+0xbc/0x298
 __driver_probe_device+0x78/0x12c
 driver_probe_device+0x3c/0x160
 __device_attach_driver+0xb8/0x138
 bus_for_each_drv+0x84/0xe0
 __device_attach+0x9c/0x188
 device_initial_probe+0x14/0x20
 bus_probe_device+0xac/0xb0
 deferred_probe_work_func+0x8c/0xc8
 process_one_work+0x208/0x5e8
 worker_thread+0x1b4/0x35c
 kthread+0x144/0x220
 ret_from_fork+0x10/0x20
Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)

Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
Reported-by: Doug Anderson <dianders@chromium.org>
Closes: https://lore.kernel.org/r/CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com
Tested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c787c9310e85af4c22ffc9bb8e791931fd056c89..250d47f77e2bc678b83f51958ca1bcc4db42928f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -784,6 +784,12 @@ EXPORT_SYMBOL_GPL(gpiochip_query_valid_mask);
 bool gpiochip_line_is_valid(const struct gpio_chip *gc,
 				unsigned int offset)
 {
+	/*
+	 * hog pins are requested before registering GPIO chip
+	 */
+	if (!gc->gpiodev)
+		return true;
+
 	/* No mask means all valid */
 	if (likely(!gc->gpiodev->valid_mask))
 		return true;

-- 
2.39.5


