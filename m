Return-Path: <linux-arm-msm+bounces-56783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EBBAA9326
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 14:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A316A189A046
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 12:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394C41D90AD;
	Mon,  5 May 2025 12:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnnPOVfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4BE2F24
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448243; cv=none; b=BDckBXHIcX5MH5EqglUBn3P83arHwRreUGBROZaq4jnNEibHPdWxguFfxnBF3kKImtypfsKJ++RTTS/uajeIGg0Q5t/KzAoeXzJiIOL6QGhcmOVdhMyzULl+BlGfGj1kSjksyVcFIhS4O9lKCPMq5qGhrhj4A6PkbvcWV6X/DAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448243; c=relaxed/simple;
	bh=KUndq4hJdVEJD5ngNJGBRZeJyb0wTFdvOJGt1kRqK6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXTBx50WmbW3IGpdTmvjqAjuh8VH6QyKxgu5Btj6LtTYjF/rF6+433Ou5g/8N7B6ZX5N1BGVKZF5C4dDzX5vVb36QVKgj7z2roe+p3S74MTMS9l3X5E5J+w8xkR2dyw0frL5OGyANnIIemSpZnNPoRkPnwen8VtdHgpopxALhbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnnPOVfG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BZidC009522
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 12:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3G6J7mrlp65EzgO5VLytgkQO3fSgok1k/X2CkcanNg=; b=DnnPOVfGaj3nPpIf
	PitqrK0HiLJjajI2U8/bck6JhKAqtp5hVEi6zBmiOqVy8L+c9coT5HKFHEbHyBH9
	oLkKHiLCOTA9w5UqhXdhAzz+IIX+fv5kCDGEG0DBnGtMWGxsoSluXLc6D+SOBo4O
	ErAl0rpaER1PLt6/cqCb1/8o5JLfX8DLm7Kx2ydLn7yObwuKtJeymMMz/NqoiRzG
	OFMf5RdMKzDf5bxF0fFE25RjIHdwFowwURPH9FxTP4i/5MW40oVsiFoi/Zl6kesc
	NYSzqSh9BCifrPaczyrigO0MpTq6jO8VNcn+o4pmsYUJf82CXER6LVMkkqIZw6EN
	yyQOmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7c1k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 12:30:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso3955518a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 05:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448239; x=1747053039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3G6J7mrlp65EzgO5VLytgkQO3fSgok1k/X2CkcanNg=;
        b=an/IFOGgk4RkSmE2aHTNhjxyQ4ufIOsB4dmK+lLFdIjxPHrBOekArKbQLZt8pZav59
         qqbK1DOqShu95RW0Ew1pn7saXl8nzJzmAGIZ5U0gW8D3hN7TUhtJuQ0JSs7hOoKm197+
         YSrmcMmrcWUQOQGoHGVGrvX/LIEWvR+kejFI1UMelP6WtgKRnoCabKMp9+YDAc5l25zj
         DGg1vUPO8JXwx0GXgHC7Q4cmViX3HfYL5JX7x3ngZGSBpRtWVhADObR19Cu1Bt9W9cqV
         QAmRij1/1vD6+IXewcCw/VNtHPLpqYIlis6ThOtrvZNOS1aLBe5m72lcS2gDD3A3oEMi
         IifQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp4aGJIgdUk5tmp0EWxuHxWegiMABKOm1ydB6GTl4plcJwRDT96mGbFP1ocZ+DseEkQw9HsAA+qQaXE3Z/@vger.kernel.org
X-Gm-Message-State: AOJu0YzDiAtwK8EkIKpk01hO2f6FqZTtCa/B8fI5PWWp69ix/iNKJh9d
	AXZ0lfA5Pqx0TEBia6P5Ds6NYlBcmLLyjx0pmF0Nfz1Q8ZKN/UlhzYswmux1+miUDLnyOFJO9Fd
	It/bluXqp1biLRImxilt491kvGGdJoNMX1+O8AZe0B6ClNz0hU7DtgYP8o0qHxLlr
X-Gm-Gg: ASbGncvwcaxvI05jXbUfIXpSJP0fwae/pSMnITLl1HjAcRBPVeu2YkSpnm6CnC0S4ea
	zVpOKbttyqAPjvFrAzkiATtb5R6ZpaCQlo8vdbElqaStAdOztub80nRJHICXDcTClcm6T52gbp4
	z2096hQRODZTjxLFz5rGvRTBWVJGh3owtCjD4CHrYsr1+laj86HyIQd/ty8dhMuW2SYDdW2obde
	owAf8KpOrAH+MqH4kOSt5v7BUNlhlwHfuMAunYLkqOty8bUq9jHB25Ec7ugh6SLt5w3+Z+c06++
	EUi1e7HIjTeTfeHqFa2Ea+gV2puX5ur/AhkR0njt
X-Received: by 2002:a17:90b:35c2:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-30a42e4ec2bmr24078910a91.2.1746448238753;
        Mon, 05 May 2025 05:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiYHZNbAPD2hX6uotPQt4rYNK5LSmkNVeXzY+HRrfyvbKuerZll0vE/BGL+crksM4WYtDukQ==
X-Received: by 2002:a17:90b:35c2:b0:2fa:603e:905c with SMTP id 98e67ed59e1d1-30a42e4ec2bmr24078856a91.2.1746448238319;
        Mon, 05 May 2025 05:30:38 -0700 (PDT)
Received: from [10.152.201.37] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471f005sm11506606a91.5.2025.05.05.05.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:30:38 -0700 (PDT)
Message-ID: <538b32d1-c7b7-41b5-aa93-d285604d1f05@oss.qualcomm.com>
Date: Mon, 5 May 2025 18:00:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 3/6] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_mmanikan@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
 <20250417061245.497803-4-gokul.sriram.p@oss.qualcomm.com>
 <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <gokul.sriram.p@oss.qualcomm.com>
In-Reply-To: <72f0d4f7-8d8a-4fc5-bac2-8094e971a0e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6818af70 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=iPeUMZ46Q7pfEY4_gPoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wOomQJtaLEzS54OmKVmJxXGyLKq2v_Wk
X-Proofpoint-ORIG-GUID: wOomQJtaLEzS54OmKVmJxXGyLKq2v_Wk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDExOCBTYWx0ZWRfX68CK39gBspjl
 c6/oZ+E8tBDQ0/wCRc1aZFfjw8s0vm96dAWm4LRGnCSWdcqQL83oM102hHV1r2Z+Ux54+VPB7gu
 I0up5Lk4OEtrGWdqsgrkywGBbXbCHUo/j/1lVGdTs9ZXak4MAi/LQhFdRkWthFbxDmFEOwKl0zc
 L7m8hX03a0WPw94cXYX5NuzGtQVGrDetV74b475yOomekvSqMrrlJ8OLvCCLyv2kW7R6HazQAro
 maC4a19TuYbA7L7gbBnefAIfyKT+XOhhYnKbX29mmutDK42tNPTNmeLSb0UOwIPCD93VA5hkO15
 SSHwfzQa9xCumfRKtGEigEDW1ANGOhGdu73hGTl5Tm03mPKDn88XdXX80QVjpku+HtNcOImyX4G
 tcmAI+SjbrRqsCVHot1w/bxF2TV7Fb5gvvM9Z+/1dWUFHBesfw1ku/GaTc+L6UU7afpF1z+i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=709 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050118


On 4/25/2025 5:17 PM, Konrad Dybcio wrote:
> On 4/17/25 8:12 AM, Gokul Sriram Palanisamy wrote:
>> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>
>> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
>> SoCs support secure Peripheral Image Loading (PIL).
>>
>> Secure PIL image is signed firmware image which only trusted software such
>> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
>> Peripheral Authentication Service (PAS) request to TZ to authenticate and
>> load the PIL images. This change also introduces secure firmware
>> authentication using Trusted Management Engine-Lite (TME-L) which is
>> supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
>> TME-L for image authentication if supported, else it will fallback to use
>> SCM call based PAS request to TZ.
>>
>> In order to avoid overloading the existing WCSS driver or PAS driver, we
>> came up with this new PAS based IPQ WCSS driver.
>>
>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
>> ---
> [...]
>
>> +static int wcss_sec_start(struct rproc *rproc)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +	int ret;
>> +
>> +	ret = qcom_q6v5_prepare(&wcss->q6);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!IS_ERR_OR_NULL(wcss->mbox_chan)) {
> You abort probe if wcss->mbox_chan returns an errno, please rework
> this to use if (use_tmelcom) or something

Hi Konrad,

do you mean to use 'use_tmelcom' variable from driver descriptor? If
yes, what if mbox_request_channel( ) failed?

or based on wcss->mbox_chan, should I set 'use_tmeeiihcckgddglcom' to
true or false and use it?


> [...]
>
>> +static void wcss_sec_copy_segment(struct rproc *rproc,
>> +				  struct rproc_dump_segment *segment,
>> +				  void *dest, size_t offset, size_t size)
>> +{
>> +	struct wcss_sec *wcss = rproc->priv;
>> +	struct device *dev = wcss->dev;
>> +
>> +	if (!segment->io_ptr)
>> +		segment->io_ptr = ioremap_wc(segment->da, segment->size);
>> +
>> +	if (!segment->io_ptr) {
>> +		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
>> +			&segment->da, segment->size);
>> +		return;
>> +	}
>> +
>> +	if (offset + size <= segment->size) {
> I believe this allows an off-by-one (remove '=')
ok, will check and update.
> [...]
>
>> +		memcpy(dest, segment->io_ptr + offset, size);
>> +	} else {
>> +		iounmap(segment->io_ptr);
>> +		segment->io_ptr = NULL;
>> +	}
>> +}
>> +
>> +static int wcss_sec_dump_segments(struct rproc *rproc,
>> +				  const struct firmware *fw)
>> +{
>> +	struct device *dev = rproc->dev.parent;
>> +	struct reserved_mem *rmem = NULL;
>> +	struct device_node *node;
>> +	int num_segs, index;
>> +	int ret;
>> +
>> +	/*
>> +	 * Parse thcitejlvhvdriihtheuvhn

>> hrough additional reserved memory regions for the rproc
>> +	 * and add them to the coredump segments
>> +	 */
>> +	num_segs = of_count_phandle_with_args(dev->of_node,
>> +					      "memory-region", NULL);
>> +	for (index = 0; index < num_segs; index++) {
>> +		node = of_parse_phandle(dev->of_node,
>> +					"memory-region", index);
> https://lore.kernel.org/linux-arm-msm/20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org/

ok, will implement of_reserved_mem_region_to_resource() and
of_reserved_mem_region_count().

>
> [...]
>
>> +static const struct wcss_data wcss_sec_ipq5424_res_init = {
>> +	.pasid = MPD_WCSS_PAS_ID,
>> +	.ss_name = "q6wcss",
>> +	.tmelcom = true,
> "bool tmelcom" is very non-descriptive.. call it something like
> use_tmelcom, or maybe flip the condition and call it e.g.
> tz_managed

oeiihcckgddgcjnfeeuhjfdfbcfcdenvfnjnuceuntbir

eiihcckgddgcgltegldivttfeldnhugbnjvtllkkrujt

eiihcckgddgchbegrjtgfnk, will call it 'use_tmelcom'.


