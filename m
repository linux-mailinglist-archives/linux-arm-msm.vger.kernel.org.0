Return-Path: <linux-arm-msm+bounces-118935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id apIFJcLHVWq0swAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:23:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1AA751194
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:23:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="KKH/9fon";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PTGcA01h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118935-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118935-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A1F4A3015CB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E5332AABA;
	Tue, 14 Jul 2026 05:23:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373703264F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006584; cv=none; b=VlPXM4WjWcXlwJKAr1VYDRq0WTvQcDf751U8DBYMCPkleQU9fs5Vaep93K+zYLrA3/9aTnNhu105rmmvvG+oo2v9/WDI2m029vS9KZAt+Lz/EnpqDOoB9gReVMVD9GIEQxD2DOMcGbsdfyLkJJWjWhwLEOR47/LFYag2B6eCuj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006584; c=relaxed/simple;
	bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGYcWA+/i45EZhSm97hdjl/BzPWEQ3tpN1Wcbnde8g1PkL6/HESiqzr6uI41jsJWIOxj8iX0yzdimOvais+CUSqAoqHbo8v1Z753D1io5wvHnhqKDRX1kt4kedzzoClCxx+pGY4DBGR7eLSOz1Wh8qAJ7xA5+BfB65HywUOENPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKH/9fon; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTGcA01h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E3f1dp3365592
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=; b=KKH/9fonkBNOVpR1
	rVxgofexQH9l47h7TFO31yeECJe7CMzRyK1uLHjyFsJfcEmv+Cp26pbH/gavqEQS
	67ldic5ysX4YDKZEdhkQBSI53kjdvVf6dyHyeeEF9e6RkoVqFxvv8HYpiPC8QfA0
	K7tbTRl7T6TxkrCoG6nChRoLWZM+dQ2CI3zZ8Ze/vUffDQ7cPEAZQ+wCsg8HRsB0
	88iZQ+hCgl45a5WDa3v5zZjsvjDb9bm4wszCHDUeMLkk4vMzIueN9+DLySpqh/dP
	UvMu6+x6YAOaxIkcUULZhfRGKFGSONnEf7TRCfwoNEnVoiPq8mVwtjxVdD+ad0C3
	uTGdCg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde08a0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so598604a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784006581; x=1784611381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=PTGcA01hXiHuKtntGxGSWVIXdR8iriuyiRzZTMEkMidTrmgwyhfVzo92QHqKeToUfC
         3RiPJktnMTeSPYm5uK9unU1cXVLVKm8N3rxuv+8NSza5PSscEr6JjkemF2vnLCROr8m3
         6xF4eC4/dlulkYNoT8IgM2mejvWjKfhF6ZWMP8FW7X46diKDLP3yu0kZ79RgZnt5wYs4
         YzT+qcwO0ALiJAZJlRaeSUNkGxCQMjf/8gQJ4GuQWorixNsyUBtLHyWOoJqMbXk84LNZ
         csoIuSAqjOTLVM7KQSCYIiF50mw9EcCOmjYnuj2WmERimKR/JHDhAx0caBw+Tn6sxxp9
         IC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784006581; x=1784611381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ze57ivEQaVhQmk2GKsdaZS8G8SlBGCxdyc/OInFHA+k=;
        b=jU+QiiCOG9ghSHboRKhWrubXqjbjVezzKLF57XxDGzzuunJb3jgmNOsi3IVRm2jMUz
         SBDKRNAEH9GJe556r4hv8pQNOBIRT2ey5rTCy9wro7gtBG4Wz9ChMaVUoxX0zLX4meIr
         +LPwwan+TVY9R9AeIovlHsTfDFgx2cu6LBipbv1Ix4YyVg04yjdomczG+ixKDDi7qNRg
         hCejMXdNBBi7ly647iQUI+MOLwU13CslHEPOeuXi8fSgfeL/WlzgekLVauqdY1oUcK6D
         acoUGXFa6Gzze6RbrJCBJZlENDd7trlOaY0Wog01rN3ojasY7BHYB0U9y9gz3oQGW2eA
         cbgQ==
X-Gm-Message-State: AOJu0YyokNUM/eP3ip6fsWZbdhX5Rzka9PSpsjW+N15ZHI+vcePCt9vh
	IKZz07IYYxB13lhp/WPnPSuaEsOiQGxn/oylYQKNSj/WyHv64ON/y/GcFw9GArFmgJGye1dw6ZO
	hdggwMvqswGQdrdwL1PPk8rbTjKmIph+Lco1l3tm/SoPjr2CeRyJLm7bd+HJw3+PrNfJY/ThCqD
	G6mWo=
X-Gm-Gg: AfdE7cllC1vDCcG2frwKOoKaDLMGplFyljC6P4mBmAgdoI8CQUhxWnqFqLz1P9PYo6j
	LrGPTRDN5/NLYUS6+lQosGE/CjC2LCF+KGj8oXkWKh5x4p7BAIMpaBDt3U7Sw1hhfCAQ+To2iwj
	3fcfFR3qyJoJyd3re18T4mpeHNBqdn+GK9reQfmA4BJqYsvIKjHxpIGSIRUpKdcK4BHaFJptUUi
	+MatxFQ3B0uibLsc3x+XSoBwFAao5MnHWJeoo5gHtxAQCbvMpPevHbLC3JWSO2zNVi91UE3IL5S
	CUEVauPVJo9lsisqt1+wnQt4c1SxATxNCWWXM9sIJWy1ztxZy/8zMSkl3Oue7a880kKFtNdA1U+
	C7wFzZ7thMHavnr+0Xvc0k11BB0rpTI4pOiBjH++m9TtjsuAdEGKV8Gnk21GjdC4=
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr10333561a91.7.1784006581021;
        Mon, 13 Jul 2026 22:23:01 -0700 (PDT)
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr10333515a91.7.1784006580441;
        Mon, 13 Jul 2026 22:23:00 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm78609864eec.30.2026.07.13.22.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:22:59 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:22:55 -0700
Subject: [PATCH v3 2/3] dt-bindings: mfd: qcom,spmi-pmic: Document haptics
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-spmi-haptics-v3-2-c931bb7cb94f@oss.qualcomm.com>
References: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784006577; l=891;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=TwIeX7dWxmVsmvw4YK0bm5xz6TMcOrj4WJjtApbR6H4=;
 b=VT59IsmSkwi/GREk6YS6SX2prtA69LcG7Wi16Kl5Nz/EXdWB0alyF11HCyrNxaJ2xAxBj0e3c
 WBvKb6enjz4DUycA1Uw5oKGokzg62MzZFziM5BXM6YGasVjT+JA6JhS
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfX9fjN3x1ewpyH
 TY6TRTFr+rGhFm847kRAqv3Xjh+dMjK/eTsY+dsjgOsmiptrUlJ/xDBNgndUAb0lcXsgVbrHqFh
 6HGWUQg47TPbHTKOcrWIPGueGP18ZDs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfX1ctF6iXZlyUw
 LZTwz0WdIRlCftSS/WdvngCEEoCEISaMHLWOpr13ovlVEYxUdhjUYKjg9e8mvsJRczCVa4b3u7w
 LtFUo3cj7GYax/cKXEiVSPrfcWV4mDDEFFf85n1G0uZxepkCWUcP6CcIWUP9j/PMlC78Y5KO4KR
 abtb8nK8JPPwYhBW+qxnLZW+yWC+g4eZ+7ZlwZap++M6v4cdbgTSsR6Y6q2YFvR6lB5cFSUONMS
 bUJizsvUeqif9jCvfB6MhBLSDYfXlWGDYKUx0ZfT6EE9kEdNlWBFF0Vm2rG5nXDypwRvSQPcWa/
 cgHncmTae8bFzlz79HYeNr7hZq1agUPcRDnvZj1YjwNHTp4A54Q+JwsqtJZ2SO0A7mvMdfUSHie
 I7D+6rSVlTSKhUk/cMW83BrXkPQxh2eG5Q0np7k83QBh2asVqNBxBh5e1YccuKobPPLPp6Jc1Ij
 t2pfyCRXFITWOdMJ2Ew==
X-Proofpoint-ORIG-GUID: xLN3AfxjUtNdEr2SuZ7dpm568O3o_Bak
X-Proofpoint-GUID: xLN3AfxjUtNdEr2SuZ7dpm568O3o_Bak
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a55c7b6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aKV5VrVIVVfq6qmweGsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118935-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E1AA751194

Some of the Qualcomm SPMI PMIC has haptics device in it, add it in the
device list.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 644c42b5e2e5..773f4cba5935 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -165,6 +165,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "^haptics@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/input/qcom,spmi-haptics.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.43.0


