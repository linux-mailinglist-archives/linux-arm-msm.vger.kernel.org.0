Return-Path: <linux-arm-msm+bounces-116110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fz1kLHawRmqsbgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:39:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 620C96FC2E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:39:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KO40I1s5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EkklKm6c;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116110-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116110-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D67093020ECE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C45368D4A;
	Thu,  2 Jul 2026 18:34:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8483C347FC8
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:34:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017270; cv=none; b=C7pIcA8ywaH36cX6KdSEwZi4QOhvtBV+N1p65Zb+9rMkqwGC2Vu884iMkxEVMyqtL+6Mg3lZcu/LfxdnG+JpIsKzlw5CuRddy6I8dHpHNMMDsE0YnI/xO8SUGLMpQMG25310RiD0uf/0YUrIXwDEQ2wvdfZLt8lQ+n5Utqnx0us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017270; c=relaxed/simple;
	bh=60ZYJrtJj+i+7nZ2grqsPKWvNd/3VlwVGCXmxTPy7bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpJRDqgh43GgxhY++64tSVQmfZFFcKauGCOqKOAKBSRUfhWc6E55KcV00bYnZSGE8b76deDjfcd7wSqh8+0xoaqdTLBxjLxivZMeYlcKSX2Cman1mQhAwdlNWH1rTCjlU7OujYJx4zMUkd1KGeBwoTmpgo6FA9z0PrgHO45Q9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KO40I1s5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkklKm6c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3DPU662362
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKZNXqgSe5gAr8Kfvpo9NCpQKAYKRjWXiseLeGNHB54=; b=KO40I1s5ABeIu2TX
	BKkCmdE1V41QlmPn0bPxTDgveKu4F4Eog1x2bVr9mUagz10PiYNsArWBjyU7zoOf
	S7UmtdQQzhLGQkHgk38ARhvSe10TSVL6vAnGUr/cErMxCz0H19Al/z81JIef7Fly
	xDs0y0wy380mnGsjVE+I/0dwX2NMQpIWR2Uth5zf9P75fYxZPHyivD4LKVXjSE+C
	Z3TVy3rRSOFDx3aLEJLEKZzyjd0jxUutEvuijVlal2HEL2+p5qDlLepXw6/ENabx
	ZwELp5CENuyOdLONYDXGB0/lB9LJRT2IAhblJ6N2x7qrUF0E3R3WBTPJ1WRN5iHn
	mMYwzA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc1txv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:34:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9667280edeso2295949a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017267; x=1783622067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKZNXqgSe5gAr8Kfvpo9NCpQKAYKRjWXiseLeGNHB54=;
        b=EkklKm6cLhUNNpvOPQ9Qrgf212lmi5aTIWHgBv7beqEH1DOft7PlTGpaGSi3HjCQmP
         VJ51501EZH9PkJeiGdgqnFsjGEeNL3p0/BGhQqt79JXduggpcUqfcilgB+Bbg2Pi10iD
         aL9LWINpbZxZtPglocy1gboITGNKiuwW7sRm2mqZj0K0nsHa97Gym5aASnNe+MPTOCJm
         tI4ZupZ918alogqQ0VY9WIoUSCMDvqPtauVhG+t1agzYpEfrMfHHj1/Ue+G9m8f3lsms
         YmiKhWUCVharTIxPKbJfjIPQxmm1PS/76yW7lb0de+Oam6uhyVLqIDCZOlbiYwxlOFDZ
         oGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017267; x=1783622067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MKZNXqgSe5gAr8Kfvpo9NCpQKAYKRjWXiseLeGNHB54=;
        b=kOGJBr8UL5wgqewRReuhLdRLMo29vjayo3usKopuSSOwDH33QwO6aqCNPIxa7JMP9J
         eg0Jf1a5q2pXOPdGlOtW9aUyFMArMZDfbdRhWib/Wi/LgkYsrHzAsKYauarvYrsts5+2
         iplXAXpWBIAtkV66Ivy8k9bdSe9DeX1IQqdyGk3gA3YwhTdNnlWpT+lkgBcacWjrhxqg
         MtdVi4BnzQw6A7bMo3MRs6ms5LRaAba7IhXwCyO7rwSII/NTJkkMyjmmajl/52eGZbFK
         Q8oIribLLDvj/jl3xFmJJONsH9+4Y6jZIZ0DhBJ8o+IqC5cwY55BQbfA8QJqt2dpis5O
         W03w==
X-Forwarded-Encrypted: i=1; AFNElJ9NNLHNQc+Sam5u/DDZ9kZ+QBrvGrdYGG57xgLoomrTdf4t/2zokv9OFyR/yHGnh8ij75xfgdLAYELpW3Kc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/l2r1RJDFdocmWVKNX/j4i+ChGAvWygvREmpJtVXK0FwyRHEw
	8v8YCupYT0Z3INwfTxU2IbrfTke4J/ltf5QnNflSi1SQuQxM90gStDZchgVMM1Tje0oKraPeyen
	a+Kx5NMmHH2D/LsjR9PKLv3n4JgEL1V0iwlzdHwBrPFo94KEtMeFDDYHdodooKUSgsB7i
X-Gm-Gg: AfdE7ckMHjx8OsDli9lC5EbqNHyaD8TfUq0Idgw9dTO0TY75nUTCmbgKT9ilHDnqc5T
	XsZe/47HgCzNa3MsamC4bCF25J9GRqM8E71WVd2xAVGy8N4Hic0uZTfgFm+PO5arA4V1ErD2TkD
	FPLvUFvylUor9SALUZYN8zRmuWPhks43k5ZkDcjpTAsQSuaGxf+cL0lOSBliCJ+gxeKdTHyFyfw
	mgs6JSRYcriSCTpw3GjxKX9lgFQzTQC5/01143eG/J/S/OCxAUmBQquhkqYhO3pLpdcn3HhyeJk
	nKmuP2c5UDgELPYPA+pmnxNVTs8wCx0e1pXRM8Xkytc9NwkFEoHZuxED89ti3JexR6KbW91wU9Z
	r/59nPBDwzYJZsnUHl0L5eJCjf83myXG2193QD8XE2w==
X-Received: by 2002:a05:6a21:710b:b0:3bf:9795:ac0a with SMTP id adf61e73a8af0-3bfed1c322emr8539361637.4.1783017267116;
        Thu, 02 Jul 2026 11:34:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:710b:b0:3bf:9795:ac0a with SMTP id adf61e73a8af0-3bfed1c322emr8539325637.4.1783017266656;
        Thu, 02 Jul 2026 11:34:26 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:38 +0530
Subject: [PATCH v5 16/19] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-16-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: -jQNYlOZBKJX08BBNHo4RFn7Yi70lLj3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX2VgEU+o6vsB6
 p/6PPYJP74wHGvkzeTdibKnz9yM6nSiJh2gn8sySMuMJLj+NngZdPt0WHVqhpvWpuwtylDmspBq
 bJvU/JKeCtCYrjwLRrh0MtCyztJ0y2MiAbVs7EIjB/RbmP5eUaiuedoG/Uji4xRgC8gYD3BzULQ
 NVJfEuP+IXdyRtkjtDLBLceitp/iFy3FKie9i+hGFn1xi9FnkwhWuBlRp4f4Ia982u3zi/hZFLQ
 ZdtexR86sj41S68VLAL/cJ2QOSP/2+kfJOpBlcU6yVe7LeqL2Qh+fbMRS2yWKthkbUYjmJeNPHn
 j+rqPygTcLM3/kPlIEL6vNsnGCEzTKwgo9vHSVpEOD4Q+AiLIb684ZkOB9wJwmMsG/hS62gkfyt
 01CM7/5eRjGN7v7JUSleNtxgfkLkMx8uCDe/tvWXHoxM5sbYU/g76BYAIFllxb0SEGSoczXLx/u
 fqNlN0f/zzGCE19Uzyw==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a46af33 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YtofigLH9XhHtagRA10A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: -jQNYlOZBKJX08BBNHo4RFn7Yi70lLj3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX8l/FHJSr92tO
 nmUYXV8fX+jD8fzPFhueDRoe5ILR6TsQvi2TirDYFkyKn8wUQeRd8FBn3c9iBRwUVzJuHtP65Ov
 2daEWcCMXm79WUjx0qygVWnQc0mv0KI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116110-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 620C96FC2E4

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence add support for Shikra
GPUCC by extending the QCM2290 GPUCC driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index fc33d82bcfb6843307d002d67674253f0174cb4a..ece567c533e88527451eecfbcd52a52bd05a8ad3 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -133,6 +133,17 @@ static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src_shikra[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	.cmd_rcgr = 0x101c,
 	.mnd_width = 0,
@@ -371,12 +382,16 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
 	{ .compatible = "qcom,qcm2290-gpucc" },
+	{ .compatible = "qcom,shikra-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
+		gpu_cc_gx_gfx3d_clk_src.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src_shikra;
+
 	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 

-- 
2.34.1


