Return-Path: <linux-arm-msm+bounces-110403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFNCFO8sG2pa/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:31:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA58F611E06
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA7D430BB1DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8E83955C6;
	Sat, 30 May 2026 18:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hb+nW6Hz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4VYxBi4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892C3AB285
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165688; cv=none; b=hC9Kst0xzTmtFQsZH+RN/jUVhMMc/8l2NHF32PPN+bBQnlunlcPHKt+dzyOaYBBSUimA4KgIulsPU1jKwQMufl+I1Izqn+Uz/WHATx7oKAmiV2e13cqbIDaO6MJpZLkZEL9pqBz+MczNsd+EqUNuKS+hkdGjEi+ak+ILLbKOpAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165688; c=relaxed/simple;
	bh=xt8fdY5E19585IRxlf2tv2dOaGtOy/UcGSJMOtFMvaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gG3ssaNWu9cHqgJPGNnco8JM3wQaCXXxMxpPrG/1n3NQMRjjONRDHbUSXx8gEW88sdIRdKJOh0MaHGrjDTnPp8CVoNbK8TyBRPWRFVzGGK6M0KJQidmgPLU0+SywlhtQ/T+F4uRm/xqa7c2wXvVggOUh2aJZM9eadzqRLeNYMbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hb+nW6Hz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4VYxBi4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEPf5r1796972
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOu0AHZCj/AqL2PiuNRn2hpGRFubVPT4lIfFRQyrc2M=; b=hb+nW6HzBo6aCPT8
	AFWEK9qfbgYfr+nQ5QZoQubMiVtcQLZbqHH2vYpq+b7n96c+3As720L+eaLXD/rw
	yiV2XghXgKgBRaU5xYS7kbFAIws/lyG+IdyNfSV6fMssvMhQ98IxcX9BGdYXzPt+
	47BBqm7L1W6kz/BONgAoehEWqg0cOuGOQKqoexBkkcxhK3t+yoVTkwoFse2EKqsf
	uvJgSc3cuWiabe0bzLvBH1xEbhVNSYqMLhJ2R2wjJHCEaAtEwsW+o6/1S7FR3YUT
	0Gw2iL9qbqcV/MKjzAXr2cjHoh6DmdOyNmrppN4eCHcvMD13F6N5gnId+BKGvAyN
	e9SY9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7hw5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so13806015ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165686; x=1780770486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOu0AHZCj/AqL2PiuNRn2hpGRFubVPT4lIfFRQyrc2M=;
        b=f4VYxBi4QXIuVFatOTji3aEc7iswGE083B0DsSITlKhO+71bCFoQ7TjpNzZY5ox1q5
         n/peM0zi0SAV2O3ppjJvYHU7W9JunuqZDwG9GeAaCunQwjLsiOkmmiIXpvLehxTLvztu
         V419bIMLypP/0YqVV/KsYfHhIz/3nfwV5OCmbZdpnOeS4V4dpeTFFo5zu9DZ48YAL+xo
         ySrml4sl0CbkVJJMPw07lrM7mtI3N3lHKyuq3ORBTRIEeppl/qbS8vzozy3E2R73suk6
         aDEVu5oEh/UY9qEVSG/uWmkKKevkf1nxmhvDWwInPZTnp7d6ZsIG/QMWD6YGQ5LOP0Rg
         e6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165686; x=1780770486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KOu0AHZCj/AqL2PiuNRn2hpGRFubVPT4lIfFRQyrc2M=;
        b=cOn/ADcV9aFvl51AWxW9O2MXwxUbGpYUrCKloZQ/AU4ThVvTMbLJOVglDOVEF4ulW6
         PgqF7oW/5DosRYFo5GL2UZ350jPdW4dkvBYkvSPqgKfp2saDa35sbiQ50gPc5a+tkgDA
         yoBw/EhG22lGlQvhzufPsUDN1Qzd8put63YAqAuIrNzsh0KsW9FDN3gwOVM0ZuJ8xLfg
         ffV+Y69OnmZQhv1pDVqHOYSY4tF4/izj79AiNl2a2t9AgYy+hcoRSSPpIYjjEKA1A3T9
         xghwQ+k8jJzu58/KcNo5eThm3U/aGltiIu4q36lyBufeINSd5wO1y8S/K8mOnzBBmwZd
         EE5Q==
X-Gm-Message-State: AOJu0YwVkm0SXd46+U85d0I6eVUz/Y4T8DlBXx6hVBz0QZkvmNlAoKZX
	gaR5D4v80eUtx3KjdNPi3LdzO0CFrJ2UqYrSsJf+g40SiICT/BHcc34EgbOBA8R4VYlPhPDHd1i
	xMQrJ58GomfbPwVB5uFkEQyObSqJ5p39yBmevjgiORV5rd7/C+VIUuvhktkDznbaiXWhh
X-Gm-Gg: Acq92OFqCsdu8/O2ozjLT/qEearZJeKQaN8L3y2lbLwr12VkzlXKmadoV5ouNY4JqLG
	CCJvOoiYcI+HgFY8e262ANmiP6uQQl3lySNxziXpKZ1YhmOHVZMRB/CJpcAwaCYpPP2ScNKn7dS
	yF6ELnOtGB11ypMi8Y8ylBZ8LvnaOOGKaX/54XA3b/NWT8HnASvcX3QLcS++uWApAp7ltua/J6H
	Pz7Fkkxn6m7XAOTLKxy9VGjDMU+v9hjIQ4nc7OZelo7+SySjOdKgPFshlBGFqGK/DCPELHX8wFR
	DmctdxWvaLOTN0sy2ip4NOng9Te7FSLkukXVv8DX1O74ylQ9yRnbe9xTarD28gJXMWD7Nssxx7v
	o4SJnL/YFlqy2+Wt3LUwDIbkcdrUp35lGoqzWnYLsS3Jwmu0=
X-Received: by 2002:a17:902:d58d:b0:2bf:2e93:c624 with SMTP id d9443c01a7336-2bf3686777amr51626475ad.27.1780165685879;
        Sat, 30 May 2026 11:28:05 -0700 (PDT)
X-Received: by 2002:a17:902:d58d:b0:2bf:2e93:c624 with SMTP id d9443c01a7336-2bf3686777amr51626215ad.27.1780165685449;
        Sat, 30 May 2026 11:28:05 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:04 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:20 +0530
Subject: [PATCH v2 02/10] dt-bindings: interconnect: qcom-bwmon: Add Shikra
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-shikra-dt-m1-v2-2-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=1062;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MfVD9NAJt+YvcfkJInifeQ/jWKYZMhdr3T/JUeWSDbk=;
 b=JfFkzKPOnxwJefF+ophXm/+6E3kPCWDQLamcirvNXm5y2bmtoWo49z64nFfax6b/sazioFKpf
 /V4tvER9/JMCoFcXKnc0dKFm5uw8jict7X34IeJuXg1bCBw2ue3Whgb
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: R4fc0J0uydU2GC_jJahyF5p0TRVhOYKf
X-Proofpoint-ORIG-GUID: R4fc0J0uydU2GC_jJahyF5p0TRVhOYKf
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1b2c36 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=s2Q_muabT7T23weRVv8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfXz1x4WPrn3kED
 uX0hLsj7c6xotdg61QTjJs5NNoLY7BCIZpmYB4A2GU8Omsr4RDhJ3SmUvdnHk7wwckIOZo1jSYV
 22JlXmFXopEv+si3f3aGWibs3md3gba90K9Yl5eggVDyuVOTeoKvaIxDyAbQPK8xTX2VRfELCbo
 rjSsQOxtjv9sUBENRWCU3rigu9sWdpxa7/cQlap7zrYr5JW44GV0/VW78X5BUztj+hyUlGVIKUk
 wrhKzNssKP0Tv7XhsIk6+poTG+VejsMGtle3Yt8YC9EupSLAwcyV/5g1wF22IKY45Hz62MBRRJe
 ZZgOeA6xjQ0BpUze/xpqN1QZmnXpHt1Le3k7MVaY6FwdnYzVIbe4tAjW2DgLu7lrdDmm9CPEj1/
 GAlVbVStTu0dsPS+0rVRtI/WqhUXYZ8nDtAia4yzkKOfnCH1ZR8gW/vz8dFzO4qCataEkc28t11
 EqsF+fbuAKcK4YUGI0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110403-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA58F611E06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add the Qualcomm Shikra SoC compatible string for the CPU-to-DDR
bandwidth monitor. Shikra has a BWMONv5 for CPU.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index ff64225e8281..8f6c937e44ce 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -52,6 +52,7 @@ properties:
               - qcom,sa8775p-llcc-bwmon
               - qcom,sc7180-llcc-bwmon
               - qcom,sc8280xp-llcc-bwmon
+              - qcom,shikra-cpu-bwmon
               - qcom,sm6350-cpu-bwmon
               - qcom,sm8250-llcc-bwmon
               - qcom,sm8550-llcc-bwmon

-- 
2.34.1


