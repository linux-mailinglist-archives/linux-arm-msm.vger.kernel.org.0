Return-Path: <linux-arm-msm+bounces-116669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4NGkCCFcS2pBQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:41:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 188B970DAE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:41:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O6kIbUFQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hBLN8GB3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116669-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116669-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CCD63128BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19063E5A07;
	Mon,  6 Jul 2026 07:11:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4702E3D1CC6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:11:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321891; cv=none; b=cyzqtwmUMPh+iDl2F3XzKIke7ZVLt34+UIGYp06MrxtOZysrSgwlq9fGrZ9noW0M2aAEmgKa4sC6lYNrKIxAE/B1ZtRBErCnLRbNfU3JET48E5jIUYeRIkRmh7OgSBZ5vhkdPflBr0tpmTNAEG5pC4lqMIbiOD1eF7cUp9jyxg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321891; c=relaxed/simple;
	bh=kElZmKKbm5xIpz+kSCtdFiFIH027FUef5BgpVJDoZU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WbRn0LbHIUAVPshAFC9kRKkHcI/SguRIa/5llPSRJ0+z+jLBKF1+lnCWHexAboDbREX9kNaIGsv/bqeWRqYgV1YRbFxCWzGEpL1iPN6bS43ScRQvrQxRy2SfLOl6po3KA0C/GQitPdKbTyBQ4fsHFIvdOK0buJQ1El3oTM1QX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6kIbUFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hBLN8GB3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641cS03470523
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jwkwWmlhw7+
	/E2DUZ/PK8cNjP86wV3o1KNAvztdcFs0=; b=O6kIbUFQGlaJO8O8sW92QnXpr77
	NLrEYxxT3eNYhhLlti1CvEGeW8bqZbABiDSKqshRRr5HocoI3+ZheEMD9rr0TlXX
	QWTJK+vcyB5tpsntRozmrUKLXkJNFCWUUMVHeHqHXq1+10xokkuoaz+EbzevHhYr
	5d2Bc/cm+JZOXqqHyeXE8AAMg/elf+uB018OJRUM/U6FapKC0O/oj33yXlfKNhlF
	CJNqNET36FXjc4cKzgtj6L0TOpXN2WgfvGXA8kZ03MBGazJ37Vp2E0WGgXPZMk8a
	loVZFuawsflQwEWdCi+At4tK4AcZp6VZ+wjdJS8ZTVw+rqqb3YaR6CRgExA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txemuhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:11:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915f6ff639aso497579585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321879; x=1783926679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwkwWmlhw7+/E2DUZ/PK8cNjP86wV3o1KNAvztdcFs0=;
        b=hBLN8GB3P3zva31o51S9WXXFPVQSxCVQR7+yDJcL6Yj74VBliwpHVQ2+FfRVS39Qxw
         5lItD1r6JA93qyXxEEMHI2gogPwv0mCmWzljGyd5co63HFYEwHzEKYqJplw8GAkXTekj
         4FBeH2VRAia+IkjQacqPBFrFXviGM3+TjFdTJKEIzFXvf/EoV6P+qyXeHRyHj30oO7Jv
         DsCQZ41Ka4uUP8fsj+RxahBPtKDLY8Kys1EK3dE2xyXHOjauC1QSASOUBK0vzcMa0dj1
         CBaiAfm+dRQw3vNZfkv/kn7lUH/wQhSAsMKFth9qJEOq6TK/VNxJ/6jSKCCTt0XGKYis
         HiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321879; x=1783926679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwkwWmlhw7+/E2DUZ/PK8cNjP86wV3o1KNAvztdcFs0=;
        b=mib9lR+zv/nth/GRGjHb9/tCHnj3k4WJhWGYZurAes8wsXGB1d39ykNkE1CfAZZkdE
         3iXbfYL9PU3iPTt3aizo29OJvHH5UWdtqA59/xxyVCTbNLbWWNFCGw7sAraCktHFloRJ
         RLOqXQmHws8EPybSrykxIvYL1S9LDs/jLI6q/XfH7OHrei0uSTyx3N8QedWxsGWZ6mVq
         kl4UaxPFhudFsEJTjQnJuyRG4VXDr3ziCXjUOL1qcOHxe8fPFPootbNy5KoSPlw2hjDH
         IhGjB6Y92wuEa7ogEzepYlxTlZPl2zZ4qryVFXVXpalnvXZ21aPs7Sea2j8PUk8gBC7l
         f0uw==
X-Forwarded-Encrypted: i=1; AHgh+RqzF12NN+X4E4JV95e9eZZdC/4OjKo/3Y7YqDOplp4ge3M5syHB4nrJUD805jk4m0H2BZG32QTDbAvHwaOx@vger.kernel.org
X-Gm-Message-State: AOJu0YxKPOE/6J/GwYrHGUvX4wmt0HRwm4kN0Todk1AEDVWFkdHIk6tL
	hJq+8qcPFJ4ILfm+00yHX3wbkzqINzFeGJt+LTMahiXroo2+J5pY+9l8/ifWYIFeAIJfJ+49jlE
	gt50oKsoa3DYVeTS6ggVZLkiMpY6aZAzSxwsRmKDOsaxI66X4u2wHyZRLcnTO+qukK8s1
X-Gm-Gg: AfdE7ckAE90sirwkp4cjQ9XVzN+Ax6TNhMkNP0fiTxEGrQL2VGeo6sVnQxxxA/KMsE4
	AHTb0iK1n1o7bXhUxrQMH/KriVuWNpQyxR9ijPOF7xzk5EgMi7nxNIUF7u7LjnkorwyIMtONV0O
	8AMO8PS0A3QCeievOP1L7hdQv1uW/3v3M525yZ3OOIBbvyWhxdQn/uv34L4avGIublN2KHHxyxq
	8Ux0aFpSyzbsD6bKdfElK+dyYAMOTuinCmBy1XGk4/QUNPqVrYUA3Wn2mS5jfFRs52u1Q89QJVJ
	4xbiHtVCy4AeHi0R9OsSVKFb08I4rycyscUrUsfsIEVd0jwzrQhHqSSsDOaSN+MNwVz0SvRHf5c
	d7vxcB+AOcqgouLjcPjXDl2IBTFJZ2Ky2c7w=
X-Received: by 2002:a05:620a:4110:b0:915:9aa5:b5c6 with SMTP id af79cd13be357-92e9a418dc0mr1248768885a.36.1783321878915;
        Mon, 06 Jul 2026 00:11:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4110:b0:915:9aa5:b5c6 with SMTP id af79cd13be357-92e9a418dc0mr1248766085a.36.1783321878516;
        Mon, 06 Jul 2026 00:11:18 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:17 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices via DT
Date: Mon,  6 Jul 2026 10:11:09 +0300
Message-Id: <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfXwpB9AzvdS201
 JWix+yo8JxthBwgS5oLWrjoJxU3kmW9Fz2WoxjiyOQVZcTItgOJdZrxgoOoxpmQSgmv81FFNckn
 GZpxqN8n7Jj29jPFsM2aPTmo2C1RznQ=
X-Proofpoint-GUID: DN76tzof6ryeRK17YnC96BEj9T-saU8n
X-Proofpoint-ORIG-GUID: DN76tzof6ryeRK17YnC96BEj9T-saU8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX1+6hkkR2s1wo
 XE7AJDoGJtGe6A8qLJZ4lw1xOoIo+I51ep9qa3val8TM20ewH+ehzbzsJjfBDatwf4cb7c0QIR0
 tiOvpMyPNKGegWNs9agRYEGxuIqAW+QbSCn3edT+yYR6LSXV7TBFKV879U2lmou2aHGGJr2nGYF
 JX1OJtqEiUVvqfMWrmjJiCSIVxPk6Jd7ClAxJDgxenk+14w0j6aQspgzK8QD92+jIwQBSnKUbt1
 DQCVMgWD/7Ya1C+9jUiLkYg+HP8gLsJRxGvrF2oWjBJV4Ubsj9ZKQHIYRYpyim7NwMj5Phs17xv
 kxkbHUiV7/+qJb+hL6aTt/96y9kV6Rxm6FLPQCVgBINT+EP6HjFOVW01s6e/HF2jCxxABW786/b
 tNWhG66fA2wZEGO+jnGRAI0KKcMefP3WWYveb593DYEAJJacmAFfKOeUn6laCdphcTW6Jr/A3ev
 zDvKqy5c0qcygJAT8iQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b5518 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=CvTwmiUEViyTWuGqE5AA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116669-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 188B970DAE1

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Use devm_of_platform_populate() so that child nodes declared under the
CAMSS device tree node (e.g. OPE) are automatically instantiated as
platform devices. This is required now that CAMSS is modelled as a
simple-bus and ISP blocks such as OPE are described as child nodes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..95e655a8b6aa 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);
-- 
2.34.1


