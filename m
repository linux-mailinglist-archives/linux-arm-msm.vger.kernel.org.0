Return-Path: <linux-arm-msm+bounces-66176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D3B0E9F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47CFE4E04A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 05:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09247242D66;
	Wed, 23 Jul 2025 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkUr10Rw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6858E21ABAD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 05:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753247411; cv=none; b=mOaogxv00NcsDo9NqpQv/PORr5qL+ZsLPJbDu8e1VG1EnEj8oI1XqFqL3yP3WY705e5idilSW8RBTZ5y2mmAEHZeXs0QhyTUb1Tk0cDcIl7iwGpnSVLwquwzDuBOQursBQFLX/8pdf3vMFj2Ls+ABsi5h+pPNk/yqoFybvlptdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753247411; c=relaxed/simple;
	bh=yxfvD+KWlF+2IZ8PhQE8OyGKC4+cYXwHtloQmA4xTTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZU2pGnID0ib0UgU3Fzo6wfmOmQQ2+gtEMI3HZdsJVwuJhx3ej1mI3Ad0UkCJc/Lsvzn0ExbIBbbB5/+v9AGk+2X6Tk5blW4OYA5FTS+qEYRuvz+gPbG72ftR15SG6m41tnKljc7nYJA/bAI9UMz5i76DSe0ZCSA57+Q4eXIQHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkUr10Rw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMNv4O019487
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 05:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yi0z3sLXRaxmxpY7Kis69SNdsBbMhtzvqAojxUzh/uk=; b=KkUr10RwMF1rqWEN
	Lbz3IxId/QV35PzVEh25FsK7+ZO6s4c2z6LtvuSJhqQ0YaBc/8kXvXptzlcf0Q/L
	PEIPmwbU9A2QbVvzj+ZXGr9IJ0GeINPRoDSJx5gpMewekr9vP8GF5oejbLz9uiGf
	NSKCljJbmJlO+yI3AP72dykJWyDYce3p9Z+HgE8FhZrZmwZUZbOWq15lbHynzfrX
	f1tohXW2IvwZ157HzI76XMRX/IyeDNmEMY0FjfWU+7bterSWsVmnyoeFqBj61GJy
	mi0YrYF8huG6Al+8l4Pm9W0eFF9c3PsTiawaX8hMgrK+R68MHgC5HWpkdsbgJ9lG
	Q3pXcg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6p3k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 05:10:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso9532613b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 22:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753247407; x=1753852207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yi0z3sLXRaxmxpY7Kis69SNdsBbMhtzvqAojxUzh/uk=;
        b=i5br7BtQAKlTmB4P5l2MGpJCgKCCXl5qbwdqkokhFZ3BFZrZypjhJND3rQq2pMspdr
         OL19KEtX+Zaxlh3BpmH/6mlHBztQSu9A5rNoOznNgQiNqmeGaxk7lHAAfB5QqTkAL7xF
         57p2Azq3EeHmVrrm6dRm1OCS3D0QHak5R7RatbJTLWMfuaucXArY2djgbKQn4Yj/0lAc
         GoRjI7jJi3B7oDrMsimiSVlgom1DvDIr6RERvgXVPTjRtjPXyC78KFwYkS4tJx6b1Q4R
         EjevNwybqNGYzgKx4OgaMlj4uA2hW8GMUHpY1GbNnm10J/WgiaU1h3Qh3eJk9Ik6gzeO
         4iQg==
X-Forwarded-Encrypted: i=1; AJvYcCVqu+Gisn86LZ7cdmUj7lNQS5+VspuVSJQ7eHavVGZ1qo4773AnI+mZvxBJ7hNTedrQqLWdVr79QPUeBRu1@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGzpwf7kETETEhVfXo/A6GCQz2sM3V/G594ZlwQniR/mKa++D
	jNUlc9EqxrhY2zUN76GriYjOrwJkfcDAgLMvHHH2HSqJtCBXM5PxicmRT8MV37klSp2n6qgWZF6
	3SpwhrivZ0DcAqAb3jm52hNmsCstU3lAdBh8s9PwtQdFXTV7LOzx0IzjJ8fhyMV9Ap/Fs
X-Gm-Gg: ASbGncuU+mX1srb1JVBNikdiIX08JwTma7BuaoBctIaru49AM+jlUQNZwt87qmMCsEB
	jOy8WPSM3Ca6MRGS4OSL3rlusdsGuknf/6OOTjH/7nH38Gp8NIcquTT7EjePAvw1r7ekR0zanEo
	kLdWHc4JK6LXILJlvQsRZKJgWO9tKsBem2jTTZnbSUVicnyGy7PtuL/avwZr7RY1L9lq9VLZ/if
	fISG+YzyZuaggwW0VsBpLLkIsEBQ5bMQgcCQS9U0dJBo1CLjsKrahXORvo3ra5GBDbefSKbeH2H
	enMSNSD7gkvRnV6zXKVnf/xLABYcJDAvg0g1XzXxl/r6hMHYJ4mrsZazOxIcPNdqMU64iSO6D8M
	ofyzploslg8/tXB/ynh0WYVE=
X-Received: by 2002:a05:6a21:1fc7:b0:232:57c8:1bf4 with SMTP id adf61e73a8af0-23d48fe0711mr2218927637.9.1753247407571;
        Tue, 22 Jul 2025 22:10:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSzdu3XTzGZRuyXiNJVAUhtDAMRYXv0zE8ykPNMcULJMV8cEoBw/XVyfdTRcS32Pcplllgrw==
X-Received: by 2002:a05:6a21:1fc7:b0:232:57c8:1bf4 with SMTP id adf61e73a8af0-23d48fe0711mr2218887637.9.1753247407159;
        Tue, 22 Jul 2025 22:10:07 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe67f96sm8032266a12.13.2025.07.22.22.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 22:10:06 -0700 (PDT)
Message-ID: <838c6cda-6128-4fd5-a541-d71caee6c107@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 13:10:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 08/10] coresight: tmc: add a switch buffer
 function for byte-cntr
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
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
        Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
 <20250714063109.591-9-jie.gan@oss.qualcomm.com>
 <CAJ9a7VhLXrdP_CPQPgAYTAGWJfsVUa9SG9Bzv9dLtFzR4nFROg@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VhLXrdP_CPQPgAYTAGWJfsVUa9SG9Bzv9dLtFzR4nFROg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=68806eb0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RYLkNb92mBiLz5sOdEcA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: mFKw0AiVXQhr-OzkuvPQMEiPMjhhPdYA
X-Proofpoint-GUID: mFKw0AiVXQhr-OzkuvPQMEiPMjhhPdYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA0MCBTYWx0ZWRfXzalWdlvc1d6W
 7o0AuTZIP4awbJEeFx9weELZTorkGZRczgStS7zxQSdgsqa5XAz6b6fYAZJep7IcqjwnzMvCgl5
 l8NBS7UPkYFrsC+cvMhZgzr9coR/oEfjLQ4evEtJOKfRif7DuyXJXZ25MQoLWgAhfIwKs3H2ct2
 t+YsvNUJSydmha1u6UpUyeyqESa3/9ojcC+Kr+13wm8fe9Esoxd98ehY9LFKIC7eAq7EAUMcyR2
 3hlhf8LvOzV0FgxE2RzllfK5Hfs0nf9+Vg+QeZSpHseycVsi8Gdyebfs2nIY8CQX11/Llz8j/aJ
 rzBG21RgY2lJtANmTh5i5jq38H14hM05SoWFZ2ksaMUm9IKJq1zBneXWs/JlZ82J0rEQE2AH+wx
 cdddYy4Dg5OLuFJF+ksSpZFBL0fk3fhC2pEppv+hfbbdIb640TF6ZIDz9GpodwzCsPv+DH3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230040



On 7/22/2025 10:09 PM, Mike Leach wrote:
> Hi,
> 
> This buffer swap code looks OK in principle. The ETR is stopped,
> memory synced and set to be read.
> See other comments inline.
> 
> On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Switching the sysfs_buf when current buffer is full or the timeout is
>> triggered and resets rrp and rwp registers after switched the buffer.
>> Disable the ETR device if it cannot find an available buffer to switch.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 2b73bd8074bb..3e3e1b5e78ca 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1287,6 +1287,58 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>          return ret ? ERR_PTR(ret) : drvdata->sysfs_buf;
>>   }
>>
>> +static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
>> +                                       struct ctcu_byte_cntr *byte_cntr_data)
>> +{
> 
> This entire function should be in one of the byte_cntr source files,
> not in the main etr files. Please keep byte cntr code separate as far
> as possible
> 
>> +       struct etr_buf_node *nd, *next, *curr_node, *picked_node;
>> +       struct etr_buf *curr_buf = drvdata->sysfs_buf;
>> +       bool found_free_buf = false;
>> +
>> +       if (WARN_ON(!drvdata || !byte_cntr_data))
>> +               return found_free_buf;
>> +
>> +       /* Stop the ETR before we start the switching process */
>> +       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
> 
> Can this function be called if the mode is not CS_MODE_SYSFS?
> 
>> +               __tmc_etr_disable_hw(drvdata);

Hi Mike,

Since I need move the whole function to byte-cntr source file, is that 
acceptable to export __tmc_etr_disable_hw from tmc-etr?

Same with __tmc_etr_enable_hw.

Thanks,
Jie

>> +
>> +       list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
>> +               /* curr_buf is free for next round */
>> +               if (nd->sysfs_buf == curr_buf) {
>> +                       nd->is_free = true;
>> +                       curr_node = nd;
>> +               }
>> +
>> +               if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {
>> +                       if (nd->reading)
>> +                               continue;
>> +
>> +                       picked_node = nd;
>> +                       found_free_buf = true;
>> +               }
>> +       }
>> +
>> +       if (found_free_buf) {
>> +               curr_node->reading = true;
>> +               curr_node->pos = 0;
>> +               drvdata->reading_node = curr_node;
>> +               drvdata->sysfs_buf = picked_node->sysfs_buf;
>> +               drvdata->etr_buf = picked_node->sysfs_buf;
>> +               picked_node->is_free = false;
>> +               /* Reset irq_cnt for next etr_buf */
>> +               atomic_set(&byte_cntr_data->irq_cnt, 0);
>> +               /* Reset rrp and rwp when the system has switched the buffer*/
>> +               CS_UNLOCK(drvdata->base);
>> +               tmc_write_rrp(drvdata, 0);
>> +               tmc_write_rwp(drvdata, 0);
> 
> This cannot possibly be correct. RWP / RRP are pointers into the
> system memory where the ETR stores data.
> 
>> +               CS_LOCK(drvdata->base);
>> +               /* Restart the ETR when we find a free buffer */
>> +               if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
>> +                       __tmc_etr_enable_hw(drvdata);
> 
> What happens if the ETR is not restarted? Using __tmc_etr_disable_hw()
> is correct for this use case, but if you do not restart then the extra
> shutdown that would ordinarily happen in tmc_etr_disable_hw() does not
> occur. How is this handled in the rest of the update?
> 
>> +       }
>> +
>> +       return found_free_buf;
>> +}
>> +
>>   static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>>   {
>>          int ret = 0;
>> --
>> 2.34.1
>>
> 
> Regards
> 
> Mike
> 
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK


