Return-Path: <linux-arm-msm+bounces-84107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071EC9C327
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 17:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F1B13A1E3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 16:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C4C283FC5;
	Tue,  2 Dec 2025 16:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MhEOWQW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCKiu8wo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF8B280A51
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692896; cv=none; b=Y4QbgB/nFTzxHJZH+HLACC3OmOD5oT5DY36p0cpEx+6gmoq/PV8mM8yOroEd5LXkTy7o80OiKyoF2HCcNiyOioMDPGwxVfzI5XZFO/XhIEAmcChWuwFZy1wN7TEsi5ESByw0WLcDa5CXWWaMQM6rmLbj+UnB05PrN+9FhXs4jHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692896; c=relaxed/simple;
	bh=/fzG6+c7LFnjNfhU3u0bUL3UViKj/Hn79u5Wiznuxl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eazIan9OEp4MJZ7sgzuOkkR906+cYO0gRawnfNSqqicRfSm51CPauiFZEtdGZDEB2Nf4q2RpNJjCyBYhxkTZiLzgwkeB5Dg7KWXWnvUOeeYmCEL4B27ZJunWSwAv3LPbLbyE1WkeGsH6/sNkpOCiLAvUgwoyHINFc5ZHw8UB4FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MhEOWQW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCKiu8wo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B29ZCFn1358399
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 16:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ql2fBAgtpQ2P+ST7cUT3v9H7Lr53iSbslB3cAaHxO6I=; b=MhEOWQW5lDahmfHT
	9+9S9WhNnYJjWJEfZ1OXv8Y4nQKkYeDht0v6nqEqNjtdigL4RWxz1MkO+geyaiQC
	uq7n3I3QXxpmLp2u2BKoywMl/QZ4rWmRSdYL15sw17pXY3LfwILX29IZ9KaikLea
	w6mUORGt0ByrLAxtSkgdzysmmSV8640VRF1ZlynP+hPML7/bSp/z1DCupCAqEPYN
	XrNc3+2wg/o7S6BE6JqVHADhNBNp81DoHWbY8XTgfXj0kd1eC/xVE1lUJlN5vWGb
	o/0JSzfZYWrj2elDaSudTAq5urQdeSXENmnj20tSPUMsn80cXUgSRYzEWNvxt335
	JwK4Ow==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asp63jp7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 16:28:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b952a966d7so9059132b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 08:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764692893; x=1765297693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ql2fBAgtpQ2P+ST7cUT3v9H7Lr53iSbslB3cAaHxO6I=;
        b=fCKiu8wooV17jof0+TrVdGTKr35UaoAiJCUVOFfKimaPZqrlzjtZZX+0ibvJc46kuL
         BnP7qWCYBnC7MIf5HHg3KaCtNeE6XTHGMjTs0Fl75TEsT5pyPhXdHJ3CJyXFd6tCEzQM
         mDZuUYy8djEPCaORF0trvFR+RPWEw/K/TpYYRCeSAOnmJoSBUnR5+iL0QOOS/8B0jgpy
         5DFLmsCs4KpywcNYFEXUpTVBRPtdKVqBhjviVJSGTONzH3sTmgTjI6EhYyH93T+WLzjR
         T/N1HlSZ8LM/jmv50BvmRPF8N6cBTE8MP0rn/61DsqqJ4Rx+B42CH+nPFKmUrrOzescG
         xFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692893; x=1765297693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ql2fBAgtpQ2P+ST7cUT3v9H7Lr53iSbslB3cAaHxO6I=;
        b=YPxHrMaNDzkIRBon2LPZl+gmO2CeDMFQPhSrDmK5nnJenWL6xqXlHEd3usuX3YxbJz
         qmXFhPJQRwGKsfwN8Q1CkL4IJqCaZwiW/KzXuT7xkwP/li7jdwuHbZWbqREOFMNb4MEi
         nYl+jQy9CSzVO76cZcOWUIjNd/V2YZWnqZvbd0ApIw3++0pWG8T5pT2R0dPgMXOOziwT
         CzrQ/InHBR1leAgSodqNlpJMvAik2uv9Xhc1LTDG3bEDNb6BwBqT1+RxG/PI+DlAnWoG
         R4rihy/Cwq98F1KKYNd6BMY968Kgw3aY3TmmDO5a88Sk7UgSeROWPq24U7ZlLIeEalAK
         /YZg==
X-Forwarded-Encrypted: i=1; AJvYcCXUl98uFAjkpoxfRMBHQq8+kBNLkWiecol4C4mo+vwIEx2XYa1E/lqPoRdvUEr3wk4boNlmXoqoLCYLGsPY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Bvad1DV8dBCLJ0QHRg6a2ao0k3us981jPTpQSjS8COLBFmha
	D6+8b6oXu0VNTG8GVyhOLqhl2l5p9aPYJXXsx5knMjnHbPNz4Mz3v4BnL+iNNlQxXtp+jyc5seY
	K3BiMh3U9G3P8Uo3cInrPdLbN7LfNL26C2v2MzkZqYAlS0axHO8z3twUuwEt4985H4HyF
X-Gm-Gg: ASbGncsEXRiE5H0Jvu7AacGT/F0lpEETka+3qbu194wiYl/haMO9d0O965MW+fOXvve
	f4iY5giUvahE8g64cDqYjRon7CNnSyov2yVXjlriG4sfGB1d2DiY/uP5CCdG94dtQ4n+ricUuG6
	DmmgRd2F8Dutp7b1FwE/fn0qy048cuSwO7TqSHvXuA07a9wIo691OHvrYJToFE53Zw4OR9l95it
	f9VkNjzFlg93hU/ugSRcVVHiwr6OvbgnYInqaXXTMXHunwY8fSIQbC0Gi8Z2F+Psj/uX7TT/55F
	8Ue/RGsq5Ho0Nzz4NIbCWrSHDiNJEb/uudXDmK3KsVVxbRM9Eey9ZHs/KBN3CllaUa0N2POIzyi
	Qb7iBmHrBGYNuZcwQ4tg3HRdGFId5qeMBkUny3kkITVY=
X-Received: by 2002:a05:6a00:17a3:b0:7b8:349:1b24 with SMTP id d2e1a72fcca58-7c58e116e23mr43694595b3a.22.1764692893461;
        Tue, 02 Dec 2025 08:28:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSdR8VuHYkpJOg4GE1uXEpIu4TsV+GKdVb8CClpuTD4Tkj7jemoSnPQmqSjEGbPVh6mWu9ow==
X-Received: by 2002:a05:6a00:17a3:b0:7b8:349:1b24 with SMTP id d2e1a72fcca58-7c58e116e23mr43694554b3a.22.1764692892882;
        Tue, 02 Dec 2025 08:28:12 -0800 (PST)
Received: from [10.216.21.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151eb5bd9sm17600035b3a.27.2025.12.02.08.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 08:28:12 -0800 (PST)
Message-ID: <f38fe0ed-5b10-523f-412b-3800183713ed@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 21:58:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v20 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251130-next-15nov_expose_sysfs-v20-0-18c80f8248dd@oss.qualcomm.com>
 <20251130-next-15nov_expose_sysfs-v20-2-18c80f8248dd@oss.qualcomm.com>
 <CAMRc=MeUoFhmxcxsvboKx1E3KCsqkd081d8e9PypuYCCiL1XFw@mail.gmail.com>
 <4f8f9217-f6d1-1321-c2be-5ee1dd807eca@oss.qualcomm.com>
 <CAMRc=MegAtTRvrxXRc1uQLn2F2-DMip-aFwz-q1JbOkny_8dWg@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MegAtTRvrxXRc1uQLn2F2-DMip-aFwz-q1JbOkny_8dWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wcyHgmDMqOfn63_bSoLgEIo_PBJ8xk98
X-Proofpoint-ORIG-GUID: wcyHgmDMqOfn63_bSoLgEIo_PBJ8xk98
X-Authority-Analysis: v=2.4 cv=XM49iAhE c=1 sm=1 tr=0 ts=692f139e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=z2extVIqzVdTwvkK1RMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEzMCBTYWx0ZWRfX77j066oju4an
 aGnkBjEvouoWPX7dmaKzK61jvCYsnB8PW/jFWQn2HSmMm3htlS5Gwg1KToWlLZnTt7amBHWyu1z
 dlugGBIUIi58PdaS9aP985iUPGOfoDaGAl5GU33hk1nz3ZWxhcTdG78FLEvMl+6YD6deN7tq9Gn
 iGCwvi378b/ubgfGOaOJFDpFf5IIrokv6xShi00VtB3dzHtbU+iwuFojbJX2vVpOjcMdcb+qBnm
 HDCpNPmNr0pdLXD83trMtzkWBdWaG2iEZddxQ4h5FhZmrJkfeMbsEVoXQtJGc8sFF/qJGt36nZ8
 kDp92wUsHzYg5PZTKQbaZMxlaesXpO4SULgtmU62Cil2jxn+eVnBgtw3Ny7gtioVE1T9yUAlTfo
 jMXMyYqu941bVt3yDDyOvDKPoOerPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020130



On 12/1/2025 11:23 PM, Bartosz Golaszewski wrote:
> On Mon, Dec 1, 2025 at 6:43 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>>> @@ -132,9 +186,13 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>>>>         struct mode_info *info;
>>>>
>>>>         unregister_reboot_notifier(&reboot->reboot_notifier);
>>>> +       if (device_is_registered(&reboot->reboot_mode_device))
>>>> +               device_unregister(&reboot->reboot_mode_device);
>>>
>>> If you bail out of reboot_mode_register_device(), you don't need the
>>> above check anymore because the device could
>>
>> We wanted to continue on failure, as per reviews.
>>
> 
> You're probably referring to this bit:
> 
> --
> On that note, I would argue that aborting the registration of
> reboot-modes, just because we failed to create the convenient "debug"
> interface, doesn't make sense. I think it would be better to just
> continue even when create_reboot_mode_device() returns an error.
> --

yes.

> 
> Anything in sysfs is not "debug". It if is, then it should go into
> debugfs instead.
> 
> Trying to register a sysfs object with the same name will result in a
> WARN() splat from sysfs core. I'd say we should definitely return an
> error if sysfs registration fails and just make sure it can't by
> assigning a unique name.

So, should we go ahead and make the change to fail reboot_mode_register, if
device registration fails?

thanks,
Shivendra

