Return-Path: <linux-arm-msm+bounces-98317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBdAO2glumk3SAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:09:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C52B5B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C507330DAA3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 04:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411B633D51F;
	Wed, 18 Mar 2026 04:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6ElmWlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTyEEP+D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C6725C80E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806843; cv=none; b=mMTnk5nIHfGik5OeWBYbOUvOs5BP5LHXvwCRjVHnz2qXuGv/hf/6zq8bw/81P0rAbcV9F9wBbL4xel6+T2VzzCViqr+R5MPo6G99y5J4ru5PlwjUjGRbqjexV/VQZDjdxfFhF0wJlcau7IkAKf6aDuH5lo0cDYTphlqHr9QVTlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806843; c=relaxed/simple;
	bh=3UXMGbI8WON5H1T63QkkNnMrXoZ3C5K4RVu3prv1os4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q4QD0VZnwmiy+2ZyfQ5HFr5IA/piA4YCBMG42xvuPaElN0CpithEu5aEYkb+KOb5FtnmJhlu1LM5uUdmLHt6GdIz/9O+fyNCPZ+v44VY7bTntOfhcGC7g+X3CFWA3P7GRd6eRlYsTj/B8We22b11kBF4IXLPEiUfdZI3Hd5f8gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6ElmWlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTyEEP+D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3O7QT932154
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PXXpBOuSHJv
	aASkuV/7Lh3OvDiKIdpCO2MCERf7B6gg=; b=Z6ElmWlCvF4iAT1FTv4cPPgGX9A
	iEfDyu0+vNBgWS9ntgXTup/1/z5zG2mRpM/9PqQtJO69fDU7sVMZmedGCs5L9U+b
	kTxIV0QrdZuehiXod+l5IBrm+veYwFusb9AHC/fVOb3NiPjetVxrx2r2aWYlZ/g3
	ic3/l15EMxa7HBVhaEOZdxKAfwglJNWDkaH1hZcYEyb6GENbM0vqyhALhR1uJk6E
	TPOnAF44DnY0/23LHn0c4V3tCjruT0/U46qJd5xrLtlOi/0FBq1wxncV/GdWVkK7
	yjEhpF/K/w7iW6D9lSwQ91yvu3IUP4qiSbeVT3nxV4mMhUWWXanDOZjFuVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy9jr2pcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b06c242a34so57932525ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 21:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806840; x=1774411640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXXpBOuSHJvaASkuV/7Lh3OvDiKIdpCO2MCERf7B6gg=;
        b=aTyEEP+DQkGGvN+L7Ls6d+qnmOC6Zo2Ts4VSMYNZayi4XubDi2X0EIrRGB9qQe5k8x
         EfiRfVZ20ddFFnPOwi/TfAFXO1ZZCyYOY8X74qNuE2wMjmCSsMo6gFG7DfnwhwTQfQx/
         ZaIaZ98ohHrAZX8c+P7IQEK/gKUW+h6tXeIA29dv5UFWdU3YRND6jn0Oi2Mkatdh6KIp
         sySb8yN0RokmlqbkX0ISwrm8DnJxVDmb3qe1NdH3J6AAF6f5kh6xxG6o+JtSzon7K1WX
         jLF3h3xL278aLDPXWzP8lK9QEXJeB83MEd93gsYnlHBGvt/oQmiL5ZE0AwhESjvp27wu
         2Hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806840; x=1774411640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PXXpBOuSHJvaASkuV/7Lh3OvDiKIdpCO2MCERf7B6gg=;
        b=tQ5igx6CoZ6dHtePVjPiwu2UZjFbbKv3c5OHVJJlQiZx6d2YZnQ6QLA4CIQTWof3Ge
         w6Yt389sbnk/aCcYbFoBTIJZ96Qm9Th57FC4ErazKavIqaL4yJMoK0s+xnxzO0wHUYz9
         IZBR78KYoIQs3b1/ShJh9rcnAW4lNnF/Vmi9mht0mQuBWEERmlG0lCNiXPgZEdGu1oiX
         ecDX7kiQXlgTaHbbKnziY4ptUwb+Dmw4fRPRHVVyyYq0KWNDIMSgfj56sRZBNdBUco0k
         6u/zY0fKPqms5ubv4XXZbejNZd+7kG4lr+FUg+TygutqrtwwfVNh5WWyYybghHaDHaSk
         qGBA==
X-Forwarded-Encrypted: i=1; AJvYcCUVlpsVPiPwJw71mHmG0hnKrQxyN521eWVEltF05dK/0OuDTKxKpRapaW73p7ILx0+s38dC10z2XSM4nRtB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/CH6KQVBQi+lkK6l0yp9kKJ1DLGBVpioDbJsM0gkLRG7OvFAC
	cI/UTWtrf28JSlLcpo5nBlKGM7aqsnIH/c6k+yS3RqslEpMy1uEwQvWtzvHWnJFnqvyK0mnvt2A
	TvtpIU3KhZXH5wFxqX+71qKFbxQ7MoqRxyoKXMGX4WreK6wBLTPJWV28TuTc1JvDHD6cb
X-Gm-Gg: ATEYQzzCpZaV74OHVNxXA6rBaiMKgglU/iI/AkdoiYrI0YwJ9w9FKkt40TpKbKpf9yq
	dXA1jkkuHa5rhYOFYfWxhAs/MpI4gtJ4wil2Wl0UpVcAInelrG7gJe9ifB6eRZI5y02l5QyUcsf
	ifmYrciN5s9hl2WuePakWkXuLb01qKliK+swqAWy16j4LG6k92A1huA4KDBfJchMjLLzo1+GniE
	G6B0mTwfxGihlhlLlkj/KBhr0tR0h/XqRxCrVzR2aFsMKbeSAB05R/Pa5pRqIkKqujkzrWGkiZR
	yLVpCejjtmGJuvnxfy73eWLs9Km+M9t66Rm+9HiKGVEBfTuVC2Sfzha5wZTkkMnRbJ2AdMQ2MLP
	IysQhw9re5oHnrvxlh4UfHwbR5AmLGibloQVuSqSLEXoFsWbuGBsX+GY=
X-Received: by 2002:a17:902:db01:b0:2ae:ce8a:9dc5 with SMTP id d9443c01a7336-2b06e339e4emr21551955ad.13.1773806839824;
        Tue, 17 Mar 2026 21:07:19 -0700 (PDT)
X-Received: by 2002:a17:902:db01:b0:2ae:ce8a:9dc5 with SMTP id d9443c01a7336-2b06e339e4emr21551655ad.13.1773806839362;
        Tue, 17 Mar 2026 21:07:19 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f12cesm10243425ad.41.2026.03.17.21.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:07:18 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 3/4] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Wed, 18 Mar 2026 09:36:43 +0530
Message-Id: <20260318040644.3591478-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AzPUn6EGVPAXTwIxWzmkCn4QWk_WYSEJ
X-Proofpoint-ORIG-GUID: AzPUn6EGVPAXTwIxWzmkCn4QWk_WYSEJ
X-Authority-Analysis: v=2.4 cv=NdjrFmD4 c=1 sm=1 tr=0 ts=69ba24f8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=917_i3xC6rPZgS4eXuUA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX6dDfDmK8n3+p
 W9sSc1qjaQ7ZhUam0Q7MsuAhbyclHQofh/oWBWxIjUkwQtGvcd+OD9LkWW58+pR4fdwiuo6HoVQ
 L5Jzn+flVpZrM9eUG3IrghM1aoTP2R678ajiLPrqiTN0Tcn7bclFw3/fwtA8axu9b5KffTG7mXa
 VhxAq+FMe2j6YSgQ1GP31tLeYriTiVdmsamqdLSwVbB5LIfbQQXhZ2fu++d4qnZE6vbFcHbdZws
 atP4BKZL9g59IQCFq/HpI3uorxVOv+wyI9h4HC+UthvELxS8oOr0m8XcU6SZ9+6XOmiKlk/r0Hs
 i+C0YekcFGXzGQyHid01ZVmILIXGKY1cRiiJKcJ3IOlCck+6hpfd4AuTp9F9VpFXDPF3onwkHgJ
 qCSw9eymIA9U/PpJ5Dv+FjBRyULLzLQSy9J4RE1IOTsdKdiyl7XfKW/IkDWq1NRqNx7Riy4Cej7
 7c4iSo2k6KU+5merEXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98317-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.0.0.1:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 513C52B5B4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename the hd3ss3220_ instance to improve clarity and simplify usage when
adding a secondary port controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a1ef4eba2a20..2d7eace9d7ac 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -62,7 +62,7 @@ port@1 {
 				reg = <1>;
 
 				usb0_con_ss_ep: endpoint {
-					remote-endpoint = <&hd3ss3220_in_ep>;
+					remote-endpoint = <&hd3ss3220_0_in_ep>;
 				};
 			};
 		};
@@ -550,7 +550,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				hd3ss3220_in_ep: endpoint {
+				hd3ss3220_0_in_ep: endpoint {
 					remote-endpoint = <&usb0_con_ss_ep>;
 				};
 			};
@@ -558,7 +558,7 @@ hd3ss3220_in_ep: endpoint {
 			port@1 {
 				reg = <1>;
 
-				hd3ss3220_out_ep: endpoint {
+				hd3ss3220_0_out_ep: endpoint {
 					remote-endpoint = <&usb_0_dwc3_ss>;
 				};
 			};
@@ -984,7 +984,7 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_dwc3_ss {
-	remote-endpoint = <&hd3ss3220_out_ep>;
+	remote-endpoint = <&hd3ss3220_0_out_ep>;
 };
 
 &usb_0_hsphy {
-- 
2.34.1


