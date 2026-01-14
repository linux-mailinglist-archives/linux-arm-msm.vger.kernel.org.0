Return-Path: <linux-arm-msm+bounces-88892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0FD1BF31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 02:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17605301D0CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 01:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC812E54BB;
	Wed, 14 Jan 2026 01:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiA2R61a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ya1IrjUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1D211CBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354525; cv=none; b=BCk3HAaa6rZVXxii7o4cT4B/w9+c1gwkj3p6PamRDyfHNApuNHES7fmhQmi/QVTI+aZg4PlHheM8ibHOklcBOt025SwlFGbFgh/dRAPTTbi1Puwg7d9Wfa7PYBZZXXnPEdt3d09qwmt0dRZ5WIiGOWzBts2jFo4DJDW6di7dYfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354525; c=relaxed/simple;
	bh=UBZ0xQQc9x8hovtqO2IzmbFI/0v4QnsYfchssHdggm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p4fXCqJ8YenYX8W1Vj5SqwLWFP1oNivViFOxmCCNaUZXe4Jpp8aNGfpwAxIj9jD3jBZWS0oth1DyTXTCs1oX2ivjwBLEymeRmPPU7qv7HYuttOSY7c51nh2QSZikReTGf5FVr/S0wdD0RM52r9mo0Xs5zHBANhCUfbkjI0Ta7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiA2R61a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ya1IrjUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHkHt984988
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tbLyVWXmVL2eJA5y9LHtBYuhAL4cRiZrb7+YgmccOwA=; b=ZiA2R61aKbKsjkg7
	Td8zVE0CnaONJv/7WcJYbYZq3z4DJ7cH/G3jjWGjPuPJw0eYqg7wU/DRdgT4tQqj
	gRhMepTlYfvIMg3ZSLkbwTEg8WDPbNjyRSZb2QrDJzJ2XP/chbJ27mKcJNrG7hyF
	jN1s3kKZrgDlvKxtoyCjWBc64T3KFzY0C6pP9iHqQT3i14n2YaWCQuRGxgT40HlM
	OwS4VBAWR5jUUS8BEAnffexffy7GmYoPS6/5BzJDDFUZZwk3xZ0OwAhibNQgne0f
	Ehz5Bl8c6z175gJU4LUbCh0vBEqesJKTy/bcLbw2e1EbQ6MomP1mYvF5vTnogvPU
	WC0FAg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e9vvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:35:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a09845b7faso60615185ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 17:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768354520; x=1768959320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbLyVWXmVL2eJA5y9LHtBYuhAL4cRiZrb7+YgmccOwA=;
        b=Ya1IrjUtRwRgqnmkoHXH/97iCaA9lrBJLTi4KAWIqmc0inWajrj9j72NcTvq6rmvpK
         8qejhs362O14suT+RSsJJOWKKt51DuFeJCjo8oTj7VNt6djHel0pf9bBAtS2Nuq3agXA
         ImvMLIVQee/MFciclHKFVariq/upMdenhVyTdwd4Hfb4KeGj1Kfye1aAETWniTk0i3QH
         RGg/Zisd7+eeplLOi5eqUgcIJYOYmzmnNw2W8hI3mUKxObop8u73GwPnctmwQ/jSJ9ZX
         KkT12ZdE424GzSPzNKxNiNt0LCwJS56d/SfPUcLtEYKO/xHkiXqrdZRjIhFT80eqVzjD
         tyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768354520; x=1768959320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbLyVWXmVL2eJA5y9LHtBYuhAL4cRiZrb7+YgmccOwA=;
        b=qFSvW6coGlLxbwFRbNLXVYUKBZjCrk+q9X4oxkLsxmXgtXBwJaeP9sBkrMEKvBwrDb
         L+Q9juYw3ML9oeKCNZHrCSdrGkOpDgcAGhrANAK4acQJnIfjlto+G9LhsMh+LanQIjCg
         mAvBawsPR7yV5mPqGEcvwfWvvaaCBJknvGueVHUojJFqOvQ2z52FzWN6qlDj661GS2mD
         aYNBCokfpVtxPu2eRn+/1r/gAmlC57qYa/TQpsf6EBe7cWmUNKIsR6eGIZkpt1OExoHZ
         sp6NZ0h3I1gKerdRYDpO/z9A6odq761om4UCOP/2MjUkZ8IK2riIC5pje3H/YgaOqHDf
         me7g==
X-Gm-Message-State: AOJu0YzGQDoeAOTmFAEY8ku8MI977jBlm7hhpmmStKB9BZsWsDVxKCt+
	0KNv6a28rirpN/7b1ZhbTlYIV45AK97JVVq+WHw89H6VXUN5rvcnWyNA3pEAmc0+y4v2fRP516G
	bX3cAes/uy9GUXtSSDp8SP4kNv3LNkaUtXGr2zUuChXqL+64NKNjmY5Eu5BY4xbhfoGmk
X-Gm-Gg: AY/fxX4rfRJtTk/QgwpXh3SKerIUCFUbDJhIEUrLpPBdi4NRr6jHcld5MDEXJpUFPtg
	aNp+VBw0fbEus2bfShFpOEpa6Tj/xDfCULWkOxY0hfQIVM3pHc2rD9O1gazdvIlXQnUngfI+09J
	LX+LtXZFYNzTEcWLg4F3ET3z9lyydQr/UQ9il14//WeIOZOmVng0On3VTMO6tjEhxXXUXSPWRMp
	+/1aa75gFFmlfojyJullRJlHj6s0VAgozaKMnpmLeD0HHGTJmFfujTCLzWukaf35e+hCsx7Z49/
	A6ywIvbFt+NkdHN6kxBAIfnUt9NUzQfM01nSLVdhmJuCbGiUC6/su2Oy9OzAzohMrr/w+qTAVX/
	NNcO1rIgPjfUjTxQQ0cjhvPyZGDcEqdUYcthLzBUWaA9CwrPeG2ETgU/0CrTH8RwKfOhC2o1GFD
	6w/TMdIQ==
X-Received: by 2002:a17:902:c410:b0:29e:a615:f508 with SMTP id d9443c01a7336-2a599e23086mr9724755ad.28.1768354520266;
        Tue, 13 Jan 2026 17:35:20 -0800 (PST)
X-Received: by 2002:a17:902:c410:b0:29e:a615:f508 with SMTP id d9443c01a7336-2a599e23086mr9724405ad.28.1768354519752;
        Tue, 13 Jan 2026 17:35:19 -0800 (PST)
Received: from [10.133.33.186] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3ba03f9sm210077615ad.0.2026.01.13.17.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 17:35:19 -0800 (PST)
Message-ID: <b3cf9b7c-b692-4a17-8e22-6df356db8834@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 09:35:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
 <20260113-sm8750-camss-v2-2-e5487b98eada@oss.qualcomm.com>
 <61801034-225f-429c-9f34-f80044506bf3@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <61801034-225f-429c-9f34-f80044506bf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=6966f2d9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3IMT_TZWw9feNxxRiIEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAwOCBTYWx0ZWRfXxpJhy0vHcGTL
 B9QmwqQFhJYFdm1A7xoOtUa23R8PRbXanV9DE+DrMTsoQ8sTTEQt6t+Mp0SZaBMvF1nWn+51UMW
 9nm9toKN+G/seiIpX8EKBce679OtAE9otQug0U8i05kzJD5Hq/HqPQXllV0sr9NDzr1+MZ3guTa
 VNceRdeenvFTHIq+RoVACU7o8laOGTbu+YBek+C8Um3ITBetbFxihp2tcpQ9jeNVlRJFB1yKlyK
 FPLYeDtekN70EMldCMARfM5kSc51VrekkjCWJmK2J7SPyVLeo0ctU6Yr+/3Otw8cz5opTBCL9lQ
 UBbR8Y8coIe1cXnSjvYDlUz6SE2FJkGpfNKt19uCZnYT4LzerVWxdISrLHDPH3TPxWkDsCd2XOb
 lQKz/wL8o7UAXKAWUu9RTlpoIr3FTxUaGVSQ73otw6snHUQtXnd4YZrrvbFOTkTsb+ve3QZfb5Y
 Zqf4E0ThqJe7Mahqk6w==
X-Proofpoint-GUID: obqS3zUptuE2qskN6o_BPaMlzTlq0rFj
X-Proofpoint-ORIG-GUID: obqS3zUptuE2qskN6o_BPaMlzTlq0rFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140008

On 1/14/2026 4:53 AM, Vijay Kumar Tumati wrote:
> 
> On 1/13/2026 2:28 AM, Hangxiang Ma wrote:
>> Add support for SM8750 in the camss driver. Add high level resource
>> information along with the bus bandwidth votes. Module level detailed
>> resource information will be enumerated in the following patches of the
>> series.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Hi Hangxiang, I believe some reviewed-by tags are missing for these 
> patches. Can you please double check?
>> ---
>>   drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss.h |  1 +
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>> media/platform/qcom/camss/camss.c
>> index 36ff645d9c1e..56f20daeca3e 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -4066,6 +4066,20 @@ static const struct resources_icc 
>> icc_res_sa8775p[] = {
>>       },
>>   };
>> +static const struct resources_icc icc_res_sm8750[] = {
>> +    {
>> +        .name = "cam_ahb",
>> +        .icc_bw_tbl.avg = 150000,
>> +        .icc_bw_tbl.peak = 300000,
>> +    },
>> +    /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
>> +    {
>> +        .name = "cam_hf_mnoc",
>> +        .icc_bw_tbl.avg = 471860,
>> +        .icc_bw_tbl.peak = 925857,
>> +    },
>> +};
>> +
>>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>>       /* CSIPHY0 */
>>       {
>> @@ -5487,6 +5501,13 @@ static const struct camss_resources 
>> sm8650_resources = {
>>       .vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>>   };
>> +static const struct camss_resources sm8750_resources = {
>> +    .version = CAMSS_8750,
>> +    .pd_name = "top",
>> +    .icc_res = icc_res_sm8750,
>> +    .icc_path_num = ARRAY_SIZE(icc_res_sm8750),
>> +};
>> +
>>   static const struct camss_resources x1e80100_resources = {
>>       .version = CAMSS_X1E80100,
>>       .pd_name = "top",
>> @@ -5518,6 +5539,7 @@ static const struct of_device_id 
>> camss_dt_match[] = {
>>       { .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>>       { .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>       { .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>> +    { .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
>>       { .compatible = "qcom,x1e80100-camss", .data = 
>> &x1e80100_resources },
>>       { }
>>   };
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/ 
>> media/platform/qcom/camss/camss.h
>> index 616ed7bbb732..2a53524dec93 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -91,6 +91,7 @@ enum camss_version {
>>       CAMSS_845,
>>       CAMSS_8550,
>>       CAMSS_8650,
>> +    CAMSS_8750,
>>       CAMSS_8775P,
>>       CAMSS_KAANAPALI,
>>       CAMSS_X1E80100,
> 
> Thanks,
> 
> Vijay.
> 
Hi Vijay, the B4 tool didn’t retrieve any ‘Review-by’ tags before I 
submitted this revision. Since I wasn’t sure if they were valid, I 
didn’t handle that by adding tags manually.

Hi Bryan, is it possible for me to add the 'Review-by' tags manually if 
B4 doesn't pick them up automatically? Your feedback would be helpful so 
I can manage this situation better in the future.

Best Regards,
Hangxiang

