Return-Path: <linux-arm-msm+bounces-93067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LaLNogelGk1AAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F29149636
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2495630093A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885E02E03F1;
	Tue, 17 Feb 2026 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWPCk6om";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dirBSn5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3C52DCF6C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314766; cv=none; b=UQ4c+nyi8kCCPFIKomsCmIGpbD30aZVRfB3FvupF9QD9OzizU2tq/agg+DcTXgraRkIpjXlYWzKI66F0fkRLaWBxuThBf0HHd3EuEgStyIKCcSQL1TbsT1iTK7tY7cC1K6fnWRNia9XtxYvUbDhBFO/FSQ+S8mmbBxA/m5kmDiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314766; c=relaxed/simple;
	bh=/SzSv8UMfhi5znodHP6PjQYlZg18R+0NDZwkrVHeQ14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPMf/CElVn/qReT+BOVOAqbYAd0nghoZsV7Oeux9tEs4aPixsmSlhFjiJx9wMTcI9I3RkQu305RFRK+jY4sq6PqvDQHQ8nclsGt1Z9sbni8P5M0ReiG4jbGA+l/FluWrcHu0jM/ocLhLg6Fqar8algo3sAMkuvL8uteTNCpIyA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWPCk6om; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dirBSn5o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GKDRmN597192
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz0PzecnV0gOV0OjTmSAMQlZ89zqvIEzR4OqGyCHFRk=; b=cWPCk6omPAXMyqsW
	7i2/IHomSnOMBW2oFFqKFQ3wD/BCrZPp5GjmmZ4lCLhiYu0WEqGf1h4vBRhSXP5G
	9SLSKYy4IrBGyVNwZwVtWwsk3j7Z2GbG0924KYsQzHjVAvkKUDCeibZXDJ8ns47Z
	2ok7cTXgGT2Rsqi5cFv5zcn0nzkwyjGzLvODSb5YRz06zoLFe0oK4JzW2Wo+4iHl
	LVPGOCGQAkVx1D/auaToWLC7j8Gmjeaq9uUchSIC/nWXUChtZPfbRSEKnT+bsKp1
	RrbAtsCZOUr/CZKugz0tns/EnW+jPgna6HpBr5cJeaO+nUHujKsjoH7CJricC+1J
	jlXy7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca3611un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so2819301485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314763; x=1771919563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tz0PzecnV0gOV0OjTmSAMQlZ89zqvIEzR4OqGyCHFRk=;
        b=dirBSn5o1UJYQ7gBqev+qvBmh9EMqrOfeAephEW8+TGPKGvjcWgQ6FJlm+uIFPLekc
         yporEu+Q2RLy1WY9AaF4GxzyhiIw1v7nL3DtLMYD6jQHczXXe4b8rzPgtNh57vA46YDU
         Ez+194hfbA2ChoHAZa0Ip1vY4SIAuxDrjz0pITv97fdqPYr/6nEjSFPndzexKWH+r4Kf
         glZ1olN0nT2BdMAdABiEDEEC7L00JDq52UmC0wi3kembrwjJryUSTkhpA6OMCofvrc6f
         b/EcthT+QqxRbu73Kz07rcql5CMMy11SgVZ+rbucx+fS4dsQju45C9qHIvj7Sr+i9lzs
         WCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314763; x=1771919563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tz0PzecnV0gOV0OjTmSAMQlZ89zqvIEzR4OqGyCHFRk=;
        b=YijzX4XEp7iBMDqhU1FPglY8OTZNxZ00KMLx0r0vV2hwN5KmwGYmSbmAUYOzCsX6gB
         Ip+NykW7+U3HlGj5x9eOGjQo/X8sTEeB13SNBLmE9TiB71sTNLM9XMC3YlmIZovRcZac
         KPaLam7aKw5wadBn0Nez1TXbm2treh2OkaRUz3gDDVzlSy/YaTfbnR/+BHVCDveRw5k/
         sXlINZOkeqg+d8tW6WVz5dHUDrOnXxcoSoYde8om2ddh7ufz4xlOJwdHRDHrnVdNCoz1
         4je5+Ck9obAN3KA2F4CiPlUYv1C8M8yA+JMo50TTVGGFn5GZs63Vf9UoIlUarMBesqli
         yO4A==
X-Gm-Message-State: AOJu0YzYE+p0U/drmjNegXsASm+BpgrLtm+2l+5vxGexHP6vy6ZneWRM
	Ym474pQOlmUhCDGA0lEUhh6Lzojfh8W9cE3IiBsWzgge1dzq/g5lAaX/Qh8SIdzlh9D3zDwwh2d
	5VO3OpAK4MKJ0shPA94prO6fhQxUR2j+IN1lFWzRyRJhArUkKKfPfEGISwTqXYi5nEdUX
X-Gm-Gg: AZuq6aJka5of/kH+RKaXiBKAxySvNSON4hp5XvuNLMjjSkU58LwYWBfIU4rVCf9BJ94
	1BEB3DiKv7sINQHFue24dTTnHhoQiBNX3iP+jWGI5LohaRGXH7g/OQ2h0hVIwo2AVFWgc6EJE+O
	jIaRjuXZCBenSFbE90ziXQ4ao46doUwWbi0IkuJeSYbUH2eV4CEirPZwiFTwktbmMM3N7MCimxr
	EPpaH7BMKICZcol0X8wb8z69oMrebDZ2546NdUt9svZ/7WqMHy0+LWpV3rtfx692ygGWA97z573
	B6evMswCwLhKbeq/c/tXL0wVq9Eq2/v1UQbGVteBHAR9w6YtL9dkADii58LJ6OpkbYgv88B1nY1
	jjbg+wYq16EQ0fPJ24GJDMFoCBpulPw==
X-Received: by 2002:a05:620a:40ca:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb4acd53c8mr1153724285a.45.1771314763320;
        Mon, 16 Feb 2026 23:52:43 -0800 (PST)
X-Received: by 2002:a05:620a:40ca:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb4acd53c8mr1153723285a.45.1771314762783;
        Mon, 16 Feb 2026 23:52:42 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29860229f8f.33.2026.02.16.23.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:52:42 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 09:52:24 +0200
Subject: [PATCH v4 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-eliza-clocks-v4-4-5d09f28d4251@oss.qualcomm.com>
References: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
In-Reply-To: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2482;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pIwMv3xwfCvbmXtdNXhaPOf3iqbou1znO8168is1YGY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBplB4+uYRxQhZASOvz/ykwpEifRNoxEwpHfPAeK
 g2VCxOJf3uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZQePgAKCRAbX0TJAJUV
 VuFVEADIRvKK4Kz4raB1hNHwsOo5jk23imbh3oSbyhYamXIJSPUlH8LPAr1+VD1aIo96jpvz5G7
 UIzAR2dW9TccUaNFCopPTAudIMi6kmffxa/acTthLwvGxNic6+Zii7rN0o32s3ZwW08kxpcG6PQ
 efZ9M38/WceM3nuW/o1+9uTtdVHvL4nk6XzVjdv2Ni7qZu/fD19k5ZeIOqPms+4VAvJkyw/2dQM
 ap8z4PfOqr2u2MCnjskYLYjpv9hlvhVDb/ZQTN3w44p6iv5H2ZmrElGn5V1nbHD12tn1hVDRnw4
 yImLrp7GyqBcXajbtNcx2BFfD2lLjHFYpZEzgi5G4/2pAkPSUVYgxetoSM5XOGKlj25HCB2y8yi
 Kb5nWaMuiPnl4uPhihSf0WCGAjqyfQ7Tf0bnW0FJVTtuDlPxVVITRTBuD7v5LV+xz8eBpOBr0Rt
 fBKePBNDr8/9yw3pg/kdv7byQNXkAY1TFKkvbCeC4bKeBu0J4nEI3/aVVCMObFXiB6XnqAE+BL/
 uHrQOTXue0yHgzmXOgGEpiWsuWLfRAnJX1Mk3FUpssiFzafgWDlBZbsq05LmqHZOsQO/hqHzlQr
 CxZBzFCdkmEdTftDzpF9D3Z9i5yrSH4tPr6O8FW1D5NcyvtviEsXkiP1gTWKQRmZSAcg+2MzZXx
 BkerIDf02c134fg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX4igK8B0Pq7OP
 h57tBKAgYLMM0OVKbt6d6NdLaQFYrH9QjmpL208k0RXhr4O4J0MnSLCVRjboc9HfPtXRnHxpOwf
 mQebSXBmfVaF3EGC0YfgwNDasijZTLaXLQqi1nD0pLbSfvQQOaDBaH1K236HBMwa895Fs7+tf+d
 Cto88mxzwL/QHu86XgCxYTPHiVNEbe4jjtHUXouwGC1P95pxTWDgAJoLaGw1sQ9J7Mj/TYVpjn3
 McoWCcTvbuB+NleFu40SurOXw4s5/WJT/V/QevGvDO4sk3jDesl1/zTAtQxl+SVHqaQ3PXNw8/J
 PUdjOfeBVSLu97T7VB2K91W5wO1cZsXh80pnAOiV6eu9zr/yHab1GfQ2Vv4WPoxdibwJzhfyPob
 C/0WBLL1KMvPlTnH+SK5IR5VxMGFngymLaic+W6qkmZd9+EwnTd7xuSuhqNbTCV4ge2rycKI2Nw
 TLBWVSFiUCerdUvGuFw==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69941e4c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=WYKAqXAjdBNwTyPbr-UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: xHhk_DO8UmMYetPMrjTj_2iiP_kaTjV0
X-Proofpoint-ORIG-GUID: xHhk_DO8UmMYetPMrjTj_2iiP_kaTjV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93067-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29F29149636
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the RPMH clocks present in Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..6a54481cc6ae 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -372,6 +372,8 @@ DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
 
 DEFINE_CLK_RPMH_VRM(rf_clk3, _a2, "rfclka3", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _a2, "rfclka4", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk5, _a2, "rfclka5", 2);
 
 DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
 DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
@@ -940,6 +942,29 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *eliza_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a2.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a2_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5_a2.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a2_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_eliza = {
+	.clks = eliza_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1029,6 +1054,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},

-- 
2.48.1


