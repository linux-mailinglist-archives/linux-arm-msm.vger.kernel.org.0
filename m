Return-Path: <linux-arm-msm+bounces-112340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 61aNM2cdKWqpQwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:16:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F26670B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:16:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="XgO8IG/I";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bbAkNIiN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112340-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112340-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF61F3076B7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3135F3ABD95;
	Wed, 10 Jun 2026 08:13:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890EF3AB5BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:13:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079184; cv=none; b=iQEITcrMmeG6lHbB0inUiTCUxb73a/5+TUGk/51JWuiAwpuWS+gpmac5kJBCCPjSXTEwJR/DGVjI+Gb325ga43Suto8CvXVhXaIBj9CycndbxhZKuKp3caWrhm9m8rZ0T86uuh5nN4JIFwuc5KDaOEswOv/glv+8ZrlbFYBm6wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079184; c=relaxed/simple;
	bh=v5y2S4KEuK9ll8FKbt2wx7n2tKCwSSz3NBpnzhwlnk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IuqwEBiSmqtGe0qZ5vbQqbFPNM347ROy9ZIhEjQpRw9Z7MzauCiByooLYxd674GJHpWTQE1CethDX8ael9g5carEbJAK38mVMg97LKIJ0VVrF5x5AYTJ2MC3yKfnG5kTc6TQ9rwreGo9Kmq7+hDxdt0/eFEzqOvXGykXxNDw0lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgO8IG/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbAkNIiN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hkxh530226
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bmrPzwjDfZQ
	LqRIOrgrQTwpDk+/Ro0GV+O0RqY/iaOE=; b=XgO8IG/IfJI5VGjZtkEFnUEJqIv
	xIVrLsjMFpAZw3bd4WFNtb1R8d86+dxzPN6+0oFyJ2z2UZJ8ZAaTNsQAUpWQ4aKT
	ixaIpgQIf4ewB2X6Snpor73T+SAwjNK7RIGYxLrpjrLlM0a0NaYXPMtBoiuxAlyp
	ey2DW7aSCnVDerqeuMMnfvogsgLAFckXOQX3Fm1+vRMqF9WhMKbGbzIs0hqnnJpl
	fTJbcNktNlW5bOuZNZQSAav0tBws//JqHVXGmiz4CiL6I90dq3QU7xVdKkzYGrM9
	Cv62hrZ1+Bv+FvhcfS2krLx36Pw2qdGHeBy4h53L545djGX+zdJnC+f7Jow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2hdvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:13:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2a4babe45so9530635ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079180; x=1781683980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmrPzwjDfZQLqRIOrgrQTwpDk+/Ro0GV+O0RqY/iaOE=;
        b=bbAkNIiNawCJ3k0hyHLY6JcQtQ1/tQDvucrgFd6I2eVtEdiJaa6HchpN0IN9xqR+wP
         AAVBIgnWyRfwhlDhQOwH+/LPe2HHaJupRTed9AIIHNXrSqM2mF7zy1tFyxRFlK+x3sDr
         1xHYt2vv9AVYGcxofZQOd0txV1/9mWT9q6CAc+R1Y6Qb8jH9JtoFkId0pwhuJIc3YI0c
         mSQBgvBjZ3+GxIWhh/D2TkRvHqypEpVITWK7mERSm3gu69jtg5Hgj/xwo1TxQxyMvKUH
         Fii+vgUdFXCQYEAwvrYlT4dsEvrZJiWyN4DHKIGfR91uSGqaCgRSS0SqIrCHCiypuZh1
         vYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079180; x=1781683980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmrPzwjDfZQLqRIOrgrQTwpDk+/Ro0GV+O0RqY/iaOE=;
        b=RXxnHAFI7Czjq7d1UClF5DG9b3FQNYTZhu6sFF0rwNg4nuXIK+khxfWYOQUO2DiDK5
         SMaSpCQWx+Vgvb7OYQHCfcTRpHsuPU+CJZmb8n/zHwtcrUTS9aSJXCXg2aTlVXc1ExOL
         0OwAWUTk0Zws6lAW5Lh20eLAUolhVpqCLI5oca9WD8R1oCTwcrDWDzXvkqQYqfAzzAJ/
         s7leATnJeD3lpUTLMu80njWNgYymRG040I/SPhnt1X7ISKvXW3P0LfK8gn1f9D00eB5R
         nGr3jCIy39tuC7kau51Jr4MWY8Jqz/QBb2bJJusENSAS+pqMRaVMYdARpAXaxqTkqaO7
         iiaA==
X-Forwarded-Encrypted: i=1; AFNElJ8O77N+LVj2EO+vHozgkpXaoSzH/dN6CLnqQtUg4jdH4qamC7czLpL8yUX9Rq+Wo3apk4FmAW3mvat2HJLf@vger.kernel.org
X-Gm-Message-State: AOJu0YyUDqrxeZDSM1cclIH1oIZ+locry66Ybq+tojSK8Hhj1uIJHPeL
	Ip0dNWrNSYBcYP3pK3BXHH7htXJYyBaTOQQPKsNq/zL0MTKGN74JTynwkFhVnKMnpCYxyeamUGC
	zqVEL4kK+ifehAFeSQfkU+XOf4S1WzStw43QLTf72ai+mkwY+HL49n+eRdPEHFNr5K1wH
X-Gm-Gg: Acq92OGbH/Z2Tp2jaxy4rYptCdAaH7LExV5L4KM9EjHdnGU6a11YmKmar8DLwLodz5C
	rKZJhd5MQHOszZ6jCnyYxXc2RqDl6L7Xx7s07I2yV+2VVmEqQGk4sNvY6Tac0F2lV+HpdEDLj29
	BSiOcU/2lBnK4WElqKdrLBSe3TKQoNm/ZbpEQgnxTEdLIBe5fsMmfbdBoVx2gAjm/aZBWlr6oS/
	yNCWJ1t9Ec3ug3ASt1ZB0lN6o/14xbLWNRuhwPoUBPNP0e58zFSl471rCG8yRZ7O++K+Q0cpCHm
	4GQEbAnj0YBKAsEnwIgZ9GdjJFzvVYgT5hlt74708LbPn3BNwlPWLjvqTc+H+roDfrnK+3C5HVQ
	gOSlpw8q7ZFLetyHsV5oH1+xzjbb/TUJeXVHVCSBE/opUVt2+EyEsPwWi5pHBgl9xf0tSRJilsh
	aKNXtkbbVBkyujWftzyIr351PDCmPueYeRMkeeI7q6Qj2s9sGf7MXjokSDZ542tQ==
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr270665355ad.29.1781079180106;
        Wed, 10 Jun 2026 01:13:00 -0700 (PDT)
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr270665045ad.29.1781079179556;
        Wed, 10 Jun 2026 01:12:59 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8679esm228858575ad.21.2026.06.10.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:12:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/2] thermal/drivers/qcom/tsens: Add support for ipq9650 tsens
Date: Wed, 10 Jun 2026 13:42:41 +0530
Message-Id: <20260610081241.1468507-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a291c8c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=nMt2SIcdhh0IZDtwxJkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NiBTYWx0ZWRfX5Msr1Bnmf2za
 9SRSBTqKtlFCmOxUX+FceVTigdXLBrS80w9uYRqTQtFeMnB0b7SSIqP0fQzhOo1Zw5oMLQqw9bM
 vewK6/OVMLJSTneMQsJCv3SJBh5sLyhmvxHmtmfpAyjglu6zNxhPN0htqEUIcPGMTtXdCNYhxAn
 yqvuirOCC2U5qmxJTgxD1YfIVya9y+bmG7s38SZsBPIrarfguf8pBlhGiIUUw17FivuDBaj5fBz
 WogteewjWFGGSfhClkuZN5Lk2nwpk4Fp0oLYowWJKLGg0ykimLNXKEpLQ9kBhuSNlA/X0ywA5TX
 s8176UiE0jzwMp6wEzahT9dVf+HEzQc1IuJkgf3sVRZJc1UuRhd8TlJq4Q+2F1C7SrbxVkMBgjo
 7Nk4FGWG5TjMD4P7IKS+r1btbc1VySPYcr8VjN4kGcHE1KI27y4nBo9hhsqaa/dJfBAnrth86Sn
 DbC7xkjUSwOcdgnXU7Q==
X-Proofpoint-ORIG-GUID: 0XIYJdDdquxU-iiSgZiP5aFtESIz_tFz
X-Proofpoint-GUID: 0XIYJdDdquxU-iiSgZiP5aFtESIz_tFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112340-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 731F26670B0

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


