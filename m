Return-Path: <linux-arm-msm+bounces-105045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAlCBjDh8GmoagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:32:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A5551488FF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 18:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A05F306832E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 16:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE463164A1;
	Tue, 28 Apr 2026 16:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEZQmucu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pph9b58S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C711ADC7E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393713; cv=none; b=O42V0BMpT30Pbez306HVsYAjtIPgAWuC0+jL0wtWnVsqmMoeO17KIiMyThrzMxX6wMSoA6Qe/Dy6Zo7EtbE1qSBUbWI5e9tjt2uX4BQRnb4gueh2aZu1XfG9X0OTs88uYFp1g5uLpE41u8XGcLkkIwgg5F2yYHX97rHwfcPQRQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393713; c=relaxed/simple;
	bh=WeFVN8lacIizVOvd6uFGFEcGw/lCDKJvgHmgBE5IRkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwhO9rssCLEp3jAfQhODCEQ0nmbb+G1HYB8EleaRLB+L5PLuRF4L+69WDxTSBfDP75NZjERr0EJwn8YKztXIpugQyqYFHsUHTYNbZpVpLJbNm9Tfl9qIdjp+deYog2oZhrgcZm9jdjzj0a+I0Oa1XO1NWy1VDK4rRRkl9bWGlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEZQmucu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pph9b58S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsbpw2890708
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9kcVg/HkpAwIzD7YQoLEOQSsRjWP+XxJbORsXGW8B8=; b=WEZQmucu4azp0yHd
	dmAI78aN9OLQ/CUAVBHJate84WC+2bAxJScHOJCD+CtTz5Wzc0DOMO0gLPAgN0fL
	RB8NHWTr4ms6SuIjVnyB8qxkOuS8LYrpfXsVTicGeycFayKCQg1BJ1HdkjEPtOzg
	YjdWk7snb77ErJDpwrmKHKdqE58jrjEUW++hGluBTO9yX6EQIkjLiSsEHODlUMUB
	TABDt5EVmMDSSjJkzpbk65c7pSWBay1IVy1NfkxKSVaAdL5HUTLhz6c9FJCatv4G
	SizezklbWzU7BOBAxwO70sfzBEtsOsXxdb8DNtG6L6OPA/bw3rjWVkRXsIH7rmkE
	VS+9lQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgysncn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 16:28:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e136aff17so210990541cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777393710; x=1777998510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r9kcVg/HkpAwIzD7YQoLEOQSsRjWP+XxJbORsXGW8B8=;
        b=Pph9b58SVhZgOJ1VLoJzX/smslS5Bfgy5fv8DpLsa58SSoQMfhYPrdFIT4r48uAOKJ
         0HZrKfErEOnysp6URaKry8iMk2x4DoGRpyjeSuo0Ij4kkCJuoE2DJxUkkMkFrZO0LMuX
         j2uch2u00QTIJhAoavFHFlkZOhFhDpen0ToDIR2vXgBnOLTv7jUW8846WwG0OOsfF69z
         PVTbIsJEq8acq0um3AnaE/RiMg5AJObxImb+cbxUiVCdn3mcp2vdCER+vbEm3BvgSC8K
         muMil8q/yzeH16wJCjtFGkp1EMdiZ720yNj+WAyfYmcISK4iaHrYh9Hmrvsb3vWR91GT
         g4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777393710; x=1777998510;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9kcVg/HkpAwIzD7YQoLEOQSsRjWP+XxJbORsXGW8B8=;
        b=Ma0t6mc4XvzpBDit3K0vj7GRpR3AVV+y/oW5mb79EyQ5hmv/wVygTL1GzYKGFZziyY
         d0jN2jkRD8sjqc97hzLLTQAiUwattdsEZ8FrHntu53Q9KKx47fLTl50k3J8+R/syPkq2
         YKejqF8JuiiFo22X1m6f9uBViIX9c7cFRTVPLUmmpLWPF0ien7gof++AD6SEYLTDyuvb
         3mkK1F7Su554NE5PeBz7EDOuuKx+R0Uv8zPDeKwAmZtZ05+pthwtaeoIOeEgLdtv+byq
         xqSJaS1XohKunBr2fnwTn73R7o1Pj4OPuRx213gUT1vRSrfC2bOZXDdw7MTebXMfIACL
         Ajrg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z6CO42PfGSs7Ym3iD3d+kS4HEHFaxiA4b3m3OqCHNZooY9XF/AMO5v+KCZtcxHyaip5b+EiK46iBEtRAQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkwbzm5t2rTkyMgzXfaOf+hEq2wgpYxzUtY14GXMtH/TWfEXG7
	3aZnZP4gNXvW1wMNXI0dwOv8nwSPhAwsyLPU74Eqq+wZDWtZO2L4OEIB4d+8waYCRYfm1oesTsY
	pI0eryqB/hfDdoFJVn17bac1nNdpdkBEM6BUn/gZppHuBH6pg8EkYEheUZmpumSbP6B9G
X-Gm-Gg: AeBDieu2u9GWhp9JLz6a44fv7SepXj0WeS5Ri+IHbYT8GlEDoX+Px8KY8M4t84Md770
	Rac/oaYzWxZiPjOzBfVZhD//txuuNdGgIGpu0lEEnpWv/+z3SyReYBy+yNoLz9+ICbkqWjLX8Dk
	JcQVTziZ9DBaAVkd7uypCnMNApfVPZKgQF9Hqt2cY/YEB618E4dLeQtBDLsBv6/txC7Wrqe75Td
	5vfe9eGjO+l5U5mmxZ0mG3Bgbpp5T5EnzFp6Tw4x29aJXucrNyDIm4qtCgPDsVE2DOkX3Dft5DU
	+dG/yS6oFP8vXdxPhpO4vCAmn1KyK8fN/KXcrhcfAZ77A3YSokolen9KAs1MPQBrj+aBKi6Lb+D
	IRlu5QrTN5DINHpWZyam4blLNLfhUHzajwIXbfLby37/dadMnuMZA3Ab9pyU=
X-Received: by 2002:a05:622a:1a93:b0:509:26f4:64e9 with SMTP id d75a77b69052e-51018a861c9mr3528391cf.51.1777393710351;
        Tue, 28 Apr 2026 09:28:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1a93:b0:509:26f4:64e9 with SMTP id d75a77b69052e-51018a861c9mr3527651cf.51.1777393709727;
        Tue, 28 Apr 2026 09:28:29 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100dbaa48asm20225371cf.29.2026.04.28.09.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:28:29 -0700 (PDT)
Message-ID: <ac91a635-4aeb-4fa2-a00a-0e3425caaea4@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 18:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: Unify user-visible "Qualcomm" name
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260427070127.18471-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260428161444.GU900403@horms.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260428161444.GU900403@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uc5NrpmHqcY0hEC7bGW3SGW8xr3FIRHC
X-Proofpoint-GUID: uc5NrpmHqcY0hEC7bGW3SGW8xr3FIRHC
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0e02f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MpKeM0OtTd53jt1D06MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1OCBTYWx0ZWRfX/WjTq2/V0lS3
 BGbmZ9lYmDqwlQGpn0Vhrb1sdu0zkzAzgO2EjZTX5F+bOvsUAyxqdXON5rrPA9J61KGGT5x4zaA
 T4MLVH/dSoM8eH6dBvPI8NmpnCEXoGO7dxdhL/Vqk8iT4Jvih75/AgLpZbh4EA3txqKqgSvWg05
 zTMmeSigRc9cEY3D+I0k3a6tUokgiLR/xRue8WLXaZCnF9E1528EMpvdPGWrV0YByRagz+zG2hk
 cVgA3WdDRRiu5joZA86zNYXfnTQCLATdC6+TZddAf0nm2Ruf3LtnfbPMox/4Et8uOFnn3B1xNPN
 sifzQol8yHWR/lc+QLpXCIVwh12XLvvifwvvA3adcfaSc2USz92kQPy1vuzaiM23b4+IZuCrBMw
 cRd7Nm3/BUhBaivGgkGD6voCkrPbiAw+iIGD/EJwlQEE4lNoed0L0Yatso6c2gGuG4TE4fQ6ZVf
 bRrKK6r6o6va9uA6SsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280158
X-Rspamd-Queue-Id: A5551488FF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,oss.qualcomm.com,gmail.com,sipsolutions.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-105045-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 28/04/2026 18:14, Simon Horman wrote:
> On Mon, Apr 27, 2026 at 09:01:27AM +0200, Krzysztof Kozlowski wrote:
>> Various names for Qualcomm as a company are used in user-visible config
>> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
>> "Qualcomm" so it will be easier for users to identify the options when
>> for example running menuconfig.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ...
> 
>> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
>> index 88df55d78d90..958dbc7347fa 100644
>> --- a/drivers/net/wwan/Kconfig
>> +++ b/drivers/net/wwan/Kconfig
>> @@ -38,7 +38,7 @@ config WWAN_HWSIM
>>  	  called wwan_hwsim.  If unsure, say N.
>>  
>>  config MHI_WWAN_CTRL
>> -	tristate "MHI WWAN control driver for QCOM-based PCIe modems"
>> +	tristate "MHI WWAN control driver for Qualcomm-based PCIe modems"
>>  	depends on MHI_BUS
>>  	help
>>  	  MHI WWAN CTRL allows QCOM-based PCIe modems to expose different modem
> 
> Hi Krzysztof,
> 
> Sashiko points out that QCOM is still used on the line above.
> 
>> @@ -51,7 +51,7 @@ config MHI_WWAN_CTRL
>>  	  called mhi_wwan_ctrl.
>>  
>>  config MHI_WWAN_MBIM
>> -        tristate "MHI WWAN MBIM network driver for QCOM-based PCIe modems"
>> +        tristate "MHI WWAN MBIM network driver for Qualcomm-based PCIe modems"
>>          depends on MHI_BUS
>>          help
>>            MHI WWAN MBIM is a WWAN network driver for QCOM-based PCIe modems.
> 
> And here too.

Yes, I did not unify every single text because I believe that might be
more churn and not that much benefit. I think it is more important to
have a list of drivers in xconfig or menuconfig nicely organized and the
help message matters less.

But if you wish, I can replace it there as well.

Best regards,
Krzysztof

