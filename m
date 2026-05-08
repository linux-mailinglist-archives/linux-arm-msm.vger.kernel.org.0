Return-Path: <linux-arm-msm+bounces-106639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC1rM+e9/WmOiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:41:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 230AC4F52A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B7DE3010828
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD1E3D3336;
	Fri,  8 May 2026 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDASKGiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5wochG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D4333730
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236869; cv=none; b=CSqru2aZQo5YAbuQgxie7CzjQdYA7WIGOGJN1lMOTNj2tHD/YfkNeUshO7T0KAuFpk/qfxN0J0feBPYUxxOBkPkRZPoDnRCYgguVj7eE4tcU03zCXpiAG9ehj2TNS5qWk6DZ+nbBA6NxX5naNl4DTP84ZcmZRytwPyvTh/ekUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236869; c=relaxed/simple;
	bh=giFS3KGnbIJ9nQav9BA4XHkA/to082fHVKY1grUTwlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ml/nlaYPRIhknvhvujhVpfIUpJJ0BUMVcuETpEcqxIS0lFfzZtBItsNIsEUjvnU5kLlfMn3Xsv6DUQBDSPHUchYfhAA9O0MExUH4CY7ZtLiPlLZq9gQvSjZ+5Pog/YkYsIIbZ4Io3gMPo9b/oiYqit1AK/2I6qQuJcRhbj5e/Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDASKGiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5wochG0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AG3aS2771001
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=; b=CDASKGiH/yTIM4Rd
	uI6BKBUjExTo43GrD2J0i70eQWpX4dbhYzqnUdntXXFeYSGA37MuQAb7qcI8ol1K
	jvp/9/AkISc8eCtLQogfZjDMwK2rQm1PeTlwTijjkG1BfKzMYGBD7XGWIIvapY3u
	gfo7j5KYs6bCOwBq7A9Mshh2oSnn3/+UpSvWISb9cMuSDNmXAsHKS8qC4t9MFAxu
	6EB3CUGp4liYgwnPx3Je3ssWUHH5MoMt9mBhpgm069StUooZkoYaK/g2Db1huyS+
	vyx5IYlRMZFI5k/ho3xdmQ/Stxr1KRF15A51ulFZv0N+oqfrtvURfsYR5N4KGg/y
	sYhZtg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5k9jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:41:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7aba0af02so22884565ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236866; x=1778841666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=h5wochG07ZaAPyoPn9LETmtrRS1V9FUIoCSdw+Oz1xf5XIOy0yTYgBAy+1yoR51My3
         7vjTACOLsug4gksqHPMHP4+EknkjiDMEO07nfzXjLviIB/UmLkJ248A1NiCdI05abRjV
         6cuzzD5QQw9YEwV6rGk65degqXrSM3El7O9n4VYPsOv8PakWSSa5MqxSKNsi0XEVR0d/
         PrIadThIZUNlOaUEAVXTNPqiuciNvsEdpt/eb3zHDMDjCai4MErCnN2U5olXCF0uQtj9
         en2BdNxYzCcbnbHnYWvXTbzR1jhDE3unm4IFTG5VyH1e3YQbTFxbOg04L2zzSrZC5VRp
         5geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236866; x=1778841666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbZa+AmXSd6Sd/9B7JCmQ8e7SigY/d1LRiLpvpa3tO0=;
        b=HVlJDBKi1d0hmHh5lGoFX6EXRCXnxGqVAGazauLUDQcSsgHTNcglD4BI1kSy0HYWlq
         aljLRgxN9p/D7bjM9ktKBmByw7rg2s51oj+NKSAnFzhIq168Na8QyyVySSqYwdE3jgpE
         7VzMn4RBPs3EGMWlMzwQTQdfGkBxy6lVcZ8RY5JDHYGSN7MxnYOtAWTSEwuAwQLKe+yD
         b/5NnW4ZeKyK7meQBj7Q0axtEXKkhi49YRBrNLRgxvkIkS0p6+z4JK8nUt/EMFzWIghV
         XVF6igrhQ6ugMlh4ZrduIKxuCFATlEoksuuT+MWIHyEbY0237Ty+zeul6ytbPifgRJnw
         6qGA==
X-Gm-Message-State: AOJu0YzVn5BIOFRK0kCSmPvPwJlP5zj3c0lRgaGHRFCovk9hWnumw7TW
	qqtjJKomJ8oEtaplFN2jYhNfseydKtZ6Ch+0XD4k5gVvsWXz7juuWdT+iqQshA4O0AjWjfigLZR
	K93mqETPP0vgdKTr1x4nV5/kWY4uspW7x2H76bNIadi9NgXGH4fSCROeU8TjueiQIwsD1
X-Gm-Gg: Acq92OE7eoly3FwMPYw13p8ZR/0hLVzwwtnnxA9Q7PwEmAWhELU3oHZskhTeSOfFdE0
	IW/ohp2FrR3Jht259t14Qft+fo/piaKbqCUz44yPNhKo1b/XJyAB29S4Hha0O3C9TqUQ/GwK6uQ
	gixi3KVSzzcMogfJoh5XKIA3sg+h45qlkq4lpbs1YL7QHm6OODRqMdkA7mVNZbv/KvqgiofENK0
	/d+29SEdxO8mFo86Y7IB2gIda6LINdcLQq4OvVV6AaL7CcgaR1VOssm92xjIMI9701wjA7ZLLTK
	PbA5M3dr3sQdWDKCfOfQXCylbTQPKsSVW9IUuSZBET3HzjAarjxw7tIlPiOnN2md/+dkBxy16Oc
	54VlyuYYcmc9miP9upiVMQkJVdD99gqXDWhPpPbxA06qYQ2HJets=
X-Received: by 2002:a17:903:b46:b0:2b2:eb9d:1648 with SMTP id d9443c01a7336-2ba79c25ad9mr125285265ad.37.1778236866108;
        Fri, 08 May 2026 03:41:06 -0700 (PDT)
X-Received: by 2002:a17:903:b46:b0:2b2:eb9d:1648 with SMTP id d9443c01a7336-2ba79c25ad9mr125284505ad.37.1778236864680;
        Fri, 08 May 2026 03:41:04 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:41:04 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 16:10:46 +0530
Subject: [PATCH v3 1/3] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-1-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=941;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=es5ERD8ECRizLcUcsRpPU+cL6+81oQXVvOctJZKt3TI=;
 b=U2a4dLYSXAvarX/C8jN5yEh68RcqOmZMofFLwdvwHMuR2pcZ1nNq7RGk/EUN7ufyXvH1cI6Yj
 CuQHzWAzmFmAICmEUJTE3JEiNw9R5AYIldY147y1lf+xfpMO4j+j9Z1
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdbdc3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=69wgM2fLTQVZxHge9JEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vL0a0fv5lGdvvmP56NDGyqY-LWOgF2gz
X-Proofpoint-ORIG-GUID: vL0a0fv5lGdvvmP56NDGyqY-LWOgF2gz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX7Hhv79PeI/vQ
 2DVPMGoMureUGOeBkTm+T3Vl/4BX1w85YGSzudmK8Gm24+IwMB9dDMKSLD+LPE7DAPIHQgtgULx
 ntjvoU7jn7LxnlwZgAdNg/542c0uXcTrr9zySubdV32ugybzUp4U+hX/kiyBP0Xf/Sv+DVfp6vO
 ptFHSfrdh8W+mAegTvZfk7y0e6O74Qa+gNpGrTUl6WkP+01qZr55bqkhChrQdIIyMOgceaKFBVE
 MWYo13uRheNJB3h4HPuzoSt7Fozk3SPhbGXygdMdV7ojXtje2TuBx/Xo78ASNXoO01fP0RFD5sz
 YxwBdU1/Mzdv/EMZQsy9Zh4XtXxsYqIFHOwQHRaM44psrO5Coh+WAjwcmPKFFYoMLJ4gz+Oi1SX
 pKMW2YjLiJFg40Ro++x1JRoUI9Y7ZDfUBTudIj3eH+5s2A21GOWX+gILf2oDOzUVbq2DPoJ4YLw
 QpmFXH5YcRbUJe+hjPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110
X-Rspamd-Queue-Id: 230AC4F52A8
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
	TAGGED_FROM(0.00)[bounces-106639-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra rpm-smd device.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 270bcd079f8861d6bf9f3058e188895af33370e1..bd1d32898461c48ebbdee8d6c48046a08e39cb0d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -57,6 +57,7 @@ properties:
               - qcom,rpm-qcm2290
               - qcom,rpm-qcs404
               - qcom,rpm-sdm660
+              - qcom,rpm-shikra
               - qcom,rpm-sm6115
               - qcom,rpm-sm6125
               - qcom,rpm-sm6375

-- 
2.34.1


