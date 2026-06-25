Return-Path: <linux-arm-msm+bounces-114477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rpmwIbnvPGqiuggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:07:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0152F6C4122
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:07:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VHSS0zPK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BN9azT1T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114477-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114477-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2337C301450B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41AC3769F4;
	Thu, 25 Jun 2026 09:06:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CF82641CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:06:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378394; cv=none; b=NK41Nn4tAFCDlO/ZKATmTO86lMy/Wl9fTrCrDXsy0O7kp3y6LHdq5GwUxWxUuaj0VvEG5d4XsQvpIIbMOrfjMHVZvmHIqzQmDk0Upyy8aM6GR5Q9/z3ebTFFZ/RY4sISqM8CCkFJ8x/Jq+bJ8VaLWbLJpUL1wwyGJfA3k6xnDRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378394; c=relaxed/simple;
	bh=pp9eaPjv9rnptr1WI20Uc/j6CcRHM7bBBfaRB0Z2w1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEum9T08FUIv+6zWJZYj/f9fJTutE5ELgWTgMigAMoppliZkYSBjWoc6/Meia/A+BrWyY5Pzvg2/unYhHPbAiOYhlnRf+/hsuoXJOdGZDfguRj8cheaBZGIxxznLm6/6LCCy68t6EANC96k0cSlVmVwwnF0BPTUMlrDJy+9jP8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHSS0zPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BN9azT1T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8p5Bl2951463
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoIbfyB4RGrkSHBFMdH6jDJeDEis0v3MRca0wSXz5S4=; b=VHSS0zPKAZ5zHAO7
	ZIgPyJNV9RROWn6xI9xkYojFGHCr+CYAvDwq3DwDbnE6mzB4K3fnJpdJsjPx30f5
	Mm7ne3afzR3iq3QzfVgc9LuZ6nAIqmGUTIM1NYlJ6lznQmy2SvAIx1KgLG1Pi2HR
	5cwj8dUH/l6z4FpBTCqrha/Q3eTTOQDkR1lF9gENtaQZryP09B/+5l5+kc3SsNnX
	GMIR1xlV7rD51ARgKtGnNfLYwYo0AEnG8dh+/Q8feKVEQFcnKhHgTb7P8wePJxUZ
	BhQQBQ16qH5bwsxFOWefyKZv5ofFN8waXO9m1hVTfFD0s66KFG8IPCoDSH6sfzww
	xG0BPg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynrcc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:06:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f424d5bso1539167b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378392; x=1782983192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoIbfyB4RGrkSHBFMdH6jDJeDEis0v3MRca0wSXz5S4=;
        b=BN9azT1Tu+j1g2AOWUi1xGafkFlZuDodFLHv+ccxbCdW18zmsdepki0hVvlmdJGKFE
         7iyErZd5eciwxcdPq5n2bezVz/+bxcgLwn//P6iSQNF74byzDW6siMVakOOLb8TVIcJz
         vbjICspHxUgSisUWzXZks0dRh5s72fxsqcpf/f2KOQeOJ18/6495cCN/uitoR7uUTd4I
         1LBA1znZ8sV8X5eXipw6wuNMTQ2t6+D2Nhyz74U+eb5bTRZVW4tgEJpkXZiqjNEe27C2
         /4VzvJEzQ/dXs6L8XlvtcRE2WPe5D7ZIeKdF/a50D1QWMX7r1ILA1p1bOtDJkvuraphe
         N8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378392; x=1782983192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoIbfyB4RGrkSHBFMdH6jDJeDEis0v3MRca0wSXz5S4=;
        b=BC0/Iszwd+ZRcnEl3JMRIHvnGJ78bkwf4s2UwVJlir6K5sBqaIZDFlNGWsSvKIFgpZ
         OeJ4wb3tJsoNkfsR1ET2mQtQaTP5iV6S5wgibCNGlMDBwT/SMMxFQdXL5ytFIeX5vCG/
         1wlCF9b4dxMTE3QwivnjPSKzHHOusNSDaCIMe0UEFUpMTjGd3Cj1f0+WcHMs7VkbYIEM
         2TD1oJAU+VWr09Vab4UxFI3Odf3pyUywU7XBzLJwkbaygh17v+wVJwGiJdkSZr6yiEhA
         AAhRd6CV3VQmZrbpRizbpoOynzweDHSIxNxeJFGs5tNnA61yoq0yCEkeqJCiL94njWhE
         2Iaw==
X-Forwarded-Encrypted: i=1; AHgh+RovlhL7emf/5R3t0eP3dXzkJvv/Dk/k+OT+WAXJ7ZSA3bfyP4GlLEILRsVjJ8doN9mBNeFysMbNb8YGBmIn@vger.kernel.org
X-Gm-Message-State: AOJu0YxS1XdXv2XbdXcjklVZagY5RG6fke9SD3rk8adyO9Wp6ui+b7zP
	dXclJXtg8leBeCQs/o5Qqil7m/vdlBWZUPGzmU/M5NwuAbrinJVpsdmREmHDXWwpj6iyjHq4of1
	K1DKxybcM0vLkz8a67wqXqhwt+L/mhMheO12heY/AsQu/0ZH5EFlNweXruDldT63FiNZH
X-Gm-Gg: AfdE7clDWCw0pcxHQJlFoEQsMb8ZK50RjH9sOQ5ehqB3VQDelTKIkCQ4ZS92k7haVx1
	0A5ithe1wEJukyylFc9S7Q7bNw0S1Jbsk3pJS7fQVYkQw795siGHQeIMkOhdPrkoF+xhvrC0fQ8
	lUe7FT6EwEWPcCMBvdyZQY4RY9lX7RPw9Bhp6wwHJ7pXM8lVPrScDO/+x5HiBtBHAbT5a+qlpUQ
	MsAWi7mQaCBzLDL3sIaLf5v5sPmxT7D7ITFsaEMeu418uvg5G9LnHE+5zPdRkSPHTro3TVvYFEF
	4NtXI86yCtDYcyZ5MZPgb7aBSbrSSxSiXFXsRO4b3X9/0unc695+rv3yRSMW6rv0QHNjvbO3oU3
	qRg9rbaYOXRHVpTxcS+02oP1NEwLTo90LvVk1vnPwSeNr
X-Received: by 2002:a05:6a00:744d:b0:845:b3ca:2cac with SMTP id d2e1a72fcca58-845b3ca316emr1705384b3a.2.1782378392074;
        Thu, 25 Jun 2026 02:06:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:744d:b0:845:b3ca:2cac with SMTP id d2e1a72fcca58-845b3ca316emr1705352b3a.2.1782378391573;
        Thu, 25 Jun 2026 02:06:31 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d1b0fsm4240804b3a.28.2026.06.25.02.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:06:30 -0700 (PDT)
Message-ID: <14491fd8-f785-4404-878b-5764bb8fd593@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:36:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
 <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3NyBTYWx0ZWRfX73vPZfHbIY/d
 kP8Lw9Y7GFd9++MNKsZIPhINK7d5SWdVRlPnGlcbkV2zEATTcSHg/bFGsyxOppa5ZPEKdgbIFxL
 1f/dWoog4cqYK3dslMBWdGaWTHGMLoB4Tw8ZqV1bghnsJC20rpedgvNoPOc3PMHGFeDrsUCei08
 rW0PoeaL/SsavL0sRynoIp8hRpoQz4cd1ZO/FIIhTx7Vj8PRQzsdhW4gLly/WhCT2mh4WILzMUD
 dVf5hHrpk2+4fCCqdry6QAIfopXeA2j57dgprww/npa1eU691r5qo7ogzCxjxFt9ihZsMc2UHDl
 tGY8qT7nz5nOtnHljUQmNHoMs9y/mC47Tw4o+2PexT0l1JjohEjMY/usx+7DHBNphCEc4OavVu5
 Jm7cbMGtp/nF/P8PNhuPRmvnExFUzCWJqhDNvEfcq9LxE/yBmxmncSlpngLNyAF1RlcbKcWBQdG
 SSfjlj0lSJ0KCRwM5Ig==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3cef98 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hIrod8inOkKnRalxuPoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: -kkcbwbn_Gz_h51FV4xBSUYswJWnFHe0
X-Proofpoint-GUID: -kkcbwbn_Gz_h51FV4xBSUYswJWnFHe0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3NyBTYWx0ZWRfX47nvXuYw5AQv
 F+hk7kdm+aPhz/u4r/ki7IAjmPzorlOO77uBpHSS86RiyF0dfRnu5+qZAwI6BrvF3lmgM710hGQ
 2OboVxs2j46ibLYbhHx/DBcIYtyjgAg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114477-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0152F6C4122

Hi Konrad, sorry for late response.

On 6/15/2026 5:12 PM, Konrad Dybcio wrote:
> On 6/15/26 6:25 AM, Pengyu Luo wrote:
>> On Mon, Jun 15, 2026 at 5:18 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>> also support GSI mode, which is highly preferred for certain
>>>> peripherals like SPI touchscreens to improve performance.
>>>>
>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>> the controller into GSI mode during initialization.
>>>
>>> Ideally, this should be decided by the SPI controller based on the
>>> requirements. Another option would be to prefer GSI for all transfers if
>>> it is available, ignoring the FIFO even if it is not disabled.
>>>
>>
>> I have read reviews. Can we check if the compatible
>> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
>> presented, then we enable GSI mode.
> 
> 
> This hunk is very odd:
> 
> /*
>   * in case of failure to get gpi dma channel, we can still do the
>   * FIFO mode, so fallthrough
>   */
> dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
> 
> In my understanding, GSI DMA mode is always preferable. +Mukesh, do
> you have any insights?
> 
GSI mode is preferable but if for some reason it fails, we try to 
continue with the FIFO mode. Just fallback mechanism.
> Konrad


