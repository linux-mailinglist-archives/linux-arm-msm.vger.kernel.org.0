Return-Path: <linux-arm-msm+bounces-90875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDaiJiMSeWkcvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:29:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 177DB99D9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 20:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49AA03064907
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 19:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1132736D507;
	Tue, 27 Jan 2026 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAvzHUjb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RU231e3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B936EAA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542044; cv=none; b=syEKO2AVl72A8K7m/Ry12BcDc+PJbL6HiYg/OaIwaM4viki8ESk0ue4U9XIihEn+IG81USD2LTDzfNotU/pQNMR30Zy1paYkrLUl89a8hQk9+u+NdFGt2hCzle+uDAWpn/Ozy4FkC0JwUnBJ0WqPlZGOJ+qVT6JneQ42n+OqkvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542044; c=relaxed/simple;
	bh=iWk8Nl3a7RvnDVzv5cIlkAQy4z9nIA9ZVmLSvJ9vb+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMV7fCiL6GcDUfo2u4a49UnofbvzF40vCVD05eM/QIi83gSvSJsdiAefWb7wGXRGbNqI6ZEXyEuy3E7K0pCu5L7l/KpWcsnMnoxbeI5Ri+Deg9VwSGHsBcW7yTuHmBhN/KDWxvBODtgsCHFkMmXJ0OHUIfFnr4YSms0Xb7+xZws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAvzHUjb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RU231e3U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RH201g1334324
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AchfjWsMxy5/5NRTV/dSnkmbMLB0F/2QQ0pQeOqHjoI=; b=JAvzHUjbZc3BSW6a
	gn2gFevnXm9PZ5h6ibQFwq2tw7X4xnCXMPKDsutYecatnXpItq0ZRmkZK+7GMokP
	58SwnQYf/e7EA6wEgdCaw5jpd5m2PVtdnLVMkfrNNB82erI1dgfeUx1AolgzQTwB
	ne9iLKRvD77Z043wQtSFT+XMu5roSulFheMcQhk27HqYUW4Y5lCrTWz1hipyi56M
	eck7P8MOy1f+3M5toRpciCDu777Kyk8WdaahpSvOqbbTypglL//bP3LwK4WlBw1d
	SVchXQp+/Wcq2+URDPc0fpRJqpQTSpQbR6vvcNOdzR4dqbon2ptS6OAMpZ6DW6V6
	2Ga7qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1dfrgkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:27:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so1614525ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769542040; x=1770146840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AchfjWsMxy5/5NRTV/dSnkmbMLB0F/2QQ0pQeOqHjoI=;
        b=RU231e3UGm0QMLep+frTmLjh+e4keckzTW90RJopRAmVHcEWRr19sTvQtKUv59ngO8
         CsxdsEITn7UxFqhvCrmquFFh2POPvEifAf+cl/pd/SIuzHNLMQjk8C73rnwHLpvo+9eX
         95RpkyRYw8o80tA8DRibAHsxXZ0FPI3qDRMv34D5w9wjzDIJgnhwxXQahcA/gGi4T9JZ
         P1ylArzQuzKGoMxmQ567Y9RGwxoYnoVVWVju4l1Ibnjh6hPqVyZFal3RLduC82cOOfk6
         DfRl0LDQFAdVALFsQWJHXn8tbMPHtpW8VWYN+PMvP+btP5Vx1VuVqV3pbW671bOtAx8g
         Fv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769542040; x=1770146840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AchfjWsMxy5/5NRTV/dSnkmbMLB0F/2QQ0pQeOqHjoI=;
        b=o2fZnAgWGiBvHIptADqc5c+fDDmEvuweMV4KHbpxf8DAfslzic4euEYStsOSHoN9VE
         2EoMr5ROHWsclPcqKhZHsFtu7jYBGs5KjNBv+/AGc7DeDkgdLSdl+DD/FwEn/sd3ttHd
         6joLgG8kAVkoTQqUR6T65GMgkO6aPD7Zx+LtLO+uy/54iZRV647CoVGcrDbqWStxxxGY
         AwpijhJ+eGMDahypM7PgicItxwmVEdr6uMemD0ChFkq1H7r/eOevXJm5EqCYlkchxXRa
         6bOHawi786pXF2Ba7bydEg5arl7ticH7nHr1+74C8oBUbM1/tY9ww2uaA9+JYTTVeWrn
         Xn+w==
X-Forwarded-Encrypted: i=1; AJvYcCWxdhqgtq/wl9ASK3k+cZAt/s4QrI7IVASeDKZvKvtcsEFEYyf9pg5WeLFGin/TW27ue8V8URlUDu14kIHP@vger.kernel.org
X-Gm-Message-State: AOJu0YwTLTtkOF7GS7Zn9PC0SHsH5Re678+/ocWKbTJCufKuTTxmoYHD
	ykiMVRYS7Mk7CKyyAZE1PBXprTK1ihYFxdBPDc4MHw9ixA8aUG4US/fx23LXw+lVEZlYgBjhT2u
	Jogg7uzRwAtgBw62I7pBMnlzqulKVWVgIJdpIwBjFuCpTyBjXNl6Q901K/+ZczK64Wz2nGoTej+
	y6
X-Gm-Gg: AZuq6aJyj4vX+wRaWbvgHwARdUxia8dsDHJuP48ZChjnhsBmg22TEMKxMsKNboaMuW6
	46v54Xj4D3tCouvc/ILpGsXaw7yN1k0+gG9mW4Ej0g1IhuOiiVYTdqYMvB8CuxDVF25NjoJ2a24
	p6DM61G8JQQBXIu4SYFcol5F6SDNsb9ZSGwqUBeEhrDqTmYii978/IpsogjS260JWJzr0XQBk2c
	Dw7tqMNboAnfXzp/0U92rwuAJCJtv7XNUJJ3lzRyUZCupeMNGHlekC+TH1Fcd01s3rvbyxOd87o
	bM30yFvP3tHljrNAF6cHgqXTOiAEPClUcLeoibUqKGsVpjwqdVDoE/rFLFehv+Ff8BiMKO+uBKG
	cH2oy0KZceGrHTpvq+ixO0k3yvvOKzccJHFbNfpd8
X-Received: by 2002:a17:903:2348:b0:2a0:eaf5:5cd8 with SMTP id d9443c01a7336-2a871267ae6mr18978935ad.9.1769542039788;
        Tue, 27 Jan 2026 11:27:19 -0800 (PST)
X-Received: by 2002:a17:903:2348:b0:2a0:eaf5:5cd8 with SMTP id d9443c01a7336-2a871267ae6mr18978805ad.9.1769542039271;
        Tue, 27 Jan 2026 11:27:19 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm1322225ad.32.2026.01.27.11.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:27:18 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 00:56:38 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: Update compatible for videocc and
 camcc nodes on purwa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-purwa-videocc-camcc-v1-7-b23de57df5ba@oss.qualcomm.com>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1OCBTYWx0ZWRfX1D36KHfTYZjV
 P/dxUqqZ/n5qQFEmvRZBaB67W8VWRgbVjrnmu1zzPlJWy2KfA5qbFxBh2BqACt2IijDx2I7PFjF
 N6tcFXLlG4GAFbjUn760vX0HymneBErHAA2UACdHQXdXDTBYg58D0DX9QKVxXUEIcPW+GbscrrE
 t6tCQE5lxydP7nVMzvQaKjrkoE13DckwEzMZv7FPCrtVytAstzDBvWgBPj6CdF9/aV9Afi6X+Mw
 zknLIQ9vlgXQbmJiY8VNEoFfMlj9pkA22mEQVftYdgUbXl70ffaMqyUmZdrFzyfvOowSmbZEB03
 QSOPcP5f1S6SCrOV6jnS0/GpVoDPdvxTmxqGkRwYJXN4IMoFhlU5PSyeNQrUYx2UFf0gNJc71JR
 hATYC3PJeiYhx86GwRdkvZjspi19Mbg/lri0zIJLU8cxiXjr6qkYdX4V2GJYiDDscYBu3h/CQOv
 XwGXnSpv+Rpq2x/fYNg==
X-Proofpoint-GUID: tkfgy5dMrdix5pxr87odpCO3H7JgBosa
X-Proofpoint-ORIG-GUID: tkfgy5dMrdix5pxr87odpCO3H7JgBosa
X-Authority-Analysis: v=2.4 cv=YeuwJgRf c=1 sm=1 tr=0 ts=69791199 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hE_BDuzjsuJR3tGECRgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90875-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 177DB99D9D
X-Rspamd-Action: no action

Update the compatible for videocc and camcc nodes to match with their
respective purwa(X1P42100) specific drivers.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 2cecd2dd0de8c39f0702d6983bead2bc2adccf9b..63599ba0a4f488d8f40f3e4d849645a8fa9ebf59 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -6,6 +6,8 @@
 /* X1P42100 is heavily based on hamoa, with some meaningful differences */
 #include "hamoa.dtsi"
 
+#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
+
 /delete-node/ &bwmon_cluster0;
 /delete-node/ &cluster_pd2;
 /delete-node/ &cpu_map_cluster2;
@@ -22,10 +24,18 @@
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_zones;
 
+&camcc {
+	compatible = "qcom,x1p42100-camcc";
+};
+
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
 
+&videocc {
+	compatible = "qcom,x1p42100-videocc";
+};
+
 &gmu {
 	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
 };

-- 
2.34.1


