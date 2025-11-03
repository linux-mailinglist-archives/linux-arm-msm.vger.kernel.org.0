Return-Path: <linux-arm-msm+bounces-80146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 170BFC2D0C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 17:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06FA74E3EFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 16:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC6C315D3D;
	Mon,  3 Nov 2025 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqfDVAnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+IowJFu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46116286889
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186586; cv=none; b=IKDfU0CnMtaQT7uaujopQ205EgaVSsu40N+NWHvhVQAvwNoL6MaXT1o8PZxAIaaCG7G0PXerqdBa8BUtGtGzubhpUMv7iJNPPxVHCP5D+YbhoSaP6WKYupB9Wm57lrMqedgNR7k01AXxxUak4hCwwJ7Npfk/NNXoq8HeygouEm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186586; c=relaxed/simple;
	bh=0jpXIqxzH2ZZX5QeF7Q7S5vGPUY9pP98uq1sW5fKLNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UeP19prPVSB5C60jcGUs0MAfaQttrUWBUQl5gL197jlx7olGyjYJVtFySF2dKKVT5PlD4c/6E8f1qQdKM7aVYhaBQAjtCDBR44VZSkUXl2n63URAKSd5IwtMBn1yFuvM4HF7TCvUaSuO7wjV9P5W1rp3hpbD4wcQC0fJoj2JO8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqfDVAnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+IowJFu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3AV6nI1941375
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 16:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdcvW589MblNcpGME+8yqSm+KMPX7JkIf/mEmjfl5nE=; b=UqfDVAnVnTRhkPiM
	suknEGR1qO7C1SYTpu/u0kars0WkplsSC5ZSQ2yXsVdosiqL5FQRyLr54OghBKDf
	kjattXM3nlWZDFmK21oh59wzx2Rl5BCocLPK61SyLGtQ4MuKPJd7+vULGPlRbrlx
	acIEWCZk6sifaNwIlfUjaXWovOhxF3qrikO/M9caftbEJH5TpN/6jC1Jnsmu3AyD
	f20jXrL/2gmAxwMK3shkza4Ji64Ic4kZ8I+ChfG7OXdVUEJGHsFUE52K778pG8ZB
	ULcLJnr6WvO6TmhjYBNcIqw0+tLyRlr3oPGhiyhmJH34tMSynB++NPdbPge3kb/c
	IOJSfA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6m9wa20w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 16:16:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a28ccb4c8aso4076659b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 08:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762186583; x=1762791383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LdcvW589MblNcpGME+8yqSm+KMPX7JkIf/mEmjfl5nE=;
        b=f+IowJFuP5BzbUX7oDJBd1no/0kQpEvU6IUDAKTDJXL9zoZU7WGqWdUNySzJucNK1O
         1gwSHY2NKaSEhmAfzytzoQWBoPf19MIheSy8N2sg0ighkxc8jZtLR3uNmqMdRlQO3YMn
         9giSEsihg3UySBW0TpfccThB1eFBNwGMa60Nsh5QD4QpjQEnvFAboUAhA7RB0IzYX2GE
         hzmWBlt/+XvfAvS3cCmQD0tEUDXde5vuouVGDRmrwiNkuRiaoV6pUWHiT8uF2wsuOnaw
         qn3Po+C7zXZpzRkvg5vjYy9w2LY4yVtegX/lgbjVTqRyjNEe5giCWpOHdmDoDoRr0Fpr
         U2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762186583; x=1762791383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdcvW589MblNcpGME+8yqSm+KMPX7JkIf/mEmjfl5nE=;
        b=mopz8g/x96PS5ch8NCJX6Jl/fxwT5qyP37i9Vyj7+Lmi5GevGyyw06MYSKNp6bvAP3
         6xPubZvReYXSjlQCz02G7p8/wL6xd6dx4sNeLCG6xzPMSO4Lw1rRSBmz2As1b0PBp1Tm
         COibm/Kj/yKK2ZugqEU7nYRadJyqtw4KLe62BxuC9jhTbxR2DDkIL+wXg8lv9AxZ/7PJ
         wTIP7y0IQTkyd+wQ8xi1hLe8qy7Xq8SAqa6t9gr6ZqV/S7E7I8s+Rfzy5nanp2F700Ro
         gyhPQQEnx/+uA63aQ8rd56s0EOKcXopNTcTl0wDNecNqzqXtTF0ESBZY23XXqU1tgrv5
         qC3g==
X-Forwarded-Encrypted: i=1; AJvYcCUked6HeNQvtHi4bACBXzH1+4DVInCBWjPUarEa7DbWKLPz8BKA6AhP2DVAs1plVp+aS50QOxktKiy0mh8U@vger.kernel.org
X-Gm-Message-State: AOJu0YxXp/cVmBJEAhmtoCcfrZ1YBHrBgbxBBi3LchntfqjyoJDdm84i
	eV5/T2OKp9vWtJ8fyVNPv/h5QzvTyCmf4/Khr6Y3CsOEbfe4lEIE7+LAZR4b2TlZicoY6a/6o24
	y8+yxAk3030l4WPuESg9u/IoNrz38s+r3t3IUhmlVZM+46sodqO1aKmQO/xBAdFM+73HT
X-Gm-Gg: ASbGnctmIVEgsXvfD5vU/IgcZGsACUpzGq8pDlHBuHrBNe/lXD57+mlp2eOpNT4Wvs7
	6/PVDoQ2xeL5s7g4b/kQv6CBbIRx1m52y9hUm0YrPijZtkKxNOMY6IoHTe19jdRlBBVd4sSgYvp
	D1gwnxaxVI7/FdDu+//KK8i+Ai4tXJOrYx4SNYdrbd9UrdUegIosKZd+on7xh9TENfoRk4/z3nn
	rZ2rEPc2ZgQUOFs24GXuvQT81kN1hfAq8+GILxOW29GGMIe418yhmFXOlDdFLnaTU9QApAP0Mi5
	V0Cx+tk1xXAGnKlvBEAAL7D3Yas+83HSleK9flB1mHAKSifMroWGe4OBQeeeFAxrC+RLNNUOPLD
	T/cVK0EWv7bLYiSOHMQyLkWKVpPak+IHkRQ==
X-Received: by 2002:a05:6a20:72a6:b0:2db:f868:22c with SMTP id adf61e73a8af0-348cd20baa6mr18430546637.40.1762186582796;
        Mon, 03 Nov 2025 08:16:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9/B6M7mt8CtWVyJzrPwOK0l0sUdXjqJsKuje1nItIKT6qHk3qWszOLI4NbHKTsmM4uDw2Mg==
X-Received: by 2002:a05:6a20:72a6:b0:2db:f868:22c with SMTP id adf61e73a8af0-348cd20baa6mr18430496637.40.1762186582187;
        Mon, 03 Nov 2025 08:16:22 -0800 (PST)
Received: from [10.216.41.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8e6fa5bsm11885136b3a.27.2025.11.03.08.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 08:16:21 -0800 (PST)
Message-ID: <da04aa57-f3dc-9bcd-5ba3-05088a6661ab@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 21:46:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v8 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
References: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com>
 <20251102-multi_waitq_scm-v8-2-d71ee7b93b62@oss.qualcomm.com>
 <CAMRc=Mfh+WQx-vasZed6jWi5nUjg=K+ScVRBMCiFgK397=JbVg@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mfh+WQx-vasZed6jWi5nUjg=K+ScVRBMCiFgK397=JbVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P7Q3RyAu c=1 sm=1 tr=0 ts=6908d558 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fzkneX8sAZvuw6kD2IUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6BcqnsNIDSy_oBUrHhuEgoJfBuG3TEm0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDE0NiBTYWx0ZWRfX4Opi62u6i+b9
 Z+86F1cfHH1KaoMRs4TVGtFVHZrh6ISVcsqIs/42kSL4K9AUSKZyHoKCjekZ11drzTHIbBJAPz6
 zilv72qNu5jG25e+YIvjkDGgZUirNUNN3lPjA9rcotpf+Biz4VDeJqXHFeuxtRqQDx4pQVYF1RD
 AkROwwcu5XJzMkMD1uaCU83he8swMjyzJXP2HYVMZpBwHeQ6YQS8Rcxo4QcVah5QUlIm7byJ81B
 guxM7tq4IrOYWd1Afm/g8jiIyiNC5KS9kOotI4wihnIQGkwnLcm7Su0SDzre2NzqDLUQk5OsB5P
 7mlq4GYgHOw8GXUyz2pNCznfp8no1QnBrdGt4/cMD5vNXqWkUvwv3ESFRboneAErNa8WaQ6bbdN
 gVf5hSvj4hlqOCej8khok5HYiNxGtw==
X-Proofpoint-ORIG-GUID: 6BcqnsNIDSy_oBUrHhuEgoJfBuG3TEm0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_03,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030146



On 11/3/2025 9:16 PM, Bartosz Golaszewski wrote:
> On Sun, Nov 2, 2025 at 9:19 AM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>>
>> Currently, only a single waitqueue context exists in the driver.
>> Multi-waitqueue mechanism is added in firmware to support the case,
>> when multiple VMs make SMC calls or single VM making multiple calls on
>> same CPU. Enhance the driver to support multiple waitqueue when
>> support is present in the firmware.
>>
>> When VMs make a SMC call, firmware allocates a waitqueue context,
>> assuming the SMC call to be a blocking call. The SMC calls that cannot
>> acquire resources, while execution in firmware, are returned to sleep
>> in the calling VM. When the resource becomes available in the
>> firmware, the VM gets notified to wake the sleeping thread and resume
>> SMC call. The current qcom_scm driver supports single waitqueue as the
>> old firmwares support only single waitqueue with waitqueue id zero.
>> Multi-waitqueue mechanism is added in firmware starting SM8650 to
>> support the case when multiple VMs make SMC calls or single VM making
>> multiple calls on same CPU. To enable this support in qcom_scm driver,
>> add support for handling multiple waitqueues. For instance, SM8650
>> firmware can allocate two such waitq contexts, so the driver needs to
>> implement two waitqueue contexts. For a generalized approach, the
>> number of supported waitqueues can be queried from the firmware using
>> a SMC call.
>>
>> Introduce qcom_scm_query_waitq_count to get the number of waitqueue
>> contexts supported by the firmware and allocate “N” unique waitqueue
>> contexts with a dynamic sized array where each unique wq_ctx is
>> associated with a struct completion variable for easy lookup. Older
>> targets which support only a single waitqueue, may return an error for
>> qcom_scm_query_waitq_count, set the wq_cnt to one for such failures.
>>
>> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 75 ++++++++++++++++++++++++++++------------
>>  1 file changed, 53 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 28979f95e51fbee94b84c1570a4d88a76f72db4e..0b6efa7c2bdc25a3ba152c25d5451d1154779ddd 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -47,7 +47,7 @@ struct qcom_scm {
>>         struct clk *iface_clk;
>>         struct clk *bus_clk;
>>         struct icc_path *path;
>> -       struct completion waitq_comp;
>> +       struct completion *waitq;
> 
> Why this change? This makes the name less descriptive if not misleading.

Want to make it dynamic array of waitq`s. Should the name be kept as 
struct completion *waitq_comp; ?

thanks,
Shivendra

