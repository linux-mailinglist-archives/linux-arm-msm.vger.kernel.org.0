Return-Path: <linux-arm-msm+bounces-109962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLS9ECu9FmplqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:45:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 003175E1FE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F150F301DCC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D023EDE77;
	Wed, 27 May 2026 09:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ4XzWRk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KefSwK5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987453EE1EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875058; cv=none; b=r/FpBq8vSpeTqn529ClFOpMEIHDdWRreAqYGaRgbK4V07AHt/WOz6YELvh8W8YaWDE6Ve8ItElLbzJGay1uV3pWDZND8LKMrZq/7ASj8rYj47yDhVmNopG4bXIGN5h5pNJIyopn4FuEJrAX2epNkC4X/nzugRPH39WEkCJtOh28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875058; c=relaxed/simple;
	bh=VVY5VieCgAdglrKkHhxcnXupBX6/StQddkC0Al36AIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iqichXmZ9F/R8hASqhRso9bZSxJb1rRok5OZQxylBuUH1OFX01y7LLJwpC/0eNJAAWrQyyYxakeK1QlgaMPAay3hoiTVV8JnMydy9U08YDQ+1X+89Ed8gbukOofPBnzBn9PNye5wWAbSfOtsi6VbZMABA0v6IfAyJbA9zIHdRBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZ4XzWRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KefSwK5L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mRCa879288
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IZ3h4isVDpZ
	t73CY1iR8eaBiYTa2WaLGDMJkevhiNDk=; b=XZ4XzWRkzRkvLoyNVExWiQAxMVZ
	bFpayEzz6BhJ0U4aOOzYW/T5HjoSiLQdpn5oHSYncjsX/HedogXaZVLQZpXSh7cU
	4+PKXAQE6EoAofA2Rnebcfl8JiibytQKlblA0uHJHXkm/MS1unv/4Q6gc9wSC6dP
	KJuNGqsoMo2cp0g7Iq/pOZNnpFODdQNyUB9w11oJFOH9Rvo2iTedBFe32iu7TigQ
	TQ02R1ZYXSuqOYCRLJurv30mVGiknZEmsJZi+bh39II1222qGwA8DH6ASs8qeAGH
	ZM2AZ+sJkKgQ5O2B/+sDmgpDiw6sZoCMJPV/3T9KYX6uaDBfQkT1hNj4b5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edvvqrcrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so121421635ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875054; x=1780479854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ3h4isVDpZt73CY1iR8eaBiYTa2WaLGDMJkevhiNDk=;
        b=KefSwK5LOxqdZfagNueGT0fAERmod55796o7wVaDgGGi0B9tIXspCvserM90mCgwcG
         Wj52BeCIOcAz4R1+U+1YvJWXlrSFUrSxor+YDp+cpUnbLRbT1letK/QVfGjLLjmsUHrS
         H6xOWqkJNWHoO3Cu7USQBWvbU/Dd1+/vTqhpuTgn2iS5ne12e0T0z+J3D6PvMkyRkbOt
         T900e1MNWVTE55IHNbjwNgbWzgXy7goIZYg4glIlrITaVEnm67ymffWW1eD9+7R7IAAk
         k4Q9cPUAZD6n4VRjJyKiR0ogioVwBidk6Y8ktvunAGitkUnw//HF+JyqYZXeUJ+2diH7
         eZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875054; x=1780479854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZ3h4isVDpZt73CY1iR8eaBiYTa2WaLGDMJkevhiNDk=;
        b=oimxBI62euo0kL/3vfuAwn2BVhFNmYcQXivn7kwn+niuA3BAdPIumgAcueYcSOVbaj
         B/GKlbY9SHwXUc5MDKQQVKcxZmTI9HmrOXPlax6WTfcs29wwPQvXBKle1dZ7W2BKA8pE
         akFJWwl9xnAixGneU6RKylde5eKm/g9jKkE5YS3IhRB9dMuXbtxVS862USQJmHYjdez6
         HcYmEIGYQOg7A7f2lRgs9xBRAyytwbj6Yxnwysdh4OwbfHCi4qg+z6KDZNL1f3ZgQZVT
         xhqvwseODlSh9kb3aGCgHCqO64irJU8WuXxvbrFxKKlBxxSpPZkhex1jFHyeRjeEuEg2
         nSoA==
X-Forwarded-Encrypted: i=1; AFNElJ++ZqRdUaE4Mo4WOnpEVxJPuwGXKwbcR31NjDSy7p5EUy8wIM4S+/W8cmDPqEwPsVtmSsPc34UfsvqiLUBQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/AkWgi/Ypp5l9l+p5pxCVsyw+r3ow+8iiEoWqTIREV0z474v
	ZFRYEotOeGGppBeqKEu5Vq2ReZL3wRas/zwriYDJ1X3W1wkUQwG+BVo7EVpk++/MaTD5RuSFeJZ
	aXAKKVkIYsJ5+JZWTXEWARwlvzDXGK0p7tOm0ouw2Y9Y2ROc27/ohMbPeCUqibmG0yHV7Yf8ruC
	Ug
X-Gm-Gg: Acq92OGsZ37p7WxXLITJsT/TL7J97tM5kHq6yzc1u0oW2HoKddYUe6luooX00WpDsl7
	4m8C/pQTKXl9+kcP4ZsrF7TNKrmg8/+2UioWmH3f/ikf3JaCLzqz35FxW6FsROy+hobIt/io0Nu
	u7ef0KMu/BLdCSrhQ4+KgBX7aJ4rT8M9iUaK3Wd6vw99Mr2PuYl0itIFYeFBvQvvJMufun7lBz1
	jDKrmkWyT/rBMWR6ps5si3pwR23hfF/FTRT21Mk6QIf13BJPzQXFwUrgR+HNpxp20PU+bFRLT7i
	D3q+/0vaSMx7D8RsH1aAF1ejupY9gZ0GEbfD1MF1hrTMD1Tihw6qrNaNZZJPzdgUZyevI5/ghjp
	52xQ8Sa5qTUtc4TGszZzk2kGhVtL85+afRD2A81+i6Shmg3qP
X-Received: by 2002:a17:902:cf4b:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2beb0702610mr249522495ad.16.1779875054498;
        Wed, 27 May 2026 02:44:14 -0700 (PDT)
X-Received: by 2002:a17:902:cf4b:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2beb0702610mr249522255ad.16.1779875054027;
        Wed, 27 May 2026 02:44:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 08/24] arm64: dts: qcom: sc8280xp: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:13 +0530
Message-ID: <20260527094333.2311731-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX4Q0TnUdXRCJR
 YVFdOUfP3wP4wjAYN2pR62Fy7aDjkI8tGMe7F3E46nONHd2hbPFyjS5au/GwLse+A8c0Rso5KAv
 RUU92VlfUKwK19PVuLGL8z+Hr5jOrjtLAl9Ms6istd6K6afeXP8fAqHlhau23go/SHsVpa6srBA
 dUSvRnEfGsMfOTl3xI7bxkVZsIThangy2PgZxKcf8++JrZXWcBBTlEoHLoiuGW4XqobGSP7DGX/
 voVMtBN52dBhDT/Amj2xIZEw8AIuwYK6l46QaAAptFh9fZ5J1TPCvq0Uo6ule8N8grGGDOqqJvM
 IzQfz5qJGsKcVpNRR6Y3Il6OzhsuKWdslAgvzulfJq3u5mVmOE6F8/CpM4NDZReXyNxaczFh80o
 C0TyS+4Lukk8MbRvcoMNnMbaz8pAk8FEwAYN0vETyGrcGewVfNmDI6EbfAjBIfvHdB9mTOLcq2Y
 w9T3C4Ph4pHk0fHVrzg==
X-Proofpoint-GUID: PzFUPkXdFFf3s8VFxX5HZ0vD2MvOx2GC
X-Proofpoint-ORIG-GUID: PzFUPkXdFFf3s8VFxX5HZ0vD2MvOx2GC
X-Authority-Analysis: v=2.4 cv=fLMJG5ae c=1 sm=1 tr=0 ts=6a16bcef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5VQtlk3mkWvnAHmEXu0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109962-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,b220000:email,af00000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 003175E1FE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sc8280xp spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index ee02acd18856..9dad61ab5dbf 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5326,7 +5326,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc8280xp-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
 					  <54 263 1>,
-- 
2.53.0


