Return-Path: <linux-arm-msm+bounces-90671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ+LCLt4eGmdqAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD3F911D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07A943009E16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745682D0605;
	Tue, 27 Jan 2026 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glNSALB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBIjAkrs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539C12C0F7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769502863; cv=none; b=uDnhVvniJiHNMqyjWbc37CDXwPuStC8pHdkTuLjutLybEgRPtqM4U5XdGZXRDQGU8EM3RgGWIpjSMbwtRJbDjDfOBZgLgESAdPUw9cCnleYoxQq9KTZXqy6TAzet1kqyYj9FlQpo5+ng5XlRijWsl3ARjyBM06E7XgCKGlZMUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769502863; c=relaxed/simple;
	bh=FMGbJqQolrPlwDLIMr6fE/suAkdoPy71s0Efv6ZDMSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJwSM9GzZY4yixz6iRC0FUnSD3OqoeGSrv8Sh++pfEHJdW1La6kV5h2jmw39BsHKU5QaY+PsyJhlg3r2e6ebIr5vtSni7hyC3HSNODW3zNHTMU0AkQQDo1R2L8U+9Z10AqC4OUZ6h055dC1iGstspQRHU6xb7W1xTjnkD2d9tzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glNSALB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBIjAkrs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U5Sl171364
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UaVBrK7Wn8X9hnjzReLtAdvwaOUXopzud5ml+1smr4=; b=glNSALB2BwqPW+Az
	oX6QCiTipK/AE74Fts6i8SRpt7+CnQE/wbCr1oUTuV4U4Mm1y5qYjnoICFTbT8HI
	odIZlJHbanEzzqSoxIwyepO9MSaXtmFzJAmifrHH5cEYMmKYUD4BI7lXmS41I7oW
	4ypm9V331FcwUXDvm0MBpxejr6I1Sqhzr9AwvM9IUkv30Xs5yvJliAGCSr1M+CED
	qzfnWNLTfGiKKZNbRen/ne/tcDkVKJjEjR55YY9vnQiXbdPbBKMWJ2O6x9jRb4KO
	0gV+h681jA2ug5Ku3S5bDv6znXaPedl9glCnFNcCCghPeWRinh+ZL8IFSnNCLUFZ
	EZOyig==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a20ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:34:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b71bdcd037so3312007eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769502859; x=1770107659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UaVBrK7Wn8X9hnjzReLtAdvwaOUXopzud5ml+1smr4=;
        b=TBIjAkrsXHYxwSzY4L31KWicwKZae8nu72ZpoT1t55QHO1GcGkrfoGn1L+9UdnetCy
         2RUWz+gajfuk9lUjuy3uXUZghHfvoLi7m9Xxe1rrJK5BEFsfk0rEyJlTbhrrpwMLptbj
         NehSE7mb1q3PClWSbctyGrZWGiYBv/bqurs21KODBmtclVpSh6SdFy9ZPmhPnLPZpuWF
         BRPYvcp2+pxHaqta7HxELEMMTrwr16JllO5sRpLGlrF8FdlZVkxLfLau13K9zHjwjjMH
         vC2r/IJ2Bf9u7+w627+UXQaM3dulwLHwozXXGn22S2ZVsDRQuqLYoy5W+cPSxX7OMZcA
         /Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769502859; x=1770107659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2UaVBrK7Wn8X9hnjzReLtAdvwaOUXopzud5ml+1smr4=;
        b=FPXUQUCR5wBzcFag3i5e2Gml17rma4AzNlA2jpf/VM6aIu9v3Alok31D/xrORfnpfm
         tHyebebgbW50CIzkKZ2PiVyq12ohSDmowCxai86k6roJy0Uxvcr5AUFobPKPYOwRr1LC
         2CuflRq14wuzn78iqEDhTf3lLT00dirAO2Uet7gIxRr5TbvfUg44AI9YnUlreYchYhie
         dFEnSUl22DmoMTC6RG++GaZMvCo1vtWHuYSuy01jKygjDAuKhoRt/IxhQaPjaIeTw+nm
         9cAsuBuMfe3pYxLmqUlWplXSAumvdkoKhwY5taa5aVw3d7tU1vCFtULrPvnnlUMGkXLw
         GlLg==
X-Forwarded-Encrypted: i=1; AJvYcCWD/JMnZ6knijFz53dfomiYp6Kw+jCLmkpRmMov+651M8iBDYGvfc3YG2FmgFXOJPdwTEZsRKLiNGpvf2RC@vger.kernel.org
X-Gm-Message-State: AOJu0YzUBrn0qvQ3euiByA4jCr/HQub666HGL6mwWaaJft7oynNbcOmn
	QwNcxmfQb5gWdXRBQPCyCxcCboRIyXQPdQVQ3AIRqVQneVnWu/FW5tNtzXD57G61XUpuJXH5tgi
	gtxOYMpG4hSg9ByBNhBInFXikHeUTa4zrNBoqrJh6tDGZ2vMSFcWWO4wxNu0MgxPnm60e
X-Gm-Gg: AZuq6aLHcygum/i1kf3QWwoduMxt3w+sYaRFaLyvJVYbcXcm/P43Ojbg/ciwzY6QVuZ
	6N3r8K4EI1xHJob34dQe+aZAQ82V1XnBLNG+QorXPrAFpQExuLvE1MRKNq8fn6pGQRbiFAG4F7h
	Ad/vyrAUGvaz8I9qKC1xRRbOrNvJ20ebu8ZKF39cIdf/dk5FQoCXHyTmlvM4CbuJbvz9UQXVVrQ
	FOdy5rb+3UHBPitrvP8ourdAI2NEo2g3D9VshaujoXoeDThcX0Cb7CEdTGO5kmF+8EOt31bEJRu
	kVTc/5WmWdm04pnbP8Ybug3YtTXzOo77580GZKyK50l/YElUHjJUgtmOn/AiiEcTHicKFdZGrhg
	PX+pfu+SC/82wJ27mm0fusdo406TekiTDV/09MH+snpIJa/oykLPENPAX5Ycu
X-Received: by 2002:a05:7300:2324:b0:2b7:5a7f:f74c with SMTP id 5a478bee46e88-2b78e720760mr518481eec.9.1769502858429;
        Tue, 27 Jan 2026 00:34:18 -0800 (PST)
X-Received: by 2002:a05:7300:2324:b0:2b7:5a7f:f74c with SMTP id 5a478bee46e88-2b78e720760mr518452eec.9.1769502857781;
        Tue, 27 Jan 2026 00:34:17 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90cda6sm21064235c88.1.2026.01.27.00.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:34:17 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 00:34:05 -0800
Subject: [PATCH v4 08/10] arm64: dts: qcom: kaanapali-mtp: Add audio
 support (WSA8845, WCD9395, DMIC)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-knp-dts-misc-v4-8-02723207a450@oss.qualcomm.com>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
In-Reply-To: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769502846; l=7312;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=jXzY3jkHSm0eSqmrpHz5qFpd77VmV0m5EoHp3aWUHvg=;
 b=Yec6stJhsgDtWJLJOE6u9CGkIv+aj/AvlLNJ9146QfbHB7d6orUxjIAGjF03g6XRU3rzp28S2
 g/MtMYS6QOUAN4nJ5EtFCSgeBB/eOnsJ8rpOXnDsK7lnJ8wXRS/nORn
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2OSBTYWx0ZWRfX0tIK4yfUA6dc
 c2HYOAr1Pbwr0ddUyotfjXi+0AQVPrujeZyNGSGeyn39cZUkPm71X8rapzsB3KeoeE/YisZ2wUd
 q+7FG/VbCRdjPTkfH3pRGVWNfNhnLs3Y3lUZO5CrNkXhqLzUa57ZRtxpOU4jEU1PCf56wsb/0fC
 P4IRqwyZX1f80B35yXKb9UXuwUM/kVxu6TcqUo+gQ45hoSNaumc69mGDCyO+jJTEAH+D0sm0DLQ
 IPLOxgBz0jHbkQr9tS3KtDjnp0UBIiryfcA/W+VWRMbpx/fbnZ/ZlvyQ9t0L4ir0qQnbk8S4qu4
 vBRdOxAdvqsBNpdfCVGPb9APUYFRb4WJBHJKtHBR1MiGgp3miVs3DwORcITaS8GSzqHr7g1fmN1
 FI69ete93zsYbHweiCpX++9bZkDx5ZnUACYs5KuY3vMxCxIatFSBrp9tKw4uymF8gcmpvzBJTdt
 WFV1wOzqPqXqrhda+eA==
X-Proofpoint-ORIG-GUID: V7cCBiTHcDYkhJzsw0OThIQLzsga2LIP
X-Proofpoint-GUID: V7cCBiTHcDYkhJzsw0OThIQLzsga2LIP
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=6978788b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lxMpYmIrUrCHLM_QX0YA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90671-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BD3F911D1
X-Rspamd-Action: no action

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add support for audio on the Kaanapali MTP platform by introducing device
tree nodes for WSA8845 smart speaker amplifier for playback, DMIC
microphone for capture, and sound card routing. The WCD9395 codec is add
to supply MIC-BIAS, for enabling onboard microphone capture.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 226 +++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 3544f744fd1d..7dfc2a81637c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -52,6 +52,115 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	sound {
+		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
+		model = "Kaanapali-MTP";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS1",
+				"VA DMIC1", "MIC BIAS1",
+				"VA DMIC2", "MIC BIAS3",
+				"VA DMIC3", "MIC BIAS3",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			codec {
+				sound-dai = <&wcd939x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			codec {
+				sound-dai = <&wcd939x 1>, <&swr2 0>, <&lpass_txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&north_spkr>, <&south_spkr>, <&swr0 0>,
+					    <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
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
+	wcd939x: audio-codec {
+		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
+							  500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+		vdd-px-supply = <&vreg_l1g_1p2>;
+
+		#sound-dai-cells = <1>;
+	};
 };
 
 &apps_rsc {
@@ -665,6 +774,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -715,12 +832,114 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Speaker North */
+	north_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_0_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l2i_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1 (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2 (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3 (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker South */
+	south_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l2i_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4 (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5 (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6 (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9395 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010e00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
+		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
+		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
+		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
+		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
+		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5 9>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9395 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010e00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9395 TX Port 1 (ADC1,2,3,4)         <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 2 (ADC3,4 & DMIC0,1)   <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3 (TX SWR_INPUT 4,5,6,7)
+		 * WCD9395 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4 (TX SWR_INPUT 8,9,10,11)
+		 */
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <36 4>, /* NFC eSE SPI */
 			       <74 1>, /* eSE */
 			       <119 2>, /* SoCCP */
 			       <144 4>; /* CXM UART */
 
+	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio77";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		perst-n-pins {
 			pins = "gpio102";
@@ -743,6 +962,13 @@ wake-n-pins {
 			bias-pull-up;
 		};
 	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &uart7 {

-- 
2.25.1


