Return-Path: <linux-arm-msm+bounces-83524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 596DEC8CF49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 573464E3C7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 06:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A02A2BCF4C;
	Thu, 27 Nov 2025 06:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MK8GrMFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMTQu0t+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6ED27B347
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764226288; cv=none; b=q82BY61UJjucernFowrg6Wcp8yZcEP9m+AGMMvKEackU9+l2odLwb13KXk8DATZMXTwOpy/Vo//jrHdZEnCAMBosn10v/udhFYYyqmNNYMun+UK6Ptw1zxZpQLsbHkfGl6ipo9a0agJ6V87gOYdtpOr1P61lcz3BSMw+6+leqPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764226288; c=relaxed/simple;
	bh=L1GAdhVCihpmpHLfPJHmD6AbI9JsJs9i/wcsLfRPRTc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=mfmE54oHaFVLu5hMusL3w8PIyaDM4d8vAWS2emIm33ZOZAD1JSWH+FAAgNnhdRBLh93f/cpfEI5PrKZucXBySAUFH5eYA58UbSN2mezpYqrEVXmALfbSLyfUI4O6xu0DRir4cLPt056sH3FZ3/heVsqeMzMVHC8kvFU5J06QEws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MK8GrMFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMTQu0t+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR24r4A3840085
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vahAyuTYrvrhMLTAvF1gOvLM5O0cDCumCwFOtxYrDIQ=; b=MK8GrMFjiz7lFsZd
	E+MxbrHw58jUIoHqTMRtm/yS4uAtdfXZkzATgqP+gQ40CAWZJsLEASeWzafwfh0x
	nz+kDslADO7Pkqj0QXLpnXeqfWf+X6X1ftwp70pSK34lUhgSGAnUsm+vKb3ezWea
	Y1hoebxU+lknJSBMyBiZ010D5kg4vZFo1oPtnSgWUKUWkYDEmSX3bBzeXM9eOyZR
	6c1UGAk9xvaUrZduNojCpAI3/q5Du6XjSVGNiltZtPNPd/kyfPHMLuI5F7e1zJ3N
	ZAhUf7an3r3GpA9j4lrjqhmwvTdWfHd3HiKclAzTdV9ODIw2Ki3bSKJ5e1u30xtu
	jpJrzw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj08mmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:51:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3438744f11bso984268a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 22:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764226284; x=1764831084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vahAyuTYrvrhMLTAvF1gOvLM5O0cDCumCwFOtxYrDIQ=;
        b=VMTQu0t+msSoIyA325f8XKX4tVOYPRWM+mLbk9nk4fGMkm1bYUGE5tsqDrfbslVvSk
         pmcAc2prT1PhCS98bowb5e1IHksoA5S7H0hsoUjXLLjsF+nLkY0h0wrPt6jYdHf9R6IT
         ziTL/DG9iH2uwA6mbXRyJ6OGFpKrmj7/L4+FM2RNIBPjCnMAByuAwRP7EDnBZSO4EkfB
         mdxvs7wNJo0i1hwY8BpbgrW8BYpoSDMPRShsKN9VcmEFdfEuZ9m71MmQX2+VLSkBrb/O
         MssPLr4MYT1mELy1r0gpDI+YBWwP5Xh7p7FeQDYHGHqcoVRP9inxexywFK38RCbFybbo
         7+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226284; x=1764831084;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vahAyuTYrvrhMLTAvF1gOvLM5O0cDCumCwFOtxYrDIQ=;
        b=CYALE7rQ54szoyT8FiBYmAm62HOlpZQ0PQ7u4lrxJgBsvV6ZztGgxA573xZHTQKHDT
         zM3GZ5JN+YKL7FpES54/PjWKr5WmjDplVuFnOUh1peY0nu0e4mHH2yN26VBsX0DvXICu
         vurrEKYHqQTrRJ4rACg86xgQYmA5vbtSWQdRYvVBsEYGALLv95MTMhJvoq2dnUgnDGKK
         izlDPn8xmFryD561BrCE0LKqnZEZGDs5ZHIC+dVM6gQYvB20KUKjNQluMYqclGKCvqI/
         dUX//x0rq0PNBukIynmn6F/AQKOH442voPLSjemQrmCTulgidXWZUJNoTXWdiEIUoI85
         oc9g==
X-Forwarded-Encrypted: i=1; AJvYcCVjGEVmM/5bx0TF28dnKLCFAZjCuZhTXtzEZvvbMeQY/dE+HfOs+U1ShgQ3U2N+MwKr+7/2BHVbV8eHgc+/@vger.kernel.org
X-Gm-Message-State: AOJu0YzKI+TMaDhrl+qJU/bGf70X6EjzwcY1q8+y3PTNcniDCH2+3hMN
	uDxlsr12sXUHh4X8B6LKE2cqxdC+y8a0MJ03V7RojWM98z8vOWttVmJ4VL9CJRzhleIfLlWaCCJ
	/Rt0fUniK7Us9gU7c4ejqgtV6Qj2GgVfwb0LA02PqFyu9v4aFrgHA8agN1fMnHb7FDbQLP28xwx
	FA
X-Gm-Gg: ASbGncuzAr8x8k47ctTNS8GlyX2TdiIX1T6u02EB3CiLSmJEH5dUSQCaG7Q/PQGaTq6
	tfPg9zl/BP6iZ5pKPJa052tQbBQuiTCgMGwcWQa+Dg0CqpicvoGMAHWpZpogRJ7FRUn30Jp9YQk
	yZsHj4KKwU8p6nj0MpIhx9Oa7gQLc+WTTj4DooDX6hkBIUNKCCK/CV0AaQngsTyIt+QEE6voWrK
	eY9YWSB042KBpXxz4YGCNx9WEnS7bqd2E4mMZKSaUWwQ9OPBny2Kv2MDShpXyVrnnhD58HIqwCY
	n5YTdpRR87T2Nd4ei34ga0j/NJuznTbdzjtMwWmog2BZGjSwvr9w/ERSbhLEOxKPz0odSylXM3P
	IAuy5YcLD4b6VF0m+FhyhMW431UdNmH5zwWH7gb8=
X-Received: by 2002:a17:90b:5628:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-34733f36422mr18223534a91.32.1764226283639;
        Wed, 26 Nov 2025 22:51:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbkHs8wfFHSMpupo4SEwLS1CnXrCsqUHPf6SUc1+BRhBVG1r7PDra++zJJbY6CvkMQVUI+7A==
X-Received: by 2002:a17:90b:5628:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-34733f36422mr18223520a91.32.1764226283128;
        Wed, 26 Nov 2025 22:51:23 -0800 (PST)
Received: from [10.217.223.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fc5a0957sm868740a12.16.2025.11.26.22.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 22:51:22 -0800 (PST)
Subject: Re: [PATCH] mmc: host: sdhci-msm: Add support for wrapped keys
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: adrian.hunter@intel.com, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251124112908.3193211-1-neeraj.soni@oss.qualcomm.com>
 <CAPDyKFpOuwofFGTEqkCUDXLRJ90vEypkrtg+f01KY5S=cW03Wg@mail.gmail.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <db857f2a-a848-a70b-20f5-621968685dcf@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:21:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpOuwofFGTEqkCUDXLRJ90vEypkrtg+f01KY5S=cW03Wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA0OSBTYWx0ZWRfXx/GoaOwEAXK0
 UWX85z4dd2s7IUeg1ZBH01O82vUEEbu1lUznpX+Xk64ovbPNEhMBZd5qZb/Rh56SXmyzy0f0URo
 HypgUIjQcHlz5BhUpigZiw89UI44XSu7wBEBpQrImQFgGuNyZLqJpbpt4lc/TYgmw97reJEfH1f
 fBb8dccmwQpROyBH+DZ6BqP0X9rP/R9jIy4Ps6KIKkYnnHfVPbaP+f/1qsRz1xke20nAE2+a3I1
 1wnMV3PMYeF2uO0G3V26ck0kuf3aCD3tTDlLjWEHKDFFp7Z57w6OxNCrwjyQRe7t/PYQxtZuOev
 7eGDYlaFRDudY5RZZkpud55n86h5drwz+EVxhYCCp0F0JKb2OSnpcgDZ71tGFEPMue8fcvcNdva
 2PZpjQFiYwGC9s6/ITJUzknWwBFNUQ==
X-Proofpoint-GUID: jW6lkfQ-5dxraKw6GAihItcwaUQYQ9Q7
X-Proofpoint-ORIG-GUID: jW6lkfQ-5dxraKw6GAihItcwaUQYQ9Q7
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=6927f4ec cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=6BEkEVLclD1p8vPHoFMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270049

Hi,

On 11/25/2025 6:25 PM, Ulf Hansson wrote:
> On Mon, 24 Nov 2025 at 12:29, Neeraj Soni <neeraj.soni@oss.qualcomm.com> wrote:
>>
>> Add the wrapped key support for sdhci-msm by implementing the needed
>> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
>> blk_crypto_profile::key_types_supported.
>>
>> This is a reworked version of the patchset
>> https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
>> that was sent by Seshu Madhavi Puppala.
>>
>> My changes rebase it to use the custom crypto profile support.
> 
> Part of the above is good information but doesn't belong in the commit
> message. Instead make them part of the patch-information below "---".
Thanks for the comment. I will update this in next patch.
> 
>>
>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> 
> Please add Eric Biggers and Abel Vesa for any changes related to ICE.
> At least, if they have the time we would appreciate their input to
> these kind of changes.
> 
> Kind regards
> Uffe
Okay i will add them as well in next patch.
> 
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 51 +++++++++++++++++++++++++++++++-----
>>  1 file changed, 45 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4e5edbf2fc9b..351f2a77068b 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1911,11 +1911,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>         if (IS_ERR_OR_NULL(ice))
>>                 return PTR_ERR_OR_ZERO(ice);
>>
>> -       if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
>> -               dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
>> -               return 0;
>> -       }
>> -
>>         msm_host->ice = ice;
>>
>>         /* Initialize the blk_crypto_profile */
>> @@ -1929,7 +1924,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>
>>         profile->ll_ops = sdhci_msm_crypto_ops;
>>         profile->max_dun_bytes_supported = 4;
>> -       profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_RAW;
>> +       profile->key_types_supported = qcom_ice_get_supported_key_type(ice);
>>         profile->dev = dev;
>>
>>         /*
>> @@ -2009,9 +2004,53 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>>         return qcom_ice_evict_key(msm_host->ice, slot);
>>  }
>>
>> +static int sdhci_msm_ice_derive_sw_secret(struct blk_crypto_profile *profile,
>> +                                         const u8 *eph_key, size_t eph_key_size,
>> +                                         u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
>> +{
>> +       struct sdhci_msm_host *msm_host =
>> +               sdhci_msm_host_from_crypto_profile(profile);
>> +
>> +       return qcom_ice_derive_sw_secret(msm_host->ice, eph_key, eph_key_size,
>> +                                       sw_secret);
>> +}
>> +
>> +static int sdhci_msm_ice_import_key(struct blk_crypto_profile *profile,
>> +                                   const u8 *raw_key, size_t raw_key_size,
>> +                                   u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
>> +{
>> +       struct sdhci_msm_host *msm_host =
>> +               sdhci_msm_host_from_crypto_profile(profile);
>> +
>> +       return qcom_ice_import_key(msm_host->ice, raw_key, raw_key_size, lt_key);
>> +}
>> +
>> +static int sdhci_msm_ice_generate_key(struct blk_crypto_profile *profile,
>> +                                     u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
>> +{
>> +       struct sdhci_msm_host *msm_host =
>> +               sdhci_msm_host_from_crypto_profile(profile);
>> +
>> +       return qcom_ice_generate_key(msm_host->ice, lt_key);
>> +}
>> +
>> +static int sdhci_msm_ice_prepare_key(struct blk_crypto_profile *profile,
>> +                                    const u8 *lt_key, size_t lt_key_size,
>> +                                    u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
>> +{
>> +       struct sdhci_msm_host *msm_host =
>> +               sdhci_msm_host_from_crypto_profile(profile);
>> +
>> +       return qcom_ice_prepare_key(msm_host->ice, lt_key, lt_key_size, eph_key);
>> +}
>> +
>>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
>>         .keyslot_program        = sdhci_msm_ice_keyslot_program,
>>         .keyslot_evict          = sdhci_msm_ice_keyslot_evict,
>> +       .derive_sw_secret       = sdhci_msm_ice_derive_sw_secret,
>> +       .import_key             = sdhci_msm_ice_import_key,
>> +       .generate_key           = sdhci_msm_ice_generate_key,
>> +       .prepare_key            = sdhci_msm_ice_prepare_key,
>>  };
>>
>>  #else /* CONFIG_MMC_CRYPTO */
>> --
>> 2.34.1
>>
Regards
Neeraj

