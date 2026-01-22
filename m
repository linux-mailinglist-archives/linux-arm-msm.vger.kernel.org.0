Return-Path: <linux-arm-msm+bounces-90202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN4BNUQocmmadwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:38:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7B67644
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C7597853F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CF529C325;
	Thu, 22 Jan 2026 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9UNW76H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFdqQcui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48512285068
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086907; cv=none; b=L7o8Wc6Xmz+nwIy29/l8IRXKwuOEr3MXOO6yH+i0DhAMQxHc5PvQfaDs3KVQX8CLxnsMqwRaouEmsg5z/n+kKAZFFueiHA7fHKOzTNHXjF7qvLxLbuaWiV+UFfZ9qu/bvyPrbfWjAJa7s49NwJRjZ4aiC0N6+taye4iCqrmUlxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086907; c=relaxed/simple;
	bh=gADdveSoM8o+46ZADSQxyRa26NdWa+6jBjOUZ7l3SSc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=unuAdPHL1Xe/bXbTTZW9LvNjJsFJ6fsOL2kUK178loGlrYyKAKFdB1598HPVb49t5TvisKHb6l9tzpFUreEWGStEaz5+Q4Pc6a3YeVbXmbuckgIOQwm9SPh/Oky8gc3l5/Smi6TDWe4+tKxDOjCq4hepPL8VXQPio5cb+BFrGaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9UNW76H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFdqQcui; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M66hx23902374
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 13:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tTcYS5tH3ozwmazFbcCVIeHW08C2pZQa4cHM4VRC0zM=; b=g9UNW76HTEYdo3OP
	z6c2axRHwNTqA4vntKiqYbwbYqH5x+4RHQdAymVx8Gm1mX1O9nmErcBHEKQzBj2O
	OolNy8vZXflv4Muw8c6pLrimw9aGTV4phz4dYlypyZPj9GJXHAg67LHLSfaXLdFL
	LRuzKaACPffc2JSBB/yXaancJqHrx3OJ1f3DocG52DlciLST85I/QwhOlWCAJcb1
	EJoHC26i9qkn/ZpGdjVk5P49vj159CFQM86AVVPT9Lhtp92TbuNXJsEUT1XbFBiU
	T7j9EXbJavzOEsGfYFgAHr6VkywGAADPpL+nniAZgtLoaYZtk2qEFzkFi9tFwva6
	ifSpiQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khjw1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 13:01:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0f4822f77so18391865ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 05:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769086903; x=1769691703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTcYS5tH3ozwmazFbcCVIeHW08C2pZQa4cHM4VRC0zM=;
        b=MFdqQcuiBhBNvXZEOxICzAwuA7NUTk9RaFy1Xm6r9KBSEVptMubSYb3zZhfCr0MIgp
         DCByarrKBzhwWi/kgDru5sm8msO8O3S7o6Bjm0jayeF4npmld3IDPojnIxOXHDIVd7xk
         j8etV5kCNr79Gb2NTMi2vtpD8CbjJx3YEBVF/35xz3/wiw8i79KXEW8mh0YRwHMQA5hh
         2nmMW+UyqUitCjVnjSp8BiC0K/lMbk3HtF23ACuyCPdikI5ieHR3FFQ8/01A/SDgNoji
         FivQQGhk0hhTT2rCEwXcInPUu18MA6ZselMluqiYoCQ6atV8iuLZgc1osFT9v8zp66N1
         jyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769086903; x=1769691703;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTcYS5tH3ozwmazFbcCVIeHW08C2pZQa4cHM4VRC0zM=;
        b=KhCFZfE22+OZsqpYw1hzFNTrZPc3Cd6sg+40m51iLPHD95R3QicYbRw0xfwfG3gOg2
         ayidSZWfhkwQweXzGrI/xnnKf1MzOqUaRIKXy9JYbsmHJxm2lhiJWgpxP7lsTFN5UT3j
         MyPKqAPcq+JAiitYPNN/9YudN/sRrBLuSMjY+VRMsO0fzSUQjMPoIp+LR+joVe6p9S/2
         5SVNwMy7mcuzTLr0j8mMaoiaeup9T3lTdfzwDiqIONBkTps6wbofzyTKMS6sE4UUP4p2
         H3bMHrtpJYdU6JLDuOo8bWhzGSpsODtG18PuAsPniMWassXV37Ou6B5OSCKyZq78nd89
         YCUA==
X-Forwarded-Encrypted: i=1; AJvYcCXZHOw4yXs4gTJhAYDh1R0ua3e22ct0G/9mIlthdm5oxh6Ct5W5ITcVrgR2Ek0cLjzCMeMksGiEmEYbDMJC@vger.kernel.org
X-Gm-Message-State: AOJu0YzUVNIhybaJiZRiUX52ypdpyX36hBuI97c6WzdJYtigIgCdBpUL
	esRuTgFk9B3StzCklqzert12SYAAjU9KA447pVGuI0/4GO/AVYu7oW1XD1VjBsWTJkL0Z5UrDxA
	TrqfMl4PtrDooqofuhJBIzddr5MChBfDcWVPejP7Eau+ZEEJMv9RImnSlcOAtUSbjA8mh
X-Gm-Gg: AZuq6aKULp0U2zIdRIL86A8brbe2qfP0ICNZTijng81RkuLSRi32zT9psYOqdPLLgyY
	I2TFE0f037/H4NleNC1bry43u94Ip+pBC8RzL/VsBjlNSv4ZnpQa4Db33DKZprAS8j5uZmI4L1s
	5WRcL7aIhv5xseNezFNJUaCdMLGTApBKnqv4x1rcZ0iDHEwPsPVSmSfHlkv6a7h0ygDPoX9JDW6
	mmyg+P0WvN2PPxrJuEIxP+Ia9OExwMKyhd14DjQ/0iwsIOrqKX5FeXOsF9pO/Oqea6KT7goEBy9
	HbSw1w1T1nEHsH2VOKwLBCi0reuB6X8pHsX+n73jnSgU5H5cWTWr5XuQhmHcAQXkn3SM45hOkMe
	8LnH2tAG0SWiMW+AAGlL31guvfvmqDE1/rYtyUGQ=
X-Received: by 2002:a17:903:1a2b:b0:2a7:8839:dda1 with SMTP id d9443c01a7336-2a78839e2a9mr64350375ad.13.1769086903140;
        Thu, 22 Jan 2026 05:01:43 -0800 (PST)
X-Received: by 2002:a17:903:1a2b:b0:2a7:8839:dda1 with SMTP id d9443c01a7336-2a78839e2a9mr64349165ad.13.1769086901094;
        Thu, 22 Jan 2026 05:01:41 -0800 (PST)
Received: from [192.168.29.77] ([49.37.153.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa127875esm18117296b3a.35.2026.01.22.05.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 05:01:40 -0800 (PST)
Subject: Re: [PATCH v4] mmc: host: sdhci-msm: Add support for wrapped keys
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, ebiggers@kernel.org,
        abel.vesa@linaro.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
References: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>
 <3a93822a-6ca1-4cc1-be12-38b2b04704da@intel.com>
 <23c9f3b9-f575-5bc6-e7f0-46238c26a7e5@oss.qualcomm.com>
 <CAPDyKFqJXQ1dYhgfO7bV2ha+GgyOtOtGcm0e-knYCRZCMteu5g@mail.gmail.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <e0d5640a-61de-fc8c-ddea-cb695f45641c@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:31:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqJXQ1dYhgfO7bV2ha+GgyOtOtGcm0e-knYCRZCMteu5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA5NyBTYWx0ZWRfX1Cv1owFocSUO
 x/lab2IQNTbaIDA3M04txg+ob6QFQyqiMw+k6u66AfKMDG9r3V9oBMGVKk5h1OaCAZu9DBEp5Ox
 R9tUt6pfeSwhlzmqpeKXXQr8sWdyFDoDmxV1X3GGRHVnzWfp5U7Sq53DgEbcW8M672S9wMu2d9q
 HBKrawtfD6jMybvBURC3AMC18uyTzVFom7PSAlG0T95zj5tedIjsmPpdD6ELupJiHQKvwlZo47O
 1vBv6BYw014k09BGDNpSvGUl0hlUx0OyoTGGqoS1NNYOyhTIdOt6LY2VME936TOiOUXstDaVB1r
 qTodEaUCVlE4pjp9pN3mKFy3tTL01jZ4xbX5xX8mU2P8WcJtj8Tj/alYPisGkUVGYnyerruMYo3
 4zD5g2sgQweJ8gu/npdcfd6/sLvwc0owcR5A1UOCgbQNkrH9y+7rVTHeIMjDggQoLGjYmU3t34D
 3GZCQ8Ya6GtQtvM2XuA==
X-Proofpoint-ORIG-GUID: ie_gdM98RlKSHGyneJbtOb5sReUGe1M5
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=69721fb7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=mUqJYtKm3DnVQPgbyYslow==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=DbZcFCj0BrKUjWguvZgA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ie_gdM98RlKSHGyneJbtOb5sReUGe1M5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90202-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87F7B67644
X-Rspamd-Action: no action

Hi,

On 1/21/2026 3:56 PM, Ulf Hansson wrote:
> On Mon, 19 Jan 2026 at 11:19, Neeraj Soni <neeraj.soni@oss.qualcomm.com> wrote:
>>
>> Hi,
>>
>> On 1/12/2026 12:35 PM, Adrian Hunter wrote:
>>> On 02/01/2026 14:40, Neeraj Soni wrote:
>>>> Add the wrapped key support for sdhci-msm by implementing the needed
>>>> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
>>>> blk_crypto_profile::key_types_supported.
>>>>
>>>> Tested on SC7280 eMMC variant.
>>>>
>>>> How to test:
>>>>
>>>> Use the "v1.3.0" tag from https://github.com/google/fscryptctl and build
>>>> fscryptctl that supports generating wrapped keys.
>>>>
>>>> Enable the following config options:
>>>> CONFIG_BLK_INLINE_ENCRYPTION=y
>>>> CONFIG_QCOM_INLINE_CRYPTO_ENGINE=y
>>>> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
>>>> CONFIG_MMC_CRYPTO=y
>>>>
>>>> Enable "qcom_ice.use_wrapped_keys" via kernel command line.
>>>>
>>>> $ mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/vm-data
>>>> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
>>>> $ fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/vm-data > /mnt/key.longterm
>>>> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
>>>> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
>>>> $ rm -rf /mnt/dir
>>>> $ mkdir /mnt/dir
>>>> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
>>>> $ dmesg > /mnt/dir/test.txt
>>>> $ sync
>>>>
>>>> Reboot the board
>>>>
>>>> $ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
>>>> $ ls /mnt/dir # File should be encrypted
>>>> $ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
>>>> $ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
>>>> $ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
>>>> $ cat /mnt/dir/test.txt # File should now be decrypted
>>>>
>>>> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
>>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>>
>>> Doesn't apply cleanly to mmc next.  Otherwise:
>>>
>>> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
>>>
>> Is this a blocker for the patch to get merged? I will anyway see why it is not applying cleanly on mmc next
>> but wanted to know if this is necessary to resolve for these chagnes to get merged in Linux-next?
>>
> 
> In some cases I decide to resolve the conflict when applying, but
> there is no guarantee that I do that, especially during busy periods.
> 
> In this case, I prefer that you re-base and send a v5 please.
Sure. I will resolve and post v5.
> 
> [...]
> 
> Kind regards
> Uffe
> 
Regards
Neeraj

