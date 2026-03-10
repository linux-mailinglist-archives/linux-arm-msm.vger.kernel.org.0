Return-Path: <linux-arm-msm+bounces-96660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFoSChsosGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:18:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F3251AEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EB1832EE079
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022F33C4550;
	Tue, 10 Mar 2026 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvtLzcIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNtI5DvD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16213C3459
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148143; cv=none; b=kXHWSgKtlz625KuZIQQqC7/nvZlFslzAmzO4paohtiun8172IEDgYzdx4dHtKSH7jIJJSP9Q1LrgVieV6HoOA/O+TBtalXKzTZmB/Xy8xhnQUgqlKPQqN2gSTYopzpFXcuBywLD8fsdrhaV6G7LyuB3R8RM5wkUcvRs93HnDWMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148143; c=relaxed/simple;
	bh=xeP0cg8fs2/EplBG8QOshLpHlm9cB3Vd0zUpxZ2GrWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqVcihRY53vrG9dJpxLwe0bTKnTC9nSjQ+PzYsCELvQbZdAw/n1rEgkUgecFsViHEpbRd7yxWBBLyYmdl3VJ0O2x03GLq8PQc501nDwhI2EhrWButAOry+6Bjc+oIM2kajF5CP/sQzfy4dP53tLKRS886c84T8cNUrLWClu3FjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvtLzcIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNtI5DvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaUvH303863
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g3PYiOsWeV65M3Amr44Ij3ocvo2fAsQM5E//CdihEWk=; b=mvtLzcIym+qWHy7+
	47oq33Njx8airRDEQq1ixTP8RffxEn6D2eBPN4SNOvLNKQoC8xGWibaDDBJFihhk
	9fnkkyEozgxw30auPoAUmbef9lrhgLzdNYc3tj/cUUS2bJp3Rt7X4ZVanx9GMNO/
	vmT1hW1ZgpYhalzKO6Ewga8M1XmvuuanPHhMFVOwceqSY0ww7MmR8TZcns0dU0s5
	sY82qZJcaDOuGpTIYpLGPB0Fk/uMaFQL2SidLA2mr7TgEIurF21SRimjilpkLLIa
	ZjVGEYIk+czG2UB7PQP2+zeeebfr7JHCmTm5s95b8oeS/eLhWhkFCv1c1VJUcGJj
	zBsVLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf0k9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd77502295so1746724385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148141; x=1773752941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3PYiOsWeV65M3Amr44Ij3ocvo2fAsQM5E//CdihEWk=;
        b=kNtI5DvD4YS9fdcfmm8etaBccGQAZCtBDbL16j61GAoSZC1QOWVENlBAA/rQZWkp+l
         ACr+fJ9TQncxA4hI23tDtuiCuOpoLTZvL5B4s9c0YEW1835D6RALlmp91PI1EfbK9CIg
         TvJvNgWw8WeaLk9sA19R2TrqRrx1ZjJeDpVuwxwd9SGQhh7V9lSv/vaYXAsNwk6nbq2w
         TbB8QINfdDfbY/MqaCCE2Zax1n4isBX/NNvTAviH/H+GNLMY4wmMT28hQXFFIaqXG6AV
         apBAsU2SFaHayIu9KLrvj/ErxVRsSgq0VZUvOuoCR1HXyJQ0H+xfpQ5fT3OhVSBO1d+7
         hAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148141; x=1773752941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3PYiOsWeV65M3Amr44Ij3ocvo2fAsQM5E//CdihEWk=;
        b=OtlJTm0oO4RysVWKGR2qimjVf5tlmNOqB+dtpxt6Q9dO4OrHWn/hFpLIs8tBmUkISh
         +eYNYAdzg0kgGQ4qYqnvVSTqfpC1wYdQxVKT5e6il7916SA0koQ+fyvDCDDEqYMoobPq
         VGBxevijJIFt+Vp0BTXs06J4OG0MKIR5NeRhPXcAMdj7iymZfE/LXvgms3inrc7z15c2
         hWPhJQDyKoK7jM+fZc69m/lfZ/4cOHulkfrM2aZEcqy3K25dyuImg19ZeWASOIlcIYQE
         RfoHGl1XRlfCbn6nEsSrUGWuYW1gJEDWvbFYeaz2ioFjqncZZdiDo1kutlNdqSFCzbj6
         uiSA==
X-Gm-Message-State: AOJu0Yzlg883EhGJ6MAbOk08gb9Wa+ukVLyWg1DO8laLDekfjESQRMtc
	M9ItGN1qAzBzIyH00hc3l/AIJnb9YEYuI7fIjx4U7+eiV/Qd0gXCd06tIi1YHSH/XS/Q11+pbwW
	zY7P86h2vOX2yi84FwBf9tAuVKspDpap6Zwg8XFNtFF4QCGmC16Fpn0zzrCelVsqR2iH4Od/oww
	E7
X-Gm-Gg: ATEYQzyP1IL2M5DnSwHsyWRayHR33ELGjhVHtqNQu0o7ifDV96N0p4zOgKkcZRJmDBH
	Gqve0cLBpVemSiOBgnA8LwF2NSPB2IxQi/mSGwqjofWhTn8yskf9LojdEldmmQqpbU51QRhi9NV
	0UyBIc866GNPcj4Dvn22DD93IG+Wnb8r250unTfeVE30KkQ5anUovWhD7iOGYQj036zixdGw020
	TMjW6/ERFHvuQQPcw2k/cc5/qkPCoHvVfYmlyD7VaLmoh3cURqJy48exMTEBDlMNAcs5zD5chWQ
	jJ07daiqpLpUqxLef9BlloaBzUjcBW7Oa+Qk9B7oqe+Ek8lxiwmgfB2H+W2cvac5B+9coa2TA1v
	pHn1J60Z3/tFJJWuvy0G20UuUMI+bDN9HJMaomoQTJZyi
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:141a with SMTP id af79cd13be357-8cd937f174dmr400401585a.6.1773148140582;
        Tue, 10 Mar 2026 06:09:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4082:b0:8cd:937f:141a with SMTP id af79cd13be357-8cd937f174dmr400394885a.6.1773148139958;
        Tue, 10 Mar 2026 06:08:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm99472385e9.9.2026.03.10.06.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:08:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:08:46 +0100
Subject: [PATCH RESEND 3/5] arm64: dts: qcom: qrb2210-rb1: Drop redundant
 non-controllable supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-dts-supplies-v1-3-5071a7052ea9@oss.qualcomm.com>
References: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xeP0cg8fs2/EplBG8QOshLpHlm9cB3Vd0zUpxZ2GrWc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBfgPN85bNJHV8FgL6GI/9OcZzu/l+LbUskB1
 dP8jDWBZeyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAX4AAKCRDBN2bmhouD
 1wRYD/4w/JJw3sgSupJJLW8Tej8tjTn+0yuY2SfAriqch+7yira8AD448lusM2bBhjNW7s3j8Us
 fHqEwZwEcJQf6gFm9sEJ62AY8YoHV7Q4TFdE9OzcD4t0dORlrooRclpLx+Of0gCnMLvNN3KGfQd
 zw0vw1q8Kr8GH3r1bBwyDCKBYTvlYzIFpFqTRO3ArF37nibpFhbxXmScgfGI2rS7VJ0UerdoZjZ
 Hg9BrtRYBZ9Mzxx4eRBXy3OPA1o4HsoU3ptngJSz1xXYwJPRWfIFpmVGEn8dPO6Vbu9foTVBHg8
 aZqCGvIJpn/KS/t8510KdD6auKfRVty8GDHrvqm39b+Gw2NN1IpwkcH2A8qvmvi6MUFLVnrucic
 i4q07CjcD10VdmFyJJ9h5Y/G+vROpeZRHQiYA/IQ26+l7rJtyAZElNgLPVhBP1n1QJjesrw8CW0
 eCh5J7JC05HeNVy4fQZUeUSMEET/FQWKH/+v3Su/9I6KCn9K9Va+i40MDqU6OVx9MMxkRez9MH9
 QiIADLi9UrP95LAWbA3dQwRXk6cMd84d0LfG2P0IV8GX3s1m/B5AituMiPYWBcDv9RTnYzJgU8b
 BZnzWvA1SwGAfqKPGyoqNmb/2NpxbTWjXZkL1G1jo5iMx+ZiPh4oKVqJ3SmWg1crVzUWm33FLmw
 fxwLERhYGTp6nwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: jm0rBFxCfkIqrpR60cbd-NTd8dY_Ox4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX2mz1DGoHXaoT
 o49tZFupKhR54UGpcmm/2BN8Ds+idTuRePM+AuFeAMyNIDnHCFXim7w34LdVPmlh0p6I5fLS7Fq
 UPWxAYGDMkqcuRQno7lmQ/ksKawGp1OrMt+aUhvmie+zy6Wcsdp5BXQDsCfSr1YTLxDB1Us9uwK
 ElQd5apbvBt0M6hJ3XdfounPSgzBuVUoICkwgh8sYQaE+AARKb+A/tuim+l6NpTIvtVtaW+ueFU
 Zp7d3gTJ8UoWxiYjnVxGyfT/EKsJ4x9gUj6EOEGjPtzSJDEJhJdkwSTQS2gCvrnvgfTBavnHNSA
 S8bmwNqCKTL7DqdeZuX3z/rY1PWpZrULPYhlaN7oLp5vYHXfxPsUuLoyoOrxdsJSXhwgu/jzwEC
 J6k6WzBcL/Lu55FIFvYUSYr6B8vyTQ7az3ijuHYIGs5beBEj0zcRmigJxsFlzJ8BaETffIbrFAd
 C8mpztn8MQptaHEtv8A==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b017ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_9iiUgdG0rMA4LjK8P8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jm0rBFxCfkIqrpR60cbd-NTd8dY_Ox4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: B48F3251AEF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96660-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 45 --------------------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 9814ac4896c5..6ac7fe461f4f 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -109,7 +109,6 @@ vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		regulator-name = "VREG_HDMI_OUT_1P2";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		vin-supply = <&vdc_1v2>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
@@ -119,39 +118,6 @@ lt9611_3v3: regulator-lt9611-3v3 {
 		regulator-name = "LT9611_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vdc_3v3>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* Main barrel jack input */
-	vdc_12v: regulator-vdc-12v {
-		compatible = "regulator-fixed";
-		regulator-name = "DC_12V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* 1.2V supply stepped down from the barrel jack input */
-	vdc_1v2: regulator-vdc-1v2 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDC_1V2";
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <1200000>;
-		vin-supply = <&vdc_12v>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* 3.3V supply stepped down from the barrel jack input */
-	vdc_3v3: regulator-vdc-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDC_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vdc_12v>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
@@ -167,23 +133,12 @@ vdc_5v: regulator-vdc-5v {
 		regulator-boot-on;
 	};
 
-	/* "Battery" voltage for the SoM, stepped down from the barrel jack input */
-	vdc_vbat_som: regulator-vdc-vbat {
-		compatible = "regulator-fixed";
-		regulator-name = "VBAT_SOM";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	/* PM2250 charger out, supplied by VBAT */
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
-		vin-supply = <&vdc_vbat_som>;
 
 		regulator-always-on;
 		regulator-boot-on;

-- 
2.51.0


