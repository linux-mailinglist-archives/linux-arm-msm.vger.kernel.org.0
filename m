Return-Path: <linux-arm-msm+bounces-95743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Hw9IgibqmmbUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:14:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C9321DB4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6B4A3034A0E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881A226E6F3;
	Fri,  6 Mar 2026 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SO2YDjVH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T21v/xvT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86D33B6CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788452; cv=none; b=uTuxCsgPwjcrbtlmi9WdHBNWbF9Yu3B9ccyGbAxLXavHAM+1wujkowHjOA4oSqJ3fd2r6gGgbRWqcUnkLnvUow1G8pq+lt7fe0/FFl6hkq0QIPhbORZUbKqlCj3nzuCMWSyvzKCI9zomQv3qxEVmGdp08p3TQpFXRYwu71vYuHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788452; c=relaxed/simple;
	bh=uWu9jIBwX829aGDTef07/6Q/TFFzpbhM2ciDeQWkElA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H0mMD6c3ihoPXGvkixG7tr2kvHHSzTEbJB6ceYmI/Zy5GQNtCGre+YrMKfWwbexuhsybO+dHfmOhWB/yxjCdeWXLVbGaRShgGSaKxpTtlXbyLuyEoZc2Bi13etcIGw7lDs7oZDAREhWHKh9TEEh2tQF4emUCXUiB+3QN+JV94TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SO2YDjVH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T21v/xvT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aWWk2483085
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 09:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hjowCjXGIsH
	C4zVtpmF9MuQz/xIMztOUoGVJOyajdTM=; b=SO2YDjVHohrEwp7jRjU30WVxuCX
	Fxa4qrky9g67J6C3EbH/rKbUufytnuaYrA4SIuIdKa0Xzk92Aj9x5cwwYOUOZh57
	A6YqB37RhtQ4xKeWw+YpCTPP6vCYgYvakJGoIDbyNUg2AXO6Z0uGbC/+Nh0j9H+n
	L6aWYFa2iemTBCcT8CDtIRCB5nq8xxDilnq7JABwGVUUuqqIv3ozYBdsE5bgbwJB
	jt68L9SqgtMDxjliTifdq5NLU0rsesu7Hme15mAGhzgAMdRedVdfBndr01fljnI9
	E42BqwbBM+SGNmmkDrHBb9N6zoasJn243Ala68HAI15uixsQVTidRtg/aXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84wc1qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:14:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4a6bb316so57344815ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772788449; x=1773393249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjowCjXGIsHC4zVtpmF9MuQz/xIMztOUoGVJOyajdTM=;
        b=T21v/xvTXR/SRhVtqXOQXRHVRshqr8NrylLmMUpV/nY7hv6SkWdRFgH6xkHKA3/rTR
         Q5uARKJWwQ2disPLTZUGqFeK1k5bOJLPyNct1QSuoYV/PH+rcXOlrch7LfI7J8kn7qDa
         fqFqQb7/h+8cmnkHQEdXdHTu6EiISU7ebdalpkPvuE2RwnF6MUI+T9M01lSN7qxIOyFy
         TX2dx4lamurGDdq+s5LoIGCvpn70o87UtLx4vOPZLBdPmpJ07QKH2N7jygivPq3I6RDc
         LzWve+FtP1zbpGx0s5MAoJEmyX5AhBgUYrzuEA2DetjarcwrV1RJ3LmTSj/I1LXfx2Qx
         ZC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772788449; x=1773393249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjowCjXGIsHC4zVtpmF9MuQz/xIMztOUoGVJOyajdTM=;
        b=OkNjN3ZSms6t8laycQwncXi5u6jyIxwxeye9cAon+nL8HzZMM8BvvXc3jh7rX/AtW6
         zKbj5CAHF9Ir6nHNH+No+NMHapFmB+8uGBe4OO11+PWwk1KMJxErmkqM+iaTHdYhx7KQ
         LFFWzZCsO3JUiKMx0sE57lpGUv/PTJhWeVMo4T0MfbPy0vXHZdziXtyPYZOE2IcgJcYc
         ts63oJWC+77ktXHV+3nSwgyAs7eLDCin9V/TDwFbOTxiHyA5/jVkIz3/VsYC39tE3EV8
         aSX9AjGLuR4l+rtuHnq/U5+vf3Quca2U/Dn6HguUgluin2y+6t0YXKvE0vTz01UjhlA0
         DNTg==
X-Gm-Message-State: AOJu0YyfPyafCowbd+IvAvp5/Fb6ihYhGQiE8uEz/F0n+SZujHVJqZcM
	4h3rDels9tz4/q++kdr5NweBsyTLq8PL0Xd2KvoULCiZzbSyRzvgAWrDBZY1th2D+NQn6scZ5K5
	6J0gcKV57OFBD3DTZZjKiNcBzH7WQBeagaNq+Ej4sckKJTudPgGQB4Jn7gmBvbv84ERWD
X-Gm-Gg: ATEYQzx4WoUgl77sRUvHN/9/UhjVPhVttDn2o6ym4tgv8B3gQxgeHgRO9MQkG9roHB6
	k4tZCf467jJ4RZCES2eBTfASq/ltAqNz8fuMBRmkQNgu0nL5QbHVrb5YwA3f3HzIXNMSoEst3zk
	3JfJ/ukso01vkpsI6gcBk0H5FtCCQvw9/C8NfII236LuzqymEJCcl4FnVy/Fb5yp17C43Pwg6xe
	PUSorO8PqnsRMWGrVwwMH1zHJYmqDxfkG5rfcaYREVG2Ou8KsiJJlRI/Dc04+UoHRF+a4MAr7HT
	tSFkCp5ErqmJEpOI+p1m+x671zNxC6x6+l6yk4/I+9JhHTGBx0WMJjuo7stQsvW+YHOFJTW8kVr
	liq2a6dMdmp88JoyVoz9V16Klz+MPE8WYFnEEQZV9A3PmKk+bA9Yd7Rg=
X-Received: by 2002:a05:6a21:4603:b0:395:ce56:4448 with SMTP id adf61e73a8af0-39858fdb472mr1792741637.25.1772788448840;
        Fri, 06 Mar 2026 01:14:08 -0800 (PST)
X-Received: by 2002:a05:6a21:4603:b0:395:ce56:4448 with SMTP id adf61e73a8af0-39858fdb472mr1792708637.25.1772788448355;
        Fri, 06 Mar 2026 01:14:08 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48647e8sm1169360b3a.33.2026.03.06.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:14:07 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 1/4] arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for Lemans EVK
Date: Fri,  6 Mar 2026 14:43:52 +0530
Message-Id: <20260306091355.1178333-2-swati.agarwal@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RYJUI9E32NdgLqYAaP91HkEsmqdFxj-Z
X-Proofpoint-GUID: RYJUI9E32NdgLqYAaP91HkEsmqdFxj-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4NiBTYWx0ZWRfX+bNcWXfCJMte
 8/qk4Ep+LJp1E8Uu5yDdanY1l6D5lcsgDziIwp6vgpmfnzzt7FvEbvX/mkG80EOS+y51d/PmwpE
 98F3nR7pCUjmFLJ0+jmrkP2kk0CHezQnwiB3GhN0nYHe45jEpJRxWvtCPSAeIXd+T677/zOfgbh
 abq9Qu7hKCN7TK0+kx7rSyLiLDMXEcilEm6wkSTj+hYkH9JxLweaCJMSmjqjaH0mLMn7Da8AJPK
 zIBhw+YEubYlpeapGVBMR6JRIcEOzbbrFv4lI1ZefsHuHXtbkSYs/Cqrz8OFV+4Vl7QjxQqP9m+
 WUHOjXoBYTJujESBNRlDJ1+nGGQ+EDrPQiZ5Kbfi+k7oMX9DpLvI8nssbXEFKopuklpi9nl6Yob
 UBnzfL44krXrdEjzQfalLbZpaItgegH++WjIiwWszmcmHn/EUfqVUBzR1ZM4vQaM2lC+/SYk4xZ
 F9EyxIapGVmyIR0/Icw==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69aa9ae2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=bqNqw6pGn9JH-5OicrIA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060086
X-Rspamd-Queue-Id: D2C9321DB4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95743-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.39:email,0.0.0.38:email,qualcomm.com:dkim,qualcomm.com:email,3b:email];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.50:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable PCA9538 expander as interrupt controller on Lemans EVK and configure
the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
internal pull-ups.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..397052394930 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -546,6 +546,11 @@ expander0: gpio@38 {
 		reg = <0x38>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 138 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander0_int>;
+		pinctrl-names = "default";
 	};
 
 	expander1: gpio@39 {
@@ -553,6 +558,11 @@ expander1: gpio@39 {
 		reg = <0x39>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander1_int>;
+		pinctrl-names = "default";
 	};
 
 	expander2: gpio@3a {
@@ -560,6 +570,11 @@ expander2: gpio@3a {
 		reg = <0x3a>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 139 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander2_int>;
+		pinctrl-names = "default";
 	};
 
 	expander3: gpio@3b {
@@ -567,6 +582,11 @@ expander3: gpio@3b {
 		reg = <0x3b>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander3_int>;
+		pinctrl-names = "default";
 	};
 
 	eeprom@50 {
@@ -804,6 +824,30 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	expander0_int: expander0-int-state {
+		pins = "gpio138";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander1_int: expander1-int-state {
+		pins = "gpio19";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander2_int: expander2-int-state {
+		pins = "gpio139";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander3_int: expander3-int-state {
+		pins = "gpio39";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		clkreq-pins {
 			pins = "gpio1";
-- 
2.34.1


