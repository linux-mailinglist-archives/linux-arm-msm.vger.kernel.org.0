Return-Path: <linux-arm-msm+bounces-100247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFexH41XxmmMIwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:10:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 292FC34237D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3154D301DAE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324C63AB290;
	Fri, 27 Mar 2026 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCtF862V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibxs73zd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B0E3AA4ED
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606065; cv=none; b=uUpcgGPAz92ydn9HNozQWeUbHNenpn4L86/BBiJ5x0Bmo5nU9/LxlfOsE6/PFXmuhVn0px03tsu3aVUfZJrb1MSv5LZvEwFdT+/Q9dXrn+r+hEE8vtIT6sgtCW2yYpSUt4diN3fe7piqxeRfHv7tuLTJOwywwdlYnEgNwBVZ9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606065; c=relaxed/simple;
	bh=LRBZoOlhD4QhajDvi1iS4W8pu7wzXHs+aBpDePBF8k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pbrhp37k2HASRRw/3kcPkXwuCuaDk0mVuKy/rN6rnFn1C18nYmG+EIHlCH5wYR/q6IwydLntduwRSJgZWNLuTfCfLbcBcWAc2S81mAsamHXYFpnDK0U6gpcMbODPHJuhvMiJiH1DrRKwlj1JPhZMcTRn9FG74mSOeI+k+WwoKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCtF862V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibxs73zd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsO41226340
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PEZ0hX967yZ75mDXtph7mpwO8D/NCBv8vGp
	kfdjyKFc=; b=JCtF862V3MdqVf9BPNonaUVB78PWImRx2muyG0tp0vZQ3BLFdJh
	KejxVPz/2vIBZXRyJnSPfiIHbSB34Mpr5/87ND/uZeDb7+PaqvSOe6SS4+hvZT1e
	460p11RnUAQ1i2xwwVChmNrw0wFyQZ1MuS3jdkMufsbUYpY7KHJdt33VWDQdjsgf
	vcLBzgxSmX+BXSQR3+DLjCSLXNjadC+UzHM8QFHwXnx5XY92+Oo/ZeoPG/vqVS5J
	9++aMYvbLlViFrr5GGtnTH6JCFAStN0nHHiDeUCKP50nVpSrr8wNsCkZJ2hsMeAV
	5L/tH41JPZqQKdtwFxop8qOd1+jP/eB0TPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1b2c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:07:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31cff27fso20534451cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606060; x=1775210860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PEZ0hX967yZ75mDXtph7mpwO8D/NCBv8vGpkfdjyKFc=;
        b=ibxs73zdyoqRJyXedFeBbyGPTlPSmls1I7zwBKiq/tvYiDaIsPhV/fFWoqBeR10i0b
         Tv69yo+DRhO3vZvi+ue8OO3ThEFJVK/B/Gj235wionT+tUDOPonPnGLwd0S+bi/UDrCA
         cu2Poa7jL9mvKEMpb5H4z0K8xwStwnOJpBUw3dV7622CJh3PdOjuW7QEKiAZYnuB4mbM
         5hkxtNzwCA9vvP76rrVAYZIpIh5rg0mSb2UD2+OPIfGKbBkzdEGDH/1cEnb+bhefC7Ws
         4EJWLaa96mVX6cV0myOgW/96vSYNAB4oZHkStPM+5XnkrT15+S2r/qpchntLGStULVWt
         pM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606060; x=1775210860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEZ0hX967yZ75mDXtph7mpwO8D/NCBv8vGpkfdjyKFc=;
        b=glFzC1JNYB6X2HRK4/wGIFK7gEaCmxBSWQgQ/q1KZ+iFHVKfd0ei17LlnQZIupzOmk
         oWIzFGffWioL+1NjZvBiSLCHcad7HDC41pmgw0dFqJtaLKCxKfmulmpvHsgC4L+6Yh28
         /Uv/uIQuww8SzlJDUEMz4TUYUdVJqCD+Rd4zGmC2IAMqOyxAUVdQIQaDAfIiSySyKVUm
         rVTGDEz/L0ek54ZTGykhjWh3EsZV+LQ9Ry14DR+Vg5CZp+xP7eqojTYdlu12b+lS5uut
         7VFGm1H+fe6MBd8Gwaff0jpWgFqAjw7p3waAKUh6xV3aDjRtGomsAHt7F1l0XO/jMNo/
         Gohg==
X-Forwarded-Encrypted: i=1; AJvYcCUI8W12x1lkLdecNpO8iANg4BQg0RRI+IsNlnJ68EEB52D+9UJV0Axwi7VQIg+RWWC9orq7NGMrexMLdKlS@vger.kernel.org
X-Gm-Message-State: AOJu0YzIutLMv0CxOY23ybf7GNs//9s0Gn1/3RGogADJ71nXQD/EvWpB
	1N6U0VtnET275/bxP0H+Hn/WU1DpfLT037Uxu/Uo2SzMvWkBx3N7mhzCBbxfFDgQfnx9u8SifQ5
	mY3pA796GA5qJuOyyI7U2zYgSEiPwYM1BFYH7PLnsVFfcqNAr7FZkvAngD1LUhkLQEjOf
X-Gm-Gg: ATEYQzyoZ1lS9I1zCp4u9mEtQCpcpSsavmD1JS3z0s40Dbo9lLUzXkUyI75mqFTkXQa
	uB0yVOqfp4DBXqHRF1Mfqk+My3tbwypDtmVt1ZbUwU02wvh1JdcZM1Yn4m/AnjWR5DeaLO0g+ek
	/348m0rdY9gWYwuLJm2DYm8Z/nbnzWPQHJIA5vibeGvbcbpRBjTE3TGLEvRMteLybJrHfCB+9EN
	YJww5t0TdytImedULAqxr24pOWzD1DZsNqpUeLRmhaWh8LMCGzTIbteGJcbVoNSmRbLN2u2K7Kf
	V70Zfwt84tt2fQBjJS5kbdpKtXACFxl5sf1mCBMozASBK5Z3VcWEJEHl+3jmDPl1iLnVVSXEfwB
	imHvpohdTvjP906N7U0CKXWCk4XFKp05T+OhU
X-Received: by 2002:a05:622a:4a8b:b0:50b:4e9d:14a8 with SMTP id d75a77b69052e-50ba3918d54mr23626921cf.43.1774606060161;
        Fri, 27 Mar 2026 03:07:40 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8b:b0:50b:4e9d:14a8 with SMTP id d75a77b69052e-50ba3918d54mr23626511cf.43.1774606059711;
        Fri, 27 Mar 2026 03:07:39 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm138248935e9.2.2026.03.27.03.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:07:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RESEND] dt-bindings: thermal: qcom-tsens: Add Eliza SoC TSENS
Date: Fri, 27 Mar 2026 11:07:34 +0100
Message-ID: <20260327100733.365573-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=LRBZoOlhD4QhajDvi1iS4W8pu7wzXHs+aBpDePBF8k4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpxlbmK0qTX5cHm85DPSUAUuOpycDEDkTx+JBAt
 2P8bIuzWzmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacZW5gAKCRDBN2bmhouD
 13R+D/0aHkJL8+N54xEo0Mmn3l9lQp+OsODFRZUgffJh1ahcGZRzYmiBmuRdqcBceXyjdOV+CLv
 VZbnhc+oSEfVZLHJPDH71R4e1Qi2qx9SsiVdEfQStAbV6qPt1OaubtY1V4QF4RLVuYPuTYh7an1
 4t7wbUEJgy+9nlk4goaRkCw5+Jw6BHdjtfeqKgKLV5kXe40iA1YFDHFgg51I5rKGr5g09w9CgUv
 Li0rwEweMOh8EGWfb5zo/i9p/P1o+ju36+Wj9IThcDZkHI+TgeGVYpRzsdFhEF2ubjHlhPd+ZDl
 x6p7CXy/SERNq+xAjaQ9Z3P1gHOE9Qt+fmsjAWYdEPVtoWP1Zurku8xrZKjEQzsq0cZnC21ZxcN
 j5vjfOWKLcVaGgypY7bq6jBdW+VHt04hx09QVm/9MeQPExDwJXeeCTNg8CTFPTTEtpaNHKEOlQ6
 J7DM4fFHt2lxkPdHLEMOElWOi1JeMpwk1oGdQ/bpYe6khP2iIlBakRUXVr6ZbVa+4vyqhM5Ff+H
 l8KuP0ik4sFKGu1WfhbZuqDq7BpEbQ60JYk8WurFKOxxZe/Tjuv7jeed127PoN2fzkbilfSIhCd
 9OBjmFddUv+sFzGhjlpyGTHpdD6g5BKG1o9p04gvz7t4aResbKcxnOG+nQrt06Aw8bIREoC3lGO /R5a9zL500pLc4Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX48UoHT/LiYWz
 HBOsfJNcojr0sV76laxC385aSY+6PoYUJadb27Q5ld+fpZwxtHWFjCSOfWHEKZ4BtZdZFydEzAF
 4YCD8R1Yjv6JGD9CSEu2pqzvv69Njoh6qeTdg5KbY+4qhvx+JLocwbc4Ow4aTJXZN8vycDLwA39
 zc8q+5+qSnljyW5WAzduIs6wM/I48k74R+Gosry6jeQfo8f3LavTmfw1aqvhSIHfSlqX/+5CcsJ
 6xis6whJlQE/CX8JPZuf8yy+CJRWCDeOnW1N5sPDvHiav+lD6QMssBFIcc21a24eREUh5OvT/lW
 7zZPIfdJWglPi9v0an0IQcpYrKadVXLRKrK8oMC4y5f1+rzRrs5Eip85ceDCeacNGfDDNff3QrD
 +FiUA2ta73kLCZdFCdfXbBonvCQRnthRphql54SqJzrJZJcLUZh2129/1ApvXPDmgoZJTDlCdxV
 h2ajg1pjsFFZ0nW7q2Q==
X-Proofpoint-GUID: FNawB4KHlC2SpP6yZWfA-qAzSgCJAGwG
X-Proofpoint-ORIG-GUID: FNawB4KHlC2SpP6yZWfA-qAzSgCJAGwG
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c656ec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JZNZZRbEe_HiLwd6sRAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100247-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 292FC34237D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the compatible for Qualcomm Eliza SoC TSENS module, fully
compatible with TSENS v2 generation (e.g. SM8650).

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 928243cd2883..7d34ba00e684 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -54,6 +54,7 @@ properties:
       - description: v2 of TSENS
         items:
           - enum:
+              - qcom,eliza-tsens
               - qcom,glymur-tsens
               - qcom,kaanapali-tsens
               - qcom,milos-tsens
-- 
2.51.0


