Return-Path: <linux-arm-msm+bounces-81604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2761C577CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 571A04E0FA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 12:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D20934FF7C;
	Thu, 13 Nov 2025 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJUNGdID";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYi/NVXX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD2D34F479
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763038404; cv=none; b=aSvZZj+TdwgqBAG3z5vTNBs9F/HuMIGcpyDcmGuUTerM71xJdVh0vpWetRZ3cQZix3PaMfP3qEX3qrgGcMDK/PEx5CBs3vTh88eQma4bXiB1X//htVegs+5VmVGp5GHcijCg3JAxjz7UqnpckMXxho1YKmofN5pCuHLdzhPQ/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763038404; c=relaxed/simple;
	bh=j+2J6ZUFajjytoR3KQFekY2+2Lu/2W4FLLpntE9VrY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWiKpCs9cyvu6F0OVnROgBm45vqEhB/aZYE15a5XFtky+g+0/pOm6zbdItt7ytXc7FdePOeX65IVdOk4IH7Ns+6JBpi/DG2kMjqtgfnrvrR64UnxugxRGngZHpjNj0O9AvJoUB/SpgcbH23TwUSHdjJAt9utgkHvKPPwlDuTJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJUNGdID; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYi/NVXX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD65gWr3563291
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AYyaenzuM4P++qYxmun+3HNcdnK2juXNoveNn5bkvqQ=; b=fJUNGdIDhnR2cgGc
	NgCahAzBv+5JtDaOd+3UiMFrG/ILQpdb8jD9/ys19pEJbnPhp5f5D7B3HbOJXk6A
	ltAxhhuNZ5IwLc6FyYy2hHavyDlYT2U74E1V0eq4fhDKBg3gMLpdrZ8+3tX2x4jq
	pkb5NDoRYzrr15DLMOsy9dzq3bMuOSFHoqLL2IGZ/b8CbUr+GsZAvwMY1fkwUxOY
	T2cnPOWr5tpASKquvp6c/5650qFhDq/MkfCOuNfCbjfIuuabnXUH6tAtWHHyL0C6
	llkcZ5VIGvZS6nisG0pJ1HxqxQxPurHk6IO3heC+6/hcs8ixc3pGMAU7dw9uG+JW
	AWnK4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvh620-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:53:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edaa289e0dso2298741cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763038401; x=1763643201; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYyaenzuM4P++qYxmun+3HNcdnK2juXNoveNn5bkvqQ=;
        b=UYi/NVXXDgbR6YkzCToUljkUX9n5tQX7afAabiR5YmXKAIl+HIlqR8kjvkqPnXvD3d
         IctJXAdf8f93PbOsqN8IQh6AYiiBKdd7U8nJUkGz8Cb6JNtkwctVJ/bFdEYIfd3yfpZ3
         mEthWY0VDpIa8fLNYonkD5OR4wnXZRse43vkCx42u1Zd90hMR55QQwgIGGREVaoT9f65
         KL4jdHFnSFjgKsO4iP48E3xx14/ITRF/bnxzK2fqNqUMFPdnEGz2RDmILtmk71F/NMiP
         FkRSp7gNkiWqwIms7qxYiUowDuCzbCidHrPYtVTLm9tRTOvyYh/xfCqYtmMXQOPR65yk
         v6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763038401; x=1763643201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYyaenzuM4P++qYxmun+3HNcdnK2juXNoveNn5bkvqQ=;
        b=XSvSRXKZteArg09uj6NIF83bnSebnX7thC/xcB8Hf6UZaZ4Sfy4Slkcr/cXwlirM0P
         GuuIw/hjaCtgCycE2ws5TInZV5qJQrcWnR514hcg1+G8WBPKlZIbQTutHuEMDfXIrQzo
         0RJwBjCG8zpdYRsv4lBYMpQLfdWpkXq4xvABnYY40uyWOYebR8gPO6dYJTVH1x2xYzQs
         JGjsLp4tHCvJiitn1YoM3zWwSLmBbohdSPwywNfQlZarRGOiJGve/wEjEx+F+bEfEFIt
         VzMuILblQGqNDJgGJOEd4mboket7oeOVcKFx4nQ0uGJWgyozbfA+2sqkQE/DmKVVMbbO
         GBXw==
X-Gm-Message-State: AOJu0Yy5C4XtvmOLLqkFqLSGS16arFZTgzgAI5ZGHKATOzIZr/8zOLbx
	LyP/uelKmbx1wmT5CP3DmhHSRm1vJH9/Wu6poM+pG43cEav3UkqlNh01DZmS4wSS9xpMOtvK9ce
	vfx6AENrUUVIbMUmPvRTAtyGhU64MrHCAg2SJTNJYkb0w6NdF+zFCeyH/IZz57nhs3kEP
X-Gm-Gg: ASbGncvjJ69AUeTRlFbMXozlYoQsDZLFakkiQi9oFyATog1EZSZ8ITe6dolOZdVHLgN
	ArXH+/JsS8ejJ61X9KHGtScqk71uXPKaeDtAyLMk2tj5KzWnUwTe7CHP+zaC3PrzlmyjwvuEOVt
	BjbAHjIPdmMaIDHb7lIw7byLmxFaJlTs78JaI5joIiJAABV0X/elSR84b6d9FtOOoscpr9rlkkj
	7+1RvLTL/bM5YDktkuTv/TEM+5Dh9XMLKE4l+VBKP+59y+xuJeNMINiao36whHXy/c3QV9aPqLw
	v3m5TGjGMng5tGjIyhFAck6PZJM/lAzh7vVeUlPnpMDWPOWTDcxI1LayCHXpCogL5FULYCofszm
	RFs/bOJv6qmQJ7vDIQUO5dBS0JJnk5C21OYBgR89JyM9n59SiSsSgGJxk
X-Received: by 2002:a05:622a:104:b0:4ec:f123:230a with SMTP id d75a77b69052e-4eddbdd8854mr56882451cf.13.1763038400818;
        Thu, 13 Nov 2025 04:53:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjmdNxWA8+HlNYNhMlyELz/tsu9oCrl8hmBZgLJYoGovSIiRTjKkKYNIPWLsy5oVddw257lA==
X-Received: by 2002:a05:622a:104:b0:4ec:f123:230a with SMTP id d75a77b69052e-4eddbdd8854mr56882191cf.13.1763038400393;
        Thu, 13 Nov 2025 04:53:20 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a497f27sm1425009a12.17.2025.11.13.04.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 04:53:19 -0800 (PST)
Message-ID: <8e2b54aa-8838-4613-9b50-29d07bd6e8c1@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 13:53:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Wei Zhang <wei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_miaoqing@quicinc.com,
        quic_zhichen@quicinc.com
References: <20251113055148.2729943-1-wei.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251113055148.2729943-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=6915d4c1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=y28fyX8gKcvqRzd0QmsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Jw4W3Ip8c3rcVEbGeBIbuV173BI9s_jX
X-Proofpoint-GUID: Jw4W3Ip8c3rcVEbGeBIbuV173BI9s_jX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA5NyBTYWx0ZWRfX6P0k5k9qws2v
 4h9HlW5Aqf+jZ4Glq1prgapIkyEx0D6A9Vr0Qup10CIx6z2UiJ/gARN/bp71aKkayGU0sjkp7wu
 C6XreknnR5VEJOKpST7oEHAhr2QkreOXhHNxe3MfvXH3h/oiYGNpospPHNpJAKDlDzRu+ZRWCbp
 nPpHslg3P16BPyPlshu11XeFwstM4hkCa4UaV0q4rmp5Asn4QxH+MWS8QMETSwZl0wtNYAU5xwn
 35myBgsDp/o+0YY3W52OHCrD2O//q/UIGlNEo2hn7Vf/L52M+WlBhNrQKlJ9VO47KWqYfEGADeB
 KjOR9negKE39Mm1UBDv17Lkjv11TeyJzXZR8GSi96YrgGApVsDwbq1uTo79tK2VmvYOxp8/A9Dc
 V82JkeCQGFV40QhMp3AgPohUGS9Msg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130097

On 11/13/25 6:51 AM, Wei Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> ---

[...]

> +		wlan-enable-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;

You say active-high here

[...]

> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio54";
> +		function = "gpio";
> +		bias-pull-up;
> +		output-low;

and active-low here..

Please remove the latter line

Konrad

