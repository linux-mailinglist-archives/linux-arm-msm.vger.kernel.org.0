Return-Path: <linux-arm-msm+bounces-86313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A9ACD8C58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CB80303A8CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF78B34C808;
	Tue, 23 Dec 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDBc7Xm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJzQizCm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F934B196
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484302; cv=none; b=d/VDMGAfRJKm6RPHyTzKNhXngNwKfu/haC6q8JSOiabZk9Wb2Bhu9lx1oqmcxD8zx11kRSMYJONyuteBaHhwyMazFzpp37g3Sv7E1gvCBCn0WqySerZOoH9VOWFFXdmTTIT1y7nZx1YAacWS7mKwbVTkyPzhmLF3k+LlGbZP3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484302; c=relaxed/simple;
	bh=9DuIEZPwzTeoXCwAXaQfazb/wfAxmGqBk6OslVsEIUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEsQ7O9rtaNhqJAws0l3VjwUFEcZKIS0781Ecaoi50NMM/jQ1eztVUBqw+rAcxRZKy0lOvSoFtXUzyxi9nHl6VTTeUXdbANbAettSMfUFDoHL2QIUX6kkF5GeL+hbQV48FjU3YmGORLI3jTJZwZr01sIRJQiEB6/womQ/Td/hfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDBc7Xm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJzQizCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3kECi1356368
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1rCvMDpU1D1vLVr0ykDBOBuZXm8pHvfoFh0GPY6oas=; b=hDBc7Xm14WCUwBdX
	ydAdsZff03TWHngyey1Pu+2X9w8lpJQ8WXoXxsLDV/sWx/rCKolMlsPCE748pewD
	GkzPErUiE0tmavxvBgqF7VPF2/LxP76Me6aKTsKS7NQPWHCWhORnU+JRy7Z16cKO
	w4+gMmT/wURxKg4vtfIikrathOtNxtC0yX5z/Evrpl/1YUkPsB5+Ry16O1Cmde42
	xc9vzUQH045i377SX8iMrlQsnEtPCjTLqw8v1g6spo85v45kYIrFpnXTnCV5E+qr
	NqJRSRBtmLN/+FUQvQ8ixLHJpjzJg2TJ4ak2lHGUrdTNzRLZ689J5lMTcjh2vyjg
	0QxVDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2ssw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:04:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f4ab58098eso105479391cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484298; x=1767089098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1rCvMDpU1D1vLVr0ykDBOBuZXm8pHvfoFh0GPY6oas=;
        b=HJzQizCmyiPRwi0ANjEOuiuOGPRDyo2d2/ztZhn6Lzi2vysOwB32N9o67AaORbZm0L
         RqlqIaPNlcorxbzVOiZGGySqaUoUu+kC6vffbJ7AbZG0NRsOY2mD+bloXmiv5QGytzmT
         d3aIwUuGMdEtvwO0PaCHMcxC58nH91S/BlEGwV1J/HfAjvkWb1OK8MWx0BXK2SIWCDzC
         /P40zu7LySueqTjUKi37ppjRU5d/YX3c3EbG1sq7vM+fv7zaFoxGrpZECaO5i050dv5Q
         NMbFxnfhwwHeY6qRQ1dWJaxk1Cj2jgpPDJHs4dkAR7WlrIf2FLtAHO15bLItPOwkbC2d
         Z62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484298; x=1767089098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1rCvMDpU1D1vLVr0ykDBOBuZXm8pHvfoFh0GPY6oas=;
        b=ss57T+2P5TqzEGZ5KTJj1JARyFSTAMMkb0h12ptkfhD2Vxh5d3pr6tMJOYPN8Ky4YN
         UGEjTNTmMpCeEw5k2vVlNmW+aVFhjELKVCB25npYdMhX06RuFNjVH8k0HzCpCuXK7cqB
         X2ONTOy9UzeXEcd1neRVNe6weYUKfHG09V/rpbHoQ9yC4zfqPEJ22RQ2kWvTgMdqvVPu
         LGRd4stN8GJJk3lCtFo4eg0xqzZKWhZfZfLDBXS8u+KHUud1tj0DCZ2vwujuUr27TEQZ
         Gr/afi/gEqP0lap1/xDCY3lpP5x6MRsLyojfeI/2rJ//5JALojHgZTGpUabsOuct0VJH
         RrUg==
X-Forwarded-Encrypted: i=1; AJvYcCXbUoUaCyCu2gTjp/ku9EXzZxUhYu+B32zXjAjuvRmhR06/V1qbaS/jMsfniYhYBnSa7w7/bmhAk/00X2+d@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/1JinoKeKPORTlsZX0GsFs72OwaxTwnu4699hG9V8oHV4dNqe
	16K55ax0c6mhCkyzs8PO448zioCne58+AZJ6jSxAm/CXSf4LyRCVgTS32c/J96c48M6SkBjOFev
	x60J/EtNi2+HlcpzRm4U2eyao3vAaC7ktzISOaXDqIlg6ymseQLtnT4F9nR6NTf2QHR16
X-Gm-Gg: AY/fxX5pXPg3wctuELwXKl7ztlFza/YTkLcY+tS5m6Gmnzf5gYcJeYxXuvyFs+iMRJS
	RuM/RNFkaizRU6Luv0iThOOdk9xvQngbDA+TKks0BgyP3r5zSITAq2XLOLLwmymIfmUBS5nCIVc
	ozbjkM0AzvuZcb7fST36hhHFVQK4oX8uiFdD9bD8lcmbKNh+LoG+S9W1rFqFjIcBBj0VFYcl3a0
	Vg0CoO8+8vXI3SUmEvNNug0smj89z2APUvBkB0UEgGtjru7pL1oya0dtJc+VO31amXubZxa4bxA
	POTsJkC3SHHWT7O/NY6OoKU9E9MfgShRhjYAkEfIxeNBG79DLrCENQqKtYZA3ZT5HoZbN7xj9yg
	PBnqFkjLSx4HE4k/AlVN9wvwZB6m3prfiltTqQM4=
X-Received: by 2002:a05:622a:50d:b0:4f0:2afc:3b80 with SMTP id d75a77b69052e-4f4abd92eaamr181413651cf.56.1766484298470;
        Tue, 23 Dec 2025 02:04:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPyPkCI7wpeIXAWX4oTjp2cS/hulQz/NmX993pTR1thwF0IRRxKOlYnoldEaGrhaMGAtYLKw==
X-Received: by 2002:a05:622a:50d:b0:4f0:2afc:3b80 with SMTP id d75a77b69052e-4f4abd92eaamr181413191cf.56.1766484297752;
        Tue, 23 Dec 2025 02:04:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:39 +0100
Subject: [PATCH 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-1-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9DuIEZPwzTeoXCwAXaQfazb/wfAxmGqBk6OslVsEIUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk7zl30HWFdf5toH7ZGKXOD8CIyBlVApBySN
 IwaXVxofDGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppOwAKCRAFnS7L/zaE
 w3jMEACQwb8ZgE58DE3uw37UiRZwU/zhEQr9IPt83tPHLkgZTeqGX94iF4zPORHT1Sr6NycarTH
 GVHxF1XDkA0X6UnMa7Irhh1xeo/qFeqPke157JJl41OxB42h6ZeHStCofCqEkj4AlKSM2kDl/bF
 G1HXjnJ4IXxgAP3b7RzEiGinSsyZVdyG0CNKHWCbe+hdducCLVXpRx6nBhO5RpZGmlyca/6iBQo
 0miDWx0P4uwD90IWT97/l8TGMYnY6DyXRO7v4fRCTDmxeY8+797P6blElSuKf1KXLPLUPmnNoZW
 GxO+tpHCeutabKOcxnj0pASJ4GKqEHZIl2zFYTglOjkbQe5JsfbZiyOwdMNbBCrDlPU8SgGm/5m
 jLA03yUabJxHbPOqP84PoAtk7C7aYBw65DpZlloaVlGfKM0B6Shr7Qyyb4TR+Nnmypt9BnTcbLq
 Yvgb/jJWplS241rXMWFGIEo1P8zeNJGZIXMDaeZTWuDcnFI1gsK9EsXgdrf5EUERg/RLqZwD4ci
 byAseHFEQwGNSmVOdmnctOJwQLnfwDat/vfonNlqFxcjrSEH0qRpXao6xHBUvveYqJNBTBf4Qvk
 KHrDjxJXW6mFnMyC9z0wifTeZDxecTGHG5sQHGHGDGzdMQtsrwWyWvftqfdXiwqu/VpMOVwbSLN
 b+27NTk2zhOsLnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: krgQonR9e_WiTXeO5gJr--u7u0Wbp2e0
X-Proofpoint-ORIG-GUID: krgQonR9e_WiTXeO5gJr--u7u0Wbp2e0
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a694b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GqsknrqNkdw30Ab-NAsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXwOIWGPewQ2hU
 /hiE12U2Eya5gfl9M1gvjnwD6I7nKh1yBGBWOp6b0RFSruSQxVug3MiBTO5OLSNWCGRFvSz3TDp
 x+TE8CX42wzihJWJZ7nOuD/iTy7lsprZ3hjwz5xLW5voPCK6gST+vLpM8nDD43tTpuaneA2egTC
 ORa5R1/CWNmNC3nKz9gVqG/gVBBdg6AWojRnohlBCpX1Ojm1P9rC71XlWfqsZijEJxakxfKTnEk
 X1HjlVLIaRQoZmV7fizvLSPOzKjd/u7oAm2TxrVrzkkH9ezU9lLvy+wRH9zL7AC8VBxn/+3yadg
 q/3xLg7tZg2xieDpDGLmIUlU5VkbCtp++FVd0ZqggBlQ1LzBUJ4RU7Eboa4Tx8pccyeCaw1z7kk
 JgXv5ZKgAJBsjnkX/8ki72L3luqiLef7MOuBYeej39txIJy3VeXsHAdUxxPQ0Mo4K7ZUc+EmgDE
 UpbFvadMiaM8Fysu/BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

In order to stop i2c bus drivers from dereferencing the struct device
embedded in struct i2c_adapter, let's allow configuring the parent
device and OF-node of the adapter directly through dedicated fields.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/i2c-core-base.c | 5 +++++
 include/linux/i2c.h         | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae7e9c8b65a65c415f5a42f0eb0e7a4ff3e86dce..732828e63730bb773b77ab59362bad8697a1ebde 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1561,6 +1561,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	adap->dev.type = &i2c_adapter_type;
 	device_initialize(&adap->dev);
 
+	if (!adap->dev.parent)
+		adap->dev.parent = adap->parent;
+	if (!adap->dev.of_node)
+		adap->dev.of_node = adap->of_node;
+
 	/*
 	 * This adapter can be used as a parent immediately after device_add(),
 	 * setup runtime-pm (especially ignore-children) before hand.
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..72677f29aff161530bc3c497d1e07144a44eb9e4 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -761,6 +761,10 @@ struct i2c_adapter {
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
 
+	/* Device configuration. */
+	struct device *parent;
+	struct device_node *of_node;
+
 	struct dentry *debugfs;
 
 	/* 7bit address space */

-- 
2.47.3


