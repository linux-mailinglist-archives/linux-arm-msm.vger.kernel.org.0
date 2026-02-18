Return-Path: <linux-arm-msm+bounces-93308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +w22ID72lWkmXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:26:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AFF158478
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52D2B305B454
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70308343D74;
	Wed, 18 Feb 2026 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa5XyaV/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxsJFj84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FA33451A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435482; cv=none; b=Z2HYRpgETHRyxSk0bstD0mfMrv+tgMbXueVgsBrGC5PZVzcKmFdcVx2HKAULFP3LYzP9Ql0oBHurJma01kepzaWysRX4sp8ka8GidogxSyjdlXKZb2c3CJTr4LI/SY1sUmgp//5MIfh34MTFT5SEsqbXdcOHbbt4ReZ/2Xm4sUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435482; c=relaxed/simple;
	bh=3L8k3eMn3XrWWztMmzJ2j16nB3XeopCqYWwz8mdTlow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUUR5HQCTSPlJuSJNuZAqsiMi+tHkdm4KnDpK5tIBctXMYOCGcRiqVAP0W4ShBipKehvEy1NY9OdneoOEe4kde9sWw1dXF6kCQTFa9FEQ1X4QczUYH/VmETOmSW4eh3zma/7rj2PGynWrpsuZ2GOEIHXX6KkAV774KyCRZ2ZyWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa5XyaV/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxsJFj84; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IBsKN41029650
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVZN7JZSRhJRjuK5pCIaVcsizkvHO8AAsWLJIf+DiEg=; b=pa5XyaV/veZUeo4R
	G5Z4QRemuoH71ViQpGqUXezGLOjLRAsh3mty6kDUm8If2EwKzxm3XsZMBFJUcPZJ
	0yvTtvyuYdziaDmLd7Hx6yMbF7Gdv2EbXgHGF++Fyh+zWAppZD/s9Xfyd5wa6j0m
	pZ/p3kZzpoGKZQOf4frdFGUdIeAQ59ge97cyb2K0EeccldbzM0pgPQ8ffbadlKqS
	G34ZtPek2dT3RlnTwkRxVQjvVwF+752PX8vWKz6/1sYclwpicggSDG24xA6P1KR7
	Rxf8vNSjB/kq10ZuxCcCpKzIPs+zNk7ZhNEWxH+UKIbF8E0JqeaBPwOuX30t//VV
	yfL/+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd13rtq3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:24:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so57433585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771435478; x=1772040278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVZN7JZSRhJRjuK5pCIaVcsizkvHO8AAsWLJIf+DiEg=;
        b=TxsJFj84XAoL9PD0Gy/fgfHC2hY0zL4Yy8Sp65aRmuBVWFlZnYZ2wV2GhRxYH9uzE2
         BvQPigcmWkpu8UkohhpK9tEzPBlHFEayy90ieXHo74NyhmbkEAZy4ZjhFa54oCOFMOe0
         jsQdF4Frd49Lv0+syirCSlCHaOP2+bQqbXxyKAWu+NoXwKI2iWoprX1HaDfaVQ+pyZ53
         RfumL0batGdU96MgYWfNZjSWPwhoD+LUDEZjpmhFW3shxEH0xWzgHh6gI+YNbl17kv+D
         HSU1IqS3IeDMpY/3/7T+tpOpfXw3mht5AlqrTkPexrZGhkf8Rb1wjIOJmg/wIt1Wyxhr
         NrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771435478; x=1772040278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lVZN7JZSRhJRjuK5pCIaVcsizkvHO8AAsWLJIf+DiEg=;
        b=QZTVjsQbUCcZ0SyyAl1HbR7rLWM6NosN83DOWp/874NdShA+8F79dWV8bk8/o/Uhlc
         hqGp87gDoI80JOvNyFfZsG2r7DL1V7cJPZ9k0VaOoKzRAma/dTieFS0JG0oV9lq00Nq2
         oeXD+om+tS/9O/iLW42r/ym03fxU7+mXzNRIiW8DbJnBiNFPGS9ZrM88+QzHSz2QyUor
         Pf9b10Y6MeUjlEuZ99VKRSgpdNVAJtxDmIx+/ZwZUngN7b+P/6gEqEqon2PgJ4rvVgaR
         bTACGPKqSI7KwH5lpOdr5DPTEABfiuQCnb0yLLQH8t1Yj9VHzlPYzWA53FCuuiWrmKe7
         bOdw==
X-Gm-Message-State: AOJu0YweTu0b7QE3rucnlzqnu1S42jMkyDEn9hsYVaJcF/gKNLptozfD
	5i4Al3dSokB7X0Dy3XBHICbiT31kE78mLp5ajEHb8Hwxb43OJWhxT2dSt9hQVYeKOKuyA7Omvtj
	hr+x4YeU8AfUDzY5VrsQia3v3cpkk5QYTYwyVL4XPAZDtDmLtwmc5RHizo4ZX+E0AXo2y
X-Gm-Gg: AZuq6aIUqOceNdOK7Q5yzW5YI9jwWRBrAmAw8zC8tClJH6i5G0hfxN9ogHY9leYSWDa
	HzR30nSWQ4d32xSgMICdGa8prqoySxRncBZTWnXwIAOBJxftB1C47PYFQG/LIbfyoPb3hCrSXqx
	xaC+CHRDb5iAfIAdMQJdkxuKUrlMJbDaPwVjd/RXGwqbUeD5L9jUrG/NCoEQFIxEBu15I6pByz+
	2bofS6J1aM9R2CahO9f8HT8V8NUAhsK6n+STq1Y3PG1om4QhA/F6FEGEnGEPP8Vp0XtFZ16r445
	1XROwQlpc5pbap2bkHavp9RzC19jVMfvnqpQ6hbcBFufeSMuLXRjTVsyI7opfvZFLNB8n44YTQW
	N7tZ3/eOn2SQfDYTb/eMCuNNj7mrCFnvdYWadXUdoqdQwHQ==
X-Received: by 2002:a05:620a:408f:b0:8ca:2e37:ad08 with SMTP id af79cd13be357-8cb4bf98c7emr1814645785a.34.1771435478401;
        Wed, 18 Feb 2026 09:24:38 -0800 (PST)
X-Received: by 2002:a05:620a:408f:b0:8ca:2e37:ad08 with SMTP id af79cd13be357-8cb4bf98c7emr1814641385a.34.1771435477968;
        Wed, 18 Feb 2026 09:24:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm44181368f8f.32.2026.02.18.09.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:24:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 18:24:26 +0100
Subject: [PATCH 4/5] arm64: dts: qcom: sm8550: Drop redundant VSYNC pin
 state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-qcom-dts-redundant-pins-v1-4-2799b8a4184e@oss.qualcomm.com>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2329;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3L8k3eMn3XrWWztMmzJ2j16nB3XeopCqYWwz8mdTlow=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfXLrO8sYj2avHyf4wuz39VOYGgLmSdLEZUwS
 6vusrHIpRaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZX1ywAKCRDBN2bmhouD
 178zD/9c/vUhuvpULxZpbQv/0jK3Fd7wEva6LY/XH53GL64TCdqavlt7cycBVd8zuiNzD7rgq47
 m7tBIHduMQj7yYoCvuCSToEDK6HqPn5Ep3iN+SuL0dne4XiMzMa+CiGp73xUhY6p20PZk4OvwJW
 HNp/v1mYCo4OVxjHXXOKsOgN2v77/wpaKKFq7gv3FoWeTDUki1Su8s0rBi1BQH7W3Q3rXjgrCtI
 Tu7AKpEqFUvJVH68z1nNKp4O3uYtfdgQVFKIZKawYyMsuN+LiFRNVlnp0ZAGMqT+GRnM1O/gVfs
 h4jWfKMrnwh+j5VNdBppUxpD55nPwzhr6P0RjjgTMM5vHxMi1D3tUWYOl8hYjxoZ0JKO6ph4VTI
 ztqcnRqOXxvzvnfzHZ5+jPrwFTg/0wmcEGbGfc/rjn3W93nv/nxpZ5oroVLXl1Extcs25U9Wdui
 J9OEpALvoj1dGj6XTzaG+u0I46IWUmJAUSln3wkCGoVmXDpIRTzhO8nEMJ006EexB+JyMMPCV7j
 YhYwQbmXLgFF1qECc1aKA0dDwJ3m2fu+E7kznODLRCt07nCkfUvNcPPK66tJjIGFbjf2IDFjX8V
 6ZMnKwsK7p/c97SWtcO4lmycWAVOOeHjP3qQN5BzQjmcIPGsFBVsIr9Jcwonkl+PNPrcQy/W86n
 5wy+Lm9+1AwwgaQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: AXKvlFzlySximuiSegg-bC3h_3vH07Ro
X-Proofpoint-ORIG-GUID: AXKvlFzlySximuiSegg-bC3h_3vH07Ro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0OCBTYWx0ZWRfXyJJzA0dcPgZR
 s9Om3KrVKU4N6oWBB3mQNov3Rp4r1hAnKDFR1NjTiOO97noEXSSNHWpNXDwrp7kVJy6onVK/a4I
 79HEpN93F7MRy5Z5v8fT8R0falt+Sm1SvEkSseeRVzjvovTsqXfCuJ0IepUKXZ6VdGxWe3pI5YK
 5XPCFS7f8NaErIKVTow5s89RPrNF6uUyi+zsEsiO0pOo5WokiEXWoj7dhZTveJUo8Rz2+Euptrb
 F93wIclTha92VST4u0TuEHZtblaIwlc8nXHpSvS515HXQ0OyxSNWMZ83pCXPixKBal3jCbXx0HO
 mscJbj7JfP8oBsOBPZe2qXmFWU9ZB2GwR9vLxTpr+Be0WiVSrbT7zEpXRfrZFvTiZRivzMNsJzF
 bTcnH0Gp8S6IIBCtdkL30in6eQcqQyLj1fYi7I3jfdUzQj3jxCqkLKiexJpwV1QaJP2Yujv3Xie
 DNV/TEINB0q3VX/SelQ==
X-Authority-Analysis: v=2.4 cv=Q8rfIo2a c=1 sm=1 tr=0 ts=6995f5d7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=kV-nSK4kQYlWBrUG9uwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93308-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11AFF158478
X-Rspamd-Action: no action

The active and suspend pin state of VSYNC is exactly the same, so just
use one node for both states.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 13 +++----------
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 13 +++----------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 94ed1c221856..5769be83cfbd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -707,8 +707,8 @@ panel@0 {
 		reg = <0>;
 
 		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
-		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
+		pinctrl-0 = <&sde_dsi_active>, <&sde_te>;
+		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te>;
 
 		vddio-supply = <&vreg_l12b_1p8>;
 		vci-supply = <&vreg_l13b_3p0>;
@@ -915,14 +915,7 @@ sde_dsi_suspend: sde-dsi-suspend-state {
 		bias-pull-down;
 	};
 
-	sde_te_active: sde-te-active-state {
-		pins = "gpio86";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	sde_te_suspend: sde-te-suspend-state {
+	sde_te: sde-te-state {
 		pins = "gpio86";
 		function = "mdp_vsync";
 		drive-strength = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index c35d4737a412..2fb2e0be5e4c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -870,8 +870,8 @@ panel@0 {
 		compatible = "visionox,vtdr6130";
 		reg = <0>;
 
-		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
-		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
+		pinctrl-0 = <&sde_dsi_active>, <&sde_te>;
+		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te>;
 		pinctrl-names = "default", "sleep";
 
 		vci-supply = <&vreg_l13b_3p0>;
@@ -1179,14 +1179,7 @@ sde_dsi_suspend: sde-dsi-suspend-state {
 		bias-pull-down;
 	};
 
-	sde_te_active: sde-te-active-state {
-		pins = "gpio86";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	sde_te_suspend: sde-te-suspend-state {
+	sde_te: sde-te-state {
 		pins = "gpio86";
 		function = "mdp_vsync";
 		drive-strength = <2>;

-- 
2.51.0


