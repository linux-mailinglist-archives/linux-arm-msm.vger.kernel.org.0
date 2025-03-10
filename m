Return-Path: <linux-arm-msm+bounces-50867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D11A59FD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 18:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C8253AACBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 17:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD91F223702;
	Mon, 10 Mar 2025 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ql0wvn0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331B22253FE
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 17:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741628601; cv=none; b=gHg+uFtQ5Lf5FPHD/pPEMrgqjzj9Q9bLM6rosKYq5lwEda91ETQOxjmihQF7dPh/ItLGfArcCO37e01CifXND668X1kiymszxwEQl38XiHlfPFkYwu8o7BGjBleCibxr4r2NkCZm6FF89P7VsGLGVD96J7A/PblFrSRzbK4sHeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741628601; c=relaxed/simple;
	bh=cB8pswrYyE2LYANxEdFIleLyRXmPMV3MtZQNDyvR0Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drfTfxTo5fvrV3NiJwptJ8IT3X9KJN6WVgtppytXEaECGkBx9hkL5q9FBFP2fLjdD/4racOP3rIvIa3pke4tL/+BWbAF0Sd6QJCw4wSfIHGX4C5IGILPTNCVXYMGwbUv25bqWx9hB1DxiYcgq8S8tm7+kvrYn78w+ckhHh+2ZDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ql0wvn0j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AAPqq5010043
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 17:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o4LclDHorCJURc3TarmwS3fQFDxMEl4ZP6Fc0OfzUGg=; b=Ql0wvn0jXLRmfmff
	Pl4De6r1IfkFfyg+55TeBIZAdmkyYyuyTOf4txe65DZBVxMkbnJ1QywojtSG4Hw/
	B7Y1vTZQCY5xRFTDV9TDJP9SjTkHUyjk+dSmJhdOcTU67bRrYw8pe9J20q30V46L
	jju7oCEhzezP+/VvDRelyxymvt1lAKjeYUvF39YuXBCWLv0ezC1JesxFd8uoJ1e2
	BRAQGNtrTOK3fFFXGrRpeGy77UAtZ/MhPSyZ+n4ROgtFpIhFdBoUd8lyw0rSU/Ma
	nosghQk2ZBhRi62GAoonnu7ETC9blYcYYFm2oYaXt5xVFo44en+WL2ZH6ma/cOMB
	JgcBiQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewpnq7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 17:43:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240a96112fso141955385ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 10:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741628598; x=1742233398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4LclDHorCJURc3TarmwS3fQFDxMEl4ZP6Fc0OfzUGg=;
        b=Zv62BrG2TQwcv9aBZhEcCAHmXWDpo3M3ylWrqFjL3/czRDLDvs1h317WUSkNNCNWzD
         RfEkaF2Mh3rZHPbG18d984WgMn9MbJgNamWqSoqMKVeiclK4Z153me9dn9FMp/bsQ3Gg
         aqsUtWtrcfFqn9dDHsdvWfGylflrB5fTvVFKSPnMvEHxC/cjpOq44rYblmwBFYC0uC78
         sjXr+3A7DH5tdypjd7xeWG3+mxfiJpTnx3KVPhZb7kKARUyGrtr4K6Nhl4yCKSXV3aVx
         PpLIgTyVkAXolnoSLOpqEvIrWySdTmTuVAe+SJdalDYMPN3PaacbZ9xw7lkhYFkIYL0p
         NHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeEXc5sziGioU7QncZxHFwcud3GSgSSBdGUH6jaJ2wUaR4zjldy27TLJ5mplaMH3MGN/K1W+CFJgQH7RIU@vger.kernel.org
X-Gm-Message-State: AOJu0YwVOqK/pruVtKwC2O+aVGJr4FyYfofn/Z3/WD3plYYCOwAyZ/Wj
	GpoBJLT6piCM9rwxQQgvv2h3kq1BUWX+mpHXEgCDX63e0Da6KV4CrX0ErGJJKfi1Rq+mlu8L3fB
	N+nK3uXEklUtjCKNb8sBzRIcniiXbxg7aJJVBbpZKtrCPEy2zCtUQmpS22tDLLeTC
X-Gm-Gg: ASbGncuZmY6BXU05C1/qPFDy7AokG8hBL8tGX9VAa4OGljzrMP5Hr4nIbXreU+drTyW
	PzZ7+fnEnImMSgiu/OJuuy1jh6xJME9gIfk1v1omVFJLbwiTG9v2s7t2cLCx6THUT35Hzcl7qq8
	z1OXeGPu6QLl1Di62uZPWCv+87vAphMiaLFW4VD7AbbigJt+TwWO3qO4pZ7YHY1zqEqwNMCmQNT
	nFEjWGyO1woZxY9YujoZyP4uwV72It0WclqHZXyVHWOXt2SHGqL2dGozhMzpVsagDP3J2UIcEzU
	uzwjolg7GTjixNfi976uF5bDNLR1FauoOG7KOM0NMknAAO+zNXAuaahFnpXI7LreFkg5axRhH7y
	+PbMz6Spjqw==
X-Received: by 2002:a17:902:f686:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22428ad1f1dmr230620885ad.43.1741628596826;
        Mon, 10 Mar 2025 10:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSoXZwl/xRJnBvMNjgKI4bwG+zoNAL5zhn2MR//FnzJEQ5Lx0UFNv9uhZTM9ssO7gjvzuuiw==
X-Received: by 2002:a17:902:f686:b0:224:5a8:ba29 with SMTP id d9443c01a7336-22428ad1f1dmr230619475ad.43.1741628594912;
        Mon, 10 Mar 2025 10:43:14 -0700 (PDT)
Received: from [10.71.110.252] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410ab3c10sm80826755ad.249.2025.03.10.10.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 10:43:14 -0700 (PDT)
Message-ID: <020a5173-512a-4fc0-9838-aa3c2f482323@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 10:42:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] firmware: qcom_scm: Support multiple waitq
 contexts
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
References: <20250227-multi_waitq_scm-v5-0-16984ea97edf@oss.qualcomm.com>
 <20250227-multi_waitq_scm-v5-2-16984ea97edf@oss.qualcomm.com>
 <CAMRc=MeDcMbH=xFZnr=_NZPQ2X9eOfRoRHnS1LJ6M54KwHMVRQ@mail.gmail.com>
Content-Language: en-US
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeDcMbH=xFZnr=_NZPQ2X9eOfRoRHnS1LJ6M54KwHMVRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DgOO0dhBr06hNzUy9AEsgMqqPBZARQXO
X-Proofpoint-ORIG-GUID: DgOO0dhBr06hNzUy9AEsgMqqPBZARQXO
X-Authority-Analysis: v=2.4 cv=C5sTyRP+ c=1 sm=1 tr=0 ts=67cf24b7 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=3kMJlp3iliGaCrkfHV8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_06,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100138

On 3/4/2025 4:49 AM, Bartosz Golaszewski wrote:
> On Fri, Feb 28, 2025 at 6:40 AM Unnathi Chalicheemala
> <unnathi.chalicheemala@oss.qualcomm.com> wrote:
>>
>> Currently, only a single waitqueue context exists, with waitqueue id zero.
>> Multi-waitqueue mechanism is added in firmware to support the case when
>> multiple VMs make SMC calls or single VM making multiple calls on same CPU.
>>
>> When VMs make SMC call, firmware will allocate waitqueue context assuming
>> the SMC call to be a blocking call. SMC calls that cannot acquire resources
>> are returned to sleep in the calling VM. When resource is available, VM
>> will be notified to wake sleeping thread and resume SMC call.
>> SM8650 firmware can allocate two such waitq contexts so create these two
>> waitqueue contexts.
>>
>> Unique waitqueue contexts are supported by a dynamically sized array where
>> each unique wq_ctx is associated with a struct completion variable for easy
>> lookup. To get the number of waitqueue contexts directly from firmware,
>> qcom_scm_query_waitq_cnt() is introduced. On older targets which support
> 
> Seems like it's actually called qcom_scm_query_waitq_count
> 

Yes my bad. Will correct this in next series.

>> only a single waitqueue, wq_cnt is set to 1 as SCM call for
>> query_waitq_cnt() is not implemented for single waitqueue case.
>>
>> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 75 ++++++++++++++++++++++++++++------------
>>  1 file changed, 53 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 1aa42685640da8a14191557896fbb49423697a10..ec139380ce5ba6d11f1023258e1d36edcf3d9d45 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -47,7 +47,7 @@ struct qcom_scm {
>>         struct clk *iface_clk;
>>         struct clk *bus_clk;
>>         struct icc_path *path;
>> -       struct completion waitq_comp;
>> +       struct completion *waitq;
>>         struct reset_controller_dev reset;
>>
>>         /* control access to the interconnect path */
>> @@ -57,6 +57,7 @@ struct qcom_scm {
>>         u64 dload_mode_addr;
>>
>>         struct qcom_tzmem_pool *mempool;
>> +       unsigned int wq_cnt;
>>  };
>>
>>  struct qcom_scm_current_perm_info {
>> @@ -2118,6 +2119,25 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
>>         return 0;
>>  }
>>
>> +static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
>> +{
>> +       int ret;
>> +       struct qcom_scm_desc desc = {
>> +               .svc = QCOM_SCM_SVC_WAITQ,
>> +               .cmd = QCOM_SCM_WAITQ_GET_INFO,
>> +               .owner = ARM_SMCCC_OWNER_SIP
>> +       };
>> +       struct qcom_scm_res res;
>> +
>> +       ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
> 
> This can fail for a multitude of reasons - some of which we may want
> to propagate to the caller, how about being more fine-grained and
> using __qcom_scm_is_call_available() to check if
> QCOM_SCM_WAITQ_GET_INFO is available first?
> 

I agree, will return 1 in the case call is unavailable.

Thanks for your review Bartosz!

>> +       if (ret) {
>> +               dev_err(scm->dev, "Multi-waitqueue support unavailable\n");
> 
> Is this an error though? From the commit message it seems it's normal
> operation on older platforms?
> 
> Bartosz
> 
> 
>> +               return 1;
>> +       }
>> +
>> +       return res.result[0] & GENMASK(7, 0);
>> +}
>> +
>>  static int qcom_scm_get_waitq_irq(void)
>>  {
>>         int ret;
>> @@ -2149,42 +2169,40 @@ static int qcom_scm_get_waitq_irq(void)
>>         return ret;
>>  }
>>
>> -static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
>> +static struct completion *qcom_scm_get_completion(u32 wq_ctx)
>>  {
>> -       /* FW currently only supports a single wq_ctx (zero).
>> -        * TODO: Update this logic to include dynamic allocation and lookup of
>> -        * completion structs when FW supports more wq_ctx values.
>> -        */
>> -       if (wq_ctx != 0) {
>> -               dev_err(__scm->dev, "Firmware unexpectedly passed non-zero wq_ctx\n");
>> -               return -EINVAL;
>> -       }
>> +       struct completion *wq;
>>
>> -       return 0;
>> +       if (WARN_ON_ONCE(wq_ctx >= __scm->wq_cnt))
>> +               return ERR_PTR(-EINVAL);
>> +
>> +       wq = &__scm->waitq[wq_ctx];
>> +
>> +       return wq;
>>  }
>>
>>  int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
>>  {
>> -       int ret;
>> +       struct completion *wq;
>>
>> -       ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
>> -       if (ret)
>> -               return ret;
>> +       wq = qcom_scm_get_completion(wq_ctx);
>> +       if (IS_ERR(wq))
>> +               return PTR_ERR(wq);
>>
>> -       wait_for_completion(&__scm->waitq_comp);
>> +       wait_for_completion(wq);
>>
>>         return 0;
>>  }
>>
>>  static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
>>  {
>> -       int ret;
>> +       struct completion *wq;
>>
>> -       ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
>> -       if (ret)
>> -               return ret;
>> +       wq = qcom_scm_get_completion(wq_ctx);
>> +       if (IS_ERR(wq))
>> +               return PTR_ERR(wq);
>>
>> -       complete(&__scm->waitq_comp);
>> +       complete(wq);
>>
>>         return 0;
>>  }
>> @@ -2260,6 +2278,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>         struct qcom_tzmem_pool_config pool_config;
>>         struct qcom_scm *scm;
>>         int irq, ret;
>> +       int i;
>>
>>         scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
>>         if (!scm)
>> @@ -2270,7 +2289,19 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>         if (ret < 0)
>>                 return ret;
>>
>> -       init_completion(&scm->waitq_comp);
>> +       ret = qcom_scm_query_waitq_count(scm);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       scm->wq_cnt = ret;
>> +
>> +       scm->waitq = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq), GFP_KERNEL);
>> +       if (!scm->waitq)
>> +               return -ENOMEM;
>> +
>> +       for (i = 0; i < scm->wq_cnt; i++)
>> +               init_completion(&scm->waitq[i]);
>> +
>>         mutex_init(&scm->scm_bw_lock);
>>
>>         scm->path = devm_of_icc_get(&pdev->dev, NULL);
>>
>> --
>> 2.34.1
>>
>>


