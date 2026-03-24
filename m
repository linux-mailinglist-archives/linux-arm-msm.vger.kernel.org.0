Return-Path: <linux-arm-msm+bounces-99651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOFpM4WMwmlvewQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:07:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5505308EB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98199303BEAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F6639A7FB;
	Tue, 24 Mar 2026 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQzH3Z/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E96q27Kt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B8D3F7E6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356836; cv=none; b=u8GCFIyrcJBzW5nGOfNlIFct6Tt20nI5Maj9akp0sWNNPbAq5uniGIH+T7QzVo1AH6Rc1azQrJ5u+z3/hWMaJvj86bSqZEj4wontbw6jmjErg6lM5EyJ/EU/tAggPvvK9+j1+7e0HEaSDtZqQUFlI7R4vlNqgAvzlBLaRVwCKHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356836; c=relaxed/simple;
	bh=i66GnheF6ZBj+Oc7Ic4BH8rLF8Z72YcI545VNnFJx90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VvgLEcKDPZVh0Kh1p7VWcp38qlKnm6SZg/C8I+C1lTyvUQh66X0BCUJuQElgGxgvnR3m+S1cW6Z2vDCm6JuX+XS3ECXMMmp9qsEpsoOqUtQcz49A8rJDuuXoZ2neH+2T2ETZgoGzGn3PmnH2HEpR8Fap4yekQ6DeCgsiwEJW98s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQzH3Z/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E96q27Kt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9wZmV3039766
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bOHB60LFyBzqimoP2qkwfzkgekhMWRDQOxM
	LQ6P+wLU=; b=RQzH3Z/nR4oxlg5dXqobyMHvZWeEzFHFjgh3DlBfyn8IyFkgG4t
	+WKMFL6AP5KHwq3Am9fe1H3OJIVbG+UgYXlMyCdXI0bDSEOo4VhvvaXz9L5pDRiE
	8nFbh2SmEQRg1zmsmBVJ0xAxfGNx09d/mEQ3kWcb4CEMrpWypeHrOQE8SAxhBUke
	I/VVJaNNey0krhxE1A4sVsivBdlduZUJDOQsVu9EEnz5eIlGwaHk5T05//qcpVaH
	KjnBqVup6y9gl/I1D+NlfhlGaw4PezuaOmyuyXTkHUo9OzWanuWbcGLRD8M6JEU0
	m3L7v9ZgmnJ4etnLK1Kf3ggQicMK69OZVKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0gmk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:53:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091782ab06so237281971cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774356834; x=1774961634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bOHB60LFyBzqimoP2qkwfzkgekhMWRDQOxMLQ6P+wLU=;
        b=E96q27Kt924psCV6s/XYqVYQB5oxYdZN7S5O+WYVOdZrjFqepi9ZEEm6iqa4PnTJZN
         O0NzXQDmo5WtIvNtWy3PBJoIdgFB0yjddLFz7oOXDW7xr/SPP0PDvjpkm6xJg6Rp6zFO
         gJ+NCJiCQYwpgSqZVtwCwVPdrVH0VspJkUG4DH54lEJ36tU93f9krIkVPQuor1YX1nky
         rahaPrYVumVZiXfIGmZ91FRpOhc78Hl8ylr5sjibJx77kirJp5h6CRBjr44pOyYHY3Q7
         H9q2WAqF1BrS6y9ANhJNjul2xWyVIH5MXGImsUqQeRcQFviFC5pc3T8gGB2OUyIdnXZA
         ZSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774356834; x=1774961634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOHB60LFyBzqimoP2qkwfzkgekhMWRDQOxMLQ6P+wLU=;
        b=PBGAqBgAv2P2J7VpSqbZOyZ9ee0L5v3JR5IkIw6919sPBQydnrlbAqCRWs86kRjTO3
         P0AYZ+jIq2rDqFXBJZW+PsVaaJaP/a+iNY0gRdS/sMfaco7OyPPr6Za61PC9QZaAy75Y
         2aTeH5bjlFsoyJeZ001PCItved3lQuYVAEbL736SIxPZZJgJ3P+crQSzVdBBrt5NaaPX
         lLNwWvB28zeYOS6Lz/DsddLqEOb1KZ2aAZy0sapE0CWeWbyrchxgSE9s9N+Ot7NCkPl0
         MP61wWyFMuNUEM+pgKTJeFo1Fx0PBOG9z+NO2Y2r5qQ8y34wSPvxaVWeapLbrYIySjI+
         lT3w==
X-Gm-Message-State: AOJu0YxItturLMl2w4XPeHg5en9ZskuTJf9YV1IEDYqMvIp4g7MC4g7O
	gu+hE3bN+NnIJ58bDcTsNsGg6pWm3AYtaLl0YOWUXIszOmXPlV8DERBwOkAD62DGgVeBJaSCpiN
	NSS7UHhdtL9ZbAxRGQKjG4TDeUzEWyrB/uDTb7cQdhOeroO6N/IGvysLOifX0pRUEVmDF
X-Gm-Gg: ATEYQzxMmh18/8rhsz2DlxgFAP/fuUNKYhh5rdOxTFHjdz6ow7fZP6orI35KLcoUkOT
	ZHAHETO48JkhiIwsHLSXaK9xB9JSI5/bbA6VRMAKnhO39WMHl2P4HFnmnl739JNoH3zKSGaCSrG
	ciTxv1HBCJ1LTe/r25kTOmNxbonzhbE5/YyjgRANtMIBGWhgcNzf4GYUcu/EkEF/Er8z/awC+cp
	IF7yaT0/ezTet8MdoSGBywf6WnwCT7j0CU3AwZ69DLqIEO9onCKJ+ygbku+pOw/t1I9zD8zcC9Q
	DqCBwlNwgTdVRj24+/Ufq6J7LeMwyTc3ARrJIR7mn945DUPi73V5quc/1oMR7w88EyrOtOFlbl/
	pB6TUdzFEipiGlOdN8Cm2DIxjmcbTBFn46lS2s8jooGIasRf4AyxV4UY=
X-Received: by 2002:ac8:5cc9:0:b0:50b:3e11:359d with SMTP id d75a77b69052e-50b3e11376amr230485341cf.26.1774356834093;
        Tue, 24 Mar 2026 05:53:54 -0700 (PDT)
X-Received: by 2002:ac8:5cc9:0:b0:50b:3e11:359d with SMTP id d75a77b69052e-50b3e11376amr230484901cf.26.1774356833604;
        Tue, 24 Mar 2026 05:53:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b85082842sm3145304f8f.20.2026.03.24.05.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:53:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2] soc: qcom: pd-mapper: Add support for Glymur and Mahua
Date: Tue, 24 Mar 2026 12:53:49 +0000
Message-ID: <20260324125349.2380904-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMiBTYWx0ZWRfX1zUFJdrfmAET
 bgZyC4ujaJgae56ezSFo+pTvst/+XVS8mE0aF4NU2Jh3WcCBNiJ7/zCL9Vm8DDVwY5htKZyp+Hg
 KyJ6Lv6e7cCee7VR64Ab80CBXs6QRXn0AGiIZTUYgPQKSv8J6QaBOljf+s1OZxuDoT0MPpDDGmo
 rdMZxxAq/ZQ1FQswOKbn9mQjaXRun1IUAAFuVAsGL8+qjdpJto1pt/nA7bnVrgpy86aSMLvQifk
 jsZAxpqnO42nnZIUAoMAyGoIwDDkIBLSJ8LeHpOG0ibXyc793TT0eEWGxi69FNVYdr1wCEtsVzD
 XtJRROBDt4TI6SCoQwg3U7EZgb6gkCon8wIVQmCb9oagB2THakudYBbgieGmM9GP+vUl87kF2Xr
 6nVsidDc4I+IHgFtnrk69fiqCfVVpV6IL+xfZ9u9iwJXqjhKmzlt8Y31nN3KuQaULZNsWWO9EYI
 0Y7DSTjxgatcmyLfokw==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c28962 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vkeaxTksR_espY9HPyAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: e6CUv2i-qLkn7b46KIi2N494taO7SVlK
X-Proofpoint-GUID: e6CUv2i-qLkn7b46KIi2N494taO7SVlK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240102
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99651-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5505308EB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Protection Domains for Qualcomm Glymur and Mahua SoC which have
both ADSP and CDSP.

Adding this entry to the kernel will avoid the need for userspace to provide
this service.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
Changes since v1:
	- added Mahua as its identical to Glymur

 drivers/soc/qcom/qcom_pd_mapper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 05e66c497691..a18cb56de579 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -360,6 +360,14 @@ static const struct qcom_pdm_domain_data mpss_wlan_pd = {
 	},
 };
 
+static const struct qcom_pdm_domain_data *glymur_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd,
+	&cdsp_root_pd,
+	NULL,
+};
+
 static const struct qcom_pdm_domain_data *kaanapali_domains[] = {
 	&adsp_audio_pd,
 	&adsp_root_pd,
@@ -571,7 +579,9 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = NULL, },
 	{ .compatible = "qcom,apq8084", .data = NULL, },
 	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
+	{ .compatible = "qcom,glymur", .data = glymur_domains, },
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
+	{ .compatible = "qcom,mahua", .data = glymur_domains, },
 	{ .compatible = "qcom,milos", .data = sm8550_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
 	{ .compatible = "qcom,msm8909", .data = NULL, },
-- 
2.47.3


