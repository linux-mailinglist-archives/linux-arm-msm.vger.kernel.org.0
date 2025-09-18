Return-Path: <linux-arm-msm+bounces-74022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D88B82D55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41D77586791
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 03:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CE023C4E0;
	Thu, 18 Sep 2025 03:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhAB/6RQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3FD5680
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758167763; cv=none; b=YZN8sAkqgONs9tcMHEvUVDaHZCu7YO25kcRfhiuEzQgnXy3UQ2/FuVFU5vUh9GBsyxenHQj9H+JPFNJ4OjdFqTRizbdPkT1CCcX4eaI83XdxZuP/PbIdrFYlK+N+ZS6bscNNK3rXxo7JDqFLQKkZf+ikOpyZwb3ombVq5dJ+34w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758167763; c=relaxed/simple;
	bh=CkhYshgCl2KU7HmPUDrBkaUy/oLRIyiOgdxz9omSVB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhkqdxs75JOokDFgSguZV2FKGSoBAmIHO8BmhGG5TRWSR61Q2mzP0YJglATtP9QJgBKHfxUzZUhyy5VhJdqtQmhb/ktBK6Uc+JioHMTpzQhJuwMwXIlL/7SEKyHL/fKcsaRxZ/nmoHD28hgTqxNlLgWNXDQJxnIeAx1Fyg3mWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhAB/6RQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3rAXX014180
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Fxa1cerSNF4zeWZMShDjw5WL2sJeXA2U30jnp3Uor8=; b=bhAB/6RQAe8RaVSS
	v/LvLcGIUaR231QOhk/OK0b7dFDgVYCExk2LPypmHa2G4BI4QKGk/5Z72BdVywzE
	xa2c2FGFi4iCQvw0n76Ur02laHxUl9jTQR3i68PRwAiytrdI0o2sZuphmwpfnK/V
	zeB4BaIoGAmOB49+Y4BwzcHP6XAyPCdD6sSDphsV1zVrBIfQsDB+1URGi9kKRwad
	PROq0+m6Qlsd6+Bgu8rQj0A/VsV5EnZdUCc01cXoTZ1mAMkD/dwGIV48+Y6OLvQc
	Sp4LepmaOd5hVaJ2ZMRhBCu/s5QHkbmC9YRYlL31Fspr6sefcQ8EMhd/wwRVObyi
	cTqCxQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu4ube-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:56:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-265b1c650a0so5423035ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 20:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758167760; x=1758772560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Fxa1cerSNF4zeWZMShDjw5WL2sJeXA2U30jnp3Uor8=;
        b=ByQ1SPY1uUxD94VRrJlvQVBZD65vFXgxScQXqXoq+dhUlSgi8y4WDvTxHc4YNF80lI
         jl6Y7JK5qk7vbtROr727I6HO9/ywVSydFHnxtYF130aWyPERc3JPW2JNPmsaumzpubkV
         iOBLHLdOtPOtcByYnU729kcwwlXEGxJccyvDI8C9jXTcYG/u28ZcwFz7sUQYBk7uxfBH
         W4YSKcPfBC00q/cJrCfDSRq2WEI+N3WUGjZlnFsD1S/hP+j//3EMZqKgL44nYntU3124
         0OAdR+6uxqm/1MiRrFSD0+kkTTwvpk5BIelaQ5DYctkFervoMfQd7X+WeNwG9C4aGtyJ
         l0mw==
X-Forwarded-Encrypted: i=1; AJvYcCXm6pBT/a7OxBjxhJKYChBnTryXoOQHtvAYhkgzvt7qE/fKDRW1hxLSnDHTpBViW0FgoIT9W0wP0e800/Xg@vger.kernel.org
X-Gm-Message-State: AOJu0YwGoyZ6nD0uUjmln5HaqYFbMFE95XUrGox9fMuY9AHDUeno14nq
	LKC6IxiJd0LcWIyo0NSZ4vMxQGxTjfInqLwgNMWvUoVEa0AVH24QoJIVfbacAr64sqEBUyp4zLg
	U0CBjJzdz4YCc+zf5FwqNwyAJy4jY5xz14Gtm+DNduhQ/kli/9+Q7uLVstyRc6qy6mfoN
X-Gm-Gg: ASbGncuDL1tlcqaxjXjW+X1xiOh4t9to+5o2+6mqvEVgWn2h3Lep/79qilATnXI4iHO
	dopVTmaYMVE+sBmDVKT+sZOzWVqUOPewMsfs4/nGSJuvO3g6acK0k3VOwpXtRTxn3yRxbL9NCrP
	A2CC/0N0R7MFZvZuOEuZ/moaJ8We5vsUG8Go7bhl+1UvKtba/ccJJF0iri8TLc3CBIHY1U8r+CX
	dVFZEkWiHan5vr6npI9GCbhgQ3xQJLy16LD1JMDNyyRSKgz89GVD5LlmYfkUqU6qajwXZ1u/0b/
	qEXuvIHsFRlDRGaJUHdL3xhVWEqEaRywIMvgwpWb2mSltExomfzZuHtZNiB6ZyAQAfohJfWK
X-Received: by 2002:a17:903:2350:b0:25c:ae94:f49e with SMTP id d9443c01a7336-268137ee3e8mr53353475ad.37.1758167759824;
        Wed, 17 Sep 2025 20:55:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUQIsj/bvrGJKX2t8jqtl7qhNRFzVuedqKZIiWt2E4pbwp4s0RwP4y+TkO5jslvFAE+Up5Ew==
X-Received: by 2002:a17:903:2350:b0:25c:ae94:f49e with SMTP id d9443c01a7336-268137ee3e8mr53352995ad.37.1758167759201;
        Wed, 17 Sep 2025 20:55:59 -0700 (PDT)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980329745sm10566025ad.121.2025.09.17.20.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 20:55:58 -0700 (PDT)
Message-ID: <8e2781ae-34d2-4009-bf8c-56aa1bb6fe85@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 09:25:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: qcom_geni: Fix pinctrl deadlock on runtime
 resume
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20250917185102.3763398-1-praveen.talari@oss.qualcomm.com>
 <dab18f70-4017-4c06-92c1-91cfd2229540@kernel.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <dab18f70-4017-4c06-92c1-91cfd2229540@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3ukvejzayAKR
 TWCqfQGNwRHR4vxLy0Ad1fdQSsuKfObvLGA8rdKX9Qwc8k2N/oRwX5Fs7RmZtCw5T/gpTOF4ype
 KxpuPyRBuDj+zuwVcCX8Fu+Yh0REH5vdyMilg9neEVX2sPuMssIPjNJ5IzYRiiGRjxxK/WIADQ/
 vlk7vYMZ21/ddLOl1rsKYUNKFKZFphgexxIjo0M0S5Ho0or5syL+G6DiNqlLbcgS3S2e6iHPeK9
 GbuWWw+EAjIRQKbEIEOnw7I9bMSR/13iFkimdLgig1u5PxxSpulmEAjZeGp3N24DTjgqEtMFm+w
 zyeC4d6mi1YqraALeJNGgep9qCw3bO+RH7KOWTrky2zT/ajHeHfG4ptiJ4NayUWTEM83zsKehMn
 qqUJ8v8Y
X-Proofpoint-ORIG-GUID: vs6BDMF53MdASXcCGxrmuCus_JOIUeMR
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68cb82d0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=cBlBuNp7yuU5UAWV944A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vs6BDMF53MdASXcCGxrmuCus_JOIUeMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Hi Krzysztof,

On 9/18/2025 5:28 AM, Krzysztof Kozlowski wrote:
> On 18/09/2025 03:51, Praveen Talari wrote:
>> A stall was observed in disable_irq() during
>> pinctrl_pm_select_default_state(), triggered by wakeup IRQ being active
>> while the UART port was not yet active. This led to a hang in
>> __synchronize_irq(), as shown in the following trace:
>>
>> Call trace:
>>      __switch_to+0xe0/0x120
>>      __schedule+0x39c/0x978
>>      schedule+0x5c/0xf8
>>      __synchronize_irq+0x88/0xb4
>>      disable_irq+0x3c/0x4c
>>      msm_pinmux_set_mux+0x508/0x644
>>      pinmux_enable_setting+0x190/0x2dc
>>      pinctrl_commit_state+0x13c/0x208
>>      pinctrl_pm_select_default_state+0x4c/0xa4
>>      geni_se_resources_on+0xe8/0x154
>>      qcom_geni_serial_runtime_resume+0x4c/0x88
>>      pm_generic_runtime_resume+0x2c/0x44
>>      __genpd_runtime_resume+0x30/0x80
>>      genpd_runtime_resume+0x114/0x29c
>>      __rpm_callback+0x48/0x1d8
>>      rpm_callback+0x6c/0x78
>>      rpm_resume+0x530/0x750
>>      __pm_runtime_resume+0x50/0x94
>>      handle_threaded_wake_irq+0x30/0x94
>>      irq_thread_fn+0x2c/0xa8
>>      irq_thread+0x160/0x248
>>      kthread+0x110/0x114
>>      ret_from_fork+0x10/0x20
>>
>> To fix this, wakeup IRQ setup is moved from probe to UART startup,
>> ensuring it is only configured when the port is active. Correspondingly,
>> the wakeup IRQ is cleared during shutdown. This avoids premature IRQ
>> disable during pinctrl setup and prevents the observed stall. The probe
>> and remove pathsare simplified by removing redundant wakeup IRQ handling.
>>
>> Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
>> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
>> Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
>> Tested-by: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
> 
> Where did you receive this tag for this patch exactly?

Since Jorge was involved in validating the change, I’ve added him under 
the Tested-by tag.

Please correct me if I’m not supposed to add this tag myself.

Thanks,
Praveen Talari

> 
> Best regards,
> Krzysztof

