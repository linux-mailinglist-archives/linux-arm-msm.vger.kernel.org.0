Return-Path: <linux-arm-msm+bounces-65623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDC4B09FEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D5761667C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11A11E98E3;
	Fri, 18 Jul 2025 09:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOpgf8ho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575DD1FBCA1
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831404; cv=none; b=FPYBjB9uI+fFLJfZDYQaP4ZJjQKXSARXA/MnfH9Zq1V/u8iX0Lz2RzfRB+es3R6uAsiv4rYRH4ShTVahkPkJCuxmJrjjbO+2BOMaYu3LzlFm9q9cp3DedwXBphWsIQLoJollsIYBhbMZiev25GhVz9OTH0boQMFDJjlecrwbTqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831404; c=relaxed/simple;
	bh=qEFZ5DH2AG+giULJkp/4FDX1QNcmSbW+QRxBkpWw1p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGYGoSspLmU9iKfbxddpRVj/HZ3T7P1jIxEMycNgH+4ElWSZJG/QeM3v5FWnCokwJsDA0DcBTxndSjOu5N3RZz/F61cbKXOw6Ftb+rDywrnZBv67zkLeKX2HoiXptN2LOBllGy/fejnbNee7A/NfagApR75xbhLAQhiNwDK8GJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOpgf8ho; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I89OJ0020662
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	72fuRZDHA2C4w80oHJ+JOeIuL4vnW4n3bjADol5r4EQ=; b=OOpgf8hoD7V37vAx
	B2k1F++oE8DrbU5e9psagCXnTfbdUG664WOHtYv5bXYTWSZYWUNVbXFOTKF+VkTE
	TXrVjMF0uzp9pzSoumW8oAW0JzeYMw3u78Uq4vO+tA2Vo/oRw4kmLFp6KbLdJP1K
	z+UBkzh8jHVpRKXM462OwntkvVH1VQRzmwnLzNSAVMI2vj2apa9WVuOQlMILUhBH
	x6VDwpiZ79+qs9zOGAo+M5i/fIlsNJlSbOIdAzRQYIhLE0RnIBDGh35ZZ5SMtaPU
	7iRu1qFz+yqEuuAEvTLCIOXQuZ6rlIPZTGqOvXBeYKRwdjsUzoJF6wzs6JfWbc1J
	Zqaleg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpp2a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:36:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235c897d378so18003405ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 02:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752831402; x=1753436202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72fuRZDHA2C4w80oHJ+JOeIuL4vnW4n3bjADol5r4EQ=;
        b=Dv5fJrTqhCuD8Hp1N+Gxb166kLqgwcX0Wtmd2aYmptzl44fBBDgsmkPBHM6zdWCOS3
         zuMFg8Zbd5q5dRJpFTULWKTyrsQnbicOyzAdb59opTgKGnJlBnuLOIj5JPB3YlRhGK3q
         oEqLQQPpvAkywuMA68mFB8qWl4wHBUNGwWmXZ37tHTAwPJ8I4lRIn15fo0IXT0qcAtDA
         ZzQeCtEPsGEp6ew4OzXJZ4zYxpoRYdbhDL/H3YfZ6sfg2a+5xtP96YEgY+xPIccm/jW2
         S1FVAxx5tsXa2IfS0eWb/kfcgKnU4ZztM8ljgnt8WcZeltciI/k6ZZB3msB0w/Hnv12R
         0Xkw==
X-Forwarded-Encrypted: i=1; AJvYcCU/vF2IWFl7R1O682KmRSs25ebqmYpZyIfEOOvSAr5UczWAO4Vc0rEGDATsEm8mQ96zOdS/Aw6diskNSomj@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFbAwp1IuTR2tvULkDRS16idbntD2h0Rmpl2L7tHDSmZywHxu
	d5WWFyH3HcW+in98pLjRCAVdmGpkGVgrVGriJ0iikIAmwS4aamaeUifrySwpl7eLCZ6h7JOMX15
	klqO+F821Gi3oR9X5kXBINA34DVLt+qeXTrflzhL09YtdtprAu+DR98N5lnf4rgoe0OR6
X-Gm-Gg: ASbGncvVOhTg1oIxA3XtryMUAJRXXKdRqMFxKJbSUZpjGnYC3Iy2ZVvpUWwy0qS+GOW
	qUO7yM4OR1xPCBB8z8nmk0nilrHBEcgwPm0o+8N/QEey/6HFl0qXF0oWmp4cXE6ppcnCBDDzf+8
	/aArqYe1i6cN429XWMaMVLpEoQj66djmOnH363h5io9JQ+OH2E2juSmW6Dgis/ELegG5rcwdoRn
	F4qdyg71V51b7FT7oudWma5dus/9x3+uvaxxZs+qNXUjPEznyciqlqLF8AoR2EnpnpnVXvTm1OM
	Pc/Pu52nEMlDchzNhIXGLUpSIBaV9k9AHrRVpLH/AcauDXAARWekBaxtSWXV/Ksu+XW2qwIenu2
	mpXlE1NnPPHxHl8i5hrXU7S8=
X-Received: by 2002:a17:902:c943:b0:234:ba37:87a5 with SMTP id d9443c01a7336-23e24f4a7c9mr130870305ad.25.1752831401594;
        Fri, 18 Jul 2025 02:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp4sFfqHaGHRuWJ/EeS/AGLmlnSykkRcmXhCvLfBNJz2Ba7o/Pxq0DoSFqc2RPSb3hpiQ0Kw==
X-Received: by 2002:a17:902:c943:b0:234:ba37:87a5 with SMTP id d9443c01a7336-23e24f4a7c9mr130869955ad.25.1752831401127;
        Fri, 18 Jul 2025 02:36:41 -0700 (PDT)
Received: from [10.133.33.13] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d2a82sm9687825ad.156.2025.07.18.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 02:36:40 -0700 (PDT)
Message-ID: <da49f445-7365-4863-bb41-f7a55150c4dd@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 17:36:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 02/10] coresight: core: add a new API to
 retrieve the helper device
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
 <20250714063109.591-3-jie.gan@oss.qualcomm.com>
 <CAJ9a7VikU9UktC-fpLfR5EdpGupHHor2GaDGAujBnQJky=W17w@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VikU9UktC-fpLfR5EdpGupHHor2GaDGAujBnQJky=W17w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3NCBTYWx0ZWRfX41L7XyCj/rTk
 xVgW8QCjhapq6jbUgXYN2DlQDOTIIJGK8DVgXfNlMTVFX3z6vsQVXFukH7XHbmowpn781OgL/Cy
 szWx4wQRR+Ui6LFoD1gLJLjbA5Chs1/FBVsF7TbVzsMENrsh99bOwLoiwC+J5loXeziGg45ZRKL
 XWrJ50Ln37FL4JhS7viIaxfzRLm+znKPb/Z0DrYrKZDL7jbEFsP6MIxgO9jIqOuqEwj+OtbhQ71
 JMUz6yGT+N/sPfkjRoCTuFdxBZxPhEzVjnYqxfqh9lVYh4EK7tXY40/vUEIiRLvu97cAcVhC5Z6
 bg7cY/QI2EFUoKIyE3ulgQjfIt/T7W06r72K+jdd5a6/5+qXDzwKEasMQAbmbnuScfR3P1i08eE
 EGNe00pN0g37athr9jsokksIUSz3wD8B2MW5D5k3s1rUH7vC+fcXf6fl9d3lx9Wg7/0GGCkd
X-Proofpoint-GUID: jCUX_dtwbnEOQpXqUbpobpI9IVQwAYjy
X-Proofpoint-ORIG-GUID: jCUX_dtwbnEOQpXqUbpobpI9IVQwAYjy
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687a15aa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4z_qIjeFvS-qpd6pgFUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180074



On 7/18/2025 4:37 PM, Mike Leach wrote:
> Hi,
> 
> On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Retrieving the helper device of the specific coresight device based on
>> its helper_subtype because a single coresight device may has multiple types
>> of the helper devices.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 30 ++++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
>> index 5297a5ff7921..76e10c36a8a1 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -580,6 +580,36 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>>
>> +/**
>> + * coresight_get_helper: find the helper device of the assigned csdev.
>> + *
>> + * @csdev: The csdev the helper device is conntected to.
>> + * @type:  helper_subtype of the expected helper device.
>> + *
>> + * Retrieve the helper device for the specific csdev based on its
>> + * helper_subtype.
>> + *
>> + * Return: the helper's csdev upon success or NULL for fail.
>> + */
>> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
>> +                                             int type)
>> +{
>> +       int i;
>> +       struct coresight_device *helper;
>> +
>> +       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>> +               helper = csdev->pdata->out_conns[i]->dest_dev;
>> +               if (!helper || !coresight_is_helper(helper))
>> +                       continue;
>> +
> 
> Manipulating the connections list almost certainly requires some
> locking. See other functions in this file
> 

Thanks for pointing out. I will fix it in next version.

Thanks,
Jie

> Mike
> 
> 
>> +               if (helper->subtype.helper_subtype == type)
>> +                       return helper;
>> +       }
>> +
>> +       return NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_get_helper);
>> +
>>   /**
>>    * coresight_get_port_helper: get the in-port number of the helper device
>>    * that is connected to the csdev.
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
>> index 07a5f03de81d..5b912eb60401 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>>                                     enum cs_mode mode);
>>   int coresight_get_port_helper(struct coresight_device *csdev,
>>                                struct coresight_device *helper);
>> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
>> +                                             int type);
>>
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>>   int etm_readl_cp14(u32 off, unsigned int *val);
>> --
>> 2.34.1
>>
> 
> 


