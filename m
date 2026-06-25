Return-Path: <linux-arm-msm+bounces-114517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uPScC/0UPWoRwwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:46:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC706C53E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:46:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aKCnrjMK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eFmchs4d;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114517-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114517-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7930301CA56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047EE3DD511;
	Thu, 25 Jun 2026 11:45:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A523DD504
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:45:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387957; cv=none; b=drh59u+3kILVcrUKsBrKHui87wr91tOmIvT4p9UyO1CLoGPxoFBRoHPU1oZQys7vcI7m73swrZq4N82ZieObbVILLsTRyAC+8r5Q5JHFXzreXrtHr47nlh8TlSq2XKsX8/ob7f4dDOfMZ3jpEcQrL3rgJSVTzD4AmhoDdJQv/os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387957; c=relaxed/simple;
	bh=eDu7KO5wVpXqlpuFQGtibVoKwA9rv9uNhIjqKkHb9+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l6isTAlBiJC4fJAmjv2gw6r/l1GO793Ok/lOQguTKVsdBV8brYfBsHcrvG65MDDRwm+aLgux7KynZf5nUEWZADaTHSfNncWD0pt8gfbeEppkvf93myxHZcstcym368SwQXbjGt/s/tJ5I0+3iMP/srmcuoxWeSrpi5YUpCQQuC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKCnrjMK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFmchs4d; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jsMt2009328
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BAcSRl1VLBvY+rm1E0QENVPruUvSrRzM9gP5scU+pQ=; b=aKCnrjMKVZdK5yIX
	bETBOhO6H1ZDfQzhCKPjHdfCoAFlqLsHSSXBQn8CC6bl0jSB262dKBMcbQMrvwDl
	jk3lPY4Uufcusa9MPsP6vMSRyDYHRUHz74XUMOFK2pUOIEAg2HYab0B6IRV2SjBm
	u8hm1JrHB9Pw7W3tMKQ+rOUOmPY9ZmE8n/pLDd6oa1l/XwMjbBo75LB4mymzjsg/
	pL7rb3l39mN4Tf0qJgJE/tD7iyWs4AkRTiSun0YIkLt08hKm6nod450jDWbwgSjX
	xSILhatTr3kZA/LHC7DOgshb+asq+zMtsSIk4msLDGfURca5+h4faYr1YhhFi5az
	Y9cohw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmj0r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:45:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a15cef334so2449201cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782387955; x=1782992755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BAcSRl1VLBvY+rm1E0QENVPruUvSrRzM9gP5scU+pQ=;
        b=eFmchs4dDiLN05SAltXK4VnaG6utoEN6wFa5mnhLVzKJEZlhBaHNtJEf5hys6eC95N
         i1SQRMRmipqMNbCLUiJWmOZ1SUEBFs2tXjauhIbK3s/Lcun45dYiGVedJu5Pgjv+rwKw
         womgwcHi2NhxC9BRtnTB4TUJsLtx2sO/U6dq4PfcV5PHXFUVy8atKIfFn19T4pHiwjYB
         2rJBcsEWMtAKWebNf50SwaqwavT9GB+BMdqrp0XdpQ9BqBjTbqMwHal+UoCYlrgG2zUS
         yUSoJHQK5xe0O463Zt8phsOAyXU6TawC37YSc0icvPaBk8/R4sxdRLWIWdAoyA5nyoXr
         lkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387955; x=1782992755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BAcSRl1VLBvY+rm1E0QENVPruUvSrRzM9gP5scU+pQ=;
        b=X59mimRXhAtIEiAAQ8bHoSh3O6JpnYrY6slbR+NRg8tXqgV+XryM/OcAjZa5g0cmIK
         K1cVL2Wj+b61D/ryvqw74MipOU0I8bq8fCBsXzr1tcCX0usPKA9uaH5HuO9djoUT9d6V
         fR1jXk7HGbFykg6cyBTrw4ho4mnX76GY9AIff+6XBiJ6oz1mFbQHTDibQbNetGJzNyCa
         pMWj/8H8EsdfehpEA8pFlHhHOfztZKy6B7LG5jo6YTQF8uz3nIhv2YXaFECNBNeXi2Yy
         Fzsb2f/cngIVh2FZbPrT5dw2+Nkwz5rc6VWzVGSj+ZvhPQbRVeAfjWX2hS5YChtTdOxa
         j+KA==
X-Forwarded-Encrypted: i=1; AFNElJ8Rhqye6KwtRXKqJWsrJpjmq95rqhqdsKx3odN7Ui4TJB/RTWEyzKCY6yPHMopED8NwIj4W4R4VjOtg6NOF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9wWQYH8ITzgd7b4+64GB/Q+Og1wCK+3rGSByhniC0qsLdRVCr
	OcY0uG4tIv9+bNnKNrZqMUtaWec+yRp00HhfNb0EZPFuw+Agz1OK2zGVlzw41QM8tU4QNlKQD6w
	9LqDLsykrgBuxMzl9yw+D8eycBjeHb85/zcPljMHmNjHFbZTh9sL5Y4Zn0GoTzWxw8X/6
X-Gm-Gg: AfdE7cnVowe9rDD9d+66q2DzjW9UV6A9ZQLBi5JU4LMkAhmt3VjVId3M8zs0PJS+P69
	AtHAxHYS1UPwwOM+57U0SjG4f0904Un7qxlI+w0WxH4lS5ZyTAdt90k5HqR934YbbzX3KC2y+2P
	H32I/CsfrT0RFWosMNNUjKCmAFRhofrwZlgbOrcp88lKQjfBJUIkxNBYic6xJags+L3XdQY/D3J
	OMOnLuTY8aBK/pfFMRh7AiM4TRN4EUFv876Unf+dQKNh2RNb66TMrWtufjOrGJ2uk8HKkalBhJl
	9osHBNVHs05eRpypJwM03CrnNJuf5BhKmEPZEpM2+119moKpaNK9/u/06GMDW74j+XS51831ayt
	A0LfGTR+g4Gl//cOZimfhM7GOUN95n50rsH8=
X-Received: by 2002:a05:622a:58e:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51a7279f2d0mr15663441cf.3.1782387955000;
        Thu, 25 Jun 2026 04:45:55 -0700 (PDT)
X-Received: by 2002:a05:622a:58e:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51a7279f2d0mr15663121cf.3.1782387954346;
        Thu, 25 Jun 2026 04:45:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe6220esm165472966b.45.2026.06.25.04.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:45:53 -0700 (PDT)
Message-ID: <2c615e8f-674c-4def-b789-6e9c445a2241@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:45:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: shikra: Add soundwire and macro
 nodes
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616201315.2565115-5-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3d14f3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jzc4C1M-m5MPkDtnTmwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMCBTYWx0ZWRfX4VvrOGRvfARo
 493Q6rQbVhY+fefa1Zi08yacwZYgyFkFwc2OUIIxSsvgv2GwR+UsImtvIkEI76lJVM3ieu3Abyc
 FfGCfA37LmDh2+kvlA2S0UQkZtdGnzWbNnCuSEkCE8gx0w3dym74nXxG1I4/GY1u/D1sE3d1fhG
 v07i0EwK/bkK2RWtURg1/A6oi95wCvbRf9pSgywDrm2uSnzbpKN3ub7O0KbMOdEkgu4pYYzoQTe
 XCmWqwjyK5RJwNUVpI+O/HKT59fjKHfEWX4Ob5vV2wsERiQQ9HwVRBgkbQ3jVAybXFl/8mkpM+A
 zly5vH0kEA/aVXbz8sRkly6PvswkZDYca0xr/M2G87DuYCZoKPOBZnSTtE4cwg3eXg1BVfw386y
 +04lntAZFZORv//sV64vzPLAmslzdfu3iUpeG7SAsOIfc2+1tvoZyIo6fmjn5ItYe2zjR93x3kB
 cnzp30QCKxRWNLRWTKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMCBTYWx0ZWRfXzUBbvLXEs0r9
 Fu9hrnydYxv8uxDZPMsqT+LWCLwtaUUOBHKqsnaxOgSAULt16u/1/cxR6gRuojYGwo8bAzLHGIr
 +V/R6jK8yrBSfPGD6WPh54DJ8xvdIds=
X-Proofpoint-GUID: x_-uDdu6eZ0y7zuGKLJ0yF0uB7EoOsb1
X-Proofpoint-ORIG-GUID: x_-uDdu6eZ0y7zuGKLJ0yF0uB7EoOsb1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114517-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BC706C53E8

On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
> Add SoC-level SoundWire masters and LPASS RX/VA macro nodes, along with
> DMIC and SWR pinctrl states required by the audio data path.
> 
> Keep these nodes disabled in shikra.dtsi so board dts files can selectively
> enable and configure them.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Just a couple style nits:

[...]

> +		rxmacro: codec@a040000 {
> +			compatible = "qcom,shikra-lpass-rx-macro";
> +			reg = <0x0 0x0a040000 0x0 0x1000>;
> +
> +			pinctrl-0 = <&rx_swr_active>;
> +			pinctrl-names = "default";

Let's move this down.. maybe above all the #cells

> +
> +			clocks = <&audiocorecc AUDIO_CORE_CC_RX_MCLK_CLK>,
> +				<&audiocorecc AUDIO_CORE_CC_RX_MCLK_2X_CLK>,

Please align all <s

> +				 <&vamacro>;
> +			clock-names = "mclk",
> +				      "npl",
> +				      "fsgen";
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "mclk";
> +			#sound-dai-cells = <1>;
> +			status = "disabled";

Let's keep a \n before 'status', everywhere

Konrad

