Return-Path: <linux-arm-msm+bounces-71835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128A1B41DCC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04378685C06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B3C2FC86D;
	Wed,  3 Sep 2025 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzvw6X4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8DC2FB96D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900585; cv=none; b=RO7xQwGXrCIFgXt/h1USLYSkki3szybge5/xh+LYuZjQDKygbQ4KVwFJouYEr1xRK4XIO4QG6mrOiaqYxJathChnUtJ+9FuTOQzu9l4F6lD8CcV6WN5dU3SEctTJZhnZtiSEPn9NDz5qDtiumQwJ6e9okreVD4jg+S+Z2K49C/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900585; c=relaxed/simple;
	bh=sejB4B1VrSQBOMLPVXX5bt2MvNQlg+CmI1uFhYHvW2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BDOjy1dJpY4fasdj7Fbm4Se6XHxTSJai/zyYOf+gCZdEpGEmnVlFHfiqdmRfb85JKHqo9FHDbfF5qDEf/59Ozwsaq3Igdf7FI1EeJJspZnTvBPJzfNNzjsiD7tGQ5CnIdn9UsVzf6zm+KUEGCWyzLMNzF3uESbf3o/BQq9idHMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzvw6X4s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF168010054
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g4aQ0pxQ8JYCo7v46mupCXOW5xYkzPzISF/wAL9cnQE=; b=hzvw6X4sTdBJaXNp
	UEw15rWanYGYyWThODLfG9E7gFuIIyN+6ZLD66WeqXnvyV4d//My/IhDw6syRkUO
	TJnBA8r7cUug17RA6ToiqUs3UzLCCjCmuLnzWphuSFjkAL67+mtafghYkQMXXpdz
	tWjrIrajWgEmVnLcixne5p8zHfKdXqTLsBd/i9zH3SEI37dL2xbBt+VihBewwOmz
	OPgLW7eI50k3jmQSPEUpNHgFZl4GiDB5PgxQY9QHRceGQWyX25X2DPeMSO/r6VNF
	ARemFZKdurbWXGa23Mqy2qXblbr1/D/Gw07k1FZVDim8lliyUWTe8z/xF8fTQX7C
	w33IXg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8ufew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:56:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b3387c826eso12078161cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900582; x=1757505382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4aQ0pxQ8JYCo7v46mupCXOW5xYkzPzISF/wAL9cnQE=;
        b=HRJct3+2Ym4/w4vdwIrsl6AZXzoqSGYqF0r7sBFsWh4kj2iLLiPQ7fNibND3Sx1p2B
         PF/qeGymaFsGrFjEBs0prJarGTNxNY2Uyocf7lADv9c7vvaL0XITvPPzcWUl0V+qscHm
         o2H2q90trT4NRiIhovimTibim1P8aNUvETiSKLom/Zs+0r9XR/EbiOX4/78OxYu8twFG
         dFVWO5XqhVhOprw6GOPpTaukQaK86UWcd0Rp1Vq1qi4GeduUseHNTQWD/0wUO/V9wC8a
         s8Y4Gi2aYMHkgVErOk+bnFFI6Ow8DM6+CYQYbYhuZXuLpH092/ACx5UQoFeltI7UV1vG
         MlHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNk4r8g57fjFqOapdKImoaRKFqRkdymLbi0H2N9VEUyh8A4wSZcjRpGmiJQHzKJ6XMb+YFytPANd/uiGGy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjk3RdVlgZEKzYANwx+UE08e0HFLlvLQKyCdobXGnRHIWvoTqH
	PMbUgLeqJMv7AzPumsQEQw5SD1zHjJEjz1s2EtUrMamYHdjSNAndBfBuCjz69gMU8NZRlzNnRIc
	qW4WOEa49fr3OrqflbSlPn/MCtYoCLMoHztKyCcapHg+053a1sQt6+lPXlOSmMf/HWHQm
X-Gm-Gg: ASbGncviEtkAkxmTS0R2+IODj3C/ZwlSNanhkMRzj0+e/RW8i2Hemt31mk5Xx0/nBAh
	EFVkpP5GJRL2em9DAWABrLMXqC/z+90PwDJybRvpIwHtYX4sk+J+LCQ3Vy+XhjNfMAmhtIKdo+i
	FBEhw4xjnMI+ZhXnyeG1GdTRG6vNR5YlJS7zYfPtmrOn6n3oEJStAnBHjvfxfcwvSJgdXf/3UL/
	jNZF+IqGyGTu6D4nMD01KA74u6GeMHZG+XmeIq6owwaffn4wCWdNoxo0XFzDVt/hLh6KHI4ggCi
	2YcnrVqC3BBlQzvxA9kg6CqDUQymtXV5DDESmQkFxWFVXqN3vT2BBAEQDIEJloN3481xuuPxhho
	SbhmzG5p0tY6iVs6BkAD5fg==
X-Received: by 2002:a05:622a:1992:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b313dd0295mr146230051cf.2.1756900581650;
        Wed, 03 Sep 2025 04:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWs2OE38njma1pgqxQrhEt1KbpBuqDAUfzbSzk/nuiAqrnphje0GRaFExIVuEIMTabORkNTg==
X-Received: by 2002:a05:622a:1992:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b313dd0295mr146229801cf.2.1756900581153;
        Wed, 03 Sep 2025 04:56:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0427c0d4cbsm760372866b.45.2025.09.03.04.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 04:56:20 -0700 (PDT)
Message-ID: <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 13:56:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WRpcBS-7CWesJTQgAdshQ-R46Zvonr8u
X-Proofpoint-GUID: WRpcBS-7CWesJTQgAdshQ-R46Zvonr8u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXyvMclV37YXcS
 FQyah2pUX84KMWkVcwVNoU6crw+Txq4hgKdnS0pkcT7hG4c4sanvp5siJh9tjoHGRTgS2+nlaHl
 +fx56IfJDq9CNX4u6dVQ5gU4TqiGnjdynORZdedZrbz4Zx/5ML4p4N9MNNeUJZ1gpbgEUA+ibai
 xmQoHThW87UsnSZOhdmMjxir5ejcmb+72VuvV9GSO4rno3dsRB7GxMASp+G/uln1C6d/JtHwXqb
 MLi/Wm6M7abnM8FPENuj/YdJ5vcSwcSWvyGWR90IWk6OA6FHFZHxUH1f6mZNB4movRe6YnANmqd
 taBupAsUOubvNc+2Z/xdkzy0uMITFqwQfdatp8bAkdfDoisUJboNJb49MqvXYYGqhivbTqGhcLx
 nQTjtIz8
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b82ce6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eCxR2MOvM2WBuziOM_EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On 8/20/25 1:22 PM, Mukesh Ojha wrote:
> On Wed, Aug 20, 2025 at 12:03:16PM +0100, Bryan O'Donoghue wrote:
>> On 19/08/2025 17:54, Mukesh Ojha wrote:
>>> This is a further continuation with a new approach to the topic
>>> discussed in [1] regarding the enablement of Secure Peripheral Image
>>> Loader support on Qualcomm SoCs when Linux runs at EL2.
>>>
>>> A few months ago, we also discussed the challenges at Linaro Connect
>>> 2025 [2] related to enabling remoteproc when Linux is running at EL2.
>>>
>>> [1]
>>> https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
>>>
>>> [2]
>>> https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
>>>
>>> Below, is the summary of the discussion.
>>
>> Which tree does this apply to exactly ?
>>
>> git-log-graph linux-stable/master
>> * c17b750b3ad9f - (tag: v6.17-rc2, linux-stable/master, linux-stable/HEAD)
>> Linux 6.17-rc2 (3 days ago)
>> *   8d561baae505b - Merge tag 'x86_urgent_for_v6.17_rc2' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (3 days ago)
>>
>> b4 shazam 20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com
>>
>> b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com
>>
>> Grabbing thread from lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/t.mbox.gz
>> Checking for newer revisions
>> Grabbing search results from lore.kernel.org
>> Analyzing 18 messages in the thread
>> Analyzing 0 code-review messages
>> Checking attestation on all messages, may take a moment...
>> ---
>>   ✓ [PATCH v2 1/11] firmware: qcom_scm: Introduce PAS context initialization
>> helper
>>   ✓ [PATCH v2 2/11] soc: qcom: mdtloader: Add context aware
>> qcom_mdt_pas_load() helper
>>   ✓ [PATCH v2 3/11] firmware: qcom_scm: Add a prep version of auth_and_reset
>> function
>>   ✓ [PATCH v2 4/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
>>   ✓ [PATCH v2 5/11] firmware: qcom_scm: Add shmbridge support to
>> pas_init/release function
>>   ✓ [PATCH v2 6/11] remoteproc: Move resource table data structure to its
>> own header
>>   ✓ [PATCH v2 7/11] firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to
>> get resource table
>>   ✓ [PATCH v2 8/11] soc: qcom: mdt_loader: Add helper functions to map and
>> unmap resources
>>   ✓ [PATCH v2 9/11] remoteproc: pas: Extend parse_fw callback to parse
>> resource table
>>   ✓ [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support with
>> IOMMU managed by Linux
>>   ✓ [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU
>> managed by Linux
>>   ---
>>   ✓ Signed: DKIM/qualcomm.com (From: mukesh.ojha@oss.qualcomm.com)
>> ---
>> Total patches: 11
>> ---
>> Applying: firmware: qcom_scm: Introduce PAS context initialization helper
>> Applying: soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
>> Patch failed at 0002 soc: qcom: mdtloader: Add context aware
>> qcom_mdt_pas_load() helper
>> error: patch failed: drivers/remoteproc/qcom_q6v5_pas.c:235
>> error: drivers/remoteproc/qcom_q6v5_pas.c: patch does not apply
>> error: patch failed: drivers/soc/qcom/mdt_loader.c:302
>> error: drivers/soc/qcom/mdt_loader.c: patch does not apply
>> error: patch failed: include/linux/soc/qcom/mdt_loader.h:10
>> error: include/linux/soc/qcom/mdt_loader.h: patch does not apply
>> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>> hint: When you have resolved this problem, run "git am --continue".
>> hint: If you prefer to skip this patch, run "git am --skip" instead.
>> hint: To restore the original branch and stop patching, run "git am
>> --abort".
>> hint: Disable this message with "git config set advice.mergeConflict false"
> 
> Very sorry for the error.
> 
> Can you try with this next-20250814 tag ?

You sent it on the 19th, so it's in your best interest to run a quick

git rebase --onto linux-next/master $(git describe --abbrev=0)

and giving the series a prompt re-test before sending, because there might have
been incompatible changes, whether ones that would prevent applying, or break
things functionally

Konrad

