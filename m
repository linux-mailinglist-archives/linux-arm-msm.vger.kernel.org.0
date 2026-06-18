Return-Path: <linux-arm-msm+bounces-113721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zUxGI+LHM2rQGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:26:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C569F4CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 12:26:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OKsp7sSk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RZgEUEbf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113721-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113721-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B0F83174424
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 10:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E113ECBEB;
	Thu, 18 Jun 2026 10:22:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9043ECBE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:22:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778146; cv=none; b=EqNbd+7hbF7sGh1k7jlNTdLoCaGuGChaSiWumUAXPTrwnXMJHU26QqVfjtfZ0uaOjRB+t7LsYLHe8B2muDL9UWcboV0InmtmTpVacNc7MLoj7c5g9avrZomNP+MetSWDjXhPB2O0iaHuJtFxnDQBtFX7D3O+OQ34dUv2iyRJCjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778146; c=relaxed/simple;
	bh=7GQkuyRg+UDBSS/P9xS38Vtou4tB13kaAZH5MkFcybA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PExBQ9xhqS3IF7LEmjHhda1fvNw6KOItsAnDaxHVVouZIRNu/Oim24raRbfroKdKPuRpbnqbpf8pU451qMtH67bV5xPIW1Cux27IyW/LMAeosyuzeBypc1C002/8WiQ7qRlu0ubLjPb66RazQFFXFGSJ4/93Z1XPPVZ2VrlN0F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKsp7sSk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZgEUEbf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DkOQ667662
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WXkzGNHSr32PSEXak0uSnyGttjoeqfrsCE+Fxu+JSt0=; b=OKsp7sSkXt71iqPF
	MoEK0azKtufcbzTnjKMsKcLZicqHEtdG5zx1cRIMPPWSnhAYfhYFamCRw5UDukQF
	GC7TqJMHWCdzmCkIQvaqynaXDLENCyXiCaG/CgEBOupPhwwokqXG3TGHWjutST7G
	qj5UE0hEH3vopXmmS2qyfaOGx+fImd/EjTzA5+vAhbE/26k0eoo25s7ta7c6Y96C
	hqlSfVjzcJ+vov/bGEh/Wz+Yycxck93O72JlQRQ77EWrkJFmfc3a/Xw7GYlf4yvl
	yX+V/XKEcwJ3Hc3vRBBNIo3K7iUw6TZZpcHz0vQH63MwTe1hfSyupYG29P1Wr434
	QipzZw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vm2yyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:22:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84534f17866so686009b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781778139; x=1782382939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXkzGNHSr32PSEXak0uSnyGttjoeqfrsCE+Fxu+JSt0=;
        b=RZgEUEbfcCGmtyVz2BGrQG2EL/xWbEGXJW8GCySLsZZ3GeBZyzRYzAXrE8GBF7SqZf
         T7z7l+bnge8GCnquROpOBaGAZme01hNTlmIBns0k/yt5X8QveBRc5NopwSBvSGXoKP8+
         +ciPIoQ/PH471qiQFs3sejROuctLzL1r3h6au0fs8cUHSD/Gdbs2zeGYKNsDMoHhe9C/
         ZLdp4x1//b9pNhTbw7Xz+7nJMY6j1SA3Rwvt7/nENc9TxsAhLiQY9I0eD90Vrncod9+m
         gbA7mYGlY8WWhsgzrjvynYkZ3bJJzu0UbWwmGPpcZ9Ci6joT64V03UUx+5FAApkARppW
         wGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778139; x=1782382939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXkzGNHSr32PSEXak0uSnyGttjoeqfrsCE+Fxu+JSt0=;
        b=LWGw7UKJwQSlOrA5bz5MC9GuIgK5ydX6h2q95IXAP+xFj5xOJEptXJveaDBz3v8iSq
         96ioXplrxBr/JXvLgg5EMb9RuM6aDQlgeYatJ0TY1jmJ6bTajyZ8iHbRulgo9hnnO3JA
         dPGSFrXQBzihosvvAh5sIbjH5jyHu+ePX1mlUnLbrOn14CSiZTxTSPGH8SwhDLcG96Ju
         nxjAHifLK6ov8yCD5xKzQyG+ynr9A+ocz7tfvEf24zs7C5PCfcF2ROwdledObiS5x4Oo
         yfDqkNhJd8VH9khZ+O64ny21ar9Q0guSGZ6UTm9AWb7gwvGkRldOfSK/UEoj4rD9CoyX
         7KUA==
X-Forwarded-Encrypted: i=1; AFNElJ9ohOf5BlJUqvyOPx176mIejjpI0w7ITpuD4E35rtaC1cUM266Y2IV0kQFQHplPr3WALnUbn2tE3kZQkxp3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx413Iv5ivfzUkIRxgVrOqVWzaSBkhLCLR9Iu0zqLO90BjSHxwR
	ckwiZMxMxM51Vyeg/aTCgSFfRe7k7GUSGsLmAvbeFDZAAY5viYu418Fn9jiEhEcCEIStdd3/b+W
	kN4CMUrbHHiBCqQdzAyRrO+M1mouvG7KFgxZoDpikgNTNR54ugR1eDq69HPIhIvhUMvhC
X-Gm-Gg: AfdE7cnUerC/bA+pPjU31nTfFMGFa+MONO7lMsHFf4YMj8QFihiaWbIDhNJpKPjFK0h
	vU8pX/X/k0YEY0BPDmpL5bdGy6nt7GTwbZVNFkmpt2pT4YG5P28NQAMqehW6yblmysXmBr6aWw/
	USiD00X2yseHmnLhU0s+mWqxGFHArHpQXxd6Wr4EfDP3911QCaGeLGozq6RTxe2xorSAcBFQoci
	d39jK/UYiXSo/2M/NqNAQ+x8TUYG/kCnRSZcaRXbkGKsg61/9S5D9CAss4mKCLQCdb70rylcRU4
	9hdrjbxYXmRZE5DAs5rXmcCdrEhSl0ChB6XpAzKGKc6WYrhpSqTEWhNYyb2EsILORoldvLMBbzW
	rymFF2hNDi6J5Fi82AQFS4S/b4n5n5ozyz6ak/Z7G
X-Received: by 2002:a05:6a00:4c8e:b0:842:2f09:fde9 with SMTP id d2e1a72fcca58-84541991be6mr2404159b3a.8.1781778138631;
        Thu, 18 Jun 2026 03:22:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8e:b0:842:2f09:fde9 with SMTP id d2e1a72fcca58-84541991be6mr2404097b3a.8.1781778138109;
        Thu, 18 Jun 2026 03:22:18 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84535894715sm3890225b3a.11.2026.06.18.03.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:22:17 -0700 (PDT)
Message-ID: <2bbb3b84-45c8-42dd-8e4c-d5aade9889a3@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:52:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] iio: adc: qcom-spmi-adc5-gen3: Share SDAM0 IRQ
 with ADC_TM auxiliary driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
 <20260526-gen3_adc_tm-v2-1-702fbac919ac@oss.qualcomm.com>
 <ah9ouLQFI7VtHCWL@ashevche-desk.local> <20260604114630.23ca427a@jic23-huawei>
 <aiGPMqHcz_AkUezI@ashevche-desk.local>
 <d095233e-ac2a-4b50-8a62-29fe1e36c2d1@oss.qualcomm.com>
 <aisELR6v1EWGcmqb@ashevche-desk.local>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <aisELR6v1EWGcmqb@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfXwU8pEYGNtXIp
 XANsOx/zz1qRj3iz8DjjPkWGuE3j2h6TO+H8SdLhVSBqmz/oGHbDqVXrTG9sJaPN1wPIIuu2vY3
 H9/Ohy/SJtdZ4puO7dvEKk29UmXsr3b7oaZ80dBDxMoROdxHEmx40x+NGCNmz0PMELnTQvzwKRI
 7QKsy/I2HaQeiJbqCqYoNWS2FRpsHOAidsyZwSFVjmayqs7BMKF+rf7/XgYOCb6fpMOb+FaXhTP
 sGVuchVrbBDRWAmcaVt17ZkLFN5dJRq/fGSMmrlmV+KPol+6N5l5fWPmND+zuckBUadsmtjycgl
 OZ6zsGpt50l1n2CGhB9FOq+7txv4CPrjtmo08N8VUkkQ5uJZYrrA7+JUkwvrh8ZvTWGiIizHUYL
 86KG3ZASF7TTOzl7YgiE0OiMuFXJtDvv63GRXiFpjmRY+hJ4QEaL2fLp8ta0olsVO8KbVce+TBh
 LQ8kA4f17Omfy5pZVCw==
X-Proofpoint-ORIG-GUID: y_QcaBZ0gMR2wp-gqOGSFOaB2oKoOcXI
X-Authority-Analysis: v=2.4 cv=UrRT8ewB c=1 sm=1 tr=0 ts=6a33c6db cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QyXUC8HyAAAA:8 a=2FWZ_7yD6c0lXRLnv0MA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: y_QcaBZ0gMR2wp-gqOGSFOaB2oKoOcXI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5NiBTYWx0ZWRfX7KcrPOk8yOCa
 PPAdfuAIzJA3DUE3XNNTVIFsby2hKkoYDkidB25EobafOaV1FXIB/MW/qB4s+PHK7+MQ3Cv8j0b
 mjS2GkQLaXw/nuAueJP+YIdp6tAKyEc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-113721-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 022C569F4CD

Hi Andy,

On 6/12/2026 12:23 AM, Andy Shevchenko wrote:
> On Thu, Jun 11, 2026 at 04:13:07PM +0530, Jishnu Prakash wrote:
>> On 6/4/2026 8:14 PM, Andy Shevchenko wrote:
>>> On Thu, Jun 04, 2026 at 11:46:30AM +0100, Jonathan Cameron wrote:
>>>> On Wed, 3 Jun 2026 02:35:20 +0300
>>>> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
>>>>> On Tue, May 26, 2026 at 04:26:09PM +0530, Jishnu Prakash wrote:
> 
> ...
> 
>>>>>> +	ret = devm_request_threaded_irq(dev, adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq,
>>>>>> +					NULL, adc5_gen3_isr, IRQF_ONESHOT | IRQF_SHARED,
>>>>>> +					adc->dev_data.base[ADC5_GEN3_VADC_SDAM].irq_name,
>>>>>> +					adc);
>>>>>>  	if (ret)
>>>>>>  		return dev_err_probe(dev, ret,
>>>>>>  				     "Failed to request SDAM%d irq\n",  
>>>>>
>>>>> Also add a patch to drop this duplicate message.
>>>>
>>>> There is another thread going on this.  It might not be duplicate
>>>> if -EPROBE_DEFER is returned.  The message won't be printed but it
>>>> will be logged for helping debug deferred probe reasons.
>>>
>>> Yes, and I explained that it is duplicated as long as I understand current
>>> code base.
>>
>> After I checked for Andy's first comment, my understanding was that
>> devm_request_threaded_irq would internally call dev_err_probe in case
>> of an error, so this dev_err_probe print above would not be needed.
> 
> Correct.
> 
>> Please let me know if it's better to keep or remove this print.
> 
> You already know my position here :-)
> 
>> And if I make the change, shall I add it in a separate patch
>> before or after this patch in the next series?
> 
> The rule of thumb is to make sure your series won't do ping-pong type of
> changes: when one patch introduces (or moves) some code that is removed or
> modified in different way by another patch in the same series.

Thanks for confirming, I'll add it after this patch.

Thanks,
Jishnu


> 
>>>> So maybe we have been a little too energetic in removing these.
>>>
>>> Or maybe sashiko consumed a bit of LSD :-)
> 


