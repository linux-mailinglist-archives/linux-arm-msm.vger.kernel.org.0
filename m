Return-Path: <linux-arm-msm+bounces-113894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4KIKsRtN2p+NgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 06:51:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6C6AA396
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 06:51:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IHzl6jEl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NTVBSYyb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113894-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113894-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B9EF301CF93
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 04:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376F23019DC;
	Sun, 21 Jun 2026 04:50:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE24D3093DD
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 04:50:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782017453; cv=none; b=lkhmb2VsBFGcfE0byWnTv0C7ANMcubRaHtAjNvnJKZx91kZdn08lXqcz3UmGk47thUsKd1CA9r32uCLq0mVXrHiDgcq3XwAsOm6xJgUTJNBJAJVLeey8mFtnvjq9ReDK+GEJTvw7CpDTAViZHWX/E9URjqTX13WinLKbqWyqSdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782017453; c=relaxed/simple;
	bh=UHm+aCrYVqg+ykmML6um2m8aKd9s5ihirLFCH12XCSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LC6ybkENhUc4UE3awKhXIapy5qQnBDRtDHRB45FDWFXDvty40jpG1bHZe55nUUqG3jEPyEk61fxFtTBQ9zkfnfyrx/x4JuY3EoF2Ie/652ruLrYv9LAUd4GNLDejQxBnwF2L8jvVru4RISamPHk5TV1qR48zxdQBu0TT+F9Y7mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHzl6jEl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTVBSYyb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KNTIHY298240
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 04:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpTf+kLXcdI2RBQwcOOy94y87euzuBCDOpPar+c8U1g=; b=IHzl6jElCZWXFAMU
	9T+fJU2PqJo8A34b37PFWHz8jA1WEg90I5WgggvPE8j8MdMSzu+y0CEYVEJGs2U4
	4jelAXukVb9fEwyzAmIZwcIlF8Yccs6X/2c0Y+Rt+loyucTU6cyUvUQV3PiviDSs
	re8zeC59tdhxGskuCFL9gKgBrgNMiPqwOJlvIZSdyOW+Y66BM5bg2apf+jYx9HaJ
	Se9EFhsOl3caohDX1vKgswFAXj2ogb0fEPp6Jah1PlJ1SN13uPDh1MZGsBA1fKyi
	E92oc7KOTWLYmKt2UA6guF+ZTr0N4vYQrPrx8p4LDtULwlOPNPYBAmKLs2tqc3uD
	UiYrtw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewgjeahvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 04:50:51 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7fccd214113so52696837b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 21:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782017450; x=1782622250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpTf+kLXcdI2RBQwcOOy94y87euzuBCDOpPar+c8U1g=;
        b=NTVBSYybX6aHdjnvdkWTFnYkpkl0gdSJd7QFosn+G3jMztg7qw4EHkc7E7blr080ap
         J/e2SMOohhdOrOQB6zcyf1cjUKxA2jPrGmBgOnBReDTexaB2VWCRGaKO6S9sCEIHyRo2
         t5vJ0qjFTGaeftLAo0hz8fE+bvxcSszy2tPwYuR9F5IrOCs9jGrDCAwALsdamMs9LD3P
         LTBAddCrGU8uG2NDC2e+aFSKceeB9fTvWi+AArxgZOvGINi59D9Ps20bs2xx5h709xqb
         BIv+khwDe/FDvM/V1X+NFujhH5btq+NaqJp1K73PdZH3UmpR/9OviZ2DNxs7RR8LdTCb
         Lgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782017450; x=1782622250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jpTf+kLXcdI2RBQwcOOy94y87euzuBCDOpPar+c8U1g=;
        b=DI9rVNxaoGOpr9j1cI3PR5TqlD8Df1kNOHnixzCRfQ1PGFvB07p5y+LJ83/Ej0beQW
         WsbdEkp7bMn1xySJMz/lQkGDlxE+hYD1mO4uEc49icKrAlAZbuBrZQiwe5f54MF2ni2u
         CmK6NQpx5hr4wtl3XEVRymrEBuHvfrBWeMyf0rzFfi5xxhFEeJX0L7miQ7LQkXQVyTX/
         0otz+ffzXyaZwBy6MaW0u3AHCZSi+gZRzLu/54c2czLK3ae3tvOoP8YMvsqY99stAADb
         Xm81vD97S6TO+FnxnmrPMou4wYGwXP3u3sYUB/AVymRU4RtAcJnHWhPaIVeXv8/tWcX2
         Ny5Q==
X-Gm-Message-State: AOJu0Yy6APB7uPENHrEI2TD7CWdmySN6kc0wILNmRvlpyw4mwQZn4l0R
	oCbeFUvxYAPwjD2jt4yj0VHJ7QaPRWpZel9A+gkycUhkhvX9iPCuDjxtWdPHi0lh7630Ehkch2f
	qBDMA5MJSJo2WwW4dEbkKy2mbG89+C+jutUEQRG4k8wOFP1W4W1qkaGyfJ7QDaSMPoUex
X-Gm-Gg: AfdE7ckhuoofussnPjB3rCYaOln0nKqjF4YyHzV3JNzuYOdpicTslfnK5hh2IAhbgVR
	bcAMziSSWNBQu782evQVrPmesAjVFZGgYIBFaYDsIZaMyUwCX14/9Gato1JJKeXj/I+ilNzHIMI
	R45LkiwoWldcnNuiuyu/nhgYnGDLJUMOGQjy6eRCIwHJxtWxI/4lY3uRbLqXwFicUz9Trt4gUp2
	T2PkZfZ7Zk6pGG9LH7RlKy32kt3ZY46R/vp6iHe4ijMKIT7oeQtBR5lNLUzF3AOlDFG/Radjvlq
	+GIRum8M5JySoxYYcw7dFgig9Aw33EshgJRNYWwSRIcBCIAa8ia20d0v9ipmxvOoA3adr/lI2O/
	D3hDuBNn9CzEBRluCS3bTTtLe6S2jC87sjJ9tOlBFvcS300u+AItfEG+UUhbrbMlFEeOlicswU8
	6zMzSu3qomaf7yh4x2Fvf6lLLGUTJ+RK0g+SdJYpZYxP1JXBB1HtZHjUY=
X-Received: by 2002:a05:690c:6ac4:b0:7f0:4c1e:8b83 with SMTP id 00721157ae682-80132a4ec42mr94792827b3.36.1782017450415;
        Sat, 20 Jun 2026 21:50:50 -0700 (PDT)
X-Received: by 2002:a05:690c:6ac4:b0:7f0:4c1e:8b83 with SMTP id 00721157ae682-80132a4ec42mr94792697b3.36.1782017449934;
        Sat, 20 Jun 2026 21:50:49 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:1700:b450:a0df:855e:5925:800e:2644])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8026089574fsm17226837b3.44.2026.06.20.21.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 21:50:47 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 20 Jun 2026 21:50:41 -0700
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260620-glymur-send-v1-1-fc4a2cfd107c@oss.qualcomm.com>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
In-Reply-To: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: xc6SbyC281X1-VSI95ALiQvHwJoJIU-K
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX8uBLwc8miu1B
 ypeBNMxkkRzowF4hBD7FknAmV0LAejTtu+x3RFcjGgzQ7i/bUD2QIY7oWJOxaB6JxQxqyGrwTA/
 3ZYuqDYZ2suXkKeapBiLYAKQHBl9ruw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA0NCBTYWx0ZWRfX0Ozunt9wuivA
 +fViyw0zDP2tH0pRx+0YplXEaht7bIaNsFFWfYu49T8Kc1YcM2OHARuATvwtP+YGdGmh/Y/ns4s
 5abAvWphsbvT+YiizOQ1W3amMnrrdrWhP3zrmmdYOhdLJevqS35ce5w9IidvUsrG7VYH8jgk5VV
 bRwA94jjPxE0LebNHVXPlPgEggqVNrgbV+ry6uU2YE5nB9LQPlLgBN6CdC4B+PRYQ4p6N8jeaX/
 LXMZfg78FHWkFQAcMYi7RofqM55gtaoKF8IGARBS/gfWuXaswRzE/pgthRpdZhOV8jsYocD6113
 d3RszjmFjVYyxmYlkwtaezNHoHivJZ1yBn7KAN6sozdY0GqWmp/4knbE1CKBgVskVy9nwt3ke/Z
 fOw45DShKWEB/+qxvpsPFzhL13ZK4Ucepe86RupjhqWt/n+G8Y9zZXRWVEM0PsTiCpQ6+coOZ8H
 9lZzU8dn3XPa2HOT/Qw==
X-Proofpoint-GUID: xc6SbyC281X1-VSI95ALiQvHwJoJIU-K
X-Authority-Analysis: v=2.4 cv=TO51jVla c=1 sm=1 tr=0 ts=6a376dab cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210044
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113894-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FA6C6AA396

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible, falling back to
the existing "qcom,glymur" SoC compatible.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..934f62407b86 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ properties:
 
       - items:
           - enum:
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1


