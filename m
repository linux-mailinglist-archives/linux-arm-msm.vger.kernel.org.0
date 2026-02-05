Return-Path: <linux-arm-msm+bounces-91970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCZnAMgIhWmj7gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:16:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C83F7883
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C676A3049262
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 21:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C5832AAC7;
	Thu,  5 Feb 2026 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY0BMy9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxh8tJQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728E132AAC0
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 21:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326115; cv=none; b=EV2S1RoT14UqD0GAeuBR7xh1pKZt7h/yTgJHsxB5DlPBOrRcdbGCv1YyMFCIB6S68k80aBKQkIzvzmfn0NCh1GqXufNaVrybwRhpqvN6vE+glda7dPK4i4j+mHOwV3VUzphfk2K5Jc2Cuaoj3cbPkI65YVr9MHtlYBoXDoNrao4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326115; c=relaxed/simple;
	bh=1tvSpc5JPZvyNRVgbUHPktqMgKRmetSeLRgTJz3+7QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVX+fFA1KYKRk6udT5TQyVfDpKNuxcUPTZhnVcN9hZ3guwwksAGVQi+4mo6gVz0lr4ALyPnYQ9kiWOxGEWObvpb7fctrj63bNKQnozGoPQ30HwoxAe2mdnwP1CKqudhdoA77U9PlJBFkY8ezcYnG4qrJvKpH+/C6fDAHnsx/4LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY0BMy9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxh8tJQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615EI4ik890430
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 21:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwrANBGWztn37K1P4H+NEO5rWUi5n7BuQoNrf00BBa4=; b=MY0BMy9b0+tSjHKK
	u7I5K5f1fN/SPI3iqwQ1twgTMT/miiI6Fa5xuwljiFQYOax177Nud4mBbNj+IP3x
	CUcF0WBTil2F5qBMDqNGyTSc7pHUHNYRIM5LnawFFyZ2eJr0Tk9honcd8yRg2I4t
	ThscxW+JqoA9dBlKVhKfbYQcj0A4diB71iGMVwPxfrdascODKSjtRv5nY4+PpXCy
	LXS5nb9N7NW2ZXQiTRP2VLMUrZLXwY62arvKdtuvaKbldgw1w05yE/AC+EmOHtsb
	gzzTTDjzI8DUAMaeP5pUCkpKP+FS/Lru/3muamIJ8nq7ZsCkvvT8wM3vbvZQ8XXk
	S/9gGg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prxan08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 21:15:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c314af2d4so9783a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 13:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770326114; x=1770930914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwrANBGWztn37K1P4H+NEO5rWUi5n7BuQoNrf00BBa4=;
        b=kxh8tJQDHWB3lR1IOmyzTXU9qNdkGahCyWfo2838a2hmM+eMw4wYvQNhJjIWQjjGCf
         3H1+u7J4clSgEUpdAhjLoDN4HxLnKcrAiEYs1nXMOH386Va0Oo0Rk/crzBV4pUrk3T5c
         ce1QIPc9HM8MXiTrJLn9DqQVrhp8mxN5LRVBE6YCQeBWVA48nMtmKIaQaIrpRRnuaQDi
         BZBnGA0qfRjzKmeL0mHp0FxoEEL02CijiI3/MQsvmnTVGOAoJXm/x59cApr6+PUvrT9P
         JF7b5gms6gSiy7fN7T1vCnjEcQ+bQMw7BfCLPDlwcIHdqYKHkDOYBZxK74yM8q0UTnAh
         awdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770326114; x=1770930914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwrANBGWztn37K1P4H+NEO5rWUi5n7BuQoNrf00BBa4=;
        b=Xhn4Vr7AhnAJM4ZlFm8yq760Mi4Vu7c98OYv2FYIOT0ud2hRU6u55mgsOyxjW/ZXvh
         p0n7EvRwQeOgesAOTynGHo5/0Lo7T5oa2k55U176Xy7IAeIZ4u4FsNDRMVlOopVhIFKc
         CMbJLFdc8WcEXd17trxXOFp2aquET9cBwOEvplKFIA/PsUMU/rUJcWpUf+UoOvzwBLvA
         fMCMkvGd8k8D837b7OopvR3z1d9VnySKXxeCJddXqJ+Z4NyvUXRJyaUuMB9F17iYUAuX
         oOhPrfWHb6xdbNJQmVwDOpxRFHu8k2TLzwyVBLUp7E+ti1pgyw2YpkNuVwQihgquSiYE
         Vtag==
X-Forwarded-Encrypted: i=1; AJvYcCVrXuQDiwoSS01aXwMeVh6X5gDV7gA85mlBsZX+XyCdgKz+L3hZwVYBngs+M+iyS5JIzza0WImNzC+xijV7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/LhPawXcqRtYN6N5DsXud1kDNWeRE6YLvUsRctzDP1g6N3tc
	TX2Pwh9Yr4rNXccuVs/qHc90NRZClBZpMMmL1kULK4avTFInhW0NZATCF5K8SddUU+i7r4c2OYJ
	YAuAvEc/YLyxafaH53j2Ek06RFHbNgUphY4Cfnrv5ZaWcF4wouiZyVvCS7URVlQCwX5iE
X-Gm-Gg: AZuq6aLoVnaIsxUSvyAWq95+v65huHI/aVXN5wj3PWiwWMNMDP0E3x65gIIsqifiMxe
	+QSQ6i606Vk1Bhp6rbgdGmOD5dHKTlsnrVYfcNRZTW5ps1Tkl2WdlCvxObotzBI9ueJr+YrXI4k
	4o9pxh6JdMNtLhwK7AzQ/T1SZB5RsDBL3IY7eZJmZTcsaF08mLgw71u0Mke6/7q6qliHqLBX+mh
	WjQP2NpSOSEdi2dhQurJBJNBdoEzlcZBNXlG5N20NgP8pFb1M6MMMf8d44zVxUCdHQ+sNpeyNgc
	lQZsiGnHScvogHJP9tBxsohvtZlTTu1R4foIHtSLaCocienuyZXt5+rftnpzrmarOTzOFT3H5wI
	QaG8fW51lResLb2vptyJy8OZjahtG1xLwxQiCXxOkZD2l
X-Received: by 2002:a17:90a:f945:b0:34f:454f:69a9 with SMTP id 98e67ed59e1d1-354b3e46feemr255315a91.28.1770326113950;
        Thu, 05 Feb 2026 13:15:13 -0800 (PST)
X-Received: by 2002:a17:90a:f945:b0:34f:454f:69a9 with SMTP id 98e67ed59e1d1-354b3e46feemr255264a91.28.1770326113350;
        Thu, 05 Feb 2026 13:15:13 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4575897sm74536a91.3.2026.02.05.13.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:15:13 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 02:44:08 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: pm8350c: Enable Qualcomm BCL device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-qcom-bcl-hwmon-v1-4-7b426f0b77a1@oss.qualcomm.com>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770326090; l=871;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=1tvSpc5JPZvyNRVgbUHPktqMgKRmetSeLRgTJz3+7QQ=;
 b=ZLtdBH6KzLE2JKpy9Gwy3DghjGSmiBqTkJCj6JS6vhDDkWmKM+EukQnWc1YQTKUgEbfEgeT5C
 jcGcjLoy7QQCENQol5X6xiyoqZK2YS+RnZH+Df75/oSn/wYZCcAI99k
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: kijLqKI_S9hWcuhFb-DAnfeH-gtvA2hy
X-Proofpoint-ORIG-GUID: kijLqKI_S9hWcuhFb-DAnfeH-gtvA2hy
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=69850862 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d1WuY26MuSUb2FOOun8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDE2MSBTYWx0ZWRfX9rA2HLsgos1r
 Wi3U2/7AhjWKf0VYxq8fSzlRECF33yuu1utWuZGfJmKClceKHjd3Uk53h0ZD4sXfmIdFwCiNrZa
 0SbcQpg6kOgsai/wvzmqhuVgqPLRrkxo/DYkCXMlTF/MB60QsX0swTzs9FOPSMnm8EExbgQ3J/N
 RAg9PUiMCZOVMquO61A94CMpNWjBtMNk/pD1yWG9AIu1uDm7ugZHyjAdq32MHWOymP1n+nA1a18
 elo5+DiA1x1RLMQ9zyFDrGArVrBKPyubhXwRXxRN/5PkrZt/47rdbVWwFUPctI80NqqyGKWPXmc
 jpy9EUJ2VR5GcFRSGX8boO9Ctx7L98FpeZicaJVjAfB1lQVH7w7nl2IiajUc777PfCe6Pd9ZEoD
 5uDTp4KJGDq1Osp3jKeIxkQPt2XSMTJ0yw47CjgjzG1icOXon1jlhWigf1ZkGs+zypUMRFokF/l
 rM1sD+JNz5jLnL4BLBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91970-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.18.92:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56C83F7883
X-Rspamd-Action: no action

Enable Qualcomm BCL hardware devicetree binding configuration
for pm8350c.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..151a02d325c1 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -41,6 +41,15 @@ pm8350c_pwm: pwm {
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
+
+		bcl@4700 {
+			compatible = "qcom,pm8350c-bcl", "qcom,bcl-v2";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "bcl-max-min",
+					  "bcl-critical";
+		};
 	};
 };
 

-- 
2.43.0


