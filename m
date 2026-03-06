Return-Path: <linux-arm-msm+bounces-95745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ei9HGSbqmmbUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:16:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AE221DBFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4120F304F496
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBC533A9F5;
	Fri,  6 Mar 2026 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="of9LiR/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gpv3EUhL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D1333B6D8
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788462; cv=none; b=bWCqPoyrdHArYl6MQYF7P81uUgNQAgpb8gAbkb3FhP52+pmA7Fa6fc0FzyaQQHIKKN1D2fqfjN4LhZAobTml+dGsUjIY4w1ZgnZmd898kELzPhj8zRoUMyHMNxFjxr4tnmXz29QyTOkd/arPMFTQ0UcIF0eJ+IoHaqbgQJM7J5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788462; c=relaxed/simple;
	bh=HZwFUQOQ6A7aTZLiMxZmYJR9QvaqliTJcqwhopazxpY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oXwqUX3yoX0arf9HDpERnWe/q5Fhgmj6OXdbWO3v5gJYsO5mHvplBF8f0zoYgPb4u68ckXL67zZHjACadRxZBW7Q96+ZegZJrma02hbUVT2/RAH9TTLc0AzkVj8U+nQmtciihn68kn0OuuHGaLn2SENsIlpbD/kGGg5IPKQmwOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=of9LiR/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gpv3EUhL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aOtm2327756
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Kl1wLQ1uXk
	gLFLhB/id2ti0lzPAVGQK+jUBMyUiT1o=; b=of9LiR/P9vCJ7iuFCfQiNChKBVN
	0eM5JeG74Vu2GYpvazXz+lzulO+kDQHcDR8H7oi9kMGO98rE5Mn9TXmsENhkAwTw
	DhiHSyK3R6bG6RbuZ/204vn9aKjjXNbofVDG3MW2fUqxnJX6VQiaCVoYUgUQSKUo
	w7M1OikhpiwkQKzUyCnuHc1bBu2bvaHyuJmaIQNP0RNPvhHOPZa5/+5dv0yQgmk/
	rBDflsc8C04hZf1EN9VRCdi3dzo/dxbEpCbUQC/auiA3L0Stxwg7Je9BWRoRTNK6
	+DeUamwpZI+CMpEPt+Ph4MhQ1n3p3B0SIwvmUysMApEKmjTV0ANSVZ6o4VA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09tecj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:14:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82984468f85so1006501b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772788460; x=1773393260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Kl1wLQ1uXkgLFLhB/id2ti0lzPAVGQK+jUBMyUiT1o=;
        b=Gpv3EUhLIrve+uAmghwWUo/sJWJat25DIniqh8huRvR7LDZiKu9gYHSMoFSiqSWzsF
         dJcE7N9I5YdIcNdlzylTJurqvnFRQDGOPF3wC4iMOHYlG1i9utbXEFwTgk9gsOtOXaIE
         Dm3DT1j73pPiS230zoaq0R0pXFK6fppA6CR4xAefHx4XBj5TttwGJCZJ/PasKaaScLRH
         LmCFdfEysgQTSE6GVcUTnL6P1s1Gr9CtaaZh6Il8ZS6cxsIg3BHjAO/Aawoa9RLlBGro
         u6tyubRNZ9w5oJARiNlgosFu7xofcWetMZcvQoSTNAqFHbqKwbGVOlSmn78hSFMGLjER
         c7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788460; x=1773393260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Kl1wLQ1uXkgLFLhB/id2ti0lzPAVGQK+jUBMyUiT1o=;
        b=cN6N9kaFazyHZ/eVd7IvyIL3N1tMAmvkZdzUaU9bdpu9UE6QrdKEv3Jr5+vzk0MTfB
         yT2ic6YifrPboPoI5vzbaqqC6UJ4/5WZVW8SACka/GJ/xwT1kvJBOOZDV2EhLqSdBfmm
         aQjiuj14FuDNJmlmv5OmG+2SiVfIzkaNUlRDP66MVwCOkny7Q7uXEFDDp444fEKwPK47
         XVJf3fScZoy+4UuwuziyB7/F7rFZNd0v7J28h9wuPYjsC5uS9L26SjarEAttQN++VYXe
         BR4mTMaR478YbQtLsUKqOI+Exd1VQ1ey66Fj2afzjkQb/sOYYg+BXir4Bcgb1Lx4KT8v
         H6Gg==
X-Gm-Message-State: AOJu0Yx8dRpEHDPJmGtu2G9l9ww8GPSXS3dnw6Cncp5q5SElJ5IqKy12
	0UgztEiELX+xxKe9cEvaIyEJfpTTaCaTA0k9TctTQJbf5L0dtwg8xaDiD+0n53RXq3x/deGg2cI
	2ShqB6oVINKPJF1vPHoL2Vrlfqi0rrTdp9CI861KDS2xV2o0yrCppFlPhXONt09UQHuY+zXuf90
	G9
X-Gm-Gg: ATEYQzwM7vNNEiR9mUW/5mrYpuOIWvFNSy4Seyp4HRC7o7PkLEG2lJO6y3T6Z5R1ejv
	HRRYCfo/UzexcQ5iwla9NhnSh1fpQHgqzXY13Hfk5cGHvA/KFpJfXHVNZbrfCQCXOEFyWFNxNjX
	Dr0hVSg06mbQtAcD8vFUmRMw7hWt+wGcE0RCiX7v5DBM7AlhfM+GcfqMGV27YjPxqclatj6ds9I
	BwNrGkz9Z3soH3ykevqrVSyR27UjC3ut5phONVO3ofGxdr4ktz2Ww+p4JiVImFBgFv6jl+kebD4
	ohbON4XbjU+9ptMPcUXlljGqnHcU/5w/3uYqNNWGAt6XxGg8F9LJoSUcXl4rA5yNUEa9E++ltBU
	Wd++RGxAppwAWjJk3GhfCzW+uhkEEfOyq1wyKhs0YwF8/VBl2Lxh+cDM=
X-Received: by 2002:a05:6a00:3d13:b0:829:73f4:6ff with SMTP id d2e1a72fcca58-829a2f428ddmr1397270b3a.37.1772788459674;
        Fri, 06 Mar 2026 01:14:19 -0800 (PST)
X-Received: by 2002:a05:6a00:3d13:b0:829:73f4:6ff with SMTP id d2e1a72fcca58-829a2f428ddmr1397253b3a.37.1772788459227;
        Fri, 06 Mar 2026 01:14:19 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48647e8sm1169360b3a.33.2026.03.06.01.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:14:18 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 3/4] arm64: dts: qcom: lemans: Add role-switch support and HS endpoint for tertiary USB controller
Date: Fri,  6 Mar 2026 14:43:54 +0530
Message-Id: <20260306091355.1178333-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com>
References: <20260306091355.1178333-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xF36KpkoJj4wuem5gEUbgd7AnteP9tr0
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aa9aec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZrvUoS1E-TgtW8Atug8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: xF36KpkoJj4wuem5gEUbgd7AnteP9tr0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NiBTYWx0ZWRfX2CKcpzRsMxiJ
 w3ESrgiNIdlP9WY2he8dChMN914k+RFquXsj0uzDrNAQubC732YubkNCqB3agCCk09Vd2hnhz/i
 tn4Tb4Ql1vtAMKDW/QE27jvP0KZccaTi67p7mnF6gg9B31pDSxHyoV/F/BOIH/5cLHcG0NmIBPy
 YCI6GcPi93SIQZN3EMeSb2CV7A7UeAlp4IFBcuUH0xBTOgPwWAHaHxGFFAmBpcCoI2AWYoMGaAG
 pB4Crk/WeVRyx9LKhibwRncZd3GfMoPqmW+0is5baQVyRaN6zWLMZjGG7thakNuh4LerlRSnb+7
 KBKENOtQco0k3husb6V4xZiTKHvOY69P+tVAi2xVVoh9ycj209rsiVMuxFM801EE6HuITZrEJso
 9JRalfCNTo+YDDGwoCqYiz77p3Kn9v7rnXD7UE6SbMLdTU8Nb2QOCG4lby1nTzun5+61WGGL6MY
 q2CQuB0YfQWSQ83uOCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060086
X-Rspamd-Queue-Id: C7AE221DBFB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95745-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,a400000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1f40000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable usb-role-switch for the tertiary USB controller on Lemans.

Additionally, add a port node with an HS endpoint so the controller can be
linked through the DT graph to the corresponding connector.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..d0e63336be6b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.34.1


