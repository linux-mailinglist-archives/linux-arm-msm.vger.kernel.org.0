Return-Path: <linux-arm-msm+bounces-101274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPT/EVPjzGmjXQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:20:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1643377776
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5610305F99A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877D33D1CCC;
	Wed,  1 Apr 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tu6ekNw6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFJArWY5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646103CFF73
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034944; cv=none; b=a+M2T1XOWM6nqgRkKih9efrJzFFVZBtZBsb9XQvlp2Xc1JlGMNuFGiU0/0+kkRQULKSQpyhxqY48t8tSZ0mnG3KFVn8/BA8jvCjHhfJpykXbOa7sFQ7dcTDe+uSRGwIOaNrKl1rJYhzWMR/7mWrwPrPRx4gWHriHIIohf15mnwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034944; c=relaxed/simple;
	bh=APuuIh7qWlz8tdIYOeZlKUL5qGMFu1PdIThmuY5MMbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gGToMrVXInfSGSZN+o/dtDzT2WJmkF7pnEOim0whGDDK516XiUqzqo40ogD6eQZXK7vNh7UoKHVkqZABjX7kfKsxFWlC7CR0tT9ArFC00mbyKQNdXsSATY/Cd2eZ0v9wvx4bVHETUj976X0J+8uukf1xMwqwpiw6PDO1hlwfvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tu6ekNw6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFJArWY5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316fFNF3103832
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93pVvA59u5/k3Yn2i4LwAPIjV2KJULo+YG2xUrqVs94=; b=Tu6ekNw6Hj+qtbxK
	pIHNyG6yTzwKtf9F+w5nnfRyu1ih0YwC2VSgX+XIJSwR3LmsobJuj/4guy/3DlyD
	iYX7O7kCX4qvKg9r+dYNCX+nOIZVmdjNGn+S+XVn33kpYrG7NkTZfEcKcda/U6Q/
	1qMCUpEvrrYlb6ws3C5X+mlPLVePWxqllS46sgGhkAoO6VvJJdn5VR88bQlBHz9g
	ZxEzr48sLVUtULWKNt9qJ02UHJ/APV1qsOC165RTMsPTqFlYUutal6hrT6O/NlHb
	l8P7KcnOQ7cYuMp9J8Og6ehpimfhzYSxKyVayla78xlsbsncH+mZkF9ly2u8S68n
	J6oRGA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23hyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:15:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12721cd1a2aso7098206c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775034941; x=1775639741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93pVvA59u5/k3Yn2i4LwAPIjV2KJULo+YG2xUrqVs94=;
        b=iFJArWY5YM5Iq6bQR/BhtY84Sigg9Bej6yzL2ZOPqy0V9DUew4W+/s4eSKS4wwapBy
         6Z79+KMH5k64/1x8GmSDK15ods4QZJZi91BJvnjVMQ+SaeXbvx5pzlnMYV4HjBEsmTMP
         MhQyoSc5DeqozUNDN8fo6rUgsqu5YeYSl3Gvi2Oku2BRBEvXbyCM4EixDTa8oL2O9u2b
         fGnqpz2KGnYODe2IFj8F42kKDdtVK9o7zbr9zEgkMufOY8sgP9BtOmFaoSoG16jbTSr5
         KCj3bLawfX+tBWeGqWDj9tZUrSpIMXM9D8JXg0ORv99ndPAU7ZDp3I6x9kF7iRJByx2M
         pqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034941; x=1775639741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=93pVvA59u5/k3Yn2i4LwAPIjV2KJULo+YG2xUrqVs94=;
        b=na8JDkRZOS4e94e/vSUtWArYQCW2KMZS6ocoTWe2XwX00sFOnB8Uy4+6BzTuLoEAPX
         6qvzyUlNJENiOKjFGWbtzfLeBKDCFkvAe6an1hOp/41CK2xEARamNxaHrFKjVM2HnG4B
         sJ9UAUxlOIopphTQy4RoGVG3z3GnVQbLCEX217pQcRJFYkAZoZSvpOemfB+YkZLWTBfN
         IMH0KjVEsUPR/MBXILYufnvNJjx8BejPIzulecAsgOeymObne2OM7L482izEvv08I4a8
         +iZFtNZE036UnfwB+NvbNGJCe8R5ig6BIEDUPAdEejbALGNBQldJwsLhOBAqpxkmwZ0q
         j3mg==
X-Forwarded-Encrypted: i=1; AJvYcCW4qccuPHoHxUVbRWsH1T1dsNj7AJ18wqJzR/tCm1D5rENtxaG/YSdYycOBpw556+lqlz0PIz+c88km25OO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyql6kvdqcul07CaDc0ztyRTepH0FHb6fwpD+WB8lbezHMfWeDB
	jpIRtYzA43ArOMwRoTEKtVCUWYGfIJiFNeYKn2+p6oZGJLmEkiOs+H8h+GQUIi12ZPCoXwAu96k
	PmD0/JHFaGS+d0dMIJfHjJ0GZV3oeLjFmLx6/+JhSzcdkt+gPY4qVW8wwYH0D1IjhYhqm
X-Gm-Gg: ATEYQzwkyDeAY3l8xp7WtzCN59Z2e1fES7+o/cfyC/6ZEnNykSe4dDD43yJLaf16aBY
	ysoAPs6124DdhmJrP9Uq0rF/FPwuyb24E3EG6txbeiyQrbka0EaCQKC6dvYvGnLJi7/Rrslu1SN
	R79saDJgVGMewFSbZXmepkVZZqAVavgJ9VNeaSwIBDPo+7/ReHnf2IK+LTWp+iQYXf/vk+Lt9DN
	clkZeO9jimphtK5buuS2OS+C2UWQ6rVrgLiUCOoZbx416ky0Df157ViY9JSB+rg+pV54UKO02Bm
	fDcv33mDoLZgnnFr/nhPHzEbsfuB2uY/8eTVJf4IUWQiZ/0QMHjJbxnDNvX7gFxNd4zOHfaLY2h
	V6/Br8KeVuf3yAEJxao3AgQdz096xxoux2qA3iCUFnO8czQE9kKBXXI24Mgb8DaucYSX6R3u3Iw
	==
X-Received: by 2002:a05:7022:e19:b0:11d:f440:b743 with SMTP id a92af1059eb24-12be642068fmr1496443c88.7.1775034941075;
        Wed, 01 Apr 2026 02:15:41 -0700 (PDT)
X-Received: by 2002:a05:7022:e19:b0:11d:f440:b743 with SMTP id a92af1059eb24-12be642068fmr1496427c88.7.1775034940546;
        Wed, 01 Apr 2026 02:15:40 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97efb42sm18285025c88.7.2026.04.01.02.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:15:40 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 02:15:31 -0700
Subject: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Hawi SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
In-Reply-To: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775034936; l=2403;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=APuuIh7qWlz8tdIYOeZlKUL5qGMFu1PdIThmuY5MMbw=;
 b=1VIgSXBOtnXEnj2kWIdbj5kC4wpDRhhqKGZJhcLnrAnc2gAnOyN3I8Ti3VO72yOtzhidYUPS0
 CcwzSGGhc5sCgaPlYpMQybl2d9Igk98ClC0wzPmNPs6VL4bp1CIjk+o
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: DDRdDvftbYYZ2rm7axq67l1LJWL9O9dB
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69cce23d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dVseYE-P37VojbQfzSsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MSBTYWx0ZWRfX71LrkunFNT5U
 gGbOXZrqDA20bnVfx2kk93GLi0Knjvs3HkOVaq/RzHc1D6uGR4OApxIl9RqSoMB7Bq0W2Dtffej
 m+bkXoTpPejIrJgABsDqjkVJIOOlDHbkwERfubHz7Hb1kE3qo+lquzO4s0IcH0QaIcYieb9BQ1n
 +OuE+hx6D3lW6TVAcawNkC6aJGSLUNUowPE2NO75yzJdMXGzyEnSpfRGZSzOyCf4Zn7mQQb9TCM
 /qQOTYl2aELcPLgtId2fGb309OSReHmg26pSynoe7gpkgb/Ee4Lm4hMvVbYkYf+VbzYRVrFtTUo
 vt1r/G0bg4vFGkP4O0fIkGKQSKVypFGiVpVS88kPcIFK4BnD0gkXCZEX1Kem6kKKgoTwHE3IseD
 h88HmmaXk84bXQC5hOLjZmfm2bNeu4Vq8WKyxiKptr5Pg+RK6hg2PUw4GDZfcjZQSPa2iKfcJnL
 4CXnRL4d4Ek8af4xS6A==
X-Proofpoint-GUID: DDRdDvftbYYZ2rm7axq67l1LJWL9O9dB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101274-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1643377776
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the RPMh power domains required for the Hawi SoC. This includes
new definitions for domains supplying specific hardware components:
- DCX: supplies VDD_DISP
- GBX: supplies VDD_GFX_BX

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 19849703be4a..f5ae2a63765d 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -102,11 +102,21 @@ static struct rpmhpd cx_ao_w_mx_parent = {
 	.res_name = "cx.lvl",
 };
 
+static struct rpmhpd dcx = {
+	.pd = { .name = "dcx", },
+	.res_name = "dcx.lvl",
+};
+
 static struct rpmhpd ebi = {
 	.pd = { .name = "ebi", },
 	.res_name = "ebi.lvl",
 };
 
+static struct rpmhpd gbx = {
+	.pd = { .name = "gbx", },
+	.res_name = "gbx.lvl",
+};
+
 static struct rpmhpd gfx = {
 	.pd = { .name = "gfx", },
 	.res_name = "gfx.lvl",
@@ -622,6 +632,33 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Hawi RPMH powerdomains */
+static struct rpmhpd *hawi_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_DCX] = &dcx,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GBX] = &gbx,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_GMXC] = &gmxc,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MMCX] = &mmcx,
+	[RPMHPD_MMCX_AO] = &mmcx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_NSP] = &nsp,
+	[RPMHPD_NSP2] = &nsp2,
+};
+
+static const struct rpmhpd_desc hawi_desc = {
+	.rpmhpds = hawi_rpmhpds,
+	.num_pds = ARRAY_SIZE(hawi_rpmhpds),
+};
+
 /* QDU1000/QRU1000 RPMH powerdomains */
 static struct rpmhpd *qdu1000_rpmhpds[] = {
 	[QDU1000_CX] = &cx,
@@ -796,6 +833,7 @@ static const struct rpmhpd_desc qcs615_desc = {
 
 static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
+	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0


