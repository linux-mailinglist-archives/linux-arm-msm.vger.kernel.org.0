Return-Path: <linux-arm-msm+bounces-115763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bZwmDudBRWoX9goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:35:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C767B6EFD94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:35:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Er/z7OCV";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NY2Uf4oB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115763-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115763-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C081730038CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5C4374E47;
	Wed,  1 Jul 2026 16:31:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2214B37204A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:31:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923490; cv=none; b=pws406TNUCuBxfLTVnpsTWoHrlkJjvQD2Yif7wI6nJCy4jVcYlZjXuvTumEDlVLnpEe1ANQ1/zmCai2GGCkE9bo+CFpyiTO2d1lYVptpEcHbRmy//vqZsSsI0j/yyN2kb9f3VoKYEqbyWwXH29cCirnKO2GvJfMWc3+OezcR0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923490; c=relaxed/simple;
	bh=+IFIH9d3CkfMhObVeF3TnjI0F5d71QrfUvNNjuEOnfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k50aXsbDyFWNeB3B9AyGazhNVL+x6PczYyIvBUFkOZui2iqIsR2PqUF0OIYWH8BUIw6gQFuXxLGJLQX/2UHXSDrj0TDnzvwoUeUta0Sas4S6dGNDIn3ksnGXUZ2UVrM2bK3UGvX8TbeSftq2d2nJ1sxJPbd+Wh9AC5ukXH1kfVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er/z7OCV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY2Uf4oB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoTLx1532985
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4GFFBSnBIGZ
	zXosPAmsEW8orhKAg2hiCe9AMLpTKI0A=; b=Er/z7OCVubsGwWRCiub61ff7pWR
	xGYtXwHM3FxLf6HcIWWqf7FTAGFBVhxnrUg9nIXme+bCsJ84LMr0kWVKglaDAcFR
	WScDGBMOv49CogPJHEJgEhSC8XT0+UpsLqjN1hWDFsA+ufjThsPTBEXEtzzHIsQk
	jPwLekD3THufisB4SV+ca0aiX7eHdQhbHRG4epD78sL6zrT9+wbg3G0wGc771A9n
	24nvkCAyCw4YHQAotrPdrfz/re9OFtna2U5J48eiBcQMT5Vb561sdSeNNYYS3e5M
	VmbS7JuFnMebc+j17UFJLVJaZESDCLPD+smHUtGPF5ysH+vnRQNIZkq29iA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0tjhng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:31:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a1912d5c85so732690e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782923485; x=1783528285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GFFBSnBIGZzXosPAmsEW8orhKAg2hiCe9AMLpTKI0A=;
        b=NY2Uf4oBh83mPWSqUDlBLk871P9IppehF/x39QS0B1ot9BDHYvKn/oaxVpaLg6Pv3U
         ppyaYJU18KAs42uRFeCsYwVs+T7RUoPsLgOvGCrpBOBurMOxZhw8dkFibeeSxXLDKw42
         j8n7GUIU7hp6yuZ+OfChwYkA8F81NCHLApsmfeoUQK3h/h3wsh3Ei6D6sVR0BCafmZRg
         JDF/YSeylf/x4RI4/4uesZ1g3sYbLK99sU+O+W0sQxyAq1FGg2e721LzRTB8Vfmm1btS
         S+CT8zba4g8uB7VBk1N9Y0xxZZFVOJRmkD3G0nFT0t0gCsD2CfaBvAL56dHiGSgoHvxg
         I2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923485; x=1783528285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4GFFBSnBIGZzXosPAmsEW8orhKAg2hiCe9AMLpTKI0A=;
        b=SDUocAsG9d5VcXW/D8FtVEKZq5aKtFof96AWzbImlNu45dqkL8+uMxMzB2mor9SmeP
         Pu9dni9okQzQUiSlue2dnJbNd1uyrh6TU4a5bDKI1GsmqNH70REWuOMGxe1Wpu0LZFA/
         +B5TxdGYzM71APWHZNm1DmrxN3ct6bwxO8UBDBJ/GrRiZS90Zf5puIxQgspeYswps3+d
         gzGDklpqR+AtNvu9uW/aLUWHBv7Rfh6vEYVtrudsZQp6cWhSIopATeWZ/8ZstiLCTfWJ
         uLKCPGWZ1QhRjvY69rv72dEIPKZgzR4YSnS3s7TOmH+/UQkaUFENwqcApTzbVPtcnJHI
         qP/g==
X-Forwarded-Encrypted: i=1; AHgh+RpS6P7X/2OOfoowCZ62j3AcaOBAbXdjP1wTJMfnBY6VZD7Rt0QbxDJZT7JqCpyvXyTo+wXhK7vUbx3HUNcI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5BbMAlbqyTozAik0c6kbt7XGbCIBbIzggQrPIs3FCwwXGRgr
	kciKvr2B3/luB6UhGGGCRcKGGG8049TQTcKoVZEImqMm5lrBYfJpP6j+BPugFUA5nLKHJsuXVqa
	Epjl/8NwaTrM+aPtg8m5rJT/OH3XUb+AcFn5TNoTMBDdqu+r+v44u73SZjd+2JhjsK1nR
X-Gm-Gg: AfdE7cl+rH35En8wuU81t+EZ8EHRftQsHDARAjjQgDMdSiln7MGyUZsRZk0g+GZZLXo
	2fZgr6nOuSufjG/OD7Am5e3LS9Y5kX7sPn0OmKl2njIbdNPtVtEq4ergUOqHneOsyen3X58na1q
	4GKIuWSjDclUjWKFxjZvaVJoiG8UAO1yNmxXWuG/I7AZS3H05eBfox76xJ8fTH383TDnZjawaDU
	cJZDXYNNjyCRuKpkDHE6GUVgpbjQGuhOav92mhlf2VQ9lpcMNK6+QkSkjoNY4sqZ9b3Egb077vK
	KpMjJftpO4/H0+57YbwcmzbfS9Uyw/cSSvSfDv6Mf0ae98nEBkK0FvyzKPayAeNXzAoqK4G3m7E
	qdcsheg8AxcsFoNL2YXdYAUZ1
X-Received: by 2002:a05:6122:6e05:b0:5bb:eebe:7ffd with SMTP id 71dfb90a1353d-5bde3af4498mr766226e0c.8.1782923485072;
        Wed, 01 Jul 2026 09:31:25 -0700 (PDT)
X-Received: by 2002:a05:6122:6e05:b0:5bb:eebe:7ffd with SMTP id 71dfb90a1353d-5bde3af4498mr766159e0c.8.1782923484565;
        Wed, 01 Jul 2026 09:31:24 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm1077874f8f.15.2026.07.01.09.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:31:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org,
        sibi.sankar@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        quic_srivasam@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v10 2/3] arm64: dts: glymur: Add LPASS macro codecs and pinctrl
Date: Wed,  1 Jul 2026 17:31:14 +0100
Message-ID: <20260701163115.3701298-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701163115.3701298-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2eQl1mglWni292ccSF5mu_9hKJCNk5rp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX+JOb0Hk711zN
 vnpNc1MjDrQd9r5ag43CUmPNuJOGlHZxmwHAZvoPnSLMfEWgBWjemKF8Fe9H2veVP8tyjc8V7IK
 cVEVaivYclHSb+nvyVIVr+bVK5zSbZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3NSBTYWx0ZWRfX+/DRQpOFVLU0
 jLeFF4D4IgmlTFy7mLfcO+2PHVFuKLwncRHwV4JpoLzCiWhxaCTDtAScOOR0ktcs70i86xCxrVV
 yH6B5QX1a/RwMyugBxKsKPjXQ/I3H0O+/ZWIOQrV/R2Rf6GXZN1FtM33JbrLRG0hbufdptUB+ZE
 qLh0GENZdVJdmZ9t9Yj+g0u2XsKDqyYHrpCq/L2gVfc4Q3vyo4CWytgwDyd1zzBtUX9/5a7aARF
 YOYZDOCZVACZAn6Dex55UIZzZiRERcWW4EDmopjTKcMStMg2cl+s7vXiG5ks7ENghXVgQn7K1qk
 QCrYXi1vFGSup0d7HyK0xHa0WJSzqjawzrVxiDgymJ/NyvDOTjVuv759NjQxfgeIs3VyAdhzRov
 g8Umude2aBv+utA6GStrVbhUIJjzx399QxLJ0ptQygwH0TuY9Jmxja5Avpb9BCijTmIB/RI192r
 eBNN8QgT1IlfU68y2Jg==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a4540dd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mx1dUFmayEYO8tNA33gA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 2eQl1mglWni292ccSF5mu_9hKJCNk5rp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115763-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:vkoul@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:prasad.kumpatla@oss.qualcomm.com,m:quic_srivasam@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C767B6EFD94

Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur
for proper sound support.

Also add GPR (Generic Pack router) node along with APM (Audio Process
Manager) and PRM (Proxy resource Manager) audio services.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 263 +++++++++++++++++++++++++++
 1 file changed, 263 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..cb2a2d3500c5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -20,7 +20,9 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/spmi/spmi.h>
 
 #include "glymur-ipcc.h"
@@ -3903,9 +3905,138 @@ compute-cb@8 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x20>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
+		swr0: soundwire@6c80000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x06c80000 0x0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+			label = "WSA";
+
+			pinctrl-0 = <&wsa_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x00 0x00 0x01 0x01 0x00 0x00 0x01 0x01>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x18 0x18 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0xff 0xff 0x06 0x0d 0x0 0x19 0x06 0x06>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0xff 0xff 0x0f 0x0f 0x31f 0x31f 0x0f 0x0f >;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0xf 0xf 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x0f 0x0f 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		lpass_wsamacro: codec@6c90000 {
+			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06c90000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA";
+		};
+
+		swr3: soundwire@6ca0000 {
+			compatible = "qcom,soundwire-v3.1.0";
+			reg = <0x0 0x06ca0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa2macro>;
+			clock-names = "iface";
+			label = "WSA2";
+
+			pinctrl-0 = <&wsa2_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x00 0x00 0x01 0x01 0x00 0x00 0x01 0x01>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x18 0x18 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0xff 0xff 0x06 0x0d 0x0 0x19 0x06 0x06>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0xff 0xff 0x0f 0x0f 0x31f 0x31f 0x0f 0x0f >;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0xf 0xf 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff 0x0f 0x0f 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		lpass_wsa2macro: codec@6cb0000 {
+			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06cb0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "wsa2-mclk";
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "WSA2";
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,glymur-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -3920,6 +4051,138 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		lpass_vamacro: codec@7660000 {
+			compatible = "qcom,glymur-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
+			reg = <0x0 0x07660000 0x0 0x2000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_tlmm: pinctrl@7760000 {
+			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
+			reg = <0x0 0x07760000 0x0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "wsa_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio11";
+					function = "wsa_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			wsa2_swr_active: wsa2-swr-active-state {
+				clk-pins {
+					pins = "gpio15";
+					function = "wsa2_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio16";
+					function = "wsa2_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,glymur-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
-- 
2.53.0


