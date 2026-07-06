Return-Path: <linux-arm-msm+bounces-116944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c4gpBjPWS2qPbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:22:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A14E47132C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:22:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AIRKnZtl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EByXjI+3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116944-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116944-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E7D53650BD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B06C3ACF1B;
	Mon,  6 Jul 2026 15:50:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE839989B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:50:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353005; cv=none; b=tDTU+TazYE9vy25r+6ASz4AsZD2E8nEexz1KaOzWy7LI9jeApJEOxQrYEtMz///VaZZY4tPH3+XF4PccQzLKXqppo0W9KynEuY8KRA1uBbvOcZdaMRVOj7qbr1PUNc4Gvm/DRvPRYOHFmAKfZ1XwUHOe5PW1hj5rkLwbzZonCaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353005; c=relaxed/simple;
	bh=DsMr/DRFp1u0vCAZTZXw+BUTDRJ2TZbUv833+N/R6zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRuI6xbCc/lTb5dyv7qwV7tfVqPiHx8ilYs3zMZFTHieAwyxwNUrpa32DE/XwOIsKJenh/F4cWCgmEOOkz06cYun7M3VVLozm0/BvOZFLYHm6fVRSVt9sh8tqzN3+5D0vPmnRZAoksOG+EaVHCRr6n5U7poP/lRyPGgWIfVLplE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIRKnZtl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EByXjI+3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF42P956793
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lvZd4fiDEDYJ2EQlmpPTs/ASRqu/hLKj3IjSQJEhIE=; b=AIRKnZtlMA+SDqge
	+p3oDl/sSLDhC37Q3Rgy2zp88cZezpOJAgEOBud6dFWfiTb+VV4IDvkcDR0j6OKU
	LwxxZJh/3dA+B2pLvDxm11g1Jzn9B17+4Lcj4U2Z0wTyd1y8Rg12tmVskqv3HXDN
	69R5q6WGTmgYTO3Tt8HUvpJLRwANishJFnu6Jsop9joCsNcYXwgGIVb0je3uwxUl
	Hb3+nya7KudsaBSP8JKSU/1MmjoArGHPHlFaQvnoitGSgl7EE7DRXoAWS0fNLsz5
	SUur/LgHj14DLTC3oQwbZquMGCGXmrgL9C/boZ6znazk0ab/O4Sx2m3Qe6u3Vmfv
	/0gOvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891usw8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:50:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e56b2b350so645620085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353001; x=1783957801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lvZd4fiDEDYJ2EQlmpPTs/ASRqu/hLKj3IjSQJEhIE=;
        b=EByXjI+32B5YNw0JX8nHBiZLcWTFJJ7pEV7k/CphhfmXeCKlIuIcmJPoAjQdYEzx4F
         H/b29dInfZGazB39htivK+Mptt0A49dL83+t485XXscyQZ0t3JPGAoafScQa0NzZBFYz
         C3ROgUDT1ER5Dy3FoQVPYvDkExUDjtVoEVzzGRHX9Plk1u0f/upa3Vgk3cOYO6/cZDUs
         Am7u8uR8xNk4n01/F7Vz/rQ6vdxvZwRVCZ5PY9iMWyXZNbuv9W0upSGNE+WTOtZKfaVM
         V4CntCaY0zgfl/vVLyBVDC3Xomp6fq1vOw/1lSyY9hYy3TKy94yoRwVLY7PYtGcYmbl4
         mUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353001; x=1783957801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lvZd4fiDEDYJ2EQlmpPTs/ASRqu/hLKj3IjSQJEhIE=;
        b=joDowapWcQr8elqimxpfzI8HcGDITS8InWFjpgrTAQGHX6v8zXO3ahfvuSb4Nup5Nv
         fVj4PPQZMDSqg6Qn3SzeAyZgsEU4HWQ1C2Wra8dYys0Iqd6gnOPt8x7eyaySTwlhwRkb
         /zVKTsaABUFH13nIIjvc3rIQKb5iUrcKOgBSEXa/0lu5UxZgzkr8VTsn3gYH2geWRhFU
         sFPaR/nofKxRjLi/rLnkQ3/kiKMBDBm+0t3FoZuQvMFbDw6APo+LZ5XY/UWpwymknRu9
         d4LrpXN/FEwusNjYnyHdObRTKBqDvSTRmzTGidq+u4MiIjgtb8D9Jt6dslWMxeIS7jZv
         Eofw==
X-Forwarded-Encrypted: i=1; AHgh+RrJE9k4vwKRSGObdoJt/5wuqSuwldQ0w1N17xjwF4mA0/G1BVUrMLRU+11291Y0cBFLjs71M+Wgy65mJPcu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb9YChzLE4L/+R57B7XTk9AIWGFnVaf8YV3my6dNuc9WNP9itn
	Fp8LRUiycxY8a7iHZ0T5z1ORaYB0j7TtLStOsU3PwqBEvwl0b0tMAvd3LDrHPhGKmKHs9TVwlcC
	cEBSuLMT515CCTsYBLBjM7qQb+JK+RpK1sKEd9jeQrfRKl/C/+nbr3jk03K+pG83bZZ6M
X-Gm-Gg: AfdE7cm/taAxApcVDrMoXYL0V1j30Fu6FDtc2RYV2WMd9AJSwKIFLuaojDF2h4d/KHE
	xgb5uPkj+3Ga+/3cSfs/U+jSUWD6TioYIK40M2CY0fev6334KXlAZEhnZsVVbyHruEcxjsOJA3B
	mFPokCGaSdChKenLU124y+AvP7zS1AguycYmBsdrPkFfGeAaLN5zl3LXVRgSSbW2fTcIcVW3Nkq
	rbzhtEaw60X6SoQUpWurvELw2CBsSnQRKHPPr15veW+tUwIZMjc7D78grjuh3L37xjIKL7amQPU
	IY6Hh0lv4Khorxi4EKyq/j6xZy5rFJKDhrObSmA2px+J20t4JyKH+0RemBB+fHc9Ruuu65AFW88
	z3sresR0fFGmK3MS0OGUSaogxAAacZsB0lma1VQ1I/J8efNDMmc2voVvp6eRB8pfTu9VIgO1oLZ
	sNP1D8IiEyrtYtWKy0Drh1Xw8t61sThxERehf9luZDEqqE8WY6CTo9/IfVtA37sNY=
X-Received: by 2002:a05:620a:6f03:b0:915:9f87:eae6 with SMTP id af79cd13be357-92ebb557801mr169795385a.42.1783353001120;
        Mon, 06 Jul 2026 08:50:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6f03:b0:915:9f87:eae6 with SMTP id af79cd13be357-92ebb557801mr169787785a.42.1783353000627;
        Mon, 06 Jul 2026 08:50:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm801997066b.37.2026.07.06.08.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:49:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:49:55 +0200
Subject: [PATCH v3 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-monza-leds-v3-1-37ea8c988363@oss.qualcomm.com>
References: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
In-Reply-To: <20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: qIHrWCoZZ5Fqyt7X_jkJijP2K-vyuSnv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX7VAAPchsQRec
 TMNmFOcmjhy5b2ugRU2jH55NhVyUI2y51D8/ghzAfPhlaFuofqoYEZmG9d4YX2S0pxf5oGv1c/x
 5MJnZq7wg+i1e/zw1D3G+p9MMZv0his=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4bceaa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXxJ63Ju+Hmk0d
 ZLdmoXIVyaRyar9zvO8TEe1OFnS0vecoQ5sAHFpdA7xCjAtHgwhjRf5oDRfTCpRtX321UZcli8q
 jipv/9KiGwBI/6t8mSoitKlrZ9a6r0F2VT5MN9j5uR5zC0iJJEOU4xYnLyZaoeDyCNZl9ZV7Sxj
 FGAH3ad4Kp5zwVdOOc0l0+bh7PVp1U7zgMIPJc7wuF+bid7Wyyc0T68pUKk+FbH2MYmyKEuw8Zr
 3KefHsdKStPgc+T/RXHyHO8g2ywDioFOPrcym0vpoSl2kTflU2LaMNTA9C6d4zOGy+XcN7pIB8K
 Cgv/6F/vzyTLvaUCTZeTXebZH0hbPOAg/CiLlVUsW2Fl7FsvCzLOrWhiuRMUz7wJ+IFSCA7U4EW
 9RRI+iWx388dYFnSFx3K6OknlGYYOdfYSS8c/bqwcpkjk2Vn61g6uFC4epi6312eDnLOAwIsPLP
 /g5I/1Vm8esEaSBG6sw==
X-Proofpoint-ORIG-GUID: qIHrWCoZZ5Fqyt7X_jkJijP2K-vyuSnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116944-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A14E47132C8

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and let pca9635 fall through the
else branch with the correct maximum of 15.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..4034139e3f770a1035208490a9436bdc33387279 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -88,12 +88,24 @@ allOf:
           properties:
             reg:
               maximum: 3
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9634
+    then:
       patternProperties:
         "^led@[0-9a-f]+$":
           properties:
             reg:
               maximum: 7
+    else:
+      patternProperties:
+        "^led@[0-9a-f]+$":
+          properties:
+            reg:
+              maximum: 15
 
 additionalProperties: false
 

-- 
2.34.1


