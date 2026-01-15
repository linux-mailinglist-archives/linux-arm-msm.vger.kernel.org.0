Return-Path: <linux-arm-msm+bounces-89159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2221ED232D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B2303076F33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A688C33A6F2;
	Thu, 15 Jan 2026 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRexoTUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmnB52Oq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0B7338904
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768466115; cv=none; b=e944eQEfz/nx+qE7bh//ZP0iqz/E54bfkxrL7csY7YwZJe85m18+SivYcHGBU5gOT40fiIHFydnGwNiP6jyExbmaouLrNXWCtXndCDj8r6+o2qxQzSURdv6SWk+y3Tzuhe3VwVWAOyMTzlxqve/1+ZEKpFXlJbDBnBNQUIxIl9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768466115; c=relaxed/simple;
	bh=SpZf+t/4Hc9Z0r4W/knf9jUT8e5BYI7H6axWBD4rbTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjXCILNNNyKGaahtIV2vP6xV5D9enDirJAmp4bk7Aq684gYb/xLw6DAAmpRpWG+XNknGVQDmNO2zr7JLOF5aecDxIE6MMvwkP/AonyrsWVc/zu2uk1mJPMBGzme6ZICsfmimn6aM6GjXIH+PuUI0TGLg0Tvj0wgPKWc5u73bEVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRexoTUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmnB52Oq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6gUQK1056584
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lNlY2G/tXfBfRiDTKT9rOZJ0+YDPMtwvaAA
	s5FvC8sU=; b=JRexoTUyFZ6QHVM4/Zq07xOkbJXLNivZM0jyQQEaYbOrH/qzo41
	jZy+1IhLUAIdtWQ8a45Pza99mg0Vsy7NjYypJ+sAWqnFjVlzAbmAj9OfV6cde9Sg
	Jz0PjyhPTi+uyrUQdUaDvv/PJZ3a1GI5HCH2GINK4mFft8+R5Ht1o9WJu/+BZlyc
	Mqr7u7/skKgZqXfSi59TP8Z08DbBJIoXf6Vt6fZ7E4R1Dk+OLHGWBy4RYi9eCft0
	poMb4DkvPALa8xSGwy8M3/EJgHvV7TWA1XV4ePOq29y41HjvEi6OLS/EObtcBYQe
	kA1Ns2N0c5/WCGesYZMvkwKtDFzNoR3slHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d33xuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 08:35:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so282893085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768466111; x=1769070911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lNlY2G/tXfBfRiDTKT9rOZJ0+YDPMtwvaAAs5FvC8sU=;
        b=gmnB52OqpSbYM0lbcMuOskEy0j/YV4PFGKWBk7xLAfXmeLlvMj+RN/B3fYu5GdVYYI
         /FQScJPmmU1MOZxmZR9fucQaY0Hhh36Ssfvg6bRh8swTnQ9WtYCrr6r1gE/VPRFIZ6SE
         qDJ2AQIMEqEX/lV3m8lgr3LvJntn5S9QAvansyR35sWAbIK7iv/0pGTca+PXuwOL5h6B
         quGTuAtk768PjB08qp8CkevxjBwUhV79q1/pYObSxAv0FISoQBu4wf24gdc3FVrW314L
         4KiWc2Y5CbRIhpZckKamqtV3LeO3KPizUqrLNyx5wxhYibYPvzSnhgyTzLYvoyUwFovQ
         cX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768466111; x=1769070911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNlY2G/tXfBfRiDTKT9rOZJ0+YDPMtwvaAAs5FvC8sU=;
        b=b6+q7CqiZ/F59ptEoEFhTVvx/MvW5ieYfkVEWeSp0BmUWunDwCYuqPaCHHDf8UisQC
         EcLVmV9XuDtgH1EwfrknHpAPCXUH/7c/EjWtKuAFpMc2Cr268D0aL35OCLOtioitM1TQ
         IMKjSBgmDgsAyBGj2rCWy5I0/hcHXxbkH3WjTXEQTXC58pi6ptmIFGscOnbvLIvf1ouQ
         jEMRqo9c7v0jmfB78IrGPpiW7q5GrkTxPWJNLfq1E/AFEx8onw4qv87I+fdfuwA22KV4
         pkfNoxUqU63NKP89mygZbcboeMdQamEt58FeId4vcsT273JCsfmQErqkcKAv97Xn//gX
         dbpg==
X-Forwarded-Encrypted: i=1; AJvYcCVS2NLY9KyCXvrG2XDZs3TD5dyJOoqo4zitpNqfZFFeG07/+zfPcsYgVYUscdcZB1L8T9HDYAziYlVwLjx7@vger.kernel.org
X-Gm-Message-State: AOJu0YwBSiUqLFF+1uTCemsX1xwmLUxKMZvo8DBstaSFn0i3iT/eAVSj
	SrP3MIOMasbbV5muN+8Rg9ugX8Lxb65WoIIWxr77E5EYajZLXeEYZmiYTb1w4xKLmOf+T4wm/Hg
	UqIdlADsv3oTFynISbn/m0CyH6a3C8oQIU43yIrLCA3BKtcJ/KJk6xMafjQio2v3ykQOq
X-Gm-Gg: AY/fxX4RJJxbNFB6yV7KWAMieTdSaoBB4Ycp2fklLdr+IqhoFv7rJtLhOzzKoHE9nqp
	jmK2TQyWc7ql6AXHDYn0VqFXMCabgo3HonsGQzVk6t6Tv90Gp3td/u5bsybexZVnyduTrFNt8sJ
	IVHfJLQST7B1K2NnZg41JC7lGOOP0kyL4P02y7h7tnVUKJB2r5MAPczZ+FIZArdY1C3FDfjj9Y9
	XoK6MN3ZxgFk2DvEZpFMLfigZC1NVoPxTFqf73Rypk9jdweT/U/6agdC+WZpO1CrrobK7boB8s2
	Y9Q+XT3F/YFXK3l3iOGKgEMHs8i2Kk7l+F3AknQVKkFnD0tce4nfstkLJb574hxayxqoDD8RcGc
	lAyU4W6iCbA3xrWIGrbt9suxvhg==
X-Received: by 2002:a05:620a:8907:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a0349420mr138368085a.32.1768466110800;
        Thu, 15 Jan 2026 00:35:10 -0800 (PST)
X-Received: by 2002:a05:620a:8907:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a0349420mr138365885a.32.1768466110273;
        Thu, 15 Jan 2026 00:35:10 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f429071besm33474105e9.10.2026.01.15.00.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:35:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: cpus: Deprecate Qualcomm generic compatibles
Date: Thu, 15 Jan 2026 09:35:04 +0100
Message-ID: <20260115083503.43796-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9044; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=SpZf+t/4Hc9Z0r4W/knf9jUT8e5BYI7H6axWBD4rbTQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpaKa3S7NPYIBo40dGMLKAmho+8aTn/L1f8phNC
 NMIl39xiRuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWimtwAKCRDBN2bmhouD
 1/daEACMHgAveWNoDRihYpEG81iGATqYzDCC1/SbzoMajQ3qkL2vFZ1S5moUO1tPjUJ669euRys
 Y6dPmJ+1GdDIJDSvWQDfl3QLgGSEI2jyWHHn/GJzIdigd3VUieoHLrAZzHR1+EpgNsYrCvHvkHb
 BRFWRPpjGeBS/TO3F451VeuLEiRsvfJnH5wAPmBfUejgMz4tfrPoG+sE1D5OFjMbwrvFjskFy6o
 NdFIIgrcNLwlmyUvKQGc6YQXgqWge7Lx6sGIXfe5Gcg9qrn22cNrxAVW6uamz1dRK0aNRFAD9Es
 fxHK9BMwSU8UEEM3vbxkje8iug698wTRXSAfX+i2ZYkedh+aslSUO40CQHJD5Hx/V9w2+JtzNKv
 Zau8oNHjpPlCjG3i0f0k1ZC7rW7NfBej1PRPTXsLuCkSZ0vG2d8xpHtVnLwckcK/Y3aPx4PlLNo
 MHE/hl9wWSncY2CMk7TfU6E5tHlEi9VubSvep0oHkmM8tulwxpDEYXayI3a03B7JvXFMTmGueSL
 axmqJUBdzZrDy/TNolqDPukazWXa6GUWVxx8jKFXgUPOnwTuf8JOTnHsC+47IgaCWNXFnQ0mwdR
 7BFvaYC+oJDBq1EUfMYUdNoBPODPQvraElYsAr+IIAKBpxU9qXyGU4BAUcamMHHjFXk5l7IYeEL iNysg8v1xdJXuaQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RJGsAZnYC0CaeUZp4rFoclKnCmBTR0D6
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=6968a6bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UCepZs5kgWk2CJDjE9cA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RJGsAZnYC0CaeUZp4rFoclKnCmBTR0D6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA1OCBTYWx0ZWRfX8XVwU68fD+gW
 3loANgyFkUkN2B01zzeprSMTgZdAqsDBDKnXiCzovoLcgTntMIK2OtrN2v5zNufkwtftBEkT6ro
 J0EtivMF2uB/QiNlCFg/jWp8ULld8t4rhy3LLoSKpoCEOwG5Om31VpjtGuwTSKWoBvMEahWM+Yb
 kSUEhoInmoQPlI3HQ3L6K7nK905xg+0PQPslDXeaY0+7dgZtNrKm3K8MkUuSCfP6qyk3csg3roB
 5FlbqPpc9u5lufkNLphsS76Tfy5VZhwyobS14H3MtbkuzKSiVMQJIJv1aiPrx21Qi8ebcqevUmy
 LMXHtyA97LwiXQBZaIMHmu80gRWak3L0aLKAdVFGYC6PjIAsts3Gvc3BRFnIXncgxOv4WBVLHJF
 dHqWXQl8wWAL/ZZHc15dg5+AmbuayGGLu2RtiLvMioprYxVRW/4c/8kPW0mX05Orm9EH2V9A+qF
 PPH2zT+w06enNzDiMhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150058

Move four compatibles for Qualcomm Krait, Kryo, Oryon and Scorpion
custom CPU cores out of the enum into separate one with deprecated: true
annotation, because these are too generic names.

These are names of the families and there are significant differences
within individual processors, e.g. Kryo6xx can based on architectures
from Cortex-X2, A710, A510 to A78 and probably more.

Just like other vendor processors are differentiated, also Qualcomm CPUs
should come with specific compatibles.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/cpus.yaml         | 290 +++++++++---------
 1 file changed, 147 insertions(+), 143 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 736b7ab1bd0a..fde3a68f4f5e 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -79,149 +79,153 @@ properties:
       All other bits in the reg cells must be set to 0.
 
   compatible:
-    enum:
-      - apm,potenza
-      - apm,strega
-      - apple,avalanche
-      - apple,blizzard
-      - apple,cyclone
-      - apple,firestorm
-      - apple,hurricane-zephyr
-      - apple,icestorm
-      - apple,mistral
-      - apple,monsoon
-      - apple,twister
-      - apple,typhoon
-      - arm,arm710t
-      - arm,arm720t
-      - arm,arm740t
-      - arm,arm7ej-s
-      - arm,arm7tdmi
-      - arm,arm7tdmi-s
-      - arm,arm9es
-      - arm,arm9ej-s
-      - arm,arm920t
-      - arm,arm922t
-      - arm,arm925
-      - arm,arm926e-s
-      - arm,arm926ej-s
-      - arm,arm940t
-      - arm,arm946e-s
-      - arm,arm966e-s
-      - arm,arm968e-s
-      - arm,arm9tdmi
-      - arm,arm1020e
-      - arm,arm1020t
-      - arm,arm1022e
-      - arm,arm1026ej-s
-      - arm,arm1136j-s
-      - arm,arm1136jf-s
-      - arm,arm1156t2-s
-      - arm,arm1156t2f-s
-      - arm,arm1176jzf
-      - arm,arm1176jz-s
-      - arm,arm1176jzf-s
-      - arm,arm11mpcore
-      - arm,armv8 # Only for s/w models
-      - arm,c1-nano
-      - arm,c1-premium
-      - arm,c1-pro
-      - arm,c1-ultra
-      - arm,cortex-a5
-      - arm,cortex-a7
-      - arm,cortex-a8
-      - arm,cortex-a9
-      - arm,cortex-a12
-      - arm,cortex-a15
-      - arm,cortex-a17
-      - arm,cortex-a32
-      - arm,cortex-a34
-      - arm,cortex-a35
-      - arm,cortex-a53
-      - arm,cortex-a55
-      - arm,cortex-a57
-      - arm,cortex-a65
-      - arm,cortex-a72
-      - arm,cortex-a73
-      - arm,cortex-a75
-      - arm,cortex-a76
-      - arm,cortex-a77
-      - arm,cortex-a78
-      - arm,cortex-a78ae
-      - arm,cortex-a78c
-      - arm,cortex-a320
-      - arm,cortex-a510
-      - arm,cortex-a520
-      - arm,cortex-a520ae
-      - arm,cortex-a710
-      - arm,cortex-a715
-      - arm,cortex-a720
-      - arm,cortex-a720ae
-      - arm,cortex-a725
-      - arm,cortex-m0
-      - arm,cortex-m0+
-      - arm,cortex-m1
-      - arm,cortex-m3
-      - arm,cortex-m4
-      - arm,cortex-r4
-      - arm,cortex-r5
-      - arm,cortex-r7
-      - arm,cortex-r52
-      - arm,cortex-x1
-      - arm,cortex-x1c
-      - arm,cortex-x2
-      - arm,cortex-x3
-      - arm,cortex-x4
-      - arm,cortex-x925
-      - arm,neoverse-e1
-      - arm,neoverse-n1
-      - arm,neoverse-n2
-      - arm,neoverse-n3
-      - arm,neoverse-v1
-      - arm,neoverse-v2
-      - arm,neoverse-v3
-      - arm,neoverse-v3ae
-      - arm,rainier
-      - brcm,brahma-b15
-      - brcm,brahma-b53
-      - brcm,vulcan
-      - cavium,thunder
-      - cavium,thunder2
-      - faraday,fa526
-      - intel,sa110
-      - intel,sa1100
-      - marvell,feroceon
-      - marvell,mohawk
-      - marvell,pj4a
-      - marvell,pj4b
-      - marvell,sheeva-v5
-      - marvell,sheeva-v7
-      - nvidia,tegra132-denver
-      - nvidia,tegra186-denver
-      - nvidia,tegra194-carmel
-      - qcom,krait
-      - qcom,kryo
-      - qcom,kryo240
-      - qcom,kryo250
-      - qcom,kryo260
-      - qcom,kryo280
-      - qcom,kryo360
-      - qcom,kryo385
-      - qcom,kryo465
-      - qcom,kryo468
-      - qcom,kryo470
-      - qcom,kryo485
-      - qcom,kryo560
-      - qcom,kryo570
-      - qcom,kryo660
-      - qcom,kryo670
-      - qcom,kryo685
-      - qcom,kryo780
-      - qcom,oryon
-      - qcom,scorpion
-      - samsung,mongoose-m2
-      - samsung,mongoose-m3
-      - samsung,mongoose-m5
+    oneOf:
+      - enum:
+          - apm,potenza
+          - apm,strega
+          - apple,avalanche
+          - apple,blizzard
+          - apple,cyclone
+          - apple,firestorm
+          - apple,hurricane-zephyr
+          - apple,icestorm
+          - apple,mistral
+          - apple,monsoon
+          - apple,twister
+          - apple,typhoon
+          - arm,arm710t
+          - arm,arm720t
+          - arm,arm740t
+          - arm,arm7ej-s
+          - arm,arm7tdmi
+          - arm,arm7tdmi-s
+          - arm,arm9es
+          - arm,arm9ej-s
+          - arm,arm920t
+          - arm,arm922t
+          - arm,arm925
+          - arm,arm926e-s
+          - arm,arm926ej-s
+          - arm,arm940t
+          - arm,arm946e-s
+          - arm,arm966e-s
+          - arm,arm968e-s
+          - arm,arm9tdmi
+          - arm,arm1020e
+          - arm,arm1020t
+          - arm,arm1022e
+          - arm,arm1026ej-s
+          - arm,arm1136j-s
+          - arm,arm1136jf-s
+          - arm,arm1156t2-s
+          - arm,arm1156t2f-s
+          - arm,arm1176jzf
+          - arm,arm1176jz-s
+          - arm,arm1176jzf-s
+          - arm,arm11mpcore
+          - arm,armv8 # Only for s/w models
+          - arm,c1-nano
+          - arm,c1-premium
+          - arm,c1-pro
+          - arm,c1-ultra
+          - arm,cortex-a5
+          - arm,cortex-a7
+          - arm,cortex-a8
+          - arm,cortex-a9
+          - arm,cortex-a12
+          - arm,cortex-a15
+          - arm,cortex-a17
+          - arm,cortex-a32
+          - arm,cortex-a34
+          - arm,cortex-a35
+          - arm,cortex-a53
+          - arm,cortex-a55
+          - arm,cortex-a57
+          - arm,cortex-a65
+          - arm,cortex-a72
+          - arm,cortex-a73
+          - arm,cortex-a75
+          - arm,cortex-a76
+          - arm,cortex-a77
+          - arm,cortex-a78
+          - arm,cortex-a78ae
+          - arm,cortex-a78c
+          - arm,cortex-a320
+          - arm,cortex-a510
+          - arm,cortex-a520
+          - arm,cortex-a520ae
+          - arm,cortex-a710
+          - arm,cortex-a715
+          - arm,cortex-a720
+          - arm,cortex-a720ae
+          - arm,cortex-a725
+          - arm,cortex-m0
+          - arm,cortex-m0+
+          - arm,cortex-m1
+          - arm,cortex-m3
+          - arm,cortex-m4
+          - arm,cortex-r4
+          - arm,cortex-r5
+          - arm,cortex-r7
+          - arm,cortex-r52
+          - arm,cortex-x1
+          - arm,cortex-x1c
+          - arm,cortex-x2
+          - arm,cortex-x3
+          - arm,cortex-x4
+          - arm,cortex-x925
+          - arm,neoverse-e1
+          - arm,neoverse-n1
+          - arm,neoverse-n2
+          - arm,neoverse-n3
+          - arm,neoverse-v1
+          - arm,neoverse-v2
+          - arm,neoverse-v3
+          - arm,neoverse-v3ae
+          - arm,rainier
+          - brcm,brahma-b15
+          - brcm,brahma-b53
+          - brcm,vulcan
+          - cavium,thunder
+          - cavium,thunder2
+          - faraday,fa526
+          - intel,sa110
+          - intel,sa1100
+          - marvell,feroceon
+          - marvell,mohawk
+          - marvell,pj4a
+          - marvell,pj4b
+          - marvell,sheeva-v5
+          - marvell,sheeva-v7
+          - nvidia,tegra132-denver
+          - nvidia,tegra186-denver
+          - nvidia,tegra194-carmel
+          - qcom,kryo240
+          - qcom,kryo250
+          - qcom,kryo260
+          - qcom,kryo280
+          - qcom,kryo360
+          - qcom,kryo385
+          - qcom,kryo465
+          - qcom,kryo468
+          - qcom,kryo470
+          - qcom,kryo485
+          - qcom,kryo560
+          - qcom,kryo570
+          - qcom,kryo660
+          - qcom,kryo670
+          - qcom,kryo685
+          - qcom,kryo780
+          - samsung,mongoose-m2
+          - samsung,mongoose-m3
+          - samsung,mongoose-m5
+      - enum:
+          - qcom,krait
+          - qcom,kryo
+          - qcom,oryon
+          - qcom,scorpion
+        # Too generic, do not use in new code
+        deprecated: true
 
   enable-method:
     $ref: /schemas/types.yaml#/definitions/string
-- 
2.51.0


