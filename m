Return-Path: <linux-arm-msm+bounces-92272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE9mBU7YiWnaCQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:51:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCBA10F074
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37FA530465F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01F236F434;
	Mon,  9 Feb 2026 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AX5x8KF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QatWDuSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9D36F427
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636896; cv=none; b=iyC6ZK8jgnSJQAcfFp81M+1DA+rQIZKMf9l6yfK8TSrQ2Rb/nz3Cywd7Eo1F/mHw+cGwgV6jw1vCAHkuZp5fX3+BPJJgPU5P4OilPWQuv0VH9+XIqz3J+rnpUqGslpI8Ljim4YcYs4sekwxjuIUSgPDX35TJ8hcHIwzHIzgIfWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636896; c=relaxed/simple;
	bh=zXnm7jdzas/Vz0xpNjjHseVr6CkVlHCxbdTWauQAf5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQbHs7WB6ibSblA32uI85iLp1uC4amVfiDE05JfWoMm174d1+NW5hh1xWJX/0pFRWGjboGijfU7AuewxipkKmORTPaFn6RWpcNGmnxqVVPtCthxLcGiIjOsWgsCHrUwP3W7VmaRRq+Tq5k5wEKGhYTgdFRQfQ2ZDxke6UM3Vgw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AX5x8KF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QatWDuSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BW26C2031718
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 11:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wQHpzaw1kvRqf/OGFpYXqfnuHEkcJcWKMi2NgFcN08=; b=AX5x8KF+mG3YdHAy
	yip3gUqriFa8MvhQi+MDQfJCSoHFRgej9qCD2jZsTSrxEVTzsMX6hpzN9TvmfR5E
	sJObi8oYSiFCWIF6beAkGGf2qYNar2xbkxlfTQtjl2fIWRjS25r5GEZouvJgy52s
	AzygY96IGyaD58rqyM4HoyZ1XfByG+dq8bwIUyZjFpE/qjQBEdwoJ/oucZ8p9qI4
	BmVf1bJBZ12TOKFDXlkeHvs8qsbv/hCwp9uMVR5SYkFWu42ooju80w1aNtmWuJlt
	KShZ7ysGoBx3kCMTAY58teQLZjSsZGyzgwUu1BObG71E/TB1mO1zcTkgfcj8Mh/H
	dee/2w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79d3182g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 11:34:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81efa628efbso3119547b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770636894; x=1771241694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wQHpzaw1kvRqf/OGFpYXqfnuHEkcJcWKMi2NgFcN08=;
        b=QatWDuSITpf9Y0cLXS0reISHczrNEAL+v4PYZ5SLubEpSai7mEje1qXhguOFRrGRiH
         qwRpbgBQM1bffd4yC8GbfxTuWf9InuclMThlPrDqkWiRKT4/FIw//FqLCm6ObuiEGx6U
         iAoD7h41jzN4V6ndD9gBZGFyw8HgLnxp0LUqRHOK9jFzQ4HhkI94mFmuFx3D3c9kCAvp
         6tTqOq3rW/J/vo5vlXkZnwMjp7kyM4HDPN5/uXWSpNXItKJPdhquWxVhVNPzOU1ZW0oq
         Bnjk7bPumTNFUtycsEYnI48325tStp9LVUkFzETMU213CMd45h3Of3TvRo05ZHJNZERe
         gOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636894; x=1771241694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wQHpzaw1kvRqf/OGFpYXqfnuHEkcJcWKMi2NgFcN08=;
        b=E80f7NoJxLtYbsObuLHTITRLqiG+/F6tcfFtDGkdZqFaS5hK8RGwjEVhqQbkpSoc6d
         5pZkF8CUQ03zry90/VbWsKZFAeJoYUG+5zpm0qRyXGeq/9FdTnwid24aMmG7QwEKqu2W
         G2dFk63ybnp3vG2fZk8z5gTp7kSsJdnVYoWkIl/yL/y08jDD17scfq8nkN5AhqZX2wSX
         oWY3lik1jU0eHQmTuSwVD7tZaO3cF8I23BRMVDNZfAlHU20X3hj7/tRKR9FlKHSspJsX
         lyDZprEm18Fl8Oaoc6OjU/SEE8uwzXBS/Vew5j/hqSIJIKw4lwUbv96ozk+hELuLlzF4
         +UgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXldghLy2z9rDQ6gduBV9lNKkKegISk5IddaCLHqELWBere0gOYqq0J4GL4e3XLhc0TBvgsjITU9ZN8JJ4n@vger.kernel.org
X-Gm-Message-State: AOJu0YwlU51D6ADmYxB/PNJVWbyJvwF20OrbyT1LSe0zkvhRRpbtDVVp
	WjFL5dQHCWvekWPkEgUKbnGLxbiXGu982EVM5Mo+cY0HhTlSBiHdecRgiRvZKrnhHWfPjf7WPtn
	0/hBtpzSdassc1u0ySsXTdvVjUNGllBjgoBHS/F1FhABuHVKGOQdgpHUgT6ZlAnd/qiHn
X-Gm-Gg: AZuq6aJiVFmDXOOo+tzpNYZb2/mrZHJLZQhP0TIEu795gzI/UUlZIrBrVOMNwNmyKiP
	RBUxUIRwliC63hCGibc2RXI6medOYarTYkzsdUyzHjKod817WMWd/pB0lpy+aUKifH6o3lI/mwo
	ipA7S4G07EBLyPlyy83AYhbSPsz9s/UVagqishKUWtnIQkxHaeQjHjLRTEpTi1+q9B2ZHvpUau1
	eUCgubPggCZ7bUs8LzILwfhUpVp6rzxwEVcCF161/5qgy0gCjVPSc29W9R+7hAY3mi0nrYUl5VS
	4qhJlDSczuI/zPoj6azRz21gy16A2JfWLyBv7tAwdK9E41XzLvPyk+twX3+HYpkSdzQRvowPx9f
	bg0WqaAowbeZ+KX5igoOonOXmR1QkwYpygmfETkx/8Q==
X-Received: by 2002:a05:6a00:4c8b:b0:81e:f623:ba04 with SMTP id d2e1a72fcca58-824415ffc05mr9975593b3a.13.1770636894544;
        Mon, 09 Feb 2026 03:34:54 -0800 (PST)
X-Received: by 2002:a05:6a00:4c8b:b0:81e:f623:ba04 with SMTP id d2e1a72fcca58-824415ffc05mr9975578b3a.13.1770636894064;
        Mon, 09 Feb 2026 03:34:54 -0800 (PST)
Received: from [10.0.0.3] ([106.222.232.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244166f3e2sm10356514b3a.10.2026.02.09.03.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 03:34:53 -0800 (PST)
Message-ID: <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 17:04:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <20260209-iris_sc7280_gen2_support-v1-2-390000a4fa39@oss.qualcomm.com>
 <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA5NyBTYWx0ZWRfX4qfIHVtNAjXy
 wJs1+JW71O77dSjshkMXEvO8ABCEH76KoqfBPIH3d21fuO36D/DLq/ZyEiT+qDuP3cBFSzY84Af
 v8CvSFhDcU9Qv5JpCP0+1K9qBSy7dc9u4wJnY0a+/tD+3RBHHOLt2XWjQbXh0HGvQ/dGihG33g/
 VMmWfdLCIKtFn030b1GwJfJci1u4ajGyC71gKI8Il7894iM5tZbGHdbJhfaKTVyd6JIWurr/ogO
 moaHNXlJGLoy6tXm12bXFD66zQMk2FVXg3r3oLglhT3vSfmdbirGZ2I5UMFHIgfzINcKJfpdCIc
 9bINSMEsA+s1Dg1cIHY6PY8N2hZO+exF4kO1iziDuRIUozuEhkp8n3qMgRAmPp3a/wPbSf+fPzb
 YL5m4nAr70KBvf+FxbwRtnFUn2xPbrUgfND1KmgD0Tf2gCxHH+W9fgRsyZ1u0rON8FjsFSETDrC
 558mU1/dsEnhwZM8LRw==
X-Proofpoint-ORIG-GUID: wjEHafGT0_78UNRqJHypfvOTdhy6oAxM
X-Authority-Analysis: v=2.4 cv=GJAF0+NK c=1 sm=1 tr=0 ts=6989c65f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Q1L4dSpLiPPsWIQ2aSSWHQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Z23RTWgoM7wVZOyl_gUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: wjEHafGT0_78UNRqJHypfvOTdhy6oAxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92272-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADCBA10F074
X-Rspamd-Action: no action



On 2/9/2026 3:32 PM, Konrad Dybcio wrote:
> On 2/9/26 10:45 AM, Dikshita Agarwal wrote:
>> SC7280 supports both Gen1 and Gen2 HFI firmware. The driver continues to
>> use Gen1 by default, but boards that intend to use Gen2 firmware can
>> opt‑in by specifying a Gen2 image through the Device Tree
>> 'firmware-name' property.
>>
>> Based on this property and the availability of the referenced
>> firmware binary, the driver selects the appropriate HFI generation and
>> updates its platform data accordingly. Boards that do not
>> specify a Gen2 firmware, or where the firmware is not present,
>> automatically fall back to Gen1.
>>
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int iris_update_platform_data(struct iris_core *core)
>> +{
>> +	const char *fwname = NULL;
>> +	const struct firmware *fw;
>> +	int ret;
>> +
>> +	if (of_device_is_compatible(core->dev->of_node, "qcom,sc7280-venus")) {
>> +		ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
>> +					    &fwname);
>> +		if (ret)
>> +			return 0;
>> +
>> +		if (strstr(fwname, "gen2")) {
>> +			ret = request_firmware(&fw, fwname, core->dev);
>> +			if (ret) {
>> +				dev_err(core->dev, "Specified firmware is not present\n");
>> +				return ret;
> 
> This is fragile - if someone names names their gen1 firmware something like
> "myproduct_gen2_vidfw.mbn", it's going to match..
> 
> Could we instead do something like the explicit format checks in
> venus/hfi_msgs.c : sys_get_prop_image_version(), based on the **contents**
> of the binary?
> 

I agree that checking for "gen2" as a substring in the firmware name is not
reliable. Unfortunately, we cannot
usevenus/hfi_msgs.c:sys_get_prop_image_version() (or any Gen1 HFI query) to
probe the contents of the binary here, because Gen1 vs Gen2 have
incompatible HFI protocols—probing a Gen2 image with Gen1 HFI (or
vice‑versa) isn’t viable in this path.

To avoid accidental matches, I can switch to an exact filename match
instead. That way, only the specific Gen2 image (for example
"qcom/vpu/vpu20_p1_gen2.mbn") will trigger the Gen2 path, and boards that
want to use Gen2 can opt in by naming the firmware accordingly.

Thanks,
Dikshita

> Konrad

