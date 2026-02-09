Return-Path: <linux-arm-msm+bounces-92302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MXQG57giWnGCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:26:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5C710FAAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D28AE3039832
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65ABD378838;
	Mon,  9 Feb 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biUs5iCg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur5EHJ4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34262378815
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643430; cv=none; b=JS85OkylWWmNGVwEeAyR/8YE7DurjoAy4i3UguB2eJz7WD73R1k9fF9pkUvBumhPxpskCh3EoQrz+gx8gcl37PG0rzQz9GDFjEVh5T3MOxFPuB+xb+BFJko9KTkocTDe/lAFcGOIxpXuKd7xItMyYU6XBZk5pUPrCo3bu8r9cxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643430; c=relaxed/simple;
	bh=k9lauc3Hh3BMFWnRniOQyvTXx6hD1H70MySBsc54Gj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HGbSWjvbpttt+EqAwbXhi/qFvzAJrTJwm8gPTQc6xpubDieqvqtz+xB8mQb/YdZwXH0KtV+qwzAxxlA3hVwYsxzqgTLzA7+sZbp/NUG2Hf29M090k+KShShnpZLjR4wHI2Di512eCB4wQb7SipsGYjd2O30tuNPxll27ZGO176U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biUs5iCg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur5EHJ4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Akh2n3699839
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 13:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pd0Oue+f/5oWenlbME183+SziTsorttAb17UtJLe9IE=; b=biUs5iCg34hhY/Ll
	EnBx9Se4wYIGGgdNZXIEYKntw3zkRqNm3rLpRghBfFzMS+M9BY30aNYoOfVQwdC9
	9Ild7MQvuol1ZgInUb1+YxnsAvLJef+Mncz9cB3aFU5VcNdhR05xfh9ua6fRVLIj
	sF2OJrbTidu9Qw0fYW5L6hRKTSsrlaMNzGBUb0FA5QTY5enIbzENDzehsGwp5V30
	dGp4u5C3ofGkH6KQ+DQFU1CrjDfJAwh3eySirwxjO9mpQgQWcXd+UZyxBNV19ogc
	WOpuxwUJDyGM+3e77lBin2VFxSHSdvLy2eiomBnqma0prNq2SWbFyghYbP9A4vko
	C69zIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e4m8fb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 13:23:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad3380076so12853605ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770643429; x=1771248229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pd0Oue+f/5oWenlbME183+SziTsorttAb17UtJLe9IE=;
        b=Ur5EHJ4leRkcQSnyzNv16YcVgnj9AZd2WDOELJC7PjUAnvzpGiGQdcTUpBo9UrfKiV
         YFf6ejMJ+rfr/FgM0RsatRxrJa8eC3iJ/iQreO9P1rqFiBtmkD0/CDIv5r1ng7mAyzev
         p9PVOH0q1Xd29yLNP9rgTA8g5wnA2ITjBcHTZ1WB1uED2Hf0ikLjpzQY5+x9GK3ZIdNp
         hoYv0QJnjCSQ1q0dV2U5vUpF+6F8ZI1lXRaIrwCJoRXzJe19/Vc9eiQY0ERXifTe91Ud
         mrqeIlmM3yHbN0D4rEibl2EOvRMtT/8M7srzJzbvPNgm8QFWPC2JVsrxjw1aj8IKhAuP
         Xq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770643429; x=1771248229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pd0Oue+f/5oWenlbME183+SziTsorttAb17UtJLe9IE=;
        b=wQbo1Ctl41AWa7ZdtQ5xCOUXYPhRHmFfX7flddtxciC+iJfScySUdck288Us4V65Nb
         ZpISTdWpj/dcFFNe4OrmT3cokG9JIWnYEGpzM1SusXB+P8JQErRjpJN4BUF8fQBCZnrn
         gmkZfvA98ck1mARd+X3tnwM5+Xo2loK5iLWws8Z7HfX3Akgv2/SFDJQyMxoZjUtP6OQP
         7COVcBIanYIDJcgHrhN9PqKt3jhMfzsUvX5HoCS0E4QakcJGlE8kmUDgGFkxVsGpRYRH
         QJ/5ITOaBWHvMRJOH/H5QKciyi0+QA+gIATGao1hTq/gG62G6HlFQnvjmEksjGQQdz9F
         45qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEaQhqSw/GpsUbmuOMhOkqYFlonsYp4ASY0pU/dsGyspwkug4eJyEMa+btDMLioPOmqm2WvP9mUto584qI@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5zX1KK/vnrfUlfF3OhrhQnPT3yOZRuTHmUfJvxxiGip57/El
	SNtNHRturrIfw4ZNlIa/Ur1+Ltjaw6civ1o1gknECzEmXN5GZPcpREntGujEjR7pnzYU6yRBHp0
	JJrsQe2KI9ODjNopk8M+hHfIuZinh8Yzxzz/7N3HnhQLX0RRDbL6D3IuBIOcoAx99Dgo=
X-Gm-Gg: AZuq6aL9FwNNDqYjGCKqbKQtwyRoXkA5oYEyJSG6cU0PE90IRIlv7hqxSN7GYOD53Gg
	cQqQhuM7KuUru/SC/bUSIGUAX4PrmJ6vGB0677uYQKTmoFKVBzZ5dX6JGNpNmx1CkYqgKLUIvs5
	j+Gr7QddNnY2RFwdv5UHOMcJULlM8fBIWKuJ4DdJy9+yI7nos1j8SFQgVfnRMLFcrP9vQjVbKEu
	fvWs0uCbgKfmftnOLJsgwk/TDeCFCCwyvQFaM0dUSm2J/fH1HmMmCSBYsabrdSdwB5+Q66gY/TU
	qv7yTE+yDDFNebM3wqaGafMrSVr1MCPhPCT7ILy7nH68ptxJWkrUiCyE4U4bSbCMNsZfrNx5CCa
	mjQdVniv9bAHZCaA9W8nFpg1WyNfKDtWq5Hfx7B0=
X-Received: by 2002:a17:903:2c05:b0:2a9:327f:ac57 with SMTP id d9443c01a7336-2a9411f7cb2mr164836845ad.28.1770643428762;
        Mon, 09 Feb 2026 05:23:48 -0800 (PST)
X-Received: by 2002:a17:903:2c05:b0:2a9:327f:ac57 with SMTP id d9443c01a7336-2a9411f7cb2mr164836425ad.28.1770643428191;
        Mon, 09 Feb 2026 05:23:48 -0800 (PST)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521ba245sm107895765ad.47.2026.02.09.05.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:23:47 -0800 (PST)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 18:53:36 +0530
Subject: [PATCH v2 1/3] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-add_pwrkey_and_resin-v2-1-f944d87b9a93@oss.qualcomm.com>
References: <20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com>
In-Reply-To: <20260209-add_pwrkey_and_resin-v2-0-f944d87b9a93@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770643418; l=1536;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=k9lauc3Hh3BMFWnRniOQyvTXx6hD1H70MySBsc54Gj0=;
 b=gVyhmJoevtPG07qKPAmEQrnKUIibA2srJ8YN/RBf+nYI21tZ0tvH1mgXPOebW5hA/eLfqpy3E
 QcsLDDM4ib/CEY7k0YQ52yj1klT0by1Kc8CGXe7YiLCfx/R3eMOYF8L
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: bUzbn8qWKeklfQY5uos1JXz-TMqWB6hS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExMiBTYWx0ZWRfXyPhOOyG9Iogm
 PcHeL9RKQEYVzFVtQZLWyfVYcjo4PDdVANt6uy5/0AMGhTvQ7mWV3OFNk9tLFvhMakWcJjwToBA
 g4XQ4OmVdPtaTW2oWxOKv7KZr8vQvfC6txKQuy6bZRizPeQQgVmQBEgxWR2gPOkHThtbYZ8tX32
 JZl3EfRqPtx3pKWJtRHbfZJKrM2K1LW/BkIV0qku54hvTMqLdRFxqRe9jGbdXAYQXuRh1reGyGv
 83xkDkOAwl8TUp3cMWoE1wH6mZab/QUbHQODLryZ53uzFjqbRtx8QLoNC3ktPYDThJfCRHoyIMj
 W6NJIsMYf1T2SYcPvGFVYKwFQAoK9A4t1YBKZSK9px3znukYxveImvPMk5BvN3vEiOEtmuxPn5k
 7G4FY+9NWt53j6T1vPGmICcO6P09a8pVNbjNzrt/ZbEd9eZ48Ch4PqO4VZZFhpW8LwtcVk+YSwr
 Fu1U84g37l2gbW80pAg==
X-Proofpoint-ORIG-GUID: bUzbn8qWKeklfQY5uos1JXz-TMqWB6hS
X-Authority-Analysis: v=2.4 cv=WecBqkhX c=1 sm=1 tr=0 ts=6989dfe5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Z2k_n7hL7t1NYTrThU4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92302-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sonymobile.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB5C710FAAD
X-Rspamd-Action: no action

Add the compatible string "qcom,pmm8654au-pon" for the PMM8654AU PMIC.
The PON peripheral on PMM8654AU is compatible with PMK8350, so it is
documented as a fallback to "qcom,pmk8350-pon".

While PMM8654AU supports additional registers compared to the baseline,
there is currently no active use case for these features. This specific
compatible string reserves the identifier for future hardware-specific
handling if required.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../devicetree/bindings/power/reset/qcom,pon.yaml        | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 979a377cb4ffd577bfa51b9a3cd089acc202de0c..14b85b0d97da12c756cfe2ce33853501ba4ca46c 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -17,12 +17,16 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-pon
-      - qcom,pm8941-pon
-      - qcom,pms405-pon
-      - qcom,pm8998-pon
-      - qcom,pmk8350-pon
+    oneOf:
+      - enum:
+          - qcom,pm8916-pon
+          - qcom,pm8941-pon
+          - qcom,pms405-pon
+          - qcom,pm8998-pon
+          - qcom,pmk8350-pon
+      - items:
+          - const: qcom,pmm8654au-pon
+          - const: qcom,pmk8350-pon
 
   reg:
     description: |

-- 
2.34.1


