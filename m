Return-Path: <linux-arm-msm+bounces-119201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /1RHBmdbV2pIKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:05:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1FF75CC23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:05:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LTh5Fnct;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e7giyicm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119201-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119201-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17C22300DF44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC64F433E7A;
	Wed, 15 Jul 2026 10:05:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861A743B491
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:05:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109916; cv=none; b=LVCEXphUwRhCBLz7w5V5bRhsBMPc726HPPTAM9GA/wXDlaJ/ILZqvHetEk9XHd5NRiBJa+HLjdmI6Ya6AE9ZhFS+s4/dZO1sSlBgOHZrGt8wPF6ORVh/FfM0uf1RnvBQYhHPo7fCWGS3Xm1x+/kfTuh1YQKVgBmcWkni8oXqJWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109916; c=relaxed/simple;
	bh=LbNgYcWtJ6EleG0VPELh85DRLTftctcuvjFpUmM5vgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xy/VIzO6VEeHqU4io5EBpkt7AOmaqLdvfqtLQNi8WpD33Df3JG8g2qqTO8PDKmneID0k1Q2O6Z5ZW918BRvWEwhbxt+FMART55ie2uo6nma4KLxcVKC/EEWICOqHH9s2nECVw89JDYBZhRWkP8QZQI90S2AReS7n1UMYRLWBsMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTh5Fnct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7giyicm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9R9XV3143676
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqzgSP5QBmA9GAEIiwoOdcOIySaSoE/ED4xZMe7OFWM=; b=LTh5Fnctn1zN9gfG
	8w2C0QzhlwwmTDvtrld62C9SeZg7nQt0der8k4w6oR3QXAXJ2gY7f/TrCB0wBgLg
	viqWIrHgHdgTZNyKcUzRtKFvkCdPr40oMImVSJ2FJRDcA4SlGqVD8cxFEMVTLWml
	QB62TqHvPtDdkSm+Z/7Jt5Sb9kXqBI/YsQiu8q6CkkSzeY8P1c6zzGWpFhqK1vIG
	JVP9EDwiSJBiMn/J3sjG+QYtfXuKscp0dVLDuBr9ezNaYPEw4iARMonm+sPpXpiI
	9eIoNmosFM9i1aP+sXKITngk2OR1Ptyz4nl0aPhdJYi8r2rJli3Yuvi74IeH7nrI
	/PFa4g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka84pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:05:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso1814517a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784109914; x=1784714714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqzgSP5QBmA9GAEIiwoOdcOIySaSoE/ED4xZMe7OFWM=;
        b=e7giyicmQ8G1Q2heQ2iesOMMfsoRj5EgHAOKDeTwX6P7Z7VfvI25C4uOLl4DGSezTs
         8PUzGz/U8FH+3QY9ZKsU36ARNrD/QM/e7V6mX3jdNH+katp2ZUmx9wiYRgUyWL7oiMqI
         bYTKq8YbEmzYwdP4Bvdkg+yqKHBNgOl7GINo8MI02pgCvmIkXrYN+3MVx1+xJhqWzYOp
         /h+CERCnVMpgK+ESddU/kLnrxpVRFFSopdl/ycG7f49E+o4tWPMsQP3aP6ZyZckHZKCN
         MZFsez4B7xZ9ZS/PgtgMsVDH96NRrqhBbJ2Nj8c+69ZiySDHVYZhIOxk5MPqmo9bjUnu
         miwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109914; x=1784714714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqzgSP5QBmA9GAEIiwoOdcOIySaSoE/ED4xZMe7OFWM=;
        b=I0ircsHxPGFgoPBAPypfXPxiXVx1IYK5hoh04rG8AGZFRdrBBD83vKiCUS/Khb5LS5
         FPxu1jrTGZJPNyhiT9qvDCRfXZFG7BbS6MCtqtycevp2rKJIdKIwOq1PoiW+AAsVAlo2
         0U/f+fElM/Myo0GCpHZRG6SSMY+RAqgZxp836rCxiYT5QXXzL16pHbh+ASMbBrhdcnBU
         DKSD1RZ468kNIF1k9oIrWq7ahiD3fvUsR3c82naXBhBq5/tvDe5Vdw0lShN4lwPA+v4+
         QPzycM83tNYm5RyEZSlGUh68YJlmfsVZjn5x4B1mlJjo/Lu25VGy+hf6bNqwnnvmpJtp
         me0g==
X-Forwarded-Encrypted: i=1; AHgh+RooV2fBtebE0hUAqX2JjivplzpYfeFL8qtmoCuRzGVnDSbYA+KUIFcTio4yw91y/qf7kTX3DF/WYBH72ah5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt2RASlmdzWctZI0mWpHXdO1y5uu8sh88MkDsaKV7LnNneQ0K3
	wESff1nTviz7PK/LJP71oUst4WasyVBGodbAW7JRM1PUwvgzo2va8AEChz5qTwmGwMcbUE14WCl
	w7fPQqGsD5u4LNNe94uI/74UfHxCtyN75K5TprqTs3+cows/YLj/CtxFvlKe4Q2BR9YL6
X-Gm-Gg: AfdE7ckqDSytDPTAYMDcUaryhCsnK09NzEJelCC+pmhAIOOhqD/RySDwiFjkucyy9Co
	FOIWx2vKPWY22iu/e9Mi0USob29/3AH1jK6rmlG+EGImkj2M8jekIo1yBEZ7Ka6L/9TLBC1wP22
	q4LQV2kmfogu8SdZcK4B7jhPAkNsW16jl1bXrGNCAqLiGOv5+iJoKRRREOEHGxTerKPNvgQkXQw
	6gWD1acPosf5OQcLBjmyCjHmH52kHy+jk8oyFnjm5HnHGYjY9cbZ1XkecT2tBPG/ZmpL7j/60Oy
	KQfhjPl3QoC3hegUuPZI2qvIQ1IrEwTAySwM5YTPkcXnAN2NINau8o20x7wgBB2HYTsd89xYdZP
	WmO4CVAsmNPIhXKRYK00+NBHD5bTdr9e75y5f9+AZ/jo=
X-Received: by 2002:a17:902:d98b:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2ce9e5a55c5mr162929135ad.2.1784109914149;
        Wed, 15 Jul 2026 03:05:14 -0700 (PDT)
X-Received: by 2002:a17:902:d98b:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2ce9e5a55c5mr162928845ad.2.1784109913683;
        Wed, 15 Jul 2026 03:05:13 -0700 (PDT)
Received: from [10.217.218.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bbaesm130823715ad.57.2026.07.15.03.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:05:13 -0700 (PDT)
Message-ID: <54c99b8d-158d-476a-b965-bf2f64b16237@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:35:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260710161056.1799019-1-aniket.randive@oss.qualcomm.com>
 <e53ea721-bcd1-4d8f-9b7a-ea6ec3003f71@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <e53ea721-bcd1-4d8f-9b7a-ea6ec3003f71@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a575b5a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z_QR8a_bo-jD1fP4SgEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: XtF46sXXwpNJtjNPaZ3cW-YF1DmNqWe0
X-Proofpoint-ORIG-GUID: XtF46sXXwpNJtjNPaZ3cW-YF1DmNqWe0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfX3feisuEedGfI
 /ekZ3nww8jjnvKBUTUbKUXVr1dvb3khRMmw9eqSPTqwHEoiZfbD9VCQ0UMEVVb44sf8ghNQLbx+
 r3FjGqvEayH35JKGpAyZ9RquNUwvZj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfXxfz2ILbN0Cih
 QcigDJ8sx13ohmeb9QR5g2ZbshHjKT+O1vU9amvA6RMpxTQiYiHWUUcFDadppOX6reCyXUW2R1o
 jd8Vtw1Ua9n2EH8jdYVCgqtjngv/6EKbPoYILxL6FCS82XvnUOnAJqJqxZ5LDrN6Cb4Z+APa+5r
 4P6lPrmZEyp79RbXW2qG5vENgKkYwBTUH6W520uaysMbkcmxqFUCzPnckHJJxgB19Od+W173ig0
 /JRAjHskjEuch0QXhlH588E4p6KoNfNuv340foyhloqWpjdnyQygSWWin34JdUy9bwxIeW5F+BI
 0CKphdXpSRt7Al81kryIb+ZRYxyFk7zSjQjPjkUfZM0oFU0LdtwQbD/rRg9eICi6IQgbuN/4zJI
 kMeNO/0kjtDxrVN/9M+G2VzNSq/PRGK9ULUGdyk+Lo8sXfT8MQX+Bhojp09rJZ6iL2QD82zElKb
 IZ4x/eqlRW0SjHpOldw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119201-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F1FF75CC23



On 7/15/2026 9:36 AM, Mukesh Savaliya wrote:
> Hi Aniket, Thanks for addressing previous comments.
> 
> On 7/10/2026 9:40 PM, Aniket Randive wrote:
>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>> regardless of message length or bus frequency, causing unnecessary
>> delays on error paths.
>>
>> Compute the timeout dynamically from message length and bus frequency
>> with a 10x safety margin over the theoretical wire time. Add a 300ms
>> floor to budget for I2C clock stretching, where a slave may hold SCL
>> low indefinitely during internal processing. This detects real hangs
> not only internal processing but it may go bad holding SCL low 
> indefinitely.
>> 3x faster than the old 1s static timeout.
> Meaning, in such case/scenario, don't need to wait till fixes timeout.
> I guess, 3x faster is relative to the 1 sec, but for larger data and 
> slower frequency it may not be 3x. Hence, correct it accordingly.

I will update the commit message in next patch.
Thanks,
Aniket

>>
>> For GPI multi-descriptor transfers, use the maximum message length across
>> all queued messages as the per-completion timeout.
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>
>> Changes in v4:
>>   - As per konrad suggestion used mult_frac() for bit_usec to avoid 
>> intermediate
> Do not keep space before starting, directly start with "- As per....."

Ok. I will take care of this in next patch.
Thanks,
Aniket

>>    overflow on 32-bit targets.
>>   - Updated the commit message and added a driver comment explaining the
>>     rationale for the 0.3-second minimum timeout floor value.
>>
>>   drivers/i2c/busses/i2c-qcom-geni.c | 46 +++++++++++++++++++++++-------
>>   1 file changed, 36 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/ 
>> i2c-qcom-geni.c
>> index 96dbf04138be..c5c3adc8ec77 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -74,9 +74,13 @@ enum geni_i2c_err_code {
>>   #define PACKING_BYTES_PW    4
>>   #define ABORT_TIMEOUT        HZ
>> -#define XFER_TIMEOUT        HZ
>>   #define RST_TIMEOUT        HZ
>> +/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
>> +#define I2C_TIMEOUT_SAFETY_COEFFICIENT    10
> Add a line space to make it look clean
>> +/* 300ms floor: budget for clock stretching; slave may hold SCL low 
>> indefinitely */
> Already explained in commit log, can remove second part.
> 
>> +#define I2C_TIMEOUT_MIN_USEC        300000
>> +
> [...]


