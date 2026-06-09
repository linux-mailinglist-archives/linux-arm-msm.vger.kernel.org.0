Return-Path: <linux-arm-msm+bounces-112214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IDi0MMMuKGrg/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:18:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FE7661A4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:18:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IcVwrW9o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I6nYiIoS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112214-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112214-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EE17318033E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A745547F2C9;
	Tue,  9 Jun 2026 15:03:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560CD46AF0A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:03:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017400; cv=none; b=s6hV3vp1B834OHdmnIKQ2Uz9XJPPurYv6MI6Kzz7IRaue70ntE339WAL7wCO9aN9caZgGoW7nf97fhn+xNHALoNQZbNoJepeX7d/eRIS7vgisxSOmSewhw9g7vRg/lhbbjs2JFPnZz2PXpAi9rENeIk58pDCQdnJ+sTHX3F7IAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017400; c=relaxed/simple;
	bh=8L5vYnes7RR9pjKzHTGOJ9KFnzCMRB0Ccsm4tviOof8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8YtpbEay2CJ8lGQnd864eiqqsaU0SQVW0Eivl7956XdEmL5YqKGhpUZkuYFt/eFOUSf4+fISiWIeG9w+oekwwG+N/Q+uWVu8GgMgapmi/UTE9yYPndiVJ6V0uBdyL2/TTa72i0uQ8jSRndgd7W4BuDCbH7Tm3OIq4z2wabdQKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IcVwrW9o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6nYiIoS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Cn23m2702114
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=; b=IcVwrW9o+NfapYtv
	CIAduC32ao1/tkLzpvjHCzTlXH1LQoIDE2Kir3Y/F2/ruJFFTJCVaGVzPIc+bMNt
	mTDc9YqfKZygjfDv6dRHAEUN5sOcGsiifl6Cc9hgm1oyPivNdWaWEofrdmc5SzMA
	dRmcY/ACmZeYKnFc9v8NuZ5uxiS2IoT/1m2v6jKoHgVHq9QFpO8IquibhlV4oRNt
	i9rovs3QjjDPCAANZG/gyJ1A9+rqPjt/7phkFPkarTL1inAF8cPeKjKNcb9XScS7
	ZNShJaAGC37mxHklK8aiGIIQXKUWz2VkDpDbN7vToIBNi0iuTVQq5LD6F6R1aRP/
	djV17A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeat329-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:03:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f544944so4176718b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017397; x=1781622197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=;
        b=I6nYiIoSpW5as6KTFcDQmQUYs0qqjmtDlN2Zphn7dbAJ2CaZNQSCcRE4MsQtbfxUWr
         tnA3ZMpQFz80yzVD2aU+Mn+eW+HC9nMhEVZYTn0tYw+BNltvuy//GsRXVQJsBolFvSOx
         WHjgK8CTjYqcZLHflECFME/nZ9IOJXJWdEA4eVf3N2GMZhi3R8fgvhfMQ2HKoX9zw9zW
         XtrSRZi4kc/01DJJ3UAOAKnFgSeOHoOMfzaS3SpL2AxZP0eoOj7GLCYrJJKayCq97AT0
         Dtjxs7Nfjnd9YfWmp+UIhK9Dr95XOHNJ64MvhJl/aYBbn+KfK4+oah9IaQ9dieqBgHFM
         kKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017397; x=1781622197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6VA02CrdopqkVJ+OxTePh/p8WTcJpa5AIIK2SzS983k=;
        b=CPwpJYo0O4ZFHa2D0zXg/iKrVzK0beRkeQjgILXIUG6cgrtcyB24OoRjwrF04tj3ZA
         7EtqHPtjLS37pYoYAzpBLyNdPp2Y5MvDS54hvhRoB4TgRyRDcAoDzFqXWVf0ivwfPQdU
         5BcWZE1PyzqyPf6zAccNI0qRTTVVWh6omi4Tf6roi4DAR2g7lnksRWJWmXxe4Af8FGND
         zHTaCkuzotQEIVcr8Whl9O0mVaIKwycDZsBwECFH8sIFsiYgN0pM5AVby9nAUee2HAqh
         JBPBHecxNA0HCi++rkFGGuF7xVtOOqHA81eEwi0bHzjbTcitlT3hG5jhAi5+qCE3ecV0
         shFw==
X-Forwarded-Encrypted: i=1; AFNElJ/0q5gTNOuMs8sLkLu9fS4XlLQA9mEayYnbARYcd2IKMlCpti9sxwqy2EBfaYffj17KbVzgO7Hmh1xzrumF@vger.kernel.org
X-Gm-Message-State: AOJu0YwsBNdA7vgK0CQjJB0PlxTl3MPnFBScItg00HdieoGrmqz9Df4l
	jlquNLrA0kOwYYfKH3Pe1NbF5uTgFSvin2pPbtixQt6K2wdc4nIm0gOAdovyn+lmYgYOEUOnDaI
	iAM7QFQLFL2yMjWyO9JRw0HQGeDefTVerUt4NycgXIt7z05995oiab2Wc2oHsf0c9+cTQ
X-Gm-Gg: Acq92OF7sLa5hRordMCyLOtrjw54qxJKUjvi3pTgiNoqGZUHLBn6AC9fVBWcjTF44Zz
	l/bLOHXRM9zSGpvujpueaRhwaGjcZd6KhG691qgI0q3wwbk/LshuA34nQb73o1VeXbkvr4J5mHY
	u81t4u12qRmgH8vAJu7kWADtSDW9AtC+no090YcTuHeRLY/vwAsJfwkdzi4IKuegWuP69uaS/X6
	4+dPVXjpj8ZWTZS19w1RqGLi0x0zQihviGX/bsksI3Axd6Jgl0kjGPM+D1tdjMyrOVASWxKo6z8
	ZFimdx6DbcKXlL73mwSHJ0eAkTWXtFTmxsEAtiR0bMAi7UOednoVM3C3otIlbuVsV563e4lgRAg
	IDrERmYMruiThICpBsQG9wSpm0tJAqE8C7YvAa5Zpg0KkQ36W5HRc3BVC
X-Received: by 2002:a05:6a00:90a7:b0:842:432e:b7ff with SMTP id d2e1a72fcca58-842b0e82357mr21917306b3a.17.1781017396718;
        Tue, 09 Jun 2026 08:03:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a7:b0:842:432e:b7ff with SMTP id d2e1a72fcca58-842b0e82357mr21917178b3a.17.1781017395816;
        Tue, 09 Jun 2026 08:03:15 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:15 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:52 +0530
Subject: [PATCH v6 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-1-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: t1q8nTHWWaLsiCFgVCVWDW1bkR4bFkzZ
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a282b36 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MiBTYWx0ZWRfX+bsOR4W8STEh
 P2N4Qr8+C8FZE3bzLRjAe7Y5oh3k3hS/np2OxaO7ed2bYcqZNp7SfnXCitv4JA/utlq/vL1PFx3
 WYt36MdS8XYdN6t35Dir56PY7PkB6BMQQ1PeOd8ygaaPdnOXApAG97YGaRXDaaRGnGbF4j6FGIc
 99Wx1CsOd6ib3okngAkZFr+VVWAk9NL1asb6FszhHnekaf00nxGO/OOUijoqZJpWrVWXjwMbPsC
 nfqk1QNWH1F6ztKWjW+8fh3dBLNg5B2ga58fNMyK9i1eKiR1VOA34uarpVP1m3YBXyzmfVdkzVp
 D0+lEzFidCSLujNPmXKCFCWBQr461DUUGYkLsVYQZ2Xoz9SqL1R+gIgGUu9fl1Ur035ognPYgC+
 xmkBkf+O13pYGV569f9Jagk3t5UbDacUj5YWqcG0ZFbIB7ZnY21SWoP8VxMXNJA5JI1OII3imYt
 P34Vw53fBKmwML0bzow==
X-Proofpoint-GUID: t1q8nTHWWaLsiCFgVCVWDW1bkR4bFkzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112214-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,fairphone.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80FE7661A4B

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..c0c9e450b8cda53625b6f6bdb1bdfe5f2bfbee25 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -29,6 +34,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


