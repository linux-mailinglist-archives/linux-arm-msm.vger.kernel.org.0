Return-Path: <linux-arm-msm+bounces-112593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dUEWEihEKmrFlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:14:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F9C66E721
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:14:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nTl1AN3v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Mq93a1Ql;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112593-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112593-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D1E733C5630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47AA3321B1;
	Thu, 11 Jun 2026 05:00:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919F379EE7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154011; cv=none; b=pjTwu+7YX+L9IMAdRXLEQrsGKQeehRPPeVLfn1NAEOVAW0U6KO6lVgDLjPBXkBscjb1BqxTrotHDzx0ddO3hV01AmBxyGUTpM/uOMPZuEwXuh8BBfiOgqRy5u6reyN4kBq7pl35YwxVe6XccbmBlg+OykKDTdzeflbxVGGny258=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154011; c=relaxed/simple;
	bh=K2PktD81GLchwBUK+zykynZPifY53YubUDY8lpH3JZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L56cLZ+AXIJsRzNNkkWeKLCFz9ZaS4RUuPaL1hNcaC7nn7QHKWogcrkGsuCNTjiUGS2gh73JiUIhbiQxsRDfNHAmdTQhiMeYhQeREC3cn45oflalL+Aq6fgWTaSUMxMW7JL7hZlGIzz6C5YdqbYs9E0aQSOnfvsXPL0Rm8qUNqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nTl1AN3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mq93a1Ql; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NTlU3183671
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=; b=nTl1AN3vl7hKdvRU
	DeZ2hrE4Va1V5535B+uDTR9HFzsYhA+PHcgvdyxVjYyoeDP5RghEhV4f19fU9gwA
	bYiM7LKLrBZ/Tk/Ev3DpTouoL/5g/pkDvSo0L5H9AuQ/Emi34Jr0qcfam175xOE0
	g8AV+LChL8cW46lQJ3ecXxHZVr0SjcSzPJEiASX/qV7+WQf246YRpapzgHI1HEHE
	vikM4S4v2QDKu0GYyemEpy+5m23lfaZ4Bf/PkdlKgOlDol7i8bHyGLg1kpf6U+En
	MY5+rAdD3ybhaWZZo17a5+gdtzanP7OcDtq05+9pIPLbjfKgwd72yFs3WmuqVSKF
	YfGEUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1nm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so54387875ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153999; x=1781758799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=;
        b=Mq93a1QlPZYOh6/ouxxGqMeYsQU6lFDsZ2FTI1Rq4YiFb4Mn+to5S1Mf8oSvHSj7Hz
         BmYvMPKN6VTqNevGBpsY/z7Q5Y3GpWU8XdsDVWw0E7wrbEru9xUDzivSzDPxUcDQ+TEl
         bma63XlorUaxsLRbhy+P7CItri5qCWb7bDUDvb2Oa5DlO4+1O5X1rxsQzrVD2e8O5Ror
         4PbDJwpkVuNE+yrV3/X0dobJ5IHrtxdkjpvYsJBaGoik+LHl2FFXq9R6FimQ2Ou5CVQk
         FBdFKKmo3wwYkiSeHHSu8v3vY25AZro/MuSuL+5gFtRAYxFY6ntD8QkBDyGf3o+OyfTf
         ndnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153999; x=1781758799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FKFWeqSVdABp3bZUWRkG8UEu9s72wVyfZKzIZbZCsxE=;
        b=lqtG5neHRiIyADUJeZvwWgYu4Eu6Vbl/ODhVUClYnXjcnoJubHxkX5tn58EDFVd/Hy
         XXFsQWgJGfBn3BeFYCPMqLLTNaMH3DI5lKWERzmaAfw9Vhki2+mlHoTNwxJ7kl7YxAOV
         FaQrpUKCqN+QM+UFwMNeBjJ4VASlZ202YBLux6qa+GObReDR/UmLl6pbfFtoK7tNz649
         l3tPIoMw8RwzWRUlryCTkUncvT3Gq4C3u/+AgU9SBYqkfoVOtXDaoPUbPJ6MLdcR+KT6
         YhGtoxIPLg1B124+n79EuEZ7rQJ3wmXftSfTz+zKsav+XvnMRzH99iBp25d6dPG0zdi5
         oPIw==
X-Gm-Message-State: AOJu0YzJPopPHh32J/K7tUesVME3cmB7g39UGosodUZfoHAMZJ7crrO4
	QvsxTdL91/2ttQdhJmbxYZMN7RacgPPfpqlSFTd0+wwS75Of5iUtHtTS7Blert0XwvqvXBa6CoW
	t7NfBTH4WD8dwV9wHjgTwTYCoXi2vdXXW4OAIdrGZJJbdt8nK2tSlIk8nXzjBiwQ202qluGS200
	+j
X-Gm-Gg: Acq92OFx07jfaHaRCDk1yrneDyyM0EM14fLpvwT0KjKJJypgTe0oZ9WxpOMBpo9xcdC
	EahL1U4jO0X9Ru0uzt8syDlne5Cn49eM6HWWG6Cn1BOQVs1Mn4baIkSZWEWiTAF/10VFIxfgXmN
	+vVHfi7i0OrMvfI49hfK6mkFNNxMAWADNBgCTplZv31kMft+zpHiw28n9Ih1qySgk4+pVSaGlD3
	ynjlXoKenvYl7Usi/gs8+Qw5eeadCulvnjs/yj+EmZB3WSIrjjEsuqxVLupwhIsyTaMWzHmhsoB
	eDYrU4auId08RJ9vX7C+5Ptpc4OIk+dafwnjg76tupGDA31n3vlyScunWQocc0IxT7zfQdNHZ8Q
	WInxLLgnunEy/oSg4VT6hU4QYGyRKxFHeMDIdfLsToiH4b+x5SrTOObprI7jOPP53klQ=
X-Received: by 2002:a17:903:3c2d:b0:2bf:2b84:c207 with SMTP id d9443c01a7336-2c2f3730df8mr13002475ad.35.1781153998723;
        Wed, 10 Jun 2026 21:59:58 -0700 (PDT)
X-Received: by 2002:a17:903:3c2d:b0:2bf:2b84:c207 with SMTP id d9443c01a7336-2c2f3730df8mr13002175ad.35.1781153998303;
        Wed, 10 Jun 2026 21:59:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:58 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:52 +0530
Subject: [PATCH v2 16/37] arm64: dts: qcom: sa8540p-ride: Fix PCIe wake
 GPIO polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-16-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1324;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=K2PktD81GLchwBUK+zykynZPifY53YubUDY8lpH3JZg=;
 b=J0Mz6bd08Ehsina8bTt3w2g9X2MUjoj0r3LgV+NfG58iJr6+XjE+vKQ8DEGZp80CWgvi0Snvs
 r4iMEFQralsAiVzYjrmUEENx0s6hyDouThpOD/6kBLwICEWmhnF2O2m
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: nI8lFCs5pIG0SLzAwrm2znY8mHnp3M2o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9E+JVNaqHwhD
 Xig312GJCfpwvK1p+6gFBgkmrWq+wxchLZJ+O6mjcbiGk6p4Lc0uGR8ac90Et0ePHaCzi4ABhFs
 AkBbKbT/4yKh0ytZk+EfgchaIDY191Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX7d23fOwLxpkJ
 V15MezwBVHOQ0sDCtASYBa+yaQt61ijur3cbyi8xVeYWD6OFFE9Chwql5kSWXjGQVhiPg8e8JTm
 Wlj671OldtDP5c/EqLIMw+e+FHd9ZporhYbLKFLnB21FRJ0N43j6EQiwSMVm2EOgwTpGyVhsuy/
 gaxHo6BpO/nHnaDTcVbjzCHCNoRFu5E1szOsyLvoC8auev35tRb7QNddSaMLSksZT1ilRJWD9E6
 ShK505rU847NFi3VjfM/gCRHz6s0Bd+1v+zfiCqWnud8RuOC5pxX9rm/+Lj7am9/D/o7yVdxmHA
 SAxE4klyf6VjGcSxx+CSXvP6+denA8Q1CRdb1JLdln8sohxp9KIgOpoGvEXD82bBbN7fgzHMYhl
 m6E/YMQF/aU4DdoqxrfGMtWNwQNlvXXi4iN0Yo1qtpLtTni0Il5ofQD6t7OZ3Ts1CGZiVcBTywK
 HxiMg0qZEok4TQ1UZIA==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a40cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: nI8lFCs5pIG0SLzAwrm2znY8mHnp3M2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112593-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93F9C66E721

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 44177e9b64b5..702ae4cd3d0c 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -367,7 +367,7 @@ &pcie2a {
 		 <0x03000000 0x5 0x00000000 0x5 0x00000000 0x1 0x00000000>;
 
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2a_default>;
@@ -388,7 +388,7 @@ &pcie3a {
 		 <0x03000000 0x6 0x00000000 0x6 0x00000000 0x2 0x00000000>;
 
 	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie3a_default>;

-- 
2.34.1


