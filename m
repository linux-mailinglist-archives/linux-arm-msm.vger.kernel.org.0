Return-Path: <linux-arm-msm+bounces-92474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G1POnkFi2kdPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:16:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4B011989C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7669A3011166
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DE7352F99;
	Tue, 10 Feb 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEFIt+YJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYGybD+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C900352F83
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718582; cv=none; b=UUBrjKVrHZy/X9qFGrMiZ24bAuTpCU7ieipwZd7FOOTvRaMQQywd7dYIQl8eW2DWFWQ65fGs5m0oGHrYjmAEeO1p4QJh7LTmGp/1abKY8+7GU2awXF2/stt4MHuVgAgo3dVh972ssz0Jri6hx1kRo2wgEg/wUCl2fFUk8buoBWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718582; c=relaxed/simple;
	bh=pyFpVJE6MYJJEAd2yuha1KAy85brlX2+pXmPv85Prgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjAtpblsnWDiCIS2FbSNhVj+eB0hsy9oCBAH09awBGVrsnOO+zjIzoJA9gHEUbCnQbC9YVWjQJ7cQOielXKmV+1z7gN7a9XM8n9xKV39lnyEgH2T7dZoG9vDFjU3E9WDYjrKcHGZWD7gDUeTNUpuHFf0KQsliFE4yMGXLX7WaVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEFIt+YJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYGybD+A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6hV3u3438198
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvvNHTtuKlkvvdQcUL3Hi7FG2K3PsrX/D+mP0tT8jZA=; b=VEFIt+YJIRReo3Hj
	dklosuOBr0ixpBZAz7lFIwh3fNTaEqc805DdzZlMxB+KQXlsWWU739Sq79EToB20
	Wx/0oXoRJQbPfCbPKmGxT/b/5AblaQjQK9PR1cjPIbdT2N4pywS2/5ZRW7ey1Tnr
	K20H3X7D0pnow5nZYc786dNuQ0TOLQ8TYeQuonUZyuy8kZ/yMC8D84KOx3SvstJU
	cGnqXlK8CeJiLpY5BpewmlNf8pq7OiH9XrNA7EOF/y0k7pXS+t+uH2+DhuTQbSWk
	tX4RvzP5hbCHZyz95llN9LpYCni28sRYIIp08ekNR7qBiycAlkQsrxiNMxdml/4j
	n2LASg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7fevby0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:16:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c533f07450so167065385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770718579; x=1771323379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RvvNHTtuKlkvvdQcUL3Hi7FG2K3PsrX/D+mP0tT8jZA=;
        b=KYGybD+AAR5wrGVMNWNWu8Hw7D90wv7p4w1Eehqkk6HqRQGDWGa2irWbUfoqn8Ztku
         554EUDFoACPyv0QpJ/ywLp74pdHe5vg0VDOY9Z2ZEPDDthnzRKRo1kUo4M/9AmWiptw6
         aqmcRlv2uvSWs6pBMAavHD4rIvxf5JRgPBe8x33f2UnXRSKltWy7d6DRhQSWWe5zpa+y
         lU+pTtLzgENM387Uyv+bFnZ563pzL+HZsGC85EgEmWcLz3CSPLYUTUoikIFXxGxba6GZ
         5iUhqKQ7O66xdQXrzODdT++LnsVX4wZMZGOT4nH6O87FR5PgePSKCwXzF+hkR/0NWvfZ
         Afdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770718579; x=1771323379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvvNHTtuKlkvvdQcUL3Hi7FG2K3PsrX/D+mP0tT8jZA=;
        b=N88r06KA0Xz5zYPEstjgYi5hChCpprKNHcPFkYs3SBped5rhN2zx9+DDj5Vp/Nt4dD
         f1bJphEpZkyjGaWQ0+qZoDuxNRUCH7xHjdaATj0jK0L6eFEkKpH38lCo667iOwUuVfxK
         +WoO9Z3WL0I0JxqsmMRmhOWXhP4PsESPZJFrXPrkMLwugsnuOR7Vc1RDd7yA5UU30SDq
         c6FBrVT3MUsJRkV4CM3SFddMYMuVoKEFnApwQ9Sf+ELcxmQ4FZkyWrByKUnzlm/zdix2
         y3EYrRtTLZSKllOQwEqyOZbwbc2UPWrcVmE9qVT8AtcegQ5+RLPuAzI2fvK+BJ1VArPc
         bkiw==
X-Gm-Message-State: AOJu0YzXCjExoyshnFsY17b//EwZ1NgLI0Hqh6PDvclAxBWZQW+B0TZc
	F+Snpg7UejHAI+AawCW+h6CJLfOkQhzA709+T9HIr3GlFLuFU2LEwt0+ItB2qDryLyNLKKCXF4i
	Ww7gcmdevZk7PA2cu/Cw1iNNCBNL81657MuuWiex71S9Qu/Uocc/+g2isbOrNwN9GKGbt
X-Gm-Gg: AZuq6aJ2C3n5pn6IALJ/2COspfn3yYR2fpbdJY2QOdi1nHAEUUneX/rX/oh/VIWoiDt
	pKutWn4i25AN88hrIcbzWpOmh2/nuXgFkZhYfS3+hNmCIX5k5txmD/vphmav66bv4lTe5YngEqP
	Qr2OkK20zBdYFcvDlFw6bnuL5f3M0U8schYBRJNsCSodLBctuV6CtaeKdqobM1jkyrsNL1PzRiU
	7evaD4JYmgkiPZrpo1XviaEpp5i/ro+nAkoom4KSukzl1A1KRYsAuOTZAbdFCQ4omR2tLwalhq9
	DbaKyqWbo6k90wvKIijS8Kz6OOnjvC0Etv45yvAlvb2Ezrmi05cmHiwCErhtQUjzt9YENcTnYdt
	/o4ulEKRdhpZoXWxKfT4q8lrgq9vPYcVtAiZK2Uu5Y2InX6MKSrKbC11tC+QiwWDLINwvdVggRT
	brqAA=
X-Received: by 2002:a05:620a:1aa5:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8cb1fec9c19mr114428785a.2.1770718579305;
        Tue, 10 Feb 2026 02:16:19 -0800 (PST)
X-Received: by 2002:a05:620a:1aa5:b0:8c5:2ce6:dd4 with SMTP id af79cd13be357-8cb1fec9c19mr114425985a.2.1770718578753;
        Tue, 10 Feb 2026 02:16:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a622sm501443066b.4.2026.02.10.02.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:16:18 -0800 (PST)
Message-ID: <d388ffc1-5e4d-4331-9a8b-a553261edc6b@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 11:16:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: agatti: add LPASS devices
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260209142428.214428-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209142428.214428-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AGO8TYfa7Wh_omm5x79Olj7u-RzYhGvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NCBTYWx0ZWRfXw51y2CWkmV0k
 N4rcuCSOMguHU0vCvfQP690H/6DvoVfHljCLo8qRDwj0paRhrcb8U9svdfrMPMyAnToqgqUTIoC
 7TMBRq08pAvkolua30NOMq0x/pCrvVulh1KXIzxg8gN+2+/8IGc8dm6IDvBRwXhEBdcV80T8T8W
 r0131t0aM5bi3RGCuBBqs39I4puSUi0y2jfwzkVOj/EECy+xXYyEYYGfrkD0aISn0QXLNJcTUvI
 OdnUpDcJpZun5zyde7+7CcmCLswCaqNWprpmkA/PUJoQmxhnwz+mWpL0VwJhHbLJlIBq27JExuX
 vLqa0a+4nnXOMowUa5F6pdbYqAG2FNMlvQLXSA4V5yRxgremQVXn4qJhJmHQmSqhCWn8cdI+TY1
 dwZvhICKGJacoiiczXvqSpqSFOJ/+olyXtZMoUxXkVAxpby6tiO56cW6n4iKy+DYnggGwMt+E2u
 UiCkS5JoqSoSS9VQSgA==
X-Authority-Analysis: v=2.4 cv=F6Rat6hN c=1 sm=1 tr=0 ts=698b0574 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=i6PyEUSIQdZ9O-yLuUsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: AGO8TYfa7Wh_omm5x79Olj7u-RzYhGvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92474-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A4B011989C
X-Rspamd-Action: no action

On 2/9/26 3:24 PM, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
> controllers are required to support audio playback and
> audio capture on sm6115 and its derivatives.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

[...]

> +		rxmacro: codec@a600000 {
> +			compatible = "qcom,sm6115-lpass-rx-macro";
> +			reg = <0x0 0xa600000 0x0 0x1000>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
> +				LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&vamacro>;
> +			clock-names = "mclk",
> +				      "npl",
> +				      "dcodec",
> +				      "fsgen";
> +			assigned-clocks = <&q6afecc LPASS_CLK_ID_RX_CORE_MCLK
> +					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +					  <&q6afecc LPASS_CLK_ID_RX_CORE_NPL_MCLK
> +					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			assigned-clock-rates = <22579200>,
> +					       <22579200>;

Is this necessary?

> +			#clock-cells = <0>;
> +			clock-output-names = "mclk";
> +			#sound-dai-cells = <1>;
> +		};
> +
> +		swr1: soundwire@a610000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x0a610000 0x0 0x2000>;

Let's set size=0x10_000 (it's got that much reserved for it)

> +			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&rxmacro>;
> +			clock-names = "iface";
> +
> +			resets = <&lpass_audiocc 0>;
> +			reset-names = "swr_audio_cgcr";
> +
> +			label = "RX";
> +			qcom,din-ports = <0>;
> +			qcom,dout-ports = <5>;
> +
> +			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
> +			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
> +
> +			status = "disabled";

No need to disable, I think

> +
> +			#sound-dai-cells = <1>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
> +
> +		txmacro: codec@a620000 {
> +			compatible = "qcom,sm6115-lpass-tx-macro";
> +			reg = <0x0 0x0a620000 0x0 0x1000>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&vamacro>;
> +			clock-names = "mclk",
> +				      "npl",
> +				      "dcodec",
> +				      "fsgen";
> +			assigned-clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
> +					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +					  <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
> +					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			assigned-clock-rates = <19200000>,
> +					       <19200000>;

Is this necessary?

> +			#clock-cells = <0>;
> +			clock-output-names = "mclk";
> +			#sound-dai-cells = <1>;
> +		};
> +
> +		lpass_audiocc: clock-controller@a6a9000 {
> +			compatible = "qcom,sm6115-lpassaudiocc";
> +			reg = <0x0 0x0a6a9000 0x0 0x1000>;

This region is called 'LPASS_AUDIO_CSR' with the correct size and length


> +			#reset-cells = <1>;
> +		};
> +
> +		vamacro: codec@a730000 {
> +			compatible = "qcom,sm6115-lpass-va-macro";
> +			reg = <0x0 0x0a730000 0x0 0x1000>;
> +
> +			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_HW_DCODEC_VOTE
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
> +				 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names = "mclk",
> +				      "dcodec",
> +				      "npl";
> +			assigned-clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK
> +					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +					  <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK
> +					  LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			assigned-clock-rates = <19200000>,
> +					       <19200000>;


Is this necessary?


> +			#clock-cells = <0>;
> +			clock-output-names = "fsgen";
> +			#sound-dai-cells = <1>;
> +		};
> +
> +		swr0: soundwire@a740000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x0a740000 0x0 0x2000>;

sz=0x10_000

> +			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&txmacro>;
> +			clock-names = "iface";
> +
> +			resets = <&lpasscc 0>;
> +			reset-names = "swr_audio_cgcr";
> +
> +			label = "VA_TX";
> +			qcom,din-ports = <3>;
> +			qcom,dout-ports = <0>;
> +
> +			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x03 0x03>;
> +			qcom,ports-offset1 =		/bits/ 8 <0x01 0x02 0x01>;
> +			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00>;
> +			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff>;
> +			qcom,ports-lane-control =	/bits/ 8 <0x00 0x00 0x00>;
> +
> +			status = "disabled";

No need

> +
> +			#sound-dai-cells = <1>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +		};
> +
> +		lpasscc: clock-controller@a7ec000 {
> +			compatible = "qcom,sm6115-lpasscc";
> +			reg = <0x0 0x0a7ec000 0x0 0x1000>;

This isn't quite right.. it's at LPASS_TCSR (0xa7e0000) + 0xc000

Not sure if we're gonna need the rest of it in the future, but it may
be smart to describe the whole thing.. Too bad I didn't know about it
when I first submitted that driver...

Konrad

