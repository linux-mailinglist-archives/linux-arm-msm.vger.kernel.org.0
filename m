Return-Path: <linux-arm-msm+bounces-82094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B629FC64184
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E4044E4B84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB469286D4D;
	Mon, 17 Nov 2025 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNjL+tPK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHQ6of59"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F5B28032D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382872; cv=none; b=aEkOVC6iyJw/qsu2VOOEKvD27Ps5d5wuVM7pHZvqHD52aZsC6cEqxm6EGnIssdGtYDS7Zw+dahOygak0wSgKnGM0gL25/lFB38FleI+jUstF0X8zZIuS3oPC9AF8RUkIOd3W6hnSihAAjpqiRmfTWZYC+kCju57EZHVAgbtDzqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382872; c=relaxed/simple;
	bh=5N/WUSFs05AZ2ayhBYFMKXz45KQct40AYkjaJyMyUd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZMa2+J3lUKM5V5Dx5ezrC4KEcrND/23h7zoSY7MktEkCyEo04uFsQ8Kv1BA7CI1n8/oFy0HKzaWFRCjYQMDFZ7FuX8CJ+i1NByG61HZbNpkeUDJj14RYsSe+sOr7D7otYAWKg1Bx1FhUSZqf/nbQ4a08OFnYx8406hB5JhFKzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNjL+tPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHQ6of59; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB2TY13916549
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w389bHTtzU7y5+ESoIMlR1+oTu9Rf9QOelpon9+5P70=; b=fNjL+tPKYlqxtDyT
	kbZuvTUVNJU/avGr7U1cdL+y3KGaecNgq+4P4s0wLzmAMx3WnZsZReSuWx+AgTqR
	7t17twreo5v2rHRDzeW9h5l45zeSO9LDthtXCcfklgG4iI0jHgLO+S55ZBsk+dXN
	JwCYj0JmUFegLYa+UbLZbDlcgIsFGt3yqmiTGp99Ot1MxWLdJsqKZGptQxMex1Nr
	4nwYhpG8RZNDunlQhUZD7wmT+ZIlLc4ZR2ti45wR/eNsxZsahEPXP/5YZolz0YFC
	zuOgHpNeHO1m+Nq1JTvQA+oFWmxWxzp03do+WgVuNbeDAE7hiwGdIflIH0Ghjd5l
	t+AwpA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx88k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:34:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so17010821cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763382869; x=1763987669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w389bHTtzU7y5+ESoIMlR1+oTu9Rf9QOelpon9+5P70=;
        b=iHQ6of59LXrwvi150YWGZIKwaa1OXPraDzHk2k/fXbzhInUWFCC7cXI26fl3Io6CI3
         ci/EAtLBmS+eW2r+4RGdTllEW0eLvIg/oJUeKW6/K6AsmPmx3eq5begna6bB7Fuyy7N3
         8dLlFVuJD+TUtH8WdO8E9JcS+pUX7XWm552ZioqDc6rc/pK9FFVSl0nrYIouygREIP5b
         SpXZAcdeDTKz26LkjxGJOxh3SwuXLT+6YK37Q0r+bUdg9K31On0RN3v66ko4m7zoC8lj
         596mPD01D0g27HBbYjr4b0/pmFz+cO5lc540Mn13btp/XKfjnKXOEwPXkSKxF6uFFWgb
         8VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763382869; x=1763987669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w389bHTtzU7y5+ESoIMlR1+oTu9Rf9QOelpon9+5P70=;
        b=HOzLUqrfkrm1FWsF21ytg8eAL6r7rllScO/uz5JTeEx5K/RpblTVd08whB69yuq1Jp
         M5vYMYkXfUYM5w8LHwlbW6GR6BlAyEdOtf8tdWMR7XjtryvG2tOX0xz60r5gi3/OPl0J
         ov0oLq9WESESGKVtTiSdZRDc82xHY+GUrXl/pLHfNbz7+17rkGCgdnCD/8vTSRcKT3gZ
         M0hDOys06vl9FG2YZjDeHHVdRNDzHAB44MLCuV3xIJrjpc6yefCbZcf9q7uF/dP1q/2M
         FJ/sazecNXr6TI52iI9+sbjen+LrKAundpwHvQRIRU/cvsNH5R2g6BKBcht9nO1khh2R
         ZyMQ==
X-Gm-Message-State: AOJu0Yy9ZMhdlUWirfe+GCTwy41h53CPTa/l1xsDFCFI0CMoR6u66bSv
	JiFeOueRXN6EGbxj9tOq+Z0O4hWVaPVWyaas2rgs5PyvouoHBzWIbWQuvViHEcdrBN9Axgt4140
	WTTB7kOU/F1eSdd2dOuGs9aTNrhYQ9znrOU8tK+gOTPiFcMZrWhIzavWh3jng3oa5T2ft
X-Gm-Gg: ASbGncsKNrjeSImBWXJwjpz5XYr/upmIl4Wc8GR3nDdNbJJTwH/Fb5Mb8xOdO4HpT2Q
	UTL2IobSPhqD3jJlf0V5737S1A4wdvQnv2dUyagyUygLy6tNNjYm510CAkfrvbRQb3zEH5mNepb
	40P2RD6tyh/h7SRVriF8RXpwkqm5bL6mfFHb5oHFESuYU6dpc3TZPCeGhRCAhKYR/slBaeG+52G
	akB4HU+0FAoY7H6vrBMZWd/IR/5OOrPP3K1r5UY9miQhZnlCvri9x7eY29GiUehrrWzZlBdncyH
	t4WLIrFvOEwGZNby7Y81Spq5K4aih0Kxuj0vq91dyBXmZ6xwLFvQ1gR0T/AY4r8NOmtDMboqGXu
	vU0VqsNP2JH7YTzVhpzRKXCfjZKsSoVLeuYCaakBF4YHw7VVpmC6kFayZ
X-Received: by 2002:ac8:5ac5:0:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4edf36e8070mr115889371cf.10.1763382869407;
        Mon, 17 Nov 2025 04:34:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/kyEjga6WhwlrGj52pKFpE2X/U0hipfE1znU6np/fizT9tp18cKnra0nyXXpo2tjrupwu+A==
X-Received: by 2002:ac8:5ac5:0:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4edf36e8070mr115889111cf.10.1763382869007;
        Mon, 17 Nov 2025 04:34:29 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaa15asm1046301966b.57.2025.11.17.04.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:34:28 -0800 (PST)
Message-ID: <8580c092-3e1f-4b53-8330-ac1746b7a126@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:34:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <9e8b47d8-9a20-40da-a6eb-cdd167c108dd@oss.qualcomm.com>
 <5029600e-a3b8-4aec-a374-526fb3f6417e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5029600e-a3b8-4aec-a374-526fb3f6417e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HD2YM21xw3g-LCJKyb9BrWnOlwfd6nox
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b1656 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JJSNccE5FFmdhRU14skA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: HD2YM21xw3g-LCJKyb9BrWnOlwfd6nox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNiBTYWx0ZWRfXxbo8If8lAKVc
 yjySDwWWl1SgsIPGfmvsID66xQjKbpFoHnQsvu3LE6x/3DhRNvTrM2BPSKC7fXMSTriHJrthhPV
 gK4YpjZ3LrSiV3jgJLN4YKoi/xaeCtPMnNwEFdN6amu+WArI6QnZLjH00vz/pjfR98hElYM98m/
 oI31Kou+LGFftR4IELrMhDseUHNzMJXYGSGf6XKapaC2dmvtVFhzT2GMaTm3Asb1vwwOG2GS7LN
 PhOGFAS4FegEFBJmgD+XoeDdzcQsRGmqdex1Hjwhp6DwppXjIRnE1Vf6Q7CcPwtnBDeXZ56ek9B
 rzQAwAqCUk7DAzfviDyKhDqL3UYtzAkC1/8PJv0VdxSQlhq6gI6l+sbk/z3qtJknj5J/ZGzWn/I
 Dr6/CpsSMbTVciww57A/6LJROecVbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170106

On 11/17/25 9:26 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 11/12/2025 4:56 PM, Konrad Dybcio wrote:
>> On 10/21/25 11:08 PM, Kamal Wadhwa wrote:
>>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>
>>> All rpmh_*() APIs so far have supported placing votes for various
>>> resource settings but the H/W also have option to read resource
>>> settings.
>>>
>>> This change adds a new rpmh_read() API to allow clients
>>> to read back resource setting from H/W. This will be useful for
>>> clients like regulators, which currently don't have a way to know
>>> the settings applied during bootloader stage.
>>>
>>> Link: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
>>> +{
>>> +	DECLARE_COMPLETION_ONSTACK(compl);
>>> +	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
>>> +	int ret;
>>> +
>>> +	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);
>>
>> Is there a reason for making this ACTIVE_ONLY?
> 
> Yes, using ACTIVE_ONLY makes the read request place immediately to read back the current resource setting.
> Sleep/Wake are H/W based trigger and are not applicable for this API.

Huh? So if I send a read request with e.g. SLEEP_STATE, it would only
get fulfilled upon an active->sleep transition?

Konrad

