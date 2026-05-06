Return-Path: <linux-arm-msm+bounces-106145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKHGAylu+2miawMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:36:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A884DE2D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B56A030099BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 16:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4872948C8B8;
	Wed,  6 May 2026 16:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epMNdibW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkJ4THH3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99947ECE3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778085408; cv=none; b=fX7hmL5pUvI528PsvMW69cB27Wf2ux9S7rQbmENH55Xm9rp0HNWaWlkcBparbcSPF0VQfKKMMtZNzuoDJxYDCDqHVtTQ9zY+zcMbGQyzwVtDvtoZwT0zpNQoi4tzTasRxmdJ87TWodQvKng3dAiyTT6XoqDkmxl56ccsR7hI/tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778085408; c=relaxed/simple;
	bh=YUCDA48aXRxkZw5mYhHWBC3J8D349BVZVO7Begm/rv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgdhjoHwXqX2Vj/xN7VT0ThptjnUQajlLx5AwTY7tMsjv7BTQz7hTWi6DzPRmRwPCdIqHojPLajvSaXLMS6aEmrK3mOtyRcWIytlFvtyS2R1sqowPvvSvIaVG2RBMRnWb32I9vholwEJhL0x5NUn8Zm8r4zx+2UYlsIa7SO9sH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epMNdibW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkJ4THH3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EpwUJ1435093
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 16:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJmC9RsVHYv/TaiaQgM7ygIb7Mvb3W28zM26saXdFEY=; b=epMNdibWfB6LmuXp
	2s4p9v73nC5YP0MaC0kNVX2uk2XbceJmPhO10PWyzz6qqd1Zr2lXDvAZvJrsxKKG
	dfKjuGLGFTOqhirWYwOHfRYTddnlzZsrgaoxYsfK7Kb36JSqSpK0fd9SmZ6oL+wi
	C+lai2kvQQRtybHYdhV00G8YheFmLusQK9+SpJ0MqWB81M1tGbX5D/hSYl4U1pCB
	3lqKEfiBghY27Sq2Opo1dkDKLhKdn9Ln7N7fOJqAo6DEEBouRGBt8DLYs/5WTt9m
	7LK6o4+mhnj42dak+ie6AkTDbhOlFcw4VlhLk9qwaW9vu5o8bGC4QvHTL3v3g6/U
	huKG3w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyuqduahd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 16:36:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adc527eaf5so46223635ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778085404; x=1778690204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJmC9RsVHYv/TaiaQgM7ygIb7Mvb3W28zM26saXdFEY=;
        b=FkJ4THH32eWzj+cuVRxJgJqjrbXaq05HID0bJvpQZGtT26v0xM4OjYdgcBxtcx1kQW
         txtEN+A9mT6/iKNLMI1hScKQvzedUYUY9f1EYmZNJ3SWYnXwk2X0ASpM6246eZOkXVuM
         nkrjpflvoZpEaBlq60mmtV7GgRWiYRGk6LrHsE8etzOQ610vVCtqA5t5PAht9HFGqCdN
         A4OOWytrCAXgHWMgyMMkQ4ObIdgNOShK6NbZ0rTgXE91D8PKTFbb+nRyYqbkYDAOHzGR
         VwE4gdQb6t0dnAQwD64MX/H0u/mq+KYdmFyWx5Th0cfuKrl44orB2GrZ4nhLLy6RxqUf
         UIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778085404; x=1778690204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJmC9RsVHYv/TaiaQgM7ygIb7Mvb3W28zM26saXdFEY=;
        b=cUxh8uEmHJUU716XdXtBb0HGJ4EfObbwuVQ9GrwvyKA8UPIqL/Ge9CvtcHC7lEKzNu
         dCgcswrJrDan+u3tmPn2gd3ox4RNtVdjW567Q+afJgmOqCKdVN8Tdc0ZjI1kECG99zJ2
         SZz2bMzVxXUygMHP4SEgBwSMY8+KVe8MGqTTqbJ9auU46+rxndK4EdmMNTyDWfvKfXtu
         FOfWGIu6s8i/2v0HNsB2xUYWstFTwD0gxcbfEehuGVFrwWQjaXDIWaEgvOXbQomAfHJT
         l3PXJNdoNnxbphd9oQSUTYEksLD9eYtQxuB0KyptH2Gvr2yg/OnvgugIrpkA3BLc7Uws
         0GXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WiUYsinKG5r6DbIl4fbxyF2KtvVrbtU+TgNWqEfi+5UfxIM6YJcEXoXBERpQuX6Qia8sj7UkguHxwHpCB@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWx72Q3Mz55z5BqT0jsD7bvffuHHJVMLxMXREoHwcxcuT7+c1
	gtozqrR2hi7Vc7ziduriE5D6h7Vfotx5+NmNSyC3ZKCBf6p1w8NDE/3LsN5+L+Rs9Cc5URxuZ/t
	RrJLEEz5E+mKw8VbuvXgtu6e5HLcQ1byz7df/HR5eyb6hPEZoECpzr4OJJitU0pqSEoHZ
X-Gm-Gg: AeBDieub0ETU2jEekWMvtDne23FshoQ09KVYBrZKv5bMDREMaTXnchAub8JZWCoq1C2
	k3al0vW/NXuLgby8gk9mtXOWbS4rFVpJYcgIrKg3AtXtQ+4SW4VgPvehcHK+HPjqTXXaEZNbJ7a
	ahB4JqqK9AFrkn1+FPSYIOqMKPCKV465mStlVscKsCJvrX85XYfU0MSbmgZCsGkYoMbCnNbf945
	T/SplIMQ/V2cng0CbkwjhiZYt7rlV9XHJID5tqbqLzJUGi48HDuuznEoiJXugZ6cjsbDcQC5w0U
	mWwt85gtTWlnPc+qCdBD/NTrAKdyBQChfToamkkQtq0P6x00B2d832/t3OuuV77F//dJoetPZGn
	0PIV7R8myzHyRqdc1r0AtkUCwSR7zvTDNf4lnbYGv9VYjMAauLuDABkW7UJ6Wwxr7
X-Received: by 2002:a17:903:24f:b0:2b4:5f67:5914 with SMTP id d9443c01a7336-2ba79becc18mr44285295ad.33.1778085404285;
        Wed, 06 May 2026 09:36:44 -0700 (PDT)
X-Received: by 2002:a17:903:24f:b0:2b4:5f67:5914 with SMTP id d9443c01a7336-2ba79becc18mr44285005ad.33.1778085403722;
        Wed, 06 May 2026 09:36:43 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca2563dsm29225485ad.76.2026.05.06.09.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:36:43 -0700 (PDT)
Message-ID: <4d4d8023-57ba-0dec-488f-bce17090a0d4@oss.qualcomm.com>
Date: Wed, 6 May 2026 22:06:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 07/13] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
 <20260505-glymur-v4-7-17571dbd1caa@oss.qualcomm.com>
 <20260506052129.4kahdrcxxrvl53hy@hu-mojha-hyd.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260506052129.4kahdrcxxrvl53hy@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W4sIkxWk c=1 sm=1 tr=0 ts=69fb6e1d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tkXzD9pcQE_IdLLthRAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2MiBTYWx0ZWRfX8229zM48LkA/
 kDT6AQe8fI9jJxwut+IgHOc/g2zKORJDIiqS3JUAwpHhE7/vBOk54cLHG0B8ibk9gJG8eKZWvAP
 qcIGTgOpMDWUTz8mHT/Mr/bj1eJDbUeSCIKwGOghT2zXFhNaFja7jBNb2jrysNudaPF2mcqYluC
 XCcQaJRThQUashpxCF6aOSKu3D0UQFZQXFpnKUJhIILf6x2WAAEOLrBaOdP9Wk/qkTsgA1ord3V
 ndQ+NIni4Z585BxyEAmu7xuqOfONp04p3LaMnO73dJDnG1pnbGuqlWpWfJIrciHD3ntFPxx55mj
 TrqBBPmJxz9S1PlDdSs9Wh3vzc8C41yYfhtrXfDCD4sbLPM4/RTWQnjHCNImjhboggT8x0rO/nb
 PCXXpNmYWFt7BBzlESwhBf543Z93Nu+dJAjq2lpg0DgoXfCsZms5i6ZknpTZa+UkwM1Y7nP6BIA
 tYV90JxMqnQMhqHiJMA==
X-Proofpoint-ORIG-GUID: vdMOtxRXdrVGABtIZ3E4XI5EB3FXobgW
X-Proofpoint-GUID: vdMOtxRXdrVGABtIZ3E4XI5EB3FXobgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060162
X-Rspamd-Queue-Id: B7A884DE2D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-106145-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 5/6/2026 10:51 AM, Mukesh Ojha wrote:
> On Tue, May 05, 2026 at 12:29:28PM +0530, Vishnu Reddy wrote:
>> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>
>> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
>> or QHEE), which typically handles IOMMU configuration. This includes
>> mapping memory regions and device memory resources for remote processors
>> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
>> later removed during teardown. Additionally, SHM bridge setup is required
>> to enable memory protection for both remoteproc metadata and its memory
>> regions.
>>
>> When the hypervisor is absent, the operating system must perform these
>> configurations instead.
>>
>> Support for handling IOMMU and SHM setup in the absence of a hypervisor
>> is now in place. Extend the Iris driver to enable this functionality on
>> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
>>
>> Additionally, the Iris driver must map the firmware and its required
>> resources to the firmware SID, which is now specified via iommu-map in
>> the device tree.
>>
>> Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> I have posted https://lore.kernel.org/lkml/20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com/#r
> for resource table extraction and the API to map and unmap and now you
> can use the api similar to below
> https://lore.kernel.org/lkml/20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com/

Thanks for letting me know, rather than introducing a dependency for this
series, I'd keep them independent for now. If your series lands first, I
can update my patches to use the new API. Otherwise, I'm happy to volunteer
a follow-up patch on top of my series once your patches are merged.

Thanks,
Vishnu Reddy.

>> ---
>>  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>>  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
>>  2 files changed, 66 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
>> index fb194c967ad4..b396c8cf595e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -34,6 +34,8 @@ enum domain_type {
>>   * struct iris_core - holds core parameters valid for all instances
>>   *
>>   * @dev: reference to device structure
>> + * @fw_dev: reference to the context bank device used for firmware load
>> + * @pas_ctx: SCM PAS context for authenticated firmware load and shutdown
>>   * @reg_base: IO memory base address
>>   * @irq: iris irq
>>   * @v4l2_dev: a holder for v4l2 device structure
>> @@ -77,6 +79,8 @@ enum domain_type {
>>  
>>  struct iris_core {
>>  	struct device				*dev;
>> +	struct device				*fw_dev;
>> +	struct qcom_scm_pas_context		*pas_ctx;
>>  	void __iomem				*reg_base;
>>  	int					irq;
>>  	struct v4l2_device			v4l2_dev;
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>> index 5f408024e967..0085dd7ec052 100644
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
>> @@ -5,6 +5,7 @@
>>  
>>  #include <linux/firmware.h>
>>  #include <linux/firmware/qcom/qcom_scm.h>
>> +#include <linux/iommu.h>
>>  #include <linux/of_address.h>
>>  #include <linux/of_reserved_mem.h>
>>  #include <linux/soc/qcom/mdt_loader.h>
>> @@ -13,12 +14,15 @@
>>  #include "iris_firmware.h"
>>  
>>  #define MAX_FIRMWARE_NAME_SIZE	128
>> +#define IRIS_FW_START_ADDR	0
>>  
>>  static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  {
>> +	struct device *fw_dev = core->fw_dev ? core->fw_dev : core->dev;
>>  	u32 pas_id = core->iris_platform_data->pas_id;
>>  	const struct firmware *firmware = NULL;
>> -	struct device *dev = core->dev;
>> +	struct qcom_scm_pas_context *pas_ctx;
>> +	struct iommu_domain *domain;
>>  	struct resource res;
>>  	phys_addr_t mem_phys;
>>  	size_t res_size;
>> @@ -29,14 +33,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>>  		return -EINVAL;
>>  
>> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>>  	if (ret)
>>  		return ret;
>>  
>>  	mem_phys = res.start;
>>  	res_size = resource_size(&res);
>>  
>> -	ret = request_firmware(&firmware, fw_name, dev);
>> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, pas_id, mem_phys, res_size);
>> +	if (IS_ERR(pas_ctx))
>> +		return PTR_ERR(pas_ctx);
>> +
>> +	ret = request_firmware(&firmware, fw_name, fw_dev);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  		goto err_release_fw;
>>  	}
>>  
>> -	ret = qcom_mdt_load(dev, firmware, fw_name,
>> -			    pas_id, mem_virt, mem_phys, res_size, NULL);
>> +	pas_ctx->use_tzmem = !!core->fw_dev;
>> +	ret = qcom_mdt_pas_load(pas_ctx, firmware, fw_name, mem_virt, NULL);
>> +	if (ret)
>> +		goto err_mem_unmap;
>> +
>> +	if (pas_ctx->use_tzmem) {
>> +		domain = iommu_get_domain_for_dev(fw_dev);
>> +		if (!domain) {
>> +			ret = -ENODEV;
>> +			goto err_mem_unmap;
>> +		}
>> +
>> +		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
>> +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
>> +		if (ret)
>> +			goto err_mem_unmap;
>> +	}
>>  
>> +	core->pas_ctx = pas_ctx;
>> +
>> +err_mem_unmap:
>>  	memunmap(mem_virt);
>>  err_release_fw:
>>  	release_firmware(firmware);
>> @@ -62,6 +88,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  	return ret;
>>  }
>>  
>> +static void iris_fw_iommu_unmap(struct iris_core *core)
>> +{
>> +	struct iommu_domain *domain;
>> +
>> +	if (!core->pas_ctx->use_tzmem)
>> +		return;
>> +
>> +	domain = iommu_get_domain_for_dev(core->fw_dev);
>> +	if (domain)
>> +		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
>> +}
>> +
>>  int iris_fw_load(struct iris_core *core)
>>  {
>>  	const struct tz_cp_config *cp_config;
>> @@ -79,10 +117,10 @@ int iris_fw_load(struct iris_core *core)
>>  		return -ENOMEM;
>>  	}
>>  
>> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
>> +	ret = qcom_scm_pas_prepare_and_auth_reset(core->pas_ctx);
>>  	if (ret)  {
>>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>> -		return ret;
>> +		goto err_unmap;
>>  	}
>>  
>>  	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
>> @@ -93,17 +131,31 @@ int iris_fw_load(struct iris_core *core)
>>  						     cp_config->cp_nonpixel_size);
>>  		if (ret) {
>>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
>> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> -			return ret;
>> +			goto err_pas_shutdown;
>>  		}
>>  	}
>>  
>> +	return 0;
>> +
>> +err_pas_shutdown:
>> +	qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
>> +err_unmap:
>> +	iris_fw_iommu_unmap(core);
>> +
>>  	return ret;
>>  }
>>  
>>  int iris_fw_unload(struct iris_core *core)
>>  {
>> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> +	int ret;
>> +
>> +	ret = qcom_scm_pas_shutdown(core->pas_ctx->pas_id);
>> +	if (ret)
>> +		return ret;
>> +
>> +	iris_fw_iommu_unmap(core);
>> +
>> +	return ret;
>>  }
>>  
>>  int iris_set_hw_state(struct iris_core *core, bool resume)
>>
>> -- 
>> 2.34.1
>>

