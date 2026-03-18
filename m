Return-Path: <linux-arm-msm+bounces-98311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILyICVUQumk2RAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 03:39:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945D2B53F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 03:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BAB13028ED1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 02:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22111E1C11;
	Wed, 18 Mar 2026 02:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVzNt4Md";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B072wxnk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE29271A71
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773801553; cv=none; b=oiUBLQ12WlZaegvdBaTz+pgYCVijhuAh5X2n1+/YSFcQymTmfqfH5EDmGlP/oI4SQI/SnRufbwyQWaINnH7greREiEfWzMPkjw11Tbnlr+KgqT8eXlrEbvDlGPYTOGzh+jJ1SvoKshN8ZCQ6eIkShF+Uf3grynNUKSLLI16taxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773801553; c=relaxed/simple;
	bh=jFGeopBZPQsRok1FIlD1DbqC9aGHt4P59acUQ5h3hfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWRqRDnpRnuq8lUIbM5TX2aotTCm3++xXuYhLZJlU9y9F7JxL5d7WO7rkEYCCiQJlCDEM56ZTfpRsQt1MCI6M37EUg5PvjS9asK+BKSn2IVUstfY2sr7blMucEozWz4D4sAh1EBR9fvHitHJXoq2Hi4OGmChPaF4lrIcQwN6KX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVzNt4Md; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B072wxnk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJQH2402719
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21i545n9MI16ugockY6mfvxsGYXy84KbkzbH+BLNxSU=; b=EVzNt4MdqTBhV936
	k3/p8HHx6OErn+EXF+fVcfsaw8swJN+a7DfnuvW+fBKU+CSiKYgMmqt4qDvIZfGN
	KNqrh16Z47wpI8Jyrx60GHFMJVZp50SGukp7zr9StwhXhnTMeTn21s63+XUKRikA
	Bsxi/9x0MwHcNYWV9ZMc9XN3544P7ROE1/rmiy6sRzWOydbjF7t9gbtc7ghGuqxv
	KevM315fdII3g76xZrtrp0UNSbDHJ5l+BDswfm/slVuCcSb/yRIwGh5wOu7239Wu
	VjTv7rjqz+DH8UbzCqOpK5JwqWEHOZI6FTcB0GUmIw5D/M/L2Yq4V+Lrruw7bV8Y
	XooHrQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dsk9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:39:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35ba237d2e0so3265499a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 19:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773801551; x=1774406351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=21i545n9MI16ugockY6mfvxsGYXy84KbkzbH+BLNxSU=;
        b=B072wxnkrMo0v2Kw2G/4RqUJCnzoiUDEni2pDxueTUWl2VkiAG1LpE2BB/pbRgZ38y
         fMXCWL1CDJ9wcf0rlDbJnhj7Ry0zo5Zv3ws7xCPEzu5VhgAj9g/gQMMkP2Xs09RoDiZw
         adUg1ybMNzyQ81pRc1ovhAc4iWCv1sd9irwdQhpH1y6yqjx3TYHKtjq5qmddjLD7Z528
         AGScFKEbv855ETzYsH/wG/eeBOyVzr3f/pFENT+OBeoCBbsVD6P25j0ScVRt4Ex6yuWD
         k56eMAiB6Dr1r43AVIi77UmE0hUVRdB4H+QNfiCYkpFsP5zS+A2D5/xnyeebNoYgPpBo
         j4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773801551; x=1774406351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21i545n9MI16ugockY6mfvxsGYXy84KbkzbH+BLNxSU=;
        b=h/zXegnR2YZnaVtL2q6KxvztRwJcfp0adjs5mIoSO6CJVg6dIGjv0IbFRuhxuNAmij
         1fWI/Mwi8CuEf1CJuINbF+UBRP1GVupA8EVwjt+txpJgWr9Lim9qYvAWrGjvq3e+9lIr
         wm9VFDsgQKwY6dgh9veY+9NRsLAvMM7Cn728wPqztaQ2HjYlqaUr/JPyv4MKsOf3WkrK
         E0l7g7+0UVfu2qnd0+qj0Xpu251RM9MczW9vxHAQ1J0gbHDgucGxFS6WzRs9dvPBXrI8
         avwtDZlXP2vmwTVtW7L6CcQ096hdBFm6vd7196pyASi2nPBtSOF9TTvN579+9l+l8nRO
         C0Vg==
X-Gm-Message-State: AOJu0YxXMNEiSVlLFURANqGoO8TGeCnfbhOlFfuimJCRma3o3AlAPeZP
	NC4MsUSAWrkru+vT3AEhuhYaJgVgkzZf39W5HRvh728JZj5spZuRT5YaJTYa3hTigBASq2yZcpX
	+ScOk/gkBYiHTkn7L/haHmsIXJ+QUN3q0NIayEosIPl2xkDjLOdCKJVGuFb9meqzkTjfL
X-Gm-Gg: ATEYQzxtQYCevU1xeKrsWO+PHIuI7ev8m/ydvPCYYvAOvwWq544Ms8ctcGZYqM9LoXy
	5/JwkJ7Nh4nEskjUGeiFhYvOEBO94GdeajczntHRnCKB4jHdHu+rbcNJb3yuG76HM+kY6tqOmFI
	GCuh8xU/JQ5+kdnuKYlIFNRxDq9mPR8CHjxXhpOOKMH8jipxJqaO12mRxkkD1z3bWtE7umNI6YH
	y9D++nlWspTkQ03hsyFQlukmO6xyyU+l6sxqNflzh1DsDqRqyfEzAdsS/TjFutmj2jZW6Sw86Ny
	6l7lTvO8xqpBQIMrO2qUpApI7y6hwbfHtOe3qFvXlcbzB4d8sjw8LK6d6JWWag5WgOiRQRWqz1W
	yg5MbRqIG4F4lMj6WGw5UaEHFtHpXkoCvAO0B7tSXK1UZGXo5
X-Received: by 2002:a17:90b:2691:b0:35b:9ab6:1d4e with SMTP id 98e67ed59e1d1-35bb9f24ecamr1376906a91.28.1773801550636;
        Tue, 17 Mar 2026 19:39:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2691:b0:35b:9ab6:1d4e with SMTP id 98e67ed59e1d1-35bb9f24ecamr1376887a91.28.1773801550166;
        Tue, 17 Mar 2026 19:39:10 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bbad9e5d7sm263439a91.5.2026.03.17.19.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 19:39:09 -0700 (PDT)
Message-ID: <f036e127-3291-4928-838e-1ad301010196@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:39:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: support Bluetooth
 over both USB and UART
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260311090921.1892191-1-shuai.zhang@oss.qualcomm.com>
 <cffdb8ab-a293-4535-860c-378a4b8a3d33@oss.qualcomm.com>
 <97a3f3f2-e9e2-44ac-a682-0e0f0c100a45@oss.qualcomm.com>
 <eefb75dd-95f9-477b-9251-dcabfae47c8b@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <eefb75dd-95f9-477b-9251-dcabfae47c8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAyMCBTYWx0ZWRfXwp5M6g7BMWMr
 Yjx3UPTxkIR9/0fPVGcm6mlTxpDxZ24ZgbXXjkxXLeQVz0NHjp8AQBZ2WsIEtbmhgSFN/opbTye
 4UhWv5KVyCfyq7P8y/Vv5dHLSPUpqoosGfGbUpFBciLw0+RQT0cGhMhA4TMv8jfY7fcJL3g+cIW
 +D2A9jFB0tKQeEPfHY1WTURmgiu37ozZyLvsXZOHUFTdQVkm4e86Bo5WwFs5AT/iwqo7w+iAUSt
 fd5p8cUM3VDUu8UpujaVsBPvGlRyDBQlzK383phXHUxu2k6TjdEnDZg65E7N4Rr3QPlwLznJ9g2
 FRUo+PGbdJ7pZuELzPXjHH8rf1gWhlPCcCQY10NKY4BKCJ/WdvfTtWm/brV0uU1dC32slYkef9j
 KH4FqtnjfQaNMjwwEBR+c4nB32rUiHv/3yMZwCAs2QjqFtGLkmJMrTve6nsMwr4dunRBFZc1MPr
 s9jz4qttI1RZiQpfvLg==
X-Proofpoint-GUID: oqNRz0lNXs1kOKUuW-aRiHRQs1aI7OWY
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba104f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8MRJ8AJfQqww6RVhRvMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: oqNRz0lNXs1kOKUuW-aRiHRQs1aI7OWY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180020
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-98311-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7945D2B53F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad

Thanks for your review.

On 3/13/2026 8:34 PM, Konrad Dybcio wrote:
> On 3/13/26 7:37 AM, Shuai Zhang wrote:
>> Hi Konrad
>>
>> On 3/11/2026 9:07 PM, Konrad Dybcio wrote:
>>> On 3/11/26 10:09 AM, Shuai Zhang wrote:
>>>> When Bluetooth supports both USB and UART, the BT UART driver is
>>>> always loaded, while USB is hot-pluggable. As a result, when Bluetooth
>>>> is used over USB, the UART driver still be probed and drive BT_EN low,
>>>> which causes the Bluetooth device on USB to be disconnected.
>>> Is bluetooth connected over UART *and* USB simultaneously?
>> BT uses either UART or USB, never both at the same time.
>>
>> On platforms supporting both, the UART driver is always probed, while USB is hot‑pluggable.
>>
>> As a result, when BT runs over USB, the UART driver still probes and pulls BT_EN low,
>>
>> unintentionally powering off the USB BT device.
> Please describe in more detail how that difference can appear in practice.
>
> Is there an M.2 slot, into which different kinds of cards (i.e. ones with
> BT-over-USB vs BT-over-UART) may be plugged in?

Yes, this is an M.2 slot that can accommodate different types of cards.
Additionally, the maintainer proposed option [1], which should be able 
to resolve my issue.

I am currently evaluating it.

[1]https://lore.kernel.org/r/20260224-pci-m2-e-v5-9-dd9b9501d33c@oss.qualcomm.com

>
> Konrad


Thanks,
Shuai


