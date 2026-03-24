Return-Path: <linux-arm-msm+bounces-99459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOR/FX/XwWkaXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:14:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5D2FF6F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 268E230A8970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22511FC0FC;
	Tue, 24 Mar 2026 00:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="krqEIf61";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FncjK4VG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE77F19343E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311076; cv=none; b=WMzGkT6Yi9bPu3v9GIpon0M5pO1q3iPqi5qST8SgenlXTI9SC8xRvmbLH4LIW4YPJCKFcU+dZeYkdsSHCeG81eTnmcpxivUktgyxg8a4xtdJtFE7vqE9eawq0cXOD/35pjpuilp82+RvBHnxKcCw0vuFfXc4G6FpiKibYZmjAgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311076; c=relaxed/simple;
	bh=Sy6oJd+KnyyD9Vs4BTyOzyQv0pft+AOfiX1PY1GJ5ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYqm5xVC4DXNcsMV55ceoe56y1wDmZ00aP2ol2cDUr6PLr8MveCNF3fTnc1TQAf2jk/yK8ianyz09Y1oMYSRheHZssT9/I5LydSPbxrdppEv2cktvGfy5UZjcbcYHHIECuqUZ5VILD7KzawjTQEcRWVS8Svz4CTAUgW2JniDQ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=krqEIf61; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FncjK4VG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqd2g1762212
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8hgelKstStZWzF6wWy9g8MQYVLkYeFx+q9MUtvosxg=; b=krqEIf61AAWJpPYK
	CUQSiNy8MHr1jvi9QO0nwhWS8IDmx6Txk0Ol+SNuILomF/bGOvXctBgW0PvzR4Lb
	dut4gs06FnksGEomNCpEn6hjgqlvuYIlDLmyOnuolzc8hy9M+6OEWqSjad1RrAEs
	hl8ntbVH7X1kTY4IfuZ3ZBilMjIzEGZOtob7JeG3IdY4zMPCTJ5WQ1cbi4vXpZjI
	vAVIaQPh9lHjldgMGgR6Ewpn4BSaP7AowWRDUC3DK/Hs4ewJ0FeN2hsmDUxRy7RW
	WtsFoSJn5P35xEU3d0Hh+ArO2XwL33qFVqIeB5yKewyRdczFNCygHrnKEKgpo1yX
	uUTsiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0a13t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094741c1c1so42673941cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311072; x=1774915872; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8hgelKstStZWzF6wWy9g8MQYVLkYeFx+q9MUtvosxg=;
        b=FncjK4VGX15iPtW0HhDxTOaMY6DpnXP/2YKj91UIy76SeYloJQZmjttlexDcY3f6L2
         N1aAWJEP3j42jj7pshoCZ0zUs6m6wyKgwxDz8ojzhx1S1J07gTF3sbaptPW5Y+yJ00OR
         A1gFGsw1fFpLZ8OXdK0FS9gjDQySPe9hLirpMHGKDAGE6i2MB6qQ6nnR4KjVGLmmLuw+
         yEXpBsLBITjh2354KA9st953JldBzjIhZ/mizfAoKAfkMrnVn0iPVEMKGEozz4NESAhO
         TOIahuZN6jEnpAPBNY33tk0OQcqS7w6qKjt+sr0B03bNt/wic+oisxp5Ler5ZtgMZZH3
         A72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311072; x=1774915872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8hgelKstStZWzF6wWy9g8MQYVLkYeFx+q9MUtvosxg=;
        b=VSjfieKP3BJDDKE9e3+aanNiLkq1YWxBtodD/T7bHvVPTajLQYxIeZVxZYt6WY6sY3
         1t8fOg0+3L1xHwK8fT1viJVQsC2Yi1Y5+r4FrJc+De1qUJcJPPNAVPe7NXX3mwr4oFc/
         zbnWHg7wJrGvtK+eaKTjIFSE9L7Xu0gnHQLtH99yf+lcyO8TRmNmllrk9f9QOdkHU9OY
         YKd7LY72E1qsKmkh5AfMbUTiO6xtGzdtPvNKCwBy4t4r813Ur9tU9w/BVmglpPtWy6/v
         K0fpuXAmbNJjpVFDgNNd+OCFwKK1vCv5bcrauu96hSUg5UK5eqp3nnsaJKRLYaIRaZ0e
         rpGg==
X-Gm-Message-State: AOJu0YwSuOThx4gA2eibHLs7lQek3XjMgT4DbCo6U/DBQB2igg1QRDva
	8Zi94KCoivPP8GkMTx37/8ZQqWYj0GPDPXJ2c6AuQ1oR7m1pFq4p6nDlZwzfZ0B5CiW9+1GJeES
	mfft7LPvRfJ2Xpit9wO7ZUBBhILYZXvUFB3jpkNtG1mI542S2GcekOQn+6Bn3y4yIZKrR
X-Gm-Gg: ATEYQzwp24Gp638GeZust6Ft8aAT53JdDIXKXucZh0j7PnerJJFIEbfj6suSs4uXHhH
	O8eRTKeL56gl0xZdlCQo5Xm7RqWdnW93igh4mD5LhC/CL9JBqmNGeTanJmSmbpOClw7gvRzR1Zr
	afV3o4qV3G68vEkrxZcenV3CApijIha5kcpNZgYFs868koq3l5GGKg251uiLUp5X/VCxaUmd8uq
	qeCr10h3LS2X7YQ4jD/Hxo0fjf+JnWZQwe9h6hFJokdzQqND+Npk5sMio4d73/l5bW83dqjA+vP
	/FOKwlU879MmbtdsK4nhp81vimP2tHWGA9YiCyGDwvPGWbS9a2oCEvWxGCUD28GdXFtBG1TPf9p
	LUiKKD7kAmja1MXJisORDoaVNIxbxKrBwy9COg0mWCFrvDfSeTFOQT7wKNI6bIUgt18kdggpybL
	amEJeoCk6ogWoXZJ3SKbP9SpeyLjPXgWT/zvc=
X-Received: by 2002:a05:622a:1899:b0:50b:506d:736b with SMTP id d75a77b69052e-50b506d8652mr131634871cf.47.1774311072088;
        Mon, 23 Mar 2026 17:11:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1899:b0:50b:506d:736b with SMTP id d75a77b69052e-50b506d8652mr131634421cf.47.1774311071657;
        Mon, 23 Mar 2026 17:11:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:11:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:41 +0200
Subject: [PATCH v2 5/9] interconnect: qcom: define OCMEM bus resource
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-5-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sy6oJd+KnyyD9Vs4BTyOzyQv0pft+AOfiX1PY1GJ5ag=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwdaHqbmoZNiGrolPxRsj2zZrjenjJSqnqdP9W
 ztUxMdNDFSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHWhwAKCRCLPIo+Aiko
 1TgoCACUvtdtzarbR8m2arr844FyuGwCqDMhs/aEAswvKDxAPOPUNSBezvQ6LBXJchB4ZaXQ1XC
 sEww9INa5Gif2fkZBmfIJsU/5HIjRetYUoy1nzlIb+c1GY0yFOKelaFV/wCKK0dn/D2XlE/djfb
 KXKwwlWu6H/1Z9bosM39Gp39zMQp7UMIEy1/sQCjmanOzoCBM294MasCUcGJXrLPkcGxYyj/i8F
 oa9vi8S5hgmnUO0xSTUo2hvFs56IsdKTsSo0ZKD9X+qM/sSBSKD0YIm38KLunHi71yXZ2v+cUB3
 d+zQo9XggIbX2gmL3wJblpQ/pgcCPE6HL4DcCIqONjMyAKnk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c1d6a0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=zOyvSeg7rOUdy7vhyckA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wDvkdwTuNb8CIKiqw_uvUxussJjqDGlG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfX7FNOojAE15xG
 5GSRRRND5Q/yxpVHDq6BX7jHImisxUYx3dNbN2pv3m60GNM1sAotk7rCDmiIFcnO4p/7KNfxbYU
 kRcGBCQUTsD0pWcR4gxYDTR3Nrp8e1FkxktCtgUBcv/Achr2egmdOn59NkUh/qJ1Ju2MAsYDj6V
 vehTWCCfSGR4Oo4KwmSvYeaZTg63FsNleqE/PcusLW6GMGqFwzGy3KLPC3mr53Le4Qj4fmYi6qk
 CQezAgcgTzSmvj+ca9AThYnDHyfiQ0Y+JQkEOW4DcCqz389kGDRvCpimsQIdP7SDuTN9qzKQcZ/
 E5dCHFCStc6wwqiMxD+inYp93ztMfVW5uCdQef1UpvFxLDTxqo2vMeXmIWGNhrrfX+dISWHI7sw
 9/Pr4iFeQKBWyTsupupM7Cic+EUitwfJ0ZZoDWZlqkUrLtF/xd8fB0aFAQ3FtdvkaKmU+5C/WQo
 pqn2bsjUWm24zEJbisg==
X-Proofpoint-GUID: wDvkdwTuNb8CIKiqw_uvUxussJjqDGlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240000
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99459-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6C5D2FF6F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some of the platforms (MSM8974, MSM8x26) require voting on the OCMEM
clock. Add new resource for that clock.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm-clocks.c | 6 ++++++
 drivers/interconnect/qcom/icc-rpm.h        | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm-clocks.c b/drivers/interconnect/qcom/icc-rpm-clocks.c
index ac1677de7dfd..69846e26f46a 100644
--- a/drivers/interconnect/qcom/icc-rpm-clocks.c
+++ b/drivers/interconnect/qcom/icc-rpm-clocks.c
@@ -31,6 +31,12 @@ const struct rpm_clk_resource mem_1_clk = {
 };
 EXPORT_SYMBOL_GPL(mem_1_clk);
 
+const struct rpm_clk_resource gpu_mem_2_clk = {
+	.resource_type = QCOM_SMD_RPM_MEM_CLK,
+	.clock_id = 2,
+};
+EXPORT_SYMBOL_GPL(gpu_mem_2_clk);
+
 const struct rpm_clk_resource bus_0_clk = {
 	.resource_type = QCOM_SMD_RPM_BUS_CLK,
 	.clock_id = 0,
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index cbf0a365839d..ad554c63967b 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -151,6 +151,7 @@ extern const struct rpm_clk_resource bimc_clk;
 extern const struct rpm_clk_resource bus_0_clk;
 extern const struct rpm_clk_resource bus_1_clk;
 extern const struct rpm_clk_resource bus_2_clk;
+extern const struct rpm_clk_resource gpu_mem_2_clk;
 extern const struct rpm_clk_resource mem_1_clk;
 extern const struct rpm_clk_resource mmaxi_0_clk;
 extern const struct rpm_clk_resource mmaxi_1_clk;

-- 
2.47.3


