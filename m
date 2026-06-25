Return-Path: <linux-arm-msm+bounces-114511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oeErM1gIPWqNwAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:52:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D866C4DC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:52:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fk548a1p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LDtIGbwQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114511-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114511-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA17630CFDD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71826356761;
	Thu, 25 Jun 2026 10:47:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170293876B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:47:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384424; cv=none; b=Bu+ipGdUDFx9BmSp0rESSxMA1jNT1M9s1jYE0dzAK4kfzFnjUjMd4Z1UgGpRHKopDgWONUCIN7sO64ZQpL07wGqpLdxtal8nrcbJc+cp+BkZ59bOKYLvd6GOztBQLZ7zmPJnNjVtBNNxxggJvFeTXkaFEZMP7YqloWm81FjzMFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384424; c=relaxed/simple;
	bh=CUIELfXlwJTfTZB2/mLXR2/oqYjuzytsMwJ/vjvrA64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ANL+V/0EZNwDtZVtOa5igxBdaDQofc8JkjwMbwq6tixgAn9Sq5Qx9fa+YKD1B5gCxPadMZykaKP0ak3kDUS5RTGydwvPVfgkFGq0VnxzhtUQpmUK93W9rZJLbuFIlekzIJw3biSKsrLMkuaI9gANWSojylKeYNDd+P4CH50EL2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fk548a1p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LDtIGbwQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9k2h01921324
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amQLXC3mPMBsoTlzFWETG088elIkyj3mulEteTG2VJY=; b=fk548a1p1uV29Ju7
	HiKgi7JjavYI3l9tEWsM+32xETGNOwmd//wdEPeROdcxi6tpSdOEAv8TP6glRzz+
	xfmZHlrscoW5mL9oxQRYsike4DhOAPMem9lm5w5Eyz+oW1ctlSw16up6NcpaIbCb
	FEvS/jZpXjTcKbtCj+dvb7xJghvocdP4oGIn25Nq4F8rRLx6qGLrOVnGcXGva0nq
	T7cjiaTDvb1En44a5eK4bvu/UowrQFHX548z9h/irPuFBf7WpSoubFOnPa2ZoGon
	ekwc8Mm+PyCOSfysnCrFebyCxchHlGsNecJy0TEwkdZ4ftZXz0RG3a2IkEEqSDht
	fn7ZVw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9t91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:47:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c79e5de32cso18327845ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384421; x=1782989221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amQLXC3mPMBsoTlzFWETG088elIkyj3mulEteTG2VJY=;
        b=LDtIGbwQm3BeEOXMGiWyrlMMKZObhhAU8jeFjVL9bsZjUdUQu6Nf4srDSqP9oPMWZ5
         VaBidNS9Q6n4FelGRLESTQdAiF0FdhFwAnmIkHFzsIgCXyZHsq58yBzrCpj6+ojZ6+uY
         lJ4MbzR8JTXCY3z2jL6fOLUJs5tsFu4ilCYwZ0eezaB5n+kjkCCIFhMVWu5LwXVHLf8b
         ZhlG6q/Gp1zA5YoArpbnZDuZWDTS3G391jo53DV2zlsp4cwr2qrZ4lBsZAIHz4vry4zR
         E6XaGVdq9alAFQqCEy+nYaJhFuosElU7N/QT3MIesAbZiIMrnCBcvScRQTTMruZZK/f6
         jcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384421; x=1782989221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=amQLXC3mPMBsoTlzFWETG088elIkyj3mulEteTG2VJY=;
        b=WQHqLSBwnCm/X64gVnIXmxvYxyrsgpvXleoFD9CKGHzHwu6LEuXm3Bh5ZhmcIf/GTi
         DvtdtD9g1doovb5Yz1f1qb1YFCjCYO3ZJdG/82dea+fE4hDb0F/4VhPr925gYpRHHTtL
         mI31nMpg+bScrV9YqdeFXqqcHi4MxELs0E1aAl7XOfDGx7X2V1K4N0+bbQCgGWCplGiB
         xaQA3l3K9nkaiA/QVcz+5JSA2akiiv/PCiyeLuatD8zvSGs2sk7sw1Is9PJRR4ZZoAiZ
         eiu4ZTIlKBwGxa2ObcIYKdkwG4PqxwBd0BgRmPOuvZQ4VEiH3CcvqJ7cRES5DcpTHHbS
         3Z9w==
X-Forwarded-Encrypted: i=1; AHgh+RqfQVRq9odz+BQ2I3YIHo/XgSbpVyqy5ln1NvVx8e9nkWBDUWPp+cUu7a0xPFtKWk4uSegOmM/0ANJXO25T@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+hhFfSoYEBifa4MLUGu+NRH0StYn+UX2kSeFSayy1aztumum
	dhv1U3l1KHJsVB6xO5o/2RaQUbUS8qxpMkkMHJ2hOh8IUbtq0NDlgfugCKf43UHOoPgxypmK38I
	NOb3sZNkVbhCzaaNEsRCBcAaIgCt8krSJU+m/YKFLgJb2ovHAzC8EXKmzREoGXoXwG44w
X-Gm-Gg: AfdE7clmu4CeDkQ6SvzScizgV/4AtwZ5gAtsS8SxOHAU1bruWKsC519mJbQT2Tamx9b
	xeelDJfRJTAnXP6oMLL5ObUa2uAEP80NfJO/dnDMKfsoOgSr+yDZGfidAd8Q652G9uNufNnXqKs
	8yOZ/amCOFSdlirOtwAkECw/KG6uZyMSP3mXlRqKrYRTruL9OoCBI6hRHwfTNlcsey6wvmDXmKj
	zot0pnMSOMTg82aE+kh1fGY0kiO2WnFYk08x6zXDUsm3pSRmSobsgwLyHZuu2VIgQpYHYQZ3a8D
	ndVoVQ4RwdthZO+jIL7dl/JhV8EUzIqks0ygqPeNa+Fr79SVDQiTvadOXEGU/GgqtunmGZtOmft
	HNteHES4aBLDLJY4jZAy3UcTrQQj8ZzaIy6yrFUt/pc2DB7HwuC/KsBL24BYa4ABs5Aglc1IsPg
	==
X-Received: by 2002:a17:903:1a08:b0:2c7:f7bc:633e with SMTP id d9443c01a7336-2c7fc743afbmr21142995ad.13.1782384421140;
        Thu, 25 Jun 2026 03:47:01 -0700 (PDT)
X-Received: by 2002:a17:903:1a08:b0:2c7:f7bc:633e with SMTP id d9443c01a7336-2c7fc743afbmr21142825ad.13.1782384420687;
        Thu, 25 Jun 2026 03:47:00 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:47:00 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:57 +0800
Subject: [PATCH v19 7/7] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-7-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384373; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CUIELfXlwJTfTZB2/mLXR2/oqYjuzytsMwJ/vjvrA64=;
 b=peF9+aYTtaL21BpUX6WUviTZt97HLGhKOLkRbA+DSbfmcO8COqsEDQ4DiHiwh/Fa3HzjlN0UH
 tXcMvfWfVCTCJC5ldseja94DiRiDIVDztU6S8YZ+EiWMXc1yjECxhxT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: mxUoasUHMc91uilvhdf0WKzaOqYaOxr5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX5DtiwHCyjtBJ
 qyyhEkMjZRxGnD72sCu0sEvDOZuwvwYezfZ5q9KuAFFxGJFZwxajlUVRt6wrsS5F2oOjRyIqctK
 xcS85X0zdzrzr2osWojIfd2vZQs+7U8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfXxAwxrSjqyFFJ
 zHhACOH1VnZJrGBM7MhDcCqpsJkNIjXg2UIpQ+01SOwHlWJ7Gk0VKwBGGV6CGdtji86ePg0elyj
 trkRW3E4CH7ykveay0mmpE6SfadvNDXzFcHtWZNQa5wMNt7n8i6A+vQTmPd3mn9/I682h6UTxvq
 tgetRJc6Oh1qBWiHbBkyDMPWp/BUVZMQYvHzlGSvQGL2B4pyPBB9QCd8e/DVWpMvDCZHIoefZp4
 OfRCf+v0eQz5CfhHzsGeJV+ITPgaDfEjLcXRLE2+2aq68uygp+HralgAJEeOrCcpoMAm2yBut73
 jFqT644btFtpM/u0nG2IYyAdVE9gEPyTdNk/cTy3wi6+Eg62tSZ1MfF7IutmYdGxBqXyZEnYMoL
 a3s4NSrBW2wLWXpZXZwMHlN3byUBZk0blAtEJ2EJB4ZJpmH4YwM+/Y/naxiOS/0b2OpT70TQ7wB
 dTyxIBWrEJsC346RjrA==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d0726 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: mxUoasUHMc91uilvhdf0WKzaOqYaOxr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114511-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:alexander.shishkin@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40D866C4DC1

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..2b4debc39db0 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3150,6 +3150,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


