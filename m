Return-Path: <linux-arm-msm+bounces-106076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA8rCVr/+mkOVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:44:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE27E4D8009
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 358FA300D746
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 08:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34113E4C89;
	Wed,  6 May 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cc/ytROm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGIK73ix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2453E3157
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057045; cv=none; b=pB4UNXyxtFIUpr/YGA4NR+bMBkYqc+G5yTRN36rHXSmvjICpDmZyrGoUyjCH9B0BStQrT1eX9mj0s/KtJCJEPA2T9//ByPPhjOnr8Bv4VKFbEYJu04ivTXdEdDeUlyypNwZ+ZoebHmo6GwPe53CG+pX0GQj/waMgi4B51w8VM4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057045; c=relaxed/simple;
	bh=eqZNR351Vtb4Sw1T+jYuH9TRyuz4xIkqLpDDeaojG1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8k6D2Nt+80jg6MssGAxurz6BBfezdfFssyXHxYwBdl+mstI9kfgWtUriFL+rH8AS1np1YlgEGgEud6dQQFah6Z1DAyU9HZbZyEFDmYqcqvt8fqquFjuks7RX6JApPqdFfwswI3KYf1AUz8O1mMUvlBl2uihoLSePUHxwdxVIvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cc/ytROm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGIK73ix; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467CaZ51527764
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 08:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qKdaTvj75iC9+YNfnepvjsZUDn1HOgA0SpMkRiRCZA=; b=Cc/ytROmJe+3P8Af
	Wn/VDWnP3cTVGkouF5+Cs8uMtRFDakDI5gDe4d/x9BMki1+T4hCqyspNyxsXCTtq
	nnKYlAd7ZV8WvOvDtqONAFCAq+GMllxEhCaUZ78axxNXoHwhy2w3YwsrUuHNKljc
	N1zAKa10DaaoLNToUX2tN5FhPIVku5jpX6Mw1pYRgUQMi4JW/3Owy4XWxCoGzNh5
	nGFSG+jeqfqwR2WvIZY3GB+SJvcSVrI5YmAAQXoRV6FgBVRpfqrFX3pygU2KZamt
	mYwSdz4tUOr34SHuQNkeg4ufchuFxvuXgeSB3OIh/FFGnYfnPAwcehJpoEpS9IHI
	3j5aww==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01288dr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 08:44:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dfe06b670so20822647c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778057042; x=1778661842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qKdaTvj75iC9+YNfnepvjsZUDn1HOgA0SpMkRiRCZA=;
        b=ZGIK73ixDCna0VFVC685AM1x2vk1PHwPWzOlJwBOSxwmW3gEwqZiMufuFnixYd7d8t
         8MqOgnvF55L7VUGfkiHHRYXpxp5bJSqXt9K4e0rEOhi13IOtwgeGDoIm5uZJvvLF/DDB
         rDDdhFoeUBy31eZbEirrnMDGaDoQj0xpVNef++YUMGRCM67xN/1Z32BZ/fM2m1YDjB7i
         HaTpjT7Fu3HOnUaB9ylCgGLx6J1L8MQPX/QCLR1NcBd+oxIuq2JsmzC2KnrLRAU5EQuu
         X+xQs/AtuPWDJXWEJZpWtEezzrzWYX54q9Lhi/6pke7jAx/nvfna/ZmPKRAsV+hRA99Q
         vvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057042; x=1778661842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qKdaTvj75iC9+YNfnepvjsZUDn1HOgA0SpMkRiRCZA=;
        b=m105DuJZWzWE74gSne/7gIYaSKTfU10ibw2pl7byEY0YIjnpCODqsg8pb4YxM9Xh6J
         cbsbmhSqBHsln9QnVeSlyBwHexb4HS1us3oOm2GD/i96jW1HEk6kLKR5wD1mOnYZvlXg
         kCaUUN90lMG2tcDIjirmwU7cAsGjSIqkbxz4JZZA1pPs5xuukkMywvMd0olGFrdflj90
         NvwGjAA9Xs8VlU9A95ypkIBbKK90A+GoeY9cWriK0n+3sgRw4RTdG/iSPKvt8LO2mZm9
         LMhy6GD1oq+0k181jpd0p39h7qnfoKuqLRmcX7HdM9yjIcc1QC+muLW4WsbDyWFUzXiK
         t6rQ==
X-Gm-Message-State: AOJu0YzuqJSnCfKTU8IHkl5l5mfOZxQadWCVfmszd/eQojLM4fczwdsH
	oNnFVNO0Hn5QbUlqZTeQogFh4X/OmPy3Nw1jr/cztpdfzCIXESYFn1UtWZDJDWlAp46ITZq58k2
	q7fRb23KNnEEWNvgJbd9FLtH7d8VSLSjR1gbMJFYWq4eBQHOJCJUBt35J5pLQaRYhWK2Y
X-Gm-Gg: AeBDiesc048krqHpZhSbftL/gtdc8fgjCmXHyJy/BHP0msXe3Rpx31WSrREpuCMW8j6
	WNy9Q4MTZVwJ+Qxnx7W/mHtb7LDfyI3H8PPYZN1J199LpZn/zUcmtzJbesoOTPmUWcDY/sH5hkR
	Y6EVFSaKHLnmrYjNkI48I0o1MEKy9jw5NnujoxUfucHGsWvU0VpabTm9EmpS7MrpooFWbBy/8mf
	Vdh+L1Z7P+tIlU2AO5c/lhKTSizdyCN0Cc83OxJlfbY3E4PoiT8209m2fITI5JQ1tEPO6AWsmDm
	MHn2UZ5VEYsw3zUSfmBYyQzTb430nPXllxaaVUMedwjKCiXUe5QxLmV1KCRDGPUpnahoq3T/GUD
	09hDMHF0gLk2aHKVQBitvnFfJH52omAY4fntZxo/DXQXVkvspqZ8V6hvkBTlyXNdRlx0P2hFoHj
	fLbUw=
X-Received: by 2002:a05:7022:688d:b0:124:abaa:7ff2 with SMTP id a92af1059eb24-1319cd26b6cmr1279967c88.24.1778057042372;
        Wed, 06 May 2026 01:44:02 -0700 (PDT)
X-Received: by 2002:a05:7022:688d:b0:124:abaa:7ff2 with SMTP id a92af1059eb24-1319cd26b6cmr1279951c88.24.1778057041903;
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13202fbf0efsm2257796c88.13.2026.05.06.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 01:44:01 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 06 May 2026 01:43:51 -0700
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
In-Reply-To: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057040; l=2788;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=eqZNR351Vtb4Sw1T+jYuH9TRyuz4xIkqLpDDeaojG1k=;
 b=VbrUi0OkuDq9hoaARgM6/TVTQaxY/TXly/WFEeJo9kHpiNb95b7xnO62/Uag96z+gR/kguLf5
 yGebgAyMbc5BmME9K5xPqRIyHCwUMTa/7/qGEAkJqd1IvZT6dua//is
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: aTjdSIWN_Yij9_ZchvTrzUzMltlvf85I
X-Proofpoint-ORIG-GUID: aTjdSIWN_Yij9_ZchvTrzUzMltlvf85I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4NCBTYWx0ZWRfXzNCA1y+zzEXL
 Ed1tnnyyxHigB0KvewL/7dA7jTkNMA1uG90hWMDgfYeIVXfSnCc2Ul9icMi4c2+BIeDLZRv6pin
 5rEGKr9SdG78CU8yj+d/Cy9M5hnj82pUDCD5FaqAwJgBEArY9bSdqHtQ8KpFZkOPAW0KIeaC6AG
 1gFNsZ71SPgvBxuovW1rZhJUxwM7GotPjQMG2qPULanCbh1t9TGY6NtNAqf9Ft4Jb5tyqI83ChY
 yCV7v7SZKhEqhewgk288XRToMv2bb+sqfS6hC0nvgOrRydLMgt33cc6ssTt38Z70AkMPY0qQ5bC
 4qv7MLkl13PVnQG3IyD6Mw9JR9UPdIJ5zT+x+v0gC7Qa/bLtjNaEklmdpDcD0GSyvG6ADUHr9iY
 OwqyA+j2kzS4desCimY6ph9n5oreMT2uI5Cym2C7RQ7FZO00JizPCPFO6xmjL7uJ/EaWpbN2IGv
 Ttc0he+wk9RtJ3fhf/w==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69faff53 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2TsNLSZGWbgVkw9tuboA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060084
X-Rspamd-Queue-Id: BE27E4D8009
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106076-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
required by clkref clocks.

The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
QREF TX/RPT/RX components, while SoC-specific topology and instance count
differ. Document them here for qcom,glymur-tcsr.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1ccdf4b0f5dd..57921cb63230 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -51,6 +51,63 @@ properties:
   '#reset-cells':
     const: 1
 
+  vdda-refgen-0p9-supply: true
+  vdda-refgen-1p2-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-refgen-0p9-supply
+        - vdda-refgen-1p2-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+    else:
+      properties:
+        vdda-refgen-0p9-supply: false
+        vdda-refgen-1p2-supply: false
+        vdda-qrefrx0-0p9-supply: false
+        vdda-qrefrx1-0p9-supply: false
+        vdda-qrefrx2-0p9-supply: false
+        vdda-qrefrx4-0p9-supply: false
+        vdda-qrefrx5-0p9-supply: false
+        vdda-qreftx0-0p9-supply: false
+        vdda-qreftx0-1p2-supply: false
+        vdda-qreftx1-0p9-supply: false
+        vdda-qrefrpt0-0p9-supply: false
+        vdda-qrefrpt1-0p9-supply: false
+        vdda-qrefrpt2-0p9-supply: false
+        vdda-qrefrpt3-0p9-supply: false
+        vdda-qrefrpt4-0p9-supply: false
+
 required:
   - compatible
   - clocks

-- 
2.34.1


