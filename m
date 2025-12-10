Return-Path: <linux-arm-msm+bounces-84879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA66CB2137
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 07:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB37730E5A6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 06:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8877B2C17A1;
	Wed, 10 Dec 2025 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQcI/UkZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJIGDbdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F355328FFE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765348235; cv=none; b=FGBrTWvg6yAOoYt8wCphOaXypgsb6knZ7JAJJi61VexfmritPnGp0XjvEfvfGqfIuSnU80gBoeIGXRvTpTPt7veT6JJ+JE3l1xXMPjXUl3nk7dlZNjPot9+wBlhOaw7aPvPxgqHB+IW4PudCl56bq8cuTpHcbyEJUh4fMFm/gd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765348235; c=relaxed/simple;
	bh=O8HUoaSUxN0lwQuk2R6pVYJ/E9trzG6EwOSZXVhKEdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlXIxcz4TzcKznX9BNTG+lmlFABdihUgP/MAGOTjVSustv+SzaBvNeJVko0eg1pz/Yrsi4GMOkV1gxxfa3VkkBUJ3UpfF2/tT57c881tclvqgZdv65QIWCfLAaCcWefRVC5cg00iD2pt6mjJcq0/it8dDjrITHiFkxppsC5uwbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQcI/UkZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJIGDbdm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Dkn52114121
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6q9RFfbyN7BJ8f14Run+4QbQe+TihAeoBebl1Z0ZT0s=; b=SQcI/UkZuz82q2EC
	ugord4t7WemhvS74IB6IjG8/CJKQisPLSguABIb/HjwJzzYIa6bF/fFVjSrTb66e
	78EsLlySuOAQ6DPTKGrZz3T/HMFFcNTwunGqoiW9rmbDrhXcjnNVsYWIpcFY20cs
	fcgtSJRwI5doz4alP7DDOpaPjla7rT4ylj1em32Xqskeyr0ZNdjj8weA/xgn6BgG
	1AV9y94brL3iSdovkagW2QuWCxQd23Jl/XhhOAPWImzbC0HWDkGHnybyQ2BUfMur
	0VITdoQ7U6kpGzUTBH5sNFyeRbZ3qAiDa72wVeQt6ElLmgIB/aVHGELW1TGhhEdS
	mmkH0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axvm69f1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:30:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3436d81a532so11664316a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765348231; x=1765953031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6q9RFfbyN7BJ8f14Run+4QbQe+TihAeoBebl1Z0ZT0s=;
        b=WJIGDbdmhMl/qlg6PO1EI06sNehQuS9Sr0avFIQhmd9qxFc3hAZSymMXb1MD6nisGe
         WOgNGMenmg5QTMFOq/bd6TLvGj0Dqk+DUcSHVZeReA4q3b8VwmM5e5BfJtyp8rTvxm9F
         CqSEkMqyZNnYELK927+t0JS2IYe/OnLZ50eLinlvHn1flLvZhB/cLlPfnKCyhVckvRQb
         SHDphqgn6sJbacrA6mosspXKXrLJW8h5gtcYX+7KtvyGyvzHD9ZL9nHYGNpzzTwNADSR
         pbTJodClepU5wU2QCF7DK58KDGGruZZgrAaZYxhHeVcE7fRxwkRe88JNlErRg2vUKyv2
         pVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765348231; x=1765953031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6q9RFfbyN7BJ8f14Run+4QbQe+TihAeoBebl1Z0ZT0s=;
        b=mEFmR+agKAHyaYtBIWNqp/lnxwjLCCMSb+hH9h1E4hI+ozKWMuoa28EGoA7dD3WIBB
         h29eJaJwFIOPRfGhlrqMVfl+0cRMT5j0fUJhVM4UcLMrTw1qqk9yuvg7HmToFuJ6DY3X
         AEkOkbqKKLTIvIWD+M37zLwcFyD7nzqy1aK4b2XZAvcthu7pw0/a8iJEZrBV+uyJ/q3q
         XFELxrxccSLP8yKG8TA8h+fuR/xTpWFjQaG7ik3JUKzbqLioUmSekGF1xgc0Nv6x69nt
         D7BSBq167OtVLgBlQ7/PYXE28b5XgnX3xKLy89GgrAOrTx78tahex3kVL/v8UpFLhymn
         Mj2w==
X-Forwarded-Encrypted: i=1; AJvYcCUG0bKYprw4Z1rO0LTDRzRBAxZlb7ypxq1FSsUl45TynxNU0VWKM9qNFDIXPOe8ap+MAaxWJq2IdMae8nN9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5TnLQxhj9jU1VWeoSILPzR/O/oT7cBFUHEYZJVBdDBOo+Iuzq
	bfr27gTuwtAqqCyoqjthSH5LyAZ9E4JXN7h4mXgS0FMSp0kzQCPfmw/c5JTapKXDSK+VPtxv69q
	OezjBTnkm7GgXfY4jy0Mu2Lyw24ftqhYdg7pQfaX7PgFvkOoqp4JjUchsvctDfUFuLj8C
X-Gm-Gg: AY/fxX6bPs9jN1Y0L0dyJZZDkXl5Ej40DeqHp/Hbq1ntolWqj/f0mssuWOxjpdnnM52
	Adf/DiEbEKF5TOpSuLPcBwcdnhN55IDRMB9OOgRwsJGvVVuyJOzLXfT7vPjYI8XR+Y0An+QcKGL
	2MAV6n4EQ7M6volFrm3xwIIgc65mKzcgmX411aYZntetn2KZvmlwaaH6CsETvrNpzZ/nCjjvus9
	mX9bov+YicAlG/douTkCwA4c8sJPhQNDzYEhpo/4lhTf+NhAlcyJpQJcTF06f9DmjcFAR5+BJc3
	Jcm6iy5sEUTI4/Dp0LZH+IP+hABWwYkd72GpRkw3eyvT1cm9l0c5WjH8hVycyOSmreQP2f/49oW
	Yt6iZwaoW6QonmeaTGEcB0+8HbbesgppEfRIB6VIHOo7j
X-Received: by 2002:a17:90b:4b8b:b0:349:8a8b:da5c with SMTP id 98e67ed59e1d1-34a727cfdbfmr1209106a91.11.1765348231169;
        Tue, 09 Dec 2025 22:30:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXMxHZ4YLg9CFRwKxi/cgDsFxsPK6LFkqm/CLc1kVT+n707zz0quc94eSaxC/51ZwIj/qpLw==
X-Received: by 2002:a17:90b:4b8b:b0:349:8a8b:da5c with SMTP id 98e67ed59e1d1-34a727cfdbfmr1209079a91.11.1765348230691;
        Tue, 09 Dec 2025 22:30:30 -0800 (PST)
Received: from [10.218.37.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf5fsm172705885ad.78.2025.12.09.22.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:30:30 -0800 (PST)
Message-ID: <3470cae3-d86c-4dd5-a24c-c7f4bf6e017a@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 12:00:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] net: mhi: Enable Ethernet interface support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
 <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
 <5a137b11-fa08-40b5-b4b4-79d10844a5b7@lunn.ch>
Content-Language: en-US
From: vivek pernamitta <vivek.pernamitta@oss.qualcomm.com>
In-Reply-To: <5a137b11-fa08-40b5-b4b4-79d10844a5b7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2yMY03Z0RVNVFZgvsahsad3VLCpfJD3L
X-Proofpoint-ORIG-GUID: 2yMY03Z0RVNVFZgvsahsad3VLCpfJD3L
X-Authority-Analysis: v=2.4 cv=Ztbg6t7G c=1 sm=1 tr=0 ts=69391388 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=qHXWqmT0JF4T8da83qwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1NSBTYWx0ZWRfXzEL5xaBFI7ZF
 4NBrqGLr+V0AP5uVcWIb3RhFq12ZFzRPg38zUUoOltIOxjAsyAlTwE5ngkMjfwkhLMGiI5S0Z+L
 fXKAwL0O9uSem0jmi/hYK9Hf2KUHK5wLtxzU2kmO3jViMDr/cUPZrKKwFNmYAySq3Ww0edLw4Pm
 B1OHB/UANBATlUpQl3QkVvbun7DHn8COUljvNgzteGCjNlE4OFX4ecwtu1QKerm5ozNzz+gFx3R
 5xX4C1qY//QCO/9XEarb7ixp/0yqpMDeK2AAArMmcffJl/EyKa2CNE6ujBnUbW4uU7+CaOKBwtw
 SqF5jWujg/hS4B8V0ZCrr3Ij5vfcqBx0blGBebyTix3JYuIcmF2N6/P6yusnUCMYn1fYl3Z2pDw
 v9gXT6CcKrwU1cayU1N7sNK1or3rMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100055



On 12/9/2025 7:06 PM, Andrew Lunn wrote:
>>   	ndev = alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
>> -			    NET_NAME_PREDICTABLE, mhi_net_setup);
>> +			    NET_NAME_PREDICTABLE, info->ethernet_if ?
>> +			    mhi_ethernet_setup : mhi_net_setup);
> 
> Is the name predictable? I thought "eth%d" was considered
> NET_NAME_ENUM?
> 
> https://elixir.bootlin.com/linux/v6.18/source/net/ethernet/eth.c#L382
> 
> 	Andrew
For Ethernet-type devices, the interface name will follow the standard
convention: eth%d, For normal IP interfaces, the interface will be
created as mhi_swip%d/mhi_hwip%d.The naming will depend on the details
provided through |struct mhi_device_info.|


