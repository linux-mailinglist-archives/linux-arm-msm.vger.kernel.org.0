Return-Path: <linux-arm-msm+bounces-90529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCB4J65Gd2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:49:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 054FE873E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0A2D301570C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2806F30E84B;
	Mon, 26 Jan 2026 10:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dm4xNN6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5R7PPqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B43301037
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769424553; cv=none; b=imPnpDmAryODQ4RTm6qT65MXrS8VkbleqIbBSzYMvvGZ50KoWLPgQLY5rP/MvZoLx4AwvojPaUkLsGUme5xGCsYaWkrtyQAgXf3+xtc+Q2DUTNgmX8HIiR9mbsVS8167Vm5uHpcL6HHShU0OB2mM2aU4FVfjvrkQMI/LtF2OVbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769424553; c=relaxed/simple;
	bh=Al+O00g/Lo/6wCI7FAJmfSBrMekQ3KPMQimabdZnAC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pv3drCchsb7Hord5VeocvujjLvFXaAdM5cS8wGjL0dyt8dVYMQKrEgJ1LEM46Sr7eBmWr9ewS8BsjBX5wWSwZsTXxjq7nChwhwcbyCl7eSyW3NFD+ZsCYG/SicS5CZwF0Bln/ucdWPNsmBoyiyAPrngR9pMiSybuSxze3qQWhAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dm4xNN6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5R7PPqO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q40lWP1361519
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0wM+WE9prT1wwArZUSke8alVwSaN9+rfvAM9XmMAVqM=; b=dm4xNN6ahl/BNMUM
	SylQa7q8d+tnoYNSiwnlQuphMK2eJ2uo+RSLbNaFxqr0rIlAOg5hhlXGyunrZg3G
	Pj0pBLZiUii9I1uMtNBGQCujR88h9DllZ2gAz/J9QfNNNkwXOmWKUOzoiAEnxNzi
	EwjDA+rwlj28TUsw1KXvF1Hv31xAJ+rQ77NUj07daoTl5epb22+bLmU1rzVyyTCq
	MaS6BvwfzCfXSxfFFm5juhfV/Us8t8U50C06z6EvKosjK/eCDsGxzBABm23PL/NX
	wpmqeMeYPw1NGF+OHadejRlBhN77MKSIK6tGQtXcDIZMPtBhzTsg18Q3tzLWja7W
	4y9QUw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v30wtu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:49:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ec38a3265aso13289743137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769424550; x=1770029350; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0wM+WE9prT1wwArZUSke8alVwSaN9+rfvAM9XmMAVqM=;
        b=b5R7PPqOB5BwfNm7AhICPLwZlu6baQ//AMrlBVN5I2pZmKTT9ESOcz4LONFr/nOEXW
         0fyHR4hk/bhtyW+9+sgtDdKz0g/2UrCdLpyTFD98YQayyKJoLSClX2TLP0054qDSBoux
         a2JIg9mPZvJ/QPJcgj6/pBo0dbjChvvzz3plc0kxmSN3ipdYLySrhyGRysWzEE68EdQK
         Ltp1u2UI8C3mFhKJcZMu8tNHGjRirMBomxz4krX4EUd4SpwoL+RpKcXaj5T64QpkXx63
         qOfwZQ/Vh8pm2OncPK+BbSRkN7EhddgjohnPS5omCTtZ8ECUJAau9im9tVRxnIsppBhN
         Eu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424550; x=1770029350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wM+WE9prT1wwArZUSke8alVwSaN9+rfvAM9XmMAVqM=;
        b=ocgHko3p3dX0MailGhwKFdGhtYR1rVSoETMtnBUaZLQWRT7s+c+v+kUSIzytpMmue5
         jdkPcIkUKxWgp8oYuRj+UsL+e88xuhS+rkqik5TzXRldlsGHCFWHZdNNaFZIU8xI28s2
         utk92nTKs4PF1MJyJCDTo4XXCl6TFII5QVzCGkFjBbrbUYA8SepBUK5RwVYGfIBPuxNt
         x8GKqzUIcUmAMeSDHmsVWFTtl9cf0+0JhaTEzp2x/BP8Uc5E35L2l5ZMj2Sj8+AO03tj
         SGXDJWE3BZQ5h7Q3Bd4qZegKZO5z4HqQkjaNU3iyhs/cfCtvbOkjDEY1Uf/RR+PoY/xR
         56ow==
X-Forwarded-Encrypted: i=1; AJvYcCVeITdXvJ9AymXSvMekdOruuoq9zveiAMA3JYWuS2SVTzUK5cs/YxjOmDPpBsShRAX7uNZsS242N2mb1YDS@vger.kernel.org
X-Gm-Message-State: AOJu0YyIHBXAakLEwTSFQzmTkfcQSpMpl6thyMKbUIrboDK6yz4SeIEz
	uoQf1q1ipf+7d0i9IfBcywO3WeyURKt2DtQuVFVIco3ehwW5aa7ftmPewzq3pU6F65Ixsksmjpo
	AgA/7qDIuRnpaD+5pYlLAWomchmHKZZGuTNojdIfpw01bqkolX7bGJ+gryJ5m5imNf9xp
X-Gm-Gg: AZuq6aImUFmCD/a1Qe5V+isFZMD/WrMymvjkfWlYqoVTa15P7A0/oHyLnGBNehjlP8R
	6OAuTDfdXWc5P3xwe+9ioOcWcQU5MpcuSDoXFo309i5K065KA0J7bFyOF9/jZXpok1yQSDPWJRs
	mmlc/SY8UcwnR4OAphSrl5/OSrQHwigu2DE94xCMjn4lz/bx9GzmXVcG091XyabixhbAm7u6XB3
	vXWEh/B0n+uY0LFO6K6Hf9MfWT1O7fyAeu1g8+NdxGlwg5VEwNPrgp4XjgfTYtBH3omtpT5d8FQ
	OZMcD9CTLJAKZ7xVBivNEqFsObw2SBaKyAOGCKYDnLDQinOhv1RkbJIaqPuUKrvqSt5AlmYCnuZ
	3OU3FtEteJKVH5TIubCvzPTPewgSoZkANa55E+ghMmVyUiK1wdqpeQem0AtAcLFMu
X-Received: by 2002:a05:6102:419e:b0:5f5:259b:66e1 with SMTP id ada2fe7eead31-5f5771b013bmr1458822137.3.1769424549882;
        Mon, 26 Jan 2026 02:49:09 -0800 (PST)
X-Received: by 2002:a05:6102:419e:b0:5f5:259b:66e1 with SMTP id ada2fe7eead31-5f5771b013bmr1458811137.3.1769424549455;
        Mon, 26 Jan 2026 02:49:09 -0800 (PST)
Received: from [10.205.56.101] (84-253-213-87.bb.dnainternet.fi. [84.253.213.87])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de491f9besm2544066e87.73.2026.01.26.02.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:49:08 -0800 (PST)
Message-ID: <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 12:49:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA5MSBTYWx0ZWRfX2NE1ju963uu5
 ZBrVk2p7DpRjGeVuQT3HMeoxBSMhTDd0XlamzD5er14Wh54Wr9EMPJbSJm0EzFMg4KLPgORsHGC
 XkpfrrnBvkXMTOsb6lIMqJs59GXquxMliM+CTPdoiuD7kPIji7slro4WeAPVnar7QphHh2ndKP5
 /c0KuundaNPsntpabALEaviw1vWzOEUSMpP+OPpcByoU1XPmC7iDl907IMEgZ6oHJKqS4F21CSt
 8isOvxhmS3qoStuz91/u3viWwQwEjsQHQRJY+cchs4IqSRR7SzgShsu4cqaHpCLdAY6FlMlvovn
 m4+vdf1k9q8t5en+tZAURbV2IfH+Oby+qny7wMSk49Q1tZwZJqOUhAG9T0PzjceYV8uIwyVd0Oh
 qywjG7Absbf5jKh6A5AYy/wemmCzWyqOiY98z0wVGLPfwdwQehCV3JpTlkb3tdj4yOCwFjPKSNs
 iBauIMo6qMkYeJKCG1w==
X-Proofpoint-GUID: -K2Rl7r4utfIJgCoIjoR4S4aS4Ak1HJd
X-Proofpoint-ORIG-GUID: -K2Rl7r4utfIJgCoIjoR4S4aS4Ak1HJd
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=697746a6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=oW9j1mrv7lfAxSiOe78TcA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_F_Q2RQ5sgb5A98PVdQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90529-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 054FE873E9
X-Rspamd-Action: no action

On 26/01/2026 12:29, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:13写道：
>>
>> On 26/01/2026 12:06, Jun Nie wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
>>>>
>>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
>>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
>>>>>>
>>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
>>>>>>> Currently, plane splitting and SSPP allocation occur during the plane
>>>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
>>>>>>> is called from the CRTC side to ensure the topology information from
>>>>>>> the CRTC check is available.
>>>>>>
>>>>>> Why is it important? What is broken otherwise?
>>>>>
>>>>> I see. Thanks! Will add below lines in next version.
>>>>>
>>>>> By default, the plane check occurs before the CRTC check.
>>>>> Without topology information from the CRTC, plane splitting
>>>>> cannot be properly executed. Consequently, the SSPP
>>>>> engine starts without a valid memory address, which triggers
>>>>> an IOMMU warning.
>>>>
>>>> What is plane splitting? Write commit message for somebody who doesn't
>>>> exactly know what is going on.
>>>
>>> Thanks for the suggestion! Any more revise is needed?
>>
>> Sadly enough the text below is not a significant improvement.
>>
>>>
>>> Currently, splitting plane into SSPP rectangles the allocation occur
>>> during the plane check phase, so that a plane can be supported by
>>> multiple hardware pipe.
>>
>> What does this mean? Without virtual planes in place, there are no
>> multiple hardware pipes.
>>
>>> While pipe topology is decided in CRTC check.
>>
>> ?? What does it mean here?
>>
>>> By default, the plane check occurs before the CRTC check in DRM
>>> framework. Without topology information from the CRTC, plane splitting
>>> cannot be properly executed.
>>
>> What does 'properly' mean here? How is it executed? What happens?
>>
>>> Consequently, the SSPP engine starts
>>> without a valid memory address, which triggers IOMMU warning.
>>
>> IOMMU faults. There are no "warnings".
>>
>>>
>>> Defer above plane operations until dpu_assign_plane_resources()
>>> is called from the CRTC side to ensure the topology information from
>>> the CRTC check is available.
>>
>>
> Thanks for the patience!
> 
> 
> Currently, splitting plane into SSPP rectangles and allocation occur
> during the plane check phase. When virtual plane is enabled to support
> quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> a plane can be supported by 4 hardware pipes. And pipe number is

number of pipes

> decided in CRTC check per interface number, resolution and hardware
> feature.

Okay, but IOMMU errors were reported with virtual planes being disabled. 
So how is it relevant?

> 
> By default, the plane check occurs before the CRTC check in DRM
> framework. Without topology information from the CRTC, plane splitting

WHat is plane splitting?

> will be skipped for the first time as pipe number is 0. Consequently,
> the SSPP engine starts without a valid memory address, which triggers
> IOMMU fault.
> 
> Defer above plane related operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.
> 
> Regards,
> Jun
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry

