Return-Path: <linux-arm-msm+bounces-98454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH2MNwWXumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:13:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EEB2BB4AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F19E83033500
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC77E3D5254;
	Wed, 18 Mar 2026 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6uoMOiA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxJLUnb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F0837649B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835914; cv=none; b=DOt3n3r0JvvQjJybAYAWpxCUXQqmxLIOrxcDod3aVz1EdXlSlYJwEv2CSI7DpqFRHhBTK5EtO/CEv+SWocGqUZrrJZLabVnBDEYCpL87B6tNsIljFA8EdE+S+awgaWer3rdjgkxrnDynMkGF/CmdyHbDLS/L9bJenvQKURVHVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835914; c=relaxed/simple;
	bh=7JVSjoOtiQSK/DECL6RBLppzIV3OkjbLmIX8urcjhjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8UR9AzRW4XdO7517VrLuMXhfJrJn5cW8JIAeDmBoP4EltmbB33YNvzqLEK7QSUnfAQoTlIP0M42rvxvtuTvg2UriD3Q8mJiNi8CJx8aMIeFdIdYb/gNwH6LtaM9glAyKLpbK5lxEDbMBiuT4qdxoVGR5VfzpxR6PEoq4xSzSuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6uoMOiA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxJLUnb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IC8ol81459060
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngvBrWAIfRBCiYX+5hVtvaKYw/3muQ2zZpexIV767xA=; b=B6uoMOiAThFe4Hh2
	hpi9zx4i24R9TWM8FGLxcbz8HoEVdbkxvrEIzNJsqgXyrzhTCTyXyMf3jDiTXlmm
	lJGWZwjNDHDXDre3bCxFp9CgKQkUOEMJxUQJKirShb9j50NS0CnRrIzcmD6igjbu
	6sctH1upSmHzG1HMFDxRvR8Ub3YN5UCocY/+WGNCAPDcYvfIqtvnfYHfoQj4h+TD
	vDzmPyoGgKP1enMyJmHv1AvM1z/lvmoh1Kx7vUBd4CS7woZ+cHuiKRUFfHSAsb53
	Pbczgig1Udqff/F3ULLVrpcHb0p/8PU8SuUVZth+/h9eIWuf1xiU4KzpHxQQqOGU
	XD7vPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut180ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:11:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50906758d71so35039141cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 05:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773835912; x=1774440712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngvBrWAIfRBCiYX+5hVtvaKYw/3muQ2zZpexIV767xA=;
        b=bxJLUnb1SyEL2oMUi3igP57abEFtaLX6kGUKNt0qsiZq5eQ+SbG9XEr19WCmrXDBla
         j3sJULtTdKAK15d+mLP8CLXTUwUED/JNaD1AR6c21J+WQMrJaKcR8Q+zZ2P6ciWz70ju
         ffoPFp8jdqpMQA9kiqXlNUHTFGxzd/jOLtBIyJtbw/PQGHLtOCB1Y40vtTuDbuQNth+I
         +BCrs9+uFzzExXJcdHfgHLvMf8j/izttzHEphBqZ3bI4YxYW6y7Z0Dxe1NP0bL1b3GKv
         nEo3ZVBhv4jtRHg8pXQYwSXiL1MPgk/V4o2waBZzfCxlOoFxjy6MeOq/+Q1RUKmPmKR9
         20Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835912; x=1774440712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngvBrWAIfRBCiYX+5hVtvaKYw/3muQ2zZpexIV767xA=;
        b=flJ84Hl1+fU8Q3WAIYZhC+Oc5QpzrBqUHZaH3eg8KC4RIHPJPCSFmMau9B/paKVPqv
         dSreXAvy2x02SCdujvuoLwLb2raiyKskzdHzHhgMDATdmjE29c49CwCsyBAhzKSh39ka
         ztAvjho37Nfj9Tl/+RF/BGezL5FY+4bNJSQKWpQ5Llhfmnpi1ogPM32oEMk3O4wtPAxR
         YYaRK3I8a8ttZH/71NN0QasuwLyVn5/2rqeM4K/qbduzih1rrizK2MOJi4xbgZ3ZYs/v
         wCuRNenottqZ5a5IyYWJXJRTlq1hRD0V/Tku0jPsC6OCSkMc9IIO8AlBSjDEI/ZAha3b
         BATQ==
X-Forwarded-Encrypted: i=1; AJvYcCV284TcC7hVVHMrzS65z2oh/5CeL4BEp0GElVhUWzXxNo7zvYAR2gDNf2bSSaV3UJjcZ5Ga3S/+v27b8M3e@vger.kernel.org
X-Gm-Message-State: AOJu0YyQYzxtHym1lPJyrwfnm3emyCXu6mI5ExgK2sq5JtEgPq6dxywD
	tfrW5OQOXfd72ASpnMGqH3mcjOd4kIxMlJpizWB22ljlEYtyX80azz2S5Wky2PEXpmsCXvLjz/1
	9Xs7IuHnu6CuGJ5oJ/nhjSdE4a+VDvg9sdSxCRKHy30S6c+eSArAvNnnpgJcLhhQxQXrj
X-Gm-Gg: ATEYQzzbj34zCzd8FpdI9DRhFy5ixX15x0Mi+AqRFMIWbSH7WKrr4b6kU62aJE9hH3l
	wTr5pCoHnq+1uNjSLhv6t8XiqlyPvj4K47DJ+fBwD6ZiAeBfvfTqcYX+5HA3ymhnPTMlf/62Xyl
	sxstugT1q7uZJbkYYkiU40l+vD7LBgTKxi5OrlBszVE+iy9UqPXv+Kd4QqbLd6BraeMODYEAwsi
	442iQyHSl9qZQWAxcInMVyKE5T0i8k5c3fTfCIhfbUZuIDTekxOalSpY6xaID5iCfinvYLkQQE1
	jQw2bbs16W7vTNBu5BERQKOtL39549ftsY3MGhVfMBjcjrWcHh10p3phDYX2aSIll5yP0sbD0Qj
	NOwnLt320t4LYnEFCyA3oCUJtIvfE5bfj+IuzEcNW1lQEAIyy+iPDY/gjhybI5jBL3/IqW54M43
	Y0Hd0=
X-Received: by 2002:a05:622a:44e:b0:509:911:3273 with SMTP id d75a77b69052e-50b148b071fmr25254251cf.6.1773835911773;
        Wed, 18 Mar 2026 05:11:51 -0700 (PDT)
X-Received: by 2002:a05:622a:44e:b0:509:911:3273 with SMTP id d75a77b69052e-50b148b071fmr25253851cf.6.1773835911170;
        Wed, 18 Mar 2026 05:11:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16868cesm189946366b.33.2026.03.18.05.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 05:11:50 -0700 (PDT)
Message-ID: <5aed6399-fa0f-4a18-a088-746d01b463ef@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 13:11:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add front
 camera support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-fp5-s5kjn1-v1-0-fa4f1c727318@fairphone.com>
 <20260313-fp5-s5kjn1-v1-2-fa4f1c727318@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-fp5-s5kjn1-v1-2-fa4f1c727318@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dgvEIcNNPohJXfLs0HWiZ661l62pecBo
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69ba9688 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=tpqq6vtDi3-i3S22qn8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: dgvEIcNNPohJXfLs0HWiZ661l62pecBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwMiBTYWx0ZWRfX25SOxm7o1YQG
 VPx1fEKGJSm54wNuQ1Fg3XnTo5fxnbeDpfMeD8GtGWHtVqlcVQiSdM0nb3dAN0Xyb8NpTaGUX/Q
 jCg8QIHTMi+DCOWRgGkFK/gFs9YZ1nBKBXxWf1y87SzATMh93bMoAxfTIu56iutSdZXHALFLkmr
 nzvvfEJs7fwAto5CW9+XMZ7GwZDQikix0Uwx/pXw4W1YGv+oW5Px2qQyesf/iUHrcnFszBqWaDc
 9qL55tHeM2W3TBbtEAyd5R65xHkDvKA7iN2jFUCEOpxe4kRK62LEgLI44RyZ9M9/ODvTtGbA8ZU
 1FIJyhTiqFJGM71VXAKG3Hc3wVIIrokgWE7P0Dcoc0Pc+TL9M9sjnr7ZKyIhSzusy3pifG6XgI2
 zy1mUe4zjWv/uNE9OPVXG9VRxtDPjR7nf9uEXUd7eDa9hoWHRrl1FqcpTRaQ16/JD3Rk30q+MmJ
 OBbTtoNN8qZjpIq/ZCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98454-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49EEB2BB4AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 5:00 PM, Luca Weiss wrote:
> Add and configure the necessary nodes to enable the front camera
> (Samsung S5KJN1), connected to CSIPHY 3.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +	cam_mclk3_default: cam-mclk3-default-state {
> +		pins = "gpio67";
> +		function = "cam_mclk";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

-> soc dtsi

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

