Return-Path: <linux-arm-msm+bounces-89899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBhGD/UJcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:04:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2FA4D749
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD757B241DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A993E8C5F;
	Tue, 20 Jan 2026 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5kE6Mst";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hD/s240w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9013E8C61
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946801; cv=none; b=r3i49n1Gxhms9DvGK3E3RIw0I0B4L3HaVKSw18lbuJ9ERYFbWnHZKp6MRdYdrHQfkwN+eyl6nSg4dm2JWI2lX1A5AgZRcipMKYwyeMRI80f9TFyLYi8f/3/bdTdjUM1qrYox65prAGQXZMC6yZB0+fas1TYHy/BoSdINFw5meW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946801; c=relaxed/simple;
	bh=AKSStHYj/56WCEiNwPTFvx5XIZ7xG2iSK6sTFBQVCkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OEcwr0bral6ur72wmSkRHGMedhJ7xJuoYU/XZHFIfyKrGtRkMvwK5/bcEa8ix3MYvPmG+hh2OuPEnU+T79aOhv2uX0mjcClEPmG4ErWIRBQ8udbPziG1XjQ5gjbEAU822aqcbnK9m56JRLzN1+15Y6VftgKCF9NCvlTrhMaaI7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5kE6Mst; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hD/s240w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KH58e13256429
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ao5MxgRFD8rkEGcXPs8DuTKugl75L7IlT1qpaV8lLo=; b=b5kE6MstogF+i6ik
	sCNyL4aWh8+VUWGk2mdkXAmf9W6ZEeTEJresDjFSleS+TPqj8A4PDmMEhUyKxM99
	pZ/nt60w+0RMla/JaPh83KMqQyLyO5oTMzeunoNa5OcNSQhKaneePaNSbCPRfV8K
	MPpS9ack+2hrlYm09ieeioGFlU/cuU+y2DJsEITBcKY4Qrx+0CkbOD2chQFlA0UV
	SnKzh6O3Sl7tRzqyTqsqEVOB4seE4vkXnxXIWEyGZYynoPmqsUFbChv4mVqNS5N9
	oatwd/7XB84lDq0npniLmvwBqME/W+r438KP+TwrY66RAI5Nq8vcGX8iVjqy0FKA
	nsukkA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt6u7tfj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:06:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81e6ec1da28so4547152b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768946796; x=1769551596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ao5MxgRFD8rkEGcXPs8DuTKugl75L7IlT1qpaV8lLo=;
        b=hD/s240wsQQboGWlgPGfKvBs+yFYTqD1ChJ5dwBT2D7h9IyFU7qWa/P8AnTuUB9xMc
         flRgn2XwsclJ2Wi74/5UNcV+Ed259InYAIhE7Pzb8E/bYQRW38duK5A6LPngV7h1zLnE
         w80jtmAjV0VyX27KcA+WYxYWTf3FGhqTiZ4HTyQxdlKr/8mYpYabnbGwzVA70SSdECMW
         SN15iKPud2B9asXMM79P9dFS2whL/6Mdi9YkrBH50m1pxdqKwc4R8nJaht/Ewb4ECo87
         c+IXISHUvmFPZ23qlOFvzca3FCDngYpb7fKTBrbnKRhqnqbZSfOT7WAcr5T7QNzhfu24
         H8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946796; x=1769551596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ao5MxgRFD8rkEGcXPs8DuTKugl75L7IlT1qpaV8lLo=;
        b=Al7X1xhhoVOL3YAnqtN8LJC69Iw6ZlHKdGfi+vK4bbx9qXBy0+1JlPvOQNxgLp4hOx
         fWSYnQY1/JEC0ZRR6+iJELulBeXjGLoj4LUdmcYriK1MW4DEJ4N3QNi1MTiq4FLqc3Vs
         X1q9W7iK1STwxj7OY4pUWpLMkJAbfDPxDjksYD4BUyrYG8YFqs1zmsHmI03Ll0ZKXisi
         xcXX3gLrEXvsFrUxWDajWbD86GPGAzwmELpN739uGSuySa1v7dSHx8DOnfxZOoUMidyG
         Y7VD7YE3hjpSc6HZ6L0T9kRsEgSoJskYOsiRuieH1vvtQE54xDs+IQYyGBuU/ZI5dG9G
         gEfA==
X-Forwarded-Encrypted: i=1; AJvYcCWxpgoNQXIZrbRB9zCeE6/trNMjBMZAs2oK4PELG8Quq6NsZRtOKKN9H2CA6cuoLFZJy3Zf7nSlboULTv0Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx909dLL2WsF0Yv9KhEDln7joDl1Ct2jCbetP6Mqz+wV6Uexzxk
	EqxhxsexFCJAFFA2wU10HQY/rOM4GOgwT59jKV/6ZXcn0gq62s99ehciWJbjASWWy96G6VD5A8U
	W6PpbOjZRnVd5pfqNUU7PdrpOxbnyDUqfIn7h1lPCSfNnZTb1wVHxmOwcFSqkE9kjXIEF
X-Gm-Gg: AZuq6aIdWGU9kr3dr9SmhGL+qYALyeiax2Cs9f2dCcSP/oHggsR9yDcndOm9Uc/AnAo
	NCMt2NgAnoDvuKv+jAotFP53T+DdcNvchXwXSfRwynZeLNE494gga1rX5IYbuVNFWTY//F1sZWR
	HGix7hdqfKFStczwaXGWEOxQsk9vpu0ErN4uTFgKydoYSbR2qhbKsv0HZgRG8tzsOGbKA3cLJAU
	bx+69JQQYf8nyg8K47LP6lsKBCpmaYGYlGWKrZAqLGg2JGTjVZF0sWZicVt/QI/ShyCYrii3lN8
	gonME0U5ypvtocLfIzlLdo0/DObzTYJOD4c7G36X+fsIfXF2QRmZMGCXDIkpHMCg52bIJuYarbl
	7Hw2E8hfNl1NSa/BOD90mPpeM781G7WL06Q==
X-Received: by 2002:a05:6a00:94f2:b0:81f:42ba:2005 with SMTP id d2e1a72fcca58-81fa1780f3dmr15165354b3a.6.1768946795646;
        Tue, 20 Jan 2026 14:06:35 -0800 (PST)
X-Received: by 2002:a05:6a00:94f2:b0:81f:42ba:2005 with SMTP id d2e1a72fcca58-81fa1780f3dmr15165316b3a.6.1768946795141;
        Tue, 20 Jan 2026 14:06:35 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b30f0sm12867088b3a.61.2026.01.20.14.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:06:34 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 03:35:54 +0530
Subject: [PATCH v7 3/4] arm64: dts: qcom: talos: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260121-qcs615-spin-2-v7-3-52419b263e92@oss.qualcomm.com>
References: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
In-Reply-To: <20260121-qcs615-spin-2-v7-0-52419b263e92@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768946765; l=1569;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=mm7OH7DhhrPoewx3F6eoJTJC7J5WYhKTe1PwFwcJBsw=;
 b=5fwB6EOc/g1yYfdTpwYze7kGYW957kHbnrYS3S3ykB/kHpdWwf/o35z39XJb+7D8hbMK6eXey
 EsiZjW1+ReTBGU6dUXnnQKbIMOBIJZ7EHnSoZUVsiSMd6ujROnZ0zaf
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=P/w3RyAu c=1 sm=1 tr=0 ts=696ffc6c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX5S6+n2RUM8Bt
 1qQqpnCBdrAggp2QLt8AC4ac75mkJNDhrtqLJT6Ss+iGA1HYekUk3se/W5aSaxjPT7vdIJ2ZJ06
 nc9DTp7qyuf8FeL09IwbWfFaZBvbJj2vbijTGkaozzG4rgCKj2FDiM2fcAmvndmSokqp5BDKZ6F
 gyaqOUXeZJYZg1RpoWUheenqzQCOcdOCMn8RLG2R8PY64TGmh3KTcRgOJJiNlZYZOcLcCDf3RLs
 AehVq7LfeugswLZ2bKJIjByPBdabszRcKg2k9xace+cEvhcs+IDOXYausrEV6AGRujdxQslrpnE
 SpS1tPFFoGpk8LwIfP2LQTZ91AYFEAviyDNxRN7Gt54wYyuhVFuOYoZu+RWwukVy81QN1l5776i
 s0vXylORtl0ehNOzIgejZ1f3vqfVb2eBo15ReCZPGJO0BeVWehET7KtN05kuPaHNzpPloS1zl/K
 55BcxZPfij1N9gbmvkg==
X-Proofpoint-ORIG-GUID: hSDGMknAyp_ESGN-WWYvM-Ec_hhbR_-W
X-Proofpoint-GUID: hSDGMknAyp_ESGN-WWYvM-Ec_hhbR_-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-89899-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD2FA4D749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index b51a8f173e1c89e75be2f999ff96fb63247accfc..5f66c058555ea12d7c3a12c471aa02764be160ac 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4968,12 +4969,25 @@ gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		q6-hvx-thermal {

-- 
2.51.0


