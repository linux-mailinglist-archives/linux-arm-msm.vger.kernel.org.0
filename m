Return-Path: <linux-arm-msm+bounces-67818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E6B1BDF4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 02:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F052B7A48D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 00:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301E47DA66;
	Wed,  6 Aug 2025 00:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B65sNT6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CE442A99
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 00:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754440534; cv=none; b=O4w7iixW1+FfZcPwYyngKUlkwF1IJBCskHEICFrNVMcC2+S6qAded+/A2EU+bQ2PoG4/ho3K5AH7HXwFyGc4S3AdUaDFDuOD62gjbD6Lgj5RgityOi2CB5Jo8j78OUdicuSSfJ18xLLbQdFAw1TGAUco5qY6SlsC+4xfN8owqk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754440534; c=relaxed/simple;
	bh=BHew0vOnsp+mrVXy4PEN730QBspJzc4jYfePueLAW5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwMSzLgOfQ0xFdq5znGyxCYiVdKJqXCxX8atqld9dd9wwUjiMCFncM8AZ0wdwlI5qMdocEtn1jSKxwEO+JzBn4qb0ZfjhH9qpg10goy7/RA+rgEPw8xKRHKG/j1EGjkedgO+Jfktr5GYzb9PIUf1eZZSm2yQqoRytYj6925jQMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B65sNT6t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I2s8D011992
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 00:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33MEykrm88kW0tV7FkI7VdS3PkN0kWkKi5leVAOcx7I=; b=B65sNT6tUln5L+Qs
	d/+rAALmOdK5thEabiQx8Y/L1NbeHfP33qwYFcm1bahj+zeocE43Y5r5k0vP9hNT
	Id6GV/it7D9cF2dxgYr+O3weWMlnBugPSxaYRvXOyqkgARoA3uLnoIwo3SiEitEJ
	I8d9Qy4C5Kt9j+PeecobSnAPRRyTbhHbnMEraai7KdK5tEbzG1gaQaCeUFgFDFDr
	qHFyogMhugB149SC5xZsRgkDikHvYdIdOaFAqRvj/pQtj/+SqUGwotnSp3lLGtCf
	+zHrDr4Q/MpkdSsPbJNhXgUyoVlQV8GEsy7spL35hEFzHn1Lsd7DLmehTZShp9tR
	ONHYWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2rus3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 00:35:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fe26e5a33so77040865ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 17:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754440530; x=1755045330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33MEykrm88kW0tV7FkI7VdS3PkN0kWkKi5leVAOcx7I=;
        b=gzWe/PkW1c3w0PyD7bS8ob4alT7+0912ibQVSAAByQ9Bzsv7TK23ZLfBwnGe6hIQgZ
         Ay43n03CXigxQXZdhFIFWHHSfJNx6Zm28aJLB3DOVYJ35WCD68XEFumGbijNZHNStXQe
         Y/r7C5dz0JGddLkRWNjjPPVkKIO8JB+29iiCJTzpkFEGEPtB6okZDVqFRZkvOsetsyco
         c67Dpj3t5Q6x/xNfiA29fV5xQUFsUCaONpGgH8O6ugTHNuZoPbqHKFcLv7lrvNeX0NkA
         jt4iXk10LQRJEtQIBpe9B+ZGQWATzzZnR8ntB2st1xryckEK2uc7Wf8zaeEjrFRFYCBn
         bdBg==
X-Forwarded-Encrypted: i=1; AJvYcCXSbSA/fLEbNWhEtP8fsiOJjK08P8zZDhWMlL0Pb+525apO7adfKBe3wBw0ye8NnFPf64yUiRlwRh7/5EUr@vger.kernel.org
X-Gm-Message-State: AOJu0YwdEjShyzwGfttk6doGV1SeHbYQ02klEoLDkxLcHig7nEJ3Sivq
	5H7hcwmJSa6QBf677ZmUwbql9X2O+YrObTV17PyxT1ZbtIjyhOhKYRmBfwzAayyxTv5aG0YtL33
	dhY9/8/rADPpv4Bkt/MGB70NdxsDoGKYkOG+SMk5v5S/mTqHtEOhuXS/+WBzX2usDJ9gR
X-Gm-Gg: ASbGncsxzjnSMzzjAqP73QenRGfphjxFxaPiDDjSE03mv4Ul7ORVTbFkS7AfpkLBIg6
	9oHdVvl8l2D9x3QEPgf+tZksq2Vzu1sDeKmrCr6u+sCTiSdyBdDTAgnX1QZ+AXDb+LTPIa3qikx
	syhKP1wBUyWumtaDHeWdsKkrIFItTAWfYe9tqf89J4GYSeaB924TEYK9eGNj10ZJu2j9C2829sD
	1/KdMwlI1p6rUpOTsAaiqMRtBivvISsivWpdUFpdj4hhoA5XxnorOnsNgq01HyapN0M2F/XDkit
	IFn/mm0/qZOqfKQHowAJV2WvjszXYoaZKs7/fJNhhmKNhu3gO5qt8Rzv1Q9fuZRxuJhpQgqk0SR
	lVsNc7gexA2z1GcI3jIUSWh7l
X-Received: by 2002:a17:902:d4d1:b0:240:8c85:4299 with SMTP id d9443c01a7336-2429f2eed79mr17648505ad.17.1754440530007;
        Tue, 05 Aug 2025 17:35:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIyv2qaOgUJsQRonvOcznN+su8mseW9S0RJwVuiRWZ5xeiOYmIdDYzHuuX3sCRo0xPN/m+Vg==
X-Received: by 2002:a17:902:d4d1:b0:240:8c85:4299 with SMTP id d9443c01a7336-2429f2eed79mr17648115ad.17.1754440529509;
        Tue, 05 Aug 2025 17:35:29 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6c62sm145444965ad.4.2025.08.05.17.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 17:35:29 -0700 (PDT)
Message-ID: <40c8c2d0-1ac3-4944-b509-d23f21687476@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 08:35:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] coresight: add a new function in helper_ops
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <quic_jiegan@quicinc.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
 <20250725100806.1157-9-jie.gan@oss.qualcomm.com>
 <CAJ9a7Vi8qpHH2SjmKNjgeY4gdRXY9wnQXhkjN71EcbYSKqayuw@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7Vi8qpHH2SjmKNjgeY4gdRXY9wnQXhkjN71EcbYSKqayuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=6892a353 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=fbnrgmdL-v3imqFNrjgA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: eMWiLIiMAIvHKTbd3dNgx1Npdwopgojo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwMSBTYWx0ZWRfX3UauGtSbAQpf
 pANFwXPUZd+alftYBvQhTPh2EGDaAt2oZbzIQRzhNtnarOf9txUI/G9V2Y5rv7aFzGDE1PsnQWA
 pok87RZiUKuv6tVKx0kPoYfnhFfea2RnCTZpY2csm3z2vWxe4n8g+kobX4lxXD0dzfHzFUSKsn7
 PmPdJuT1RnN2JxKwu2use+Y5IPJRif+ebtMERL5DBg1HjqMnM33Hz1pKqJBbvWAX00YbIRso8zu
 MbqyiwfU/hlD52lc46BW7sT16VRvYIjVX110yHEGlc2cdYDTFHC6B2RBCSRcXda22PRz7s+VFhJ
 GmIuhLIdsfC6NW7hYabBiZwhNHGmiZmnbl8qfGHz3WnO/9B1lPeIrjoifiJvTXvXOc8wLFK7410
 fEVyUqJVV6smFbUB9J4Z760jmfmYSnJqAMkkbNBVSBbJRo7GlL0dPszN5kmI4GyHBi9KYaYh
X-Proofpoint-GUID: eMWiLIiMAIvHKTbd3dNgx1Npdwopgojo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508060001



On 8/5/2025 8:30 PM, Mike Leach wrote:
> Hi,
> 
> On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Add a new function to identifiy whether the byte-cntr function is
>> enabled or not in helper_ops.
>>
>> The byte-cntr's read_ops is expected if the byte-cntr is enabled when
>> the user try to read trace data via sysfs node.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-ctcu-core.c | 35 +++++++++++++++++++
>>   include/linux/coresight.h                     |  3 ++
>>   2 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index 8fc08e42187e..dec911980939 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> @@ -234,9 +234,44 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
>>          return ctcu_set_etr_traceid(csdev, path, false);
>>   }
>>
>> +static bool ctcu_qcom_byte_cntr_in_use(struct coresight_device *csdev,
>> +                                      void **data)
>> +{
>> +       struct ctcu_byte_cntr *byte_cntr_data;
>> +       struct coresight_device *helper;
>> +       struct ctcu_drvdata *drvdata;
>> +       int port;
>> +
>> +       if (!csdev)
>> +               return false;
>> +
>> +       helper = coresight_get_helper(csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
>> +       if (!helper)
>> +               return false;
>> +
>> +       port = coresight_get_in_port_dest(csdev, helper);
>> +       if (port < 0)
>> +               return false;
>> +
>> +       drvdata = dev_get_drvdata(helper->dev.parent);
>> +       /* Something wrong when initialize byte_cntr_read_ops */
>> +       if (!drvdata->byte_cntr_read_ops)
>> +               return false;
>> +
>> +       byte_cntr_data = &drvdata->byte_cntr_data[port];
>> +       /* Return the pointer of the ctcu_drvdata if byte-cntr has enabled */
>> +       if (byte_cntr_data && byte_cntr_data->thresh_val) {
>> +               *data = (void *)drvdata->byte_cntr_read_ops;
>> +               return true;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>>   static const struct coresight_ops_helper ctcu_helper_ops = {
>>          .enable = ctcu_enable,
>>          .disable = ctcu_disable,
>> +       .qcom_byte_cntr_in_use = ctcu_qcom_byte_cntr_in_use,
> 
> These ops structures are for generic functions used throughout the
> devices. Do not put this function here.
> 
> This is a specific ctcu helper. Make it external to the file and
> declare it in coresight-ctcu.h

Will address the comment in next version.

Thanks,
Jie

> 
> Mike
> 
>>   };
>>
>>   static const struct coresight_ops ctcu_ops = {
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 4ac65c68bbf4..b5f052854b08 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -419,11 +419,14 @@ struct coresight_ops_source {
>>    *
>>    * @enable     : Enable the device
>>    * @disable    : Disable the device
>> + * @qcom_byte_cntr_in_use:     check whether the byte-cntr is enabled.
>>    */
>>   struct coresight_ops_helper {
>>          int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
>>                        void *data);
>>          int (*disable)(struct coresight_device *csdev, void *data);
>> +       bool (*qcom_byte_cntr_in_use)(struct coresight_device *csdev,
>> +                                     void **data);
>>   };
>>
>>
>> --
>> 2.34.1
>>
> 
> 


