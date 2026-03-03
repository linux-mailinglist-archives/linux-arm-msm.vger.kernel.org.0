Return-Path: <linux-arm-msm+bounces-95103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLfQGjS3pmk7TAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:25:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 736E11ECA0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 11:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C163300BE87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 10:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A81B39D6CE;
	Tue,  3 Mar 2026 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zpq73Xnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iKxrNAj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07038F634
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533537; cv=none; b=I55MCQv27T39aqjFx67o8Gt8x49jmwWqE6ZauT58H5WGiXF/4hfUPCV5UTxArCV7nyRYeVNDY5QpFiv2gjHNQHnDup/AhqYktiRnGZ0FuswjMDjuY5o2CZGow90dMjaq57+ORGQcBeLkj9zFmjtGJtLocEGyEQTDhJ4ccCASufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533537; c=relaxed/simple;
	bh=1bbuAYHkgyOltmSdG+a8M6FutTv6NEJFd4tufC9v5R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDavQdEeo+9XYh510eHUaCcftC8wO4uwQ0h1cbuxH0/6QDbSl1DUlnf0vMY2F83aqAmdcogj8KUT4E/QRC05+fDGnyLaOrQpjhTfF0DXjhjvVEI9UJ4IgzIBcV22h/yDWiSJypHULdlBKSksYRXnjkfi3LexLJ1XWiNW2NQHFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zpq73Xnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iKxrNAj5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mhZr2728659
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 10:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NjXyhMbELuv2Vib8gbhLp2svnsqseY66OaXHBiR1dM=; b=Zpq73XnddCtnFxL/
	YXpuq3CSFOFE5ps0FezJbmhovfIkOzzYX5+PvjcuN5tGplP3LvvUVUzMMBpCd0M7
	DdHJQDS5LLP3q5bh0HW1q3W30xCcJm3EvOJGtPWD0XwTy/A9pK9WOW3rcux2WN+I
	pksKntrTkPdaUsMSPkJAzvZQqDrNMGChHvd5FBlioOH+ovOREQLeGmeOhjWPT1lY
	ntXL84AMQBDt0KESEMmAMG7VvIMLdqJFPM5QOnsp3Ghmmq7ZLo9WqT6XPzGbJGQZ
	yBqHdBO/HUotqtJsSlJ8Euadjdcp02AZ2xs6MlMXYx0ocoBRdmcPQrPTtdJDMmw1
	FVuhZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe0wkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:25:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c710279d57so452023885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 02:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772533534; x=1773138334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6NjXyhMbELuv2Vib8gbhLp2svnsqseY66OaXHBiR1dM=;
        b=iKxrNAj5mndWB0diAYK4nslGak6AbgG0GcmFkq08rDSbwIZkmoLhus2c6eI/GCwmBP
         deiL8rEbwyd1jCO5o0ejM4qM7ynOl+Bd5TtgMWK6d4Q4RI6P3pGM+7EFsG6zWY6pvHoO
         F7UCQqOxxMFwc8GgX1e8BAt6LmzcKEI6t0rFoNPjE0q2PB/laYR/HUPASK2EAAHZSYlq
         532z/w56EPcBbuS0Mv/fmnfzhHpaJ1EqsHvfzXEWZWyZqgBx40f+/WtQt5mnj9ba4CBT
         Y9y+ez/eFdwULAu+Ehzm/naveKkrUxhBVn/sk+ROH70P8LU6syhQNHv/TwYZtFm+JQaC
         qtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772533534; x=1773138334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NjXyhMbELuv2Vib8gbhLp2svnsqseY66OaXHBiR1dM=;
        b=X2Kud3ut7dinAe1W1hLnw0HxNyaWy4eX2AJZQ3XYyxgZ3TGVvMm/k0uoBPgiH0fELi
         f/uIFf+mMqacTJGvZ2/QdPEx2y7VJLRUhr6nUgFU9FhESB5uanZW/8TfiYDxVeLRH687
         onvVGzjeRf4iA2rrFjacFN94tltNkpwcXknw+1p951oKb5UlMCNfQQUVe88W+O1SQG1p
         4CSO6EYa6L6Pjz5yXNIJzJZtY+P+mufJXsoLOSjFfU4comn5E5qaVI3/5ReDmO9BlH2k
         75Cpc6AJCfgeY7mgQS+6cB0AquPTsHyprrJgxVaUg9OM06BPxRQm+JmOf1tM8dme+Hi2
         bCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy6gxdDRd/+GEeNOJFO9M5R4IOiYEEoQFh5an/Ri7joLOIItOhRVQqxIZ1MkcHsCfhFgFHw9SDXfvhP1k2@vger.kernel.org
X-Gm-Message-State: AOJu0YxALQlFEUUOvtROfwZ1aEBmr+2wTM9JO42TkZRPzY87oPb6ehXn
	b4sUx3jQ94egaFwzIeiywbd0rqEv84eLjx8/dKi4wQkxZkjhnbsXmAXJOa/y5guXOd55IA74u6O
	1KlV0mp7hneVlsozIlJy4l5mIC3QUK8CerRTwQ/yhkESSnXbNUniArwMX4ihJEjcN57qt
X-Gm-Gg: ATEYQzwdHK4XJhiOu32GKK6W9kkGAZVOpmwyUH5mPrF73R3g7f8Mwa9fFV+wgQ22PKp
	Z6a9QlRTSfvfU3qv6dp3u5dKldq1bvgAleNpa0az3aMuwmCAoxVA7eH6DFqvKFeGpmQPEEVi3Fy
	l048Qd6LRlLXlt5TUWc3F7K+zSUqmhdcBnIBk9GpQQ2+Fa7OMaCnihYASSoUs8Nqnl2j1DzDpoO
	y4qbvFh2UV+zLyso7VgRbk8lVFMYgVclEjwLjMD4GAtZcs1tfd+WJZo2zFLVeDS2Rs/SJJgMAgI
	w96lX0lOy/97fsbH6bl3vBDDL+qdoOeMN7NKgG8mGSzcswJwXR2+tELLMv8m08z2GKrFXYxO0O2
	yPHiJXwM+MnOQp6sfABIhMpEUaEtrWIVI6TegB30s9W0ZtVGL4Xse2QqZxJMUZIfguesObiEeYm
	Q/0yY=
X-Received: by 2002:a05:620a:2806:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cbc8ef417fmr1520690685a.6.1772533534022;
        Tue, 03 Mar 2026 02:25:34 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cbc8ef417fmr1520688085a.6.1772533533528;
        Tue, 03 Mar 2026 02:25:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae612f7sm590393066b.36.2026.03.03.02.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:25:33 -0800 (PST)
Message-ID: <df538e4b-026d-48ef-a50a-7180cef9be84@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:25:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 3/3] arm64: dts: qcom: glymur-crd: Enable USB
 support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
 <20260302-dts-qcom-glymur-add-usb-support-v3-3-883eb2691a0d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260302-dts-qcom-glymur-add-usb-support-v3-3-883eb2691a0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: k2apwElYKNE-oLF1W1_DyFJu2blKs8u-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3OSBTYWx0ZWRfX7wxEHDcx70J+
 uXi7g5GkVB0sY8/eZJcPhrAhmkXtqWKvbPx+2rePLs91M4+ozAEQgE7WLINemvOj+S5G17nZFqW
 lwBIGrufjT42J9e3YfWGp1HWorKlwgIwwysxRIZq446sCSR9TgMmkLTSA4gtb9ICpD3cXYAsdZG
 NRX1PQSR/ppLxk3k/DgXMFeElNQhZCZsMtz1mncducd7wt66w1Pf3a0hUnc8Obchpd2O4D0hgcz
 9cW10L2NYkkq+Ed1iGIE6oKVMFgjU7e899WMthTnLF97IZ4mkYd0sx1NAby29DFPVZusxDdMaws
 S1LcbmXDfTVbAQ3hhHzLxBIcsYp9iE4qBchBFmfKjj7NWrUL2XmJW+Su95QQu9e3X9XbTG32tU5
 eUETaGN8AlVyWbV77R615cLVOvyKRAgevstxVz/w2utebfyMeWJV2ddYbknpj6zkP3KbGy5cqlX
 o3ab8K6wWib+uXenWRw==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6b71e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=01g4Aj6GVqNSfurPf18A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: k2apwElYKNE-oLF1W1_DyFJu2blKs8u-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030079
X-Rspamd-Queue-Id: 736E11ECA0D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95103-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.47:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.43:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 6:09 PM, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
> one USB Type-A, and a fingerprint reader connected over USB. Each of these
> 3 Type-C ports are connected to one of the USB combo PHYs and one of the
> M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> via one of the M31 eUSB2 PHYs and one USB3 UNI PHY. The fingerprint reader
> is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> eUSB2 to USB 2.0 repeaters, which are either part of SMB2370 PMICs or
> dedicated NXP PTN3222.
> 
> So enable all needed controllers, PHYs and repeaters, while describing
> their supplies. Also describe the PMIC glink graph for Type-C connectors.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +	ptn3222_0: redriver@43 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x43>;
> +
> +		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +
> +		vdd3v3-supply = <&vreg_l8b_e0_1p50>;
> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
> +
> +		#phy-cells = <0>;
> +	};
> +
> +	ptn3222_2: redriver@47 {

I'm not super content with the _2 suffix now, but it's not a big deal

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

