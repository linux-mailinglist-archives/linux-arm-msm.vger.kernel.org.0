Return-Path: <linux-arm-msm+bounces-114404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S5gwJLorPGqKkwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C42636C0E66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:10:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aO6pFh8L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DG+hfybN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114404-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114404-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AED3300861D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 19:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65D7366562;
	Wed, 24 Jun 2026 19:09:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62150331ECF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328199; cv=none; b=nHtoprK3SUmZ1TJ79yHwVYqT+1clFiulx8r7Lh+bLrtId1t6Y3fJnnnIJmodyj1Iu55XaCaIozVYaWDuz/63Wi3dWzsZr3li58teHZudKyQsSu94Swd91IdIK4cobkvpLOBNIK53jhS+NG1NUOl38POTy/ZtRRNDNGFx2ETz/Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328199; c=relaxed/simple;
	bh=im+W8I9V2a77F8QGVhtrXzsFdyyTMNsffQVjVXuq4hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQA38qUBSlTZo/2r3e46/TKKOKGt9c3ZzGNLK6NZcU52r0bF49HW+pxpM4Vi0bjKmVts6YXdgwGjDkopAKoU021A2FlmpajkQKnlgcvttgTtKlCdKVUs60kmL1b0v6pWqVIXB9v0IMtI8i9g9UOuZZD/aeRWY+NLvXFxHOJz0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aO6pFh8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DG+hfybN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHiu0K4057349
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YWUREud+R9W
	xLCc2tv6ebseV61AovZQSVYXjDvXU0JQ=; b=aO6pFh8LHvJlJMriWtoK1ZdYopc
	yvXic2kXpVJk+xRrTd1RpkbP6TX3XgNn5sYCELQxHSMCRAXry31EgBsNtnfksWAc
	+vD3X4l5KeUlmbsO0HfG3YYB1yqrKswxq8KCDdQC3LHxAiLA8C3REPR/VwTwH3Sa
	WKiuaPz/GYg+4B1tAQ34juSFxjSS2CuwVleV2c5i9psvKsvZUZwPYvmbUjb4WOsK
	D2DOazoDrJ3v4YK0eUFurkF1rpFpXkkowHgBUnH/7TElP7dM96Rpr9TqtJTsiED0
	+bnw0Wzw/L/0pcXWHp3jWVi93Dggb2bHg60adtKj9zQYJxXYry9SCB/N5Gg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d5g25td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 19:09:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so926006a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328196; x=1782932996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWUREud+R9WxLCc2tv6ebseV61AovZQSVYXjDvXU0JQ=;
        b=DG+hfybNxcM7RhbudQbcYbC/6t8s6Gd73V04Z+f8ZeVeVZa3IFMKMyBBr06Zx0bXVW
         AD3aN6es5nA6BzjEEtSR7Cp8rorfwfT7nCyrV4acY9icLZaMHQ10hfUmuJXahkwWPOey
         +YRYS+ecwfRze92HLE/2u9RBBvZ4UT5ahjoWVqmqpq60xUXI3zTntc4POzzYI9GHFuWA
         xNdZztmljkfRF6p7EY8vMg5094yODqGUe4vnqX/ukaJn02wYD1B/DWgum28zFpomOrna
         VSzeV6ZLGutrN2z4V9nIH2LaPdGk0CoY1AgWVHryuutIYH309jGlARoAHLS/rfjEIXLo
         hkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328196; x=1782932996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YWUREud+R9WxLCc2tv6ebseV61AovZQSVYXjDvXU0JQ=;
        b=G+kWy/ngCK2AlQK0JBftS6ijD3EbgZZ5g2mKVFTyCCA7Zahm6lGY3TS7yQoIxz3csM
         7f78pT9gFU/23CXHQ32L5rFiOVoZQNZAKOHz7fgT8VlBJcKrhCGBDudkeXf5n6zG6zJF
         /frq/jv3RZEghuRpBT10lVLXOuiQ4DNVk7AFw9To9EF4tET6RyjEUrjM8M42qM4A6MKV
         WEdIDTIxu6vvpJYWfKpSln9p28WZQVnRdGdDfmU/rHH9UcA/gg9qHiRq49Fo6QT0UORf
         mLLGGD4CGibZhT3R0loMVkjdGG8G9mTwoYgUyZRediKBiRVBVbOpfNiCwR02aKhtd9En
         M/HA==
X-Forwarded-Encrypted: i=1; AHgh+RqaHB40KsRXc6AWZmVyUJnMl3UD/dC4L84gibx3Qq745FuZwIDjomRalPNVg/ZUJ+QCR+1VwI7B4KopH4yd@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUXa1p+tXwoN7gsZHzKLX82n6H34UhtiJqsortMRFVPNrBhMn
	A/283ECbhGwAiorEvxCiTT0dVhsKZlaAPQIo/OkNLEhnUu60ajNZygaDYwE5HKrJleebKYuduZ3
	aFHVYmXy02P6fRM5+VgpIbONpRXC0S2wXf4G2YAZoR2TVSlLnsrResAQwCMt+mUzIXymB
X-Gm-Gg: AfdE7ckAfXZkUzvJrLrPslCBscq8GaqKkLz86WIbkvHpKUREoLhM895j04VB2la5sv7
	d6tQSFf+cOR84mvuauXeFz3UaYZQOFP/iAun4wySunm2Ss9owe/Wkag+M5MSVq6SyRTQEVLerxG
	zXZfBG4yZySMe231fd0g8nw0B/aikw6i2hW9F9eMmZKo/Qn9hwkS5QEQRiH+Fcda0YwwlgcfqoJ
	Zep0nG828QidMmU0W2+U3kIf8AVdFt3YGewt65nPC79OL1djrRPfSTToRKoGPdi5LOI92zSS2KY
	tq7Afz34MFU5U0301LCV/sh/M/GjXnq0MNs/SHMJsCZ9jzqSr4gxfCcOlDUtVzCyqV+6o2I1Baf
	w0WhJl1vWIO7nPLsmReHJKJsDu9BDOWd3Ejrf6A==
X-Received: by 2002:a05:6a00:3391:b0:842:6ec3:2359 with SMTP id d2e1a72fcca58-845a27d2535mr5777123b3a.45.1782328195841;
        Wed, 24 Jun 2026 12:09:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:3391:b0:842:6ec3:2359 with SMTP id d2e1a72fcca58-845a27d2535mr5777101b3a.45.1782328195285;
        Wed, 24 Jun 2026 12:09:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 18/19] arm64: dts: qcom: qcs615: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:29 +0530
Message-ID: <20260624190830.3131112-19-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdMMLDfi c=1 sm=1 tr=0 ts=6a3c2b84 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: p3QBzQQyj8qx0EztECmraOR9IMjiRTze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX5e125CN3y+J8
 ulOedsjNqfMKDTA15f7CalraXT4c68cMMneRrBCOD8RETZ6Amn4Ubu9/sUG1a56glGLd1wTuXJ4
 Ib87qN08rfOeMfEBgmaaV9oA/98/fQcJMRNWyK4SnEqI7nXJ4lp0lSjF0keciZpz5Xp+C7gKkq5
 4CgLCmItjbGTle2zQgyLegQ3/SVtcVLmmB7iInLszUUwzoCWvwhKO/ig0PLcnzqPpBr6eMM91RC
 AJxNcaTdShNJg2Xvl5vRQf8sEO9b9vCq0y9Cq9M+qHLXB8w6JMcWFoBMUyOUUp6HMfiq6vrNi4a
 20+6+tzq4u3TuLmQBPn/R0Ef64f/2K+ZdXfri/AvQJNk7PrZaCdNR76L5Krk+T6E6/zN5IX9SFh
 8Sw27JSBYozYI2CvJ51Nj1+BjiM+tk2WyIanHBy/YI/XrctXhhoTB/s9MkJ33qVILo+0nttkUC/
 oDwHyoQo1oMGjrCGu4Q==
X-Proofpoint-GUID: p3QBzQQyj8qx0EztECmraOR9IMjiRTze
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX/dMvS8VEBEmY
 bhXSAlS7d+I7QLayxitAcGp8UN37b02SFHYIMY7bprEt6h9RE6WLET9NvP4zrD7odSAy01JiMoL
 GDhwwSthlDVH02xP+xNeR8xg5PeNGsE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114404-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C42636C0E66

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..a358d5441fa9 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -473,6 +473,7 @@ firmware {
 		scm {
 			compatible = "qcom,scm-qcs615", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -4654,6 +4655,10 @@ sram@14680000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@2a94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x2a94c 0xc8>;
-- 
2.53.0


