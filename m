Return-Path: <linux-arm-msm+bounces-97019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO4kKFGBsWmjCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:50:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E80265BBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 15:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79C4F30B0C1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590D53D1CB5;
	Wed, 11 Mar 2026 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QI+eMrTA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVbRssCb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0C3D8910
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240435; cv=none; b=jPbIusoNbUI6oaZ2mLNCuaXFea+lrXqE2C8AMFoj8hazcIz31FDoNEKOYsR3FLf0F5k4aRW114Hi9b4+TOLmM0zcrBXKlJrLYP8itcwzrDjW6RvQXo/7M10132cvcl1bpDHQYIBkIAi5SAWcOA2WOXRY4LEcg5lFImdjWpDBev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240435; c=relaxed/simple;
	bh=+X74KMWb2lVjQ9fnowKj6jei9ytZdwOYWqFCEBJ/bZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkR4wZkAJLSAB02A51Aih82TNl7Tv3y6SG6kcBLE84azoEXwIGPCJZEnWu17NDkXuC4TZKcsLydIQSnOoP5vb4a5d2Ykgs9QF51wtlTthFPdu4kW8SdEU9IGa1K5NYCvwnS1KaUTJFROLcgprvpMfhvLIzrfGOsAPsjZvBhtLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QI+eMrTA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVbRssCb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BDBofr2030768
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=; b=QI+eMrTAvfbhHkqr
	fUpe+TK2odcohdgTUtU0U5qYnp1Ysit8uXMC4KVoD4vUHy1oRKjBLDe33TWHeFH+
	ksZxcK7VLutobrcVq/TvbVWryYfqm26/n4tpvRq7srBN74YOuaz46TcB9Zkhgbqx
	atuyIJm7X2RGjGc5fffhOu7NfvtBoml4U8fPL/fZIXjGzN+dvGcr3GR5IxxREHIr
	zU8/tD9C+LHmg1EJfwb8o7xsqAnIuH0Ve2cGVr8XMbK8JfW2PgF1Z7kWVkiRx7fH
	4qgCAP15UA4ZOTJ6gpY0UiNdKQ37xqKkoM8yOgevKGZjwvG8H5QmCKxlzsmK0hwM
	n+seyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h1n5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 14:47:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd722c1a69so2621805585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240432; x=1773845232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=FVbRssCbSyGpV4FzgyxcWnGPLeTmk/y4KFYu/L8YmhWPW3pD4ZtzZt/sKxD3KNzihw
         PFjrju6E00USlhMBYw3B7mH3Eiq3p39JQwcmnUGq08GtZx2TAaZudpciQpyblhIU1Rz5
         HvZhyPalPUpFtOEZ6mpzKZKoONKIhbKBv5vi9HOOuLqzahyhuhF06nXSKobFSxyN2ygh
         9RVm4n+tsZ7IqBamRbMJAz7UMzeqMia9SZD2Y2ykSIgvnel0R4SV+933aQ1cYA5QPZCK
         VwQci7TKIHQFnjwmzCEwc3GK83hMV3GgeOJr46RGPEALeUO8d/67sLbC4gFCM/2WaF6C
         vVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240432; x=1773845232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fB98BuCBiJhrIm8NgYodeQbl3q2SBFUZLmymOwOVjDs=;
        b=tcVQdszsivFqLUNZChMqJh20gXm9+rphlSzR0YnJWgrYmjATceGw3w9S6yC/NqA3I9
         E3OnI4e/rkyF0DHATmRfkNDvkud60JYuwdRZVAOCY19i/NVTITC0wui/HNjaC+TUkhi7
         KXwINZWo83KBbxnSOlhn1NLy0sdMlISAZ3/KgpDqP6aZmItodbAXrLMGb7ZhWS9Q1fAc
         3wqbXIg9XxmX/zuyIXfAbwM95ACjApUWlpVKz4m50NOjlGIE5Q6I523NE1FsEqANavhl
         gWaeevOMm38Cz/81tZXYs3fLOjPz6bohwyCP2ykAifUmNfMcMprajGkU46QbIIMF4FCh
         5ETg==
X-Gm-Message-State: AOJu0YxUn1duYD0XDPl3/RfTdV9h7peZ0vy3bBJ6uLpH9Go//FjVtUjn
	5wdRj2WxpTEQm1mrDktW5Sp0owY7LX394e8608ZuTX1hpC52WpXPk1ciTpiFWWvsWzUgsXaOCrg
	Lq//AaJ1qTOUGw2gTEmH2hsrmNkwr9FjfZi7Ad/+hV4/ETfN+Vyd62Larng5fxYGCVO6x
X-Gm-Gg: ATEYQzxb+I6JU2b7Rp1wtfhlqKZtcjwoGsxngYDksFMHfuwQeOSSnFVyiBUtub0QXJ/
	hSXQi+F/HyW/2f8C6aHn0AZxksXm5crRnTn/PLksIiTGc0LwmnX/rATVftb6M/3YETqOR1muYPg
	6Ko4RWzxcfpSsHV5WgJc5CVCrGM9Pys2fiZdPKoOAONSJ+rDiD2tZ/px4kqSPIG+ytDe5aF75m7
	yhpHwIKKxcLRnia60dgi5W/cCawUdUa7IC2Vs5YS2Am9EXRlDlAiXgPY7jAI7KIdD27FkE/qEu0
	PX7q6mmOdPpIngmvWq/Yb05ciSCDKqudRgn88L3GuspKdbr+aTF2Hala6oEt7o849AAofQS7OOQ
	wc6C8SHK+Ti4wRAFw9khRLE9Yhr5f8A==
X-Received: by 2002:a05:620a:25d0:b0:8c8:1f1f:e382 with SMTP id af79cd13be357-8cda1af546dmr327564485a.78.1773240431695;
        Wed, 11 Mar 2026 07:47:11 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:8c8:1f1f:e382 with SMTP id af79cd13be357-8cda1af546dmr327559685a.78.1773240431048;
        Wed, 11 Mar 2026 07:47:11 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm7992501f8f.8.2026.03.11.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:47:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 16:46:32 +0200
Subject: [PATCH RESEND v6 2/6] dt-bindings: clock: qcom: Document the Eliza
 TCSR Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-eliza-clocks-v6-2-453c4cf657a2@oss.qualcomm.com>
References: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
In-Reply-To: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=AauMYzLc6gTEXz/GOQcSBdK6m37250bGHySZPyTqHNw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsYBX2HxL6wz9dc1Dqat83VCkVsBIM0RR1XCtK
 ydTwYKpDy2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabGAVwAKCRAbX0TJAJUV
 VkdsEACUwgaJSsTIgMYgnosbVXGWI37EdeMEidmGnR0BnhX48GcxDHS3UTf20p4V90gB7miiqWt
 x8j1dmVXvmSlzmHty945C+e8rI2T+pxSu6X/q6U8zItoq5NW/AITPRYyB7oXwtYyileKU7uKrPy
 OPv1BuJlCu7vmhr0JDXCbqnnBlr5v5mqGjKnulZoWLKyeK78xb0ywzfREm7b6fX4xVK7DGGv5NQ
 YWDKKmSUCCoCDVIURxzgzMlXoajN4woEibefCMqp1tvk1di/3A3di9NFlz1h2OCSJO9yGWLqtvC
 damj15B8GHqew9EnzBGiooq5eoXCi9kifJYGSMJAHJwTKNicYbYinVyEBfZQZmnL3SuMEpd/I43
 XZcVU/YlLfBjm+/GSMsHySqfhZJq/UNL2+EW0v+zbpGFkeaKCLNQorkZpFGqnBt9BLD7MVjxHDE
 ByJ0yYixAuc9F2uV3TvRkqLICpycJR91zSCHfAbVKpL1LRdvJYB97PQ8kuqjvpc8mJGl1xPMZkv
 FnlSpAR5T7GJwllHBl7RAj6/GCMYLC49FPDkB1P4DyXEwYGDCFbCka8NuBt5S87YGOx+gWJrChs
 4L9aB4Fp9Kof6TmGMTvGteF3+haDoBcT9qSkZNXaq96vpXW/Tnn9b9Aa7zJ3+0/ULG5kblHRLgw
 9PsdsRjU2GSpMLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNSBTYWx0ZWRfX0HP6sGYB0jAK
 U4VQsf1pVYZysfAXjeA92jzXOElPFEKoMg3f+tgFB//R2hddUPaF1rXs+kwnUgH3MHecZLaaI7b
 e6NPVeHHmJdrboyf6ud9aIJeiIfudYzskWR7xK4h5f4sxBmDoUoHjllHsPgsDbwnR2KRUVS/UTK
 X69k6jNXCAvZyxu83eh/OkAhZ2c0xKdpYWIrysdEpe2rUB2xony4EOyjgTwRCmsyd98/5y06KuD
 lqx9omI7xe4UyY5doyYqamjJrYSLneUaJGXI6doHmjxVinLm9i8Mg7K/qJYGFuKqhS6lHWCp4Pq
 XLhY8F7Z41AW6PwRfGdvNasjAdcYjooYI8tZwbcYRBICSCu6ByaFp350nSL74ALMtKLakfoXFCw
 18ETtitT9+QV3nmqP0RFvxLf/BuK5kVAB81vCKrlvDT917nnbXzVBLdwt70+4ONuvAzRhqQqcpk
 no8yvYqpiE1ZKnYFAXQ==
X-Proofpoint-ORIG-GUID: 7DtpesbyoFrbLSX2w2TZASY_97kgeV23
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b18070 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UWqaS1yFD4rTGqj9qVkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7DtpesbyoFrbLSX2w2TZASY_97kgeV23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97019-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04E80265BBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for TCSR Clock Controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml     |  2 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h             | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 784fef830681..ae9aef0e54e8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -15,6 +15,7 @@ description: |
   power domains on SM8550
 
   See also:
+  - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
@@ -24,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-tcsr
           - qcom,glymur-tcsr
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
diff --git a/include/dt-bindings/clock/qcom,eliza-tcsr.h b/include/dt-bindings/clock/qcom,eliza-tcsr.h
new file mode 100644
index 000000000000..aeb5e2b1a47b
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-tcsr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_ELIZA_H
+
+/* TCSR_CC clocks */
+#define TCSR_HDMI_CLKREF_EN				0
+#define TCSR_PCIE_0_CLKREF_EN				1
+#define TCSR_PCIE_1_CLKREF_EN				2
+#define TCSR_UFS_CLKREF_EN				3
+#define TCSR_USB2_CLKREF_EN				4
+#define TCSR_USB3_CLKREF_EN				5
+
+#endif

-- 
2.48.1


