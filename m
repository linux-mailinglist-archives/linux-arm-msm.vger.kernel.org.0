Return-Path: <linux-arm-msm+bounces-112595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /WYRGgFGKmoplgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:22:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCB266E804
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:22:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DF4zJ1Gn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aJcNOiVm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112595-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112595-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B2D33EA234
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD871372046;
	Thu, 11 Jun 2026 05:00:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034BD3803D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154026; cv=none; b=DCFQgqdToUBRKjnHQgibjOfalq3OD4of8LXLB9LCLRpQSj8tcKnBxJuMMEF7vPGtQs+vFPX4qV7lzwOmyOjw2YyUbl3n36kyb1Cdfr7rc0JX6201G32xphtkbTDddfYAtJPGMqyxwQOA400exJTwu/oCcSuXtaxhj9+/K5tDlKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154026; c=relaxed/simple;
	bh=PxFeE4iE8H+mop4PjNTz4rASGopPuOb04tpGCfdaBGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dv2fwSNwsIWWrezFKQOIIGJOWXSlPnSjF/9dTAAdUrZ7fvf9O/gSrPu1Qdj8vyqzB/FykK7xgQ0tOkDaR8m0zmItIfcJz9gQIWxrPfSsoIdUyM03N0qg79DuAuByPpjwmxt9JOK7d1va6GLcxPyXEYN6TeNpDH2qJV3IP7EAOw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DF4zJ1Gn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJcNOiVm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NTP73159487
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=; b=DF4zJ1GnqqaT+niA
	phaJ3yT03cim0UtMvTGQHTEbvX+g9Jbg3RNRVyxczHRsfEhT4LwO0DleekRPC2cc
	LN1SoPOxQ6K0bW+Qn8UjJHMJA6F24X6U9+rAtQodQBON3CcGSnFpW8sAZGhv3yqx
	73khZjdlqKifZ27OVTpwZYMJo5syikoLZTrt7vUGAgbG9+CAHVuqeFoG3d4yhmoX
	TkMdif34AW9tw1uanadON5HGqVHYSXCKLbQb/UTSX7e5vGrmx0a6LwDycTfdu/mf
	c885xPdtLLAnaMM2IAXXBjHSw3BEln4eDMVOEWY23ZL+V2mohcI5rAWqk9bvJ7pc
	3+JmRA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701p75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0bfcd629eso91692585ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154012; x=1781758812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=;
        b=aJcNOiVmN4t4h2z4BYhy/j8JX7VBzvoYK9fvXENNe6iVdCMYlfnhOvkJTk/Nn8rtAj
         gksI6EFwVujPQHoj+U03JYiZE4ECxRmHz8dvmpJUdF4cVLcc3NUPmKUy5J2mnEKF1Cg6
         iJJ35xqtXPUiz/gE+laT4eSGatYw4QMLqDiMqY8iPPLPudMQvL/7ZtNy1Khn1LA58BaA
         4qjvEtCUYbXLmKflborKmMVmtH0/eKPh7LPHbHKJWUHpH4/1ojq5eLwH52qNbjZO2QSi
         b1eMlW2YKIeIF/5Pp0+KkwhZw1yv7SaI+pCaadKaiKZPNPku3bI+x+0uhvGM8NpriD6Z
         9toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154012; x=1781758812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HNuNHDzkj7zsiUvpDWiTjAWZpkmlx5Eb/BqVvO8oXg4=;
        b=nmS72e78hBurqyX+9hditDnWS/iOBeNguHjxyqbH9GsvNS7bRpeCRO4tibg/rugTKM
         W/XW4//I3AMeUw6+orhFttJ4dtAe4NCKTlZugNCATIBEqwEluQLOc6pC0iEKT2ZCzskC
         ZnPUXzy9KLAX5+JUu4nLnTwaxJ1u1pUw6/J6JEUqdMfxvKlUwwoL8EnnH8EUVKO/4Z0g
         AFzf7/sI8oG25Rc8IHzxmn/airdMOrx6whXrWj5qL4YRNGQfZ9HHDRw+M5xaSxuhBJHO
         wtaPf7F8y7/pCo6tI7TckbDJoQYdyyZoN8uuqltg3zWQdXhUchmPuQ0Nji6hy8xStfEr
         ww+A==
X-Gm-Message-State: AOJu0YzAXIV3VEbUU68H2t7jBaYgC3HhtgVxOoJgO4XxV7M4RyKcH2c6
	8ZkEngQk7CM4U0T7PwSIv7JLZ/KGb70nZ632xjix3tCy/Ng0cBE0F5brtxnaVZO84ZDkOIxjQ2h
	WqLzNehSGAVmRgWXWTkqYkNK4JlspqhlMoF9Ovi+FtXHxaFEO2caIJNRiFJE190KV/+eOFDmHVm
	QE
X-Gm-Gg: Acq92OFpjdPQbCCmbJWWjvdHchbRjlDtaCHD0gfDIYov3TJmH+RxLmFqVJqjjDf5Jqy
	IBHqprOVklM2AyLDF521s9FIkJP0kqlLkA0+x0gefaeOpJKdLTXLKMDkEZ67jyAOLv5Qn7y6ze8
	0ed9PFqywZDDNKk25TBTl1ojMCvlKowg5s7INLlt044v3efLbr5VdqTd9750c06JCZP3F+nXMkA
	bYu4wndN1boMNBwcEb3VP+3oJQAdvTy2U5WTvnKlu1OUXIs91AhYeFqOXZuoCQo78f04ydC5XnL
	BSocYDRK+tehEb3dAAIN2xMz1lqkCtA7dSi3zxKUdAA0ZJjwxjV4QWtMOu/HZdU99rvrQo8trXI
	kB7KNAlK9ebdL63Ej6L/MG+hOa6AkRuvbqz+75uArF+FaYP3/6KMI7AbFlsocwjMzVNY=
X-Received: by 2002:a17:903:1b48:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c2f4208cffmr13323275ad.23.1781154012186;
        Wed, 10 Jun 2026 22:00:12 -0700 (PDT)
X-Received: by 2002:a17:903:1b48:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c2f4208cffmr13318565ad.23.1781154006914;
        Wed, 10 Jun 2026 22:00:06 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:06 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:54 +0530
Subject: [PATCH v2 18/37] arm64: dts: qcom: talos: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-18-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1536;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PxFeE4iE8H+mop4PjNTz4rASGopPuOb04tpGCfdaBGo=;
 b=lBgk746bBQL9urzTDaOn4PHuUcZGq8u9NBmYMULzhvaHgN0gr+ZVlVVYVOeXoLXgEg+5RpKRZ
 P2kJtT35cPrDyi//VNusuVelAZi1D7LUYZM1i61UQ509oaeWjL5zIo3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX7hxdkl5VGoOi
 1MV7gN7znOwDwropPJbsRAmQjy/wrUpTQ6hN6+6qyVLMuZtuda6jZOsirSNECLrdkHZiEsA35ts
 DYRbX6X9EnKE6K0Qb/q7cMJ8mDRLMFpfZwXUBuQhAcXVQ9a1poQzlm7DDH1dPRBqZl+8fSfV949
 W0BNiGUrbU84sWnvkvMaLu3EWihl1sLzk2V0CoI2ttiryeJKyGpgYaI2WCxJwNuB2SuolofIwhY
 tgyL7KbEDq9B8eg2uV8ov4fGdf7fEgn/B0lttwmFv93CeB70cX96hmIb3GDCB4882DbQHE9WXRt
 0dH+hicqDp7TpOh59fvf6MH+7RExMkSiq6gRVobfAzR7PXg5MpoQn8jAtUHzFOoTgcLiONQTzIr
 qKkjZ8d/lfyFWhnzc6JK6nlRGXRr8DYmh6V+EaytGmZxqIW9WVzWKnpNU2tRggsJIBdq9nw7/gA
 XoniZoJgLOkr867E5iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX0w0Y7B+Lc4Vt
 Fa2ECIUWT2lJxIF6Ra3rFP2bmavVUFGiZQ8ssgvyl1c9T/u5sGd3FhaUmFAuhXYvDQpsE06xD1g
 TWALrqV/jt8c+1OgxmVwrJ7Fe+rAlgs=
X-Proofpoint-GUID: 8bjpZdOidWc648llTo1XxCi3JO2f_t9L
X-Proofpoint-ORIG-GUID: 8bjpZdOidWc648llTo1XxCi3JO2f_t9L
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a40dc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112595-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCCB266E804

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 7e05f873194a..d89548a2a3f1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -445,7 +445,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 294354c034c3..6eca3791e2b9 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -359,7 +359,7 @@ &mdss_dsi0_phy {
 
 &pcie {
 	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1


