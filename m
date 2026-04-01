Return-Path: <linux-arm-msm+bounces-101234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMpQFLy8zGliWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:35:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E943753F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1F183028669
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C416B33260F;
	Wed,  1 Apr 2026 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnz5zc24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFvHG/C1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891232C92D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025337; cv=none; b=IwJ2h/4yFa5aD+0PjSUCjigTNKZGQ+efg32ZFeVdGbb2E1eIeSxjFeIPUUB7pMcBw8UuGeE1a05olurY1/MF+RCX3d2986APCbnW2/H0BGgUL1KyahmM0sYbzlKQC69EAgSFGwujLqzcHfFGxHpYExYoJFOwS6CvnVIrLOsAp3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025337; c=relaxed/simple;
	bh=h+6iokKQZz+tTzp0NWNeSPU4XGXWquRPqhH9qv/wUAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZAB92Sju9/hHHt6WkXyMVGuma+ASo0rtgLN64MJ5gyVIpntPcRHgriFWHhJHKvk9op0BgNwLh+rhROUlTQZBR6t9kpo3cSm74OPZVHV1T/NWapg9mSawXT9KD+bBsowrjfraOp2fB9fArPWe+DevtIoxOaOMagyY3F3377Isc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnz5zc24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFvHG/C1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VFrP1458761
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOXdhdDzApb0jzhJUtIq/M2ueYVWSIdj/ihpXQxGFuU=; b=lnz5zc2428jcxJJ+
	1bMYF9WArX+XrYuWWJW4oGa+Joq+wVxtGsQsgPftncBROcsFvVyIrzLopE/uZpFr
	iLuXb52Km+dCJvb7/OjQ8v+L9lOiGwteVcWv6tRvQxglpLetCj1FPcZTAO22wnic
	0Qm2NdvuFWtrnuXcaxgq99fIQasxStsB58Km7jKVBwIzsyVpVtI8WWAa1O04e9wN
	NLu18Yvfei2hRHr1Yv7QAtA1AafhZjp/dsqqzxxKJo3Oim/uQDpwUI8rS2ViE9TP
	uaYOamfkXMtagcwlwLoipLAodCMb3A8gBTYSIworGssOe/mpiAC46OeUl1FHHF2y
	FYyCYg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg0n3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:35:35 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-127337c8e52so11604049c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025335; x=1775630135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOXdhdDzApb0jzhJUtIq/M2ueYVWSIdj/ihpXQxGFuU=;
        b=EFvHG/C1kmOGDPi/Pom6uBeGVSLYXLxslRaQq330TXbDHha8ZeyewalO+72EFPzpAg
         rH73Sa6xSdmCfGbGEGp0qU+RcPXe7OnTD1H9MoNksRW5vRDYHF7fYVj7RXMAVYCSxyjb
         UCld3gP1vVeWKbsPlmsNhobG8KoPRTxl6HW0EafF3pfGB1kBzCAxrpu1Rkka7+tR3/e3
         RxzGL7r6T3syvAB905jveyPiD0dVHK90IpZzCnc91pIZW80mzfMVoGf3MMf9pprqA+Vj
         Ukh7BpbEYkRBDY8rOGjEJCuLFp1r399XsOZXu7RfIH1pGmjxUtP2xWrLCiPHDh7QprF+
         q9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025335; x=1775630135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vOXdhdDzApb0jzhJUtIq/M2ueYVWSIdj/ihpXQxGFuU=;
        b=bAlDbn1o0srPV9sAau+C+qywlT9r4U9Kk5aKb9GQzXewvJUfKwYLp9vdyw8URBtVW/
         ua/gPqlrrz2Y5LQbP0tSyQRVmiMFF1Ah3O6jb2uN4dfF1AsCeUoVPWG8NWuQGVjfZ6/d
         pHQBKrUcdinr4qvh3/M1DBRvam8iF8NrqVq4O0qUz6H7ZO18HvsUhZsGPNbtYq7q1iul
         QDA4/FCLzWn/SxuZzxGPeK9/owxh0VRq7ldlz2TzxNpz1WpGef+NuBBbUr6/k4fAuAMS
         +hm2LO2Er4ctxYBBI5fKBcHS4DbKkoAaEhJpnpn+bhlMC6TzX8AqzQQ47/hNDK8bgGqW
         KVlw==
X-Gm-Message-State: AOJu0YwhvXlIKrXkBfxQtAr4hm0FLhHq+OSJF0zW5mUxeUxbCdIsemBq
	x2OB2adVVoKTvWTrMT2yrg5FuqNtlNHoNphJqpDE035mLtXJxBcTQp05Z08/RLjjPmkvAxTHdGd
	LeeOEyYUeEUKvR1BgjCHPILT6ESu+ceED5rF33sNKlDruKlqmMerCNhC4buaS2lcA9Qn1
X-Gm-Gg: ATEYQzxh18fAB0f5Co9HtsERJRbY1+awexdKhNpUi5A2PY7aaD5U80SFNrk94cjP8jw
	YuviOfIZdEQcDnnmE02ez8YL92KkA/XgxMW5Zo65foF26erPNiaz8f7/iOtNatyBElIj1miefk0
	OIbb2gDEvBIfiuxZr9Z+ExghlgCyyCM2hVCVTI6C8TEI89l1YbtQ12tWgBTOSY1U10F/XHVIn9h
	Ul0W0rSQNQ4YzfXVXmMThMoIQxLEFzX2h+PbIpNS17j5+OtuH6XsX5Hk7fFPnswjIueiAl+fLn2
	FEFusLFn8lgcU4u6I/YQwaWYkq6OMPIYFB+cZ83LMVGMDxyR7IH8iXQX4sVPekJImtp4KoyfEmy
	sfA47dwPq9R8pWrhJpuyUAVx3SFJhxa3ra8sxykvNneqyLoU6JhEXyQGL7CLt2HXCqiET
X-Received: by 2002:a05:7022:62b:b0:119:e56b:958a with SMTP id a92af1059eb24-12be64b5885mr1209372c88.15.1775025335256;
        Tue, 31 Mar 2026 23:35:35 -0700 (PDT)
X-Received: by 2002:a05:7022:62b:b0:119:e56b:958a with SMTP id a92af1059eb24-12be64b5885mr1209364c88.15.1775025334599;
        Tue, 31 Mar 2026 23:35:34 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:34 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:35:26 -0700
Subject: [PATCH RFC 1/4] dt-bindings: clock: qcom,sm8550-tcsr: Add QREF
 regulator supplies for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-qref_vote-v1-1-3fd7fbf87864@oss.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=1973;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=h+6iokKQZz+tTzp0NWNeSPU4XGXWquRPqhH9qv/wUAA=;
 b=zjvlvfPidMtfsw03SJZXQdGArrrjZcjtFSfDCKrURTOSU4zza+ExjIASSv/GM728Zn/d7x0Ud
 u10cftkc8EtAcLzZHtMoEC1avGIVTJi3GcJ5AHCUSp8lJzJmXVUi/AN
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NSBTYWx0ZWRfX3UmmVZKQjw5i
 fjOJoXVwvBkFTaXpok9ZQ6lrzN1fmZ/8DyV06N28hFJrleHHISfN/BbHULeUDQiQb5jJb7rZKwA
 xVBP8j1dhVZdfm2mjaUap90ghO5u0vEk4Vu5sGQyp5XergoIb0CQ12hLJd3OMtq4WnWN+DYN9hw
 5ytS69myyoLQ7QkAUac+vbW5kADGk76VDHp7U2Rxy3nzmtr74Gg1ghMm/YuqJycwP7k1YW83y4v
 sHOiS718JpwrSdDsOyLCsj8McaN5GfWSHXDalmn/S3UHURPlynBNNhJyDz+GWnHU3imFqvU7l7t
 1Nt0hHTuXIeZKXfi/UgS8Adi5/UNFbW+DfIGLGwBcC5Qb1s6Ic+caL3GrdTMo0kt7uNnUawkDh/
 OHFbYD222xQ0GpfeDJRbm99N7qWPQX01sti6HVu41RCdQCLt5o0paFqkfQRtONzzUZB/VIIQjuI
 Q1VVJTjkFcF1snEXFow==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccbcb7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=q-kqYbIK7F94m4hkTHoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 1bE4suNOq8P_NpYy6O7XJDXQq0qimzh1
X-Proofpoint-ORIG-GUID: 1bE4suNOq8P_NpYy6O7XJDXQq0qimzh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010055
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101234-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9E943753F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The glymur TCSR PCIe clkref clocks require regulator supplies for the
QREF block and its refgen reference voltage generator. Add the optional
supply properties restricted to qcom,glymur-tcsr via an allOf/if/then
conditional schema.

Switch from additionalProperties to unevaluatedProperties so that
properties defined inside the if/then block are correctly recognised as
evaluated and not rejected by the schema validator.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index ae9aef0e54e8b8b85bc70e6096d524447091f39e..88db650e69ef2388a5bfb6783a57c1d48c0e780f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -49,11 +49,35 @@ properties:
   '#reset-cells':
     const: 1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      properties:
+        vdda-refgen-0p9-supply: true
+        vdda-refgen-1p2-supply: true
+        vdda-qrefrx0-0p9-supply: true
+        vdda-qrefrx1-0p9-supply: true
+        vdda-qrefrx2-0p9-supply: true
+        vdda-qrefrx4-0p9-supply: true
+        vdda-qrefrx5-0p9-supply: true
+        vdda-qreftx0-0p9-supply: true
+        vdda-qreftx0-1p2-supply: true
+        vdda-qreftx1-0p9-supply: true
+        vdda-qrefrpt0-0p9-supply: true
+        vdda-qrefrpt1-0p9-supply: true
+        vdda-qrefrpt2-0p9-supply: true
+        vdda-qrefrpt3-0p9-supply: true
+        vdda-qrefrpt4-0p9-supply: true
+
 required:
   - compatible
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.34.1


