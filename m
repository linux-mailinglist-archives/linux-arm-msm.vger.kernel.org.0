Return-Path: <linux-arm-msm+bounces-99763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAN+FdEzw2noowQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:01:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB23331E2AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 02:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0E503022FB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 00:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2CB219A8D;
	Wed, 25 Mar 2026 00:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YK6oVp5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VppED3HP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097081F4168
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 00:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774400360; cv=none; b=jZPN4O/Rc7tj43v+/rmq8BDjl7SaCai6ftBR5lGMqNC5J99rilLEc79bHiqcfoGboqWHqNabZ9Zusvu3/zzp7A9vmrN3Azot/kzAvfmOtI5zoZ+xtYZKfmNZig24x2ssn2hMeb6LeuRbi+vczwKLuYIPAu4zEI+okxF01feB130=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774400360; c=relaxed/simple;
	bh=4Q8HG3qt4gK3KnNvRaO69nxtaOU4iVVt3U/qYfJV6ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoShxjS7dtQIXwOHGpmDOE6AoZWvMCF7F10cUmCU+18NUctumbvZc+BaowCdCI31R9grHDlwOBQ4VR6BhlJE8UA9aQwr3ZfWdj1aHUWXHkHHoOJAN2YbMCYCxEZt1wT5/rRVtPO4CFCmAGdeLFbNLCSqP4V6FQ6Yq14isKO7NVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YK6oVp5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VppED3HP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCscH104360
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 00:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFXdL+w2VkJq6sfprGktd6Pg68wI7bXyhxNzZd5HSwM=; b=YK6oVp5uUaM18v7b
	UeDkMwprPMRqz4vrdPqgOJnl7Lt+BpPYp6Jzl/Wk6Unuh22IL03YybXqbh0w+hPJ
	bcpQOsHtzTTSEZOYJQMDXoU9PEmJmRBf6xP7xazA3Jw7CdpHxO4TwM2vvoLXvmIx
	lrwW5hfQ1V2dU52NEYD2xyYB16f6A6aeXq+oq/xq7BeNKGf4t4h3nVc6564pl2Wk
	F6QhCFh5IZErqswoRd5v6X1JnqK0AjPlnwHQKQD8JANB3ghYh6NygdrAnpYCy7IV
	RiIIFXLC5KtQTb/Ltf9jiZZJGVIks2QgX2bBbz39MakuHKsv1ovI0ozk58wNIE+U
	RIs65A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0k1s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 00:59:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829ba0e63e8so3634807b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774400357; x=1775005157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFXdL+w2VkJq6sfprGktd6Pg68wI7bXyhxNzZd5HSwM=;
        b=VppED3HP6Vsqgh2Y7yqfyaIocrAC9riZKXWaPKcV35lzTeGQi/c0nniPkbMKdYT7mc
         ZFo6kaAvO9ldxpINRgn+PQTY/bs9ggeSczA1nKxYtj/7eOFjxcucmmmfHA4uJnEVr0Jt
         6Ln2qlKRsHHLYmVLXhAd/NQ9XaemxSfWXO2lzNHOkWM0qCR+GDvmmmVK1hCEXghc2NWs
         tjCsBh3RTuhuvHQglNe3F/Z7Iv3UFQskpA4VIIj78EYBH2FE9A3tgp6QbcfZYxONvmnR
         zPWh211zhU3ewy0tIPUGcBKQGifbOvq+cCc7ldKDE4PAIahtX8ffSRPfwhdKJtY4UBZA
         nQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774400357; x=1775005157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFXdL+w2VkJq6sfprGktd6Pg68wI7bXyhxNzZd5HSwM=;
        b=tQsPjBvQLEatI+Ahf4GbmSiLJ3zpixCxoIzeBbLeeoIm6CzjMYVg++fP1d/7d3lxn0
         9GcTQyEpEkVbLLyn5WGYUAAWw9DK4Z4Vx4ouyAYu+7JZmcBAytHhDLNo7keZmGTem9s/
         hWRvnHkGB5EB1RNGlGcPusZI/g1QGLiFCtWXWy96bMaAwDpq25Xd/o8YiK9ifW91t/56
         6z+SjBJZTN9cuwIGOzzsJN+94VXSc4/QlgGxEMb8n68tFDo8803LEI3/VjZLVUCEfmAH
         XILywCshcXRa4YLuFgQWksXpqrZ9SaNnBsqNL9cl4JKD+GHmzUQfWJmSuma3Se4Uz06m
         Yzbw==
X-Forwarded-Encrypted: i=1; AJvYcCXPiHOWLT8fwGFEIIqjZnAf1QkyZWazXODTvhQOWaGt/6NFkSOAnoBBYpfx63AkA8RTyMlQnxhBQ+uyEwku@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4p8oLmzqmZxZKBbIjjD9UOTty8IidqHeMJ3PAGsd8OGZMl27Z
	impksveTrS9t6PmaIjH9VxzimOgt8PWR+ajOolEOZYAnGHJgOUUlJWqs3AzX54lUQDPsoykZH4s
	1qcxdaGEKZqtoAx1Oq0oDVr8aPMKlm3o56XDBpvlmvERL8UpjngrJwpXxgpUGgGpTMoPZ
X-Gm-Gg: ATEYQzxydfD+REGTRgQt6MQVwk/MeemwV4xryvAnQq0FPYnL9KN6fW4FC6blKX8bIfk
	tt0PddCM43M491I4DVNsgCa+Lka0fTP8FuF5yIALSVynYvrjFepKhfQ10fBBYeW7OBoy6TA9JQz
	6IU52UUDWhopGkvxHxDVKyn14M9ANyuRF/RukvEZWOZpBbFB/murKAVB10wxgb9ihHgr8qdkYdu
	B3v9x/smuWtM5sqLmii1Zyj8pKBg+NE+mdvWre7/EIulNV6pl+gUsmUlS3n1/1apRgInBdAg5Iy
	pKsYMR+BjV1bzsVGALz3IitTp8Mxjv1ZxJY0d2T2kuVfY65IpSmNBSFY+jzdKvkHiJz43qN4C3S
	K8ESTEE5f/KGyVO5T7UVFHZHdlUhKr8pBqIAOBvFwembcApLWdAUl79AIUjLwSO+38iMAwNLoUO
	h082Dc7sdd/BU=
X-Received: by 2002:a05:6a00:2997:b0:82c:6bcc:f3fa with SMTP id d2e1a72fcca58-82c6dfa5a58mr1381193b3a.35.1774400356901;
        Tue, 24 Mar 2026 17:59:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2997:b0:82c:6bcc:f3fa with SMTP id d2e1a72fcca58-82c6dfa5a58mr1381161b3a.35.1774400356378;
        Tue, 24 Mar 2026 17:59:16 -0700 (PDT)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc66b3sm14625504b3a.21.2026.03.24.17.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 17:59:15 -0700 (PDT)
Message-ID: <f5959454-340d-459c-8162-fb1243ebfe1b@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 08:59:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
 <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
 <acFGhpVWaHZtiyTq@baldur>
 <d8ab2410-8d67-41c2-9a11-384f4a6a8f07@oss.qualcomm.com>
 <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <7993130c-5de0-439b-9263-69d6f327f5ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAwNSBTYWx0ZWRfX7U83P4QPqahd
 qPV7o2u8gOeYxWlzNzkkrs0LjERGrO4PlnpHrXva3njG+2RSI1y+3Ul/VMjOXNyHtpDYe31W4+Q
 wTaYOv53hkZIZg9M3rVdwvVfzgAs9kOcAglXxMqzExBT4CC7r/7sHBslzCP8+Pldrr/9sqcaM4Y
 b8zPEJ5slpocyKVYuV5dOWt1igo+c3xRvRAOaIDIMUIgZ3njwcGkBza9B9CYf7hYWg9Y7TkB5z2
 F/zDnuXA3oHG4K4qXzyL+vBocOdQVrAk0Cw/7xX3GHPP+wIjSx1fkGj/xNJjWVehLoVRXjh5HSH
 BrJQA6i2siS3XDzqpe8xQ9FWwzATCKBRASBJHgRMtSY+5c7DMmGPSG789QlVvIqQXRhF3Y039Xr
 GymES0Vbb8wRAy6hWRoQESJKlnxuNZxQSjJXMdef/OLXJJgjia4cBIhM3RvEIAmEAggK9oxGE1y
 TTs/UA4tCvHcRJsJF9Q==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c33365 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=25pNCHLBOcfxwS3ibeIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: vpQT1GcH0y-rv9LS0NjOtqcGx1JgHrBL
X-Proofpoint-GUID: vpQT1GcH0y-rv9LS0NjOtqcGx1JgHrBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250005
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99763-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB23331E2AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 10:12 PM, Konrad Dybcio wrote:
> On 3/23/26 3:09 PM, Jie Gan wrote:
>>
>>
>> On 3/23/2026 10:03 PM, Bjorn Andersson wrote:
>>> On Mon, Mar 23, 2026 at 09:27:41PM +0800, Jie Gan wrote:
>>>>
>>>>
>>>> On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
>>>>> On 3/23/26 1:30 PM, Jie Gan wrote:
>>>>>>
>>>>>>
>>>>>> On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
>>>>>>> On 3/18/26 12:42 PM, Jie Gan wrote:
>>>>>>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>>>>>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>>>>>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>>>>>>
>>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>> Changes in V2:
>>>>>>>> 1. removed two cti devices due to GFX block is down
>>>>>>>
>>>>>>> i.e. "because GPU is not yet enabled"?
>>>>>>
>>>>>> Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
>>>>>
>>>>> Do they need the GPU to be online, or a clock from GPU_CC, or
>>>>> maybe something else?
>>>>
>>>> We need a specific debug clock inside the GPU block. The debug clock only
>>>> can be enabled while GPU is online.
>>>
>>> What happens once GPU has been delivered, but for some reason is
>>> inactive and we try to use this CTI device?
>>
>> We will check these devices again once GPU is available. We also will cross check with AOP team if there is a clock enable/disable requirement with the specific debug clock.
> 
> +Akhil for awareness, this is probably a solved problem downstream, but
> I suppose this may be non-trivial with IFPC at play

Regarding to the previous experience, these two CTI devices are 
irrelevant for debugging GPU issues and GPU team has no requirement on 
these devices on previous projects.

We will add these devices once ready.

Hi Akhil,

Hope we can get the confirmation from GPU team.

Thanks,
Jie

> 
> Konrad


