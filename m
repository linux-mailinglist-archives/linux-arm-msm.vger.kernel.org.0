Return-Path: <linux-arm-msm+bounces-70871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24AB35933
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C0DA68363E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C702FFDED;
	Tue, 26 Aug 2025 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6UacdCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142731984D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756201182; cv=none; b=rwOge2oHj+Bhq8KpdX30IDK+DFK3BzFnDvLst1KZlHDRSXlssu46IBPkGBmrh/H0rAGFVbsfIeJQ/2JPBQuN4WB2lYo9vB5Hiz66K6cLpNRS6QAgjpurYokcGEaN9k76ak0sSoeUc9gEybMs55zhFiGLWGNpO3wPUpmEk0WB35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756201182; c=relaxed/simple;
	bh=nQ89gkCyArWzWht39aCxK1CNu/d5AvIhVfheIzD5aD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCh4qtogffy03fGsB+ev0BD34J+8LUa/4mHs2UL9Ubvzs4xeXybGP3AYbRieRpf5+PFqlNHR5d+1ayR7PH3On/pdFUKa4wR47QzoH6BX8N4ZPwEyRoLAYOdWhR4dR2gnIFced8xe2apTYNXbUCNFjOBZdbGsFVcwdDvUL+BvmiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6UacdCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q31JVI026983
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rJ7RQ7iMaxrweLuf0/TuG+nG9I0o3A0GkBWILSS2Jw=; b=N6UacdCJtMrZGCof
	zoNYCnmYk6/hYjF0l1xbh6YE8HE3vY9pjnHT7erwmcEtd2BR5COTc6lms08za4h9
	jgqwt6nYb+fFPqMYcMkvlpMATIFBLNJHsevjjrG8BADUXEFe1e2umfhnJSFzDGkk
	wBePtKKG81c14C693XKDw9Pk9gUGHeVhlPEPYakaulYvSQ7Fu9aQZonxWDnnmvv/
	3QPDIK6JoxwTiYABG/lMNdWP+NsqEHJbv7KpqwgaEi+i+CQdBHZVzt6ed89UoP9D
	e9ytboSINW0gpLkoq9WYaz1tRtC4e8DozZvFMnUDhd2ZRLPfJJfEC96nhlPKt02K
	vwANHw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x88bn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:39:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-771e43782aaso1889787b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756201179; x=1756805979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rJ7RQ7iMaxrweLuf0/TuG+nG9I0o3A0GkBWILSS2Jw=;
        b=thTCZSAqh9xORa3eOdyCiZGIBDlXuiNWUmRzIyS2pD0EXZ5hpbXZxzREwtpZWCijFH
         8FPgv5dd/Xe+NmZLBXu09hmrzi3WqzT+sSMi3V6U6P23+MPY+7ttAdsuEU9qsfilLBYK
         sEYiCf7kQk+Ijt8Ed1ica7vYr8O7SldzJMNSwvz+34i5v7N/Uv24w73JrNgCLt+HJ2EA
         Lw1HjVzue6VDujXFWOy4f0EjhJt6rzpYQY+YdqSaAEG3b5V565RgglFjPGeY8R3KJ3O1
         CTU2Ez8JjDnkr6kTY4MV5ZssyvFRXEs5Qp4r45yfUGJkijYpicuJj24enHUAj1pnVh7w
         bkwg==
X-Forwarded-Encrypted: i=1; AJvYcCXssANj2FnmlUcvpMpQo1XECE0qeA3ZD4OgVgQS4IX8/FOXiHoC8f/NXo06BGoChFFitH/YFNQ5mYEmf+An@vger.kernel.org
X-Gm-Message-State: AOJu0YyxGTYrd+Z70te2bbwwqLXOtJDu0UMo/lIOzdy6C5K9/4USGgjs
	k3DAleYhlvF6Os88IsGL3oBkVPyw6PoY6vpFxBaJg8Jf355WbN/hSd+jGHm4UJwryVxSt1VlZFS
	ireSOX9Ojnu4wztgb3cGeYLxErfl/sX22E0n6bqWoPee6UGKFeE8Dt2uT4wtqgMgCgJiq
X-Gm-Gg: ASbGncuttIcE8Z6Tz7gcY3P5pdNO3EZdr+77MaePs48FVTZdmAVfFYNNTv191De0ojj
	BIOto4mLNIOnj6X5+AUs49cU2qiaEomKT4KO3Oycz/fhZqqsQEmnHm610fE2HJ0gw5m1En0o0GQ
	QVkTBnjGz0CK1j8UA75knEzjYDtXk0WRAuqBrxaFj+HSX7XSQJ6o5emWTYdwai/Jdw5oPXM4v2X
	hM9pqcbsAK8AWPdwe5NJIiGxVQ6ThJF8e5f5Kh1ozdkrUIxASwo7XifNraBNjtIqq6CbjCAMRn3
	9tWMf6H11GAA3GxExuKTfv4liepfcUwokG86qhgq1cbIyqFmKu47PzVfDnfYGDaxxpOdbiEHHjS
	dkb7viVPR2hqWOLWEyA==
X-Received: by 2002:a05:6a00:391f:b0:76e:99fc:db8d with SMTP id d2e1a72fcca58-7702fa08e63mr17441225b3a.3.1756201178671;
        Tue, 26 Aug 2025 02:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpC1NlqUJbgFKkBeK5Cltifq2zeEdvWBJDY78r30KUUeQbyAMv/BePEb2dXQpg6uS1/KyxCw==
X-Received: by 2002:a05:6a00:391f:b0:76e:99fc:db8d with SMTP id d2e1a72fcca58-7702fa08e63mr17441190b3a.3.1756201178152;
        Tue, 26 Aug 2025 02:39:38 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm9889294b3a.79.2025.08.26.02.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:39:37 -0700 (PDT)
Message-ID: <a6be4d7b-d163-47df-9ab3-ca410f703555@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 17:39:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] coresight: tpda: add sysfs node to flush specific
 port
To: James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
 <3ac2954e-5663-4ea0-bc1d-a09e1992af5b@linaro.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <3ac2954e-5663-4ea0-bc1d-a09e1992af5b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DBcX3Ui2Eft_GfCvoo99bFrtqwO0zpEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX6L7kToRPs1S3
 MQkSB9t8ZbDyY12PcpeNHXWl+UNYdvMn2EMOUg8i+Cue4WoOcO/p4s8YW9vaIEDkddYIOu3NLmW
 RXj+uKy/00UK7q+19TEUe9r9VHJwAJEfmWTXIS4cOygYNL7aNSIfP1+7qkgBKbzsbu5JwoxJ/Z4
 8T7qiXi2dGK65zpI3RWMsVu/0KoV5eKDWtUMIf07pWUGUIilfVeL1Zcpr3w8lIHOOE5WGVlR3EP
 oZU1V9kgS1lRLEA3KDVY24waAHAewHXtPgcEiD4fcM++yOqSzpIEHOcaZ7LYRteWQCl675tNscg
 6rN4icI65NwdabtSB6lam/XMa2Pj4zMRn4YTJES627sbF19MKqKElfxDpeyzJkQit6eNhsn+HmP
 bqhO0eq4
X-Proofpoint-GUID: DBcX3Ui2Eft_GfCvoo99bFrtqwO0zpEJ
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ad80db cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=sjPE1cIhIzOb-vUN2KUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044



On 8/26/2025 5:27 PM, James Clark wrote:
> 
> 
> On 26/08/2025 8:01 am, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
>> for port i, forcing the data to synchronize and be transmitted to the
>> sink device.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
>>   3 files changed, 53 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> index e827396a0fa1..8803158ba42f 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -41,3 +41,10 @@ Contact:    Jinlong Mao 
>> <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
>>   Description:
>>           (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>>           Value 0 means raw channel mapping mode. Value 1 means 
>> channel pair marking mode.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/port_flush_req
>> +Date:        August 2025
>> +KernelVersion:    6.17
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the bit i to requests a flush operation of 
>> port i on the TPDA.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 9e623732d1e7..c5f169facc51 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device 
>> *dev,
>>   }
>>   static DEVICE_ATTR_RW(cmbchan_mode);
>> +static ssize_t port_flush_req_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buf)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EPERM;
>> +
>> +    val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
>> +    return sysfs_emit(buf, "%lx\n", val);
> 
> Decimal would be better for a port number that goes from 0 - 127. If you 
> really want to use hex then don't you need to prefix it with 0x? 
> Otherwise you can't tell the difference between decimal 10 and hex 10, 
> and it's not documented that it's hex either.
> 

Got it. I will fix the code here, and update the description in document.

>> +}
>> +
>> +static ssize_t port_flush_req_store(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    const char *buf,
>> +                    size_t size)
>> +{
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +
>> +    /* The valid value ranges from 0 to 127 */
>> +    if (val > 127)
>> +        return -EINVAL;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    if (!drvdata->csdev->refcnt)
>> +        return -EPERM;
>> +
>> +    if (val) {
> 
> If 0 - 127 are valid don't you want to write 0 too?

It's 1-127 here. 0 may leads to an unexpected issue here.

Thanks,
Jie

> 
>> +        CS_UNLOCK(drvdata->base);
>> +        writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
>> +        CS_LOCK(drvdata->base);
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(port_flush_req);
>> +
>>   static struct attribute *tpda_attrs[] = {
>>       &dev_attr_trig_async_enable.attr,
>>       &dev_attr_trig_flag_ts_enable.attr,
>> @@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
>>       &dev_attr_freq_ts_enable.attr,
>>       &dev_attr_global_flush_req.attr,
>>       &dev_attr_cmbchan_mode.attr,
>> +    &dev_attr_port_flush_req.attr,
>>       NULL,
>>   };
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index 00d146960d81..55a18d718357 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -10,6 +10,7 @@
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>>   #define TPDA_FPID_CR        (0x084)
>>   #define TPDA_SYNCR        (0x08C)
>> +#define TPDA_FLUSH_CR        (0x090)
>>   /* Cross trigger FREQ packets timestamp bit */
>>   #define TPDA_CR_FREQTS        BIT(2)
> 
> 


