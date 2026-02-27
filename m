Return-Path: <linux-arm-msm+bounces-94379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P7H4CvMroWk/qwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:30:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 685181B2DA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 06:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D681630FAC29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F6D392C58;
	Fri, 27 Feb 2026 05:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKhh+pin";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SeVPe03b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4738F942
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170223; cv=none; b=BaFEERcROaJUJgCwlLmE7oZSXXAEj5YEtMhy415wE2NkYT1WsGOnyx22rCfxosyIE3+A9fD1iI6d84iBI9G+AxQQQm+OaVo6WNmD8S6pX3Nd4sao83z/xQsZcK6oq83lDuO5sOEyiXUgMHYJFGYKUwHLDHkmAgriBRF0ke294gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170223; c=relaxed/simple;
	bh=GJsl/EZBcLAwCQGDbtrIwTEUvsx90G4RjDRSHaHtCXw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fnFCqJ08Iq+FhcH5052vFiQXZkX4SlkftcsYpu3B1F5YlboH4TVVlCH93+0tRkHoIzXRCYHsAPovTO1DxZF9W86Tlj3rdy8HYsVYoMFb2xeYH7H7uRlfo0jBIEjL7WEzbullbL6oTxMVdtFzBl/GWg0u8wcmkIPhnYqXSplZQws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKhh+pin; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SeVPe03b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2JxMM3185280
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HJn9ZHvf9FI4W4WNYfDcOy
	VsafvW7lubtQ2GHHlairk=; b=FKhh+pinY+/YaQp3ER/MfFUCP/d9wDyoa4o3+t
	zg7jxURdZQWse9Vx30RxhcxyxfNFsEmRlGTHEtU9tCAb/caI3OzeVoVjbg5cfFIa
	4IKiddnOk2b6oWfNy9lL/GM1j8+TJVr3NaLxrEaNLbQqYd6lx0WPvgXRcOd6c4as
	yThIwXt53MEBjl8rO52P5JHJ23adnPYJaDLMe2Tp+XlDqoLNJ7/DGtH6buxoq3Wc
	Gf5iqcq6jlXfsHzb0m8FJh15tjp+NmeKhum+c+kKYCiax1e/Cm+Rha/mYs5hi07q
	P1wcMECobaXiqHLYY6VIsUE+L1GwCOjJUyTmIg1SqIh8NUiQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjmp63dn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 05:30:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506a1999e44so211727191cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 21:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170218; x=1772775018; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJn9ZHvf9FI4W4WNYfDcOyVsafvW7lubtQ2GHHlairk=;
        b=SeVPe03bAEDx5bTRxD4XUft5e4nUE2X8bURXiJzOF0xazWjuJMcXzW1E/7PJTgjWLS
         2cDzJpbg/0FqxtgwYaHaL+RUzM/icaoeyiraRgqdy2GQLXEFgORF9zJkRFnAQPlBEPF4
         k5QTpPEG+s7+aYzgY7iA/skkleoKsRqvgERLwEdTzs9eViAiOU7VwnN69qUQ9d22ChCJ
         C2AJZmFqoH5nCpqjy3LAC10AfvbpIrE3bqBnG19vEtGwSKZLq7GtcdTOeOo30EViY8iO
         KGp1N97hDwfek7nPHEn3+Kd4Qia95StC9CrZ9iWrS8sVBYEqZqi7X0BETFfMmvAyNOQx
         sqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170218; x=1772775018;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJn9ZHvf9FI4W4WNYfDcOyVsafvW7lubtQ2GHHlairk=;
        b=OKake6yPCIvJfvbXrlerymMn7zrURhLwYzcx3AHR3B8b2jZoZbfzGM1c7Ce+8LPR7y
         TP2TwA5vBbGZG7/Th9SBkCqOEddVvZGcdbhW38fz40JdTPYSNxIBVWocBvvQhN4vw2p6
         GU11bUNFIpsOsZpSW9t6PLeW0w5YUhVESUEdIsylBRYj8xg8E3wsC3Q561Wol6/2YbgW
         SxZsRYsw8eIjV7L+QvEma/0K+o0avq105gnNOmeJey+ki0bLSAGlVNLuzRXK/+N9ZFr3
         pqx7o5Geqo89YklUnX89Xvd7oCKi3Y8m/nC5NBlI11Bc4qUZtPtuL2NrzaVY2yNGl/+D
         jgVA==
X-Gm-Message-State: AOJu0Yx1fleIY6is2v1hepwZURktxDHePYttJGaf8Q3Wd9O/mcNKuslP
	vfULQjOXwneB5eBxHMeM457Lpo/NsDPWknZ9AVdOAqW/BQgRSycy7TZVgW0v2F7k+L4JmCMaq4p
	cwGrsmxMAw3YRdZfTntFAuUIgtPkPyj6I33h+t/tA6Ucc2NfCPrKE53lUkeLybxxp/yXf
X-Gm-Gg: ATEYQzzNQu5T8N45qpYUfOnZr59sAluytS28qWAJ0RrJGE1DfJm+BzFmgtZRCgLTzH+
	M21M9WHo52CgImx3VO1Z0vRXIeEgMCqbSlI1sa/M7os+OWw5efraY+RILFBRB/f37DqUl8SyhXJ
	EA9eBvWGREHYjKTEXrHfz3Kf/Ij7bLDl3uQ7SljWeLDYlXVMFdl00xWcgFZVbHGNGuC30gShgvG
	pGojAQeHaE1s0SW+2cZlF/2xQEQsdQcHkbFaesGAXv6Yz9ReUlqtE4EJyjXONyp1aRaKgyY2Isa
	yeVfZTEuj4UCrm6FraOa3bUBfFWXTVY+btid5eO2SMW6yurR+YQPIHYsRK80DYJSN6bJ5NWxyTv
	mTKRInu7ClNIk9SCXDHjCjIetuaxZ3/s8NIN3Trk+RBXYvRkj2Zqux43TTOh/6naRvDMIyg42XB
	52KTGlSxh74hiK
X-Received: by 2002:a05:622a:1101:b0:4f4:de66:5901 with SMTP id d75a77b69052e-507527cb1f9mr21106991cf.5.1772170218259;
        Thu, 26 Feb 2026 21:30:18 -0800 (PST)
X-Received: by 2002:a05:622a:1101:b0:4f4:de66:5901 with SMTP id d75a77b69052e-507527cb1f9mr21106691cf.5.1772170217868;
        Thu, 26 Feb 2026 21:30:17 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:17 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Hamoa EVK camera DTSO
Date: Fri, 27 Feb 2026 13:29:38 +0800
Message-Id: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIroWkC/2WP62qDQBCFX0X2dwdmr9p9lRLK3qxDq6auEUvIu
 2fVkBb68xzmfHxzZTlNlDKz1ZVNaaFM41ACf6lY6NzwkYBiyUygMChEDZ3rR/eelk8QSuvoWiV
 jY1i5P0+ppXVnvZ2OPKXvS0HOR/lLtFXhaaw5wsoThEwCzt0PtEZJ5Y3mUTq7SPbX4rGRXIJX8
 EXDZYUhrTMIDSih1HHOtPEa5IgQXJ8zcI2mrZX3O/H1P3H7yhwW++DpstO0CI0OGFV0jV34Nvc
 ul9ux72m21SHwoLDT7XYHY2KbfVEBAAA=
X-Change-ID: 20260227-hamoa_evk-2455daf43d86
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=3165;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=GJsl/EZBcLAwCQGDbtrIwTEUvsx90G4RjDRSHaHtCXw=;
 b=8RV7fA/Sx1rI6qohw3+zb1LKEYDpePCGdcv7PiS3aBrOv03aRI3r6pv4Gg73BxcSzTs+QRu06
 fLTfZK5SwEZBxqkZrbXaCwIg39Nn4+ww05FHBxniBH+AvqVQbZNOcGo
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: jjzEnNiQFYHy3sqrmOTtcjlLFUtjBCT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfX5cGGZaKjnfG1
 pUL2GvPDaybTDJPUIJ+PEGwwL9HtNcoHiE+ix8bQEBQgF53x0pn2x8a8PYFpiQrj0pJPuTgb4MK
 YDRQFDf9aE7AS09EXl3z5cTC006Mtwu+98Ubm81lqEj9n1sIMjnJjo/4B/oTg5uy9XkdZ8epmVR
 LH8VFKFVUZBctjeCT3+xXybl+Ux9Eie7QSvwIZZEBTse8jWsGpm2S6RUsXVuSPp9rC/hubw1f4B
 ZRaHAkYQRozuQeX8mpg4JqN0whL7i1VgasjmH+UK0HpHjaYh/nkN0ZGzvs1g/2ll4tzbApToxeJ
 nVjTgnc+7ZSD1rKSZEoW1chisbmQq8xGE6JTCGobNZWLicwGWOVWLOGPKyL5dsYoY5S7BWIIxhR
 05gPTTGUnqeJr+Gh4VF/vet5SwGJXKb1c4sZxEmL1jg0Ys9yqD+CNqSVp5bT8rOcYs0oa1PQ/8Y
 EWskbL6CU8f1mkdbHkg==
X-Authority-Analysis: v=2.4 cv=daaNHHXe c=1 sm=1 tr=0 ts=69a12beb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OrI9xjwDScBevOMuhrwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jjzEnNiQFYHy3sqrmOTtcjlLFUtjBCT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94379-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 685181B2DA2
X-Rspamd-Action: no action

Hamoa EVK is  based on the Qualcomm X1e80100 SoC.
It lacks a camera sensor in its default configuration.
This series enables the IMX577 sensor via CSIPHY1 through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Dependencies: https://lore.kernel.org/all/20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Tingguo Cheng (1):
      arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M regulator

Wenmeng Liu (1):
      arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT overlay

 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         | 16 +++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        | 15 ++++
 4 files changed, 117 insertions(+)
---
base-commit: be8c02c846f256767d06a28759bbc7cc0257a1ad
change-id: 20260227-hamoa_evk-2455daf43d86
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v3
prerequisite-patch-id: b92aa0af5255e56e1a53fe2bc06d8bb57f155117
prerequisite-patch-id: d39af25f984300c48e6eddc4c7bfe64caae1d61e
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v9
prerequisite-patch-id: eb97bd225a1426e2761a40a8793dcfeebf801673
prerequisite-patch-id: 0dd709980bffcbfc3c007c8fb8b2688cd2bd5e49
prerequisite-patch-id: 3c7474e4c705da65499de17ce4b7090bd8a8a2e1
prerequisite-patch-id: 270d82b4c1760f1ec0a64a1b56c68ce26e6ae3b1
prerequisite-patch-id: 4f11e3d079a484008a03ce750952d6e2933c0253
prerequisite-patch-id: ec15148282029b78c452ef5445b0346dfb7ae43b
prerequisite-patch-id: 570b65b326f4c684d813f6ebeda152378dc2a47f
prerequisite-change-id: 20260226-x1e-camss-csi2-phy-dtsi-52c85c0d4da8:v1
prerequisite-patch-id: 33b8d2fd11bfd7ed5c846c8e56713e0f13908da1
prerequisite-patch-id: ada8ee35053d0c5db6a290449ce479af06974776
prerequisite-patch-id: 25f09813cee88243e1bdc01b9df9d4fb9de3ff5c
prerequisite-patch-id: 5f2c62b86829efaf76f2ba2342a991199575751d
prerequisite-patch-id: 4d000086386a3b344b1d6d345ab93d9b2b569615
prerequisite-patch-id: 89bc5fa963a75ec2b85403160f884353baea5bc0
prerequisite-patch-id: 1f22ff7fc93d0135e8759d45955bf998b037e11e
prerequisite-patch-id: 09910d9b9b2231a65fcac9ada44c7b2f7b7a9a04
prerequisite-patch-id: 09444936808e801a58c83356c9ae95415bacc83a
prerequisite-patch-id: 98c6a10ce51f628ebecb59a447c891884b297444
prerequisite-patch-id: c3e8d5e110bf0e25a534bbe911c43996c21d2cb2

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


