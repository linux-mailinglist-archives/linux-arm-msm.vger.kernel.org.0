Return-Path: <linux-arm-msm+bounces-86606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 755F1CDD3F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 04:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42E03017646
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 03:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7DB23183C;
	Thu, 25 Dec 2025 03:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKJsD+nR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlWyZoOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F701F4C8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 03:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766632818; cv=none; b=a48gn6fq39cwXkwHvbXIGEg0VuuSfKoYHcKFU+vgBzKj6yQD6BnR9WlSEAIDb9h5py24AhOD2Zi4Qqh8PTdENRMIwNqeKBR/yYqGBnEreKW/zk2xaVlPKSVHXAunS8TbwMUFRQhFzJ8X/T9APS2fPzp/6obFF169yySboFTIhDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766632818; c=relaxed/simple;
	bh=lbuVz9Zkgw39nePnAhuBrxPP2u/F4lj4sMMOa3AtUtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPVz5v58VHY3m+uCLdxowur/U2qFAIP7b1GkfjFUiMRerTLt+7vc4uKsxNhHO4vVjzWOhDJkyNLrig2I9o0tgpdsuUKxMK0g2f7yWFyCZv3guVEYhzRE/f7vEVTVKTnAxiRzXXfTawBo+dyGLq1Fl0vRX9icyp8KIk3AxWdDQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKJsD+nR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlWyZoOd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BONFnBE939845
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 03:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3uE4JFEZai2cEVBJuakfBCR/yVx+AIa/uZIMv4R4Ss=; b=hKJsD+nRhQtrgCFk
	y6rrbpxyA2bpOfZ7IuHSNyxeK9ByvSCxyBQARFEJnS2VoBncANOl6rkGTXDph24L
	tk7dbuw8kHhIqmbp/AMQ8m3qM8WAFU/SG27TR1xuuT/ATF3CBqsswiHxJAnqyflc
	H+Gi8okAecYqdGqQm858gok9kyTwB4AZVOdBYrlR6hvto3cyThADu3g//punhbd8
	VtM8pWz7RDTrl4YxzXEzoNYAzYrWAtlTpR1TXtD5+5pigDMNDFEXbAcniTxs77mc
	KcqAu2r5GvryWdxBFhfnahF9dZxmNjGV4zlUayD0FzZzuiixHD9ZJOoIW37pcRK1
	CmzwZw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8p490jjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 03:20:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9208e1976so11812200b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 19:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766632814; x=1767237614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3uE4JFEZai2cEVBJuakfBCR/yVx+AIa/uZIMv4R4Ss=;
        b=MlWyZoOdoYxaKQWUOn+BE136Aoiz7JPmhRMGRbdrR65ofFWYJ1G2pFap0PQ3eeZcvA
         dIaS8F6Le/CnDT0EEI/HHvqJQcR9ZSPfK91soeS3G42trQd8irb7f0MsVLYeKMzKTbOE
         /6kjbTAsh9z3bpv0bnwnFmfCcwlIGyUSlM/7UgAAX0sn9QCiCJ09tE0frkHPX6qiVjWU
         dvWNr3JzUIRSr2Dbwm1cUDSVL11AsoNZJdleqc7W6YXdte3IL+X+DoUafyXprFr3VxIA
         UeGqNlecOWDE1DnkIEn0687Rd68zQoTeG9dsgdE0TryEc3PuIBwaxEjrPbfqaG6HuOPe
         Gseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766632814; x=1767237614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3uE4JFEZai2cEVBJuakfBCR/yVx+AIa/uZIMv4R4Ss=;
        b=lG3flbNj57IdClgMb7ACkw5axWhlGVchZc/BjRgzLYBtguhqlGq+29ts6c/PeZmlOp
         Vp/q4r+lRxkCwG5CYV8dE4Wo1XuP87QZ1wosQx/8PugOxeb95ejbR4PZ0R3dbyd7GwB+
         9ZfgmcdYapKcvkmDuJTucjnfipRn+P+zTm+znF/GayzSSR//u3lUl/wmFJItDrMiJrFY
         qk7YimywyBrlXnZ/TB4v60Y7dV7iDBzgzt6iHPPVRiOLdImJHfyHBp6N0erUn7jUrh5e
         be11Xog9rqxmWhQoJrAc1ZRw7iv7EDD8smunNjN3gDVZpoCtR45Gkv7tNBEH+O0ACOrd
         Rf5w==
X-Forwarded-Encrypted: i=1; AJvYcCVKT02GQIy0bQ6rto5E+xWR6ibi5vbDWT60LX0a79adFtqsPygc/8mMruSvgxQlpPIDfiaMlUVV67sXjesJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzUeSSEhjjCdukye+dhKm9ayBeinbQpJVSPaWjo5e0c+PQfT6Ab
	ndUJ6llkavcPhVExouqe2d0ER+rcvexYzGSxCZrDfE3YHk57ep2RFphNTkAa1re8rtuAXZAJ+gP
	CvOQW8jJzgvrX74lMKY1fXOaqM9en+9DqMRbDfPA/OAwv5lmYqz4M9tKDeueVhvz/NMTi
X-Gm-Gg: AY/fxX7DhzPRsZd2nWzxHRcw8f45oaeQLs4xHfqHKCh1b4JD4YcAkbBaa118GwADRp4
	mwZ+rGkpno77nSfvGKa0WSPYW43oP7qvLy7x2JDjgGkr9XTWHVR9QHbViitSVofX79iON6gt3VZ
	5MQxQ7peh2OS10XGSqX6MPCvTdFa+S+lLyXf9ttS1b3CHDpleJzaRpq+I3EPYuOXDtNK2bgq7FF
	gbXQopCxnk/dmODsoZb1xaXeVQMU3P8MSmF5pGNLtovu8t5xVu8bv9nKQS+yWnETO8vjT0dYU5z
	SOnoCw0XEVZBiAHRSya3d1lBYIj42k4CB0weJpzf+O9SRt0KkvPppXuAgavRToInXgJEdHSD8oW
	DgbHQmFpc2kmBfybaxnG8hxY3Y1DmqRzw1mVPjMkxzlDhb0bS73Gf4HYUvcWIiZsjWnRfHS4KTG
	E=
X-Received: by 2002:a05:6a21:3283:b0:361:4ca3:e17d with SMTP id adf61e73a8af0-376a81dd76amr18037688637.13.1766632814147;
        Wed, 24 Dec 2025 19:20:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr5dccNAL9Jtw1onKNjTX9H/m8bvi/I2ivl+zCJvZ3fs4SaOJUjNvmJv8P4HItJXxLqPgxfw==
X-Received: by 2002:a05:6a21:3283:b0:361:4ca3:e17d with SMTP id adf61e73a8af0-376a81dd76amr18037664637.13.1766632813532;
        Wed, 24 Dec 2025 19:20:13 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c147943sm15742174a12.26.2025.12.24.19.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 19:20:12 -0800 (PST)
Message-ID: <4ea62244-6bf5-46bc-b026-79806fa372af@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 11:20:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] qcom-tgu: Add signal priority support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-4-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251219065902.2296896-4-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Mn4bVnsUe-nq166eyUJlZoccRu0rrMtJ
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=694cad6f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vWkLcuJU7nNpPdD76OYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDAyOSBTYWx0ZWRfX38jxnkegHAdD
 5r0Gk9mM2yFhXnneD7UsmFofShVIJ8ot/6NTlZV3a1Ue49Ta6eVDKQ+QgWEDAZn8TwYCl1rUOB/
 Jc57JPb77oP5P+GUC+oFe7CZQ0ievOb/GFk4C5jPCKSKJRXzpfiZafonLPfif/TU/ooRBbAbDTY
 uswdOUrVEnef3r45v8+8RVnxoOAO676Es3fQDIe8+KpH82V2FjHVVvFeiti/xu8OjfJOPonhF4e
 36xsTdF1VAn8wMY0gvzBebyRWAKadnVpJ2uEnQmsRs4bMBlGcSWV+7NVeStLOXnMAVW3QHQr/6I
 Qmg6lmVc4D+xEspW/t4N6/DKCApSNt2d93a55qJjnRk6UTVBHrBFh5xeZlrvJXV8u46Nd23Qbpq
 W8BBWpKKHIszN95fMEY6YCvjWW0D2LbjBwNEkWnKSVUzG18mObXZSWKooNwd5P1G7p9WiuyrTlq
 Cw7BTNQoQegP7MI5QhQ==
X-Proofpoint-GUID: Mn4bVnsUe-nq166eyUJlZoccRu0rrMtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250029



On 12/19/2025 2:58 PM, Songwei Chai wrote:
> Like circuit of a Logic analyzer, in TGU, the requirement could be
> configured in each step and the trigger will be created once the
> requirements are met. Add priority functionality here to sort the
> signals into different priorities. The signal which is wanted could
> be configured in each step's priority node, the larger number means
> the higher priority and the signal with higher priority will be sensed
> more preferentially.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 156 ++++++++++++++++++
>   drivers/hwtracing/qcom/tgu.h                  | 113 +++++++++++++
>   3 files changed, 276 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 24dcdf1d70cc..d04a01368089 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -7,3 +7,10 @@ Description:
>   		Accepts only one of the 2 values -  0 or 1.
>   		0 : disable TGU.
>   		1 : enable TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
> +Date:		December 2025
> +KernelVersion	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index dbd1acbd2fa5..447d7e68d132 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -14,14 +14,121 @@
>   
>   #include "tgu.h"
>   
> +static int calculate_array_location(struct tgu_drvdata *drvdata,
> +				   int step_index, int operation_index,
> +				   int reg_index)
> +{
> +	return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
> +		step_index * (drvdata->max_reg) + reg_index;
> +}
> +
> +static ssize_t tgu_dataset_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	int index;

Prefer reverse Christmas tree order

> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =
> +			container_of(attr, struct tgu_attribute, attr);
> +
> +	index = calculate_array_location(drvdata, tgu_attr->step_index,
> +					 tgu_attr->operation_index,
> +					 tgu_attr->reg_num);
> +
> +	return sysfs_emit(buf, "0x%x\n",
> +			  drvdata->value_table->priority[index]);
> +}
> +
> +static ssize_t tgu_dataset_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t size)
> +{
> +	int index;
> +	unsigned long val;

Prefer reverse Christmas tree order

> +
> +	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(attr, struct tgu_attribute, attr);
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&tgu_drvdata->lock);
> +	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
> +					 tgu_attr->operation_index,
> +					 tgu_attr->reg_num);
> +
> +	tgu_drvdata->value_table->priority[index] = val;
> +	return size;
> +}
> +
> +static umode_t tgu_node_visible(struct kobject *kobject,
> +				struct attribute *attr,
> +				int n)
> +{
> +	struct device *dev = kobj_to_dev(kobject);
> +	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret = SYSFS_GROUP_INVISIBLE;
> +
> +	struct device_attribute *dev_attr =
> +		container_of(attr, struct device_attribute, attr);
> +	struct tgu_attribute *tgu_attr =
> +		container_of(dev_attr, struct tgu_attribute, attr);
> +
> +	if (tgu_attr->step_index < drvdata->max_step) {
> +		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
> +			attr->mode : 0;
> +	}
> +	return ret;

if ((tgu_attr->step_index < drvdata->max_step) &&
     (tgu_attr->reg_num < drvdata->max_reg)
	return attr->mode;

return 0;

> +}
> +
>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   {
> +	int i, j, k, index;
> +
>   	TGU_UNLOCK(drvdata->base);
> +	for (i = 0; i < drvdata->max_step; i++) {
> +		for (j = 0; j < MAX_PRIORITY; j++) {
> +			for (k = 0; k < drvdata->max_reg; k++) {
> +				index = calculate_array_location(
> +							drvdata, i, j, k);
> +
> +				writel(drvdata->value_table->priority[index],
> +					drvdata->base +
> +					PRIORITY_REG_STEP(i, j, k));
> +			}
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
>   	TGU_LOCK(drvdata->base);
>   }
>   
> +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
> +{
> +	int num_sense_input;
> +	int num_reg;
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +
> +	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
> +	if (((num_sense_input * NUMBER_BITS_EACH_SIGNAL) % LENGTH_REGISTER) == 0)
> +		num_reg = (num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER;
> +	else
> +		num_reg = ((num_sense_input * NUMBER_BITS_EACH_SIGNAL) / LENGTH_REGISTER) + 1;
> +	drvdata->max_reg = num_reg;
> +
> +}
> +
> +static void tgu_set_steps(struct tgu_drvdata *drvdata)
> +{
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +
> +	drvdata->max_step = TGU_DEVID_STEPS(devid);
> +}
> +
>   static int tgu_enable(struct device *dev)
>   {
>   	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> @@ -106,6 +213,38 @@ static const struct attribute_group tgu_common_grp = {
>   
>   static const struct attribute_group *tgu_attr_groups[] = {
>   	&tgu_common_grp,
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
> +	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>   	NULL,
>   };
>   
> @@ -128,12 +267,29 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	spin_lock_init(&drvdata->lock);
>   
> +	tgu_set_reg_number(drvdata);
> +	tgu_set_steps(drvdata);
> +
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
>   		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>   		return ret;
>   	}
>   
> +	drvdata->value_table =
> +		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
> +	if (!drvdata->value_table)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->priority = devm_kzalloc(
> +		dev,
> +		MAX_PRIORITY * drvdata->max_reg * drvdata->max_step *
> +			sizeof(*(drvdata->value_table->priority)),
> +		GFP_KERNEL);

can we declare a pri_size for better reading?

size_t pri_size;
unsigned int *priority

pri_size = MAX_PRIORITY * drvdata->max_reg * drvdata->max_step *
		sizeof(*(drvdata->value_table->priority));

priority = devm_kzalloc(dev, pri_size, GFP_KERNEL)
if (!priority)
	return -ENOMEM;

drvdata->value_table->priority = priority;

> +
> +	if (!drvdata->value_table->priority)
> +		return -ENOMEM;
> +
>   	drvdata->enable = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index abc732f91dfc..2cf95c239ee7 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -10,6 +10,113 @@
>   #define TGU_CONTROL 0x0000
>   #define TGU_LAR		0xfb0
>   #define TGU_UNLOCK_OFFSET	0xc5acce55
> +#define TGU_DEVID	0xfc8
> +
> +#define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
> +#define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
> +#define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
> +#define NUMBER_BITS_EACH_SIGNAL 4
> +#define LENGTH_REGISTER 32
> +
> +/*
> + *  TGU configuration space                              Step configuration
> + *  offset table                                         space layout
> + * x-------------------------x$                          x-------------x$
> + * |                         |$                          |             |$
> + * |                         |                           |   reserve   |$
> + * |                         |                           |             |$
> + * |coresight management     |                           |-------------|base+n*0x1D8+0x1F4$
> + * |     registe             |                     |---> |prioroty[3]  |$
> + * |                         |                     |     |-------------|base+n*0x1D8+0x194$
> + * |                         |                     |     |prioroty[2]  |$
> + * |-------------------------|                     |     |-------------|base+n*0x1D8+0x134$
> + * |                         |                     |     |prioroty[1]  |$
> + * |         step[7]         |                     |     |-------------|base+n*0x1D8+0xD4$
> + * |-------------------------|->base+0x40+7*0x1D8  |     |prioroty[0]  |$
> + * |                         |                     |     |-------------|base+n*0x1D8+0x74$
> + * |         ...             |                     |     |  condition  |$
> + * |                         |                     |     |   select    |$
> + * |-------------------------|->base+0x40+1*0x1D8  |     |-------------|base+n*0x1D8+0x60$
> + * |                         |                     |     |  condition  |$
> + * |         step[0]         |-------------------->      |   decode    |$
> + * |-------------------------|-> base+0x40               |-------------|base+n*0x1D8+0x50$
> + * |                         |                           |             |$
> + * | Control and status space|                           |Timer/Counter|$
> + * |        space            |                           |             |$
> + * x-------------------------x->base                     x-------------x base+n*0x1D8+0x40$
> + *
> + */
> +#define STEP_OFFSET 0x1D8
> +#define PRIORITY_START_OFFSET 0x0074
> +#define PRIORITY_OFFSET 0x60
> +#define REG_OFFSET 0x4
> +
> +/* Calculate compare step addresses */
> +#define PRIORITY_REG_STEP(step, priority, reg)\
> +	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
> +	 REG_OFFSET * reg + STEP_OFFSET * step)
> +
> +#define tgu_dataset_rw(name, step_index, type, reg_num)                  \
> +	(&((struct tgu_attribute[]){ {                                   \
> +		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> +		step_index,                                              \
> +		type,                                                    \
> +		reg_num,                                                 \
> +	} })[0].attr.attr)
> +
> +#define STEP_PRIORITY(step_index, reg_num, priority)                     \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
> +			reg_num)
> +
> +#define STEP_PRIORITY_LIST(step_index, priority)  \
> +	{STEP_PRIORITY(step_index, 0, priority),  \
> +	 STEP_PRIORITY(step_index, 1, priority),  \
> +	 STEP_PRIORITY(step_index, 2, priority),  \
> +	 STEP_PRIORITY(step_index, 3, priority),  \
> +	 STEP_PRIORITY(step_index, 4, priority),  \
> +	 STEP_PRIORITY(step_index, 5, priority),  \
> +	 STEP_PRIORITY(step_index, 6, priority),  \
> +	 STEP_PRIORITY(step_index, 7, priority),  \
> +	 STEP_PRIORITY(step_index, 8, priority),  \
> +	 STEP_PRIORITY(step_index, 9, priority),  \
> +	 STEP_PRIORITY(step_index, 10, priority), \
> +	 STEP_PRIORITY(step_index, 11, priority), \
> +	 STEP_PRIORITY(step_index, 12, priority), \
> +	 STEP_PRIORITY(step_index, 13, priority), \
> +	 STEP_PRIORITY(step_index, 14, priority), \
> +	 STEP_PRIORITY(step_index, 15, priority), \
> +	 STEP_PRIORITY(step_index, 16, priority), \
> +	 STEP_PRIORITY(step_index, 17, priority), \
> +	 NULL                   \
> +	}
> +
> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_priority" #priority \
> +	})
> +
> +enum operation_index {
> +	TGU_PRIORITY0,
> +	TGU_PRIORITY1,
> +	TGU_PRIORITY2,
> +	TGU_PRIORITY3,
> +};
> +
> +/* Maximum priority that TGU supports */
> +#define MAX_PRIORITY 4
> +
> +struct tgu_attribute {
> +	struct device_attribute attr;
> +	u32 step_index;
> +	enum operation_index operation_index;
> +	u32 reg_num;
> +};
> +
> +struct value_table {
> +	unsigned int *priority;

priority here is an array? can we declare it as unsigned int array to 
limit the allocated memory?

With the declared array, we can avoid one more memory allocation.

priority[index] that is used in code looks like a trick.

> +};

only has one member, better integrate with tgu_drvdata with proper nameing.

Thanks,
Jie

>   
>   static inline void TGU_LOCK(void __iomem *addr)
>   {
> @@ -35,6 +142,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @dev: Pointer to the associated device structure
>    * @lock: Spinlock for handling concurrent access
>    * @enable: Flag indicating whether the TGU device is enabled
> + * @value_table: Store given value based on relevant parameters.
> + * @max_reg: Maximum number of registers
> + * @max_step: Maximum step size
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -46,6 +156,9 @@ struct tgu_drvdata {
>   	struct device *dev;
>   	spinlock_t lock;
>   	bool enable;
> +	struct value_table *value_table;
> +	int max_reg;
> +	int max_step;
>   };
>   
>   #endif


