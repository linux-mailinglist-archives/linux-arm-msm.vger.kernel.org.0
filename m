Return-Path: <linux-arm-msm+bounces-99075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCXpMemUwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:18:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D10B2EB677
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6C5F3026C03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD20917C203;
	Mon, 23 Mar 2026 01:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FY4KdvMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jzq4QLu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77754768
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228654; cv=none; b=opOp0sfwFqjjPDzDJ/VQhSJFFHfBQiAKD7j5SdViytvNIkPu8Zdy2Hu1XpsmB4wqUS8GrHqfZfRVigMLbaIpRY0X/X9lPRMK9L7zD4E69D6t5Wb2ZJCGh1k8PkHgzDVza6LiJb4Hkdjl8oAve/OvnMgDR2946BvQw6VnrgeOHTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228654; c=relaxed/simple;
	bh=yVthNPm3DjOsdKVYIVqko1MZL9hhEvKfRIuyqdTPA9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Af7ZxX5MQmkKqPp6LBHfZf/3grpbcWIg1vQ68NG7du1lDC2FV0nlXyurYsFfdHkTwe/5OXEuKD+Mofwx2JoBsbTfLiHDS4ooN1ybnmAmi7Z0UKZEDeotqW432SYMxyReaxOSUhjluxesLjZV3tLZtCViZH5uY/P7iR/OTKkTja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FY4KdvMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jzq4QLu4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MMv1wk2062748
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhwgxNDk8Z3SvSduo334zellR1VN2y2e+x1xd/K7O78=; b=FY4KdvMyK6U2JkzZ
	xU9D1xEGHdACm+ssoT+KUEzL3peXrb/nIUTBittNVi0y1UO0osI4qS9Xk6ZO863w
	2geJODqjgkTby9JYFqwsU8XOQ8n4D2k2PSSwPXnFj5D6W8sdNJAtzkS6610IN+lL
	qKlEY2C1hrmh9KMeLbfobH0EvxeScVnGAloHUEKcJZczFxblpYLFiDLjn879XBPD
	73xwt1KUg7NdQWQFLuucOuwpDGKhGUrOY1CuestwZgEN7/28Ns36CMTPX+8rOeIt
	FGA+GSUUUOac+SYbxLXVS1LYze+E2PjYUMPhxWZeyty4Ylu0Jd4NsWiWT3K06Bm2
	Qw4p6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kdub8m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:17:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso57630131cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228651; x=1774833451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhwgxNDk8Z3SvSduo334zellR1VN2y2e+x1xd/K7O78=;
        b=Jzq4QLu4f1Y62ctQqO9wqNGbsDQaEWpEEnEZKO3LEnqW0PqgFgAZs4bAG3j5fa6vcl
         OIbXb/+vk/TWDM7P1WmGwaB/qpZk04yalIbgs3JjbP5svFf1tQiMfvOLfmnS4q4gknOV
         NSD0TznBoRHxod1z/8yEl9jcQiYOosoaeoH1HsbPBdzsnCHFcv2RwqyxOKBOzVlzGwRz
         xB4dRweb+7JPQ6OV2j44wTxoQ625um2epp9mDvoi86Pyj7jZn46vZ/rUqxK3NpGC02G1
         VP2zJwUo6zbR1E7MgNcJr90WvAs6Uy7nGMpuH6GrhIxCah9t+BljlYr+RLyn+0mwFoCM
         aDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228651; x=1774833451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hhwgxNDk8Z3SvSduo334zellR1VN2y2e+x1xd/K7O78=;
        b=YOB3r3tqyqVwGGjFwYppftdPC3j6Rgndz9Jd/O/iZ9OLLIPEsEYjwJ+XLH1d6Copz3
         d5mW6hZfsyQE7toE+FWa5S/h8fKAeRhAyAvCP/S4DGfJxKTm02tr9uXiSwKWqxD/jzBS
         13JaVBsC7YLuHz0e6RbjwNY1UbhZVXCb/+/26qcxE2mvLH0AosEtDp+YGmYi7AHbLHJu
         wrbjexn/mi6yF6QhCDiNfrNsRXxKJz2ndx0+xJo11dCCgwV+0LnHTXnnU6GtbtEMUbKl
         cPNJ3EMEHU07KxxKlogpZUjRZIRBsNBTRDwn1Xa2lln2U9dnmhcmtWK90gOBOO6Mykqx
         HHFg==
X-Gm-Message-State: AOJu0Yzi8oerYtFeMFsVamor8ZJnv4KY/bgHGakqtn75NYb6zAcMYLgo
	RGLpk1qfW3LPSGQl9J7QnPQn/Y+3skun86fruzTaY1yNvUkZylVlTC72geuZd2245gzBtZrCCyL
	P6qR05TipTp9wZ1FQj7S2Hf2Na1xpyIgLteIB0ZHOhBC7PvMwax/N9QOFHdzhd6pJLHKc
X-Gm-Gg: ATEYQzzb0YBXKRwAywX4lU3S64ARPbDWB0GNlpIk5uYDbGxGtuE2fABcqPkI3c9KWRm
	JdudVr72GDIKaYMtqEQJaF9U2zOsBNZKQgKEJZ8Isi6WJVSo8EJbGOKpCobWa6O4IrcF//NbyTJ
	rnIGAQyNVqfJd7nKJ7AXJlWOAApzCc3ZV71CNGBzviTEQhv4NJKOdP4FbVUZwZy2WQI/O1LUGXf
	urEB13slqwXkzCgphOMno3sBYeTC1RNDle3XrjSwVsqh7zPKOlrFUzC4gh9KTGjXR5sIDloEaWy
	6mAwr78m4DcYB/OVUrTRGO2R0+9H1DydVQti1vpVRZ74f32tU4f0QYdkJORDI5cAQJbLz1Vpcwo
	uYi/IbaOrgUetw95RGHIgoPsrFOSkuTAX+MS93Wg93TfN0VnNdTLgeRls6EpmEPDqo94Akicb40
	NVYg8WkbDrFsyNZi4LT2beA5U+z80/W817PRQ=
X-Received: by 2002:ac8:5f8b:0:b0:509:100e:50b9 with SMTP id d75a77b69052e-50b3744b162mr168872861cf.20.1774228650797;
        Sun, 22 Mar 2026 18:17:30 -0700 (PDT)
X-Received: by 2002:ac8:5f8b:0:b0:509:100e:50b9 with SMTP id d75a77b69052e-50b3744b162mr168872571cf.20.1774228650277;
        Sun, 22 Mar 2026 18:17:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853050e7sm2216150e87.61.2026.03.22.18.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:17:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:17:18 +0200
Subject: [PATCH 2/9] dt-bindings: interconnect: qcom,msm8974: use
 qcom,rpm-common
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-msm8974-icc-v1-2-7892b8d5f2ea@oss.qualcomm.com>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yVthNPm3DjOsdKVYIVqko1MZL9hhEvKfRIuyqdTPA9I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJSer1NjPeJAAeCFMaqyxMwRyKlECRmJ7dvj+
 hY4+MkP6zKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCUngAKCRCLPIo+Aiko
 1YT6B/4oEXhkbm9aK0u/bRgee4XhZ4QKARH8HUCPa8uEUa2iRMNiXqId9Wppq7si1bV9u6WFQPM
 Pkiw8y5oZSoA6GqIMmvUWECOnTceC2gE97WmvfM9x+B9899/VmedCxZfzkrQ5ssN8lubTe5N4lK
 paOhSKvx0ioNCs5gNbYEReILOQmYfJchU3o3FLdEuXfvdcC1DwnQtmWK1YxVJXRDg3Tm/Aje51y
 eQOfRoGEJO35dZpkS6T2Gls1a6z+1QzQzDeuaogqYCd5hP2zFGsrsvEb/dIDLnOsYxyWYMGEQTd
 J100fGwG9/LuVDiaPGD1MdsG29SpiB8koH4/QS47m596utCt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfX0wZRSrLDfNX0
 I8lPWNGWkZu5kvHOGqAgYeenggDWBUj7fEtBoSKGzU9jj+9hEPq7VJqfWBaWdm+5du9BbGRThhd
 RM7LjV+jNf+TkMt7k4dkRpNaiuaSTBAqfwvWTTN/IgqZfGy1slIhsUYtZhfoFhta5DygVdQrhBl
 ebkl4NcnNiXkbP1z1ASopPV8h0D7OuqERvNM+M022obvP8HPqnqkDUbxfiD69JotxmIhBnp5evH
 oQLKlb9a9Vsmec9pOE7JaRqjMNS+SWsZ6MlBzpi0Jp83S8tRXCrWRJbzT9ZxmuBKqYCsmrSSrLg
 Kvwl6MnTDLOOrJQERLvWLxJ8FZAUpYAE3NylPlMHQ7rQleDBU4a7ScHJXPz3SrCytkkgcyu62uq
 sJCQHrEHnJVE6wsUq/g2sv7rmvnqkwXOj7KXSyWjNG8luvvNYu9RAwWhSzsTk4dasnIsI0QRaSQ
 tjpciPlLMqbv5e9uSvg==
X-Proofpoint-ORIG-GUID: 7p55swxIiOgQCtvfL1jgPP4C3Q52WC_8
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c094ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=wtXhX3L6yvnwcyBavz0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 7p55swxIiOgQCtvfL1jgPP4C3Q52WC_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230008
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99075-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D10B2EB677
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use qcom,rpm-common schema to declare interconnects property instead
describing it again. In future this will allow the platform to switch to
the two-cell interconnects, adding the tag to the specification.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
index 89a694501d8c..b35f6dd11c71 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
@@ -26,9 +26,6 @@ properties:
       - qcom,msm8974-pnoc
       - qcom,msm8974-snoc
 
-  '#interconnect-cells':
-    const: 1
-
   clock-names:
     items:
       - const: bus
@@ -40,11 +37,11 @@ properties:
 required:
   - compatible
   - reg
-  - '#interconnect-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
+  - $ref: qcom,rpm-common.yaml#
   - if:
       properties:
         compatible:

-- 
2.47.3


