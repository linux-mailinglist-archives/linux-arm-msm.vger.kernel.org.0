Return-Path: <linux-arm-msm+bounces-86321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4241BCD8E32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40DAD30ACA43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D648350D41;
	Tue, 23 Dec 2025 10:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGIB3qS7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TraxNKjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8C34F48C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484320; cv=none; b=ePA/eWvYNWL16kIPlVgKoHWhbNkDrerxQnE5Lm3nveAKAJsh1AYIJjHUcnQvWj24XV3h6r+tyDMoWUNa1qD6Tf4s0b+n3F+kApu57atxKwoqAvsheU4k3uPkzxHSuon+A5DyOBRBRez/awFGrzWlLA8QAaK7n7pCwAmhYm5tsEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484320; c=relaxed/simple;
	bh=Hn56O8bTHxBZpZANJMtUhif0GfjpIzDlLGeElyxRGYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTjWm4E5+mS9TFOFNc7JlU4H6ERZIZ8aYzIuh9gtOJR0AEWftYJa159ECXyuWAVDNvGeLrtKvD2tVwSnDZ9q5keZGAtk7kfqTSW0RpfyGVPYOsaQ/Xg//89YOcJFqQ3x0MrXgZVMEM8kCbQ2/592VMKRgFGIqMLAE3/8g5iWQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGIB3qS7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TraxNKjt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3JiKh1356371
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=; b=iGIB3qS7dSECCUqt
	rRX1LfzE2d0la0bNk0rToXOs3e3Gv0qhPk29Rkc2QGMA6PAO6mWcVZhD8Bus6rSI
	PkPaqcHxi9jtgy30yPqRAq64jGIdcN2fYOQE1DAthEo06mB8tS2e9cdVZ96bhL54
	gRtViJeHKYVW7EWHwte9wwSf0MJQnl1ggBp22KA6FMNSi/I8NrFSURE5bkCmqs7J
	nFLKM3MGssGoxny7Bvh37xqc3XxXmxPvVhPlbbvbGc2bcLqTqWT5/f0ssQD0b+kd
	IwXk8iXSCm4zRCZKBvaeGBlq3RdvS4fQbJDa2p11rZZ8D+CsaYKP39CAQrGKWZRa
	jNso4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2sv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0995fa85so136747721cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484315; x=1767089115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=;
        b=TraxNKjtFKDZmphF20afYP3IHSp52gvs+y0Xe0H6dM2SVxUg/XxZWsanqujrDxFswq
         gcfRefoBDgyAiZjdeOzL4WEIVuAFpqJ5gX1bcTOvxNrjFkTbO9WgOq0+NGQFiymtquAn
         +nbLSpvO8paZ41HejsEi+0uwU+ybOvwZUzqc3TD78/WRDa4pjzKwR6tq7wiLh1k29WGJ
         DxqhTF1Wxg3l/lR3oaO4qylJ9jdy8xS8q59aO1S3HcfrtKLQ6gwEapqEjr/hwm7xs3Wr
         S/8V4jzbNo582ut3GhN8GnAwZnXcxnkc43x8EjgXnWCQ914Qy9gdnaH1uqdxfvmmTzO+
         n6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484315; x=1767089115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=;
        b=MNVyaikqTOqQAzdthsrbXHwOHZ3iZptr22NWGISDfdN+PazgwxJJyd4DH8c1Sx01H4
         oIK6lRJ/pAzwD9jNP4zGq2RcOTyaNQ0a5JsqzUNY1DEOEVcJI+idhWp0u0LFPNMIisQq
         hmlDhsLDK6MiiCnIpdb7NRqBDyKX4HaaCblqYyn4FTGEMG4FapoTK1RXITMMZgwWg834
         bNr/4gSUAoK4Q77FbbjO9mCTvJ8WuRQFhKcE1xsTrEjPqio4LsPA+xT7NnzYcKaod0AL
         oc5472UPZql5oFEDUSonuL590P8xP4LTm2osbAO2vlFumYnFofEKq3iSTCb0q2aS9pKV
         Ri/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwVHiwVtIueoh2VfdQHNPvwamWPeclIGMo8ET9JlOClJxIaK0otp187ZXeqYh4tulZ3w96HRpTeomYWlmd@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCqVwyNVAXHPvutTsYchItlhIli1SaCf0GN1g0NYoH1TUADHM
	e6JYmtl7HkgLVquBWO52iw3gZ/ZuS987nxHTAdvI7FrBZmBKe64j2aKnNcz4aJwn9jwFxh7J0RI
	pHz2EXCFw8B+rDrurjUYDKOWOTMVXbw9u/taBWUrdppjzZe9LCGBHk59PvmtAfb0TpBOT
X-Gm-Gg: AY/fxX6Rhn48j2pBaLygtzUbuMHFfo3IMjqGJxvcl4t1M65ng/F+bgQhnkooexcjaho
	7tNZfp0KhvNPVrdJVSxClz8r41OaWDVq0aWkZHgl4lydIV368o91BnAqvMDLiDM4EzEsmRpy2go
	4TVO0rGl4ZQVMhJtfSLQLJfe2Fd1jr4WwZaH8DTN/50uucdsxBts705rjnXr9hVfGW89v2v9NwA
	nCxcw3wcBdqb7wOcbs2FtiD3dgOpAEJsykrCflgG+H1VHNxhhHYCcylbAjItm+YARLf6BKI23xP
	Qr1xVOMpMoGBhNcb9Xpcu+VEyom5gD0Af+lGqi62S/GLLkAvtmSJnQ6DBtE68EQxjDcaQ+BG7N9
	sC9+c1gA2Uz7tgAYAkD9H2Q5e39cdFMYZw87TsZ4=
X-Received: by 2002:a05:622a:189f:b0:4ee:1727:10bb with SMTP id d75a77b69052e-4f4abdabfecmr190558461cf.73.1766484315408;
        Tue, 23 Dec 2025 02:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8GFjIDyZbV8dD+DOpfR7IwmmqBYzqzpg5/tGrJ+xeBvGOlCT2lgXxHluQ0kpESiPf9OHVqg==
X-Received: by 2002:a05:622a:189f:b0:4ee:1727:10bb with SMTP id d75a77b69052e-4f4abdabfecmr190557921cf.73.1766484314941;
        Tue, 23 Dec 2025 02:05:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:47 +0100
Subject: [PATCH 09/12] i2c: highlander: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-9-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hn56O8bTHxBZpZANJMtUhif0GfjpIzDlLGeElyxRGYo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlDcbNHO2WZVBDO1Am5CGHZOGZZ04kK7h44x
 fnmwHjn4CWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQwAKCRAFnS7L/zaE
 w3QlEACj1xDOHhY3eNrCu3TniQ9GS0TsDrnZfFcJrr8u4bxRJpu6VcxD08eM8OBO4Ug+7i84qo9
 BvDqKBjwKXpBj8blAuHGXRmXAcqzmrCNxg/ii/1HIyigtO9N1Y7fM1Ou3a8zbT8tfsQcCsV6pnm
 JtUCun3fF95ul0gI4i2EJrtTaqLxB4sAuTuXwlPciqZlXGIRQiWLv8WY4HKYt/AUAFzEY56AAue
 wP8U8FRRWmOBuNvTcO/mSq20JuN5gHsti3JIEoLyu/Uo7Nk/wohdiFz38jjG0dyNUu7ifh2Cnch
 wajM2vL90AgjmkCV5fHff0FNWP3hoe2SjF4ut5hu1viWIuM5eJsfVKvMTawVWr+CCOTw7O3s03k
 Zp4YFrGo3Dp3jrRV3Yf0zKnaFZhvl39mLC+mCrfwL6rL8//wGxdaIphusT5BxLi4pNlYZ8/R0+1
 WDqd5qLanx6mnRfWY2jI5/uGYt9exaTUuHVB7HeQwy6180t2p5CRx4bcQ8vpHBfLB4YAMMpBMYI
 xR+ljQvylhCu+jITmxdWdtK7nsV1gEGJeVqqv7lqky7RKeH0e5fl5De6j41DpKxWybAsZhVhvz6
 y//a2jtc+o0fFk6CRWgPL5sDKYlu6kfSzozfHjLcnqPYuAlLeaI9MqAuKKd9wfwfL1fI1ZWrwme
 djbFc6cRrEAvhIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: W2ActMEW5R07pab3IgnpJG1DTrwBJ9TP
X-Proofpoint-ORIG-GUID: W2ActMEW5R07pab3IgnpJG1DTrwBJ9TP
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a695c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/LhCHQU0uCZ7
 4QLhbtZdLjDom17nFRvoiqJ/CSA9wcPHCEcrW+5q9IVSoPIU4F2FHTqDWcNOcK00HlbBKPstqnB
 1z23b12T4JWSFkreDi7yn1byOXhv+80SSrIIdbFGJ7ZKNpE6AhJSc5kAyecRP96cff2lg5n4KWr
 ghmCB3itYSrrJU+G6kH5SZOvqlcvgg3gySrt1588A46yTyy31wrHa+tPy1BhhMMgqMEYlhyApyD
 K+92STlS90N2irdQESc50l/uxVdeO7GtLDzbKS3pQ/0ehF9FqZfpSOHsB9HoWGlhqEZv2Tg6KnS
 65X1zHK7u480T9mYSS13jXlPnCckdQh+Jp/uFKFsUoABBF3ytiUpy3yALRUo2pVBhi0+baCqahX
 zesxvhx1Zjdqfvfz5ijuJGsdwvzgeVo3Eh1ASxdW4BRO0y3ziOicKNsSUcaHvIihAsChLC/s2bj
 w0pC8R4+LL5kb2NETYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index 78c5845e0877ae3e2ad1dcef052cdef021372e12..8aa2baf96c266edeb67d1da123e314e57831e0f8 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -404,7 +404,7 @@ static int highlander_i2c_probe(struct platform_device *pdev)
 	adap->class = I2C_CLASS_HWMON;
 	strscpy(adap->name, "HL FPGA I2C adapter", sizeof(adap->name));
 	adap->algo = &highlander_i2c_algo;
-	adap->dev.parent = &pdev->dev;
+	adap->parent = &pdev->dev;
 	adap->nr = pdev->id;
 
 	/*

-- 
2.47.3


