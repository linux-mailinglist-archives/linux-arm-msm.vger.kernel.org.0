Return-Path: <linux-arm-msm+bounces-116022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yihOBEBeRmqdRwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:49:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 191E56F7E29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:49:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="fza/WWmC";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dazX+XzC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116022-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116022-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4EC1300F52D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2002047ECE4;
	Thu,  2 Jul 2026 12:39:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCD439A4CF
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:39:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995975; cv=none; b=gsajASkMkHl8NMKGOb3KiRH0oiC6OiLvfngYzuR4UQIic69lYr3MFcMkA+Yr8E1Lwr4Nu7Uf40X5QrInAZ4qbgq/ZDxxOrcurVUBAmIw87ZJSmsz6pj81iYUgA/qAhL7OmvsAD8yNUdj4Q30EUKlUvrhcn8gOPvS/iU2tPKcKy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995975; c=relaxed/simple;
	bh=M/1IO1ovD3xv7E7bwlWhzJmzQk00aY6O8z3/PeBE8DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIVpnWDIee8/3AzLGbrdnrJe1Yz6nNDqP4l4z8oq9ONoLrZFk1eD3M+7a62PhZkG11XNGHUkYBU9lSN/xpjFBebRaOOp50lSxVzLjyWrUb6+kQBn0J0vX35pjxAHppq9LbYJ+bcYLub9eDrSNNvg8CeAX8jQSpHLhdIB48JTeQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fza/WWmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dazX+XzC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AkDUJ3592277
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CnAJp8KHEUhQx8/mU74U/fRMf07e+imvfeLUvkYie4=; b=fza/WWmC380toLK/
	tHkJhoz7hhJw77/0liY0hTcH53/gnckUuFovyfcL7LP+LAhlpcuoLXs8WpKVTqfV
	egxX2ePfToyWWUNRllWUV1B/SaEoF+7Q2iFX3m8HWaxE29Bik2tayo5h/st6S+We
	/gXOgvymgN66zWT+jNpiFdK0MoXWyUb4Gr4OyWkTfzHh7Wj/GXank2w7l+3BgpIE
	pgNeBhzbvG6kcwg7ya7krJjdmfVsQ1iMNuGRaeWCh28H8oJ/PvfEWE5mWOdmbTds
	nL+lnSrAfW5gbmbCWxABxdcDQ6qVbS8Ug44ILepZMAsr7gxviPFlxTNouFn1BTfl
	ti0Hdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9r10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:39:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c08e9c344so4676671cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995972; x=1783600772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CnAJp8KHEUhQx8/mU74U/fRMf07e+imvfeLUvkYie4=;
        b=dazX+XzCBzsIq/2oYnz1XEEoCFCqexXbXOR0iEXBaTYMnJCDqNddTk2e7t3Z26zGmh
         lS7KWttUXAlKs/R4RLn1mkTPLn07NZuIqB8cjjs2ImRPdMLbPvvS/0b/dFlHh+aS+76m
         2nE9Q2jsiE3CfQ3rFg20lU9TIfMdV+kLIV3YONYentTFYVH8lhfLooXNbfxsbSQNmkot
         N2f+N4dPl/NUWdVw0OINHHw7zhFuvYZatB6ZuRBgN+Itj9GPgVqzNbFIVyIL8jP0JFCm
         fi8j368A1n8pOeyHBQ4HKmDHUkoLaKwDPT78d+jy3IUdgVyw5WJytkIgFxjmfrFKpLcG
         CVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995972; x=1783600772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CnAJp8KHEUhQx8/mU74U/fRMf07e+imvfeLUvkYie4=;
        b=q36+0/b/csr0+A2nfPnW+TWCKSm07cIdv2sigc8KNu2OzWqEzIlmVX3U5lYqnayFdW
         aEf9e83gPUhgklKTVM5JE1SH3ffflcfn/yKCoK++1BP3rLrMBjxqyPXd7RoMHlYFeJF/
         hYT+sM7AXFv/+tSfqCbntaS1w6foxT2VuIVh3oKwn6SFmiUg/s+NlZ5v/Sx3UUAkYIcz
         sPbPNjCFP+c0Y5nKKG6cKQEzkZ5l9JgImn7Z4Z9n01HBZeWMfJQahZPoMlLS2Gq2EWwl
         LgAtCh8W50NguCuBV6Dhk2G+mERIwk/3Pwyen0m3uTTpT5shVPp3EYm7dACNzW/hZgDL
         vQXw==
X-Forwarded-Encrypted: i=1; AFNElJ89Z2iIFJYQQntTxJFF7H5J6MeyPwX+ceS27Yu0a57TYmINJsbFSPi9tW1muQJg4RT+L9wjhLhIXJy5i12Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb+HwuzHpEH63fk+70qWL28vLjZTQ8M2hXtMwt4cxohVVSOcIm
	5Oe/bkGIx6C/COcascXjLZR4ccf+reSpz8oObhXsn+5TpfWkjiMrxjQcayJjeDY5pTjIE8fzAMQ
	2aBPPtzqSlSwNe6V/52QinhECKsIYo9ttzyJv9iqkiaKT66NLR9lOynpWy0ZvBfGdVdjY
X-Gm-Gg: AfdE7clqnxI+EEgLx3lWz71i1UA++JKF3U7Nfn3s5Q2GxBIJPOFFsHGBRGsKrVi9glL
	o6k7wg1dk7XzzhyJOZPUUUnYQfU6BN2jtcs0Oy5KOXIoZwTjAKBkwxqoPgjz5mqfCG+zsGojRdM
	CZCdYzcQW3rZte5vdmqMQM+mA9XbbHZQ/yVMptrBEeNIgfSRnu6FYvmHQKMqu5eGz7jK3RNKTAn
	XQkWYeon3wnua9UX5pCkWpkUhx0lMaFO+VbRmcWfBWcuGriGMkFvXds3K5vieGcNgWCovdGGZmZ
	OrWctMMqzzWRTVQR5Rbep6qATxJFrFkBUujSya2LbO6++idjpHM8gFqOwHPnzZUDvkXWrvuh6CK
	aNlcFY85+vHCq0dIdqRwix6c54qPyxK7O6gA=
X-Received: by 2002:ac8:590d:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c26b25d63mr44656491cf.9.1782995972040;
        Thu, 02 Jul 2026 05:39:32 -0700 (PDT)
X-Received: by 2002:ac8:590d:0:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51c26b25d63mr44655921cf.9.1782995970668;
        Thu, 02 Jul 2026 05:39:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad0fff43sm935595a12.17.2026.07.02.05.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:39:29 -0700 (PDT)
Message-ID: <c3922558-dead-48b9-a49c-7d0d6a2dde7c@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:39:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
 <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXztYaMUEfgtRf
 s9tCfMlJsWxsCpoN1GGibKLA1Y0b6QOW9w8Lc9uZJADRbtDy5KKOFNXkYEonAkuO4ZI6Vg9xYVN
 5BuiLuErqxFi6oKH/4UwYBSfO8ZrNSWMiG9HDvKnVB64PrtX7/+tqbLGCnkEMv95Oqt4yLLSR7x
 QYUtdrIhspLcSe437Igwnbqjp9PO5lkLq4snLosE9FMwiB0403MQDVahdf2njPiiFLUn7TWhkbn
 YXvxUsnmb8Q9Yl8+DOnN5xldF7w+Z6hRMt8gkrkxyg4p3V88atASbEjD8JYAq8VbqbdJttCNq58
 cEKfM/bEo+EYH5t7ikS6eS/vTvaf18B8rKGoH4WfHXP/1JfxSatp28LC3xsayIsn8ow+JdjZNGb
 RX22Gz+LyIwyTY6ykp0YH3R7AQK2icbYqDpHhiZeuL2C32vK6spWGx2bv4A7rqHiR+qQnN+9D6e
 5F8IoHpMj1gXjczooTA==
X-Proofpoint-ORIG-GUID: cFqLXCKnyEkbRwF2dh4Qq9DppTKZrM0_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXzAwM4WWslcg/
 ULaOWfsfVdO6wKMR7PNt7xPYGfN29b+H/1xgmtR3Lmt1VsR6XPnkpHFJQRVDrzdxwcb/RcbEBa+
 5cYRub2cLDGrGEUW21Kha8h2Zy4gY/A=
X-Proofpoint-GUID: cFqLXCKnyEkbRwF2dh4Qq9DppTKZrM0_
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a465c05 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6QUDDQO5MDr9iEhkdtUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116022-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:mukesh.savaliya@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 191E56F7E29

On 6/30/26 12:06 PM, Pengyu Luo wrote:
> On Tue, Jun 30, 2026 at 5:52 PM Mukesh Savaliya
> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Pengyu,
>>>>
>>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>>> also support GSI mode, which is highly preferred for certain
>>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>>
>>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>>> the controller into GSI mode during initialization.
>>>> Why to force ? You can directly configure in GSI mode. Note there are
>>>> some configuration done prior to Linux bootup too.
>>>
>>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>>> impossible for a normal user like me to generate one with GSI
>>> preferred.
>>>
>> If firmware doesn't program in GSI, you can't have this working in GSI
>> mode, its going to fail (and work with fallback). if it's programmed in
>> GSI, anyway this will run in GSI mode. So why to add extra things
>> without any usage ?
>>
> 
> What I can confirm is that fifo is not disabled on my device, and gsi
> is definitely enabled (under windows, check the register
> SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
> works well.

What's the value of se->base + SE_DMA_IF_EN (+0x2004) on this SE?

Konrad

