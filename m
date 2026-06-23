Return-Path: <linux-arm-msm+bounces-114148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +6QiKyVbOmrK6wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:08:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DB76B617F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:08:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m4DgDeat;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gPePOslM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114148-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114148-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF27B30E974F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EA73749F0;
	Tue, 23 Jun 2026 10:05:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8D437106A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209146; cv=none; b=X3D3Yh9WUhaI6a+jG+DydyP7I/V5n9ApkhJOmCiry39jg+wvXuVRV2zpsK2qaY7f+H+2BIpN7SuEqYnmjI3pozcF13B7nBn0r2kkw6kp9AuRYHO0x+8fJfhi2G0ZmT7FqI2Cf3KjZmr7yj/LyydPo4YoQ30aOB1/pBCOZ9cGRpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209146; c=relaxed/simple;
	bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXJYsT3uhz5tXd6Eu7fiHFXi0FwTIkJMLIwZ6Vo6Y7nFep3sIV3bgPWjmWrhBsfqjfkblozgPV8jA7qpTUsfa80UMkJjYwkQCnwysi4H4OMlHP4nperKyL9ok/cm3Y2hMD1szgDBZXRW4bt7acWj9KMXWGmiD03H9ZcOjcZ+TKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4DgDeat; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPePOslM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA3IbB952936
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=; b=m4DgDeatgXlwGJKX
	cgzU0Mj3MKNi3z2S7XCkDU3Ip9i1B+/emvWAIoNXRlF4XLH5UAQAYDo0qs5ZCB/S
	Jqr3Xs/uLZShgSIDVgvSrXKt7/q7u9u2tQ0Z8BniENJqeeV6LUmdbgo1Ise4hIZQ
	myqLJlIGFod6E1KwBEHwJYciNjjueBy35nA0QlAiC4L+Mdm76o8TZHm8coTqoICU
	C34/qiBfDAaCe/MWRiBtXQ4sOArXk6uloGnaSOqQNik2sUXV4+RDKNBMR9Byr10b
	P/OAZlbWdAlYmPUb6B0c7M/g7ycuOAKrlAE7sHGbzLyrlwn1Ae0bO0JwqHBOVGOd
	t4QG4Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28r0hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137fe4a3640so7364376c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209139; x=1782813939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=gPePOslM1ZASeQO8r9DGeBwWlIKAdgnBt5AExyu6PNf3ZrLsZhYTVAkXeu63dHyRQf
         hZHekmpkoYNgs/gcEMA6OhbrUt8A89zumxQ7f/g3dpAK6Xg6GlRBcaUAF2zAqUdbuC36
         ELytuSs26MybWkl9zaZW4QFQE2dwqsmHSo084oJmWj4fsLldmhle+/UC2Du64zv9APZu
         6I0ooPQGXU7iVFjda0aZZczdi58en4UMrDsSZd/fqxOABerx769l+lJ1xfM9WVmXbnvo
         rupSB06z50YnW77awt8kS2d+1AalTd3tchD4Vm3v+kh9dLsgQwlfNIzoeZC/la+5U17W
         Azow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209139; x=1782813939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T5qiIsx+2dwMKk5877pZ1wxVPnaaufjkpooV0Vvk8M=;
        b=pKgWABiDaJIWF7NVwEokNUyST/fHdkyYpUWCLrpnB85/6zdsLrtXFf/WQL0rY2g3Q3
         zVhZlJ3/RViYqI3kvJMuCSksKWWCf/p3eBChSMgK/9yRrZX7C6ZB5hDcthRlMwFuHQrV
         WtsPR7zm8WCE4L/22zqJjjcx8nwltjcDQpb2QUtybwtIy4fX8ZkGoQrL/MZw2YrQNcIz
         EX5KXJDGaWdYaRDHPWgEa3U15UrG8DCC9cbu+aoNg/oChh5DRkqpt5fzkN4M6b8sOFdA
         agwSVDCElw+kYuxR5euDI0D7ie8Kg7xXZ5Jrlnkl7/yG0baiu600x/vX7yef8FSO7BTB
         qJhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/in2tjaKE9yfJTfgG0dAxiDZPTMTpT52pMEhPbm/3PyMl5pa9by3bQXkQbGndcTYZJIMFTiPYf5b1u3cOh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+8JEYSqy3Cv+SmAZxXiUmdXNXGjr+tFg58NWlBEF+auETw+L
	5dGmE2+tl4r8B6L3/OGa4ffuOgpFdfakYk/hBLkILtPPnGPPJbzO7AOMjGFCwx0WGV87mRaLnLo
	XYnHdshA9BAbqcAIoAL7kRqaZYYXHYp8eSRu5y9tjq4UMj8j7GtzYpeJuVUlqTXVg0ELt
X-Gm-Gg: AfdE7clDaf70m0789x9GSUHUv/+ExH7ewOl9DH7nCGZPBP+X/J3nxdye/NnfsUS7FCz
	wAFlrY5GEUsB9b9MBzIbWgiVOjGjFJc0Szly/hDcQUd3yYllVFB2QD7MXJNrx/AfvbT8DIJfuIN
	LmtKENE1goZorNWTSa02MsIN5g8zru1Ut/X0ttZ76odeaeRxaV919LJ8Bo4al5mWyJ8SwrrcO6B
	OSDajKMz+ca8NLeLNhO2O8ZOsdJvhgXJQnKzQuxMvu3n+tz4zyNPG9/fPsDGgmhRqRk7vBBHeYx
	eSyItrlBF7Vpg7GfYz3GuyxqEtO+3VR4tsP0fqDxMQxDHf5jumUZ61ZY/4am8zni4RFYLPGCLU2
	rnV9mubIJK3gIUgbO8hlypSj1wSkgY0W1cJURFzZjJVSDUwfIkB2oX18y2Y4vCw==
X-Received: by 2002:a05:7022:6093:b0:138:6027:b768 with SMTP id a92af1059eb24-139a3880c01mr11720726c88.27.1782209138754;
        Tue, 23 Jun 2026 03:05:38 -0700 (PDT)
X-Received: by 2002:a05:7022:6093:b0:138:6027:b768 with SMTP id a92af1059eb24-139a3880c01mr11720674c88.27.1782209137153;
        Tue, 23 Jun 2026 03:05:37 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:36 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:17 -0700
Subject: [PATCH v7 1/6] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-1-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=2807;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/AyXfvDgL6xS/1UvCVX17NbhNe6WnF28CEFcPHn4+7w=;
 b=7xdpDTCpx2iK7E3J6J2bs0WvfqwcdzG+erfMrjBxniPOikOuzIlJnHnStAJvqXKbmxanC3C5j
 wKRkUSg8lyYBwTjM4Vllbuw0ajwBPgji20LmcA8HjQESh2Wz8/7FvgW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX0z3YGdaL/3EU
 NqWbxtuEPRuNWnW6XQWX96y/YrjCbtwhafgElpdIAZqjGOdpiFHl7ATc1sXo4gKtmUbMNU5R9C7
 CttT86C5gGtJU4y9NT6xE+dyLuEqU0I=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a5a73 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: KlupAjVYp3vMhbKOnRJ0K9GQHBls3crq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfXzlCnCbcAgHyV
 FNGLKmrZnOWe8FbHGMDAsyGgO4hvqQihbsrjchbplTLpzmtHPTJ7K3trWL2+IjyOf+d0jIwe3nQ
 xP01iR3Ga9LfyFSC5MkbCqYbYJY7ZeradvgGOsoPmzxERyR+Ki9iGsIGvADU4Fex3ImmMStF2VL
 ZOTNqIkFWQXO4rTnJxs5yn+CVS19PdB5xkCNMATPLqvtP0pVNEN7mtpzB3Dq/AAYak/c92XCxjG
 KBuKbKrrfaRRRVFxEFhjLNQ3/sgO62p/kkxsFqWML+MG5A/lOLduEgZpw2AlRUzCWwEtRE/OPMU
 ao5/Rccou/nTRQhqfcm6jzCYvODDxozC7QEtyxmTQoUA6dp7ueLZWwOSEsMbWYg5ua3XrBKgKNH
 3DeLSltclulndodtFT88aJyqZ/dSuw==
X-Proofpoint-ORIG-GUID: KlupAjVYp3vMhbKOnRJ0K9GQHBls3crq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230081
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
	TAGGED_FROM(0.00)[bounces-114148-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 06DB76B617F

Items in qcom,adsp.yaml has common clock and interrupt properties, move
these out of the allOf section to avoid list the compatible repeatly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 64 +++++-----------------
 1 file changed, 14 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 16a245fe2738..a270834605da 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -32,6 +32,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
   cx-supply: true
 
   px-supply:
@@ -49,6 +57,12 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    maxItems: 5
+
 required:
   - compatible
   - memory-region
@@ -57,56 +71,6 @@ unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        clocks:
-          items:
-            - description: XO clock
-        clock-names:
-          items:
-            - const: xo
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        interrupts:
-          maxItems: 5
-        interrupt-names:
-          maxItems: 5
-
   - if:
       properties:
         compatible:

-- 
2.34.1


