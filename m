Return-Path: <linux-arm-msm+bounces-93595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOjGIm36m2l5+gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:57:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF29172737
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32D76302B18A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76AC34BA4B;
	Mon, 23 Feb 2026 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMnOTOg8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0Ka3+wx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2CB349B12
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829817; cv=none; b=LgoycCPGCLVEKBmyd1TL91hq4XB7EnnTAvs5vRjwHfFX2YJed/fAG+CoeSocqMz81yYIb6Tt36jWY6MMzwduX2CLZnZXrC4hnJ9fx1q83nZmOFw/gtgYBllC1y56t6uDGIwEfZUNGNSnm80cyV6WJ0RzZMaLMUbCq3eyBUtC93M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829817; c=relaxed/simple;
	bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c//V7VjvL3pL4n4ZkREhVqW3H1+kMqe1/b5W/aOW1U0zX2Pn+iuejeYtQ9ZVFfdUx6hPyghsI6VN1ZoadwtV6UZXfcR11u/bx/ii80qDZ0Zua3lzmiKCJxawT34KHkLtPAtphZsfLV35bmqKyAP2DDRNHbLS1JhVHSvUCvPa13k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMnOTOg8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0Ka3+wx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKRRAb1957561
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=NMnOTOg8mEg4mUwM
	+uxs0q8YpfCYoMEJW/HfOOd9t7NEHdEsUdLU01alD8pQjNnr/8McNPr++AyTTmts
	1ey5VUqSRdOhmbKeo/yBXy+sy3dXcepqzxnT/EZa7vjODppbTh5gO40f8WynGPzj
	3OC5rDllHnHhslcurWpwWriSAKXp8lessI2iFpotMkaG79wGZOmSDwJAk38A55bP
	2LdDBIzKmXuKNOD7FtBkhRkLnAn2o6FvrqCInNM/3X6s1PjUMPsBTo5zpSMDJWmz
	0xPFJ8mYQJC9sWrbbm5xJIz2UyyLD9MHXoKDitF2IikG3lSKlNBBzrlDtnb1ukHA
	2xamHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vukmws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:56:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354bf10ec2aso2875355a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829814; x=1772434614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=B0Ka3+wxqRMezWnnFGE4Z0BGBMbPDPCUjV+b4LM4ZY3DHPrfQrlH/BmqAEKehLbKcd
         7Jg6MlrIfpDcYBNNTAjeATGrRUR4+IVwka2MDFVfV/XnfVwEogGqdzCsA2a0oXLrdPaX
         gL9MrDGDz2jGPKFWLDrr8akuWgDjtOpo9DONMYrMnGP7sB7aZH0D4X6SJkAUNugV4FzS
         t+s6RKcxnwjgZuR2iuYFmag2SNToko2CgAnP2PdmzGT8zkMcXQRiTKYYlSv6OHS6OY4v
         ArhH5yhPhhpHWVPi4MhVqR4hY0sUkp2YDgE26LvQciBgGq3kFTh+QGzVF/pWIZ3AYyss
         1+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829814; x=1772434614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=UY2x77exm5N8oLOVW0YJG2AMk3NovspC73xk+BU/R+vgKBKONw3tmb7hY71EFP7ESG
         ieUARFeM36helRJB0Zx+wt5fc0ZtAjGuXfq+pvgv1XgzzK7P2nKQy7tVw60uH6wTlFHd
         19AvA73UJW5pcLTnwOtN8Gye1jw66a/cBe74TtWhIGXcHkLKq+iSvF4G0uxQ6Y11QJxO
         436SnWi65Icn4IIQCYqRsE+Idxj7x49MQZHuQ+EgFpV8/Y++Orsbm8M2LlOgNtTXWl2p
         6ke5jM/Zp+Ei+V1B5D32erlkB+eWLdzVJNOG9h35bVbxLcxJ0UOAos4kG62/GaPreBfZ
         REEA==
X-Forwarded-Encrypted: i=1; AJvYcCXpdi44qTxHaNggXHkRm74Mq/OWXIvo3/Acj1uT3Dn5aqFG/Gt/DO12ZMPpWarGAJUGKQnKqpI1eBrSZFIA@vger.kernel.org
X-Gm-Message-State: AOJu0YxLgOfLiun64F7NycREDdQVQQVumLnay+/sxP7I6XK7jkEoTkB0
	sUi/D9vzdj2FBcDk43tWwofnaJ+elDFrBTW2G1IHdxI58DXn/tKgM82cLzCVxT6XcukXl0jT4U6
	pzFlN60uhglLteEH0OVhEmMkDHKgYNwbw/qsyCzpUh5541dS1/uadWaXaVRAfh72f+NhE
X-Gm-Gg: ATEYQzyPTdbB8S33MBnw5kXDLO9+Pof9gzy3cu30C28HdRNYEon6wPnZNAZWcrT6gmd
	iquQvCpVpN6jLifMpj5iq8XEkbntlzDXrpEkTmTzrJ8cWSwtSYEzTeImMrOOuqmj7WsJBqbsXka
	2bz3TdaiBFcWDxv/7agp3/RcoNBE4wWGYxXiWjqVt9uREqnu0cs5GsNZxSTi6sJAQVJJyDAuYGw
	gjQ75/6m83J2HZUDLb/bK1UleB2xu+FC3kST5BmppFLDnSlF3ayChMkQAdyKgqAkYFkXeLw9Z1Z
	mMxEt8PdV0MAj1ZaV3VRzssWM42GI8/1UMwAWLT8XICwwwIfq1SF0/9tkXXWYf0jMpjV/SRTdZ6
	Sl3B7rhUQlygvwuWLtLBFIDaHPb6hLMyfLmPKfMTTHwaeEP5qyPRxi+gJI4ysVNK8494rt1vkTl
	tWlenuVzSou4ic
X-Received: by 2002:a17:903:11cc:b0:2a9:629d:b618 with SMTP id d9443c01a7336-2ad744583eamr70524045ad.15.1771829814426;
        Sun, 22 Feb 2026 22:56:54 -0800 (PST)
X-Received: by 2002:a17:903:11cc:b0:2a9:629d:b618 with SMTP id d9443c01a7336-2ad744583eamr70523785ad.15.1771829813940;
        Sun, 22 Feb 2026 22:56:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f619f8sm62249225ad.36.2026.02.22.22.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:56:53 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:55:48 +0800
Subject: [PATCH v13 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v13-8-9cb44178b250@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829767; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=GYKSp48HIz9/NsR+p3K2MrJDn8ftD02desZ2tTn7TWMAjbQfG1cLRr9feCJsN/9hFhbMnHlEt
 1C3IX2UzLqJAaPZTJ7Z9DqjHdhMe9s37Qx6TqkJYy28M/S+hDjQq1uV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699bfa37 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 9VUi2WcBvC7DC7Tg1YFz84HUYoUFUxFX
X-Proofpoint-ORIG-GUID: 9VUi2WcBvC7DC7Tg1YFz84HUYoUFUxFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OSBTYWx0ZWRfXyIf/PXtrGvzW
 XM0B+FKJoewkWN6ugE5stN+zU99SadOBKgp7IVIYdo8SonftiHe4NinOZUpvq6ggYjhnRk/dNeB
 fFU45v+JuOshxayN0Y0p6LZ/cSKELhQ3Y8EwOnQ6pQ4Cc+PFAq7zXaujcDTLdh+2eYHC3chsaQb
 bXTDcia3qFOIX2Py5N/RhAUxFJrhMtNCUqhOqWiQWtQe3OLkt8XJPbvdbzzZYg4lRqucLvS/l3D
 XHj8L32UTSYrjbUH3ObEcv7ftMSXmNwPf4++c4oHCpDk1RmyzphaNKYK5sYM/Te6GisQVlBRTiG
 9RP+UkyUs3DKJ9SmjNPpn/zmnNtYeaay8GrpjLWF/LISiZjLfwZbFFNKRG9vv3PC7HcDi2hY6kh
 FQgbXNjaztjuKxjGJhpljeG4DX+ZWmRZQvbkz7HVksadN3p8j/usKEN5a9U5g/noCQ0IOGq6XRE
 AtosGwh+1Jri/P6JWLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230059
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93595-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.61.12.232:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DF29172737
X-Rspamd-Action: no action

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..e8a20789cd58 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
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


