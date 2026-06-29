Return-Path: <linux-arm-msm+bounces-114854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1cgjFxQXQmod0AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:56:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537FC6D69E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:56:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V5DLabKb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GTJi0KBw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114854-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114854-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C90430297B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9879C3A9D84;
	Mon, 29 Jun 2026 06:45:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926C03A640C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715526; cv=none; b=fD2Odm/llPBWW4++yuESTNckALIBd4A2+gsIP3mBia0j6Idh1ywPNhUkIM7GgZaf4PxsTCnIrsWIWFCPeDyQPyJESjBS73XcrqDYRb5xVmh+YRRmkLl/59AiTYjlNWRdqeOveHBzWTN2oRroQyzSel2tKR6hURvnGToPrQHxlqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715526; c=relaxed/simple;
	bh=xL/9qOPePtFeCrEvuk1rTnwRe+ZVfzTbrOhBn51jvoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o1vQiPlKlD8SFx3oBFpsR74cBYBma1jbblDsiVNIv2rHEnezDE1PXk+acaYWJ/bcO953M8EnvvtQA8MDmbJB5tYBsoHnPEDhjtulO6uZtRGDtEss5k/LHvh8gk/b6BG3Xdg4/ghlcsMh+vWZIWmvBh2B+fQ8NSVg2qcj7pbRwBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5DLabKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTJi0KBw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NIgB1754332
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVp9Zglg4dzVjkBcJglZFHQXwSqvRZ8fm9OhiCgGnT0=; b=V5DLabKbfoNwo7CI
	mwRJ5RlWHC8Nxx0k3rJwtkOIh/tf4YtR0cKK30QnezXRMt84jKUQE9PADCf/d4xU
	+eM62uiw8VoF9MtzLJBtv1cgYlqfUCKAK60DWE9qjaQbYa+y606PIKkL6qgV6Sn6
	fuIyIwGcUO5eeQ0WE6jeqiWIClp61eld2V6ORdKvqCIu9tWk0UKvS0QusiSxaqFS
	tTmOfR0rDDK6d+4M6B2sfSYHTMNi8eBjFQ+HV6ixH9LYFnWtfHLHtsq1wGi2sfG7
	XBaSzGQM4gcjv6rX833bJupIf/fAM52VhRWIg9rxuBEPMgcezHgjV6R/7PMorJ+y
	BkgwwQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f273354j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30e773699d6so1678458eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 23:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715522; x=1783320322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVp9Zglg4dzVjkBcJglZFHQXwSqvRZ8fm9OhiCgGnT0=;
        b=GTJi0KBwdpDa09n4hja+asOA3q9HVf/BsEc36Z7ZZ/f85NZ+GVgwBMKMycT8wnBzh8
         aO+PGaMZ1YPyPM2KwNWJCDUZebymSGyJOB/j0hXM4PdYm1GUyTZ6ih0JcUKU9ZwuWaCy
         5nNpcSZsrbQcnhyy1ir083f0UQ4uauhfVITEpqCqQDnX2VDDiHDJuqq0s/u2owQOxjZW
         Gh+3mEx4JTnh0VNNbPbCf88BJtjOa5L6P4Kqzkde4ctm+9hGJ4uwtW0cy8j82VRNSZIU
         Lr1UVEtFReHSoYi7JGFm9c0RNLMoxY5DhU4a3gNohxwQzJ1NeZnZlfmzP8HlxyZrCCNz
         ewmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715522; x=1783320322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVp9Zglg4dzVjkBcJglZFHQXwSqvRZ8fm9OhiCgGnT0=;
        b=QmlUFEA6pQneD+Op6dMVK6jHiGYjOAHu+CRLJwJabPxm+vG1mAyNb+kK/ovBl5+IBs
         XRSSp6GEYKCKxfjcWSMJYgu8+kTqsNk1Hi1kBenNv4XW5bRi1wy4snHj+FyyctIOlTt+
         H7p7+iQTdYatbLBZTtNNiq4i7wkN+WF6DAUgkMn8OxmDNIUs1aaG/IFELlyy+NEnX2/w
         CzcJbLR370x03EwDLO1wYdQteLnCaLFi3WK7j9mgNbBenAPCJgQeGXl3g/JjqbOl9g9t
         +ovl1OfsQc7XGHOCwNeCU6xeK3a1tgWPz0pTgasIle4N6dhfqGpzIfbvOGKbT7PIpBuo
         eWtw==
X-Forwarded-Encrypted: i=1; AHgh+RocAjwae9w762J7EBJeh9Ja+hpiyosA5NYhPPbvY/jWeYfV+Hz0haii+1hhq5Q+ccPkRmPWsp8fK5UFdZqw@vger.kernel.org
X-Gm-Message-State: AOJu0YzP5YMA8tVLe9CgZ2jvQRX9q2UH3wDhGrpwPhetLhLdqPJffULh
	HJJt1I1wajD2TzUn+xtLbkQDQT9xCt1EoDBS0EtRGgsck1X9lEE7SE9f1GSfdttUlNlbFLS+Zvn
	DNf39a3i3V/lyOPZ6C71T22yzkRutRRS3oDcsLRY8PHWRD4y3tPCsfZqImhI619x9ApwR
X-Gm-Gg: AfdE7cnkVmmBG3P+rC10PFXQQ/P1N5vn8iVzskfb/u5PEc9yOgQwSXUQ4l8hfEW6U6W
	hpNddOqoqoNN3BxnUew2iIl/tvKjClRtn4bKS0QvfucD/RdB7LxOorxbJVkvF7ipDnO3rexJmvT
	YDPzzZ6hKwtP9kedfhRlpF85PG8uYvNqMFRS3OGMZ+qGHgaLzRnJMoTTrxGIQoWcXYn8ALxyDUh
	TSn1+qcQZSBuAt7YcITIY5HHPMSJAbmik53aZUFvZpHFR1G9Fb5utPvqACE9GB8JT07Oy2VDfwS
	pxN/2qVY/gz+mQ0u0i84dUT6Ae+a+pR5eROP8mi2EufDs949NV2duZ+U3uS6S2JMvQobZLkhZI/
	Uhu0T8kSXRivKagl7g6UWH9aqIgHHx3GFv6FleV3VGhvD5nmd/gC9Fia1J8y0Lg==
X-Received: by 2002:a05:7300:8b85:b0:304:bce9:25fa with SMTP id 5a478bee46e88-30c84cf58edmr12861130eec.4.1782715522403;
        Sun, 28 Jun 2026 23:45:22 -0700 (PDT)
X-Received: by 2002:a05:7300:8b85:b0:304:bce9:25fa with SMTP id 5a478bee46e88-30c84cf58edmr12861114eec.4.1782715521911;
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm43580424eec.11.2026.06.28.23.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:44:36 -0700
Subject: [PATCH v2 2/3] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-crypto-v2-2-f8ce760f71d6@oss.qualcomm.com>
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
In-Reply-To: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715519; l=1367;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xL/9qOPePtFeCrEvuk1rTnwRe+ZVfzTbrOhBn51jvoM=;
 b=0MpAjM8hw4q/ldOQ0TH5cNJ2JAxqUeToo95zB99B+KCWU64b9qgQ44hAyQzx6ZDkMe8+ap+0c
 uzzRTu2iFtpD6jMhMwF/CKObBHSqSZHacOlBtTc0vyKPX1YtZcmFYer
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a421483 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CB5EDt9iCFRIAeX0j-YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 3MG_xMlLtAEMnDQoCU3guAtBZriqxDaJ
X-Proofpoint-ORIG-GUID: 3MG_xMlLtAEMnDQoCU3guAtBZriqxDaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfXyiOhpxdKi4vp
 ymmilmW+ij4MaEbWVrqsBanJvDD162kRFXXKHM3z4afE9LqeyhFWPnvWVy37dqD+WkV2UQGOjtN
 by/+yC648sXAPOfMoMTID1zgGRjSSXytXa32tjRtC8x+CNE41ThMWchF0UaMtEs54CYwvneAam9
 /Cu6hHiKRbW2zt6jCY8plsb1nycY9GvzA3CgQtkEb49cymfmWaw8PilKYqAEwrD5GdgNy2jUfa9
 ngjBfrSOXgamyDtrgcCpMyeTMeH/8vrDXmtD5YveoOaMcLNtvBwwh8dLf314ZVkOw9GvO8dly2C
 5iPuzy03w1E0fksWXmk7+6CQaWzqQ5lqPPJSSM0tKGpYGsk4aqwyPGQiHy9zkIxtppPHBDY3WPZ
 M/Ji2tM+SYXqdMmvK6s3PDzFwtOPre/uyKEcwP7Wb/JNFRuCVFrP38zxTX3czGCVQssH/IatkTc
 1kFtCtj/xZpNtadSOyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfXwzXXDQ/3rCFl
 DNIupeFnEN6usLrwHrHE8vIT/tKVpP+SjYUAImxsUWzKjfimKcLYN6ZBMaC9nlYBwmB55Qo53Vi
 MSWAEomp26Fa8dT3tOG4dFpiQ1sI+ZY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114854-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 537FC6D69E0

The Inline Crypto Engine found on Maili SoC is compatible with the common
baseline IP 'qcom,inline-crypto-engine' and requires the UFS_PHY_GDSC
power-domain and iface clock. Hence, document the compatible as such.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index db895c50e2d2..d80f8445393b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
+          - qcom,maili-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
@@ -62,6 +63,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-inline-crypto-engine
+              - qcom,maili-inline-crypto-engine
               - qcom,milos-inline-crypto-engine
 
     then:

-- 
2.34.1


