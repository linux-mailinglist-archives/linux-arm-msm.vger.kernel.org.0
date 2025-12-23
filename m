Return-Path: <linux-arm-msm+bounces-86320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF10CD8C10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE9E73029B68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB2134F253;
	Tue, 23 Dec 2025 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neYf11cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4HNAWKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D3F34F49F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484318; cv=none; b=hidrfmKdR/L97mld3ejLwvmEsDdsKYO7K2VULWgXwfeDuxsZ2oBgMjqcHo0wONWAS1iV8ieE7Q5OQjdgZTPEYNkNm9P51wBdVZizD+iiMcTVIxk30EXbDHTLLaKTj+z2oNH7bqGKQ1sX24iYQaIPmP4etsBglUHQUoarV9vHXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484318; c=relaxed/simple;
	bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DT/Z8K+vWxNg3P75Wvnqsa6aEcwj4KV4D4rjo/vkeGmqyEwomAZIgNQ3lcBY3bzwIAOuyhAt/SlBPwfZhB5THqhF7OE4LwhbNCRlwy6iKv24fUj6qIoX5Z3wv8AAeiI2JqO3RSX7NqF+SNEdOd5wQuZ8AFNAgQysQeYm3K5eO+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neYf11cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4HNAWKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4IdV71902603
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=; b=neYf11cpzXgmFemA
	i14grOLM9x9385mdH+Uh9QeT+MPfvyVfWpTuR+OhOefbLFoWd2Ccp2B3D3rQ6Sc/
	xMeEZE2k6ST0z38HZ8ODBIRROdM1dDtDH2ToaCMZFo7nJyCKfVqNaecIxiljVeVB
	fBEVb9TvjRrvD8Gj6RR7MtVIv0oQDUqsr2HNpiQFzL36Sg69HRt4qlumtNEXP+hI
	5J55+A1r4PqXc/XgTzc8QJ1PfI9XE76eKBGbwg5j4I42Ugp6a0TfgNUxf9ng9wU/
	Q/gsoLVSdDuJ387PbmOBIZfFuPiAepkAgadBDqhWMtE42A8yYi+keMNlCKjpEhOs
	NwK5/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jkmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee09693109so88914501cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484313; x=1767089113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=H4HNAWKSE+PGIq/GIVlAiroK/7lg6v6YpMyLKxzqLIlqPq4Wv0P/7dnC+ai854eD+E
         mB4XAd4IrQosUq1Z3zSUSgvSUxS9LjCaJSJ6stztPf7dCcjhpOlWkkPSUmhnuJsPMJkd
         pFy23ECrff6o9U5uqeQK4wSE8ISujxGJUuHw8ObXsE4xLS8dfjmhSLVM4kKRMpS/MPcS
         R+Styljsz7ynFuWn/5Jr8CPcf1Mu0xIwqpTxPG3CKEfeFLFi/pXI22mDJuRS2kiI4tTf
         F+2w4iqLOnn438gYW9xE20LCecz4jZ4+09SaSNhCnJJMahOxFsfOmdFKMuzKZpvHj/4A
         zIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484313; x=1767089113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=G5M8Q7rmRNeUzEyGPltTg3sIbxf1aJVIELoe3sllseiFATGRMdqCzHfX9B9G7S0w8N
         XNQid2a52MtTGQsNEf9xYwG5ihwe1ucquaB1f9PVQ9nWtM2BCbdtoblhsblEcK66Z6Vx
         38Kwk4YiCMwOQaWTKbPpIeeYss1Waz29F2Dg2z+v1HHICOXKIFe0+fNXayQzuTzhczsj
         48ZDm1VtcktNmTZHss0CaezujZhkOmqEX8NGGXCO0n9/c3qJjFrAYlNlKsACPgC6OIi+
         FgaOEaIEzqtykYavIK9lhFN2+y9/8GJPdoAgl4P8JuBCq9HJ06rNI/yeViSlijLIBxRQ
         Bw+g==
X-Forwarded-Encrypted: i=1; AJvYcCVS6hsE5AGPHrvExzbuBIpk/COh9R589CWSe3uDPpvbDmjfZ2xnKQUJURlgypaw9TVkFepYJ4D3ULps9ny6@vger.kernel.org
X-Gm-Message-State: AOJu0YxgZoDHYQG06l8TKwQPKH/WGH8S/neVtn1r6F1jwt9R3Ina3q8s
	XAkX9ZjnNbqMiC/x+Oy+BROOOcp92QOvO7bMoTBrBriUAwkUKwc0lu6e2LJdKMduyXjFHIIbyHk
	p/M5zmDjViySEXSXJ5yy8wPsW7iMrsaxHrD962OewvuMpd8wRTRLZb1hukCjzC2cO3FfS
X-Gm-Gg: AY/fxX7RIQbgn84uuw8LB0kCqY+z1mexd2jWuL8Fc7iESkscqdlFphXeGHqg0KqQbCK
	dquOeFxk/NR4AHtkmRYdTryHEcZ2lAf6Nq/E8bgP5Y1ZrliVLGYTe1H66q5eGSNF+FeFS8bi5mK
	eDaDu5/PMCKKjDi3Xeg51FmlmzST2WRlnw930pCZfEXlH57+gJ4Rx5SlmqJm/gKbmZXHgfbsnvi
	QbLFpShMOfRveZ6WDjy0GGQJtktPi7lUpYj6LPTRxttTBbbnY05cv4HCFpDU7QjpCliTkWmqQc8
	gnca2nLf7sGFivrSVSuB57mUvZGOpjbdkhUHssK+w///J2ApK/5o6qPpEwyzWgq5a3Zu6upzWhQ
	iw9+EFRuLjulmsYIpr8AzOnhc3+NALcy+dQVSLHc=
X-Received: by 2002:a05:622a:2b43:b0:4ee:14c3:4e65 with SMTP id d75a77b69052e-4f4abd0dc28mr219101101cf.29.1766484313505;
        Tue, 23 Dec 2025 02:05:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEV+mwTcQ3wuFKlGzRImOSBX3IU5W98ElI3KLK7HMccseahW4yo+ZXWeG07JWxNXrTGTWcIBw==
X-Received: by 2002:a05:622a:2b43:b0:4ee:14c3:4e65 with SMTP id d75a77b69052e-4f4abd0dc28mr219100631cf.29.1766484313078;
        Tue, 23 Dec 2025 02:05:13 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:46 +0100
Subject: [PATCH 08/12] i2c: mxs: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-8-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlDjj4ADx2Rb3xlfAMnQkHbo+sz4ovgjz28L
 EWnVXIoR26JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQwAKCRAFnS7L/zaE
 w7tMD/97LcD5KIQOMf+6WEJ+Lz4Y1Sw14f+up28X7B/gK/6aOiM843NZ/hmzVa9bU64MhKZOtBj
 Cj79x6oDhbT1wV5CJqYQfcYVaggsb9jL7HAJeRIwncgaat/UWFl89z7CgFlrkF8v61h8TIaHNHX
 GUOX1GeUxGIYLIUhSbr0QRtiV6I8Y5G7NJDpEaKMez/2WGcT7J3dNyrvJex27vt3odTYWAmh1Re
 bUw7Szu+9wntv0yye4mU5MvTAagH8Pylg8fuqmausU57fvsxHKxY7ek7SJp639qLc4V7va+dRTD
 92Im5KhbVTPWmFi+//r8mEVUUP3aw6uhqzNvYjQNmBbN6O2NsQ1vhRv0UscP5PFPpUozR8Fwr0A
 GG3km2mDfVX+8hHy5Z/wncWcHzIgzSIgQMl/3/kvDZHfUbj7WsjgORc9MBuA0tVLmquG3SsMKI1
 MBTSirX1b0D1OnJgWIwT7BczgYl1iGQex/916YxS79M44kbMtaUPiEs/owXZpbkaeRl8UR7x2vt
 kGAtUZZM/8umqo40ZDE7R/Htuoxp+ZnmnOnad7LAQni7+SPyaQtQekWYayRzl6qTl2bJ10NLg1h
 uxTPPwxTWHIo6DnUtqr0m1Pyc6annr8KyI3AFwgncoMmA+c2ebY8I2rh5rWMU6Yfrftzojk2Gxv
 8yvkPnkIMS093Rw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXznKa10nXZtww
 pCymsWTL4oAfnkAtvDQOXHjhTYkbHDFG3Ji3e3ERrT6N0vi20Pp/0lEAVHpHiUqyJdUyvrPL6AD
 +awDwmnGCi2X6GuB0fEEJX0lh1z4Zd8kjMDziTIpC6KD16n853T4OvAC1kLQvq4ykDczAkyIqzZ
 5LWJPPP5VhrDj09oHRqsf+IZwEc47GZUi183A8AKDWq9y9A2pMA9+zKeMAKAeRdEMgwu/A4WR77
 HWTwUf1XUAnHtpcFK9a0zo+tRId5AWes5KzNc+x/PFpzIk20I0S3/5rwVANa6QAjiJ3reAU493m
 j5pK/iuC5CAm//lvr3b7/Pso5tTtnJFrO8DcyROYPdzYmjr3wQ8GYoz01edjsAgh55SpIFwGWb6
 Q7gDV9ScZ/jFDZgfkO7lz5vaoBo9tZ/Ce6S9On6+9bj86DOr1+5cXSqerxCEENvJPuiz3xnzeLh
 weKpmqdHjfKzb+pCR/w==
X-Proofpoint-GUID: AWc7La-1K7fAByTKHwhnYQ4BCqyScjq9
X-Proofpoint-ORIG-GUID: AWc7La-1K7fAByTKHwhnYQ4BCqyScjq9
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a695a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZBRMoY1RY0NPWYz5CrkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35151bac8d4adb80abdbd29a62b95a..bfbd96ee2f483cd1dd872c3448eaa6a17940d70f 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -849,9 +849,9 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->algo = &mxs_i2c_algo;
 	adap->quirks = &mxs_i2c_quirks;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	adap->nr = pdev->id;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->of_node = pdev->dev.of_node;
 	i2c_set_adapdata(adap, i2c);
 	err = i2c_add_numbered_adapter(adap);
 	if (err) {

-- 
2.47.3


