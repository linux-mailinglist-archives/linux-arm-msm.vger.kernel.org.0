Return-Path: <linux-arm-msm+bounces-70450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26214B32158
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 19:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7CB11D62C45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 17:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C7228D8DB;
	Fri, 22 Aug 2025 17:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0gbA+Sz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F1526A1C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882919; cv=none; b=b8MbgAbEDEXLd7nGjo3iHXsPCpVTksEac8F7yCELmKQUYsXiVvuvJEbxkoBLAvA0G4/csym2CGm49HkXYR0oZQjrz5ndO5RVADru69nuNZhevKzVa++fBr7YxBXV3GRhKbZhZHQONzGergh4jPVN4vSxGDu5+oyZ9HzW6G1CKsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882919; c=relaxed/simple;
	bh=xbJwyrD2C3iNWF1DUx952NDNhE0jLbF+XEtCs5+R0zo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KgYm7jTjJv3WZavtrx4VsJPy38k+22T17IV+Uhea97hCHfJcbf+aWub9r7ToeB5/mqkHloF3ORffVdDFl+pOzAlB4zH2OICTq24Qa6IlOWz1SB/zrm8iV9O9ohygwlFz3H1hvbPCTREutm5Iq0JvN3K05pUQeNzpEwVeGyzYoB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0gbA+Sz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MGDqfd020906
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+8pC070wu4J
	VmBSidlDuszZJEm3cZ5GlOhv5w5ch2vU=; b=X0gbA+Sze2lvQmaQRA1hSjvwDWX
	N0OkRJCkUdBRQS1ekOdununXI6BpbsnPmW9hlHEG3GuPMY6MD7QB5wtBagB83P2h
	oQebaZ50/vtR59DiW3/SFim3Irp7J0QORRVuGSt7pmeAh7h4Dh71RJIZK13AcFao
	+4EMnwYk1pPxkcEYZW+T3u/uCLGrEsOWcrqrYRilTqzhffYqDE9wK7RjVjMqS3M2
	F9L9bQZ/Mr7E8a0g6yEOKx71KrYBTboOdnsNWczgYs2lycrlRL1AInWKy+KcsLwl
	UA1dcAOniDYpz377zn23bOZlQ4OB7XJoOyUFtnlpftlXjcj8Qnm4Ztc7S/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52920wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 17:15:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471a0e5a33so3987628a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755882909; x=1756487709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8pC070wu4JVmBSidlDuszZJEm3cZ5GlOhv5w5ch2vU=;
        b=hLzENUxZvxRs/W+329Zj6xp8mP4RAWQgFesWJag11mEfmM8Od5dUl201SqC59lXhzq
         Vs2mud/a7EBfaj8igdotuKeC5Wy/iDXKpOddWS4fv+HW3C4r2Y7agaE2JRc6+UQqpB4F
         GX2/pfUNLEb2lYFDyAd0Zrxz8F4N9AU4msZtWKh4LPAgkQ/Sp5Op2x9NNFm3jr62nndk
         F9z2FUyoNmWfCD9a9tSt89Z5ndNZD8DH7NBKGOi9wge7NC4P40RTZeRrBKTPGLAVSAXK
         jxbEo0AqTdaYa+L6eCazUC0oWek3/SxCuEdyWPLl/GGa0CeaS4lRrWx65c6sRD285ORa
         sEMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuBY3RtwEjrVUnnFXZBq+eru349LMOAcx+UpPmWTq6G9ukHiOeXEvUPPBNES08lRtH3O/RTHafHZOSVjlC@vger.kernel.org
X-Gm-Message-State: AOJu0YxGpLH4rcHA5PYQIoP94cxwD07sMUcHw6J/pCWnYECQZUAxUtlj
	roRVJS4fCNGLcGYCek4WBiVfHsi6b2ArXSmZxUU/KtkKB8gpc87ENgaIGtiC4GSq905v2G68vIb
	c6enpsb+Oj5rEDzEj/WW47CBJzb4loim+AxKf4UnzbKk/NQMWNAiAsnQ71UMfD2cCKxIbChSPOA
	0g
X-Gm-Gg: ASbGncth1p5xOdBPq5Q8Gfhyr0saG+IojN/pZcaHL0Jfi5ufSI/Bye4byutRvcdCuPt
	0tnqSCNBnyrMwvBCb+EzIXTZ+gMrD794SHOrrNnQtOSzpM/HECucJ+kXLrcRKVbwDzDptI44HgE
	jYuu26cOKgh85qMCl8dCVHb5nktU063Op9HAqnodhEdeXmmfPxXoiBmPlCpw9rYS7/O3CMtH8sw
	RDcWfwMLSrf/mglYuEXrRUOnhIcNNgZmm62cUBmaNLiBOPmH8CLgark6FjK2KBnIUwDAtyYvshg
	nwhXMbg8ilwNaXcyuNUhrI/JxjWx6Kb/wrjx/Udlg0wbs3yI/3miallRzkTTxJnzauA+DzEen1a
	A
X-Received: by 2002:a05:6a20:3d85:b0:23d:4777:49bd with SMTP id adf61e73a8af0-24340ca7a9fmr5646987637.21.1755882908718;
        Fri, 22 Aug 2025 10:15:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6GuwX31R8qwOZw90/Fag7/snvKPwFqs6UB/eEJ4CBW4sM1BBnXp3rmNLCDtVvZV0OpWE4nQ==
X-Received: by 2002:a05:6a20:3d85:b0:23d:4777:49bd with SMTP id adf61e73a8af0-24340ca7a9fmr5646938637.21.1755882908264;
        Fri, 22 Aug 2025 10:15:08 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8afc56sm309995a12.15.2025.08.22.10.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:15:08 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: [PATCH v1 2/2] ASoC: qcom: audioreach: Fix default WS source assignment for I2S interface
Date: Fri, 22 Aug 2025 22:44:40 +0530
Message-Id: <20250822171440.2040324-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a8a5a5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=hSYZM-FDCW3FgKnTnV4A:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: HwpRXqSUfG5riE1fmfmUyADgta-aeThp
X-Proofpoint-ORIG-GUID: HwpRXqSUfG5riE1fmfmUyADgta-aeThp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0w4z6HTchSKX
 s7uODIAR7PSJ/XDZoJRDeFieJ4gBCk9OZibo5eA/qp9ywTMwCJCgIXDRRm+vCKpq/OPhYkX5pZw
 7ohFg218qZVxwu+qdi/RdTLCWVEsyj+4wJiy7M3NohqZKueIyULqOSuZE6LzegKnaF9cw67+pH6
 k3fazgniThr21GX5CShVctYnWL8cLekb74vZoaoM74GXtR2HF6Ve4vkPNDINmfnTAYPaGocvpvC
 hodHbo60CYQQzE2F0xsHTdILnWQROvLkuWHFD4HQx60xqF1B7XVmOZQRXuXHoch+IG0HD/FrtSp
 E640zH/+0HVa02sTL9fOvBZsGrgQm9kwVlvMsMqHTgktVMlOHKd/U+URxpgHItOgqhnrhx+Guym
 VEz2Xk0eEh4KpjBbWpAafCtacwq/+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Resolve an issue where the I2S Word Select (WS) source could remain unset,
leading to misconfiguration of the I2S interface. A default WS source is
assigned when not explicitly configured by the AudioReach module.

For HS MI2S interface, the DSP need proper WS settings to set
appropriate endpoint configuration.

Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 6d7b1a4b0b2a..d4397f75e310 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -999,6 +999,12 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
+	/* Set default WS source if not already configured */
+	if (!module->ws_src)
+		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
+	else
+		intf_cfg->cfg.ws_src = module->ws_src;
+
 	switch (cfg->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:
 		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
-- 
2.34.1


