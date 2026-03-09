Return-Path: <linux-arm-msm+bounces-96360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Az/AA4vr2mWPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:35:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2EF240E38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBC2030518E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DBB421EF5;
	Mon,  9 Mar 2026 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbsU/+qv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRvxRUr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979042189D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088435; cv=none; b=swzV+DsqsRpPlzKwNQhp6GXVgJwds9Zgbx9YxUcyibjSmhKpBol/Ohh5G08Ofb2Oag+xw+kbYo+iQPbUbEyU6lXemkAOpe7/nribmcUMnHsKVTCrtG+ecsPHBDwpwf86erXns4AhckQB+Szn8yoZQjwBzmAiKuK+Qe3Iui+Tuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088435; c=relaxed/simple;
	bh=0VJZGhuJkCUeAQcIHJgXxy7OZKjeOwICNMRpVoee1d0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n9P1FlOt9+clhl9brRv+Rr+hVb+dZBLGHKEN/7rKBhzF6CbZEB2sBk2hetcHhuyqhsZn0LZ+J5gazQvmosI28Cq7/QzTei6Fze/gbbBQfY73qDLVK0LUkfi/HGItLXBF+JydM0xrBGe8nkNv+6FNgY0cFSXFaXEEVF3Q5WeTqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbsU/+qv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRvxRUr7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCFnJ1212212
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kDE0gB5xYQL
	YngO7rvczlFLJwy5YaiWj5eLZwnq0DQk=; b=YbsU/+qvILRwve8u8+iW0soNsTR
	Egm1dx1k5gCuLiNfIu8N8Qgow+EZIkLhf4icvrtjGPAmDQHG1IEbg4QqYbBREO3s
	mqKz6iyUFr1P78sKLbYgKimQMGD9a7OBd7+8WxbGAyOHRZmqe8ouOGA810JsFetm
	QT/TE6Q1udq4TLUP3YPMZl3xKcKHQvTq7IQlehwQklb//vutVoNs0NT3KCg9WCVe
	dKph9LzP0AGECqxh3ieNBHL+UMoVGp7ngu7HBZ9k9FpmQF55XmIt9sUdojucPpaF
	80kpy5AN9tzGfOex9qAQO6ncIkzltI1Nji8Tdw/hGnm6Vbwnz7Z00RHzGmg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkhme3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:33:51 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d4d4db1523so54438717a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088431; x=1773693231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDE0gB5xYQLYngO7rvczlFLJwy5YaiWj5eLZwnq0DQk=;
        b=hRvxRUr7NQdTYX6f/xSAzQcfMCqGxnHVXCacFYUF8nAohINORgp0Yiy+1EP8rcjkXv
         287ijsT5dHuCnEheP8omNqkCZsyJUItN0M0U06vkXoioozZE/DYjZd3kRaSvP8HWJHGS
         eKZQXjFWp7oGGDPCYwOKeivH/yJiz6K+DZTqTyFNGrwoVUtqFi8+E+RoxZoigkAb4w4a
         AoczxnxciTnSIeLYZ+W4mmgAB9D9Q/CXIZ4IvjXsRZjJMsfhZ7qTKXs4Z97KqzgE/3f+
         Lw1V0q/iq1mcW7LT3IvRGyOL8+7IKfnmudisTS30f1HM5xyw+Xv8NiZGmOJG/FUQSlZn
         q4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088431; x=1773693231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDE0gB5xYQLYngO7rvczlFLJwy5YaiWj5eLZwnq0DQk=;
        b=fjqjvhYMdsQZ5VhiJvX3OsiSt7Wrg8g2tlY0hFfn8S5r5vrpkCrHj6KgcuiXQWR0RK
         KWNU1VzXV7bpGwCytpSanpwkYXlzAraGxfSId4NrAZ/S+TzgqBrjPSh+Q//2iJz8Duvo
         LVTrBdjAXzrPzL2cS7z/LDoi3IQeZVNn9TeAjXDgCDfWRETBUiR4dKh/ogUF+hjmawuE
         7GIXp7jMPoDDvnEUn6NiETzhNADPH2eok4kk+Lm11TzRTQOF/dr2+2RcFqwiwkC4Rt5E
         ojpY/wVx28BPnrjYJWNCGsLp5j9cddmZNiA84f7pNmlrhYqv/lcy8Ld3iRuo2/bt02SK
         xNiQ==
X-Gm-Message-State: AOJu0Yxz3Px51FYCFKUgdUtjKYCc0K9E/wBgH13B1x3NnVmKWLZUc9b8
	acY0OXDrHC2zfmjYK47h6eCNRcbjri7NUwtC0LwFMpg1Hs73WB6RWK3xqTdrkxbm9FCn7agnjB+
	1iV3ijmazlbsGxT7oR1jI1l/s6oMeEkvlN2jkzNUIWdNfKbZsfIz8bxWFQsDODuT02Q38
X-Gm-Gg: ATEYQzwihEWfCNZAMjD4wpgMVWwXtbnJ1iBXIUFaVWGld4c/KSty/QIY3wI6rKgQxRm
	3jegWdsOT6XRNqA6dyPlebnJ3bAMX6xtuyUVWh33u9vnM3ue7TeerQRa8Q+dw2dpKAjL7xyyuZL
	EQvlmQ4SZw25x4O9aVVFTYH+n90C8cc8sUbWzyKuQ9oo1bfnFG6IUFI0QfHpu5+v6OwyRqrUKXa
	rD4Fi8sBdLdFVLsx6BKk7o6mhXTSTDFTSX2EFjFZoCmez99Mt48p1aQk87+sOjfVtX4pZIMjdSo
	vCnopszlwtWqw3mpUZESZcSxTsivXGf+g35rbcK0XKdeoblSNkLWb4FscA2EPJiksyAjPG3RPhs
	0SKN8asWmfChbxEGTpIJ8aCLrz9V2arWht/BfwhWJbusHrA5vfhmlvRPNvK9+ywsul2scdSqTKs
	Y=
X-Received: by 2002:a05:6830:6185:b0:7d5:17fb:6af6 with SMTP id 46e09a7af769-7d726e754femr7914796a34.2.1773088431225;
        Mon, 09 Mar 2026 13:33:51 -0700 (PDT)
X-Received: by 2002:a05:6830:6185:b0:7d5:17fb:6af6 with SMTP id 46e09a7af769-7d726e754femr7914783a34.2.1773088430855;
        Mon, 09 Mar 2026 13:33:50 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:50 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 09/10] arm64: dts: qcom: kodiak: Fix EUD USB controller connection
Date: Mon,  9 Mar 2026 13:33:36 -0700
Message-Id: <20260309203337.803986-10-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69af2eaf cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=BgTZCx5PUbG0OLn4eFUA:9 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: 7xIcULZZjQYdLyXRoSqd0dcToC-2tx5s
X-Proofpoint-GUID: 7xIcULZZjQYdLyXRoSqd0dcToC-2tx5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX5RZeGawzfkbq
 keMFlN1vFE8/dNQz+qADVXqx7+Uk9P9G/ovNs/vE9FgGBtfw4Xqvgjo7qed9FDV4yF2C78+C/Hm
 cIvL6aIuulJzc2LogWQL+OUcBU2YZwHabaOGfpkIOSrzX4uN7ZwqQDIgx8ckTH7Tnmxxvbyl8Xc
 h7pxK1L4/g9eLRkuCvNsGlfuMQrRwKjCgLLfVEILfA6CXEr4Wzjihh73OI4dFio0BojB5TOP5Fl
 5E2uaPcx/ptNMaBzHoWd1IBZxV4oqHjKbApn/X6BRRORLr1ViNxxYtXOf93TyQqGqsJRm1VkQd6
 QEfCBaUaO6V5RDgnTCLmewc0vE1LYCHNLCVvBNEEDiKfBo5IKIN2w1OqHcTPu34B3rsXp7BoS4M
 5l5S+n9EWnbTrzKJYjGseyKtEtbtmzdjPB3d4w2F5mVnytFOHaDEXEf/NIPTQHXJoC1U76gRYdd
 Z37LGJbiXc9bxEoZSEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 6C2EF240E38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96360-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.1:email,88dc000:email,qualcomm.com:dkim,qualcomm.com:email,8c00000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The EUD node is currently mapped to the secondary USB controller. This
SoC only supports EUD on the primary High-Speed USB path.

Fix the graph connections to properly map EUD to the primary USB
controller. Add an empty connector endpoint for board DTS files to
complete the connection. Also enable EUD so debug is available by
default on this SoC.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..24483ff2d5ce 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4294,12 +4294,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4623,16 +4617,22 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
-			status = "disabled";
-
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
 				port@0 {
 					reg = <0>;
+
 					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					eud_con: endpoint {
 					};
 				};
 			};
@@ -4858,6 +4858,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 
-- 
2.34.1


