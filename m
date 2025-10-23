Return-Path: <linux-arm-msm+bounces-78423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF4DBFEE50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 695D619A6DE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455271F91D6;
	Thu, 23 Oct 2025 02:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5rYdFIO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6141A9FB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761185673; cv=none; b=q/bjOTKZ6KZjwk9jTvLc1A4cML7CyHd/rn05Xc/A7ogzwMa2s8bUFV8lpVNVWSomOSHG79d1PXqzJ0k6aBQgDoqDZxMIZRKXwuj6yycCRdp8ucs0/KMnDuzNVl/fnfqgaChVHGQ7ftbiA17lsWH4V5kL2K3sBzOrOzvcDSy8ohc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761185673; c=relaxed/simple;
	bh=Crvu/VnJZCIRTR9Xt76dOjc21V0vgegrmIOOALewBSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1p/U/MXULDWeleRP9L3OqKZ5oMtnM3krgp716lnamtXKe26vOHnerWRSm88uDi2FdgkqKem22w9o6x/bOddYBcDXztzQpgpdM9yeBqnnVzaRzD0ueqUmCs5KOQT6WHE47S5YSKylOoJf+QdT26+AGaGRsroNtWd0B2c6suZD9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5rYdFIO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIeluU014615
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ju/EYHotMPeYkqqdMnrAWkTzONxAZN8mNt5RuG+Xxew=; b=G5rYdFIOY+LqeBPz
	XaEBaugn1UjYX2utwJyOP2GaGV/bBPbELMl5LID5QdbsFrzhZWEjiXVq6dv9O5Yx
	D8C7zIz5jf4SJ9P+odnj3nsPNBSk0Q46Qw3foqeY9eCz8rVgCS3qoi45mxRleiN+
	S4jBUyQPXfzqwfCoy2Olwhd1FF1sdZChChTintQ2liOW0Kqfsl38VeAOt+WIyHmB
	ioa25gZYMM1uL8d35Rd183zyWpjIVwsrDZYPImGszPHI2HQGkleJ0seQEb75VqWH
	A8Fx6/EQeFHTBTBZmapH1nIYT+sBVNBkQD8R+JfGHwagkZ/ZanYG8xpl4fa7P8vG
	yPB+4A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0mjdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:14:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befbbaso336217a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 19:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761185669; x=1761790469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ju/EYHotMPeYkqqdMnrAWkTzONxAZN8mNt5RuG+Xxew=;
        b=Y0+GkfVTYyihAxHAL7Bdw01VgzyQKbi+idx729ouzfN41ePBUQI7X1gq7lKIQjGZD0
         eqoxetFnKEhqqpIy651SZOjrG6JUQUBRoAv3JZMgxBmy9BNC/M5tVcrsOlc7Cj52+K5V
         lpQ/5ML1xGs7GhWDRQSkkp+PH01cVXKNYRoN4zv0igsgr/LJgrt1HXa6yLkLfrlcJASA
         NB4DEV8Oxv5W47ceeCtTEENrTX0mflchPHDoszaYjYHF8jFndy+TaUxlvFksl1NYSKwA
         PNvX0BgYEmUpuG0EBxurTZKo3OpaPmgnuqHChsVE2S7N0qSlbMgn4MtVqQsS9WxUE8jL
         ZzAw==
X-Forwarded-Encrypted: i=1; AJvYcCXslSBpXlnjaczm3VAY1MPQyYGgqKE7I3Ertkrz7fyl9zbqkBsjQmTQwD4m5Hk+/wMNzMr7TVTvR5YDNIv8@vger.kernel.org
X-Gm-Message-State: AOJu0YyKS/ObnZCFKcIVHU5Wg9ldTIJP5GdigFazcgNtNdGTC/MjWGhA
	/tnIm0kGvMf/ELm+D8Cjl64dGPt7OzM/F8ag/+g77iU7UIaABsHR5YIvQ8seVTaug0Pt7d6jdvX
	Y1JeXX6ic4oeq1hLIBv/huJcCW13N7eirFbyNT0VLWFB8LovkpzjvhSFYa+gE4vCXQDTT
X-Gm-Gg: ASbGncuGs11wfZN/eHfob/9Qik6YUTFiy7lThV07o6uj2gTXRYlz2WSMV84xtLeOf0V
	JKvq8xVB+beRxn7bisuM2mj2prBppDHR2kiXTyJd3ZPbGLDDdoX7rGqbUsd/uqPF85uI2Ih3CMX
	O8bKTqnrhNgX8wmKl4O4fsOt1Km2azYJChGpDJRAi2PwjUwULE0Ljqfgn+tRv8Jfwh5AYJ/EEsD
	HHEVuXv1LPAYa7too21QxRknSxGhwfoFLoQqbLlyGW0AcM/3uadCZqzJYALTdYoHXVNc2i2xajr
	v7HOgpANZuDFEby3NH1FsVM2kcBqFqpEmUh0u/UptFn0riG64UrpQPP74IkbfxkpJmJDlWo4hFI
	sDHr4X4UQxH8wCizoE2jc1DC3u4/ysbDlg5m2xuH6aw/TQ5rRQ82JY//DH0wc1K5M9IVbhA==
X-Received: by 2002:a17:90a:ec8b:b0:335:2934:e217 with SMTP id 98e67ed59e1d1-33bcf86c0a9mr29898663a91.10.1761185668837;
        Wed, 22 Oct 2025 19:14:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZMHBmfhd1lGJWsQDMeedq9yoSpiYR/IqvWq9XnG7U9WPCzMjAvdOHLzKmgoGRxTVBhDNVWw==
X-Received: by 2002:a17:90a:ec8b:b0:335:2934:e217 with SMTP id 98e67ed59e1d1-33bcf86c0a9mr29898640a91.10.1761185668358;
        Wed, 22 Oct 2025 19:14:28 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01724a5sm618529a91.15.2025.10.22.19.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 19:14:28 -0700 (PDT)
Message-ID: <ca17c522-134c-4481-a92a-dee0b90f8f97@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:14:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: smp2p: Add support for smp2p v2
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <chris.lew@oss.qualcomm.com>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com>
 <76gekllxr5meizr7wbvxjibdncdw7kp2q4zjjxtmdtfnwt4owc@dum7e77j4bie>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <76gekllxr5meizr7wbvxjibdncdw7kp2q4zjjxtmdtfnwt4owc@dum7e77j4bie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX1iy7hRHZWWLG
 7lOFoOBMjZlf8XSWtm6dZx29+iG5RUpGH7LIHHGC0bNPbRsCBMo5IwyoediILLwvFaOMmtCTTVx
 5kGIJca5Cyh16oJ76d/3o8wfhvVCppOv9DNB87QTGop/ybn6vkSJcn3CXmYlM6QsX22IxDha0yw
 HkSdoZTbCFrlO3OuXBheyZOfSFu/ofO6xn0uOl7cSo3tWeulkj3A8dUEkf82dtMd9yxdzhL4+wI
 Fx8CRk97BV1qE1bJYFdepIjPfDJn/zYsJjliJjnoV/aPxQtsq+w2/h6TP/ZMvL4rLu1udOAgSgv
 f7SGXMov/8oYap/ZovMBUE9zqL5N0siI6/0yrobCUw49BheYSLnYLyeYBA5uzMFJJsPXGHW9NCW
 8Aw0pRlyJYBw5/sxDB9P08veqCNFCA==
X-Proofpoint-ORIG-GUID: ZH3Gc3Vcsx_2C0ITL8_LZJd0ImzoujTY
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f98f86 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=psBAKaDzHMd9wCF3-JcA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: ZH3Gc3Vcsx_2C0ITL8_LZJd0ImzoujTY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167



On 10/23/2025 6:19 AM, Bjorn Andersson wrote:
> On Tue, Sep 23, 2025 at 09:18:43PM -0700, Jingyi Wang wrote:
>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>
>> Some remoteproc need smp2p v2 support, mirror the version written by the
>> remote if the remote supports v2. This is needed if the remote does not
>> have backwards compatibility with v1. And reset entry last value on SSR for
>> smp2p v2.
>>
>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Please confirm that you really co-developed (pair programming) this
> patch with Chris.
> 
> Isn't this a patch from Chris, that you're "forwarding", i.e. both
> Signed-off-by should be there, but the Co-developed-by shouldn't.
> 

I remembered I did some minor updated, will delete that in next version.

Thanks,
Jingyi

>> ---
>>  drivers/soc/qcom/smp2p.c | 35 ++++++++++++++++++++++++++++++++---
>>  1 file changed, 32 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
>> index e2cfd9ec8875..5ea64a83c678 100644
>> --- a/drivers/soc/qcom/smp2p.c
>> +++ b/drivers/soc/qcom/smp2p.c
>> @@ -48,10 +48,13 @@
>>  #define SMP2P_MAGIC 0x504d5324
>>  #define SMP2P_ALL_FEATURES	SMP2P_FEATURE_SSR_ACK
>>  
>> +#define SMP2P_VERSION_1 1
>> +#define SMP2P_VERSION_2 2
> 
> #define ONE 1
> #define TWO 2
> 
> #define PLEASE_DONT true
> 
>> +
>>  /**
>>   * struct smp2p_smem_item - in memory communication structure
>>   * @magic:		magic number
>> - * @version:		version - must be 1
>> + * @version:		version
>>   * @features:		features flag - currently unused
>>   * @local_pid:		processor id of sending end
>>   * @remote_pid:		processor id of receiving end
>> @@ -180,14 +183,23 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
>>  static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
>>  {
>>  	struct smp2p_smem_item *in = smp2p->in;
>> +	struct smp2p_entry *entry;
>>  	bool restart;
>>  
>>  	if (!smp2p->ssr_ack_enabled)
>>  		return false;
>>  
>>  	restart = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
>> +	restart = restart != smp2p->ssr_ack;
>> +	if (restart && in->version > SMP2P_VERSION_1) {
>> +		list_for_each_entry(entry, &smp2p->inbound, node) {
>> +			if (!entry->value)
>> +				continue;
>> +			entry->last_value = 0;
>> +		}
>> +	}
>>  
>> -	return restart != smp2p->ssr_ack;
>> +	return restart;
>>  }
>>  
>>  static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
>> @@ -222,6 +234,20 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>>  	}
>>  }
>>  
>> +static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
>> +{
>> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>> +	unsigned int pid = smp2p->remote_pid;
>> +	struct smp2p_smem_item *in;
>> +	size_t size;
>> +
>> +	in = qcom_smem_get(pid, smem_id, &size);
>> +	if (IS_ERR(in))
>> +		return 0;
>> +
>> +	return in->version;
>> +}
>> +
>>  static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>>  {
>>  	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>> @@ -516,6 +542,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>>  	struct smp2p_smem_item *out;
>>  	unsigned smem_id = smp2p->smem_items[SMP2P_OUTBOUND];
>>  	unsigned pid = smp2p->remote_pid;
>> +	u8 in_version;
>>  	int ret;
>>  
>>  	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
>> @@ -537,12 +564,14 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>>  	out->valid_entries = 0;
>>  	out->features = SMP2P_ALL_FEATURES;
>>  
>> +	in_version = qcom_smp2p_in_version(smp2p);
>> +
>>  	/*
>>  	 * Make sure the rest of the header is written before we validate the
>>  	 * item by writing a valid version number.
>>  	 */
>>  	wmb();
>> -	out->version = 1;
>> +	out->version = (in_version) ? in_version : 1;
> 
> Doesn't this imply that if the remoteproc advertises support for version
> 3, then we suddenly also support version 3?
> 
> 
> I don't remember if we've talked about how version handling should work
> in this driver, but we should certainly define and document that in the
> comment at the top of this driver.
> 
> Regards,
> Bjorn
> 
>>  
>>  	qcom_smp2p_kick(smp2p);
>>  
>>
>> -- 
>> 2.25.1
>>


