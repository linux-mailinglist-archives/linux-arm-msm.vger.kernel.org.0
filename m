Return-Path: <linux-arm-msm+bounces-112018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HsnWEAu5J2qT1AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:56:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B721565CFB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:56:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lpjoVaxE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YyHVvp1D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112018-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112018-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D23EA307C224
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C553D47D9;
	Tue,  9 Jun 2026 06:55:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F393D3499
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:55:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988108; cv=none; b=rDc05ijf8huxf6avfkfvOB/x9QwMhR+t/ibe+/ex92XmSr91VpvXeENlLtJLUMeAigHES2f6PyDEYnvJ90o+yQGH118oiqXtERN4uMzIxqYIQ9jW71e6KO10BBRnt/tXYkxfYa5prcx/6vpgYbBXw4nfhvs47IXNo3PfrfRH4xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988108; c=relaxed/simple;
	bh=v5y2S4KEuK9ll8FKbt2wx7n2tKCwSSz3NBpnzhwlnk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oh1ceQbic3WORfPjTxtoVylGmZpjlCBmoJ7A/6G0gDLyLeOB6cD1AcmpZ0tuTCf6J3aNZOf7RBtRl+o1Co/WRo8/LbNaetJe4x1eaHjRB3acQFnwh4iyNwwT4DwK3++ddTnwqzDYShDSXz3yftGtQlIme2Lev6BUcAvIPky9zXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpjoVaxE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YyHVvp1D; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593xCjq996030
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bmrPzwjDfZQ
	LqRIOrgrQTwpDk+/Ro0GV+O0RqY/iaOE=; b=lpjoVaxE16wYOx+Zsq0sSEpgjfN
	8jXABXV+I7hSYqYY9nHWhrsXv3eEHZScdvTRvIRrfAIaWqMTj6r77FEXPucIskjx
	LgRYQglFPMlhx2dGGPRtLASE8m0ONZMt7io0zzi+z01aG+o7obhByr/lgjuvm6lO
	/+dVEOi62/6gAUJrrSDgEj4G1rKvdPObK3djT1KhmS35wk3di8p+HrB55BEG7d+M
	4AGR/XC7p+tDaZReYnmIxXhBLUWBL/ePh+UfcpkxrwnbBTRkNz1+79+g17zQmfx8
	yEA3Rat7NBk4nA7+0qTH21HvlDh0z0bd+CsSeOkunnZFXYsmcAevjaqOJIQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkw5rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:55:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d97415004so10052267a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780988106; x=1781592906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmrPzwjDfZQLqRIOrgrQTwpDk+/Ro0GV+O0RqY/iaOE=;
        b=YyHVvp1DT7H8qyHuChbrv6/aQdLv9uKQdOUlz1eml9JGSps5C/1m36NpvrspRpwmNK
         efIFpHZf6kk7a7d+qz5mm7b3SIHLeH0VhfUI6z8Svlxii3C7UO00uJ/LBWdCv6/mnCAM
         UHyGOG69s4xryT2gJTgkwFWXd8pHvQrCjzw2jTPh+6DBRl4V+bA6gKxEvZR+CTDEs6MB
         RwdDBcG1jdcWDqBQ541iT0heiMNiRXAsT+ju77uL9MAuvn1CBQXclt47H1peyv3s6Vty
         YIthNn48ZaxqUfJRtjaNjr0lgaOqwCVKlyZ7WLof0/AJws2jKyzSTwPhslQMU1+YnfFv
         js+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780988106; x=1781592906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmrPzwjDfZQLqRIOrgrQTwpDk+/Ro0GV+O0RqY/iaOE=;
        b=QuJu24FFhK+/Bee+efEQsq7nQUt1CmZ71ORpgnwW1F5OQRKT79Y1PdHRU6Sq36DxN5
         2e1Xn2Uv/Kr/oDVCZDFQdWLgEdLgAJ733gs21h8c7nJHcPOsD+cTd03zGaaaOwFz2qEH
         JTlXU2/w6vvP6zf+zha8Zk2aCBHsfW15eNjENr5hCfRnnISg3VmzdsUI0PsKDIWHdsjR
         agTKNwJXqo/ctuMDnnRqEaSYRsHj8RIcxYHeVaiFkpyBqfG5Ba8rA8oBmvBpuDVKdcrr
         YxRz83jYO8C3EJ6fDEZ5zDk/RaFNj3LFSjQ1x9+YSVgTH21Ek9Qr5gTfKBMnlzWqPjCX
         LfUg==
X-Forwarded-Encrypted: i=1; AFNElJ/b4zN5namSuBPzXYluDO5FP4qq4MMbbRlCwkHzNndjvu8zcfTIUIo7hHrZGV3GZYl+xHf+fX8ZLDnI3DP6@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTqx8rsIegZTC8hYpIwbHcn/JRDq2JDSJZR394wo192AvYKAY
	VQkGb/ZocwmGCi2F7m3DYr349RWrIN2zfekfcTfoGDueD2WxkqPK9rQxzhhXnYlqpi81kGo7L6O
	RYdO8vwLEBXuMYy0SQYATUMIk6zhrOOks0zRQ4seU5bQZwBcidtnTWZoI57Uu0RalduoR
X-Gm-Gg: Acq92OF/QoXKu/hfhCiGAH3kRbQ1hTvqGPdlSdt/xTd0LMAA4O8FRV3Yro8Go8J7zq4
	3/RXv9ksFN5jZWZ1dVoNOrhIx7B71trrOJPJVUPWOWqP6s219msCLqx4W4/BQyWbQWSiKE9xxqG
	gBISSe676ck2uU63niQpEeAs9PMTwn/DmB96V6aPAjZGeSPGFsV76ogyAFDMuqW/VL8pKfnoFS7
	HFoQZf0d/fRE8hdRz++kg/denhI1LlE0wKz1F4FhFnzmTera5kboZxhP3A7qvJOVaJI2jcR/F4l
	F+au/57vDTBsHaXi/hkX/2rrRUJHttFO55V2mqQSU5BGpNL8vxymzUMTcfiPlC49niVsyAsUMED
	Vi7nO8QZSyFaPs8gGdNudfwDq5KtmlMX/eTYBpLUTxt5mUgapehg/BYGo+9nXQzdehkMS7al4kF
	Kk5hW0EbJ7xm0AJkEb8h8YI2hPrETDFb5wyh0omWz5NN8B1gRe3rM7ueds2M6Ukw==
X-Received: by 2002:a17:90b:3d8c:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-370f096ad7cmr20967656a91.18.1780988105732;
        Mon, 08 Jun 2026 23:55:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3d8c:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-370f096ad7cmr20967634a91.18.1780988105205;
        Mon, 08 Jun 2026 23:55:05 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb3a9fsm8607926a91.0.2026.06.08.23.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:55:04 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/2] thermal/drivers/qcom/tsens: Add support for ipq9650 tsens
Date: Tue,  9 Jun 2026 12:24:47 +0530
Message-Id: <20260609065447.4024695-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3RoTKVqpTwsLpxDOsn7KPpj8dh1dwBEF
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a27b8ca cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nMt2SIcdhh0IZDtwxJkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 3RoTKVqpTwsLpxDOsn7KPpj8dh1dwBEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MyBTYWx0ZWRfX+32F4K7K+iBW
 Wao1v0aX+L6B2r5rGUe6T+1o0CxO2wT5ScwVXIbWJEWUWVj0/kzO4kc7tHdxZV/vDtgDG7UC8Jj
 XRrVpoHINgUO1QGTt6O/F6VKJdovtT/DFbVMC46U3lLmiPXBbpnBNC706b1cFpHKLYSPXggznXK
 CoFizE7dGcM8L6x43DTpH6P3CKcOVl8S/4FIG1wzIidM9bBBab5jZ6+Ut2RRD8ohHNiL2oYrAjV
 +L9W3gK7bUaeVw9DdXA8Vw81tNb6Tx4rZP1xbR6gKke98GqJcKokWlHypP6m++/9qH6LHoFoPAg
 07G9hFEOLQTpjXuqAvcmQcrlKRsA0Tcy97wDdP5CDfF6zHYtxfuMrGTBos8OK56yzKXAgHrW6wx
 33vx5DmvwhSG7/RKnykW8G+4/TWCOG6pyASbgU9F1bnvU/bAc05dgq0XW/bEuzkghvi1sqNSzqN
 cj74UzHhlP78ZAksCXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112018-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B721565CFB4

ipq9650's tsens is similar to ipq5332 tsens but has different number of
sensors. Re-use the ipq5332 data for ipq9650 and modify the sensor related
information.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
 drivers/thermal/qcom/tsens.c    | 3 +++
 drivers/thermal/qcom/tsens.h    | 2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 8d9698ea3ec4..ef1fee2266a3 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -300,6 +300,14 @@ const struct tsens_plat_data data_ipq5424 = {
 	.fields		= tsens_v2_regfields,
 };
 
+const struct tsens_plat_data data_ipq9650 = {
+	.num_sensors	= 11,
+	.ops		= &ops_ipq5332,
+	.hw_ids		= (unsigned int []){5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
+	.feat		= &ipq5332_feat,
+	.fields		= tsens_v2_regfields,
+};
+
 /* Kept around for backward compatibility with old msm8996.dtsi */
 struct tsens_plat_data data_8996 = {
 	.num_sensors	= 13,
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..e7bc622891ca 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1122,6 +1122,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,ipq8074-tsens",
 		.data = &data_ipq8074,
+	}, {
+		.compatible = "qcom,ipq9650-tsens",
+		.data = &data_ipq9650,
 	}, {
 		.compatible = "qcom,mdm9607-tsens",
 		.data = &data_9607,
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 2a7afa4c899b..d9d50d32c962 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -657,6 +657,6 @@ extern const struct tsens_plat_data data_ipq5018;
 
 /* TSENS v2 targets */
 extern struct tsens_plat_data data_8996, data_ipq8074, data_tsens_v2;
-extern const struct tsens_plat_data data_ipq5332, data_ipq5424;
+extern const struct tsens_plat_data data_ipq5332, data_ipq5424, data_ipq9650;
 
 #endif /* __QCOM_TSENS_H__ */
-- 
2.34.1


