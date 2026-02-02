Return-Path: <linux-arm-msm+bounces-91420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD5vFZ5HgGkE5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:43:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F08BDC8EAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E080300B9CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDE83016E3;
	Mon,  2 Feb 2026 06:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nu70XBL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTJ62tfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECFD303A32
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014590; cv=none; b=RfVTQc00CATnUNj7z+QoplX99LEpdDcKEKxxQ/CbyrobKmien8VI8bokhY2CReJohyS4GkbfMK7SntWcuM3/wP9Uy6vKrxtgCzwMQWCA6ESomdXk9qw+7I6UB3K7t7AQqWiQy/yQnpCG0mgT7LVPtaF3ks7cu7qi2AySc4Vdzm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014590; c=relaxed/simple;
	bh=0QxdRRGpmuIecdPS/q1kZFw2J3XPD1P51KJvNXLxPaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=c/NtymMrFdgWfj/ic67EuhXzi0tsc10ula+YfTFNJI6Yh7P08hCksq8TS+bIhHY7KIdQzxIKwsfWFN7v8d8OfYyN7cqZvRJ0qrIy7qUL+LztD6prlLRdPkQj447ppWrAnyajk/YoQcayzIzXVEJAv+Hi3YmDTpYc1R03lDkOOOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nu70XBL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTJ62tfZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611LRwDq2186296
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	leBHcha+xx0Mjdv7gXom56khxN7YVJH9u22bC5K4cNk=; b=Nu70XBL9d6kaVyiy
	pvI352fi69qp3GEJDRWPOPmRuEp6CVB163B9BW9/l/2K6NsufX4q40tUnFP/V/+I
	EPhbeGeeLnSi2zj1wzp5QdBQFN/ndEm/D2m7SmFpEaooXm5VcsVE47wX0kVFSp76
	Ye7uMFCeladw6kpZItB+ygbogTR19oyQ9YwnJp5cIz3dWIKwHCUbQuwQWu3Jqzv9
	MRuMBlgT8bCnL13HV528BmT7DprY8UpErw+6SWvb0zS2Zjz6xR/t4KsoX+/jh+4b
	bmb1v33Py/7lP6610MLldkOwi+WtEAYw0FkBwq5kLpcj8zSmWfvr5qa+mR9t9UYC
	g4BF3A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard48mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:43:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f29ae883bso29902845ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770014586; x=1770619386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=leBHcha+xx0Mjdv7gXom56khxN7YVJH9u22bC5K4cNk=;
        b=GTJ62tfZSbvBuRphw/5Y3MZeXeAd3r9dRb68LswU3xy2oPsk1Vv1RmjuTvgdiGOwA8
         9FFRTmWQ8IS/s2nVWjljQnZ/Kiua30IczG1CRtg17guTde0NrJMOo0XgpgSqz7enEfyl
         LIKkICFa4OPQinl8dja7IuYbG5YSFX0j0Avdk26fBYelxkLjVLvM4iDh4bqwRaRi3EdN
         NDqiQsByhBnngizTnyPe3C8U5ngt1NdDFMvHmLJsrNw4EVK2Z/BWqtZ9g3/XlJLKMXLh
         yIG9XM5t2k/oC7tfBmMamAPkpAwLPkD3gV5py7VO2RqMcBvTh2MIO753qwcgsFJuh7s5
         iJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014586; x=1770619386;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leBHcha+xx0Mjdv7gXom56khxN7YVJH9u22bC5K4cNk=;
        b=A5hLHI+dU6fymsS/FyjSnebH3225pPBseyjOnwPG5KUAEVIgugTswHUEXNquxhc1CB
         qP8RPJ4/KN9LIXsvKEOQaHoaQH/HgEOysWFXpfE2AQ5gk3LTFok2bYKqVIargwX1Y/eV
         mIBMLkz+5sV7waoW0fLEmvXjFPQHWCbcafp8BWc6Xmc3q5S4HBVmMv/QRVo1+cCQ1rKc
         vyt82BTrLNwUzKvp/KbfZ3LSMusmJL1ngv7DF9/a96a1NC8jy1xlBQdZNo2TYw6ZykM/
         yaxm/5pQq30Bg27eFI1Wvnbpk7MpFJ0nZf8NUrnG3cew5xwE0JaLd0KnUwr2PURy01Mb
         iPQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGep6u3+F+b3M8ZmiwvEzKAzgcP9BZdvTJDzHBKXpbQ9qcL5OXXJCJBsP5qgPmRCJVg741epxJ0HKMdD8R@vger.kernel.org
X-Gm-Message-State: AOJu0YxE0pVVUWOwbGT3GJLZwJn/baXqjTtt+3Ji7T6avARx30s9FSJo
	sWmjnr9ZMesb8oOLRgQnkVF8W5gfijq3aB0NgYINzogCRThZrtHp5nnJhySe2I31LgfM8U8EEkx
	/mSHhNifw43OdV273Kyo1VEBNTXwzYnV0yUbxsXEdn0tUZL4hgbdZC8NGSn2zokXJWuqL
X-Gm-Gg: AZuq6aI+okRNDdb23XrRKPXW5P/+4RJjhnpUFs73kveH+ugAoirT6TmLXPiwW2WNs19
	qfHX5hvL+evub7lmzBafVoepBvTQwcR3cnOAGrfOjCPQxMb03wuv7DLebsUb3Asn/F9pocltJQI
	FemOEOhih5hhYrj4UvVJ0Xbs0G9NVIiatHmDU+A30gVLQmbYwyMgakvWlbB1YAdbJdm6CuocK32
	txhjvcTSm7leAKk+dYn0GnQVvAutm1IKtURhxfXNwHjl2lxK+VhjZqHzIBetddLxJ2/eiWhDrvq
	jCuiw/6HeG4uh5QWjPiA41bvKJncGrhdv3QQH7dgnOMsTlSaohw7AiDm8stywjPX3b6FyVnS46f
	2hTQcUFKwnvkIR5gcivqAKtOSUQCCoUqYoiieUPFVptsgG2gASaWk9mrfd6DZnsgCSKNBQsCnaq
	E+no+P
X-Received: by 2002:a17:903:1a2e:b0:2a7:cecb:9845 with SMTP id d9443c01a7336-2a8d9a51c32mr114092915ad.52.1770014586302;
        Sun, 01 Feb 2026 22:43:06 -0800 (PST)
X-Received: by 2002:a17:903:1a2e:b0:2a7:cecb:9845 with SMTP id d9443c01a7336-2a8d9a51c32mr114092675ad.52.1770014585790;
        Sun, 01 Feb 2026 22:43:05 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8b47f4717sm126072825ad.18.2026.02.01.22.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:43:05 -0800 (PST)
Message-ID: <8b696463-ec6e-4671-8176-432add3b0e70@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 14:42:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-3-jianping.li@oss.qualcomm.com>
 <gfi4s3wn6ssmq2242ws5fduz7s46lrb3wgzvyn3y5djpdqtkqj@v4c5knprxotm>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <gfi4s3wn6ssmq2242ws5fduz7s46lrb3wgzvyn3y5djpdqtkqj@v4c5knprxotm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NiBTYWx0ZWRfXyxphaKU091fV
 ojbqihNUnUeG+/RAGbeCcPSb4RX3wv3yAzSmakz6dsNv8VabJ58dUaOZ8v7khQbmkMduqE0JdqG
 NqbeUHVdlHcu5oXD+GxmHZ7snqPREefC+4nVl+mplM6e57gtcp6pa3RFupe0x68L3NsZcCGhYCn
 yqA8sh1TPzI7SMZXZaYvs94BUKquWIWmPZh/GL2NbgHekCzPUxfAbKmfM4diTxAspzaPyYOXrzm
 Pm6RZp5DdJC1GEke41RSrhBp05IWpi1WxvD9bYMd7aXqfXJy6PQgpWocNfmvj+AxEAwBX4Arlxg
 YmVRsPO6zLVP5MSQRUQzheeEU/kPiP9HlOm+V0/dVgDtvgadKY9uymtC8xczixwfLfRdSQKq0l8
 iRIoEu3rOeQz7Wx3UrKMj6+OaFvHmKU1++EWx22KNlMsUUy6OMwrz+T5wYEb/G6C3czqb/B7cv7
 tAvz0dkiLaFkSHKlueg==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=6980477b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5IayI-uhQhADWBiAsg0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: IL0GXjmDkYzyITBQO38UQSqm5NRVkppn
X-Proofpoint-GUID: IL0GXjmDkYzyITBQO38UQSqm5NRVkppn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91420-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F08BDC8EAD
X-Rspamd-Action: no action



On 1/16/2026 4:45 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 04:28:49PM +0800, Jianping Li wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> The initially allocated memory is not properly included in the pool,
>> leading to potential issues with memory management. The issue is
> 
> Define "properly" and be more explicit about "potential issues". Please
> be more precise in commit messages.
By “properly” I mean that the initially allocated buffer is supposed to 
be added into the Audio PD memory pool by setting pageslen accordingly.

With pageslen = 0, this buffer is never registered and therefore never 
becomes part of the pool.
I will drop the vague wording and describe the exact problem.
> 
>> actually a memory leak because the initial memory is never used by
> 
> Why is it not used?
Because pageslen = 0 indicates that no pages are provided.

As a result, Audio PD immediately issues a remote heap request, ignoring 
the initially allocated memory entirely.

That initial buffer becomes unreachable and is effectively leaked.
> 
>> Audio PD. It will immediately make a remote heap request as no memory is
> 
> Ok, you've described one issue. Beforehand it was "issues". Are there
> any others? if not, please drop the "potential issues" part.
There are no additional issues beyond the memory leak caused by the 
unused initial buffer.

I will remove the “potential issues” phrasing and state explicitly that 
the problem is a memory leak due to the initial buffer never being added 
to the pool.
> 
>> added to the pool initially. Set the number of pages to one to ensure
>> that the initially allocated memory is correctly added to the Audio PD
>> memory pool.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
> 
> The patch  LGTM.
> 


