Return-Path: <linux-arm-msm+bounces-95715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rPFkKPp2qmlcSAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:40:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B521C244
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0B123024A0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 06:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CE8371CE3;
	Fri,  6 Mar 2026 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MHYD13dl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4/GSg6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38E937187B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772779252; cv=none; b=d+sphp7m7Pwf8TtAVEX0maprw+S9hC14fQ+KeIw6a3vVMJbc9LQLDIefbC0a/Q0fMPggG/Y107eqQaENmGIakkTPaP55jy6eD6dZY4P7uqmWP0r4tb7YeFYWSqLHOWcztO+EQYfy1inEJUSNjjitesAe7lotpU/kZqt4GbiI+Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772779252; c=relaxed/simple;
	bh=6nWG/KSuzTSbbk25w6qpMlZyqeTm9D7mMT0R7Dslooo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ST7XFjNI+HiPIVHBjLtJww+b3FrN4M9YsFP+nt5ds46Fu5vZJ0Bkamiu6Br+Hc13MhgOZRWeVyvIefcx8ebnOtD8ysmNP3NjTT+p6ajkwUmUIrozSQNL6MISOSda9ZblF9GzigvHyAKyx+vw6DbpYHUiuKbUz1rkBHZKdZmbuPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MHYD13dl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4/GSg6F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aeMD3886823
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 06:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DYUjo0Q+n1DOSSP+g5iqoj
	l9pc8wvDTLKORng6b1Qpw=; b=MHYD13dlEk4DDI5ip/4ejzCFI6pbLpulv27Wpk
	XllVKK2zHv6r+RC7q43wZYMMNwcljCLqJxrPPron6NAqWNBDzvVYwuRAKC4MSiuo
	SJ0QK3gMhMxldNNSOo5U3as+MssdfBoZIW9oK3Mot7GSZFHNIy29Jv39iv05RM83
	mYboF2HzqMrO/Vz8tB4KbH9rmuEm1XGuP6N7Kcsl1HOnKaiI3FX1SDKj6+rjznti
	3AmHyMTirHP2VMXn26DWaUmg93D/T75GM6XulNo6CTyhzxUSTm+6QnJWfbKi51t7
	/AkBQwtRA1WHjAYELvwU4jho6AvZuCrfMdFvsvZR8nPbAbmw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4s9fb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:40:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdff07d8f4so8489928eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 22:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772779249; x=1773384049; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYUjo0Q+n1DOSSP+g5iqojl9pc8wvDTLKORng6b1Qpw=;
        b=B4/GSg6FjxmElzjElYKxTbe51/uhktmlN6s8SR6bRjb/9k9DSpeQeZpd8uU9vwCI1+
         Hfrggzkaw/iZqhtOxuDtE7De+Qvfb2BzSgU41bHZV2wYGUeRNFbdAeWAuEGw+5f5AfHu
         lmki9ZTPmX00/DPrfgVaDhk45KGmNyhzX/p30ulGhfZe9Sv3hjuv0eOW/N/xyxxXkbTY
         KD7nDX//rVDGODrmux/3kAfYlSY/joolEQ559XZN7CAH+yHPuqg5+TcgAxHQhF2OfWGu
         WxZHqKLpWDNtR/m3oSvuSDnbPWzHh1d+E1gPlWtRB2pY9V3Uol/Y5vYWHyeuE3TNNtgi
         j0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772779249; x=1773384049;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYUjo0Q+n1DOSSP+g5iqojl9pc8wvDTLKORng6b1Qpw=;
        b=BaAiZQdfPTIhPtmsD43QniptkPO7VUjF2IF1YjvZdWWYndkYQddk2GyD66piRqjmYg
         1W6FRRsuhxOu89beCHDddUr3iiylGYYWrV5Pqk0g04WP70FClfBn59FM1qvvUrNNhNOs
         r48ysPSfKwy0bWb2idCr18rA7pRTNP4UDqQr8n6SFPpmpJ7kX1SYRmGMt403jFvnRE+s
         a4hHJsbRKK/IZR64QJny+CSx47F1mP/CemORhL+f9RjN72SD/1BMY2f8QHwbtoooeTPU
         HUlcu/BwozwIwynmgpedJxJX5SrYgAxWO/75jBrYgufFGS8rHHn4bfy9tQoFd+Y07zh2
         NV5A==
X-Forwarded-Encrypted: i=1; AJvYcCXnqFd4Iv0e+C7cytjAXOyKEtR4Iammgpl1wru+5HPtEhCyyzVISGLYVNNhRSFqTWCPtDp/oqXcLuEf2YSy@vger.kernel.org
X-Gm-Message-State: AOJu0YxdlS0omd4h1ewP7/xCguPA3atZpDM2CPaA45AdMtVk5h0tG4ZO
	/lNmwrC2+ltnomRzC1rWnOPT+XlXy8vKybDkOvlkTR3oc+ED5Sbb+4kDUP9uQEN28/brSXW4xD7
	3jHaw6r6NIZjnKI6ZjhwvuwDVDuw3XuQ0Xe2hX87Ivf4cQUVmcTRwE2qoxalOfxujts8J
X-Gm-Gg: ATEYQzxxuCYbmbYox9/MHzGvEr8NDGn9oi+uJ6aN3Nq8vpDyowhcNvm8FHdgN91IenW
	7REPks+bn6lklePBpg8YPq4OTJ+6CwgvectkulH9bTNkW1SnGkYXn0+J/xRAcoUvmGZVTEe7zXL
	GPLIxWSPx0t8Lh9BO1lZpYFAC1cGpvk8j/Y+I2ao6MD7QjBsMhE2XI8WZIwe4B9NCNsQcvb/8Yh
	HEVff87Wt4pBbBCCeykqNzMSnePfEVmt5C2p8XOSOYSBaPz3QMg7rC4cDCeYO/33o/P/gis8ZGF
	J9S1Qfc43Ddj0v2oWmbNY4h8cCKt8Gx3FewCCQh2TOr5JiIWwFVvyh4fVI0DUY/bgo/NsxphVMo
	kFYQUS6lp0lAjhZxss7lAJ9lz168cGP6uR70izzqk+Z/L1eP+Egc1SqzQ0Q+yi+ZEPHn0YVGU
X-Received: by 2002:a05:7301:4188:b0:2be:e4b:60bc with SMTP id 5a478bee46e88-2be4dfee268mr439428eec.9.1772779249243;
        Thu, 05 Mar 2026 22:40:49 -0800 (PST)
X-Received: by 2002:a05:7301:4188:b0:2be:e4b:60bc with SMTP id 5a478bee46e88-2be4dfee268mr439417eec.9.1772779248694;
        Thu, 05 Mar 2026 22:40:48 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f94833bsm504625eec.18.2026.03.05.22.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:40:48 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:40:41 -0800
Subject: [PATCH] dt-bindings: nvmem: qfprom: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-knp-qfprom-binding-v1-1-1b3effb09cad@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOh2qmkC/x3MQQrCQAxA0auUrA1Mq1baq4iLmWnSBjGdZkCE0
 rsbXb7F/ztUMqEKY7OD0VuqrOpoTw3kJepMKJMbutD14Ryu+NSCGxdbX5hEJ9EZiTNzT3FItww
 eFiOWz396f7hTrITJoublt/LNBY7jC2lV/pN7AAAA
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772779247; l=983;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=6nWG/KSuzTSbbk25w6qpMlZyqeTm9D7mMT0R7Dslooo=;
 b=rKySMmnqgOLU6Y+kNNggJctpZC6nkusPOEeT1VTg+5AF2hJ7urOTJffLpbEQ1zR+Q8dCG1ucd
 sZcNKyMiApICMQcxBzevzNB8/lrK13/yunq9t9KI9RDEBLRsaCSezp6
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA2MiBTYWx0ZWRfX40qCCkLxHAO/
 Gof6I9Id21jMnmsnUhd9ctGAUFMpxV/2/0CpNx6+kYajnef26K/4MbLgmDc5EkJJlmnkkVsD+MS
 03A5vUs4HxapKu29bDotA7oZpEPZnlkAHP39dYYknpTaWn1Xo3rDGEp5Hg02SPELUk+50dR77r0
 WBvxlhN6nMl5NmDeSnzXoS1giBnDhmYlU4UEJFUVetwO8XCOK1ZaQxVzpY3fEBfDpEvQyxBEyze
 uRgHVms7PqlvC1Iuf9M3UUoeTsce+Jmuut9BnMl1O39pF+TyY5WM50qqge95klbrL5qMimiFAv9
 qILxrTFSxM5/a0hoWvOYnnrCPqa3+ttMxkihdHkoIuNyq7Mv1BAqimu3J+IwLH8qpMdSSuXGuvr
 +vIrEH32HSTP/jahKCffC1XazB39Z/rDcVGd0HlpgIg+67ma5yhj5WgZ7vOTSiQm7hKZPva4KEQ
 KHc8mwDKqwkljaHzwVw==
X-Proofpoint-ORIG-GUID: dkfLmv4oovsqPtASN3RDktQnxzhIU7Vg
X-Proofpoint-GUID: dkfLmv4oovsqPtASN3RDktQnxzhIU7Vg
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aa76f2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6F5sZE6EngcdS_TdUhoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060062
X-Rspamd-Queue-Id: 0D5B521C244
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95715-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document compatible string for the QFPROM on Kaanapali platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 839513d4b499..2ab047f2bb69 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,ipq8064-qfprom
           - qcom,ipq8074-qfprom
           - qcom,ipq9574-qfprom
+          - qcom,kaanapali-qfprom
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
           - qcom,msm8917-qfprom

---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260305-knp-qfprom-binding-efcff6ea9b7c

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


