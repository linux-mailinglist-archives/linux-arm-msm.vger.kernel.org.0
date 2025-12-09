Return-Path: <linux-arm-msm+bounces-84765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7DCAF7AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 10:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41DAB302E041
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 09:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3772F8BD0;
	Tue,  9 Dec 2025 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzIRwlS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYTDZ0kr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D732F692C
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765273272; cv=none; b=Ivvjk5Qthr2OKcWsmw679wH7DTgdbYzZv6VA6fYKkdy93An/k82R461mF9TNQsRR1OelvJbRgW9Aw2B3Scbz7YakA8pdpzH4MiSvbEbLVRg6ATp7ZcS/mzBftsEdv5N7mzu8E1sMlZxRzo+ExdvquSfsPNWaxtJYKsXfFWRR9p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765273272; c=relaxed/simple;
	bh=vooDjzGOXcmTViaosDNIYzjl2D5We3lXqgiaY4bykrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYpajIdfDV6jQ8dyidMU2aNBb2nHsGpuzXBs2pXo3NApE0Yz8HB91/kaalgxNKUQJznldJLZWpVsScMtiDIhy/KJT7p/UMWaRPELcMPW5DcF8rb0rFnFSVS5jfrVzRyRMdMZZdFYrOewFtOLkEsv7jxKCy4thY5BDWyWOzzMb8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzIRwlS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYTDZ0kr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99NCbL3474332
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 09:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHgCHfuWPopYeGXCwgPKfC+UqGowtt5n8JMAaj4HyEs=; b=fzIRwlS9phiNB4eV
	q6KZzejirvVe/a8f7v1k2HOI/LrbDGWIoHT/7+FkQAaAOdPxwIvSg/Ufe7YiFw+e
	JPVMA0NXsBd9M7k9jLgZfIxSWjE/v2ssHtgfMRIpVNLHV21EPUM4q/Oj8X5Ntdy4
	spaqMsgM5P6T69miQ/NS3hjk1qmbCLcBFTTsTOs674ogBGFB74IKAKTQ54PjYlaT
	tW67teTLLBTG99LegWTgXj5tjc9jCVoC7lk4cObwBcAlz251OymkcDrIJarLNKBz
	nPGQ3hjOz2WomhFz2rnQh7/Y0quhszm2pdYGGkCGOkd/kQfrAwzsenUAK4faRLVL
	hxeF/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axa0bsbm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 09:41:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-349aadb8ab9so5461313a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765273267; x=1765878067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QHgCHfuWPopYeGXCwgPKfC+UqGowtt5n8JMAaj4HyEs=;
        b=iYTDZ0kr6r3BthyZxaIDOEHdF038mIrKPxK5rmwz6EP7hyyQbJj10Rzf5F/nQqossb
         NGbmJJmHIXAkn6IL6lVtefcnZoZUglOf+/9Fh8WcrjCwmzpP/OGqqZXnt9F02GTC9t5P
         1aOdKoDcSD0yuin2cBTVoDClKHjKVbRCvfwzQd1jhECgicHlQmCapQ5rDZCZv6WpO/mz
         Q/Iq0w+wcQ7AGwHlMfW2horQoW2V97UARCjszqttmq2HMUzeFoOh8qnhtjfAAnqaWojO
         xxTpE79+B1te0D7onYfXu8kNHv+P5lhHYyT9wO+vxo7nUje4a/L6Y3mfElY5KvcszAWf
         d35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765273267; x=1765878067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHgCHfuWPopYeGXCwgPKfC+UqGowtt5n8JMAaj4HyEs=;
        b=TN4edh2x50tJ9ESiyF3DhNk365OFV5E+sSEt8sSljy77P8Vs0BiA6MOInzSgTnWdcf
         ckUbQnrzdXs5kK+vc+VukNp0izFPY7mT0V5MOmeLB7lNuPL2mEpvUHoe1qEOF4m8Nnam
         qqPNiBCBFK/fCo7u1KzM4t8PIsbeX+WCHBdKTDvL/RG+rNM5bqOI3ipCMdsItBKDELjb
         Yh5ymzvxlzpke8xS4KGvgjzyJKHyplQ4r2ui7G4OsB3vuyLu5oN/kTRsENJw9Ya+YmpI
         i7IHS+w7xwzkiuc8gpJLRH9KDJ3DVdGrzy2+ziOAOpLkmjRzDt1eHuvTTiDbzXx6Kzrf
         qhKg==
X-Forwarded-Encrypted: i=1; AJvYcCXzQHU1Hk8XdskTcCT8aO4C9NYsPIKUTWrtGveiur1Jnq0G4xhAtguimYmxSFu10CPcLX4Ta7XWLaKr2jz9@vger.kernel.org
X-Gm-Message-State: AOJu0YwRLYSPqFLHgHWkR6WxD3ezC4INfRMXHxVikeEQimqGD0nZO5B1
	jGqU2LLObCHo0FKC6PpsSbAhypfTjM4XD+S2QLtjhiqc5RhStYNJPF0eCSNiQRsY491l3C3t+7h
	Ehv1Y7UrAlep33kV31jNmm/9ROJCb0dbqvWSq9G40k1J5jbkODb1EayURg5Yc9uWeI0cKXi9MhS
	6H
X-Gm-Gg: ASbGncs6bp79F4MFCabm1fXs3LPSsJXh3L0BglAFJZj82EqvNAzJ4ZMiNghsEU45Vhd
	O4top+jibdCwffcaxbpnI7gmTDZCZm2+IQH8JCIrKqgmxJgGyiaNZqSSFpP4FDZUzt3nNpVOrjc
	qbnfTxsrz0GsTTLc6GsVHoHvsrjZJXP5I2NZ9nAPqwMG3jjvFpPdpL7b293mtUejU7KQe5Yed7X
	91tQ0QfNtjnV6STJVnudyYUu9bGbHPX1+9rF9iv1VSlhuXf0TNqcbcNMqDqfs+B6L11UeQ1JEQf
	KVnDdLXxH1d+kesFKeZF4aHwIKCA7jKEshGMot1kmTzkIF8oLvagXK/DLWzi90MUQLtHCRm8qor
	3RbngjG8cicK1syGCZ3F3A9kTpy3H5rau0KfEIuEcmW9A1/VQOm57bE4/3cyNQzo9kGi6eDktVj
	Y=
X-Received: by 2002:a17:90b:2f08:b0:341:8ac7:24d3 with SMTP id 98e67ed59e1d1-349a260d552mr8089860a91.34.1765273267148;
        Tue, 09 Dec 2025 01:41:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX1Z02PVPohTajH157j9ZoPx0dNewrpj5lo58JVOQf1A69hSpXpGwNY4ILmbMxvlLDuHoBPA==
X-Received: by 2002:a17:90b:2f08:b0:341:8ac7:24d3 with SMTP id 98e67ed59e1d1-349a260d552mr8089843a91.34.1765273266554;
        Tue, 09 Dec 2025 01:41:06 -0800 (PST)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a47c184bdsm821710a91.2.2025.12.09.01.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 01:41:06 -0800 (PST)
Message-ID: <d54145e1-9d86-4660-972f-46b4b063eadb@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 17:40:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>, mike.leach@linaro.org
Cc: alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
        james.clark@linaro.org, jinlong.mao@oss.qualcomm.com, leo.yan@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_jinlmao@quicinc.com,
        quic_yingdeng@quicinc.com, suzuki.poulose@arm.com,
        tingwei.zhang@oss.qualcomm.com
References: <CAJ9a7Vg9Efi-5eecfiUF82_Qq8Jg9imN5q1-VKYZoPVUxNpjhA@mail.gmail.com>
 <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251209081649.105623-1-yingchao.deng@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2OCBTYWx0ZWRfX2KE2lUDA8iGm
 y9BcROIpftZKBdocs6nH3g5sF6iZxr28Y/Uvmf2073vHAcE67klI2orbhMOyMW6k+bJoONOUO5s
 QCzfSziydhe+zx8TY2GmXJw4lQV9eAXnlzewTK0EpH6Y/rDa80G/maC8xAvTYP6uAqwdCv4ss99
 BLjoQXqyCwk4EQKE4nrNFBaqp7qQCetgKwIXMWhz5lumrLBFBYXbn+UMdigZUkLsRdUXXUc+dOJ
 oRm8jis8u2kIvJSQNU6eWCB8ONLOAaVcduFq0Rv6zb22P59M2BOD61aNYpZ43NptLnOVrHppBrz
 p/np4uR9eniKWzuA8O5RXvoUkTFbr8mGP+qNgBaO7aEdAuCa6q23VcJqm3Z9Bcmgqb+R3VlXnym
 WIfZlTWb1gMFhWYNSZ/cpiFEyr3lig==
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=6937eeb4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=blTVWHW_CT15h6qA4UAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: gQBjhmaX4WOHw_E8imy7uLXtXxfo_Xbz
X-Proofpoint-ORIG-GUID: gQBjhmaX4WOHw_E8imy7uLXtXxfo_Xbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090068



On 12/9/2025 4:16 PM, Yingchao Deng wrote:
> Hi Leo & Mike
> 
> Based on Leo’s suggestions, I created a new patch, but there are three points that do not fully align with his recommendations:
> 
>      1. The helper function for returning the register address now returns only the offset, because returning the full address would conflict with cti_write_single_reg.
>      2. For registers such as triginstatus1...3, I defined additional macros CTITRIGINSTATUS1...3. This is because CTITRIGINSTATUS + 0x4 equals CTITRIGOUTSTATUS, and to avoid conflicts with existing macros, I chose numbers starting from 0x1000 for the new definitions.
>      3. Regarding the visibility of attributes for triginstatus1...3, since coresight_cti_reg produces an anonymous variable that cannot be directly referenced, I used coresight_cti_regs_attrs[i] to obtain the attribute corresponding to triginstatus1.
> 
> I appreciate both suggestions. After reviewing them, I lean toward Mike's approach.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   .../hwtracing/coresight/coresight-cti-core.c  |  52 +++++--
>   .../hwtracing/coresight/coresight-cti-sysfs.c |  72 ++++++++--
>   drivers/hwtracing/coresight/coresight-cti.h   |   3 +-
>   drivers/hwtracing/coresight/qcom-cti.h        | 136 ++++++++++++++++++
>   4 files changed, 238 insertions(+), 25 deletions(-)
>   create mode 100644 drivers/hwtracing/coresight/qcom-cti.h
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
> index f9970e40dd59..d2b0b46f2846 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-core.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-core.c
> @@ -21,7 +21,7 @@
> 
>   #include "coresight-priv.h"
>   #include "coresight-cti.h"
> -
> +#include "qcom-cti.h"
>   /*
>    * CTI devices can be associated with a PE, or be connected to CoreSight
>    * hardware. We have a list of all CTIs irrespective of CPU bound or
> @@ -70,15 +70,16 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
> 
>       /* write the CTI trigger registers */
>       for (i = 0; i < config->nr_trig_max; i++) {
> -        writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
> +        writel_relaxed(config->ctiinen[i],
> +                drvdata->base + cti_reg_addr_with_nr(drvdata, CTIINEN(0), i));
>           writel_relaxed(config->ctiouten[i],
> -                   drvdata->base + CTIOUTEN(i));
> +                drvdata->base + cti_reg_addr_with_nr(drvdata, CTIOUTEN(0), i));
>       }
> 
>       /* other regs */
> -    writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
> -    writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
> -    writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
> +    writel_relaxed(config->ctigate, drvdata->base + cti_reg_addr(drvdata, CTIGATE));
> +    writel_relaxed(config->asicctl, drvdata->base + cti_reg_addr(drvdata, ASICCTL));
> +    writel_relaxed(config->ctiappset, drvdata->base + cti_reg_addr(drvdata, CTIAPPSET));
> 
>       /* re-enable CTI */
>       writel_relaxed(1, drvdata->base + CTICONTROL);
> @@ -201,7 +202,7 @@ void cti_write_intack(struct device *dev, u32 ackval)
>       raw_spin_lock(&drvdata->spinlock);
>       /* write if enabled */
>       if (cti_active(config))
> -        cti_write_single_reg(drvdata, CTIINTACK, ackval);
> +        cti_write_single_reg(drvdata, cti_reg_addr(drvdata, CTIINTACK), ackval);
>       raw_spin_unlock(&drvdata->spinlock);
>   }
> 
> @@ -214,6 +215,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
>   /* DEVID[19:16] - number of CTM channels */
>   #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
> 
> +/* DEVARCH[31:21] - ARCHITECT */
> +#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
> +
>   static int cti_set_default_config(struct device *dev,
>                     struct cti_drvdata *drvdata)
>   {
> @@ -394,9 +398,8 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
> 
>       /* update the local register values */
>       chan_bitmask = BIT(channel_idx);
> -    reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
> -              CTIOUTEN(trigger_idx));
> -
> +    reg_offset = (direction == CTI_TRIG_IN ? cti_reg_addr_with_nr(drvdata, CTIINEN(0), trigger_idx):
> +                         cti_reg_addr_with_nr(drvdata, CTIOUTEN(0), trigger_idx));
>       raw_spin_lock(&drvdata->spinlock);
> 
>       /* read - modify write - the trigger / channel enable value */
> @@ -452,7 +455,7 @@ int cti_channel_gate_op(struct device *dev, enum cti_chan_gate_op op,
>       if (err == 0) {
>           config->ctigate = reg_value;
>           if (cti_active(config))
> -            cti_write_single_reg(drvdata, CTIGATE, reg_value);
> +            cti_write_single_reg(drvdata, cti_reg_addr(drvdata, CTIGATE), reg_value);
>       }
>       raw_spin_unlock(&drvdata->spinlock);
>       return err;
> @@ -479,19 +482,19 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
>       case CTI_CHAN_SET:
>           config->ctiappset |= chan_bitmask;
>           reg_value  = config->ctiappset;
> -        reg_offset = CTIAPPSET;
> +        reg_offset = cti_reg_addr(drvdata, CTIAPPSET);
>           break;
> 
>       case CTI_CHAN_CLR:
>           config->ctiappset &= ~chan_bitmask;
>           reg_value = chan_bitmask;
> -        reg_offset = CTIAPPCLEAR;
> +        reg_offset = cti_reg_addr(drvdata, CTIAPPCLEAR);
>           break;
> 
>       case CTI_CHAN_PULSE:
>           config->ctiappset &= ~chan_bitmask;
>           reg_value = chan_bitmask;
> -        reg_offset = CTIAPPPULSE;
> +        reg_offset = cti_reg_addr(drvdata, CTIAPPPULSE);
>           break;
> 
>       default:
> @@ -895,6 +898,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>       struct coresight_desc cti_desc;
>       struct coresight_platform_data *pdata = NULL;
>       struct resource *res = &adev->res;
> +    u32 devarch;
> 
>       /* driver data*/
>       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -981,9 +985,27 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
>       drvdata->csdev_release = drvdata->csdev->dev.release;
>       drvdata->csdev->dev.release = cti_device_release;
> 
> +    /* check architect value*/
> +    devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
> +    if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
> +        drvdata->is_qcom_cti = 1;
> +
> +        /*
> +         * QCOM CTI does not implement Claimtag functionality as
> +         * per CoreSight specification, but its CLAIMSET register
> +         * is incorrectly initialized to 0xF. This can mislead
> +         * tools or drivers into thinking the component is claimed.
> +         *
> +         * Reset CLAIMSET to 0 to reflect that no claims are active.
> +         */
> +        drvdata->csdev->claim_tag_info = CS_CLAIM_TAG_NOT_IMPL;
> +        //writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
> +    }
> +
>       /* all done - dec pm refcount */
>       pm_runtime_put(&adev->dev);
> -    dev_info(&drvdata->csdev->dev, "CTI initialized\n");
> +    dev_info(&drvdata->csdev->dev, "%s CTI initialized\n",
> +                    drvdata->is_qcom_cti ? "QCOM" : "");
>       return 0;
> 
>   pm_release:
> diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> index a9df77215141..5d23a138b4a7 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
> @@ -13,7 +13,7 @@
>   #include <linux/sysfs.h>
> 
>   #include "coresight-cti.h"
> -
> +#include "qcom-cti.h"
>   /*
>    * Declare the number of static declared attribute groups
>    * Value includes groups + NULL value at end of table.
> @@ -183,7 +183,7 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
>       pm_runtime_get_sync(dev->parent);
>       raw_spin_lock(&drvdata->spinlock);
>       if (drvdata->config.hw_powered)
> -        val = readl_relaxed(drvdata->base + cti_attr->off);
> +        val = readl_relaxed(drvdata->base + cti_reg_addr(drvdata, cti_attr->off));
>       raw_spin_unlock(&drvdata->spinlock);
>       pm_runtime_put_sync(dev->parent);
>       return sysfs_emit(buf, "0x%x\n", val);
> @@ -204,7 +204,7 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
>       pm_runtime_get_sync(dev->parent);
>       raw_spin_lock(&drvdata->spinlock);
>       if (drvdata->config.hw_powered)
> -        cti_write_single_reg(drvdata, cti_attr->off, val);
> +        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, cti_attr->off), val);
>       raw_spin_unlock(&drvdata->spinlock);
>       pm_runtime_put_sync(dev->parent);
>       return size;
> @@ -267,7 +267,7 @@ static ssize_t cti_reg32_show(struct device *dev, char *buf,
>       raw_spin_lock(&drvdata->spinlock);
>       if ((reg_offset >= 0) && cti_active(config)) {
>           CS_UNLOCK(drvdata->base);
> -        val = readl_relaxed(drvdata->base + reg_offset);
> +        val = readl_relaxed(drvdata->base + cti_reg_addr(drvdata, reg_offset));
>           if (pcached_val)
>               *pcached_val = val;
>           CS_LOCK(drvdata->base);
> @@ -300,7 +300,7 @@ static ssize_t cti_reg32_store(struct device *dev, const char *buf,
> 
>       /* write through if offset and enabled */
>       if ((reg_offset >= 0) && cti_active(config))
> -        cti_write_single_reg(drvdata, reg_offset, val);
> +        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, reg_offset), val);
>       raw_spin_unlock(&drvdata->spinlock);
>       return size;
>   }
> @@ -389,7 +389,7 @@ static ssize_t inen_store(struct device *dev,
> 
>       /* write through if enabled */
>       if (cti_active(config))
> -        cti_write_single_reg(drvdata, CTIINEN(index), val);
> +        cti_write_single_reg(drvdata, cti_reg_addr_with_nr(drvdata, CTIINEN(0), index), val);
>       raw_spin_unlock(&drvdata->spinlock);
>       return size;
>   }
> @@ -428,7 +428,7 @@ static ssize_t outen_store(struct device *dev,
> 
>       /* write through if enabled */
>       if (cti_active(config))
> -        cti_write_single_reg(drvdata, CTIOUTEN(index), val);
> +        cti_write_single_reg(drvdata, cti_reg_addr_with_nr(drvdata, CTIOUTEN(0), index), val);
>       raw_spin_unlock(&drvdata->spinlock);
>       return size;
>   }
> @@ -470,7 +470,7 @@ static ssize_t appclear_store(struct device *dev,
> 
>       /* write through if enabled */
>       if (cti_active(config))
> -        cti_write_single_reg(drvdata, CTIAPPCLEAR, val);
> +        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, CTIAPPCLEAR), val);
>       raw_spin_unlock(&drvdata->spinlock);
>       return size;
>   }
> @@ -491,7 +491,7 @@ static ssize_t apppulse_store(struct device *dev,
> 
>       /* write through if enabled */
>       if (cti_active(config))
> -        cti_write_single_reg(drvdata, CTIAPPPULSE, val);
> +        cti_write_single_reg(drvdata,  cti_reg_addr(drvdata, CTIAPPPULSE), val);
>       raw_spin_unlock(&drvdata->spinlock);
>       return size;
>   }
> @@ -513,18 +513,36 @@ static struct attribute *coresight_cti_regs_attrs[] = {
>       &dev_attr_appclear.attr,
>       &dev_attr_apppulse.attr,
>       coresight_cti_reg(triginstatus, CTITRIGINSTATUS),
> +    coresight_cti_reg(triginstatus1, CTITRIGINSTATUS1),
> +    coresight_cti_reg(triginstatus2, CTITRIGINSTATUS2),
> +    coresight_cti_reg(triginstatus3, CTITRIGINSTATUS3),
>       coresight_cti_reg(trigoutstatus, CTITRIGOUTSTATUS),
> +    coresight_cti_reg(trigoutstatus1, CTITRIGOUTSTATUS1),
> +    coresight_cti_reg(trigoutstatus2, CTITRIGOUTSTATUS2),
> +    coresight_cti_reg(trigoutstatus3, CTITRIGOUTSTATUS3),
>       coresight_cti_reg(chinstatus, CTICHINSTATUS),
>       coresight_cti_reg(choutstatus, CTICHOUTSTATUS),
>   #ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
>       coresight_cti_reg_rw(itctrl, CORESIGHT_ITCTRL),
>       coresight_cti_reg(ittrigin, ITTRIGIN),
> +    coresight_cti_reg(ittrigin1, ITTRIGIN1),
> +    coresight_cti_reg(ittrigin2, ITTRIGIN2),
> +    coresight_cti_reg(ittrigin3, ITTRIGIN3),
>       coresight_cti_reg(itchin, ITCHIN),
>       coresight_cti_reg_rw(ittrigout, ITTRIGOUT),
> +    coresight_cti_reg_rw(ittrigout1, ITTRIGOUT1),
> +    coresight_cti_reg_rw(ittrigout2, ITTRIGOUT2),
> +    coresight_cti_reg_rw(ittrigout3, ITTRIGOUT3),
>       coresight_cti_reg_rw(itchout, ITCHOUT),
>       coresight_cti_reg(itchoutack, ITCHOUTACK),
>       coresight_cti_reg(ittrigoutack, ITTRIGOUTACK),
> +    coresight_cti_reg(ittrigoutack1, ITTRIGOUTACK1),
> +    coresight_cti_reg(ittrigoutack2, ITTRIGOUTACK2),
> +    coresight_cti_reg(ittrigoutack3, ITTRIGOUTACK3),
>       coresight_cti_reg_wo(ittriginack, ITTRIGINACK),
> +    coresight_cti_reg_wo(ittriginack1, ITTRIGINACK1),
> +    coresight_cti_reg_wo(ittriginack2, ITTRIGINACK2),
> +    coresight_cti_reg_wo(ittriginack3, ITTRIGINACK3),
>       coresight_cti_reg_wo(itchinack, ITCHINACK),
>   #endif
>       NULL,
> @@ -1153,6 +1171,41 @@ int cti_create_cons_sysfs(struct device *dev, struct cti_drvdata *drvdata)
>       return err;
>   }
> 
> +  static umode_t coresight_cti_regs_is_visible(struct kobject *kobj,
> +                  struct attribute *attr, int n)
> +  {
> +    struct device *dev = container_of(kobj, struct device, kobj);
> +    struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +    /* Mute QCOM CTI registers for standard CTI module */
> +    if (!drvdata->is_qcom_cti) {
> +        if (attr == coresight_cti_regs_attrs[10]
> +         || attr == coresight_cti_regs_attrs[11]
> +         || attr == coresight_cti_regs_attrs[12]
> +         || attr == coresight_cti_regs_attrs[14]
> +         || attr == coresight_cti_regs_attrs[15]
> +         || attr == coresight_cti_regs_attrs[16]
> +#ifdef CONFIG_CORESIGHT_CTI_INTEGRATION_REGS
> +         || attr == coresight_cti_regs_attrs[21]
> +         || attr == coresight_cti_regs_attrs[22]
> +         || attr == coresight_cti_regs_attrs[23]
> +         || attr == coresight_cti_regs_attrs[26]
> +         || attr == coresight_cti_regs_attrs[27]
> +         || attr == coresight_cti_regs_attrs[28]
> +         || attr == coresight_cti_regs_attrs[32]
> +         || attr == coresight_cti_regs_attrs[33]
> +         || attr == coresight_cti_regs_attrs[34]
> +         || attr == coresight_cti_regs_attrs[36]
> +         || attr == coresight_cti_regs_attrs[37]
> +         || attr == coresight_cti_regs_attrs[38]
> +#endif
> +         )
> +                  return 0;
> +          }
> +
> +          return attr->mode;
> +  }
> +
>   /* attribute and group sysfs tables. */
>   static const struct attribute_group coresight_cti_group = {
>       .attrs = coresight_cti_attrs,
> @@ -1166,6 +1219,7 @@ static const struct attribute_group coresight_cti_mgmt_group = {
>   static const struct attribute_group coresight_cti_regs_group = {
>       .attrs = coresight_cti_regs_attrs,
>       .name = "regs",
> +    .is_visible = coresight_cti_regs_is_visible,
>   };
> 
>   static const struct attribute_group coresight_cti_channels_group = {
> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index e7b88b07cffe..413d5ef483e8 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -57,7 +57,7 @@ struct fwnode_handle;
>    * Max of in and out defined in the DEVID register.
>    * - pick up actual number used from .dts parameters if present.
>    */
> -#define CTIINOUTEN_MAX        32
> +#define CTIINOUTEN_MAX        128
> 
>   /**
>    * Group of related trigger signals
> @@ -181,6 +181,7 @@ struct cti_drvdata {
>       struct cti_config config;
>       struct list_head node;
>       void (*csdev_release)(struct device *dev);
> +    bool is_qcom_cti;
>   };
> 
>   /*
> diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
> new file mode 100644
> index 000000000000..aa41f9425b36
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/qcom-cti.h
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include "coresight-cti.h"
> +
> +#define ARCHITECT_QCOM 0x477
> +
> +#define CTITRIGINSTATUS1 0x1000
> +#define CTITRIGINSTATUS2 0x1001
> +#define CTITRIGINSTATUS3 0x1002
> +
> +#define CTITRIGOUTSTATUS1 0x1003
> +#define CTITRIGOUTSTATUS2 0x1004
> +#define CTITRIGOUTSTATUS3 0x1005
> +
> +#define ITTRIGIN1 0x1006
> +#define ITTRIGIN2 0x1007
> +#define ITTRIGIN3 0x1008
> +
> +#define ITTRIGOUT1 0x1009
> +#define ITTRIGOUT2 0x100A
> +#define ITTRIGOUT3 0x100B
> +
> +#define ITTRIGINACK1 0x100C
> +#define ITTRIGINACK2 0x100D
> +#define ITTRIGINACK3 0x100E
> +
> +#define ITTRIGOUTACK1 0x100F
> +#define ITTRIGOUTACK2 0x1010
> +#define ITTRIGOUTACK3 0x1011
> +/* CTI programming registers */
> +#define    QCOM_CTIINTACK        0x020
> +#define    QCOM_CTIAPPSET        0x004
> +#define    QCOM_CTIAPPCLEAR    0x008
> +#define    QCOM_CTIAPPPULSE    0x00C
> +#define    QCOM_CTIINEN        0x400
> +#define    QCOM_CTIOUTEN        0x800
> +#define    QCOM_CTITRIGINSTATUS    0x040
> +#define    QCOM_CTITRIGINSTATUS1    0x044
> +#define    QCOM_CTITRIGINSTATUS2    0x048
> +#define    QCOM_CTITRIGINSTATUS3    0x04C
> +#define    QCOM_CTITRIGOUTSTATUS    0x060
> +#define    QCOM_CTITRIGOUTSTATUS1    0x064
> +#define    QCOM_CTITRIGOUTSTATUS2    0x068
> +#define    QCOM_CTITRIGOUTSTATUS3    0x06C
> +#define    QCOM_CTICHINSTATUS    0x080
> +#define    QCOM_CTICHOUTSTATUS    0x084
> +#define    QCOM_CTIGATE        0x088
> +#define    QCOM_ASICCTL        0x08c
> +/* Integration test registers */
> +#define    QCOM_ITCHINACK        0xE70
> +#define    QCOM_ITTRIGINACK    0xE80
> +#define    QCOM_ITTRIGINACK1    0xE84
> +#define    QCOM_ITTRIGINACK2    0xE88
> +#define    QCOM_ITTRIGINACK3    0xE8C
> +#define    QCOM_ITCHOUT        0xE74
> +#define    QCOM_ITTRIGOUT        0xEA0
> +#define    QCOM_ITTRIGOUT1        0xEA4
> +#define    QCOM_ITTRIGOUT2        0xEA8
> +#define    QCOM_ITTRIGOUT3        0xEAC
> +#define    QCOM_ITCHOUTACK        0xE78
> +#define    QCOM_ITTRIGOUTACK    0xEC0
> +#define    QCOM_ITTRIGOUTACK1    0xEC4
> +#define    QCOM_ITTRIGOUTACK2    0xEC8
> +#define    QCOM_ITTRIGOUTACK3    0xECC
> +#define    QCOM_ITCHIN        0xE7C
> +#define    QCOM_ITTRIGIN        0xEE0
> +#define    QCOM_ITTRIGIN1        0xEE4
> +#define    QCOM_ITTRIGIN2        0xEE8
> +#define    QCOM_ITTRIGIN3        0xEEC
> +
> +static noinline u32 cti_qcom_reg_off(u32 offset)
> +{
> +    switch (offset) {
> +        case CTIINTACK:        return QCOM_CTIINTACK;
> +        case CTIAPPSET:        return QCOM_CTIAPPSET;
> +        case CTIAPPCLEAR:    return QCOM_CTIAPPCLEAR;
> +        case CTIAPPPULSE:    return QCOM_CTIAPPPULSE;
> +        case CTIINEN(0):    return QCOM_CTIINEN;
> +        case CTIOUTEN(0):    return QCOM_CTIOUTEN;
> +        case CTITRIGINSTATUS:    return QCOM_CTITRIGINSTATUS;
> +        case CTITRIGINSTATUS1:    return QCOM_CTITRIGINSTATUS1;
> +        case CTITRIGINSTATUS2:    return QCOM_CTITRIGINSTATUS2;
> +        case CTITRIGINSTATUS3:    return QCOM_CTITRIGINSTATUS3;
> +        case CTITRIGOUTSTATUS:    return QCOM_CTITRIGOUTSTATUS;
> +        case CTITRIGOUTSTATUS1:    return QCOM_CTITRIGOUTSTATUS1;
> +        case CTITRIGOUTSTATUS2:    return QCOM_CTITRIGOUTSTATUS2;
> +        case CTITRIGOUTSTATUS3:    return QCOM_CTITRIGOUTSTATUS3;
> +        case CTICHINSTATUS:        return QCOM_CTICHINSTATUS;
> +        case CTICHOUTSTATUS:    return QCOM_CTICHOUTSTATUS;
> +        case CTIGATE:        return QCOM_CTIGATE;
> +        case ASICCTL:        return QCOM_ASICCTL;
> +        case ITCHINACK:        return QCOM_ITCHINACK;
> +        case ITTRIGINACK:    return QCOM_ITTRIGINACK;
> +        case ITTRIGINACK1:    return QCOM_ITTRIGINACK1;
> +        case ITTRIGINACK2:    return QCOM_ITTRIGINACK2;
> +        case ITTRIGINACK3:    return QCOM_ITTRIGINACK3;
> +        case ITCHOUT:        return QCOM_ITCHOUT;
> +        case ITTRIGOUT:        return QCOM_ITTRIGOUT;
> +        case ITTRIGOUT1:    return QCOM_ITTRIGOUT1;
> +        case ITTRIGOUT2:    return QCOM_ITTRIGOUT2;
> +        case ITTRIGOUT3:    return QCOM_ITTRIGOUT3;
> +        case ITCHOUTACK:    return QCOM_ITCHOUTACK;
> +        case ITTRIGOUTACK:    return QCOM_ITTRIGOUTACK;
> +        case ITTRIGOUTACK1:    return QCOM_ITTRIGOUTACK1;
> +        case ITTRIGOUTACK2:    return QCOM_ITTRIGOUTACK2;
> +        case ITTRIGOUTACK3:    return QCOM_ITTRIGOUTACK3;
> +        case ITCHIN:               return QCOM_ITCHIN;
> +        case ITTRIGIN:            return QCOM_ITTRIGIN;
> +        case ITTRIGIN1:        return QCOM_ITTRIGIN1;
> +        case ITTRIGIN2:        return QCOM_ITTRIGIN2;
> +        case ITTRIGIN3:        return QCOM_ITTRIGIN3;
> +        default:
> +                    WARN(1, "Unknown offset=%u\n", offset);
> +                    return 0;
> +    }
> +
> +    return 0;
> +}
> +
> +static u32 cti_reg_addr_with_nr(struct cti_drvdata *drvdata,
> +                                          u32 reg, u32 nr)
> +{
> +    /* convert to qcom specific offset */
> +    if (unlikely(drvdata->is_qcom_cti))

Hi yingchao,

For standard ARM cti, it's unlikely to true, but for qcom_cti, it's 
likely to true, so I think the compile predication here is not mandatory?

Thanks,
Jie

> +        reg = cti_qcom_reg_off(reg);
> +
> +    return reg + sizeof(u32) * nr;
> +}
> +
> +static u32 cti_reg_addr(struct cti_drvdata *drvdata, u32 reg)
> +{
> +        return cti_reg_addr_with_nr(drvdata, reg, 0);
> +}
> +
> 
> 


