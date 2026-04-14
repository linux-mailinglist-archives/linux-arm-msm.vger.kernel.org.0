Return-Path: <linux-arm-msm+bounces-103095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOtVOLkO3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:54:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF3C3F8447
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B8A0306D29E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F336D3C873B;
	Tue, 14 Apr 2026 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzFcidfB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VhLpzdQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE843B7760
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160148; cv=none; b=Z8CjDo7MPukxeNNtS9eTvvt/S8yrhk4rGw/MZhCPOnEHidiVl1TyAO5YYxcWbRFZskrGH2tugiDfGQH6CHax+RB8rBLrqg7XA5krF6L1jJ6vZPn7aPNuNJC1f/T0Mdc3w2sXpKaG+9uT5TAJHws2OmSkE5dAFq0M9XyfUxdISKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160148; c=relaxed/simple;
	bh=Bwjyd0J3h02Uh9QFxIw0iRY7bW56hukI3H+jXTY9V28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVvPIU36o2GYGLg46UZEwB+48T5T4oE0lFudBYf4oAIMNN343+JCdR6dqlTWh19z0SHZoKubz5V7moYjQ5AhmvA6teQi5ue3ZK80VGM7Z2aze+7bYWPaNwWwRGvUjwJILguwlM02u4BnxywYAnoO0+aQ3u/VA61leYSLcqoHCOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzFcidfB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VhLpzdQs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6e5GR363130
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9lFHIlpJYOdo8F//iQ+Ufb6uo+NdvS2bpAUFa2NvQQ=; b=RzFcidfB3e58xwDA
	TrUaa7TKX096YFPR8jB2yXpbZdweC568akr6saJOdjhVrHQCgLkO2DXK1nGah6tP
	dgmweSdm6JlqLt/jKMc/QWMO4hfe6JfcIar0gc51O2bdklgJ5MLOC2sM49iDeN+6
	tiqKnF+0ejRCbcXMrxxDcjZCzaIefALJJM7l+5BHVyyHPmj+oCWkaMw/3JaUCS9M
	lysUpWuPQ5i9MLl5ZUkc7RIQ/jBCOx9if6xakQnYKr/Lk0OZ4xfoBUQG9kJhUwnW
	c5aQdCDMybfd85RBMsl6pPerpmSwKC5M3x3nFhpPT0g8v8cXiU3PkBI/agutfp1+
	aj6ZYw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t5j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:49:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c792e2169adso1254274a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160146; x=1776764946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9lFHIlpJYOdo8F//iQ+Ufb6uo+NdvS2bpAUFa2NvQQ=;
        b=VhLpzdQssG/PcPJ6X1IeVNTMtYRB6GspQDAUcxCl1g/IVIFrhGWhz9YNNbAGGBxAfA
         lvgzQ+tZxUWVl/o1bpqv6255n/H4YJuyHYeWooz+07ZG/YYzxbSCNxapW1NPKLl4ZHWr
         TV+udMsuujReP+TR6NTdKYk1/dVWtw4FEemHCIdOwJDgkII4t8uAm68ofsHrObpVzqx4
         97KgtBfvg3kDe7gVqvub+gDV7dbbpnCSA+ngWG1/F0yxyajWcgXvegK/+7e7u9j1uetz
         pkYU4sH484xAkUtYb6Jw24c9eV7f/mN8pKtfARjoZW+AJXoh9k0bhIY5nJzfKT1URGnI
         FT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160146; x=1776764946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9lFHIlpJYOdo8F//iQ+Ufb6uo+NdvS2bpAUFa2NvQQ=;
        b=ZSB21oIugN+NOeIyNuwQIiyuIyyUVJhwhNhhyBbJ91OxfFSbep7aqhyzA+z01iTZqp
         IWiEbrbb0/ltuZk0b8XDG6gxPem1B9tFJFKafMWVMiQhTJzFj+G1D+lYDlrMXWz6byE+
         2lDA2GTeZaECvPgWrgQ752+copqmGNzK8PwZCixuDO2S5U+1cU05NlfAgIyaO7C05NGc
         PMrngHCneHrXV9bUK5EU1aJanT247Kuu7EeAtlkz/79Tm+pK5AeGTp4qu8H4DjhWotQo
         omYlJ2xUV/1IQDzA7SaYckWCIptD6+7aWOox4z5mkjuw7EuOFChKdIUGuM4e3+Mv0F+c
         xVUg==
X-Forwarded-Encrypted: i=1; AFNElJ/NjtXXpbyfDkPVSjxdSf8gpPAkZAM0ZRmJqtkB1eDg56DRGweVF2TFvF3g2Ilmxsd7qp1cC3IzMwL/v7tL@vger.kernel.org
X-Gm-Message-State: AOJu0YxbrXka2thd9g2YCcqqv392H3R5iqeER0Hn+/COqwA/YNqywVz+
	iIe51MODKlNs1hPgAc7HV2Na4qyqrka5kS6vPVivHbSDlSq4h8ek98t+PbX5FNdIy6kVnh9zTTK
	N8AtFLnQCKziqMwqQLVbIaKtCRXCLToLtxLKZHDyPFTxFp39vao8+s5+8LwhGXasiyQd+dXM4Fu
	9M
X-Gm-Gg: AeBDietJ2eAZG4ZdZSRRLBnBTnC3X28F4CnAOwKKHx7V8Rn6HcLM8kGbM9Bx6hPsFKB
	Jncz/jrnJ1FJ3nnI8Pswo99b67+YYnA2rtSKQdWRfV+x5wCMVuscMJeQ5w1WDue3lch+qz8pMaw
	Quot39ECzz5zDmP5CsdnPV2jZss8A+DzywHY7RWTA8xmiFRI3PkGa2gNEefgzOTjc127tqhQYD4
	MFPjYcYj6WD4aaSU42oysmC1jTDZTMt0HfWY8eJfw1jEW7kHmyDyRDZFxTvnFrqIC46+G0wbFEr
	jkZ968kY1b+v1k5meVNG7piY62dc2XgR/IYU3+TPr7KiKDeXIl5HJ+vvpxwbf2QiH2y1S0Kp4wF
	vdcRcDmtwc4WjmxZNwPM5i6E4VfgKtjAqLOpkD7VLJT6mDUXj4mjQgA==
X-Received: by 2002:a05:6a20:7347:b0:399:12d:41f with SMTP id adf61e73a8af0-39fe3c92b30mr18024888637.7.1776160145686;
        Tue, 14 Apr 2026 02:49:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:7347:b0:399:12d:41f with SMTP id adf61e73a8af0-39fe3c92b30mr18024854637.7.1776160145166;
        Tue, 14 Apr 2026 02:49:05 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc7e7sm12108505a12.10.2026.04.14.02.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:49:04 -0700 (PDT)
Message-ID: <75e54438-f19f-4542-a271-14e7a68c9635@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:19:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
 <2sykuv6r643v3i6ymdoevzohoxdmgrrodvgpbaystskz7fwgun@fd3p7gcso252>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <2sykuv6r643v3i6ymdoevzohoxdmgrrodvgpbaystskz7fwgun@fd3p7gcso252>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de0d92 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fsfV3h0Z8HPD5dlk9hgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfXyA1w4MBsgGS7
 un1WpbYEkJ3PsJZAi9l18d5DYq36ua8J7MIG62scEBrDL+/RecfLJTxgpgnXVjbt6RCmKiIk1Fz
 zsA9dFB1BfktJ+nCMN5/5wB+QJZn86nN/8dBWEwV29/V2Jlh0GvqpSHL4JuW02g1zC+1C95s2cX
 VYEpZgqAGoKLMjfcRYkfCZw7THoc5RUr2YcrIRsTCnjn4/KvbArUAmOLTTVcpV6wZn8E0p0It62
 3L5/Z+ZRFRY4hZHLob6mJUU57A0Gl40PqM0bdHpbpiQS4p8O4FjpbikjluFG0aDLwkmR8bLvn9o
 NnuCcA6DI/GbJIoL1rjBnHYxXJ6VI/xQ8HG6OCYJVKQz1soUiJxUjsxYckMbf1wMrFhyHjattKV
 7I00GIfjyWeNCBMvqcYzL8GR5P1DapxMz+4TlMwafE/pNXtbTY1p9naa2cKZEAk8/B/e6DL8Al/
 6SlzEbvJMDuPo5AhQYA==
X-Proofpoint-GUID: NR1VrvkaWUUNqBz4UNyp4kZD_RytHMDk
X-Proofpoint-ORIG-GUID: NR1VrvkaWUUNqBz4UNyp4kZD_RytHMDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103095-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CF3C3F8447
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/13/2026 4:56 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:44PM +0530, Kishore Batta wrote:
>> The Sahara driver currently selects firmware image tables using
>> scattered, device specific conditionals in the probe path, making the
>> logic harder to  follow and extend.
>>
>> Refactor firmware image table selection into a single, explicit probe-time
>> mechanism by introducing a variant table that captures device matching,
>> firmware image tables, firmware folder names, and streaming behavior in
>> one place.
>>
>> This centralizes device specific decisions, simplifies the probe logic,
>> and avoids ad-hoc conditionals while preserving the existing behavior for
>> all supported AIC devices.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 58 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -180,6 +180,16 @@ struct sahara_context {
>>   	u32				read_data_length;
>>   	bool				is_mem_dump_mode;
>>   	bool				non_streaming;
>> +	const char			*fw_folder;
>> +};
>> +
>> +struct sahara_variant {
>> +	const char *match;
>> +	bool match_is_chan;
> This name makes no sense.
>
> - Mani
I will drop this in the next version.
>> +	const char * const *image_table;
>> +	size_t table_size;
>> +	const char *fw_folder;
>> +	bool non_streaming;
>>   };
>>   
>>   static const char * const aic100_image_table[] = {
>> @@ -224,11 +234,50 @@ static const char * const aic200_image_table[] = {
>>   	[78] = "qcom/aic200/pvs.bin",
>>   };
>>   
>> +static const struct sahara_variant sahara_variants[] = {
>> +	{
>> +		.match = "AIC100",
>> +		.match_is_chan = false,
>> +		.image_table = aic100_image_table,
>> +		.table_size = ARRAY_SIZE(aic100_image_table),
>> +		.fw_folder = "aic100",
>> +		.non_streaming = true,
>> +	},
>> +	{
>> +		.match = "AIC200",
>> +		.match_is_chan = false,
>> +		.image_table = aic200_image_table,
>> +		.table_size = ARRAY_SIZE(aic200_image_table),
>> +		.fw_folder = "aic200",
>> +		.non_streaming = false,
>> +	}
>> +};
>> +
>>   static bool is_streaming(struct sahara_context *context)
>>   {
>>   	return !context->non_streaming;
>>   }
>>   
>> +static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
>> +							  const struct mhi_device_id *id)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
>> +		const struct sahara_variant *v = &sahara_variants[i];
>> +
>> +		if (v->match_is_chan) {
>> +			if (id && id->chan && !strcmp(id->chan, v->match))
>> +				return v;
>> +		} else {
>> +			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
>> +			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
>> +				return v;
>> +		}
>> +	}
>> +	return NULL;
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	int ret;
>> @@ -797,6 +846,7 @@ static void sahara_read_data_processing(struct work_struct *work)
>>   
>>   static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>>   {
>> +	const struct sahara_variant *variant;
>>   	struct sahara_context *context;
>>   	int ret;
>>   	int i;
>> @@ -809,14 +859,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   	if (!context->rx)
>>   		return -ENOMEM;
>>   
>> -	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
>> -		context->image_table = aic200_image_table;
>> -		context->table_size = ARRAY_SIZE(aic200_image_table);
>> -	} else {
>> -		context->image_table = aic100_image_table;
>> -		context->table_size = ARRAY_SIZE(aic100_image_table);
>> -		context->non_streaming = true;
>> -	}
>> +	variant = sahara_select_variant(mhi_dev, id);
>> +	if (!variant)
>> +		return -ENODEV;
>> +
>> +	context->image_table = variant->image_table;
>> +	context->table_size = variant->table_size;
>> +	context->non_streaming = variant->non_streaming;
>> +	context->fw_folder = variant->fw_folder;
>>   
>>   	/*
>>   	 * There are two firmware implementations for READ_DATA handling.
>>
>> -- 
>> 2.34.1
>>

