Return-Path: <linux-arm-msm+bounces-94388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL7FDBo3oWkbrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:18:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D201B31DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0AF53148808
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2053E8C47;
	Fri, 27 Feb 2026 06:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TUq8BI5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6glwckm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA95334C35
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772172965; cv=none; b=qTV9CvshlsYpvywlmJ/+NUspiwsKWB8nyfsLMqNK66c8TqGAXWEXvQkqm9Co1FwosDda1Hk9lCF8ph/GY3SxBhsWWkE1L+uXz7WoXIddipY+ZbwzrzENpK6EImKG/rbgGBKOQCNMOx/6TUgb+ueOiZDE82PD+et3QjgEH4gipGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772172965; c=relaxed/simple;
	bh=Eck/D6KmwOrBysTJIIaZmSoFBAq/RlW1moTUSu+Xl3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bd3xVZLliJOxQ5/Le2nCA4D2y//CCnSHKK7NB4q76IXuj5r7lxTi0HxmVCvPGsDdptl19vvnaeS9Ua+P/xjewLDdsXvFni5Hwb9GYQQTagJNQrrFbRblOixTI6H7AaOTPk99iY7d5gkGzAao9vESyb4TLyl0DD3k43cv+F9qBX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TUq8BI5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6glwckm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JxR73185280
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnpiwG0d//X
	/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=; b=TUq8BI5oP0uCUQMb/aMfSVM7/4U
	rLBldCkEcVQDLwjBG150mjFIK9jWCB/erR5vaw8IOVgeoEhTRLl6Utggp+ATllp3
	tGWIJl2Ct4zmU+TuPxbqRHbF3leCcIpUr5Lq+ReOxv5mXBm6qER7NIBBQ86BNfT1
	zFe+dYAIubWB8s1jLgiGCF7rD+P/RSgP204IJfRRwIXkrehHpBuA7QAvUrSgP0EV
	dINy9xWxlpKQoqzCaAu8UXCYu7C0wrZOXz14oGuL2py7XHMo26W3f6PDSoLNgcc7
	kcw9KVAgMIB5K3h3DY4zvX0qFcn5puFRmpBzCcy1lIL1RWy1M48oo5KDn9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjmp63hbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:16:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ad7e454f38so100212965ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772172961; x=1772777761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=L6glwckm7SPTRs2PuRdb2xvTV+MebXTvAbU8xmdjy1pFQWI83S1LwwhgEvykaPSGkX
         7TKCeOdqbuSVrANiOisRzduXRck0lE2B76PBy+qQVlg3ZWCFC05CToswMW2y5JsFQ5ir
         7zeUDGjiMTdsulH3OKBaLYTEOJtxC+bImFjYU8qiCvdJghZ37iqzoZ8G/Sh3bL++FNcg
         UBgeij6J6b9c2YGuHLrkvD8KcnCOchhgh9hp6PeaBaeDWGBYglwCCJHJCtvlwi3uR8Zt
         IWqZRtvzkYWSLlyzsdLHDPNF+yRghn7rDc6eyXV1jKFgATVZR6FsQtha5SPBsCqz5tJh
         JlBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772172961; x=1772777761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=sfO3xQNbxX/XFFD6mGzgmmcg1nWM3YXw/8l2/2t+a/9mgdcDXB/IsSo/HzYrEijsBp
         ZIx34wWq/xhlv+DrN64pZqU6sE7ISL/Q5+A6rTbnnNTmy0ZWEVNamP1lzq1L4DG+poZR
         0Qr60v3H7kUBuMzpQiUBS0I0YyLeaUHsgQ2LTRCTihG6zYgglKveLVebzxPPfWe8+zKt
         atqy1Ya0WOiTduNo4+VygYPwwNQB90S4uhXVqF8aj5I9nUelj4MQR89Lk3Ms81kqStBU
         IeVdyyl2DkmaibUx19n3jdHkXhhw9lFdKlYa8Zw2UlYA+1E1eL/TCI+pBBkGdJwnXTBz
         odyA==
X-Forwarded-Encrypted: i=1; AJvYcCXoHlYFmxzNx4BqwOntIoeVpp4s5c+twoT7FyoIauoX9LGH5QXDh2I9pY31C8eIoL9jHG0XyH7IKdp3eqbe@vger.kernel.org
X-Gm-Message-State: AOJu0YxR0yPTaBfLJhos4GaOUX/YW6znTrG+ZBfjdoLztyeO9quMqJCM
	Ke5zEOWrqeCqUHzyulTrgw/jUNZz3XKkCbYfxutA+QuNyTdKrIedqZn4GiBGycb7Ll9nc4Y5UkP
	ZbLtrBy9aV/ZWsNfTSy3SbvR0RLE7K0GYG4EkJKVBNgUC0PyOU3ZP3IQmjrdrkxEkHcu2
X-Gm-Gg: ATEYQzx3Zg4Prj1nsSpI5x9hvkVIj6RkgpAcGY90k+VfcSFEdACt+dtuUBbu+XFl706
	aEYSQZ8w0SYtmTJ1EHJOw1vemO2Qrny9bxnOj41L83aesZira/E/9h39GSMSwfgbLDlMAkoCvfD
	3DbppAEv8oZODgdZufOMVuPedAagSPyU9ndS8Bc9cawCgQWsz4hqVOI9Y3OAsaMaqOM0C13X0TT
	Qo92MXRxt2eWGAtUYSX5sqvSVHnS1e6hFFtanrM9lwM7tW7F4MnnbTp/zHB3Kvv5uW4k9g+9MZd
	PmTE8QU9IbPvWmRA0n6sZ60dwlNzVNvtLTMfe0ZT6bfNoQ1lpbSboQtfri0mZguvfVuk8/U4hq7
	q5d51cWgVgH3JEbrmDNenL7VQp86Tmbqsu4gsuOxkxb7qbooD79b2yPU=
X-Received: by 2002:a17:903:298b:b0:2aa:e34c:4c8c with SMTP id d9443c01a7336-2ae2e3f156amr15664585ad.20.1772172960830;
        Thu, 26 Feb 2026 22:16:00 -0800 (PST)
X-Received: by 2002:a17:903:298b:b0:2aa:e34c:4c8c with SMTP id d9443c01a7336-2ae2e3f156amr15664435ad.20.1772172960303;
        Thu, 26 Feb 2026 22:16:00 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:16:00 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
Subject: [PATCH v6 01/13] soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC path optional
Date: Fri, 27 Feb 2026 11:45:32 +0530
Message-Id: <20260227061544.1785978-2-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z8rEoK9ZKHGmjaU3rkxEbwrzSaQ_euAr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX9pq2OcFGlKd+
 5GweQBhmbYoK1V7Ts4PiVMxwLDoS/OLQW00xwe2ly3YU7JGo4V+VoKLAdaW2Pfv6k8O+dk5Ep2z
 CV2SKI6Q/jKm4m0RadFraOcPngkvakwQ5ssQhsPV9K46JVObnG4f6f2xsH9g/D5MhXZ3v+IQQ0m
 m4A/CWtTiUGzZ3GB/NOfbzsAvOKG+6InPeNhJBHAvHq01rgIRlrmFUKI26XckJz1DFmV/K/vLxv
 MtlOBTFk93gnYXhz5wfzkpmqOubGjtqxy+rYhcbYWbZC/AO0Nm9jI/DivSZbFOud3xMqPXbP28/
 GKNRBTi58hu5hETjUGIoQ4jOZK0+5iVoiooACeCEPh3ILAQvdSZxPAQ1/nhneC+fcpcDrX4l0h7
 ZtUZTcUoRO2A6vdXdCO0tAIQyrrdTtKHM3HWxvfQdu4tg2r1AJcyoLRAmrWsmDFV7wEzVVcpKWS
 a7xASpCM9+Lfuu5dpyg==
X-Authority-Analysis: v=2.4 cv=daaNHHXe c=1 sm=1 tr=0 ts=69a136a1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Wptve8LSCQjy2B8HgooA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Z8rEoK9ZKHGmjaU3rkxEbwrzSaQ_euAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94388-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87D201B31DF
X-Rspamd-Action: no action

The "qup-memory" interconnect path is optional and may not be defined
in all device trees. Unroll the loop-based ICC path initialization to
allow specific error handling for each path type.

The "qup-core" and "qup-config" paths remain mandatory and will fail
probe if missing, while "qup-memory" is now handled as optional and
skipped when not present in the device tree.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Updated commit text.
- Used local variable for more readable.
---
 drivers/soc/qcom/qcom-geni-se.c | 36 +++++++++++++++++----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index cd1779b6a91a..b6167b968ef6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -899,30 +899,32 @@ EXPORT_SYMBOL_GPL(geni_se_rx_dma_unprep);
 
 int geni_icc_get(struct geni_se *se, const char *icc_ddr)
 {
-	int i, err;
-	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
+	struct geni_icc_path *icc_paths = se->icc_paths;
 
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
-		if (!icc_names[i])
-			continue;
-
-		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
-		if (IS_ERR(se->icc_paths[i].path))
-			goto err;
+	icc_paths[GENI_TO_CORE].path = devm_of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(icc_paths[GENI_TO_CORE].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_CORE].path),
+				     "Failed to get 'qup-core' ICC path\n");
+
+	icc_paths[CPU_TO_GENI].path = devm_of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(icc_paths[CPU_TO_GENI].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[CPU_TO_GENI].path),
+				     "Failed to get 'qup-config' ICC path\n");
+
+	/* The DDR path is optional, depending on protocol and hw capabilities */
+	icc_paths[GENI_TO_DDR].path = devm_of_icc_get(se->dev, "qup-memory");
+	if (IS_ERR(icc_paths[GENI_TO_DDR].path)) {
+		if (PTR_ERR(icc_paths[GENI_TO_DDR].path) == -ENODATA)
+			icc_paths[GENI_TO_DDR].path = NULL;
+		else
+			return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_DDR].path),
+					     "Failed to get 'qup-memory' ICC path\n");
 	}
 
 	return 0;
-
-err:
-	err = PTR_ERR(se->icc_paths[i].path);
-	if (err != -EPROBE_DEFER)
-		dev_err_ratelimited(se->dev, "Failed to get ICC path '%s': %d\n",
-					icc_names[i], err);
-	return err;
-
 }
 EXPORT_SYMBOL_GPL(geni_icc_get);
 
-- 
2.34.1


