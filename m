Return-Path: <linux-arm-msm+bounces-86322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F1CD8C3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F235830687E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435BD352F88;
	Tue, 23 Dec 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pogOhgER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJUDV1Ug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD0350A3C
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484325; cv=none; b=u5LxJjwnupvXGhvVvM/AcgryysJVyeTiea+xcCswVdJdpH++Mib7e1jv4zIOOrCED82PrbabShlkvLNXx6nvyrp+L31CivV4ng+4U3ziDfVVo4oMO4bOU17L2qwuz7EaFQiRVZPKvB5XZUfYEzJ2hA32l4MUBbP+JPuJR8MEZ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484325; c=relaxed/simple;
	bh=Kz3aoETjpXt/sy8S8XSk2Nfc0c3D2LQVFEQrK7qt+cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjGY7Fk4DfIBX2FGqQOINUdY6kQvYMnsFFA1zbzav0GKYMnNS0mkuehXVj0TmNMcwsYt0QJEskMQzqGmcfM5Wy1LpsYSLbXaYLZo49kW63CCukR/BCq60/wLkS/1S8d7NmrQMvllUNTVqKtBnCYQpAHgNiAUO/hK8Y4AhPu5aWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pogOhgER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJUDV1Ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN61dF41901863
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=; b=pogOhgERHMDldIkt
	KAhEDEfQfbo81lUnBP+JJYv8YmjHQu3ASOwq2syL8tnlHWf7xY9raerg4qvN4u7F
	jQ+T2OdTMuBz2x1zwTmH6s2kkqeXBbPOBTpQ+nOlPO4h+WI6sX0xZIA/AuW9uYNe
	opgpoMkieUBaqC4C5mFZ/m7bXyfvWemFDSKuB/XXQLoEqeCBLJagRawrw1rAtZFA
	GxaQF43ozUaaNu3B3GOrAS4DKMVArFToRyCwSd+Fcr6w31/mIPZg2koLqiuDxo1a
	xJ1P13mIpYGxOwoYb01spCOOFodqQZJgL3wKDyEMZrc4Gk2bdVwYIb3rpeBzy9W1
	akZw0g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jknu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4a5dba954so113269131cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484319; x=1767089119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=UJUDV1UgBQ5isXWEmji8DCloAcT4TYIQXweUFQlIzp1i9aO3FsaPwjh/QUMQLjgLzF
         rDbqZCQ683J7PZCgeXE/DaOxwz36fppVtGTO/kJOO470Wy4Y18mO0rVvgEjXiYpqHWxe
         bRb/SzVVboBQTARqVdhmm/dEST4pRAsfd37HAfLWJIWCcEGirOHNyMvfve9hMKGgAp7r
         /kPOKuciUgSsy7ymVyMt0TOj6KtU9A6i9p5OJo7NzVLFqlFQD6kuUiA6Fdqjq5dZCXAW
         Kfu/RjVV91yvIptWK4iTDudNbPDq3qKIwbkw74FEIgbuO7Gw3ghuA7UkMGNrHC9LLLSR
         QoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484319; x=1767089119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=TEaptnFjpJJwoRPbeE4VqYknEsJXtmDu786n6WAurFGSSC9kSUN2J514ZStaV344+h
         rafw1BaGfX84OHT4XtAumPB1o8Y/r8pvgio18VacVJSOZpTkeEaqshae4c4hDmrFjQ8+
         vfpj4ngkKO6BGnZhyVfj1QOYFAEPfzDhxuK5HUMqqRpNfzyZP8N5EuwenS1ORNWf42UV
         BMVzZy/m9i51xV0SiMWiO7eNkkVsc7MShw1NX6sHWPKXI73In4s1wfS0cH2hkpOxS44l
         4vBlI796/j+/y5tXRd0TzGmLjIPz0qcm6BYGeO77gFxy9GBBYyPXeHhzWc3ihm+cd/+p
         QksQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaKEdRCfqp0euC1+DFXCMxZ7fPhYmzPD7r7nMrJrgTwSfjY3bT1poWd2020nN/n1BszZarH13eytA39ert@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhQ2t5R9Tjkxb5mLrciDfsMJV0B1y+AvmfoqAIjG4uuiupvQE
	U7vttQXilT/dH3kAdCAcn/zfpjieSsz6ILor9e+VZubCL1whd0tuoH3V+i1mxKqRsTWsLDUThHY
	ZLY7efn10mHLBDyR/wszyd/qdAGsrO5L5KtRUSSITDKXtIdqn0e5cPP3e4/iKIRWv/RNS
X-Gm-Gg: AY/fxX4d9mx493g2ajNm79P8MWwtcaSh8QXx8gRBqAJRpPa0l8WwVyQxJDhc9J9tvx3
	tHwOYFOqsOQc07TDzfn711OSPIPAKTkGkeaAdRDhyjPAoJohXC3LEbaKZV2lzdbRmnZgvpNJwai
	/4CgHcYs1ndxUkEZxVpHf3p6EWV6t4qZEefIFDiD3JrG37hSC3qCt3XJcpqENntDWx0rHORnSP9
	Afb+7AIAL9GqBeibIjZqGpy3yNnqXLCmktLzqH20MdXba9aC7k1XJ/27jUxNsVD82073zVk3tKS
	G8Ff604UZ6H3WKqtjKGS/G/o89oLQGOfaa/7jx6b6Xnv6V00Gu1dZMbBsHMiscl2Qd/KxRw4DwR
	DzWXPXGcAaMyOqucz3QslyHo5FU7eOyBBD1Gp/54=
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198669101cf.35.1766484319022;
        Tue, 23 Dec 2025 02:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IForFIDGNQ9njlDz41j98dh92a2O0U2qbhfYixKg3bKX3y+MnR1F9NI8gPqNhBANugj/T2Qbg==
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198668581cf.35.1766484318613;
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:49 +0100
Subject: [PATCH 11/12] i2c: nomadik: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kz3aoETjpXt/sy8S8XSk2Nfc0c3D2LQVFEQrK7qt+cA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEH8yQsYMAv6ooCMosuFd7IzlZjLcxciyOf
 UQM5iCbkxyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 wwKlD/9mCvI2m04rBS/yTO76hF7LJmURZqComcwLRaJTxRw5Kj2GccDWLLba9W/EeWkgaY878dh
 mlgpACmVVjIj/prfsLX7VwnEpPwe4rki5hI3MGdAWPuOBB38zZjTUzpYhocg1jLTgeQGLQxmD2q
 CV4Uj9tLsSN03FmctRiu++tKRNFBOXMsa9K2Z3RAKe13mQwAxnJ5+8Z8HSgmA/JwZZqx1jRM8Qn
 bkWBgiK3t8ow0wq/mNyfLGgDNJc62hmdViGPZLJu412tx2uphiRhRTDobCLSQ9SZcJl5pGKTGYQ
 mHi80IJwOzRfDVKh+DstwfULzzMx4mgWRYr2BY+ktS3eabzeXRUE9aOQTJXFHqfqWILuhuWh/Tk
 PKLcv6/sCH659tOUBfTrwdR85pZbH1LWlXu6e0T7R3wv0TShScYr0aKotIF1j566ak4aqWasiT+
 sC4scVMWKAN4xMEFEaCIRB8Evbqcmd828SbMITuSWbD36vA727i1aE0Oy3V+4yX2Pe3jshJeQEe
 seOtLCdT9PrqO+tbQNx7JsOdrkZk54nPY6VxGMS+AUwQVbaFwbQR/kFLjgPXNFXdtEF0gTLW+fq
 0IaCwqUzHvnG6VJ1Gjbu8FYvHGsSYI0nbDwBTZkeLnbv6lKgiBUMxVS7r3oojb1ZN3OvLhNfYZs
 l4zyIT96c4hbKgA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX07kUeINAxQSa
 Oa78OKiEcmz/aOtu2oa34RfrkcGBUsiPJvnKb54+AoIMho739qxB0RoO3BRcXN0RgHjQVspbVld
 f3hRKpn314bilqFfueyiqnTGJ6GLpx6bMN2KrONujeDrIbt6ZiGbFyV5z76q0+uWVvAzNqYXG4J
 etyqig+gavXlmzRSpJH3gsQSbxbuzQNPoILDtbl8mJdCAAYHV4BumbwY4bUMTwzK8kEyNJGYGWE
 VkbXzgiXVzF3/VyYNDGIKpzMt+FUxu5XIYvC553Q4ZUtP7gwpRUt57BBmK7rS6L6NgOs2Z7n/Mc
 tBROOPUhjw5IPmkbrBruZIEfGQE+3d7iZTba2P3sJlOrfGh5F6K5LuFoa/F6FuRVSkCsKXFD256
 4D3ciIjCCw0EKPujVlR4Sh4oK9hUeJ2W/5UjEdX/wlBE6/8Gyzz5PRoNNG7qBYDcudb/meE4w4f
 RCSjZs8PzIypmFkpHeg==
X-Proofpoint-GUID: Lo9iv9xKypGT_dgFDWM__8Y57arCUXEq
X-Proofpoint-ORIG-GUID: Lo9iv9xKypGT_dgFDWM__8Y57arCUXEq
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a695f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIHrhau139UvCPJ7cvIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
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
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 19b648fc094d9748a0cce4e35f350da35ee25505..133ce90941ed596ba2e6dc2d9b368cebe7ace3a3 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1147,8 +1147,8 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	init_hw(priv);
 
 	adap = &priv->adap;
-	adap->dev.of_node = np;
-	adap->dev.parent = dev;
+	adap->of_node = np;
+	adap->parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;

-- 
2.47.3


