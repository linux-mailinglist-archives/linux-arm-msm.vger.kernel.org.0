Return-Path: <linux-arm-msm+bounces-92092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CN9G+4ohmmSKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:46:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A4A101563
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8946B302D32F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 17:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37270423175;
	Fri,  6 Feb 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHEAzNIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acEcr2x1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BCC38F92C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399774; cv=none; b=OGRvSct726xlKGuOVVzl+/gmN0Yml7+4KBHOLNGSKJFxugXf6LFD32KDTFASqV4+5cUST7yf96dSS0rY2CRmJjBbUTE4tNNx3UeWL9XgwIJSa1xCZldf9a/+duOxOdPC4v8OQLtwhv9vZo7OaC6xq1AQyhFu2J8FBdRiBIEBFkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399774; c=relaxed/simple;
	bh=BbBD5tNkBQrd31zYVx7NjYHcGjoQsLjnUX+bRHK0MRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qhJmmQZ6iTHxZfk7c4d5Yc2TudSbvi/RE+03sQkYJwlQITvjrfCYkkE6oP1LU/+XYtW+LuCum3wyn0JE49xi2j9Lz1Fe6xqpG9RdoqyzAdNDAnf4R3OXKRWPS0peOzdOA4SmfkeHNMWsRyMjXt7xx31oL8sXMhalJKrRDHf0H04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHEAzNIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acEcr2x1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616FieCO2489949
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 17:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2xdIWjPvFPu
	WeaF1ghJotVpCXxOBg3ohkTZp+i91ty8=; b=oHEAzNIXXfYjfDDZC5U+wj2rtj8
	FxziysDKKFears/mcM2gzH2YRQ27n/JjVN7irbCH7emZh+Pz5D3FJY7FxkjfAvI4
	UplIwCvJMyis1f2++BPtzApetx2P7i1RGPEjYV1e9a9k6su1Nnzmyvg60I9oTTUe
	aq058mqVpooKCFST6lD+5dB/mjVVqr2bH+dd+cbQcLpcjbrgDn46capIT6MHYbeO
	Z3yUuqBX2FNkz69E7qQdl+OhqUeEIi73RzsDyYmXFdVHZK++4PEL+qRDFvycyVlT
	1TUV3O8+I2Jt9fLMoB0Wza4ogkLMlGS1q9yeg0AE5ppxBkMEf+hyys7TB7g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c9c1rsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 17:42:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c636238ec57so1515256a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770399772; x=1771004572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xdIWjPvFPuWeaF1ghJotVpCXxOBg3ohkTZp+i91ty8=;
        b=acEcr2x1ofCvwftyacNsPPt0SAgFIAU6LfpTYytkD7OboMIZiZW+dhc9P/91Pfogn4
         P803X6fMGWRHvWRAfcwlkIIJhW0qSynphBTMWgt39vewkIpbaG90VEtLkk+uBQKOFDUG
         eK9KoCTpdpyY/Mn74+EdighDHm/Xfi6I72zU9pUIwhnOamEtLwmVOCeetBp1pUNQ2Usl
         /bwmcEvCaZ7w8fYu7OCRtyzNAqcuFdyxN7iVkOEBwigtbM2FQKUDSxwRYa2sn38iOHc2
         6a+/TJtpVh23lhZkIRVqtfb/epv8SxICoDTg9v1x9cF6jU42a5TcNcBcyDGppXRH+MoI
         CiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399772; x=1771004572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xdIWjPvFPuWeaF1ghJotVpCXxOBg3ohkTZp+i91ty8=;
        b=qWiLgK4ChGpAfeSsjMr1J3T8v2/XdfyTVe/eOATXrkeB8qXDvQZe0pSKk49i9IP+5j
         3tnuH36tH7rgbfRFTSI1Xk0pdvmVoTkhLKkovPNkPkZr5LS4hBjbABvcCG5b48mHo7fa
         yOxHinEz3sDZWeHZQUulLD9EMbk+3D7RsNx3iJ4JK6CoD/FhDJVyXxqwgBc2fhiDqKT/
         I9j+l5a/aNoqEp9QmDfp+lmOiCAaVmmgpRoaadcO63GFc5NnenYBMPHceltMaRudJ2Vg
         v3sRBqRu+iYIgJwtIzSe3g6g5GXqEVMn70SJ5DhKf6Kn3WwmXUCn9iVclvrxtugAuye5
         /fhw==
X-Forwarded-Encrypted: i=1; AJvYcCUgmGJVIpPuadREw19ivCXk5CdwLfrEHsoXutuCiabDy9cvFKZLUfJMfvlRF8SirWTwGT2qvoQ7Jtrcei7j@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh//hfP0oYsggjFwg/sj6sOiPR9qLn0U0uNH1kKBlitl51BTwc
	3GTEbBeBnM999um/FF2Q1ydh55usK+4FZFLBkL6vszdBlRvYYOC3ECd0aKSpJw3niZ7JqHufzFB
	uf+jypMeTBdWDqYtul3EH+JKwSELDepfaRIFbBxwafCkZfHP+dftSw9iWOH3zH0njtl8Q
X-Gm-Gg: AZuq6aJSGnkUrE+VGjHS/kx3AM19gMQs9VB0CSajxAkuP1VyhZbhhe6qpQNAOgia8TJ
	8LbCZy4iui+gmA936r1cggKwBK244bMZdFwHnN+RDJlih3Aoa3P0fySO7aLxz4ZmTdYk2c2WN+a
	F1JYX2Y+2EuPo9kvH/Jb3h2w5e8CLxRcKrpGl+pzav8FhtXKDKGB8cMC2h0tQ0ti1FxjAV++1F0
	5QHxyf747/Et1QwxpXo4O/OmrkrO5EckEz0D9EwM0cLLd+bIEpixqCLCyN+gECjW/1LHvSLS7Se
	I8DYF/KMsDpNMJhqyON1CF3bliyunLjNLUio0SjPNT+61yD+AY44JaFK+SPa8dgVC0EcatnHEei
	MBdTEp0oSxIIa6AnJQt8D81OW2Bfo55VQyZsupw9W0Fw=
X-Received: by 2002:a05:6a20:5481:b0:38b:e55a:97c9 with SMTP id adf61e73a8af0-393aef57a70mr3241492637.28.1770399771685;
        Fri, 06 Feb 2026 09:42:51 -0800 (PST)
X-Received: by 2002:a05:6a20:5481:b0:38b:e55a:97c9 with SMTP id adf61e73a8af0-393aef57a70mr3241454637.28.1770399771109;
        Fri, 06 Feb 2026 09:42:51 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5eccbdsm2639387a12.19.2026.02.06.09.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:42:50 -0800 (PST)
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
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
Subject: [PATCH v5 12/13] i2c: qcom-geni: Store of_device_id data in driver private struct
Date: Fri,  6 Feb 2026 23:11:11 +0530
Message-Id: <20260206174112.4149893-13-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BbzVE7t2 c=1 sm=1 tr=0 ts=6986281c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=VoGDZ86lKm6tgvVT7R0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 5ebbZiJkfeN7OGGZ1BcO2euElwx38gtz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEyOSBTYWx0ZWRfX7Sbth/6eVbn9
 PG07nw2dhzWZsJnc5PpdzfqdpxGIXMerLgCX9JMYV/W5yFCUSstHYcDE99XmXx+Woc7XLS+tUDc
 r/j3O48IFzdjCpT4XqGlU6sLvigs4SQldwkHokf8ykIdileSkCJVjLB1I27uc4/wK6MOo1dHHDE
 LmdpoaK4NFM0HBeb2SqqJF2XZ1OkKRJRF/H/AF6yTfCfiuMuDF2UoM3ZV3il446rO+IDb8008tN
 Ndbxppm1ugmtWFwfC/Ewk+Ni9UwcjkVDhxHiQKarwEfdvQoCloyOuqansz2ZPhp4XOXtFbtSMKc
 A4ZUlcCIaNC3C44MMvfZJHqQqWwaEuO7gcoXcY4n1HJx9hqr8/eh0DChOtl/TiMzL3/hYvjq6eq
 QX0geOZBm1DrXUm1qzqharb9dh9rT/E829C3uPolYIY+X1Xkgg2hUbAF16oROSz1nHEvH/6nzv+
 VqMOUNz7vsxOK7MNkEg==
X-Proofpoint-ORIG-GUID: 5ebbZiJkfeN7OGGZ1BcO2euElwx38gtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-92092-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84A4A101563
X-Rspamd-Action: no action

To avoid repeatedly fetching and checking platform data across various
functions, store the struct of_device_id data directly in the i2c
private structure. This change enhances code maintainability and reduces
redundancy.

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v4->v5
Konrad
- Added a null check after platform data struct.

v3->v4
- Added Acked-by tag.

Konrad
- Removed icc_ddr from platfrom data struct
---
 drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 0ddfeef6d1b2..9045187ad0b5 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -77,6 +77,11 @@ enum geni_i2c_err_code {
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+struct geni_i2c_desc {
+	bool no_dma_support;
+	unsigned int tx_fifo_depth;
+};
+
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
 
 /**
@@ -121,11 +126,7 @@ struct geni_i2c_dev {
 	bool is_tx_multi_desc_xfer;
 	u32 num_msgs;
 	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
-};
-
-struct geni_i2c_desc {
-	bool no_dma_support;
-	unsigned int tx_fifo_depth;
+	const struct geni_i2c_desc *dev_data;
 };
 
 struct geni_i2c_err_log {
@@ -976,7 +977,6 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 
 static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 {
-	const struct geni_i2c_desc *desc = NULL;
 	u32 proto, tx_depth;
 	bool fifo_disable;
 	int ret;
@@ -999,8 +999,7 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		goto err;
 	}
 
-	desc = device_get_match_data(gi2c->se.dev);
-	if (desc && desc->no_dma_support) {
+	if (gi2c->dev_data->no_dma_support) {
 		fifo_disable = false;
 		gi2c->no_dma = true;
 	} else {
@@ -1020,8 +1019,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 
 		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
-		if (!tx_depth && desc)
-			tx_depth = desc->tx_fifo_depth;
+		if (!tx_depth && gi2c->se.core_clk)
+			tx_depth = gi2c->dev_data->tx_fifo_depth;
 
 		if (!tx_depth) {
 			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
@@ -1064,7 +1063,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	struct geni_i2c_dev *gi2c;
 	int ret;
 	struct device *dev = &pdev->dev;
-	const struct geni_i2c_desc *desc = NULL;
 
 	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
@@ -1076,7 +1074,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(gi2c->se.base))
 		return PTR_ERR(gi2c->se.base);
 
-	desc = device_get_match_data(&pdev->dev);
+	gi2c->dev_data = device_get_match_data(&pdev->dev);
+	if (!gi2c->dev_data)
+		return -EINVAL;
 
 	ret = device_property_read_u32(dev, "clock-frequency",
 				       &gi2c->clk_freq_out);
@@ -1215,13 +1215,15 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
+static const struct geni_i2c_desc geni_i2c = {};
+
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
 };
 
 static const struct of_device_id geni_i2c_dt_match[] = {
-	{ .compatible = "qcom,geni-i2c" },
+	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
 	{}
 };
-- 
2.34.1


