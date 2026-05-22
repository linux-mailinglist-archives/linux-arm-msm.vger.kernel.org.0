Return-Path: <linux-arm-msm+bounces-109412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA+jFkq1EGoUcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:58:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 530EF5B9C4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 21:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B3FB73024D72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8E5383C9E;
	Fri, 22 May 2026 19:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJ6It0vl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5J2plZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AC23839A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479694; cv=none; b=qeWgsJ7nFiEDWKq94e7LMH0K+VtS4qUXDzdN2Ybq+Mm+23U1roRgISxX6DvB9LD8XePsVR9m9EQ0c1A4UVOdzzftYaXYv4U/XnDvfj4Jlwqygxo99pD/wlscl/e6m3qM6CrgO7RRJ0v/HML+JtBPE9njlRQEdZRGIPGFKIeaUw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479694; c=relaxed/simple;
	bh=Jo3NPoIdP0VZV22BxqrJEsV4rfTesv9UXmVWD2So6nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kt+PCJ4Qzq86kMQTODk/6WKxRfPy+s/XrZpvGg8RmGehuxmjUVzSoA1KmEJl7NRJTfxh7IXVS9++MKuFVlLe3oPOy6kHphxpruilvUmwoB8kP3vMpsZXThVD2ZtxSxBAfzd6nh1OLPOmJjcTEDtNZBkG4d7NKku5XxoBv0CvWSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJ6It0vl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5J2plZ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHR7YJ3948272
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lu45SY7Lo9D
	dYgZ88DvqzI3iyVBj3O12AmJ4deZuVIk=; b=VJ6It0vlKhR2QeKiUyu1yKRCs2X
	3LB6/vsWFE5VpnzmBZ1lcoSTM0EGMSpqTURWpShhR+G4jphbFkTlWMgfsHC5xIAm
	3BPz9GSqLWwF075yEALD6n8F05CGduIcOKebeMrPdiNiLAlDTZ5XiWjs/z5Ix9qw
	y9ETZgfLSNn/UZ1Bwl1qrkUEf66d/uhJSPVZ4724Um5OlUVd46+hcJGoa0R9sMjA
	2GT4GhDpiXhjERdfo0doiGbLJWFsTZDUhri6FKOIif/qQNCSTyTXPpmhSLknVl/a
	88iUpe2WRUOFBOEz+kCNwRwbazhyKF2UJU9wLUTCqC9V+evfnS6I73yDPIg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2nj801-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 19:54:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babbeff9e4so83242455ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479690; x=1780084490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu45SY7Lo9DdYgZ88DvqzI3iyVBj3O12AmJ4deZuVIk=;
        b=i5J2plZ5qhAvhMbOUqXhhhXpyGrSNdlCWYyowjtrp1JbVSn+k271/aJjDn4AX3v9rA
         XGi05WOzgiu36rnlJ5GVfSthKozEzoJnCvTbzcN7Qp4xnHOrFkh3lyda6Mo0wLfaSruT
         7NMLpkOPV4Lo9zuMmEI5WA+fptZOBVf8uINDq2Ke/yOkxeveyTMr2kQdfVxxZXU0FXlA
         ujMWATtOSw3UFlCr+2RiDrHJjiB2L98IjHt9vKaJC6QFSjdnRIypj/+9oBO1nDtprZAT
         0VP2Psxb/o/l783VAP7mVW9JJo8Ok7jzBndOlT7A56FaGmv2P7bAZ/Z4iZoS1sEP5gKI
         Eumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479690; x=1780084490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu45SY7Lo9DdYgZ88DvqzI3iyVBj3O12AmJ4deZuVIk=;
        b=VKuoV7d8Nfj/ZHTHlw30C5QfQ1jJ6B4j7h8uxp3A/UzVRTXlyyoGEyP8qvodYMXj0F
         rzkbjZK9WRpeMRmhK5BK/1yPAY6FLs+OvKg+jgLfe9mv4887CwyNrwo0Vx52JDmHZ7zN
         VnmN/h91TRRd0MEBaXrYO/mY0gEOJdP7QNJ0iogo807yphCiBUJVDKvsWisB/uXE6qsc
         E9wPEcDIM7+P2iYLMC3ReJUlYj3dYNBTCBeSFDbLnp1qZaE+FApJqygpB5UO8wy62qsC
         RQ8P2Wf9W5zamI/AvdBjfVthYAyjRzQ0GpD1iZVmOMutTCfGm0X3itYI8tIW/Gx2QOEp
         F6VA==
X-Forwarded-Encrypted: i=1; AFNElJ+wK9RIbqzLDKGAT8fDuvInyQgx6M7/x4pelNGeT3EvCc35HIcmxTAdBpt++BwKLrxW9CYoe8RjYvBGuvfZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0DPKdN/jbtv6c8UowAuFil2XCqMvr7BbtfrqXNZ3xdbZdy/n
	nD4/iKozPXh9Swnh57+Sg1QUwFkT5tXKIFdVHS1e6bEvCgIWp96HzUgPZ7tEOdUA12c+6HSqbPe
	5e0Fk0jSAYPZ2s8Rbz9QBoOGHloGBV+20fJ4SdqKW0h02OdzSajO3YVzdgNZfTXNuA4tw
X-Gm-Gg: Acq92OEwLIpdqGgAiIydisYeAvJ60v1+do+mQfk4UrI2XYI9e6ABv7Em/jJVQtEPmqk
	gGEAboSLX+Qb6BC5M/hB6CqzEMZHQ42q+HMQu968RtwCOD3O1QNQFN6xuPKeVoi2OfXHtR9P8sN
	Jk+eaqAh9od5Er8Afjr/UOAXR0IrHwaepD4aTRDz3D9wNV8mJxrKzu8aEz4tZpCgPVZLv3JP/mo
	VJhekV2R+ej01onuJdVk6Tb2v7thMjYmeDa0D9LrtDNr1r1SCvNYozFiG1/eXi5KYzemMz0juCB
	DnLqHsFJOVImVYRx2Z+/6kSP1SlYc/Pm5gbrnYcTVD+O7mTfNR6RkLEPKif7PUQyb5MMFgwoq9F
	WkSE+X5B5dQsaZiM3Uok6BK3tg2aO3iB2xUZieoAl0kRYEpr5
X-Received: by 2002:a17:903:1a0d:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2beb0878549mr44533555ad.14.1779479690379;
        Fri, 22 May 2026 12:54:50 -0700 (PDT)
X-Received: by 2002:a17:903:1a0d:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2beb0878549mr44533235ad.14.1779479689886;
        Fri, 22 May 2026 12:54:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 12/18] arm64: dts: qcom: sc7280: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:03 +0530
Message-ID: <20260522195009.2961022-13-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a10b48b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Hh5InDi0tDfhh6u64JkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: UXd0YYT0H_Vj7Ls6FEtg43x43rOmNSZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX9A07md4qshyW
 Gp4/GTmDz6uwQYl4zYDC026pY2X33aQ8mAWIILtR75RuB1VjKbHMUGytA+7ed5JTzEPfMx1tQb8
 OJpHFdZBYOFCxNpnzHZ4xaiP5H5kvT1R1w9psrGVd/nAE6+Bnz/HDFfm05uyqGCxE0XazneoXV8
 NUqDh0qqFMtnaZceOVO8Yc/xk80MuSurGCUyHuyLOYiu5zZuLhHxtg1TjW9VjqqXtMsaHEjxOZR
 kCIg5jbfPGzavnx7EB0Q8cPhB2FRZ0hpJr/vWjTqJAFZSOlQ1H7ARa+1YfUUm3rn5OdZOL5ob+N
 o9Fy/IjK9hJAl/x7h6uC1Snz/cA1y1ihv12aQfsXEoee9IUptnUAof62m4PnicIByn4WzfjcUy0
 X5+3YIWT11TKzmuQWQOiVAPtaWLdzPKItsbjQuR19NVyuL4rZfa/pJnY43zANzc28u7ePYrbjB4
 tXlJzHqOR6EzyaeGZgQ==
X-Proofpoint-ORIG-GUID: UXd0YYT0H_Vj7Ls6FEtg43x43rOmNSZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109412-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1c:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,146a5000:email,0.0.11.184:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.986];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 530EF5B9C4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c51beada8c7d..6a6560a3758a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -720,6 +720,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-sc7280", "qcom,scm";
 			qcom,dload-mode = <&tcsr_2 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -6694,6 +6695,10 @@ sram@146a5000 {
 
 			ranges = <0 0 0x146a5000 0x6000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@3000 {
 				reg = <0x3000 0x2000>;
 			};
-- 
2.53.0


