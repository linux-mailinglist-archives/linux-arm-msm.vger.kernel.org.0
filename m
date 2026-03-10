Return-Path: <linux-arm-msm+bounces-96597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mI3vA0j2r2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:45:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4C249907
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02D7D3025F6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D58379994;
	Tue, 10 Mar 2026 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jSaoErtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwLeQscv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9C5378818
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139514; cv=none; b=SGRg60G9C1+NaoTbNm3wiBTplh07R/nNP08l7Ytq6SXWNxvXCxFaafOl9WxQ1T8am/+vzf2jxaGVyFHwBoAnu+b7/AVP3XqXLFl2cLuELGsFj2JNWSba+ZtDyEYlrWGzkxO3IsVzjZQTqeY93EIHp4bx1cCL856RbzT6Ifjx6Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139514; c=relaxed/simple;
	bh=+Kx6CW/dov2b+Z2F57Pk0PKvcNAXcXGjfBQOBOoPYp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOSfwN9bNYbkSbbt9n/DyI7DB+sxSmNvcW//0V1xnAlIMEOsJhnDbE0xkcUMXiEXAKZPyN+TDkRWXJyKGnljADYtZJvlyOmQKwcPh3zc0cXZg2gzFW7MkUfjSw+xIX19AW1pzfxbxw8HlYxUbD/TbFruIPvzHyd4zp377HQapqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jSaoErtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwLeQscv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5lHQe568735
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyCjKE1CRtdrkKn3m0S53RpV96KhLjntxQ+MS5fj5gc=; b=jSaoErtbTjuYJIe5
	CR4lHMT6cSUu6FsxeX8CyOYJjnenINbmSTnnuJQV0iQwgeKQK/cMFiPCDDtb22/z
	WnzwUVG/EGTRsm8sNg+S3nK69T8sI8VcXwnMgG6wvghFVsHgBAJEIQ9rOcVt/MVf
	SZD1xaKbq1aXpxlHGXdctAiXhKftgfh80RJ3llHFCOBW8qMSeacsrLRFkvdOaIcQ
	9avQFoehgyizDQFpo7c0CeMe5n+TN/RIJvx/onM98G4hFkUKvcDtxGyJfuKW6PKm
	+BGL0MfyWO/1G7G8N8rD/OROg7GmIcHZI6KXQYXWmrOWV1BB8WpIEBbRlNLK5jbf
	3UeenA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8h3ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:45:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so865014385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773139511; x=1773744311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyCjKE1CRtdrkKn3m0S53RpV96KhLjntxQ+MS5fj5gc=;
        b=HwLeQscvpXfMXrqXv30WBP9Vneu7wllFr/++fOVjRnHhbgpvIX6t7T9a4MLvYZag4/
         LIgRtr8x+8+XMPPCVh08kpCOAx/NCNqqFLVBpcICz+8X8UnVDZkURhdwi80o7z6OI/dQ
         6GjmPepxP7T6VWJmqaDKogqBDeZYo2VO6ZUeQIoD5ooDJa7HcsaUagIqlrGmojYLkpYk
         s3X3lvYIHYFgf0Zv6muB5IFeyc43Js8WoHO17j1h0W1oTLdeNX/j4sr+cpn71sxWFg90
         YkrANsa1FZwQE6e8sv5HNzrQ/gShmyXwoSNkAOpW9FWopnizZalm+cHzUzvj1REaslRy
         ezaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139511; x=1773744311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyCjKE1CRtdrkKn3m0S53RpV96KhLjntxQ+MS5fj5gc=;
        b=DN78uzwOp4JWuJNybcm6BmK6AV49lHDC09G20nnG/GKWJTWHT/cBSZZnstuUJkyN1r
         bA4nbnfAO5ApNxmbDZAFTHkb8a9vs7Vpj4LWzoBIu1RcLPDdbhWahan+70swvrUOsC+b
         r89wGLWM/mNK7VVjQl0Sxxico/bwsby95259zv51qTnlxpJbulGNTlMuw5bI0EXbK7W6
         3Bbq99Pk2e9HaYTKUksVmQW4Cw8bZ07yvykJ6c3KZqxRagHkM7avz9+skjgTRJk+WhfK
         YySw0Qx++aCIxhbshc81cD5HLl7AGC9hOpjmyt0+2sHjZDzEsaZSI/Gy6Czj/Fvi/aMU
         BfWA==
X-Forwarded-Encrypted: i=1; AJvYcCWWLQmWr6QLR9qnxSyl8tYWqky5SUiwoAAD3fm7/uo1vhnB08BtHNHsZGtuzl3vIlha3h/si6JVYrS9u+ft@vger.kernel.org
X-Gm-Message-State: AOJu0YzSFoaaBHGQSFbkUCZ68LWS3+Xp8SDSL1/ujAAW+HYoW87820fa
	K9LfbhdcfHvZbSCXdx2dWPLISKlLc6XiNoN14ql2O671HReO1GBUN4KBOglTBeixGealdgPTMm5
	GzBEGqMivGS3fcBi6WpLindkKbUC2hWBFVv4bWg8rGu4oRg3YeMz8ROdKqE+hWObqsKyr
X-Gm-Gg: ATEYQzwrEDNXG1YDJOoeEvNp/t+PW+7lfjZwtFQv1In1U1eJmpCtwKqgL0NINsj1zhV
	xSVQ5rq6Wte+zWrvXO6SWkYVu/nyKfhRyH//EFTClLsXbfIsbuOK8gW5lhkYEAZQsKThIxLWvdR
	IQi+ZJcDedaWw0+P5WWIblLRLyX2Bkkax0IUp4kxC7yg+kB5H+VtaL5enjcb6rZDIWVf7L/J4qv
	bSFGUfxeTYAQYCwm287GuSzDD+Pdc/Qb0yOJ87+Rwr2S1dJeIWYg4v00RxhLiK39r7qLZiSGKW9
	tFKUz1DgpzsyVG7Lb+v/QYZYYUGrksgane77tWN18MbEnVI4bUI0i2MjVe6cSYTbtdpJf0Zh8Mn
	crOuzcFRnt3d6MG9M3Xxnv1qtWdPyiHpa9DoAgx0mo9BlJ4u0mKk30IqrwkuJjR6hIFo2Suk+xL
	I28qU=
X-Received: by 2002:a05:620a:28d0:b0:8cd:9665:9f09 with SMTP id af79cd13be357-8cd9665a51bmr126362185a.4.1773139511328;
        Tue, 10 Mar 2026 03:45:11 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:8cd:9665:9f09 with SMTP id af79cd13be357-8cd9665a51bmr126356985a.4.1773139510830;
        Tue, 10 Mar 2026 03:45:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a559b777sm4060854a12.27.2026.03.10.03.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:45:09 -0700 (PDT)
Message-ID: <3dccfa39-9562-448b-a982-447cfa7d5a5f@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:45:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: monaco-arduino-monza: Add sound
 node
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309152420.1404349-7-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309152420.1404349-7-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MiBTYWx0ZWRfX50W+qy91tOF+
 m1GGf5N+PetpjUs1rp1o4Lpd6JkldF/RzW5wRdCwEGj25NC60oAszjQm9RTVkAO8hPF9ZkOClkV
 v8esmXyNrarBRbv+CFYK+hqmnN9NE9SzKRXTA3wCJJEijliaEiLX49h0HddH5tmw5jX0ZG5IWZ9
 irxd1UupxRswpawQJbpxs03hi2n5TpF0ksIaPeKTQyn4ZLHvaXfmYL3jAW9NOQV5/GuCcgVxXvh
 6zkf9ntjx4uFcn6vm8MU0nfc1DSlzVEFAkLM+GANcj37Awj3jPD2SWWJcL22Qcc/l4bd1uTd2HJ
 M49aolVZGLrRxDYgE1yVTQSb4/etOJSDVDk8pvfZMeBC3kLq7gnhNrhb+Lf3qJ/8HoR4r7G9rDC
 UhpSgr82PHCoaJhpcct/b7VXGsG/DaQLii2ro9bL9tMktgiF+kI0S/JIAvQyhK3h5S+PNDfQRDY
 +rDVShacFPu9yHwxlGQ==
X-Proofpoint-ORIG-GUID: fvbnBajz40KGBPpEUqvG2xmWfkBFkOmG
X-Proofpoint-GUID: fvbnBajz40KGBPpEUqvG2xmWfkBFkOmG
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69aff637 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PSYRucXItuZ608vo30QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100092
X-Rspamd-Queue-Id: 77E4C249907
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	TAGGED_FROM(0.00)[bounces-96597-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 4:24 PM, Srinivas Kandagatla wrote:
> Add audio support for Arduino VENTUNOQ board, which has Headset, Mic, Ear
> and Lineout connected to external Maxim max98091 codec, HDMI audio
> via ADV7535 dsi-hdmi bridge.
> 
> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/monaco-arduino-monza.dts    | 66 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/monaco.dtsi          | 55 ++++++++++++++++
>  2 files changed, 121 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index b6db2a7151f1..be62b3dabbca 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -80,6 +80,72 @@ hdmi_connector_in: endpoint {
>  		};
>  	};
>  
> +	sound {
> +		compatible = "qcom,qcs8275-sndcard";
> +		model = "arduino-monza";
> +		audio-routing = "IN12",  "Headset Mic12",
> +				"Headset Mic12",  "MICBIAS",
> +				"IN56",  "Headset Mic56",
> +				"Headset Mic56",  "MICBIAS",
> +				"MIC1",  "MICBIAS",
> +				"Headphone",  "HPL",
> +				"Headphone",  "HPR",
> +				"Receiver",  "RCVL",
> +				"Receiver",  "RCVR",
> +				"Speaker",  "SPKL",
> +				"Speaker",  "SPKR";

All lines have a double-space

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

