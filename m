Return-Path: <linux-arm-msm+bounces-107222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OANWBYsGBGoHCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:05:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C4E52D6F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9959530A0EFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 05:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FE13911C0;
	Wed, 13 May 2026 05:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oMO7Ttx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrHyEboW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B3E397345
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648613; cv=none; b=oDRgCogQn/y8w71YMNBjZiWB0ezxhSdQW1WtkHAwdgXPcqn7NqIzFRAc66fs3JJd0IAVZt8yhotNYQleYkPL9OEbl31MYN7daWn+QrI5enO+WMjVhyoh9/n3mvsmoay4Lsd64Z+k14X0JkVDv9YaYt6o522b/gJXjaes1b5eAuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648613; c=relaxed/simple;
	bh=3lC+Q2YdjsOXX5+9uW8gJQqb9emhqitcuvaZ3JD1ssc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYCHhjoKwQ1/DSSv03qdvZMV0mCaYyn+GWY1JAxvlR1OS+4tsSFyg3egAl1ufy6e16mvdV5YRXxPTwmW/eRyUxsH9qnGiFLaPAXR4TCkxbeZQPEysHow673Ljy7Twr+emNaLuBSZO+fjHnUcebAXgDpst5qM++MqAci6HzZEl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oMO7Ttx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrHyEboW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pBQb3595144
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZ57bXCmO72JMJBA0SYIpdTazDsrz1d8H3qg0XEecXs=; b=oMO7Ttx7knOu9+3Q
	mDd1r1y13D0sUZ2K/ZOXXCPcfjZKWu/UztDHW9cbPQJm15eSij/D3gFGRxsp9Q2E
	XHWd3n3Yhp++qbejjFE/wzmU/g1ORg9X4Y1a/Y3TFGubnrKzrbVNR1VCyTKjV1Tx
	7+z3FcLCL0QWh/CIjQRKRAb1gTivqfFBIV/S40ltfVnWyEobFqVBd977G1qNSiA3
	PhFv82nUay5RPukgWnTUI6Zglhdl7HVINdvkHqcLLyVWhFXNn0UUJLF0HIlBEu+p
	/w4dBnLtvamJl0WQC6WUzNC09NNVeTjHWzyI4AOnX979m6c3ZaLk7DmqruxhT1zT
	MbwnNA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e463djs1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa366fb79so6816286b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778648611; x=1779253411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZ57bXCmO72JMJBA0SYIpdTazDsrz1d8H3qg0XEecXs=;
        b=MrHyEboWuM8LBSNikQaHfWID3tC7sXVzaGRp7nZ1t0fZ5YzIeAvSi5KIRMI+pnd38K
         tsiP5dL1IHw5GppazBrqOvwWokty23V2lT7PkHWbU9XRB0cVFjyXAUoeIAZQaNoIqmYU
         oo8tRtww5W5V7kMrWIU/nU+4EVh+G2Ij4fh6kc4xj9YxMn44jgMbl/7TKZNAsw2dL5i8
         HxiOJ8+ZZfog3j7JVC951WmSV+Ymt173Ing7m8mv0lQvW42yzDdoq40t3sm2FmDHDwF0
         HYjo9WiHR78tBLmJFJYcCuahu9N337Gl0Ymk5bWEKhvebxdC8DJ2dsRSUorp2Yy7PHjY
         HXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648611; x=1779253411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZ57bXCmO72JMJBA0SYIpdTazDsrz1d8H3qg0XEecXs=;
        b=c2ok0+m7R+DJK8Gg6gOwPczIkVUZIs8u8bpQna8m7rzuqMBYBBM0b7QaeDaQ0fpRXh
         hSYeFw/7Nsv4anyJN6Ty7bQsU9be4VAZoW0hALw11vV7z1s++D/aERDm1OSZZHjX9pFx
         pQRABhLKRnB2K7AeXJW0+FDcy2wuyDr+JkOVBPoHpzbgX1zpRdBdLnuoPcN3GhZwDTYd
         k0MyT30cOJ8cuSc7NpVxQhdzGCP/ABiToj8rK410TJSq6WrL0CJyOLB33gB2KGsb9wCe
         fP/Wt0KfKDeB7+9nnkTkbNP2bRQ3OOym43SKsMV0GfgzNrhEMosJyCDq9EpRTzGPd3R6
         rFIQ==
X-Gm-Message-State: AOJu0YyWazuof2FBfO3Q5k4uWRDhsBr3OS+5dGExnNJe8Dvv3RY06hTJ
	zz2o2YYp30dfvvktnzC8+CYuPj8N89d5FeeqOzenmoUqjv0AtPn8bwZrYtmqAgQq8oVEJAqd1nC
	SnsPIG9cR/TIBe/tJcUrTc1YTOTvxXiVeNSxCTTgI2HpqBbORYmGGWoAIoDYLQnf7Sovk
X-Gm-Gg: Acq92OE6M+If3uWgsI+AspJfSsfR2gZVUdW9BtSUM6vpnCZmEbbiJxUPuvu6mob36Zb
	HfS52Nc0aMCDNGEFq0rv1GRfZ0oi4cuOLDcawpQqBVFpq3ScpM/x3BaHlFCgY4Fjegem5hlDyp1
	eCII4hze+SucXdjxa8g5ycqEwM+rBZjcxsED0aKYB6Nh3ks3GZn+bJFHDgOfAdzFbvCE/MWbSaU
	DC773bXSYBZWcgGBw+moj+/jekuUqGR8UeY7K8g2fk4k3InrqKhiIpZxYDLEgfzgmqgrZCEs1JZ
	nBJP3OoM5WTaX+bNezZ42jNvuWZaOgkqAlBzoU+D4wiQLdzm1Df4/Zhp2A+2WfZ8PiJNDdKhGvg
	HspWkLABCcuLQ5vjSRWb13214IfYklXVgOqUkI5zXl5epwW4ETvubmyOnovP8qZf0Nw0WAeg/L8
	EO8FlrTTzoWCaNeSfuS+O8O7BoctOqh/W8BydvKDnTxBiIigceFtJU30h5
X-Received: by 2002:a05:6a00:e1a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f042bdc4fmr1647591b3a.40.1778648610746;
        Tue, 12 May 2026 22:03:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:e1a:b0:838:1c02:276c with SMTP id d2e1a72fcca58-83f042bdc4fmr1647547b3a.40.1778648610315;
        Tue, 12 May 2026 22:03:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm26328020b3a.15.2026.05.12.22.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:03:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:30:31 +0530
Subject: [PATCH v10 2/3] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wdt_reset_reason-v10-2-cebda08ab1ef@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
In-Reply-To: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648598; l=1267;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=3lC+Q2YdjsOXX5+9uW8gJQqb9emhqitcuvaZ3JD1ssc=;
 b=vKtwguCDmffqpyv+/5ymxzBtz6LjOxUxcPCXuZOqRmCVi5V+z7VEesewNixuSzLv1HL4J5UTb
 hni2lSRT7p5CSjUuZ/EIIcDuu2k/Cw48URcgcnWkPzyoWnVNVBMekcR
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: bbmQIXsb2UGtwK3hc_NW8Xxh_w95Mj3C
X-Proofpoint-ORIG-GUID: bbmQIXsb2UGtwK3hc_NW8Xxh_w95Mj3C
X-Authority-Analysis: v=2.4 cv=aLTAb79m c=1 sm=1 tr=0 ts=6a040623 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA0OCBTYWx0ZWRfX0QeTJ7vcq6QL
 1ujjtujFZR7AgK7LitJQgn+i045mfVDP8DH83s7U2u6UitRjCENv20hoTPgshyqoxXdzI0/46r7
 a3QXG7p8Lq7qNcXt8+UbPYeFj0XpA/LdEPfultZ9gp+QMOEwwjP7EhyJWvAlGfe6PIhoICATMBk
 JxLr2eJjuKegeX016+i/K6l1nUuajnMAmVSZCe7Yv7pOFnlln+lU19OvkB0O5Y5062skhJqxDbp
 SlTT4PSa4SV8iqwo148LA6+Sl0cmxbl4xusbFT4z4V2RK3EKZ9beUJYIjiTQQUmZPapr6mTfPS1
 8PstJN1e8D5zx278DVekOvc5pMfOArMT3qpSS1EGaEKyJgNwO1XWABrAF2BASCejm82OuNojCvj
 udoyIzISbl1uvqQvq37VOCqkUhvyArr7SA8EZDW3Mi/vqX2TLU+p5tPQRyfZ9VWLi0Hy74mF9xQ
 o+h/g3/MpBUL9QLAQdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130048
X-Rspamd-Queue-Id: 61C4E52D6F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107222-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,7d000:email,8af8800:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 876bf6a8b8ff..9b8410e32629 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -730,6 +730,17 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8af8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1


