Return-Path: <linux-arm-msm+bounces-107335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIf2HvCRBGoVLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:00:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D40BD5359ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 739EB320F542
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0244E2BE65B;
	Wed, 13 May 2026 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HPGiUO7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0guWT17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDD12045AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680516; cv=none; b=sBfZ9yuJ2mToLt+Sa8qW30/KbuXhY8FRYeZyLd08q19cbZ6FINrmMeqIwOo9hMyR1Km7+tj+6NnATg0szVq6Nr75oVSTnmjl6i9s/VyUWgk+UeL463DKTZUYuZrQGMNd5P7JnheTr0lxaK9Uxp44Dsm6urkdF+EONHzGSQ6d8tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680516; c=relaxed/simple;
	bh=Sg22Ki1E0LIq6tnDfW9dCTXcNsA+L5xOvP7nRby3elc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgkT0EiN0U+eqKwqwWXuaLTbc+1wsU7J6kp6jZ5hWBiLGo+pA0G5hIX57nk54cUKK4wnq1+ybrDzg2nfF30TMD3IaAP9TaDxV6aSyWmwdM3/hJYjQXXGfCGcAwUeMvd5sn1w9AICr+2V+wZHySMqgwI/jMYOLzVskBuRlmwlVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HPGiUO7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0guWT17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVtmd1393180
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ANCRzftwcS6j7zoWU1eRpFbLwKzNuEIw5aZkdck9U0M=; b=HPGiUO7mto2IzB4S
	pdMQ2NtnSqHjvsYfCLl+JZsT471Nl1jcgMjdDsbZCCUtBdLh5QWUTYpMVk4pNaCM
	sB3o9sM5c5hVHLNCjSqv+be3P8fS3xOc8wORoq+YD2ffudPBVs9Wa+pU/mqSIm8u
	jDu3fusTgdpvFNU76634UXbAlA7bCMkdCZeZyUrYfunaR8H0PjFlTRP1190BQKmV
	tdk2bdtlv4Y33SKSxMH4QKyRC3FAcehaDjV1GwQBfaBZYBzsw6atuSRyXh5Axz4V
	CGhv6P1RLcRlUlGF7NjvjWob/cXuw45qiYJOkuIEpNe8gVPiDnFO1B3aJGspgxiC
	YUFE/g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261xuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:55:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c802545ae0eso4040766a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680514; x=1779285314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ANCRzftwcS6j7zoWU1eRpFbLwKzNuEIw5aZkdck9U0M=;
        b=L0guWT17jOl22gyCnwpnIKpYvU5O1SVQI9YSy1y7VGIuX45mP0pomXiX16Jrfst9+4
         fgLIO7TOlE0tNdfCfjhbzE2tujpbLQ4frFFZosoEQ0OxZt5zfQ4vn5ADUBvZZgTczR9v
         Wlg+8mdDd1xhc5EdZ+dpGqV9rboM95O6owLyPId7yM1/Tb25bm7fLL/u5jTJQupQhLSp
         KX9R3+IOwXnMr1hEeEJrHMky28TP+hl4UPoepkQtx2emZyhe1aKLLJ6zIlTVOn2uAmPy
         aUWVMHZdSjcYUA3XYPn0wYJF42HQ2IBbi5hNBAdiTUSnwoMPfekO0UWJpZW4Y51fYQ9J
         GnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680514; x=1779285314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANCRzftwcS6j7zoWU1eRpFbLwKzNuEIw5aZkdck9U0M=;
        b=cxjnIGKNJu2xfO7H53gX2zDuFLMiaHrqFQFzTKaNRMfv9ZxnjumZa9oJkQ+GeJuVQg
         bdPlLQsp+1EsPEnSukhWj7XoaH+XhTsYak+fwG46jTM6fEcUPV0Osvq6++fQ7R3dy+Nv
         yYJJm5VPXSrqjVZQrth0DdCC4dKPffB5k1zm8tDntV74PbsLmf/311I6ClnOIoWHyqgk
         7uoqp1CFYbLOhuG5bsKYTHAFfOQThUWUwqvt/gjhYFm+ZhGeUEifEYthY0XCDxsRH8Ct
         qwO7CsxOXyn1ELzGqZKaDgDOC/b1qkjf1vywdBJyBH9z8LUofh4s8EZCgQQNmdNmecRR
         7myA==
X-Forwarded-Encrypted: i=1; AFNElJ+1602yFOSsbxnRYDnoPljJ0kSvOxMAS3WvQeZeeSEWJxTWlRdF+qb56iZWg9ti3zoO7ziq3TMuSInWpZl+@vger.kernel.org
X-Gm-Message-State: AOJu0YxHt+oyJkhCU/0rv5ln/KRHcjjrW0Xr4/2e9G3wN9uoXInUefEz
	GtpZUF+qRSeictiacIdjaykxroW+1x/FzroyD4OyfHUawgtC1Msk0yTBetwz7ugAMpa/21aT2BG
	6ekHIaKayKpGZQsEc+lvTOvht8WdBnwzvFTz7w5xrNc6EFUlbEAcfMHlQWGUal6l/6fCF
X-Gm-Gg: Acq92OGIbauhTIZZBbY+qPk9gWH35uQW/w6VLrHnIEHk1G2LARSVNNf2s50zOGHWxQh
	IUQ+ugwglg1nJdINvyXyScx8TTqmpni84JxTQN8f/Zh2dFqEAiq4KQ2npPVYFCHn95kf0jEPC/R
	+qwyHYrYAHsDcF5YEgLpR1tx8PdSQNpkqw9kGtMsjthdjocUm+HD7B6KOhmyNiBr+LJdYfiR+54
	90nOiXEUogMpP7H+Td4o3IBr5pv5vcnRjb9JnlgMQINH0fw2l8DRKpzldmOOSiaEBGcyOPdMZ+b
	8XhRk7L4uJGJYPiWFAlmVN70nYXhzCMQMV7Shl6/I31PQR1/e4VAzWvxXSb8gr7c+UTnb3+l5aW
	6cwwwchlTQIyS7+0hD5vA468D0CXGApyFnJl40mzEV+bLjAHZxw==
X-Received: by 2002:a05:6a20:431c:b0:3a2:d976:2210 with SMTP id adf61e73a8af0-3af8006b01fmr3709086637.8.1778680514103;
        Wed, 13 May 2026 06:55:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:431c:b0:3a2:d976:2210 with SMTP id adf61e73a8af0-3af8006b01fmr3709039637.8.1778680513521;
        Wed, 13 May 2026 06:55:13 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688fe2sm20084373a12.9.2026.05.13.06.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:55:13 -0700 (PDT)
Message-ID: <8cdca0cf-7b36-4aef-bc93-c611611b32b7@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:25:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on remaining SoCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260508113636.3561383-2-ajay.nandam@oss.qualcomm.com>
 <gkgffuxfown5esdo6s6yg4povzskhean5hzd2yowsiyxrpkd2h@oa2fs63ijmym>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <gkgffuxfown5esdo6s6yg4povzskhean5hzd2yowsiyxrpkd2h@oa2fs63ijmym>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a0482c2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lFrEOrpXHASGKh8PcUEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MiBTYWx0ZWRfX7CLWxOErg6+K
 mtUpKqmLwOLvNxI57zQpnr9j3v6rTMU5wjnCuK0AeO2rGzf6yY7jwebB6lYwzi4UP8bpbnRChGT
 ILwUu/EltoXhDdLo9eDJE9N8GfZ2nOeN89P84Id27/N8QsbAqpdQ9kgfOH7xKEJjO0/CQqXXsGK
 tDJ3HVICKemxl1Ofpk5dI8HdWYgjIZS7WUbQ85NTeNmIvpLYPbyUG/PBuu7Bqbrx5w8+G2sJkDP
 kelrTUXA8zeDr+vRb7fQbi6WOJ0gKjR5BWpw0i5zLITjc8pp4KGRj+kkA5dyi6S3p3h0xSEWEx6
 ykN3G7WqO/lkg602S3BBLeVCIownuP7/GYf7JxbglcchSyLHllb5zBk7WLBx7IFqq+wt+ep+Xzb
 TE54y/NlOcX/p52tCm8DI0AvABPOJWeXQW1ahvbUj8+m31eF1hsyFlvJLTRNeIhj1Fszb9TwLWp
 lVdkYtDpaAtDE74dv4g==
X-Proofpoint-ORIG-GUID: 7QUVhISxV9zXBtye8cjhpIN8TvOIoKOw
X-Proofpoint-GUID: 7QUVhISxV9zXBtye8cjhpIN8TvOIoKOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130142
X-Rspamd-Queue-Id: D40BD5359ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-107335-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/13/2026 6:18 PM, Dmitry Baryshkov wrote:
> On Fri, May 08, 2026 at 05:06:35PM +0530, Ajay Kumar Nandam wrote:
>> The LPASS LPI core conversion to PM clock framework relies on variant
>> drivers wiring runtime PM callbacks.
>>
>> Hook up runtime PM callbacks for the remaining LPASS LPI variant
>> drivers so all SoCs using the common core get consistent pm_clk based
>> clock handling:
>>    - milos
>>    - sdm660
>>    - sdm670
>>    - sc8280xp
>>    - sm4250
>>    - sm6115
>>    - sm8250
>>    - sm8450
>>    - sm8550
>>    - sm8650
>>
>> This is a mechanical per-variant driver update that relies on the
>> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
>> pm_clk_resume()) and DT-provided clocks.
>>
>> Runtime behavior was validated on Kodiak (sc7280).
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>>   drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 +++++++++--
>>   drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 +++++++++--
>>   10 files changed, 80 insertions(+), 10 deletions(-)
>>
>> @@ -173,10 +175,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation
> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
> 
>> @@ -134,10 +136,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sm8250-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sm8250-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation

ACK, fixed in V5.

> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
>> index 439f6541622e..a79f99ec6df9 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
>> @@ -6,6 +6,8 @@
>>   #include <linux/gpio/driver.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>>   
>>   #include "pinctrl-lpass-lpi.h"
>>   
>> @@ -202,10 +204,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sm8450-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sm8450-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation

ACK, fixed in V5.

> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
>> index 73065919c8c2..9037ef0020da 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
>> @@ -6,6 +6,8 @@
>>   #include <linux/gpio/driver.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>>   
>>   #include "pinctrl-lpass-lpi.h"
>>   
>> @@ -210,10 +212,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sm8550-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sm8550-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation

ACK, fixed in V5.

> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
>> index f9fcedf5a65d..513ddc99dd37 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
>> @@ -6,6 +6,8 @@
>>   #include <linux/gpio/driver.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>>   
>>   #include "pinctrl-lpass-lpi.h"
>>   
>> @@ -217,10 +219,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>> -		   .name = "qcom-sm8650-lpass-lpi-pinctrl",
>> -		   .of_match_table = lpi_pinctrl_of_match,
>> +			   .name = "qcom-sm8650-lpass-lpi-pinctrl",
>> +			   .of_match_table = lpi_pinctrl_of_match,
>> +			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> Incorrect indentation

ACK, fixed in V5.

Thanks
Ajay Kumar

> 
>>   	},
>>   	.probe = lpi_pinctrl_probe,
>>   	.remove = lpi_pinctrl_remove,
>> -- 
>> 2.34.1
>>
> 


