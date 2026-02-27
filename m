Return-Path: <linux-arm-msm+bounces-94400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAAHJnE4oWkbrQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:23:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 399791B3369
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 07:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FFAF31B6864
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7093EBF20;
	Fri, 27 Feb 2026 06:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhYlO7eW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1uk+XFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C603E9F86
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772173050; cv=none; b=mBTD1OboKaUJYkqdWz1P60hzsWJav+7UL/WfwJE7PLpHE6hNeEeqb2hPFDr2gs+idrHGciGsLu+/S/5M4K3B6XGsBCmY80GMCpoMxnMCFyONEKIdTYKsAej1tqOmC3HfdofA8xAConHXAFD2dO6fkGF5nNArJy04rjK5Ns0DnmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772173050; c=relaxed/simple;
	bh=HwTb7t2o4sy7CjKDpJPoenPA/396v0ONnPQOFRFUIQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZrfZwGAuNCZBMcXq9NfCgud4sNuuzXJlzii4s49Qli+RlHQm77pcMoebEbCl0YRFcku5NVrQe+Ha3zQz6BXUyspHshilWkFPHiuFgXsfi2vh4addpGDjDz9riQhCvBqaEDN6xV9LGLKl/T0spSAh8b5fmpqVQtxkxS3duC+/88M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhYlO7eW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1uk+XFM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JxDI2403019
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2KqnelgaDr6
	6ONe8WdkRoolRj2Ly4YpoaydtcSK3HUg=; b=ZhYlO7eWvF3y/w/B81nfjzXYiGX
	dafpzNphiiaCPfnvGLZ0pSd462gjpcbBqNg6ZW2E24b8rP2VvXfg3SIQRhYT3ltj
	Zi4rWL4od5NnA/MfpZ3i6uRmCHZThIYLmbCqRcdr0Et7yjGYI2TGkldexrioxLTQ
	JJ2EjEyZZ/ulzckUEOmHzWId0knMDy0N/GSLwBF2Hqn3VcAzAtXs57kDoGBlqwvH
	Y8IQZG4fhAbn9scmRNUMQmM/dovJaZz/+27ecOr1Tk2wdJY43tMP8dOO/nXlR9zI
	GmkFATxKaY7OapEhrFrF67rcry6opiVIQ174STV2lXq77/IGny1CdivmaKw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjw239ks5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:17:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adcab21141so16402605ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 22:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772173047; x=1772777847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KqnelgaDr66ONe8WdkRoolRj2Ly4YpoaydtcSK3HUg=;
        b=i1uk+XFMtyYYQRm8btNCbnEUC64bYT4V6BLkUvVscM57A9Jn3LQz3TMDgkm9FiipxD
         tT5IaAIbSGa/7mTuwMw0n9EX/UBJLZv1GL83wpGXUb2wa3xXP2rLKKQ6QbqnmbHSaSDa
         yI7t8UlJF/sD0AZ4FXM9eAFnseNAlyKD2gvo50OqRiahKPx2bcQbNfNi3os5kQQHUNlL
         mSzOR9p6ZBV127ulITGmhCOsQ/obb50pLIN3fFR5SHMu+zgAw8QZfEQ28g7hQHXaFAhg
         9+34todKgu1HUPZ1U+Va+KHUXGRZO0QwFnR2pgG5o7bcjoXp8PqS6+V5C7UfHbXzhg04
         x/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772173047; x=1772777847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KqnelgaDr66ONe8WdkRoolRj2Ly4YpoaydtcSK3HUg=;
        b=RGefEg3gKa3ll2kN4NlqmJTBrBkIEkh95ocP/OYs4e2Yxji3ZpH/QQu3BxepHTVgxt
         AX8skKdjs6Eb1G8T3qExdngv87mJPeUA2njzulffjiEsH3G3OW4JqCqkryVZU7d5Dalr
         utyCjDdj6hhR/cCN6T8NYrHgw9iZCC87HZSHo+wLUk4dTZJdF0bPwaV/tiikQ7u4NSJ9
         aH6XtK/xUU8iiyZiyLSfAB7ieHIirf2rDy0S/8fDNHI6UIkBOEoQK9RVlByIUCBoAbFJ
         3wCqBCT7AmMdJ/XTiZURy+V7sjO/w7p14YFMuCu1HF7OFw9e8f4wzW34xi8Wgdozx7zX
         rh9g==
X-Forwarded-Encrypted: i=1; AJvYcCXX8LyQFlfVjxy/OexMcwT4KgMqIULfP/YkzsNQSOsuG6LG0CiIg4cxMxaqz4dp58YyKckrIoPmbD8lj+lS@vger.kernel.org
X-Gm-Message-State: AOJu0YyQpjUiOuX9RiOh0CTWJfMTEujx8Utdt6nCuBBEok4twiPHdRcG
	ftSAiNfonwLlgAUsUbdiPUXRHRkTzu60FJacoHWBTL138EQaq9gqHExtYv5qliOJdMnk9bd2Ut1
	2OgvLcLou27TdfBclQ5xbNEPvjYGCKgeKZ76A1C9WrIrHyMy+bpdUHA0bPHQ3UecvuTwk
X-Gm-Gg: ATEYQzw2i3SuYggG/bNpdW/ubnzkwKmyNBxaJPiCh+FB5Fv7/XY5MSqSvPi8ETEk4i8
	2enjBiav9kqMEVOb0GgvtPB7SkroRdFfAlOMwBG0Rws+AD1x1PV0+V0nkbBJU061DkNm0x9QGuR
	MMjtT+oRxDVE8+pmKpP/Qzx9nmGlUnNmlUS3zmfaEwJUhrYacRpKQwOtNryTnBGsUp5KsC2x/7h
	sH/UKTx4MdY0RKJdqzP8Hk9aQp7u8Nnd/rA5rPrL2/hbwmeoc5N9+9hvgUMX4WjDgv0X/xk+tXz
	OXjwD0VVibWbLyanWJmc7cKxALb6mug3lXbbG8tLPDqHrh253QVNKfugeVbJUYR2FsT2I7tFzg6
	ngZqPPUv+BOd3Xl/HudxGsqD/7GFyhhXtrN10H3k2ioBmSo9+USlHj50=
X-Received: by 2002:a17:902:ecc5:b0:2ad:6e0c:620f with SMTP id d9443c01a7336-2ae2e4bceaamr16289445ad.43.1772173046947;
        Thu, 26 Feb 2026 22:17:26 -0800 (PST)
X-Received: by 2002:a17:902:ecc5:b0:2ad:6e0c:620f with SMTP id d9443c01a7336-2ae2e4bceaamr16289195ad.43.1772173046411;
        Thu, 26 Feb 2026 22:17:26 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a043dsm64813025ad.54.2026.02.26.22.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:17:26 -0800 (PST)
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
Subject: [PATCH v6 13/13] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms
Date: Fri, 27 Feb 2026 11:45:44 +0530
Message-Id: <20260227061544.1785978-14-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4WqK25b7i1HrKsSmjIN-YCKWNWdIciSX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1MCBTYWx0ZWRfX5YRnHCYf+BGZ
 WvROOlQsndFibMcnTcGwFbM/yWuaQkGFIIsXIpt7VM+XPrEyVEapTx2CrgAgJGTQov+0DC5AJNp
 4EGOOf2beUq8wmv4pLeBYa+70u/R2h0WqvUYPqVLLqyOaKYLoyNvRwyZO/tjP0nXwcW6LObk6+J
 kNAuE+WbqopYQJwuCnMnm5nzNYF0S0WIgk4nqy9rXFZxSU6PWQby6yGlmWxpmhd8YVHtYTvn7u4
 oWijcFxWOU0b40vaYtpt6A5RQGi6lOgMNyzZmCuPtqWlodOaLI7YwhPPgw5sZ329SiusZ4a8s5G
 Q+hfAd9tz6PqaZxKS0nbJQpusuDDkz4YQZ86Jp8biku33hsBbyIMehL/XboxCK0SpL/9f4Z04Si
 +4ItqGHZ11Y1k+ioew2QYqDM1GnY3cO7KGc7HMIYahwkJyexwoZbY6q0pS7sewCgiyuoNa3L2cF
 ZkAPcZy+CCzA4mVCQdQ==
X-Authority-Analysis: v=2.4 cv=cJHtc1eN c=1 sm=1 tr=0 ts=69a136f8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=zgZzUwpPmSg69XYvEVoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 4WqK25b7i1HrKsSmjIN-YCKWNWdIciSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-94400-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 399791B3369
X-Rspamd-Action: no action

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v3->v4:
- Added Acked-by tag.

V1->v2:
From kernel test robot:
- Initialized ret to "0" in resume/suspend callbacks.

Bjorn:
- Used seperate APIs for the resouces enable/disable.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 56 ++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index f2508038c64c..556bad79d606 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -80,6 +80,10 @@ enum geni_i2c_err_code {
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
 };
 
 #define QCOM_I2C_MIN_NUM_OF_MSGS_MULTI_DESC	2
@@ -201,8 +205,9 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
-static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
+static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 	u32 val;
 
@@ -215,6 +220,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+	return 0;
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -906,7 +912,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		return ret;
 	}
 
-	qcom_geni_i2c_conf(gi2c);
+	ret = gi2c->dev_data->set_rate(&gi2c->se, gi2c->clk_freq_out);
+	if (ret)
+		return ret;
 
 	if (gi2c->gpi_mode)
 		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
@@ -1032,8 +1040,9 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_i2c_dev *gi2c)
+static int geni_i2c_resources_init(struct geni_se *se)
 {
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
 	int ret;
 
 	ret = geni_se_resources_init(&gi2c->se);
@@ -1088,7 +1097,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
 
-	ret = geni_i2c_resources_init(gi2c);
+	ret = gi2c->dev_data->resources_init(&gi2c->se);
 	if (ret)
 		return ret;
 
@@ -1147,15 +1156,17 @@ static void geni_i2c_shutdown(struct platform_device *pdev)
 
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
 
-	ret = geni_se_resources_deactivate(&gi2c->se);
-	if (ret) {
-		enable_irq(gi2c->irq);
-		return ret;
+	if (gi2c->dev_data->power_off) {
+		ret = gi2c->dev_data->power_off(&gi2c->se);
+		if (ret) {
+			enable_irq(gi2c->irq);
+			return ret;
+		}
 	}
 
 	gi2c->suspended = 1;
@@ -1164,12 +1175,14 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 {
-	int ret;
+	int ret = 0;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_se_resources_activate(&gi2c->se);
-	if (ret)
-		return ret;
+	if (gi2c->dev_data->power_on) {
+		ret = gi2c->dev_data->power_on(&gi2c->se);
+		if (ret)
+			return ret;
+	}
 
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
@@ -1206,11 +1219,25 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 									NULL)
 };
 
-static const struct geni_i2c_desc geni_i2c = {};
+static const struct geni_i2c_desc geni_i2c = {
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
 
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
+	.resources_init = geni_i2c_resources_init,
+	.set_rate = qcom_geni_i2c_conf,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_i2c_desc sa8255p_geni_i2c = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
 };
 
 #ifdef CONFIG_ACPI
@@ -1225,6 +1252,7 @@ MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
 static const struct of_device_id geni_i2c_dt_match[] = {
 	{ .compatible = "qcom,geni-i2c", .data = &geni_i2c },
 	{ .compatible = "qcom,geni-i2c-master-hub", .data = &i2c_master_hub },
+	{ .compatible = "qcom,sa8255p-geni-i2c", .data = &sa8255p_geni_i2c },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
-- 
2.34.1


