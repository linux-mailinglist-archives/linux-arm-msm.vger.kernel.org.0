Return-Path: <linux-arm-msm+bounces-76933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41341BD186B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 07:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2AC6D4EBAED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 05:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3396C2E2DF1;
	Mon, 13 Oct 2025 05:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxD+DjPq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C7D2E285C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334625; cv=none; b=Uo9OTgH51Iav5elxlIu1p8zJu/5/9yUvo/LZz8oxSoFU6IZL7PH2exSaoSV8baNU/mOXjDo3fujKaFlGfjzCLzFKZ65IbCLr7JbDIIlolW8b6GPhYlrOBhfIHi+serzjckkktyoxlljJ9LINPu0gsBNQ+BjZvb8K/46B3QIvXMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334625; c=relaxed/simple;
	bh=puH6v1Vw8fFe9wl3mkMKP3E/RzmfB2TkYXSNm520xS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIFs0pM9K3GW+GCT9zRqHuIBcs/FLtEU42btv4vmC+L4yHeFQPRwqNEztx2IIbj99IM0SqLJZV4v2KpW6PDyHYI8dWlIkkYzGqxJdT9bMaGK7IqZkMCV8yyoUYi0VYM7lEGKCCg2UtGCl0tSEUWyoWV2jyZFHztuYfCT0SKJfOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxD+DjPq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nLhM005394
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0M8aFuc/Mt4pPM0F4HGxyoaCM32GJ3Ozi/GdicAL7h0=; b=MxD+DjPqYW0HvzNf
	qaiS5tAQtkO+rNzRf/QPa582C5tfg34zPuedcH0eUQbQDhw7p9Bs9uoYbOsMBokG
	lJxA3Rl2YjZeKSvoTeTuysaGJYNYo8VL2EpEvsdYHfwh5rbng08Bvc3Y+rIVi2Em
	j/oEIWdAUPuOhnXmUJxz6336lyXJHdlrEHLmol64oRU5TybKfRuFYvCCh0IQQKCG
	scW47yaAZA/mXs8s/xz7pHhfdR2oekAhUrngtadRIaZ+xDUnRyM1Gd27IMBlghbY
	wOVW/XXNXNXoVCXNEef/FbAuuEqU46CeEOVKfbEXYf9A2Be5PzQh2DYBwbm4Q7dL
	xLq49g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbs3cgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:50:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b650a3e0efcso7955366a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 22:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334623; x=1760939423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M8aFuc/Mt4pPM0F4HGxyoaCM32GJ3Ozi/GdicAL7h0=;
        b=np2lbk61m43ANgy3WgvGoScTT8kvgQShYTydJy2O1PB6tEmkOkEdJFmmbep/QJ4ILF
         nGmaE5CRn1svaphojcGf19ojZOVE/9LZliUe2uPTnAgp2GICkg2eLWCoIrn7kIA/eS4T
         h8zuP6FXVgm/Ra1neGz9nhdod4HwBgBaEnO+ZU3CefqYKGWU3Yqb/Ex7jdQLx4+C9y9Q
         VFQUb/wmo6kHRUpTohgKCD8Ncq4ENnTK5X0H7NxsEfmvuWs4Kb6+JspYJ14WjRrhg4WS
         ZwVAhy+17vxR1n62/OPECawcnLGsM55o0L/55w27UmC74WwPOrUq1iLSN6NnK/nMZU/A
         BPkA==
X-Forwarded-Encrypted: i=1; AJvYcCXA0dGG8hhN8cWZnbyVze5n0DPei5r4/WyDLS+2PjokwokTYtZDO03XNcZ553jOQDLSeRfb+xJjKxyVAzY+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1fvBWh9/ET9B/V4Rtjn/bojZ/YyYaVywB00xVnWDoSYVE2I8
	WTmmFUFFujmDFTJFQqUHMTYN+KnWmFP+JCl8QnaQng1lpJQcOWOtSybG0cxGfcmh/bKVdDilfsz
	ff2hROGqHu5ugjPnhhQ6ppt2wAbsk9V4Mxq57Lr/ORp3DC/AlfIRN9sMhXKUpaMHX31D9
X-Gm-Gg: ASbGncsMWB9IJVJuoJDP4CY5PsYLO6EiKhDZukdjKy9J0bG2tNGXEVvpCkPOmCkGIjO
	45+/Ix31YxTVuc5B13JjsyVS1hx18BGxjdC1Np0mXpL1wCfnwdmhykaxsOzes79hkmF0xwesuHY
	J7D1TFT2FpU8LE5JKwUwcI1Q2CnpLN9ByyAY/+kZdpb9+PMKo5YiIrufgBDBrXRqp4BdjAt7B3+
	HTK0HTmufyX/MKpY/Y7WSvzpgBLZC7675ZGyI1b/S1zkcNxNz/WlNcvGGERNdpORVhYHN0//xzP
	04UbSvCdPT6dy2G7RGqnw3goVU61howdkzyJFFTn2rpD31qdV5o/LWdZIvZS5UNxwvo90LNuDlh
	HerGpJFjb4rSNNZX3bP6mvd7/7do=
X-Received: by 2002:aa7:88c8:0:b0:77f:143d:eff2 with SMTP id d2e1a72fcca58-79387c191fcmr24271688b3a.28.1760334622728;
        Sun, 12 Oct 2025 22:50:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhxqXXmp9aEfaNdrdawUKaKA995gCx4boRuFrdQ2UN7/P23mvgjKwBh/cZOO4Q72gPOn4TVA==
X-Received: by 2002:aa7:88c8:0:b0:77f:143d:eff2 with SMTP id d2e1a72fcca58-79387c191fcmr24271663b3a.28.1760334622267;
        Sun, 12 Oct 2025 22:50:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:50:21 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:18 +0800
Subject: [PATCH v7 9/9] arm64: dts: qcom: lemans: Add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-9-e1e8f41e15dd@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334568; l=820;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=puH6v1Vw8fFe9wl3mkMKP3E/RzmfB2TkYXSNm520xS4=;
 b=lCVal94BR6nfoZj9iRzi5oLBXkX2bW2qsDWgbK4ssNwarQ8S6PvoWe1Jr5TdL3CN6BcepOykS
 LOZCdkfTNQtDl9LIWvUXgPqM3VB0GER4lNl226C2t3sSICX49l8WMez
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyBXPPlf74Kkc
 w6u7T2UQ5rDLHD9CEaN8Ow1osfpOajHIBAPnFjl8MXIpnOK1k/kSKUArc5YBIabuvSf1jONYsvL
 D/8+52oSvxhiBCDXG2S2+3Mhkzxa7Ev4lj8tIZlfViHa/BF1D2FQeMjrD+3GDjOZKWjhVJiCM5h
 /EE7djwH/oeogeDxYVfuqgxbdfc6SpNAMORneOnDtAolYKPgcp7BrIjT3lLnDKXuoWqVBurrUSW
 6giXAxlLNZhnEZ1pswuyHsRH893Dnm9wCJAUgy84ZeP0pGYnpMYFiN2o70Kxd8pgz5iD1T58Yal
 bJfSp+q5e6jQ8JL2lVk+Csy6neITa7lmWdpZ9jh9LYdBVvaLFtq1gwhgZK3DdHVR1fW/iuU3Vn4
 aiMlmfx2i6DLkpCQtCLiy7aGflcxHQ==
X-Proofpoint-ORIG-GUID: H_hdQJmlXXDhY2aZ0_01ewbdzxn_TRn5
X-Proofpoint-GUID: H_hdQJmlXXDhY2aZ0_01ewbdzxn_TRn5
X-Authority-Analysis: v=2.4 cv=U7SfzOru c=1 sm=1 tr=0 ts=68ec931f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186ed..9e4dbf7c4a11 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


