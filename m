Return-Path: <linux-arm-msm+bounces-118833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O1nvN+sYVWq4jwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:57:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3AF74DCC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:57:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CXHyQvkf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="iq0E6/4b";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118833-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118833-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7DBEE300982E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 16:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E564339875;
	Mon, 13 Jul 2026 16:56:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA24330B01
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:56:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961808; cv=none; b=tuo6FfvkwUluQ8uWyZCHbXKPuKmSbMQ0uiz03uN99OT4+SK5HF5eoVD4z/yX4IsvEw1oDXYIROnan62Dq2ZVUgrvZsBu5xxJCJ3KICaojBmUuZ+XveJZVtxRLZmmcUdUbhfAFItDAMUXL0xG2+iYtf46aiewKkhzKBr9oTnYURY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961808; c=relaxed/simple;
	bh=f1dENWIJHys20RMrMzjKwGdXIMauPk3ExXn/7QJeIaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEZMhmf8d3VVivYawzhkl8KI1YZ+cC+88hywF5oO+39GvoiaFjI91ErOx/gPqPhWyOAzm2QWK0JQM0Bu0JGQnRRbNj+w7K2QJjc279lg11iKEQ9rLbs25+LTvbme4jU87H7hCsh10l9jpTgMN2xXjijONSZyyJqtxA9ZDfnfCCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXHyQvkf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iq0E6/4b; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8JRk1803523
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1BTK6gFt2giEtwJiw2DRM0UmiGtqToj6SdQoef7PZc=; b=CXHyQvkfz6bBl2Pt
	uw8jCZ2dmva3aRyVyYaavB3xthMwVC+62Hs27bbn16wmR+usqY/AS4Akse1extmb
	BA+4dlU8aZ2pU7ysSkVBXodzjx3ypvPO+wsHnLvkrAl3atXYovjpzGti0bNLIYhk
	5jhnxN/s5vy7hu97jXSw4cxI7JSUw1Rp9XF5ZPd3dN0EdwQwSrjfOfsrn8SD86JN
	IiXu/gR8G5T0KOsRx0NLI+0oOqmJb9x7ceJRk9y/CN1+TkD5Rh0VfHUJmGnXopsV
	4MR/BYUd/q9+FyiuM6pTdooxQ/pHH+njA9+uzprlOJKXi1kKHVys9mTsvQnVrV/m
	M4Thqg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4snq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 16:56:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so5047029a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783961805; x=1784566605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1BTK6gFt2giEtwJiw2DRM0UmiGtqToj6SdQoef7PZc=;
        b=iq0E6/4bybjNgq3CiQTP75vusHPq0bpT54n4AQVFocFkLj+Znvcuqrsn1FuPLX1sFH
         2kVM4MjVhSHFmePdxgJ/pCAHsq3NpCtgTE4fW9u7SE/8L29ev9ttMItN9Z91mwehHPRQ
         LoPdcFwcA0XEu+PbaMFMOKn1CdPvnexLcOwmnJCUSQF1ukkXIR5MDVv3kEdcXXn6/25F
         jEVl6tw+2yrnke83XDOHh9A6KjdSvc5T0t5HhfU2w8tJZJ4EvOzywLOEU2k/k3Csx37s
         k2Yw57sygD77of6VPePQgynFpiK38HKcHacjbY/esTjOkiH1t/VhdAc+P3f1efvVDZu+
         oatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961805; x=1784566605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1BTK6gFt2giEtwJiw2DRM0UmiGtqToj6SdQoef7PZc=;
        b=tMutlcTWrZZ2cBUvYgzAvpW2/xUDL33OGUlyhgRcKdVlM8YsFFb2YIDnoiJP4hrg+n
         QpCYen9iOazjFiPJdI87AkpdoZxXt4Iu57s3CRCPP8L1G8l6rArNA70RlCw7TKbr19I+
         rea7jtU9p4yxQC2Hff7tWC2B/7Ml6HCwqysBYY+GaRGLKPKAUrgdCaa1fzbxRMf7GYgq
         AxbUBr3occlAyQYOgyLuxIKaz9KLDNyLJfmU6a/lwl8yCVkGRnNRUvIOOM6aFkNj20Ax
         6KDjNEFZTMpCjnqgBTyIXVvtGgJRus4e3Z1Dn/dT0LV6Uvt9TPwUFM9HfdZA3LuBEkFu
         dJlQ==
X-Gm-Message-State: AOJu0YwQ+XYzomMUjm1Rol9jHnYq2eZEdUghJt/oLTyp3GQzGkeki4KT
	BKh3JuqrMAp0GyzeBIgVyEd8qtT6BQgc1hgE2cttygeohePp8jCmQarv+ffAqWsTkDar8PlljAV
	8o4dOrtiwKoITkbYXrBe6PcjziQz3vG/T/FdCW+8lgdkqrlsZIuxKiQJGz3TZRxLAAXIV
X-Gm-Gg: AfdE7cnlcDzke7TcbdB353aI7birN2RCTaCEKkA1LSoz8g/NYKqYN4unV4Jd6HGuNQm
	P4lGXERPWo/u57LRnN+VZ2J+6m2Gpn7SDeLOqaBWmIrNNUL5RrFAZPUpmtL5S2tvNWpOww69JQM
	E8NyLSrHdGbGE6fSC0w21sGqzDg1+LpN2F08toJcm6tDl5gcoSg4YNDS1H/6Latf/8ocxosXSpS
	CzXzgWJjK6vX6TZB2PKk6bhUnf2PTAuw99NlRQFa3klRn1xi/b2ua/1nwuy/v3TBuafq+FNzCzg
	BtIcyGFzZOvcfIDA3P93wbmJwYmIrsueNl/JZglN16Ir4qbvh4hMBAJShKb2xPK0hOmkmnLxWra
	agQgv9toIrCXTYCp9OBReToGQfNpkCtZKAw2hm0XlALM+gA==
X-Received: by 2002:a17:90b:2802:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38dc774cf00mr9949896a91.26.1783961804622;
        Mon, 13 Jul 2026 09:56:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2802:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38dc774cf00mr9949860a91.26.1783961804152;
        Mon, 13 Jul 2026 09:56:44 -0700 (PDT)
Received: from [192.168.1.100] ([157.48.180.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm76694721eec.27.2026.07.13.09.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:56:43 -0700 (PDT)
Message-ID: <ee6c2c71-d988-4bc8-b716-1468458965c9@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:26:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
 <20260705-gen3_adc_tm-v3-3-ac62f387dbce@oss.qualcomm.com>
 <bbe3e9a1-86df-4c36-be68-ed480de10c1d@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <bbe3e9a1-86df-4c36-be68-ed480de10c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a5518cd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=62VzjLAzdHZQ3L95IMgkXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZJtfdnNEmsHLE5vD43oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE3NSBTYWx0ZWRfX3Qqp871dK0NR
 tZ1Fdk5/l0WsjDjYWIXnCtssWzGyqwZhxPydZ03G/A/Cc+7t1VB6LuF5xwKOPWRSlwhz4xvns28
 iIWk9jECP2DgcwIZ/kJxHTY07c43L1k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE3NSBTYWx0ZWRfXwXGrJYo+wwqo
 XvS0i1V0U088zzCakvj2fmJn1q3xL0JU50L+6flTJEm7105fPF7PYL/NX+sGPGIChrmwvzX0J2v
 621B/51yv5NfWCxXQbpkCzcki2QgM7w9UF4t4lQ9Yd9EA641nFHRMIKNCqS2fzTbEx65LWHpulv
 SIbMebGpn/YmJmgrE8xvvxx9LMKqk3iRHryg2PyGvScQVRKoznqUQ0i+ZDyrAmI/d2b9cobXcRl
 ApTCQ+IHnoY6uCKacVqwFxgW5EM6u36b5BPoyGRTsgXeze+EzA0DZxEFXGn2wQKweZZoQmIJjR0
 rSlOTrfij9Xu2p2bShBmdV+ksu3DuuLbA4hDjlRQD6GfuIxYWTyt4muNumqpUWlFDTMk4b7XJbh
 bmSvhpbFmuyQArGS0OtMt6BuP8MIZvkX4nuDEsf80OJ6wf2EXq+IpfLAambvmfGqBDlIzdPr7+n
 GT/aYXspjVMV9G2q0vw==
X-Proofpoint-ORIG-GUID: ByN-2JbrF2jVK-X37XElLph0-fWb6rOz
X-Proofpoint-GUID: ByN-2JbrF2jVK-X37XElLph0-fWb6rOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED3AF74DCC5

Hi Daniel,

On 7/10/2026 12:38 PM, Daniel Lezcano wrote:
> 
> Hi Jishnu,
> 
> On 7/5/26 18:53, Jishnu Prakash wrote:
>> Add support for ADC_TM part of PMIC5 Gen3.
>>
>> This is an auxiliary driver under the Gen3 ADC driver, which implements the
>> threshold setting and interrupt generating functionalities of QCOM ADC_TM
>> drivers, used to support thermal trip points.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Overall the driver LGTM but as you are sending a new version to take into account Andy's and Jonathan's comments, please take the opportunity to document a bit more the code and the changelog regarding the hardware (eg. register layout)
> 

Sure, I'll add a paragraph or two in the commit message to give some
more details about the driver and how the HW implementation changed
from the previous ADC generation.

Thanks,
Jishnu


> Thanks
> 
>   -- Daniel
> 
>> ---
>>   drivers/thermal/qcom/Kconfig                  |   9 +
>>   drivers/thermal/qcom/Makefile                 |   1 +
>>   drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 425 ++++++++++++++++++++++++++
>>   3 files changed, 435 insertions(+)
>>
>> diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
>> index a6bb01082ec6..1acb11e4ac80 100644
>> --- a/drivers/thermal/qcom/Kconfig
>> +++ b/drivers/thermal/qcom/Kconfig

