Return-Path: <linux-arm-msm+bounces-94121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD84Nub5nmm+YAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:32:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8B61981B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C766A30E0533
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FA83B8D48;
	Wed, 25 Feb 2026 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDqFj4q2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAfAP223"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336024502A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 13:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026249; cv=none; b=EiHatLF67wpnCx6XeDGh7uXyvkXYAX/rM7MNJnZ7iFYzUFoVpZul/Z4cM7UDK+OY3DrcEYoEDVUe+J5QZitPyvVYjtGPWLRxLPkaMtIR/OzMGkJCz96WQmAnmni988vJtdFJkNhWowEEhYdaELoEa7N7a6gtuc8YSUFaSkSmm40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026249; c=relaxed/simple;
	bh=7FLxIofTuqZ1WBzhufyvqYbk8UmeyEpNJeb524FvNgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qANr1jwDPkQXmwhv4Pw+ZTvT4Y+aGyA37diM331NXUF0gsKD+OYKgYLNe9/rz3KOFF/QNmXLzyU0MeTWL04DYRrBdKMF2MklsOrM3CI5U6+vJmqfGYT7KUsFzNueJmEN70w3YdKqFl1NG40/w9DHwhIM/EIXnPyna86FcYJhKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDqFj4q2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAfAP223; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SpXA229670
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 13:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qLI9X1d/yEe8+i0BiwoODlY95nrG3QUI4lJBtst/Irg=; b=oDqFj4q2QBlG5RTQ
	D0mKwwlBuz71maXDGB6B6kGgxTOtGf9w9q3SPEUkzGShxVR5HqHnUevvTx35VLan
	buXx5Z1JvMAyJRzKzMnTV7wwmbwqf6PIvwhRHEBx1OR1MGkLRV6Hw8UpGT5geDQM
	ayKzFPMbPl+xCsU23hfCdkb7rbeGj0JyyUFJDsFaeq3aoyZS9lNe+NxijEpUjqYH
	gJYndQaArkJfP9rcb6smOFwyy+IJTOacDcutg1NcaU7HMFYXgute2u+OhCYbtTT+
	D6dECQ853XnNp9aIkO3fwuR8Zxd7hgKtUFkZKxXIqd9rjRmPGaJFQI1yDDV3XUF2
	9d4SUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37ubbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 13:30:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4025302aso542731485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 05:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772026245; x=1772631045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLI9X1d/yEe8+i0BiwoODlY95nrG3QUI4lJBtst/Irg=;
        b=XAfAP223DX2KzuVXhLZm/2pCCWvFY3fRhjvofdiXfG4ZocGzLvh8dMF9glJ5+rBv0p
         p7YqoS+PWLOmTyCGcEsgCRXzsBTuOzOzgPyv+5Ps8TRhjdtptzMtSyifnusqd7TLJ9iL
         VvrDZKM7BvxAZjncFEG5FRspaMqg3ITzff5JVjYm5qeHeA+wutWXVrjmlRTKP9b2SdKj
         0VOYMnibxSaR0PokoWzDWTMbjrGjJXq7Y6iYHZIXuJOrN4VftF6tupYN9TEQam0etcpp
         +AU0JIewqRCk+xVDH/lpSUG3M9FQ4EgjOQPrmB5/wwUZ/+MtHrOvg1B+a98S5sWjq/NL
         ObOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772026245; x=1772631045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLI9X1d/yEe8+i0BiwoODlY95nrG3QUI4lJBtst/Irg=;
        b=HIrKlW0OoeNP4ZCknltnaUm0feH/q3DMp9VUgE4Yz8gmHgBZe4jQ7JT+skQOlnWS3p
         dn++fEtna+8QHHrNSfwQfViKfQiw8CM+D1Ilm90l3fbxnysCDUVwrhi7A0CmbdCB47Tx
         +7x87XERpm6vft8eAq5d74n1sYY7rexA04r/bVfBZjwreykRYlx+7HpjzhFBm+zUB5G+
         4lfeyHY/tYw9rcRZ46xglWB3t+yFjoOHU3SkXoZ0+jE3NTSWC3M/OtEiPyhkYHJXW0/L
         71C81yK5A5EEBYSiCHiAQKqBkMB0cbXdLzbCAf55WjXH9ZPt7w7HEKNHp4L3VHoB4Jcg
         YlNw==
X-Forwarded-Encrypted: i=1; AJvYcCUTGihin3OTofhbMxN73es2kGWAgflTj9/T/P50oOX6iS0AR8h4BFhUYTmL70j8ZHMVOhpDVSg6roIqobsS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx49hip54X/HqThhwiQ2NTuk0KCMjmwHsUBHbFtuxgF/3aciune
	ak6vREld/JAI27IjGYD/CPx1q5IAkn+4ApLNEdMJNjxzgAA1gjujI4WtFl4RFsWe5LhfFqkeaSy
	/2QUFJbQG+V4hwA5gDw1CncRo5hHSR97OXOZ26mamvfkEDSSm/om2zcSiRj7qjovnXhF2
X-Gm-Gg: ATEYQzwUOj1DZvljHKJ9s/m5PXIo+c2eOkzZD5wRQmXh61zOzVnfYO6SAx1bycROOO0
	EvE+nBhW4cuIv0quKkDrITt+cnTtft5RW3YHHjCO1FkvKtt7hwsbvTZl44clu+yh1ixW+Tq+gAs
	qgdXk/c/vauA2DaiNWnl7BpzdqKQqGIKOoYdxRB98EGyT62O2q7EXG9g4pq8doygproCuT6+8m3
	GJFQ9TJ1am47BH9i+GXwLOd4Yhyg2dy+lfDBTN+4GctOY2NqpIZvACCx/rD8Vyf3DuZ7FZK1pMf
	tYPFPogW2p1wlj78jzhp+6nbT7rSugnR4mh202vQilJ89Ocb7hwA9U+FWbVm3tPI8oTU3t0UQio
	zEqgHHCi+SyBcL7Fa7MCk/49owaUixNavpmxXdp+1UWlJlyDt5CQejfa0GwyEnfWlIY4peemZ6p
	YpBVA=
X-Received: by 2002:a05:620a:25cf:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cb8ca105d8mr1515354385a.3.1772026244938;
        Wed, 25 Feb 2026 05:30:44 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cb8ca105d8mr1515345185a.3.1772026244163;
        Wed, 25 Feb 2026 05:30:44 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65f77d5767bsm812522a12.14.2026.02.25.05.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:30:42 -0800 (PST)
Message-ID: <17e48bca-e603-408a-ad5e-dc62b24d9edf@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 14:30:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-4-loic.poulain@oss.qualcomm.com>
 <01804171-a9f2-4509-afed-d222c5d06251@oss.qualcomm.com>
 <CAFEp6-0+RKYLJ9pGzP1f9rbHNFNG+cXhwCr+=fwDAghrbB5Bjg@mail.gmail.com>
 <df0c6c3b-3276-4d62-9dd5-fe3e3ab629bc@oss.qualcomm.com>
 <CAFEp6-2HEgo3svA0ZbjTtHfwkA7e8gnHjv-mSSkRnr04_ruxbw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2HEgo3svA0ZbjTtHfwkA7e8gnHjv-mSSkRnr04_ruxbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699ef986 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=B8hZOtkY_wZGip6ixEUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzMCBTYWx0ZWRfX0UkN7IYBeluM
 Lujl1OWFAskPBZXVPSC/4BGUkRlP1X+5hCTkCrQVjSdFG4qvU7afvUvYvNPy868qEgvC6k12I0Q
 7XejAo3LqZTaklIsTHoTyVyRu+fzh1sce5VVupvP8hv1vz96gseSqyN7Ws8Bb/Awvyq5ubzlbB/
 9A5nLIZMaXXVvIpggsDaVOrwoWmEU+9AvQG7lsWtf/ok3WZeLkBsxGqp01JHA1NFSXI9L9DA85I
 YGDtmZ6WxS8OOnvWqxTRYykUWezekOcadkpXB2V7rUEUHkyvnab8BaNl+wvTyxi3vHB7QFt2CD/
 5CXqUddCHcJYxagtEjm4x0iDJ//DWzyKBf7MSz39DoPHysXKBavuINEjtIpw4HMVLF9J4ryeuJD
 33FgEoLwPVRkzWmNi7k220fAtp6irOuCoNmtT1xTMgAA/KsTg9NICVIZvCFd+dUyNZNy9H9HxX0
 9ZQVZaR86AUp+lZ6OmA==
X-Proofpoint-ORIG-GUID: pAUj98MzaN_2cNcA0rxgClUDQ1_R67pF
X-Proofpoint-GUID: pAUj98MzaN_2cNcA0rxgClUDQ1_R67pF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94121-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D8B61981B5
X-Rspamd-Action: no action

On 2/25/26 2:14 PM, Loic Poulain wrote:
> On Tue, Feb 24, 2026 at 2:23 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 2/23/26 3:46 PM, Loic Poulain wrote:
>>> Hi Konrad,
>>>
>>> On Thu, Feb 19, 2026 at 4:46 PM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 2/19/26 4:27 PM, Loic Poulain wrote:
>>>>> Add support for VFE PIX write engine, allowing to capture frames
>>>>> via the PIX video device (e.g. msm_vfe0_pix).
>>>>>
>>>>> Tested on Agatti/Arduino-Uno-Q with:
>>>>> media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
>>>>> media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>>>> media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>>>> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>>>> media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 field:none]'
>>>>> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>>>> media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>>>> yavta -B capture-mplane --capture=30 -n 3 -f SRGGB10P -s 640x480 /dev/video3
>>>>>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +     if (client == TFE_CLI_BAYER) { /* PIX */
>>>>> +             writel_relaxed(pix->width + (pix->height << 16),
>>>>> +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
>>>>> +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
>>>>> +             writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
>>>>> +             writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
>>>>> +             writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
>>>>> +                            vfe->base + TFE_BUS_PACKER_CFG(client));
>>>>> +     } else { /* RDI */
>>>>> +             writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
>>>>> +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
>>>>> +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
>>>>
>>>> Were these default settings (prebumably "dont care" or "always max") valid
>>>> for RDI? Would the ones you set up for PIX work/make more sense indiscrimately?
>>>
>>> That's a good question, the configuration above is the typical setup
>>> used for RDI paths, and it matches what other drivers generally do...
>>> The RDI path traditionally uses very loose or “don’t care” format
>>> settings, and simply 'raw' dumps everything between the CSI Frame
>>> Start and Frame End packets as an opaque byte sequence.
>>> On the PIX path, however, we expect at least some level of processing
>>> (even minimal), such as cropping, plus later statistics... For that,
>>> we need a 'description' of the frame format.
>>>
>>> So theoretically we could describe the frame more precisely for RDI as
>>> well, but that would diverge from what existing drivers typically do,
>>> and the benefit is limited since RDI does not really consume most of
>>> that information.
>>> Also, I think we may end up dumping content that has no line
>>> delimiters at all via RDI, such as sensor‑generated metadata blocks
>>> that don’t follow the usual LS/LE framing.
>>
>> That sounds convincing. Would such data be the hw-design-intended usecase
>> for RDI (with the pixel data going through the full pipeline), or is that
>> just a possibility you're mentioning?
> 
> I’m not sure this is a dedicated design goal rather than a natural
> consequence of how RDI operates. RDI is intended for raw pixel capture
> with no processing, and because it doesn’t enforce line‑based
> semantics or interpret the incoming payload, it inherently tolerates
> arbitrary CSI streams.
> It’s also the interface to use when the sensor includes an on‑sensor
> ISP and outputs non‑Bayer formats such as YUV.

I see thanks, for the explanation!

Konrad

