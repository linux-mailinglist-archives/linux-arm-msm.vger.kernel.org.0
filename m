Return-Path: <linux-arm-msm+bounces-86466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10332CDB3F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 04:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB28C3009095
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BC3314B8B;
	Wed, 24 Dec 2025 03:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymnzvl/G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VXaV+P5y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2433148BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546466; cv=none; b=SuE+1fRsBNsadd+PdogZBrnaVTz/D06eiZJ0dqjWY7ZgYuJSw1A9uPvtogUBzJAM5G2PHjo7ezJDqLwZiTzKuSR9bQTNeutFOPe1LqOk+PDFysxLRTT/W7FELBfd3zLc/Lq6zwi1yj8GUMGiZbgMpcgnkHKJsHStrAKL8Lyzqw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546466; c=relaxed/simple;
	bh=T50vE2dUYm8Zie1nHtYyZrvmnFybSZOoezC3TSTzs28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbtdvC74m38gkeqIshkOTR+dya+BaRMA7o5uswjDVVrr0ARsuW6pu2oiDF4kEaq+S3PpxFjmGwjyqB750z65FXDqL1+RWe4Ca0p28P6dVsRyz0O5OQoYjdDhr2Hzzi8d/EpBdCJs1+ohMwwW9OzhjplU8tRQmLsh7xT4uBFIVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymnzvl/G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VXaV+P5y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJD0Yw1056447
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef2xbZYFBLvV8iHc1w+Z8FJ2huGyVK0CDpCPxQoM66Q=; b=Ymnzvl/GE98rvMHF
	9M4c7i5jv0O9mzPwTJwvVy93CoB6epDZmX8N2h/EKVLfeNZFEl2lMj53DzLGAfKV
	KLIjPzq2whuYYND9qWIvjEnigsNyluy2Mx3FzZn7M4nWcPj3ayuugb9HWd1mU8MF
	9GZg3cjqGsrE4qYUOCSGG0NPmLdasaZG/OY+jkJ3q0nQ8+yRkg6PuMEVzeTLH9V6
	9Pc/V/sDWoZGuFlO1f0hw0Xm9FjYsw1F008nKh8fbO6mcI9m9ILfJOFQe0XTaRgN
	ZXJvst//6ygpyaGYsdw5F2vA+fi+/BINmdVQvg4N6LxPFYCuyw2+9oknqJDWeGvy
	64cF+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v14em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:21:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f27176aa7so116850925ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766546461; x=1767151261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ef2xbZYFBLvV8iHc1w+Z8FJ2huGyVK0CDpCPxQoM66Q=;
        b=VXaV+P5yHXmdmsem7Fa8aV5KJDf5qvwKiv0yfRvAsazc4ZpdKc/KZPlwFGmsZiQi2p
         PO+SYp9MDoaoCgBNxi3uOm7ebM6+XA0WbGqQVrxJr2E9Ch4xWJ+uS8JEkgqdYMP6WKqb
         0N4NeAwAkq9H6ncRSTXq5w8iDoZLVMKwODT8adpXJVD86ogRh8oAYpthe+h0zW87XjWM
         hYvCpwEJOMxeI+3zkd7Qheq/6+2g0vOuOVy2MT8oOLcRSPgFmzFgkbSEjWhxOuaDeBwo
         Nb1qxhclaww7it6FElMxukJ9tmCIMlJJppKDrTFbYs069wC7cF66Oy/zTNSKuj2XtHZc
         E9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766546461; x=1767151261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ef2xbZYFBLvV8iHc1w+Z8FJ2huGyVK0CDpCPxQoM66Q=;
        b=wBFIZcVaQziAAY9QaUxeWFWm2b6m1Xv4RnoTUYAfZM8rU+YuC5nnyLJEodQdQKsfGk
         /xw7D0fGVy8AWx5vK11RuFdBJMDSjM3sKiYNq3qKreL2vT0Aa/JNRgaZMnZHd6WBoZGo
         BRDPupxJwyvfOHHxpxvHC0zgwqG87mNl/NRkJc3ZSmK784GK8+0xs1PbvxW8pmU9rdco
         N2dg1yUjMZJsxo4G1ywFdZM1jZSHsYyZMMOw8f2ZBWqWsgfcMStE8UjRAnqhVzqmaBRl
         YzYLnHMF0X2G4GrqwpNwEoWGtcBYsEBxoHqldkrtlgok+zHshLIJOrUKNiA10CYOFXga
         /GXw==
X-Forwarded-Encrypted: i=1; AJvYcCXHODQE0GaGJF/888ltsPemWHFTEMTLkpiccrJmS9A6tAqQyQomPr1+Ac7vp4qbFsdoUjg1zRW/u3wlkHbc@vger.kernel.org
X-Gm-Message-State: AOJu0YzfdFX5Xes/JXHOfxvFyG2eP7Ys1hdVmo3/7THMyR3BjBsnaQJM
	eKxcVbClrIzrloh8GIWBEhJ+4PPqWbTq4YyUsp+50y1PpW1lmcPt4fq/pEqg0m4IgFnfCilRqhl
	t4u1nvRir2urvI23vrK8rBhKjcLRmCToIL3ATfd4vtpOk0wPeVPdAN0wCaAAoSY7RvpQC
X-Gm-Gg: AY/fxX6I4mPNXl4Mxt9ngxQCVPo0n0J/tWy5Y1+K+KcI1bg2hmlfqmaQFD6F96Pr/1T
	1W7Csizekkdb6hhyVBlUeRUAMDFwLWdXNQATGg48XR4vkiG5yEJIz2ykF2qA5JIqbljJ7HZjTJT
	wIOX2N5EPe+FHP5uH6BxXH3XKcrkZIlEDo09u8eMtIiTzWt2ZJk4jlNzqtVrJVxPwNiQhtnZ9qW
	sFzS+1GHY3MaS0GvNAA/y3oPnWltJF+qwthAKARQkhuviUo4Ztz2k/vQvmtVbteNY40qDyjcI7W
	EsEKwY99pZDL/xPQwVr7YMHvdQeUCxQEvhyXLLdNaU0GP9CLG//mA76690trucCeGNlzbx3OKnh
	8qji5+p8sOLEfnVi5mb0swhzaAk0HmnbD1y79LtpDPxxMubgZlBxp6j1+qlv/pci6QafHtTZ9ud
	mL4h7O
X-Received: by 2002:a17:903:4b08:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a2f2424895mr139884985ad.24.1766546460876;
        Tue, 23 Dec 2025 19:21:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEr7VP+KbQ00quvc7LFltxfmgOjKAAucSk+LjkUtqG/DLGixAnZdWekuOsy1KNQfere6mRwcw==
X-Received: by 2002:a17:903:4b08:b0:2a0:d692:5681 with SMTP id d9443c01a7336-2a2f2424895mr139884815ad.24.1766546460362;
        Tue, 23 Dec 2025 19:21:00 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66bd3sm139239235ad.1.2025.12.23.19.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 19:21:00 -0800 (PST)
Message-ID: <9681baad-08b2-4935-a3d1-587458c3502f@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:20:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
 <zavjg2ciefd6fmlnqryzvo6vmtlk3xmns62hn2kwctpgtstski@p6kk3tn6c6bw>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <zavjg2ciefd6fmlnqryzvo6vmtlk3xmns62hn2kwctpgtstski@p6kk3tn6c6bw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNSBTYWx0ZWRfXyekhm8QmE8TI
 UDknPn/5QjuZhqmzcFeMtMKZi1A5ogULILdcOUleuKmmuLt/JO0hiMwFODMoc5Wrxz11E8CaXd4
 h7cJSCci9gMRC6TyraGiWvMdnqyJOdnTstfNiLiDdjtXew2iPGCjZ1arF6960c9Nb3lKzLR69nf
 tv3IMrDDdynbItCoEublOTEjseeNH4H3KeAXp7P73Aut5qdeQGN6aKXgftj+BTT80pmBLA+l7tH
 GKyQQMTM7dJ1xD/jtHhqB4H9dHZM9VsOiL3c8npS5BFvkgSkV/dcC8R+WzgJEj+7ZQ4sl+u5pDc
 auJSDsGPSY3sxDGFq0SWKu/IE8N0yfKxE0FTl5Lhm+ZiRO7K6jQPiT/K1yWJkJc97jEzSPi/9M4
 g/GznjjjxF/ZcgMrHOTGEUTNlWJSwpI0za0M93XXS27R12ppZIJyBZYMvZ37m+bd2RzW5Ticgoo
 zOxSgUNe/7PB1fUhYvA==
X-Proofpoint-ORIG-GUID: XwkExEh-SnFZgCAW2nb6nycduF1uNLgH
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694b5c1d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AeEh3y5A5LJfT7oo4OEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: XwkExEh-SnFZgCAW2nb6nycduF1uNLgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240025



On 12/24/2025 4:15 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 23, 2025 at 01:13:50AM -0800, Jingyi Wang wrote:
>> From: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> 
> So, two names start from the capital letters and one from a downcase
> one?
> 

will fix


>>
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits and performing ping
>> test.
>>
>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the
>> subsystem is ready either at the first check or within a 5-second timeout
>> and the ping is successful, it will be marked as "attached". The ready
>> state could be set by either ready interrupt or handover interrupt.
>>
>> If "early_boot" is set by kernel but "subsys_booted" is not completed
>> within the timeout, It could be the early boot feature is not supported
>> by other entities. In this case, the state will be marked as RPROC_OFFLINE
>> so that the PAS driver can load the firmware and start the remoteproc. As
>> the running state is set once attach function is called, the watchdog or
>> fatal interrupt received can be handled correctly.
>>
>> Signed-off-by: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5.c      | 87 ++++++++++++++++++++++++++++++++-
>>  drivers/remoteproc/qcom_q6v5.h      | 11 ++++-
>>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>>  drivers/remoteproc/qcom_q6v5_pas.c  | 97 ++++++++++++++++++++++++++++++++++++-
>>  drivers/remoteproc/qcom_q6v5_wcss.c |  2 +-
>>  6 files changed, 195 insertions(+), 6 deletions(-)
> 
>> @@ -247,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>   */
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  		   struct rproc *rproc, int crash_reason, const char *load_state,
>> -		   void (*handover)(struct qcom_q6v5 *q6v5))
>> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
> 
> Separate lines
> 

will fix

>>  {
>>  	int ret;
>>  
>> @@ -326,6 +329,7 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	}
>>  
>>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>> +
> 
> Nope, unnecessary empty line.
>

will fix
 
>>  	if (ret == -ETIMEDOUT) {
>>  		dev_err(pas->dev, "start timed out\n");
>>  		qcom_scm_pas_shutdown(pas->pas_id);
> 

Thanks,
Jingyi

