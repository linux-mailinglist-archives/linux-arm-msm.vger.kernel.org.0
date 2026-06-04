Return-Path: <linux-arm-msm+bounces-111191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id au9zF8FvIWqbGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:29:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 794F063FDDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KUWENSLo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bfmR7gw9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111191-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111191-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CEB64308A32B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9878D43DA56;
	Thu,  4 Jun 2026 12:16:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7263D6CC1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:16:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575362; cv=none; b=dh0UZ2xiutWUm2dlbiEOVq6sFr7H8sBrXUndQ/mT89QcZ47pnfK+i2QAyFnqYnkXOeKR1EU6x+s3EqfbcW7TM++JRqnj/yvahw+DrHMpol6249WSv7GDI2nTHhuBdRChu9llu0o6fwPuUIDucV9WZdRLvPdmuGnl0jQTUAdgn0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575362; c=relaxed/simple;
	bh=9osXu5fHUdBJo5gaIuC4k3hPxCN1r5YRP7q6+f+cR64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTWWL8Q9CGTLsipR6nsFu+hS+Jo2eg/rXIfgY4Hw6CVN1ZfJ6vsvYKNzbxEgVSzmSHaCXqGOn+lzhrYdRcn8n5YmuFhyAq5YdWLqaZWSgYB5BQDrMjTOiBk3vYYKxuG7jD4bNGnLvUuH3BsPPhMx/aS6gcNjINXMRQ2MZ6RA350=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUWENSLo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bfmR7gw9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546S1313240997
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gvAt8SYmZzFHqCAJjilcE2ioUDijd8ZA9Agl1qVcjT8=; b=KUWENSLo7npGpOvW
	Dt0XYHEoE4s1Rg1F84BOShzhjjvLqbZBpH7tpmAth28ZsYXflsl4KIBQQ7NwzHG7
	F+P/Hq/f5ZZ9xb5jZixGzLdj9miS3n9OuESjCoXQ312JMONAz6kk34x34sJjmryv
	oEggdbWDaYJEdAEzlbx+9ULpAzKmAqep/UFTcnoanamj1wFKwT7Q+y3617vdh5u6
	3GRG9YqXQHeWXOd1Qjt3Wo8lBHc7i70SodOaqiNdSJMtWaB6Cz6FTqH9zYZwkcnk
	k+I2vMdXvCsdWaJLazMUqY91xalaE1RqwaaHfYMh84KrBk/K+udAADKrfrR5UdiP
	AdECJg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd0atm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:15:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso975877a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780575358; x=1781180158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvAt8SYmZzFHqCAJjilcE2ioUDijd8ZA9Agl1qVcjT8=;
        b=bfmR7gw9fqB29NabKAwJ6EBo9lNGLPH2v2oX6R9NDIm2YNTprsm8uwirzwf6gjwQ6c
         CCvixhAFfb3tttDdsR8p57RvvLpGJ0Pg6qbje3DKdIs/8HC4vshra9N2acb23GTzDxnC
         +6j297QvP4Ep2hUg4myaXePrw0iDnoC6OvFNFYimhrqy08vr1GCny4sBujh+nY1AgToI
         XbIeMD5X6Ulgeeu3NsMshhTOfpa+dGdG4qHj/57Y1igGm9botzVMOukVcNcT3JrLYWHC
         CTn46dP7KsC0R7TM7kWH0QVVVfol8sjuzoBZ5UDwkU4Dxm5VA92HWUCHlFghueoy3orl
         Na4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780575358; x=1781180158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvAt8SYmZzFHqCAJjilcE2ioUDijd8ZA9Agl1qVcjT8=;
        b=LKWHRw7+TLYdCdPA7EqU8H7rErpoZP9KnYtlEw6rWZJJmZQWzibIdhhhNDoW0iJfTt
         uq8JgFP6xB9SWgUaREGqO5dyrn320/I/xb/y8bfs04sGvssvW9VVgQyjI+58YXslYvhq
         1NzcCCpJtzxassx28PmKceoYdIcr6iKQSLGC9Pw+W1MVdr4A3VNwOI1hBnBLQvmZ6xhI
         nnQERQ7v5WJTJH/clzxwCf6DHHyp31Hda6X7katqs6QpPtjnVZrANJGrFALnjNLlAnws
         V9Z5vryzr+InypYUo7WCmcKd0hR4UeAL9R4N1SJxhTC0/fhZreVg8squ4FwGbAUh5X8+
         FrJg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZEmBX3eubLw/wb9pU/cXyp6h1lbwa+ztnzvOZxCq8T9KeGR7TDvr3IENY57bPX5OOOPPR+QC5dvjPuZXR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywii+6Ueax79qV6/HJ99tVsd73XvaRjoThj5W7OzTZbgCM80igC
	Ni4VKrefSTTBosVqZmgYcxjfa4GrWAokKHzUc0doTg8MUAKTjVI++xm87YE0e1jvvK6ShqYn+jt
	KPMJiMsU0MD/zt0/vqboAjEuU3yyUGu0OlrNDhvu7JXqy2nDHjZrRekUHwzDWV0zxIas=
X-Gm-Gg: Acq92OGoZfUG3PQ9WEJjmbNqvAujPP8K/GlRXVyvd//RD1269Me9dEHla6VwEdyOWf7
	8exUza0HaZ8SQbelAqJ6UhAmShi5lohnYiWYpPiFLCVsae8sgfo/xcbXVPD+Skf3xIJ6LZ6fZqC
	XF3RKXZ33vWonWW7na3qfmhd8oSQlMpcp7tzfoCDChp6+SXP15PtgwxNfE/SDRte2YFBwu0WAS3
	h62A0no1mIv61uUWVlJ3njrH1cJSL/Xf52ygZM5H6ypUa6sYSO8dbU1cqTn7//7f9S6yNWoxVOw
	qCmSsBpnVTBYlmy8GL2jZIbLG8fBtfWNnYIiupxdXl+yedj/3cttfz9KogJmCc8DU1hAnZbFIQt
	mtDlu37DD85XJpI/swNFTJ0Ycw4o9lFSJEFTVC0T7da1+MM3KojqDB2jA
X-Received: by 2002:a17:90b:578d:b0:36b:9512:871b with SMTP id 98e67ed59e1d1-36e2fa98077mr7699306a91.11.1780575358081;
        Thu, 04 Jun 2026 05:15:58 -0700 (PDT)
X-Received: by 2002:a17:90b:578d:b0:36b:9512:871b with SMTP id 98e67ed59e1d1-36e2fa98077mr7699267a91.11.1780575357528;
        Thu, 04 Jun 2026 05:15:57 -0700 (PDT)
Received: from [10.217.216.18] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827f1sm3877450a91.3.2026.06.04.05.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:15:57 -0700 (PDT)
Message-ID: <1487d620-eb28-4a66-a611-0c6dfdf1e538@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 17:45:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mmc: sdhci-msm: Set ice clk rate
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, konrad.dybcio@oss.qualcomm.com,
        abhinaba.rakshit@oss.qualcomm.com
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
References: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
 <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
 <18af0dcb-8cf1-4565-a90d-58bf1e66811f@intel.com>
 <a03e129c-6719-4cae-bffd-563bf1dfc335@oss.qualcomm.com>
 <650d6ae8-36c9-44ba-a065-a1ceebee48b2@intel.com>
Content-Language: en-US
From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
In-Reply-To: <650d6ae8-36c9-44ba-a065-a1ceebee48b2@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h34Orh3mlA1cP5J1ZjlSg2FDxsyhhgHg
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a216c7f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=MYak2lq3idgefSP0UxwA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: h34Orh3mlA1cP5J1ZjlSg2FDxsyhhgHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExOCBTYWx0ZWRfXwHMFD29ZHP09
 BYxNdHP8toxL53Rnbp82IHgxqEb4JxO/kFJcuCIyZ2JLWn+u7oODkGjfqzoxdkgxaXZeYPTCoJB
 nfcaSubE+cUMUQLm0/nWMxsG42zNPhNmQHBz9pdD0TQYdDVOmlEsqKR3kvTuArlo0fmAV5cUEok
 ApcZtyUtIied+z1eSRH1lcsqjy8c6q3JjKoZl/JIGnEHu+34/pDHyAG8sZ/jsZYAzL8TjltN28N
 /qx0osQ4fEZCCUdsVGQgIParasMyDqrI7WJ4msPxH/kValnug4A3hHqXzXPxtkewvkuGace+qe0
 S4UbPmDBum35jjCwm4PIToiLapebcjgTlxJZrF3+v9JSDaAHg9yhdcAzg42O16jVzHEcmP7OLSw
 l6R/JElhXoccPUp7WY6Y4/lhfGvY1MVOl2ID8P7fHJTC0H/hNjvfba0PVc9LWrC09GUpxuRXMKC
 +nYArmQsHyMff0KtY/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111191-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ram.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:adrian.hunter@intel.com,m:ulf.hansson@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:abhinaba.rakshit@oss.qualcomm.com,m:linux-mmc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pradeep.pragallapati@oss.qualcomm.com,m:manivannan.sadhasivam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ram.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 794F063FDDF



On 6/3/2026 1:18 PM, Adrian Hunter wrote:
> On 03/06/2026 10:03, Ram Prakash Gupta wrote:
>>
>>
>> On 6/1/2026 1:00 PM, Adrian Hunter wrote:
>>> On 29/05/2026 11:10, Ram Prakash Gupta wrote:
>>>> Set ice clk rate from sdhci msm platform driver, needed for
>>>> target which are having legacy ice support, and need sdhci msm
>>>> platform driver to set rate.
>>>
>>> Please expand upon what "legacy" means here?
>>>
>>
>> for devices where ice node is not created as separate device node those
>> are referred here as legacy, separate device node for ice starts with
>> below change: https://lore.kernel.org/all/20230407105029.2274111-1-abel.vesa@linaro.org/
>>
>> also I will update legacy that ice nodes which are created withing mmc dt
>> node, so that ambiguity about legacy is clear.
>>
>>> For CQ case, qcom_ice_create() prefers "ice_core_clk" before
>>> "ice".  How does that relate to this?  Please clarify that in the
>>> commit message also.
>>>
>>
>> "ice" is the naming convention used for emmc ice core clk in dt and
>> "ice_core_clk" is the naming convention for ufs ice core clk. In the
>> function you referred, since ice driver is common for both storage media,
>> it tries to parse both the clock.
>>
>> Here we are handling "ice" as this is needed for emmc only. I will add
>> the same in commit message.
>>
>>>>
>>>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>> index b4131b12df56..c6a073718aa4 100644
>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>> @@ -286,6 +286,7 @@ struct sdhci_msm_host {
>>>>  	/* core, iface, cal and sleep clocks */
>>>>  	struct clk_bulk_data bulk_clks[4];
>>>>  #ifdef CONFIG_MMC_CRYPTO
>>>> +	struct clk *ice_clk;	/* ICE clock */
>>>
>>> Why keep ice_clk?
>>>
>>
>> here we need this ice_clk because rate set is required only when ice clk
>> is added with emmc node in dt, and in case we try to use the clk entry of
>> qcom_ice structure it will set the rate for new ice node as well which is
>> separate.
>>
>> but also we can avoid this, since this one time operation, and we can reuse
>> local variable clk inside sdhci_msm_probe, so it wont be needed. I will remove
>> this in next patchset.
>>
>>>>  	struct qcom_ice *ice;
>>>>  #endif
>>>>  	unsigned long clk_rate;
>>>> @@ -2708,6 +2709,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>>>  			return ret;
>>>>  	}
>>>>  
>>>> +#ifdef CONFIG_MMC_CRYPTO
>>>> +	/* Setup ICE clock */
>>>> +	msm_host->ice_clk = devm_clk_get(&pdev->dev, "ice");
>>>> +	if (!IS_ERR(msm_host->ice_clk)) {
>>>
>>> Does not attempt to deal with -EPROBE_DEFER, although bus_clk above
>>> doesn't either.
>>>
>>
>> here need is just to set the rate, rest of the enablement part would be 
>> taken care in ice driver, hence we can avoid this handling here.
> 
> If devm_clk_get() returns -EPROBE_DEFER, then the rate will not be set,
> so you are relying on devm_clk_get() never to return -EPROBE_DEFER.
> 

here -EPROBE_DEFER can be returned when clk driver is not ready, in that
case other clks, core & iface, would also fail to get enabled and then driver
would run into issues.

In case we get -EPROBE_DEFER for "ice" clk only then as you said rate
will not be set for ice clk to max but warning log regarding ice clk
rate not being set would be printed, and the ice clock would be set to
19.2MHz and in my opinion its not fatal.

so -EPROBE_DEFER handling seems overkill here for ice clk.

>>
>>>> +		/* Vote for max. clk rate for max. performance */
>>>> +		ret = clk_set_rate(msm_host->ice_clk, INT_MAX);
>>>> +		if (ret)
>>>> +			dev_err(&pdev->dev, "ice clk set rate failed (%d)\n", ret);
>>>> +	}
>>>> +#endif
>>>
>>> Could put this in a helper+stub function in the "Inline Crypto Engine
>>> (ICE) support" section, to save having #ifdef CONFIG_MMC_CRYPTO here
>>>
>>
>> sure, will take care of this in next patchset.
>>
>>>> +
>>>>  	/* Setup main peripheral bus clock */
>>>>  	clk = devm_clk_get(&pdev->dev, "iface");
>>>>  	if (IS_ERR(clk)) {
>>>
>>
> 


