Return-Path: <linux-arm-msm+bounces-79797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BDC23414
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 05:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 623413BDC24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 04:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4B0264628;
	Fri, 31 Oct 2025 04:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ciC/AbC6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IneYiMYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D302228E0F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761885479; cv=none; b=Zz/4BkD+rpt+tRBTcBDPOnsJXT3OkJoLY2LSQrpaQRtC1uFCT0T75uPBEEEqEjcduP2cztf2QY/CUyZIKhBLpR43Wmx6NGetivYLaU/VE9HwyX00IjGbuLyRX9elqZN9jWS/YxSU3vfeoeUJAq1R4rYmgoMpFD8WqNfqbm6y6Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761885479; c=relaxed/simple;
	bh=lz8UJArWZf8I78gBwEgNke/Fv1gGmVwpNOHFfRqtBU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDYOI1DC36nmmB5FqpT3LeZ349oHrVHbeo5vr5nguMYPchYXc4MBTebZBUalGy5J9zie3nJ3hhwgrhfLpue0k88rRo9ilQms8s0O/JgyHvgPyW+q4/Hf/TjSTgZp04TgR9q93TskmjGi6GPPjNkWCDbShoVRzUvm4GtmGyqMizs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ciC/AbC6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IneYiMYC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V4Ldr11826784
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geQUANiKRrxXij24pr7zkM3LfP5MoWomVGycUWLTn0g=; b=ciC/AbC6Jpe2HBOi
	u4WGGlWQ8ls/hbmimghClU6mGG67tqkwr+eHIlaNCWHRhFVyVoWSfz1hy41n0m2K
	cwfL5Wt0Iy1K/jUuER+aZucRWg/7eVDyFM0jMeitEl55/t3M0gz5/Rf4/UmSpiYA
	href+FtpjLnCkWnNqF4qUYOZrCpWncOVdjqGwiV3E01h0XslyG+LGVc6fQCR74zr
	+XVn9skPOwtRkmWppY4dSi681XNVWP2mfcKn3sCJxP17tXDnUXolw0k5Oh6keGrF
	3/1R4go6BnH3X3jbxaGHt5jgVovRfgkjtK4Oyd87CBBCyJ/rCBbLnF7Hwi6wlEiX
	Mpytig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11r10f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:37:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28c58e009d1so39353625ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 21:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761885476; x=1762490276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=geQUANiKRrxXij24pr7zkM3LfP5MoWomVGycUWLTn0g=;
        b=IneYiMYC2K4XNG0UIWP/HM84q5HFDQPwVCby9In60touP7sWm5EmMVg3OzrxGv/dvs
         dY+eNUMxBe6OrxI2IMdA0Mq3yI+B3XgmwmL9CmZCRgPLjypa8aCN+EI8vEO7wEYoOt2m
         eAItENowCCoYStrjgObknjhei0/x65WXv72tCqyH0E9/OJT/Eud9ktuXtK6k6rorr5ft
         W9EJ/sArErA62W/93+B2NLOTa5Jkoh4USZb5cgpQe83vPJUEb+7JtkIS5aAS0mfBE/Um
         MCUO24h4ZKhFpMBjfspEm9GgHudFdhIzusKTDq9Kpkz5yffjWVk1X8cVJ+v1rWI362Rl
         4zDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761885476; x=1762490276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=geQUANiKRrxXij24pr7zkM3LfP5MoWomVGycUWLTn0g=;
        b=wsT7QKAn+Jckq4s1xUp1aKw8Catz0zfRO1KnozcFuBd7k5WORBq4vrNGendOksj66n
         +ukPjGwnZCJrVk0VHuMDIeQCI0K4uwOA9SKp1iXDYbd8UzYsFjzdLhebflNk8bj5s6DK
         DLXgoBvQZMjtdFm694ex63fUBgJgdOsM/3fnmNfV+vUYFXOZ5v80RBilJy7w8JPEbVbv
         4EQ6sjl1GwqDJYOhuCcE6/lQKJAvRqO1NO5Ooo+Sbc0z97dRIZjDuzexI9GhHppEids/
         FNcUNeKY5Vu8POH74XETWUr9DDRLo4EubQw25+izHdcbpntKV1qv2Oxlr52Zkl7e2qAD
         uZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCUrMV4Xe+KrAyY2OHn1GHLk2FCV09r2JnLFQNmkQE5C60nczilh37Ee6DKFy/pigb6nmCK1d1ERflA80280@vger.kernel.org
X-Gm-Message-State: AOJu0YxT94e5MvEOJoXvVRu2ZzSyNW4VHfwH6fgrxKaiwIYBP8a1RZWI
	rYMkKvdcIgBc52Q5aqk3JRWIFkH0ANurop20U8euESsm8fRaz4l3YSUcdv47EjB0w1h3my/RllW
	3djD7gNKS8N2PMNcCIt1ZM7vp4N+SsLKEH8UQw8h/bF7emTkvnRKPSrfkwANIEvcfjzOd
X-Gm-Gg: ASbGncshpbIGqf4+h1uC49rXbkH05TWkZWoi+tmw71aMbsZVpqbUGn8QzYoMGOnsagY
	Dv7cTugwBxFCFhLynPPWk0gNR4NaIw0BBGpSVuNEeBZxS7m8ldglNg11UR0m1I41MZ7+y+Rvqjo
	S39fZ4oDyO6177OQnfiJYaS5xeP3IWDXj3NeW6D/cT1/Fkd6cXB29vywN+sraQwLqeCCb+nin/0
	aEtS1Ff3vsisLxJzWPArJdGN8V4hh5nMC0j362sKGtlm6iu7VyMavKfiq5sOv9MfplgELNzCxZ1
	Oe6UjvKNmty/clGJMhrIjosN0H9mgJEE/wgRDBCnMsvyvsKUTDSp3RjO9u8wo5KRAkQgxS6IfeJ
	xIXx7pMMOBE+/DgSB/1cXWCCuWrSqc3GOGzjKfTnt1XE=
X-Received: by 2002:a17:903:2f83:b0:275:1833:96e5 with SMTP id d9443c01a7336-2951a3dd7ddmr29944285ad.24.1761885475569;
        Thu, 30 Oct 2025 21:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGftKe8KCyKs4T7LjRtICkkAGiQAEcZ0CTV2xdzIP+1yJKykipFyBATMMEwA6X/LKEw7fuWSA==
X-Received: by 2002:a17:903:2f83:b0:275:1833:96e5 with SMTP id d9443c01a7336-2951a3dd7ddmr29944095ad.24.1761885475086;
        Thu, 30 Oct 2025 21:37:55 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c866sm7136225ad.86.2025.10.30.21.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 21:37:54 -0700 (PDT)
Message-ID: <4858c946-d77e-47d7-a757-275a72bbb37e@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:07:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: add support to extract more than
 32 image versions
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com>
 <20251030-image-crm-part2-v1-2-676305a652c6@oss.qualcomm.com>
 <wyfv5abzo2ow37gbnktormshgasd64cjyf4rjyl3onvq2tgr7y@6hh4nxmk3rpg>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <wyfv5abzo2ow37gbnktormshgasd64cjyf4rjyl3onvq2tgr7y@6hh4nxmk3rpg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hitsJZCFMucpmn42nqyj7QtkJYh2Pht3
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=69043d24 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pfTqpNOsBDqalM9Tbi0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: hitsJZCFMucpmn42nqyj7QtkJYh2Pht3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA0MCBTYWx0ZWRfX/AMT7T7yPBu0
 ytArNJrSYFs/mqZGhXrLAdgLqJtL2CBjFgOG+YxTCTIvirQtcdA+pNu2LGmAsG5ScKUvSEjR8EU
 DG1Yxoq1HAKgKKfGTSAReo6vTtLe9QdalC/zWF6JjLQAF5KSaKiE8gnVKEwXFpxols/MLWh8Wx4
 1jHSoSyew0/n6bVqX4cVyuWELFtCMQKiUo5FjmpK/+C+6K7KsWcVS3iBucn2DLakjTl7n1iwglm
 eIeoONOjNcqooEDnIy5LW+daonySV05cRJku54gAQ3xvHMGT7sBHQ46IfTNExZYiKbfpEVOa3fJ
 YVwV41+m1nViVhukWrxOmFwT2P863rCZFGzhrP8g44WFfKeYM5upbt3XZUqFDl4P6H1bbFl1cSX
 jMU0LkgQkGm6K3pheuXcZd8sIODxmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310040


On 10/30/2025 10:41 PM, Bjorn Andersson wrote:
> On Thu, Oct 30, 2025 at 03:07:49PM +0530, Kathiravan Thirumoorthy wrote:
>> SMEM_IMAGE_VERSION_TABLE contains the version of the first 32 images.
>> Add images beyond that and read these from SMEM_IMAGE_VERSION_TABLE_2.
>>
>> Not all platforms define the SMEM item number 667, in that case
>> qcom_smem_get() will throw the invalid item warning. To avoid that,
>> validate the SMEM item before fetching the version details.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/socinfo.c | 46 ++++++++++++++++++++++++++++++++++++++--------
>>   1 file changed, 38 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
>> index 4fd09e2bfd021424b9489cd29eec29dc7c7a16d3..f832ae36942b10f68f0c3304f98d946796e8d1bd 100644
>> --- a/drivers/soc/qcom/socinfo.c
>> +++ b/drivers/soc/qcom/socinfo.c
>> @@ -67,7 +67,17 @@
>>   #define SMEM_IMAGE_TABLE_GEARVM_INDEX	29
>>   #define SMEM_IMAGE_TABLE_UEFI_INDEX	30
>>   #define SMEM_IMAGE_TABLE_CDSP3_INDEX	31
>> +#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX	32
>> +#define SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX	33
>> +#define SMEM_IMAGE_TABLE_DCP_INDEX	34
>> +#define SMEM_IMAGE_TABLE_OOBS_INDEX	35
>> +#define SMEM_IMAGE_TABLE_OOBNS_INDEX	36
>> +#define SMEM_IMAGE_TABLE_DEVCFG_INDEX	37
>> +#define SMEM_IMAGE_TABLE_BTPD_INDEX	38
>> +#define SMEM_IMAGE_TABLE_QECP_INDEX	39
>> +
>>   #define SMEM_IMAGE_VERSION_TABLE       469
>> +#define SMEM_IMAGE_VERSION_TABLE_2	667
>>   
>>   /*
>>    * SMEM Image table names
>> @@ -79,13 +89,18 @@ static const char *const socinfo_image_names[] = {
>>   	[SMEM_IMAGE_TABLE_APPSBL_INDEX] = "appsbl",
>>   	[SMEM_IMAGE_TABLE_APPS_INDEX] = "apps",
>>   	[SMEM_IMAGE_TABLE_AUDIOPD_INDEX] = "audiopd",
>> +	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP1_INDEX] = "audiopd_adsp1",
>> +	[SMEM_IMAGE_TABLE_AUDIOPD_ADSP2_INDEX] = "audiopd_adsp2",
>>   	[SMEM_IMAGE_TABLE_BOOT_INDEX] = "boot",
>> +	[SMEM_IMAGE_TABLE_BTPD_INDEX] = "btpd",
>>   	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
>>   	[SMEM_IMAGE_TABLE_CDSP2_INDEX] = "cdsp2",
>>   	[SMEM_IMAGE_TABLE_CDSP3_INDEX] = "cdsp3",
>>   	[SMEM_IMAGE_TABLE_CDSP_INDEX] = "cdsp",
>>   	[SMEM_IMAGE_TABLE_CHARGERPD_INDEX] = "chargerpd",
>>   	[SMEM_IMAGE_TABLE_CNSS_INDEX] = "cnss",
>> +	[SMEM_IMAGE_TABLE_DCP_INDEX] = "dcp",
>> +	[SMEM_IMAGE_TABLE_DEVCFG_INDEX] = "devcfg",
>>   	[SMEM_IMAGE_TABLE_DSPS_INDEX] = "dsps",
>>   	[SMEM_IMAGE_TABLE_GEARVM_INDEX] = "gearvm",
>>   	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
>> @@ -95,6 +110,9 @@ static const char *const socinfo_image_names[] = {
>>   	[SMEM_IMAGE_TABLE_NPU_INDEX] = "npu",
>>   	[SMEM_IMAGE_TABLE_OEMPD_INDEX] = "oempd",
>>   	[SMEM_IMAGE_TABLE_OISPD_INDEX] = "oispd",
>> +	[SMEM_IMAGE_TABLE_OOBNS_INDEX] = "oobns",
>> +	[SMEM_IMAGE_TABLE_OOBS_INDEX] = "oobs",
>> +	[SMEM_IMAGE_TABLE_QECP_INDEX] = "qecp",
>>   	[SMEM_IMAGE_TABLE_RPM_INDEX] = "rpm",
>>   	[SMEM_IMAGE_TABLE_SDI_INDEX] = "sdi",
>>   	[SMEM_IMAGE_TABLE_SENSORPD_INDEX] = "sensorpd",
>> @@ -644,7 +662,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>>   	struct smem_image_version *versions;
>>   	struct dentry *dentry;
>>   	size_t size;
>> -	int i;
>> +	int i, j;
>>   	unsigned int num_pmics;
>>   	unsigned int pmic_array_offset;
>>   
>> @@ -788,20 +806,32 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>>   		break;
>>   	}
>>   
>> -	versions = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_IMAGE_VERSION_TABLE,
>> -				 &size);
>> -
>> -	for (i = 0; i < ARRAY_SIZE(socinfo_image_names); i++) {
>> +	for (i = 0, j = 0; i < ARRAY_SIZE(socinfo_image_names); i++, j++) {
>>   		if (!socinfo_image_names[i])
>>   			continue;
>>   
>> +		if (i == 0) {
>> +			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
>> +						 SMEM_IMAGE_VERSION_TABLE,
>> +						 &size);
>> +		}
>> +		if (i == 32) {
> Probably nicer to do } else if (...) { here...


Ack.


>
>> +			if (!qcom_smem_validate_item(SMEM_IMAGE_VERSION_TABLE_2))
> Let's see if we can clean up patch 1 and get rid of this.
> Other than that, this patch looks good.


Yeah, will drop this one and add the check for "versions".


>
> Regards,
> Bjorn
>
>> +				break;
>> +
>> +			j = 0;
>> +			versions = qcom_smem_get(QCOM_SMEM_HOST_ANY,
>> +						 SMEM_IMAGE_VERSION_TABLE_2,
>> +						 &size);
>> +		}
>> +
>>   		dentry = debugfs_create_dir(socinfo_image_names[i],
>>   					    qcom_socinfo->dbg_root);
>> -		debugfs_create_file("name", 0444, dentry, &versions[i],
>> +		debugfs_create_file("name", 0444, dentry, &versions[j],
>>   				    &qcom_image_name_ops);
>> -		debugfs_create_file("variant", 0444, dentry, &versions[i],
>> +		debugfs_create_file("variant", 0444, dentry, &versions[j],
>>   				    &qcom_image_variant_ops);
>> -		debugfs_create_file("oem", 0444, dentry, &versions[i],
>> +		debugfs_create_file("oem", 0444, dentry, &versions[j],
>>   				    &qcom_image_oem_ops);
>>   	}
>>   }
>>
>> -- 
>> 2.34.1
>>

