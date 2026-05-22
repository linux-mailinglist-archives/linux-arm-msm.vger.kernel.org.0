Return-Path: <linux-arm-msm+bounces-109315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNXnHhFUEGodWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:03:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C65B4B64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C54353083F3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C1B25B0B1;
	Fri, 22 May 2026 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzqNSWgv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLDswXBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56016280CFB
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454533; cv=none; b=j5cCSSRpICjMYUgvs78N1+257VpHbbM2bv9s/4ZNoUTNJqXq9IA3XltSFjOpGhIv2jIYSZugPc+MTOc2rdHb2A9N+PN+XVWVAfhh9S3jYARR9aejMXcyiGBxSeTrDIKsw0mxZWCkiRWX+Olk0T7yeur0ucuiGkz6qNx2Y5M7nTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454533; c=relaxed/simple;
	bh=u8mby+ACV+TL9s2LmGmx/0ThG5WU2JXLP4YTWNGA65E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzTdXt3pVkaSS06BVISr1/1P/cqWgT5yh1M12VSN9GGGyUYBfqf0VLVk68xBI7zizflzYSObk+Junl8OBzQ8GWb0EUtar7iVM8XpQmdQXglHOmAHJGjae5RzKnER5ake5wMMGcOGdyPp645eSPznN/a/QoX9nVhRPDMCYE4HxZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzqNSWgv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLDswXBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MC7DNa1959980
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vQf00yxj1a0MPHiIn8srCpzB81v5fEQ8XVgKIoxl6Ao=; b=TzqNSWgvN/dh7B5l
	YQ4fT2PVuWWQgv9gXTGx/uFmq6v6Qh7wfrF/D08CTEm4w7Rw/qG+KrPI131vk9Qy
	r5ZxQ0QYx9kRN+3TUJvV6WIIVd5u1J/B2zghNLPgtDdd3drhjjd9/1HGzd0ifUvW
	QJ4bP7uhXsxTkkd6UeG4L8PY/DlQr4U6CwLETqzg29udZyJ2EvfuMLclCNo233nT
	lqRNkwMa0IruFx0wAczCgHPqOULIXGLTtj83WXiERlR+nnTOwpe26eWvvITKKA9Z
	G+ROjYlZW5NmezXwNR3KeiXts/SfANiGcvKPKy+T34O4ESaxZSwwC7jVmXpVqHHd
	Sh4YSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxesjbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 12:55:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7748d0aso72269195ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779454530; x=1780059330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQf00yxj1a0MPHiIn8srCpzB81v5fEQ8XVgKIoxl6Ao=;
        b=ZLDswXBYnu7EcM/aYNagK7yqHmaCp3ZgUKKy3zqHIBMRIJEZKsdu40Zf8PNx2OdgId
         WZMOox/ji1ufvzE61WJUVoWaIYaOI3r5gd2XSLBUHn56aJJX8vkaG4SUQ0NuMoyEBOin
         uxfNVi4XhGUnUvrkNV45ZU1aYvsMR4FnT5CuUVqNjV9Jgy+ACzXK4l8PH90nWWHmsRLT
         9k2+unLYaTf9NwzfQ0jC8Lo4w5UPRKbcL3KnJzjYjCqc2vC/aZODA5eA+HWtc5iAFyHi
         90QmFmy8V3C25WDCcgja4Lr8/QvhyVtDH0m7XGI4QrmJSiIUYmmc8vn9qxbG3YZ9aE65
         huDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454530; x=1780059330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQf00yxj1a0MPHiIn8srCpzB81v5fEQ8XVgKIoxl6Ao=;
        b=VhR7nWlqGTrszCjLShrLhYISR6HvP10PiPJ/OsIoOJp/dWJPBLaaUT0fgbdG17y3HO
         W4yG3+832xaX3Hau6ExxDekDWAlG2IOY8h/w0EWgawAfhdjyB5DL3VBaYOe2wsmy45WA
         NyHuURD//dhaBaxd07iKY8VUK62/Azn1ymtH3ZHkDMw648aQC68llHT4DPCdJVwdGqUF
         mAYT2BABOcqZmCOaIjEFNzJjje2qwigjme3adGtGnKigAdFDlhM7OgdNhS78hYqwRI5o
         BTNGepPPHOg6WcXZOS9u3WRSAtI2nz7N/ehfvB/eT5xeURRSK/Q1b/T/vGuSRAw8OeY4
         eq9A==
X-Forwarded-Encrypted: i=1; AFNElJ/pEF+dQYDZL6+v9i4FQ/qtFRc0Vl1SvKBi+F3QQ8VvNzQLVi0feTPUZBuQo3LRlukeYS1CJCvMPl7/YDZT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc9JAk1XsRBtvx6g+3Sm6/lz5RjMnkipb0EAUiQN93ptJgPkZ8
	0vl9YBOauRFc02O/gSyTTk95zX9ojxlPfkMQj6DIIlECrpXhfSxB53ZAoyISXgdd+WlZpH/10I5
	xpgGzbBNCBkWGgkYQMSArbsESuRQxVrgcFpS8A3JSIp+1wkOKztVZMdAYfZwD4DEXbX48
X-Gm-Gg: Acq92OGHkXEYpgvu8C7RMPdD1593xSGV/n4gE56npo0UJEpzt4oPH+FUhB0LOak9daP
	VPM0SvsZ9/FCFmblSl6GcZMVjeAvpLkXrO5dkgDMEjAFZiB6eBITqCjXPEvEczlwvkDc6C/avxZ
	ysufOTvfYU8PDy1IS7TmLJgKbOmT3kVJ8jG4C7ZHZAt7tF+8hVfeOcaZWTepDzyzbYrX4vhRwbb
	S3cP7mjR0CqeyJQo9XNO2oATlvJu3/k8r1DlATZh5t5JihaO3vxXtUV41LWEFbuK0qh/7NIoDSB
	GoKydMvQlZZ0DXYYjlOqM4xxhy04b1atyf/K8xpZNJXF5d5jN5Z0wcueHsPTkhB7lnucEpv7uye
	Q0gmXzKwFDcWzhKT62GOfjI1YPpMi6Ibop3DgmXNcyYaFsXUx1Q==
X-Received: by 2002:a17:903:11ce:b0:2be:3434:4e28 with SMTP id d9443c01a7336-2beb062c567mr34301755ad.19.1779454530129;
        Fri, 22 May 2026 05:55:30 -0700 (PDT)
X-Received: by 2002:a17:903:11ce:b0:2be:3434:4e28 with SMTP id d9443c01a7336-2beb062c567mr34301395ad.19.1779454529589;
        Fri, 22 May 2026 05:55:29 -0700 (PDT)
Received: from [10.219.49.212] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b5886sm15757695ad.20.2026.05.22.05.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:55:29 -0700 (PDT)
Message-ID: <4f0dd486-979a-472f-8d9b-37c1f10e3850@oss.qualcomm.com>
Date: Fri, 22 May 2026 18:25:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
 <20260518081738.2453957-2-ajay.nandam@oss.qualcomm.com>
 <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
 <1b499f23-213b-46d3-b4cc-3b5aae2cad7c@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <1b499f23-213b-46d3-b4cc-3b5aae2cad7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyOCBTYWx0ZWRfX6rNIKBFlowuz
 e8ZerxUCgq6hbXFFkKtcQoiOqpqrgPBWfk2WpCi9ymfRZT04bcdnn8mISP39dIFZBswHAKmCbKK
 YS+ZpdmPAAAwFpyq0LuM8mlZKgriyWDSZrLCvkFwxA1Tr2NGuEJYammYo0MsZwwOuzonTMv7bNf
 V8+Mumt3YWUVSFzAGspjHqJBu2Tf2YNW2WmuZI+c0JLW+sMXUuTUbzTehzqRv3WDEk7hTJUlqkT
 iFjNNJn+Z6Yon62ZMKypv8OFGWhOCo+aE+FC9LOfs5JmZqCWkpIjOma8ubZsMNwPCB6QsgrHCbV
 2lI4KpkEXQR2ULT9m8eenIwQSFV+OU169IbkxoRNsVgIXqrjhN/D1+jQuDQFwv4BnqN/8zu496E
 DaAaZqaIo0X2paeOhbyYBJItjzQiMti2sMslw+KuNA/4LS1w1wxCvla3j8ldoY2wx2jryVcrlGF
 KfUiWEw/D3xu5zIqEVQ==
X-Proofpoint-GUID: hECii4jdNxJ-JmCIru0D6xRVG8EOwpZu
X-Proofpoint-ORIG-GUID: hECii4jdNxJ-JmCIru0D6xRVG8EOwpZu
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a105243 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=jzy3uwMFAPkgEWCbuqQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109315-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA1C65B4B64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/22/2026 4:12 PM, Konrad Dybcio wrote:
> On 5/19/26 4:33 PM, Mark Brown wrote:
>> On Mon, May 18, 2026 at 01:47:36PM +0530, Ajay Kumar Nandam wrote:
>>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>>> for runtime power management.
>>
>>> The driver now relies on pm_clk helpers and runtime PM instead of
>>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>>> clocks. Runtime suspend and resume handling is delegated to the PM
>>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>>> PM callbacks continue to manage regcache state.
>>
>>> +	ret = devm_pm_clk_create(dev);
>>
>> The !PM_CLK stub for this just returns -EINVAL so if that's not enabled
>> then none of the clocks will be enabled, the driver needs a dependency
>> adding.
> 
> This goes for both the drivers
> 
> I don't think I have other comments with that fixed
> 
> Konrad

ACK, Thank you


Thanks
Ajay




