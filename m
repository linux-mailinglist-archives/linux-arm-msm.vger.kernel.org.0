Return-Path: <linux-arm-msm+bounces-113471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DfWHOeiuMWplpAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:15:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4276951F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:15:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i+2LQfI7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kxo9X0Np;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113471-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113471-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07ED7300F7AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB0E38D3E5;
	Tue, 16 Jun 2026 20:15:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BC438B7B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640920; cv=none; b=l9s9VXkKcHYz/YA3aygn6a9YkgJVRwX496/5ksAThoC9VjYAwfcZXAZikD6jlNJ2Sh02p99SweUxXDmHEYyfV7Ch22iPZpW6QQfP0QURmkf6t1lm8nu9oAxYNKFdPy+w1/J42jwkuCLnUMvgtLFQfkgz6ggDwyk8Jh4seur6D0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640920; c=relaxed/simple;
	bh=90V0FlfPTJPkqqBkSjOmRA+aO6OFiJGhDlEU1re5SAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ax2VDCYkT+RWrFz3m4rbz2eECFLUPtGIsRjQnBS1unqe46PLX5HqEjSYjSCKwQHBnbEthsqxigklI7vcZSpcU8OTx3OajZkfkTqRxEU+YvjdNRR6oQ7k8yUaCu9Xkuf4zqFP6tPO8CPxZWLVgHw0XzIlibS/NHvvd6Rttx/9XI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i+2LQfI7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxo9X0Np; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOKpq1376137
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=53e3TnI4YtK
	3eiHimozcR6Vdlld3sUnHJUSIasjV7MM=; b=i+2LQfI7Q8XrKUi57fX3l0QMgup
	YWj2phEhRPn1xbkqpRp+qf/HOHhZUvPLVHdHBZgFFTpXx0Xs3j8csD+lrlqEO77b
	AmOaF7F3jxlPoT6xeZVuyZ2ltinkmIgWYHgou+aq64q+PZWtYv8t8adcN5IP4Ypb
	O7YlZqPo7yLQgb12AJ3Yw+oR8aZARlCVB3euHpxmIa5nYkkZIx2uSrX+DXs9ftM2
	lJB+NDk1BUwDC6wINyrNR2NnjQag87mxvdUE2RFaVMZ681HagQ2R+Jv2CoirgPbr
	nZ/NRE90fnmTA/lKHVhLMYj3uXvr7vHl+/8Gm+8wrMk4uurc2OlyN9fm3Kw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xsbac1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:15:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0a99db8dfso47207465ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640917; x=1782245717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53e3TnI4YtK3eiHimozcR6Vdlld3sUnHJUSIasjV7MM=;
        b=kxo9X0Np20/qC+hU+XYJhN4h+yE2B2z82t5Gs++6kr2YmYtqY9krHbV5RqtH9eCnIB
         3e02fsfvXtA2HKaWfuzcoX3RS1xa6rasp9daJuDvB1MTY2Q0yzHW+WwQPqb5jzllkssQ
         ++MAquPnMQ8+tu+7XterMbffTzwVP0KQ7oZcFGFFPpVlzlmb0ci/ptw7/BobEForM6k6
         V6xa2RNki+UGYZ1FB5ETQyGf0XrIm4bYx7HPQyTXHOTEb0xM+s1onbSC1xriI8UIfktZ
         lrPmoySsjGa1/FDnA3H1ejOleR8F4n3c3ETedPGuf2IEa1hwrSZqzFvc08V/lrnDO2gJ
         fYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640917; x=1782245717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53e3TnI4YtK3eiHimozcR6Vdlld3sUnHJUSIasjV7MM=;
        b=D237CncvKvKUZVEvd3kV/MEeJJAJNhHkk5QYM2EyjaNGxhMIkHgM5gZ07dfkvsxY/D
         O1sKU0upZSjKQwUMprzJg9Go8EyMm8uAf1YaAOaYADpGVd+f4zgVncIKwW7MoJwFVuQl
         7VInKxb60FSxy7DuRUEl5Q9lCXrMwDpC/dVZN+NHb1B5xHrm+T9kNOSERyaoFj11L6Cs
         IM1TBypheTTfGSIOe2oi/z/wVDTWR9B3/Wyv2sm0X8GkN715fCjbs/vLLVlLAfhkICds
         WEJDuvzVD/aKJVJMt2vigPwN9z8kZGt3Tv7oQgs7FlK1jPLb47CHaeOYDLDrcU+cYiBr
         DSLw==
X-Forwarded-Encrypted: i=1; AFNElJ+xbqei7rOn0k+L8hKkJ1AFkt0JVNMBAdVlbWdthaFF+2/8fpLDI/Gnd5HRaWaCrD/jpXowQVszZETotkeh@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ8b/UV7mtNNOQsM/rFYwyHEdsjGPx2ooG1iZkO3SQAfxID42a
	WaFyMHqt0Qj+r48d+poxzNhsX6SHzc2dcP+0Q2lydEleE7oAQkXdUTrShoKb+AvoCHVchABZ3ox
	wIgfKmutB14byPojwzNeJ2CKCdoi/Bmhda/sMBziJzNFRmGhLNwsFK6YZOIULZ/ikRMsd
X-Gm-Gg: AfdE7cnq0yhx52ByQI1khaZmzjU+OgoXQdZWneF1hYjgsdZf08Yi1X9XFhJexxOBPhx
	hEmYMff7krW+qp5QBhD2UTC3SRpX6pIjdz7LaHHzjCBB13118t9Y/AuBQwhDNK4pymf9d0oWVKX
	wjJEmSAA4nCcqaeWHgJpGDviA4lZZ1b5H0Z7dv7DczpArmwojW/iidySwy74s+I+LAXXLB7eVA3
	bMQ+Npcak2AtEZvYkMDURrSd8ZbnKiaZW7qDUXX7KYI9Qz/L9G6+F/p5pEKlvxVQowH6roT75Pe
	9PdZSIK660kpkITv9iO2o3rNmZoopEYE1tFfcimd35a5Tp6ct5XkxQtsyDu51KsKUT04ZlkTA15
	JgWslLT6eVXOMd3nYB4IK0e2jfh0aEj7fUiCNHRv8jEGjTeIjr/R5NwgEow==
X-Received: by 2002:a17:902:ce88:b0:2c0:d8ee:7d73 with SMTP id d9443c01a7336-2c6bc28e44dmr5286875ad.37.1781640917247;
        Tue, 16 Jun 2026 13:15:17 -0700 (PDT)
X-Received: by 2002:a17:902:ce88:b0:2c0:d8ee:7d73 with SMTP id d9443c01a7336-2c6bc28e44dmr5286595ad.37.1781640916758;
        Tue, 16 Jun 2026 13:15:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:15:16 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v1 7/8] arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
Date: Wed, 17 Jun 2026 01:43:14 +0530
Message-Id: <20260616201315.2565115-8-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Aem86d-JwsIuRwVRiW6ZmH-Cudt803fb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfXxvRG6nIGzKOl
 6Q4hzpZLtPNKRl4ThEdAnt1bqfBkx1CG6gh0nMBtQ6BlPcr31XytaK1bROqCh1L957dbM6u8xYv
 eHAYQMyYMCu8U7k8PdrBuPT5przg9SzaXNgZhjs671EMg2lkpfMspYJiGjq50RmrJxFAOVwd28Y
 k0/24KQ0QFhBx6Dj99a+WiCTX5AKJQwVOW3buqjjUQvWlDQmEzOn0fWRPcTTtV2hrzmpPGrPrBM
 eJyh7W5j6EurZr6DDtN+dbA0ROqbA5kN5iPvCwCkuoKj/fAPWn4I//44mvHxy8xI3pWYByTPpv7
 +M/GoEAeeaPvoZTkjFp78LijGxvOWRkdPxC08jaeAzLVe7fRIeNgbxyY6TTlJRgTClLZoPDBTtx
 xDmWB4aNlNBEGaS2T+jQo5ryp9r44LRPxpTszkb2Mor1gdO/iNUHDXdgwUPSEfGhW9W2Iwe4xPG
 Pb4GowkfEmrA38GTWww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX4AxrmsoHZi5e
 hud+Uk+vZOz532b9sLKJ7z1gJF7TiYjrtJGUxCq+ag8NcbgcbkSiZakiFrl1r85IHoyyIa7vhZ5
 hyDxvkKXQGQJwk/7rCccFbq6/fTxcRo=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a31aed5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gAFAZ2oFMDLOpEcE9BkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Aem86d-JwsIuRwVRiW6ZmH-Cudt803fb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113471-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C4276951F2

Enable the IQS EVK audio card using MAX98091 on I2S0 for primary
playback/capture and VA DMIC capture through q6apm backend links.

Add board clock and pinctrl states required for codec IRQ, external
mclk and digital mic routing.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 143 ++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..62f405578172 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,75 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	sound {
+		compatible = "qcom,shikra-iqs-sndcard";
+		model = "shikra-iqs-evk";
+
+		pinctrl-0 = <&i2s0_default>, <&ext_mclk2_active>;
+		pinctrl-names = "default";
+
+		audio-routing = "IN34", "Headset Mic",
+				"Headset Mic", "MICBIAS",
+				"DMICL", "Int Mic",
+				"Int Mic", "MICBIAS",
+				"Headphone", "HPL",
+				"Headphone", "HPR",
+				"Speaker", "SPKL",
+				"Speaker", "SPKR",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		pri-i2s-playback-dai-link {
+			link-name = "Analog Playback";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-i2s-capture-dai-link {
+			link-name = "Analog Capture";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dmic-dai-link {
+			link-name = "VA DMIC Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 		regulator-name = "wcn_3p3";
@@ -68,6 +137,36 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	max98091: audio-codec@10 {
+		compatible = "maxim,max98091";
+		reg = <0x10>;
+
+		pinctrl-0 = <&max98091_default>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 28 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_AUD_INTF0_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -103,6 +202,36 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	dmic_eldo_en_default: dmic-eldo-default-active-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	ext_mclk2_active: ext-mclk2-state {
+		pins = "gpio110";
+		function = "ext_mclk";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	i2s0_default: i2s0-default-active-state {
+		pins = "gpio105", "gpio106", "gpio107", "gpio108", "gpio109";
+		function = "i2s0";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	max98091_default: max98091-default-state {
+		pins = "gpio28";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
 &uart8 {
 	status = "okay";
 
@@ -114,6 +243,20 @@ bluetooth {
 	};
 };
 
+&vamacro {
+	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "mclk",
+		      "npl";
+
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>, <&dmic_eldo_en_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
 	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
-- 
2.34.1


