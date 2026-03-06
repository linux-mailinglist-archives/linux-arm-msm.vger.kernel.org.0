Return-Path: <linux-arm-msm+bounces-95879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH5oN0kFq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4E2256DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B2F2301F314
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB574411637;
	Fri,  6 Mar 2026 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhYq1c7I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnwP94Am"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFAE411633
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815648; cv=none; b=u6EcmkU/fDG/B8ZmybOXuF2jtHkpntvkPTgK6H5kzmEmFcq5QnFI1We5zU+XDDrZGNLyO8xgM0oYDX6P6ZicR/Vw7S7K9MUfMSmKkmRnK9DA/dtCmKksdlQqcFqLQuN/qsgDNQecmPLS40w0mJE6UBoQv/zKB/b4TRAVo7ZsHnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815648; c=relaxed/simple;
	bh=u+vxmRBv/m3rH6HnQZVzi2jrY6vhcP5vRXG7as7GjtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sz4x8l7Zt/tzXGY3qzbKqYLM5fr3MbtniI/rcY+NeLH8uwqfdRO99aE5Wfl/jloaP2PxfhPFoG9G+8PDMA+ccDR4wiJXDu0/bFyysQHbHLkeBHkHQCKrYX14KmJbQ/piqQ6nU9V02T18nUQ0okB5tsA/0q9c7CHJkq8hjBQYRpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhYq1c7I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnwP94Am; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Fr3vf2008554
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDkaGfNA4m2bbYX9iLbxU16Hm29lTm2hzt5lBB0S9XE=; b=WhYq1c7I0Dya7pX2
	E6+6WcL5nlGWe9dEIuoI2IHOavaQ2MYTPptgpV0Hjar7QJElDNf7BaTuIr+VNJlC
	q2DInbHclD0Ppuj4l4qbb9q2zvWMLybeDdaash278t0Xy+/N1tuPFyWNF42SkCKn
	XcyO5BogP307Vex2NxBzdWPsBvVHTdrRzAktlJUBjyaMcxTo6+L3Mz3wYUZT/3S7
	7bbUCUCBmqcp0jfw8YIJmdSWYltlpvtd2YplnLyWAIRf6hi7XtMYoo+dvHrVM4TP
	23NlatTfK+Wx2rZwHlPSkdemmgyimnOmS7zXOtF6S+Ea6OgaKWLsA9f8hLvKDnB7
	lI77JQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahchp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so5207066685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815639; x=1773420439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDkaGfNA4m2bbYX9iLbxU16Hm29lTm2hzt5lBB0S9XE=;
        b=PnwP94AmcJHEzHKJEr4gp3gcpagjKoxkU0koHd/NnaeLelWHaZg6RXzYqpgzXlumbs
         ZzimoyazlAGHqPz/Hq8XEJwLh/l3CQy8TO36AkFSTLEQAOQ8y3F8OdMS+lckmQSgHRFp
         UMprHIHhzKwALYtFnVboWp1gf5MhZE85GhakPrV2/Mf4drtVbvTqA7fxIwe9nuwwra4m
         MIS0gOrRb6sDZWIZY6fakMwod6ikfPRnEvv7tbbyR1nbPiDMbs4LoGIwZPUHdecIdElT
         0lyL8mOawUQ+ChWFPxgj64UaXHjlpT+sa2NXG6d1Mrz7Np67hz2CuAupLZW2DyP48rxG
         eGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815639; x=1773420439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZDkaGfNA4m2bbYX9iLbxU16Hm29lTm2hzt5lBB0S9XE=;
        b=xRKl1oIcouyHdABCDFtSryxtilMDteuCTOy3DvgS3p+jb5dq2nPad8RxDPiwHVjdUO
         Kb0CH+sK0BNPgGJ1R9hs5AOctQkf/R9KpMFPsHljPoGro+wUZIKX+sXkejgkYpQkFRLd
         c8rWZbrAQ4rcRe9lKuNJJGea+hJ8K9Wd5sp9fjwMUy2aJ9EOFhPWnTOPrEQKITLUIe5T
         Rs3z1LvFDrTLvy/fwKLavORXj27g5jZSDj79Oo4YM5XPET2Wr9BUtphPdTFhJlBv9+3d
         8ovvIqLWIR1zPoFnfqi/jqBNjZK3KoaKG6WmXk4Uuil4WiL/bYmSQOWmwbIqdI5imFec
         mX7g==
X-Gm-Message-State: AOJu0YxwJPc8+FKsxl8FgYMMXWAB06BiojBAjuwXS8s0yEVEi7hRvpkL
	/Qy7ywtEEb6p2quyKUXae1uyIEDBPVDNmFrpF1xxEIcViYL/ekge7MZfbNye57z+ivKR+oAlEb0
	Tm4iZcSgnSNW7t7ozBNSRWZWgRK1sqxcuB9JllbDjk+sPnPjB1MoJr3z1i7I3ylfENcUO
X-Gm-Gg: ATEYQzw+RnKKzNb5kBGNLhqmW3GPoP/hYnAYoILhuOtyDpE6bzJawUE7fm7So1zpF//
	fUIKF13INMzJ4wcvrmg3pUBKkQIBI7R4Wad0SyFTQfo31xv2ZUTdN8eD+wliYYDMO4gHqf/0o9P
	idNrXSle9nZQkiX69n3a4u5LRM9sAdWvUv0VGNj7DIFfhR7CA/1hbfg4JKe2y+n1BQVrgULQRdr
	KuKoexXP5zBQVwTKPqRh25pQaXqrvILOKbfH3gIlDfxzmZrFqEz55fxwzsuLfumCiKv0ze8Otmb
	1ZYw/nzryl2pNguQu2SXaWj7xQ1xJza8+NzEBbGvyy3+jm/tuOayykGgkvD0RKb65X1FVwR8zAd
	aP24YDgFIKN4ew/watvH9kUJ0l84ZJK4Hg0U6+eivYsKVaJkdk2xY+s6g8poNOaNOwot0g2ny6O
	IaALFF1EX9oUCqQnwycjGY+Jsn+/eiuvKZB/w=
X-Received: by 2002:a05:620a:4006:b0:8cb:b22c:90f8 with SMTP id af79cd13be357-8cd6d4d6990mr360808485a.49.1772815639192;
        Fri, 06 Mar 2026 08:47:19 -0800 (PST)
X-Received: by 2002:a05:620a:4006:b0:8cb:b22c:90f8 with SMTP id af79cd13be357-8cd6d4d6990mr360802085a.49.1772815638621;
        Fri, 06 Mar 2026 08:47:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:09 +0200
Subject: [PATCH 03/24] soc: qcom: ubwc: define helper for MDSS and Adreno
 drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-3-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=u+vxmRBv/m3rH6HnQZVzi2jrY6vhcP5vRXG7as7GjtU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUM7N4X6eR3LGLFRjazm2xRzYWjDGnOlOJ8L
 ccvyHvadEuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDAAKCRCLPIo+Aiko
 1Ue5B/4zIgy9Zf4+P1P63mxB7QHWRPliFAHhRZIEXrCrmgJjieALVXacknOmbc/IiOYz0eMz3/f
 9EUgBlhlExw/5HFBhvwLN+/5SuD/TJL0LKkOB2o8b8cIqoIMOuw3BhEw3D88KqB7F9e/CXtZe30
 bh/rKVOMnVqAXvb/jn2GMiaS4AtPKAj1biGmGV6fJPNlUEp3oWaRYG5CBrDXPvWnTfvinG5aSWv
 1qkyoETRISyrvbroMgwWUuZMJKvPo0CPODkEZsHL1MycB9u5fvWIqgwqFnu4XBOV2Pvv9yKGnlq
 6NFNGk7NIwtk+jSdVRv3kunq1dxVGgnIm7c472Stbw/fjKsb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3rpHciOPMGvO4J6ztMJp1MaCfT_bc_G8
X-Proofpoint-ORIG-GUID: 3rpHciOPMGvO4J6ztMJp1MaCfT_bc_G8
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab0517 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UzRrU4X3WlmsSrSSq8kA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX6/yHGxQdpagN
 YZfOMTMBr6xPFyQZqNJ7uIHDZanSdHVcY/IqUF39DoUwHSIj+Hprlri0bMDl0eiOmv+XcZgmw+T
 3DZze9W+NNGO0QXA51QatRmnEHthgiXvtWyhcMrfRKgkYNTI7Zs+wJt7Q59wWlZVF595Ixondvm
 Bh1pqOb4NKZjp76lU/j2aXjtr/y28uTRkvXFfun+xeygNpnn2I7WYM35jq4mb0siLJrS3q67WDf
 /ZtZVTSZ2+jxwOMzgrNyKq9ERtGkLq2sywO4wHv1GAWe2ncH4Gj0OU+q+IgHnAhDBtfwYsJ29cK
 N3qP3zMIvnZkGT1/2uyEcuyfGqPfs7cUCw9p0MyQMPT/yGNTkWiQucqWoDLUnH0Jf27q7dlOQXl
 8DS3nn/1TIwhsnnnQoCGJJxypUpdDNU0rbIz0CMU0eArA9rcMSup8ouGmBpOo4zzyCla73/5mFD
 D6++deAlNR4TrXkxa5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 66F4E2256DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.925];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Define special helper returning version setting for MDSS and A8xx
drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 319caed88775..8355ffe40f88 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -100,4 +100,20 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 	return cfg->ubwc_swizzle;
 }
 
+static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)
+{
+	if (cfg->ubwc_enc_version >= UBWC_6_0)
+		return 5;
+	if (cfg->ubwc_enc_version >= UBWC_5_0)
+		return 4;
+	if (cfg->ubwc_enc_version >= UBWC_4_3)
+		return 3;
+	if (cfg->ubwc_enc_version >= UBWC_4_0)
+		return 2;
+	if (cfg->ubwc_enc_version >= UBWC_3_0)
+		return 1;
+
+	return 0;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


