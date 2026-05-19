Return-Path: <linux-arm-msm+bounces-108454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNF7EEFCDGq4bwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:58:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C957D039
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF21132F98B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1373F1AAF;
	Tue, 19 May 2026 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEEwQRvB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFu8UJ3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1AD20C461
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187700; cv=none; b=qqhNt5qWU3JVZv1fgYNHi/eqKFEN3JIIbR66ouBJNgyKc7AgY9zMyPDhS931lq1vzs0h1lFh1Xrp45Z35GsZDkSHJvYXqaiDpSnRFv6qNMqJ7wWyqxsXZWKyOApx8XpydsiAbg/n6mPZ1dzStSW/jBdZxMLDKl1AjNvNBDECO4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187700; c=relaxed/simple;
	bh=xYRU6BVEc7MoqdSBzkA9NAynnrccJmvjoEv9mNGS6kY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NW2OAPZvG6cKhW9v5pko9MwFiwUFX41WZpRPIKukbLtqNI8Z2bO317gN9m04GiswfB5I5gHUgBwd2wxQWaNdqJF+x1BPCz+/HNXxB4RtogVelfblEEk9Dy1N3Sgy4snQHqWr07xKNrkI0PPGycqwOjEKXXCyOWnq/G0qCZkNn6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEEwQRvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZFu8UJ3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5xUGm2438146
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35REuCbpcVViy035ouXJ2Yq1Y9m+z5h75tFEcnvtUk8=; b=NEEwQRvBN2Ysw8Am
	Hy2tNhFLRxp5YjEiY34NSRWEI2s4X5TsKW9Qumq1lfE4lk3nAY3JWoALhT3aqOZm
	4G25y1YMCX+CIhA2ct995gYSBChWjhnpZBtvEYGau3F+bnYwnR/LGp+JhFFNnUCe
	DJH599fjuxgkEvQtvCjdK49C/54ZKfqiTteCmwImL7iGZxwHzARFbVYK8gmw9oXv
	wg5PEpx9mjDLDjS7OEjJDs2aMsW8sE16pnekseSRCikg1U7IZiskxVqsoeSFO3QO
	DvmaCuKcTzpfseVIbg1yzC4ZK5A6N2xT6++hD3p63Jk8syUYLurQUExf20TaVGfX
	MQNthg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v4m2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:48:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e136aff17so79585221cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187697; x=1779792497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35REuCbpcVViy035ouXJ2Yq1Y9m+z5h75tFEcnvtUk8=;
        b=ZFu8UJ3AqI9tcVDWEZZdSFdb83fsPr2Q70MqxvAD9sFi5C/MdRlLDDmfDrZSk+xWW2
         WDI9Boo668SQ31qPvK72fP+og3MqevPrv56jTpt7QBbIbUhm5KWmuhp7Hn4H0zk/pSJ9
         v8KfhL/4M8BeTX5IYGGwBFsgv2KdKMwe3Pcraw0GmKI9M5v20LiCWIb7oJWw36OvT69L
         myRbW3x7t9Camkc4vHkgj0D8j9U2QEJFSPufr5Z44VAKRRI1YEgBZekf+SjrTvJJwDch
         P3iLaKOMq6w3OHr3FPs22h01FXaAvSSqPu3LJyqo9GDi0JWgNr720Q1ngDvO9eBsVzP+
         HlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187697; x=1779792497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=35REuCbpcVViy035ouXJ2Yq1Y9m+z5h75tFEcnvtUk8=;
        b=QPHRcXO7FhYuVQyEk7qNGao8dLhXkhBkNRadlMRsEwGPlL793PeSJfATfmxfnfmTCx
         Nh9vAuRm7+5eQuchWfpopfN7LqBXV85T6pA0Xq2DF5heGkVZx5ZOsHfUL+nPLl92KHKV
         +Ex2MzMVpx7s7WhQeRH471LmGihB+qg6KYXmaMeGJSAcl/s3KJ/v9NcDNlS7d8yxDfzd
         xGQMz906WcbIqXP0f2+UUzJhE8fucx6M6Q0PMBo0KRyZrSvBKFuTt761BefZbYMIhp6W
         lJGNhyHRlJVdbfSetK4h/YlbcERWntQ+yTaEkAptUJAHzBUUaasdOxRpT6te74TvrAwL
         a9sQ==
X-Gm-Message-State: AOJu0YyGA2h+DKr2Y7fBSgq89RYOIOuEoAYKYEw44t9X+t3t1cP/HfbQ
	lYAbek/8X3djm/Ttvu/DjcLv3QCJXsL61KPfI/XMiE19VihXe6qY0faPOl5rT4dfgqLy47qxPW+
	/1+W0D9OkQHT5pltmsT1KbsXhfuy1XJj3jAOQdgL1L7ogOkg53+FYS92wHPb9cKlxaaa0
X-Gm-Gg: Acq92OEUvLa55yMc6BGEwAqSV0rmh96pJlgipcQUqfeHmeEgw9fhIQqjUUeR5hP2cGU
	LyU/CpJB1fKgaFlqhC0eIWSzYZDxtOH4vh2RVfdtbThJ3YLJlJ8p/9TSkKf0uNvZH3FxkplJk32
	+cdqhwEf6YOHhTqvHZYYeizkcQwNqUcixr1+840VvNCk4s1XAJj373ONumKrwVm6CbDZyDqpE/G
	6e0gYxqqchwxmkyE5CUilw9mu5KY5sJNdB6iR0okuN46X57dOiDFZ9QzRvDosolkALFPWEQdz8X
	qRq6MNUGz/JA9DkcErPW9T32OOoXwTnFAykyzjMiAmP8ZOM16k4Pn6EyyxRSazGDBp+Wy7EYbf1
	mWxoMNLCAjllNnwCRqv4cENtpQZY8ntOUTcKLN2tJCU3GpRT7nEYonwOAzI7JyhUInk46NfIJTG
	CH39n44eNljRr52A9dt8fgP0iV8GTZ2TGS/sK9xHQuwoa/tw==
X-Received: by 2002:a05:622a:996:b0:50f:de06:45e2 with SMTP id d75a77b69052e-5165a0d077bmr241432501cf.31.1779187696670;
        Tue, 19 May 2026 03:48:16 -0700 (PDT)
X-Received: by 2002:a05:622a:996:b0:50f:de06:45e2 with SMTP id d75a77b69052e-5165a0d077bmr241432281cf.31.1779187696221;
        Tue, 19 May 2026 03:48:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:07 +0300
Subject: [PATCH 5/6] arm64: dts: qcom: pm8150b: move vdd-vbus-supply to
 connector nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-5-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xYRU6BVEc7MoqdSBzkA9NAynnrccJmvjoEv9mNGS6kY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mkFspQoJLegLkYv9FlQQPdVRasWCokg8YT
 +MaN2NW3eiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1YToB/9/CbyLaoTjhEspKcExQXJN+jofoDLLW/BYnAhuBV0H2L0YvkcSrSr2Df8+JziYHE+FLKi
 P1uqzK1gEGYjwMdiju47i0yToZhZktwT6HHNE7yQ62Q7H0qxmM8ryjI6ebAhLieWj19zA5/R5MF
 fK/rwhYqoqEcIT02LRNzd31T1MXYZTQBrV0lZ+1/t00rfSUBClU09uaDq3yYi48sFk65u9ukYUx
 iWfy4ao05sveH6iYHFvsNx4YjNOeiLHrI/ozp5vkAjEOeWYwkHdlPJ0lo3qMCODwMEu0EYoZ3Jl
 7Ydtzhlkf5XCkwpfSAKGPfe2F6C/eccp4wB4vnXUHpTlyoFB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c3ff1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=W78v0XRATXHzZ1sILyoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: YLdB6o3emyHXIfmIIC4hCacXfAdL-UwO
X-Proofpoint-GUID: YLdB6o3emyHXIfmIIC4hCacXfAdL-UwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfXzZg38mp8e+ys
 Z8znBIXMf2ZtvMHCoDTl87xy4xbzSa+LP3ePSrgtHMiQoq9AaI2wejRzLNk2gnBjPpSozz+XQwU
 TZ6GQdepCvP4ELsHxlPZoV12eLnmAbLb7bycaNQCwsuQhKJmNUMoDIVgn4IohiJI0iRfutHm3jL
 M2hw5Z0ts3qw2VOuPx1HBI+Xu0BC6p7WVhOODVx4E5cv9dJAmBWLVvgo31YN8m6NhhUdX1KHQ+F
 dSoGymrz9u1nHD6wdRj+ZP/wHeE8+3i3A0jWDZWUiJveGu63eu7P6UqRCn3VVO577ZDqjxkE2bN
 nccxDrcnFyARr9fe1CH0NbSq1XRzjWn4P4m7TtxikpYqgjpsJBxEH1kb5T5md+hCXhggwEefZC2
 /bN+CpVQJ0MdUfN9bw1t513fTCZdidhr5JXzDMWcYOpZ4ayM3U3oGSMUv5qbanebNSWOEoe89bG
 6Kzt1VxqeEC+mrrKQ9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108454-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.9.96:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.5.220:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD4C957D039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of specifying the VBUS supply as powering on the Type-C block in
the PMIC, follow the standard schema and use vbus-supply property of the
usb-c connector itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi                    | 1 -
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                 | 2 ++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts                  | 2 ++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 3f7b0b6a1d10..b83be4b6cb1c 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -95,7 +95,6 @@ pm8150b_typec: typec@1500 {
 					  "msg-tx-discarded",
 					  "msg-rx-discarded",
 					  "fr-swap";
-			vdd-vbus-supply = <&pm8150b_vbus>;
 		};
 
 		pm8150b_temp: temp-alarm@2400 {
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 54da0d759a67..690b484352ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1499,6 +1499,8 @@ connector {
 		data-role = "dual";
 		self-powered;
 
+		vbus-supply = <&pm8150b_vbus>;
+
 		source-pdos = <PDO_FIXED(5000, 3000,
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 6ae6e07c37df..8fb04ce72f91 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -572,6 +572,8 @@ connector {
 		data-role = "dual";
 		self-powered;
 
+		vbus-supply = <&pm8150b_vbus>;
+
 		source-pdos = <PDO_FIXED(5000, 3000,
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index c017399297b9..51b57c697a75 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -725,6 +725,8 @@ connector {
 		data-role = "dual";
 		self-powered;
 
+		vbus-supply = <&pm8150b_vbus>;
+
 		source-pdos = <PDO_FIXED(5000, 3000,
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |

-- 
2.47.3


