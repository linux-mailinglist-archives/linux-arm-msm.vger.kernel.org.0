Return-Path: <linux-arm-msm+bounces-90893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF1pG7SIeWkQxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 04:55:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D00879CE3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 04:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 366AC300E0C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 03:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91532FD7B3;
	Wed, 28 Jan 2026 03:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOJtRydT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQYDLtUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AE827FB35
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769572526; cv=none; b=aMwZnpr9+x8VQusSsfOfsetGX5WkVvGvUZXNAdnpbPGBSv63o+e+nifsJsLf7zUnMFVZsUbX7iJBD9jLVgI9Mzci1vzuwE0xE/oCwVuKdpxHthjlZxPFAQsmZvN1fw136Fu/CdOeaooCxtpXzfy0G9EfWWeA717C5mH0MJCnZ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769572526; c=relaxed/simple;
	bh=WHykkKVTvoX1tioyPgjt24UHORCDKOhRIyZm8zIUXIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zz6kiGt9B62J/aQ0APBCkhpQIRkkAYNGhNHN17X3d04k+GoT2SQRuiB6d6ilrUK1uao6MEXdYT7m/ik5knQ47hVX2d7TDWx3p2uatDInCGuCPFMk+4ddxc5SG5YvH/Wy1evetuAekq5ytJXjjunHw2hsK7pAsVlkcG2Fw49Mnbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOJtRydT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQYDLtUy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S34sF91195175
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqbDSn9eNmryfrGgqBkMCYUYqgtxmUHyERoRcVxeqx0=; b=QOJtRydT0o1p9uts
	jmZrRPdQqebq7QonWVQJn0iBP21NsOKYqTQmNeyNzE5W5YawE5hPVTOmvvWBEKlx
	hzJuljGJVNKu2ensIeSSIDMCATlVm+KXbzMh6u19FRgIwGcCtS41VxBIZgUVunm2
	xXnZBCKppErZnZ7GkxWwAzIDQRz/ieYQ9Ik76kpWVWD0Dx0xP3s/gtxLzfcr/O+u
	0heAha2q7dBidv6po/GpSbxDTqN2s3GCWyFNRSX8Ux1d/cs6ftYei2QnFBIMGheW
	U7XYxAgNZQ2UzcMO4+h4n5Giy+33DLwALsmcLFcjWp7LMB75QhTt9IHbDQjNPH53
	Acu7fQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1ethtuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:55:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b7f04a11so38727315ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769572523; x=1770177323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RqbDSn9eNmryfrGgqBkMCYUYqgtxmUHyERoRcVxeqx0=;
        b=UQYDLtUyF6p8A+Nx02LTLzVoY6fBX2yQICXzQfLJGu5+bhG1w/cyCNiKeIYwKL4xjk
         wLd+ulNnSLrT0u3RvR/46WeULQQRQr7ivfEznum2wXCVZn2l0qH+2vJE4ThhyBedvogl
         P1NW5tkVL0qnb97YFy6Yotb2VFVfFGXBIJDK4NrjDtZoor/KwLUNRfK7NPC96L9FioYt
         efkSK625CkRm1p0+a51lZIlOuYLT6aQYOHDVpaxDGvTdC1Vahs7///26EMPqGapDqxtI
         X3dCJZzilLRBrJtRz4eKUViheChbOwalWncOhadwozsV3+z1ZkZMvuWy9y2mjzDEdy1q
         oTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769572523; x=1770177323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqbDSn9eNmryfrGgqBkMCYUYqgtxmUHyERoRcVxeqx0=;
        b=wJdp779uh1VugCzTrpVU4lIYrP5qnghJ6TKMi5Slh7P+WHDgGhDPtT9ViI/jLj+Hry
         J0iMYHtaUPjISf4xFHZbsk0J77I6PmmKURsRZdzogQ4qMr8jZOFspo8CSq7ZJw4to7Dq
         iHlrL30sRJ7QVhP0itPKvs45tMdA+rlzGxcoVr71koDZraui4LsBqCXSo6vh3fpoBnjY
         dlKqtnE3ZbgLyYd2kn5+aFbIPIQzKd0TLS/b4R7yJIKmCh9OS+agus7olvTW1U36/oU9
         JKzagjaQWvDD4nviyzTO7um6wP8tKHM73Xcjbiw5MdN3PJa2Uv3WqpoPiwUfuuBGHv0O
         LAhA==
X-Forwarded-Encrypted: i=1; AJvYcCWijoLlf/4qSru1XdeOgGCqJXuMwtaUV/dWoRAdMf9vhPjb6SFZhbrjGAlZOJciJceXbLfeR4Y0rcB6ILVr@vger.kernel.org
X-Gm-Message-State: AOJu0YwcoA3ZfSp655KAmg8ALjTImR/AkKGTjsuDq5wWwMQ7yyUxkOw/
	1I36nVeAKYxdK9O4OEXDWhiB7oscQFaFWXueIbJXk6TI5rDN48p29BAYyC2ZeV+l+4M40Juaxmv
	crp3p7Pah5duAuUE9xOynKaWc63oDVBIXNSXRlFEXwsKneP/cDaviSc2INZIBHE/tGvaC
X-Gm-Gg: AZuq6aKFVlKRkh5Wl+3+RHIRXBCB0quAB/etTSDskeXUam+Tz12LBIoJadGSsCin3ef
	horkGEGQaHVGc8QokkKhw2VoekDKW7mBkO0kohT1l30EBnmj6fzq45gY1GczpGc8LBmBrPzbvjv
	qIT9zuR44N0kGcIaUA13N5vs4IMng3K0tMlEsq7hYcGy0qohwOKuw7dAdEHO1K2TAz9gL1yM8mS
	+TmdMI0Ghpij0j6QjR4XKgk3uDL3peeDl+86wqbnAXh3NaROPjutBAF/XjO6iwsBgpY+dygSl46
	nyjPeyA/+re7Ut2pYzpwb0oxRbm8ohkair7hhw9UgqUrInvIxeeAl852BS5HpUYWjpbAoQXDNjZ
	V+dfty5XJQDvLcfeVDagdi8g=
X-Received: by 2002:a17:903:ac7:b0:294:d953:6ff9 with SMTP id d9443c01a7336-2a870e555b8mr44234505ad.47.1769572522744;
        Tue, 27 Jan 2026 19:55:22 -0800 (PST)
X-Received: by 2002:a17:903:ac7:b0:294:d953:6ff9 with SMTP id d9443c01a7336-2a870e555b8mr44234145ad.47.1769572522332;
        Tue, 27 Jan 2026 19:55:22 -0800 (PST)
Received: from [10.253.33.183] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4110sm7374895ad.84.2026.01.27.19.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 19:55:21 -0800 (PST)
Message-ID: <35ab1910-76b8-4923-b4ec-f8c104de31c7@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:55:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuai.zhang@oss.qualcomm.com, cheng.jiang@oss.qualcomm.com,
        chezhou@qti.qualcomm.com, wei.deng@oss.qualcomm.com,
        yiboz@qti.qualcomm.com
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
 <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
 <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com>
 <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
 <CABBYNZL-J3-kcrN-B_1yXci+nw8zjgiiD_YFH0i4xeRNvY_Jrw@mail.gmail.com>
Content-Language: en-US
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
In-Reply-To: <CABBYNZL-J3-kcrN-B_1yXci+nw8zjgiiD_YFH0i4xeRNvY_Jrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1dHXAQcWmeLL7kagt6ho4bkIRs1x2OVx
X-Proofpoint-ORIG-GUID: 1dHXAQcWmeLL7kagt6ho4bkIRs1x2OVx
X-Authority-Analysis: v=2.4 cv=Tt7rRTXh c=1 sm=1 tr=0 ts=697988ab cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uKruyNfH5c2KcShk9z8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAyOCBTYWx0ZWRfX2sxAA/h+MCgy
 5yN4ZKadoziyjQnBUM0vFW/iXL+FvOMn+uSwf59iICrAA9Cc2zkMPhfyb7+UK8RhChQlGrXwWGY
 qTlO/bZyucYKSe0cHIfik9SAp5RwfFmXSfe61faxDE0JKX7KzCag3l18u1tUzuWkGmOfG22tZeC
 7s7H7Y/Qn0jra8s/6sU+ix2MO9E0gb+JXjO3Xbza6E6uVukSnyEDY37gt+s2liVM3kBQALhXaZy
 F/YyD8C1lF/lLudMB/hiicnMj/t14rpPAHFgwuoIhR/vma+yUP9qjzPBo+rQcV+I75KCSru0hrr
 kH8HjtTb52S5TiVQjOBaiS0z2jkmVjEpp2tN22d/cLNoS26zBEKGDucxhmI0SvNb1sTli5K1QaL
 h12Eb3k3ZOCfk3L9LlGOvBFF7/+TbEVZ/fxqD4daoY+Q8AIr2WFXKnrgK3j0YMkODf9EZ/hStUK
 kaM1LcS29VFJczbqtQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280028
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90893-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D00879CE3C
X-Rspamd-Action: no action

Hi,

On 1/27/2026 11:47 PM, Luiz Augusto von Dentz wrote:
> Hi,
> 
> On Tue, Jan 27, 2026 at 10:06 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Tue, Jan 27, 2026 at 10:32:58AM +0800, Mengshi Wu wrote:
>>>
>>>
>>> On 1/27/2026 1:51 AM, Dmitry Baryshkov wrote:
>>>> On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
>>>>> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
>>>>> data structures to enable Hands-Free Profile (HFP) hardware
>>>>> offload support on these Qualcomm Bluetooth chipsets.
>>>>>
>>>>> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/bluetooth/hci_qca.c | 3 ++-
>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>
>>>> Any other chips which would benefit from this flag? If you are setting
>>>> it for WCN6855, I'd assume that it also applies to WCN7850. Should it be
>>>> set for WCN6750?
>>>>
>>>
>>> Thanks for the reminder. This should also apply to WCN7850. WCN6750 is not
>>> considered at this time.
>>
>> What does it mean? It either supports HFP ofload, or not. Does it?
> 
> Or does that mean offload is considered the default over HCI, and in
> that case does it actually work with the likes of Linux
> distros/Pipewire or it is Android only? The fact that it is mentioning
> HFP rather than SCO is already concerning to me, the kernel driver
> shouldn't be involved with profile layers other than core.
> 

Offloading over HCI is the default way for most use cases, but I don't mean
it. Offloading over non-HCI ways (such as I2S, slimbus) need some other
supports from software aspect, these supports for other chips are not ready
yet.

I use HFP because I notice it was used before, like qca_configure_hfp_offload().
Should I correct it if it is not proper here?

> 
>>
>> --
>> With best wishes
>> Dmitry
> 
> 
> 


