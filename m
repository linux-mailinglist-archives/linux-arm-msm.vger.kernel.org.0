Return-Path: <linux-arm-msm+bounces-81016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AA80AC46CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E6513491FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0017F3112C9;
	Mon, 10 Nov 2025 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnIKMiJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7/DrDrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C16E3112AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780425; cv=none; b=FMaLdxAN85G7L2tzGsHk4Tp63n3ZiC+mxUmI8jmS7cv/DO00uEm4gcuZXCNfnCpbSjl6nXoL5ZXKB3Nde6K374i4bj0RhbPI7FIFMtTPuuQH3uaPpq1j0lUrnt2c0LF7teZ/ZpOeUcjzUgkfdW+JSaVldmmxozb9YSqV+gaZnTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780425; c=relaxed/simple;
	bh=sAyJEnQpOE+CyoPsEVV52oBcegXRqpcGw3Hj73SO1gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3eU8Gn0A0YFNLobtfXohmQ7bCyRbLmz5ufDx6zX8qmorsjb6Y2j8qoC5xJ4jwbbRywuPZ6YW+uN/4xLm3UQJ4KoVvpQH0GJC32kuUMHhDBDRkXUXFejEpDcbO1egalyPsZWvDhvhaCIWwCtiJ1VqZrmvWrwK631tiEftfouOwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnIKMiJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7/DrDrT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9EpgR2993118
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zf5by7v/g7p+dvGHpfj+j+RRTgR0OJ9Fd2rr/ysTKL4=; b=FnIKMiJ6Agw8Bw7d
	D5l7XFqGN2+lHQ5BEbn0Fv4yo5kBF3fGxUt2j7XPo1HEj7tPwE0dJdcVtcFMsTqR
	nB5DTif6JbwYoEPpvCgCRdhnA66hmCfwRCmYKd4ww+ToVJmDCyFipto/RkoVRccF
	lYgdeyKMb7HCLa2kjMF/jzv9vtmKR772GjPLCZStXjLIoc1lJh9N0clrNKtRUtYI
	R+/6O1HIJaS94oRRCigXi8mfz/Jf5oDKU9qWfrYGwaaU7WgxKPATGra8H1kqx+51
	ZqATOwjTJi/hsTm+beLsCseKwe2j784oW8mFVWUqZ1VyschZpGpcUw9VTYUN1Oev
	9AhXGw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88rp1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:13:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3407734d98bso3931493a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762780423; x=1763385223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zf5by7v/g7p+dvGHpfj+j+RRTgR0OJ9Fd2rr/ysTKL4=;
        b=F7/DrDrTohOcSHx8oxMgWQV7l0XZ7Svv1IGwC0DJDJgAb+qdunIhWtq5qLQC05sYGY
         GgdNoHyr36DyWyWAmhnw9BKxXThjvE3MuHnEOYA7ht+iAVAMaNN+Pc60scfGKz4Lf3h5
         N3xBZH8ZSTaAvz56Y2/4SHi+UbMf2L3TcjC3IycIGHhNmIYXHM+JutlUj6IVL+Iwuibn
         jVoEE7yoLRAABLybOHFoKuU7sMJ4hDYb2y/HHOFmAYEPa7RA5v4GZQyc6pHb+kYA/16H
         8qW7ySCSHqBMRq/KnTPNjYqZO2vyydeO+K8EVt3oDAV83uWGhWs9rMSSDhHssJPogXoS
         zYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780423; x=1763385223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf5by7v/g7p+dvGHpfj+j+RRTgR0OJ9Fd2rr/ysTKL4=;
        b=CNZAy3M7mpxd+IW8L1C5YDAulaIkjl5HyeOl7FyfZY28+r9vLYLscrs93Xj8q8UtPU
         GEW4akRHfQ3FAhBIBQt4AdA8tssxpivzq638Y4sKWTlxUJ6YOjOgL5I9gc3ps0eZ/W0b
         MfaZFrWBTXN/PheGaU5YGKVZtASmQJYV9hsnNcaqzP+MYcSI2coR5KCxI4p0ovTOXO6l
         kztj52gJZ6tp6jKPsHfiLZMXfMqckQp++vbUR5cHiYCftBb9zCD9ZEz04QsncxZACkzO
         +tLwwt6MGJLPhlErQNsXo0ekRsPY88ZTiDIqwLmMW6G7jdhg7AuxURK+MTtfMCiFEA7x
         cheQ==
X-Gm-Message-State: AOJu0YyNeUn6CCEnkc5ixL3454GRPmv2lXdvLyQ5kcxv90kfRbh+w8r7
	/BCgasfgQJCjsODyZn4VHUl1V1fr1TMgWtyxteik60V6nZGvFFJJaMSnxoeBq4PT/XVxeMg3GMQ
	bTLQgTzxfILl6TDyj10EmmwetTNWdb7dGHSwMzElm5MsO1X2MddRsF0MtaCnOB691iEMt
X-Gm-Gg: ASbGncv6Hr/cKSOGk+4jmeFcogbjClp92X4L3jo/j1ldHkn0oU54V2X+SB7IO6sHL4x
	6boj6MqEe4Wc9GkZSrewQJE4QLPrnuodz+RXhJ/FmNpV1qo9jN4dAOSNDkiCrH7TpFUVQ058W/A
	Trngk0tXgwKpy4/R43vkzuxdzLFDxYi98ZRpTjbZb3nTERygDVc7foyIIDTBXkkm/CHT1JnzF//
	liyUZ8HbJEUEai8XwwB4hsjt8YiawL88hHYT+btxs2cfsavZku8jfZKzI8pcKM1BpRRsCq8NjsE
	DTyRVHoMrjf1OfX+j+Zrx6TMeRKMel7rWqEVKLL80WPXP+ovV1/MoGJkCuwvfrgjzWazY/+BKUx
	imaqOiB7mKNPaxOZ1f9xjy0R6dVlP2wY=
X-Received: by 2002:a17:90a:e710:b0:340:ec3b:b587 with SMTP id 98e67ed59e1d1-3436cb7a93amr9070691a91.1.1762780422765;
        Mon, 10 Nov 2025 05:13:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpxzKYemCJDBtZNVtT/gk1VWfrU0u+FC6zzifoWeyFyq0P4Hf5egp7j8ghzn6uNZubwpXZ1w==
X-Received: by 2002:a17:90a:e710:b0:340:ec3b:b587 with SMTP id 98e67ed59e1d1-3436cb7a93amr9070654a91.1.1762780422139;
        Mon, 10 Nov 2025 05:13:42 -0800 (PST)
Received: from [192.168.29.63] ([49.43.224.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17a688sm12007008b3a.40.2025.11.10.05.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:13:41 -0800 (PST)
Message-ID: <511ebf46-63ed-45af-9d66-ccd1d944763a@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:43:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] schemas: pci: Document PCIe T_POWER_ON
To: andersson@kernel.org, robh@kernel.org, manivannan.sadhasivam@linaro.org,
        krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com
References: <20251110112550.2070659-1-krishna.chundru@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251110112550.2070659-1-krishna.chundru@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7znmyj5kM8fNoY6ci6jB_JbOS8MMnesE
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=6911e507 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=08Rv9HEMxtlCNW7Dos5SIA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SpA6wshyjLPcRYPzmHsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExNSBTYWx0ZWRfX2zLxDlGIoU3C
 8z1M+1tFWHqQr7uQia107Nho68nwJwfZaPRuUxEjWsSoT/zB/SvQLoOWy/NQjjSWDp5VEJb4T8T
 eNA0Oxc3xcd9tNZUJSdtbjbpu8kOAKMh2bnSjC855OC8CcapJHtlLGiDCWau/33Q5qmPHk0BrZZ
 vMRgFm6t23nY0Csaj1LKiyj8TAoBDSWD6tV5go2s0kKlE2mergbakccrczNkr0GYvD6//t2G7cl
 2YJNlCOPP2IhwBR+rXG3hEMmYG0XvbXWyL2Yq54TLe0mZs4sxb7R+JGNUQVs2HENbwKRfQ8bEOa
 TwtiGkvj99nNHFHcKBWL1FZDyJKchEJa86l1ztbAvFGXQFkHNDFj7w0RXxc7gQq6/4L0u4NvRWw
 spETyBTlTIQxig8YYs5DKWluUoizqA==
X-Proofpoint-ORIG-GUID: 7znmyj5kM8fNoY6ci6jB_JbOS8MMnesE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100115

Please ignore this patch, it has some mistakes which I have sent 
accidentally.

- Krishna Chaitanya.

On 11/10/2025 4:55 PM, Krishna Chaitanya Chundru wrote:
>  From PCIe r6, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
> minimum amount of time(in us) that each component must wait in L1.2.Exit
> after sampling CLKREQ# asserted before actively driving the interface to
> ensure no device is ever actively driving into an unpowered component and
> these values are based on the components and AC coupling capacitors used
> in the connection linking the two components.
>
> This property should be used to indicate the T_POWER_ON for each Root Port.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Changes in V1:
> - Updated the commit text (Mani).
>
>   dtschema/schemas/pci/pci-bus-common.yaml | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
> index 5257339..bbe5510 100644
> --- a/dtschema/schemas/pci/pci-bus-common.yaml
> +++ b/dtschema/schemas/pci/pci-bus-common.yaml
> @@ -152,6 +152,15 @@ properties:
>         This property is invalid in host bridge nodes.
>       maxItems: 1
>   
> +  t-power-on-us:
> +    description:
> +      The minimum amount of time that each component must wait in
> +      L1.2.Exit after sampling CLKREQ# asserted before actively driving
> +      the interface to ensure no device is ever actively driving into an
> +      unpowered component. This value is based on the components and AC
> +      coupling capacitors used in the connection linking the two
> +      components(PCIe r6.0, sec 5.5.4).
> +
>     supports-clkreq:
>       description:
>         If present this property specifies that CLKREQ signal routing exists from

