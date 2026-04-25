Return-Path: <linux-arm-msm+bounces-104513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO17HYuZ7GlRaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:38:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE41D465F25
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 12:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56C0E300EF8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 10:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8469839479E;
	Sat, 25 Apr 2026 10:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goX/mQHt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FaPL66+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96737E2F5
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777113479; cv=none; b=u3oz+/Q5BFaZNqzxXlzUOEWEVLFsZFVxYly/4XOq8HYcPPJfupnQks6AczJV/iqolJ+cAM4SGT5nGwqIlkqKKul335Yw3zR2i2F1Rs9rsTVBlJ5+Gd3A4RMWPPQIqKXwtsnDmslCr/zofT2/2117Uw+dwY+fauax6YqYNUV4iqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777113479; c=relaxed/simple;
	bh=hIWO3xsFueLuE07chwS/HdIA+QZtOhP45cjCo+Trttk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lgp54CC+37iOCKZXu6ZQ1q68+VxYeczgS0YI5oMuk/V1eq/BEM0WGMYxiBYWmjkBRAQvMrzpH/fGEF+rk01J8RRuXz3omN81vikA/MCGeSbol3HBK5ZhcMHLDUf0goGk2GzznbOLaMHMSNusDOAEEg/atWbFZheiwPMOppAIDHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goX/mQHt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FaPL66+o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3JQqx1727122
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 10:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSDt1S1a3dmf5cPvvpVEpChdYIhaznxbJLwuGc74L9E=; b=goX/mQHtUdIMrdW9
	0tAfW8Iw2Mdn9h8jiJMIomfqVre8YtCc85gw1kkGHf8aNL0d/3CKn8tfEzp1z8/n
	Df7i8NVvZpKkyaD95mTTP02Frtj2bbm8LBnmHFl6oW4cUvAnFtraIsv9qZC77I2S
	J3I9Y94EC8GT4OcdCCgN09vlLJ2rV+uyTb9chDS2w0ODUmLNV99Z7O6j+vd5vuie
	vAe9FQNN0dOOXXuFJNmcqPKza6UFGiHUixsS+9Vl6qFhDAFlrEpsTnr5vfNZjG86
	J4MPodjN8J5n22unf+trNSV0sV+rqQtrXDD3xwJ0rKJDuA8X5NMXuq68y1EPkX6Z
	4fYUVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkx8r6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 10:37:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e6ee9444so92266735ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777113476; x=1777718276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wSDt1S1a3dmf5cPvvpVEpChdYIhaznxbJLwuGc74L9E=;
        b=FaPL66+oLPdfRY/d2XvT8NtnyfMQwFxWsWAgR94uj/6QTDwhHQm/wvlYjL6wMyZBef
         wh/XZEetErWYGwirR/SXL4YVmVzb38fNPMumPCLp8nLZHwzhhpRNbj/5G4wEoHUo/4V9
         d2SuEj6WWbESVofk2ijYsy7gi7+ypzzrOm0/+Ug04mgq88qIvyJeW4VEt7MmVSUUuxJg
         S73OZ8kDzvyoAtyyOGfl65UXjQLP2IeLqyXOSiDGSFWQad3oTSuiSRzn+p1b+DGbW4nN
         0wCTXWjbXL24Qv9CGd/K23nFM69mTBUhf7Q3GEDVHE/2hmFV42stSQpH5RfZw6i5N2Ho
         9l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777113476; x=1777718276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSDt1S1a3dmf5cPvvpVEpChdYIhaznxbJLwuGc74L9E=;
        b=OmhjEI0jmbJj2DJdhibJMJOKAY4zCvRm1/07DtYBqGZOc6N4Xjzv6CSuHWhYeVg6dT
         preFWIlwTs3gdRPEhw6ULGH8eGGsM6lz17ZQb4ChJ3/ieSCwsxNh4sfl9MU97RC55h2x
         yP+5pMTMzr1e8/Huo+iWx9neNrGX3o4beglzVN8ZdSWEc33s+gQWcBHjtDFG/vuD/mlV
         Aso16l+Z74XYgVbr+iSJrg6PtPpCBT2ZB+Q+3eMBxdH6dkANMzrmyRwjcgqWqd7HxeLP
         4W7V7AFoyphCJLicV8gHk4e75nEC26B4VMRJXNHENIOoQ19d0SflRvJ/+x+NibQqc7R8
         BnIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tbiOicfv8/w3HPJfThDmYI5q0OQi3YrSNM8aQ1GhzFk0wWCRaB/gsk7PptdtxAOYxm8s4F/u8yzan3JS0@vger.kernel.org
X-Gm-Message-State: AOJu0YwureWoUK0xxoUbspRBK3IsOgE2RNVx9HaupvQhS/K+JTlINWz3
	8im0JW8Wl8jBs2X7XyNNyGjpi0ub/SEDIW62Fx8M3EvoPm2nhYET0M3bQ+Tjed7kqMHIl/7q89A
	t0rSVqen3Pjj5bauANz4PJl8Uzn+hdlFsNeAq9RQPMsLxKfK/VqZJkdJznhEGEYib+of0
X-Gm-Gg: AeBDiesD4jHrFdEHWAqysqBFBJmEUNyU3ZLJx2AGzOs1QaPvFT7wq/WLNbK2I8IFGGC
	O5dI5KPh3sBgwL54ZO267WkpmdVkrJie2mLB/0F+fbR1QpDNFbbpPSR7uz0ryJ+zlIp3dZ16Lsw
	scgk7x36tcc87O6z2jbVzkDtHJltqxZ1b17ThHCe4InVn0ji4S9P3YJoKOhoHXQNbJ+qpONTi0t
	G/RSBt5NHaQQ6e4/9jMH6OVR1iEl6ko3rR8NxcbqLGnWeRcBUIUoeMgKJuOI+5ZHlSPze6/KjZ5
	G5eiHJHkgZbIz6P+hb82QapMcZiAUCGoRiLiEkNzmjGl4PXz4wn3D9PGbP5B0RJcrPwQcP8Cc43
	pQMtqk+bqh0jK8u9ggDZ8phXpGE34VhNblZubWcbmq+vihmhFgVLBYwUvOg0t1O/9
X-Received: by 2002:a17:902:9002:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2b5f9e7bb41mr207335465ad.14.1777113475512;
        Sat, 25 Apr 2026 03:37:55 -0700 (PDT)
X-Received: by 2002:a17:902:9002:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2b5f9e7bb41mr207335045ad.14.1777113474836;
        Sat, 25 Apr 2026 03:37:54 -0700 (PDT)
Received: from [10.216.33.139] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm246035275ad.9.2026.04.25.03.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 03:37:54 -0700 (PDT)
Message-ID: <7e619cef-ed08-4454-905c-05ab0939d60e@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 16:07:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 4/4] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, lumag@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
        thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
        subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org
References: <20260130115421.2197892-1-jishnu.prakash@oss.qualcomm.com>
 <20260130115421.2197892-5-jishnu.prakash@oss.qualcomm.com>
 <addDTiI8MB2b_AzJ@mai.linaro.org>
 <12d683aa-44c2-4e2d-8459-78ba9f2ab61e@oss.qualcomm.com>
 <f46ef4af-1c05-4473-9226-901d3393ea89@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <f46ef4af-1c05-4473-9226-901d3393ea89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3JsCooxVRP7HJytywO-P78Gk3fEuOD-D
X-Proofpoint-ORIG-GUID: 3JsCooxVRP7HJytywO-P78Gk3fEuOD-D
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ec9984 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=N3BaCdbXddXG3PYp0CMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEwNSBTYWx0ZWRfX0TUDR1fU1OLN
 pY44kCW/9/NfXQbZZPYxFkrXLioEELvD5QIvvmDRC1C/twRqnMI6LQDUxE5HsILzcOpHeUqQx3G
 S9raMrp8akEmDFi+8NHgYz+9tRYQAYL9ZWpY+Wcrapn1sEBqgLCP9Qn4ebuzT76n3BdpRnPUYBf
 pK7p27gD3Ib1k66hscmX5WYyZjXg9lrhehnci7GG48cN73MnL1rT15aU9ke1hY7YmtGdVeg3bkg
 yiqzWU6McrpdVhFzsoVxwJ9O/Hr9ThvafldbbJVCnQm10hRbsO9nFZqVGh9o4lxkr+W4sFqfPqQ
 b6VBDcwZO65CXOxmxe7RTjjZwk6wrZ+ZFhV+zI7/1z9aCiqkhLaFXZOd0l62vyr2jGU3DUkZS3z
 h//pxCBdaONr9CFyJ7HDzTFg5M9H0sKcHpIceueulJtFp4ZSfFUpZ5pPInqaOSmib077o0K1VEo
 CxDW/+yPBSKyhoDGiag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250105
X-Rspamd-Queue-Id: CE41D465F25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linaro.org,gmail.com,intel.com,arm.com,vger.kernel.org,chromium.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104513-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Daniel,

On 4/17/2026 2:42 AM, Daniel Lezcano wrote:
> On 4/16/26 10:05, Jishnu Prakash wrote:
>> Hi Daniel,
>>
>> On 4/9/2026 11:42 AM, Daniel Lezcano wrote:
>>> On Fri, Jan 30, 2026 at 05:24:21PM +0530, Jishnu Prakash wrote:
>>>> Add support for ADC_TM part of PMIC5 Gen3.
>>>>
>>>> This is an auxiliary driver under the Gen3 ADC driver, which implements the
>>>> threshold setting and interrupt generating functionalities of QCOM ADC_TM
>>>> drivers, used to support thermal trip points.
>>>>
>>>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> ...
>>
>>>> +
>>>> +static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
>>>> +{
>>>> +    struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
>>>> +    int ret, sdam_num;
>>>> +    u8 tm_status[2];
>>>> +    u8 status, val;
>>>> +
>>>> +    sdam_num = get_sdam_from_irq(adc_tm5, irq);
>>>> +    if (sdam_num < 0) {
>>>> +        dev_err(adc_tm5->dev, "adc irq %d not associated with an sdam\n",
>>>> +            irq);
>>>> +        return IRQ_HANDLED;
>>>> +    }
>>>> +
>>>> +    ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
>>>> +                 &status, sizeof(status));
>>>> +    if (ret) {
>>>> +        dev_err(adc_tm5->dev, "adc read status1 failed with %d\n", ret);
>>>> +        return IRQ_HANDLED;
>>>> +    }
>>>> +
>>>> +    if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
>>>> +        dev_err_ratelimited(adc_tm5->dev,
>>>> +                    "Unexpected conversion fault, status:%#x\n",
>>>> +                    status);
>>>> +        val = ADC5_GEN3_CONV_ERR_CLR_REQ;
>>>> +        adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
>>>> +                       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
>>>> +        return IRQ_HANDLED;
>>>> +    }
>>>> +
>>>> +    ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
>>>> +                 tm_status, sizeof(tm_status));
>>>> +    if (ret) {
>>>> +        dev_err(adc_tm5->dev, "adc read TM status failed with %d\n", ret);
>>>> +        return IRQ_HANDLED;
>>>> +    }
>>>> +
>>>> +    if (tm_status[0] || tm_status[1])
>>>> +        schedule_work(&adc_tm5->tm_handler_work);
>>>> +
>>>> +    dev_dbg(adc_tm5->dev, "Interrupt status:%#x, high:%#x, low:%#x\n",
>>>> +        status, tm_status[0], tm_status[1]);
>>>> +
>>>> +    return IRQ_HANDLED;
>>>
>>> This ISR routine should be revisited:
>>>
>>>   - no error message inside
>>
>> I'll drop all the error messages, but does that also include the debug print at the end?
>> In addition, the print for conversion fault is ratelimited and may be useful as it
>> indicates a possible HW issue, can I keep that?
> 
> It is not a good practice to put an error message in the ISR. If the conversion fails, then the thread blocked on the read will timeout and then show a message.
> 

OK, I'll drop all the prints in the ISR.

>>>   - use a shared interrupt to split what is handled by the ADC and the
>>>      TM drivers
>>
>> I'll make the required updates in the main ADC driver and this driver to share the first
>> SDAM's interrupt.
>>
>>>
>>>   - do not return IRQ_HANDLED in case of error (cf. irqreturn.h doc)
>>>
>>
>> I'll replace IRQ_HANDLED with IRQ_NONE at places where errors are returned.
>> But in the case of conversion fault, I think returning IRQ_HANDLED may be
>> more appropriate because we do handle it by clearing the status, to
>> allow subsequent conversion requests to be sent.
>>
>> What do you think, is this fine?
> 
> It is a good point.
> 
> Actually, if get_sdam_from_irq() or adc5_gen3_read() fail, they will return without clearing the interrupt flag, so we should potentially end up in an infinite loop.
> 

I went over this discussion and the code again and I need to explain a few things.

First, please note that individual PMIC drivers do not handle interrupt clearing by
themselves - they are under the SPMI PMIC arbiter (drivers/spmi/spmi-pmic-arb.c),
which is an interrupt controller and the arbiter driver handles IRQ clearing internally
for all the PMIC drivers under it. So we won't be clearing the interrupt explicitly here.

> So the status should be cleared at the end with IRQ_HANDLED. IRQ_NONE returned if it is for another subsystem.
> 

Maybe my explanation above wasn't sufficiently detailed - the "status" I mentioned
above is not related to the interrupt by itself, it is just the ADC's status register
reading. If it indicates an ADC conversion fault, the fault has to be cleared by
calling the function adc5_gen3_status_clear() before we can make subsequent conversion
requests (like for .set_trips) on the ADC.


There are 3 main reasons for which the Gen3 ADC interrupt may fire:

1. End of conversion for immediate conversion request (handled in main ADC driver)
2. Threshold violation for TM conversions (handled in this auxiliary driver)
3. Conversion fault (handled in both drivers)


I think it would make the most sense if I make changes so that the ISRs
(of both main and aux driver) return IRQ_HANDLED only when any of the above
3 cases are detected and they return IRQ_NONE in case of errors or when the
interrupt is confirmed to be for the other driver.

Does this sound fine?


> If you think there can be a significant number of errors in the handler may be you should add statistics but later in an additional series if it makes sense.
> 

I think conversion and register read errors are rare, so this may not be needed right now.

> [ ... ]
> 
>>>> +    adc_tm5 = prop->chip;
>>>> +
>>>> +    if (prop->last_temp_set) {
>>>> +        pr_debug("last_temp: %d\n", prop->last_temp);
>>>> +        prop->last_temp_set = false;
>>>> +        *temp = prop->last_temp;
>>>> +        return 0;
>>>> +    }
>>>
>>> Why do you need to do that?
>>>
>>> The temperature should reflect the current situation even if the
>>> reading was triggered by a thermal trip violation.
>>>
>>
>> This logic is needed to handle a corner case issue we have seen earlier.
>> In this case, the ADC_TM threshold violation interrupt gets triggered ,
>> but when get_temp() is subsequently called by the thermal framework, the
>> temperature has fluctuated and the value read now lies within the thresholds,
>> so the thresholds do not get updated by the thermal framework and the violation
>> interrupts get repeated several times, until there is a get_temp() call
>> which returns a temperature outside the threshold range.
> 
> Oh, that's clearly an issue with the thermal framework, not the driver.
> 
>> In order to avoid this issue, when the interrupt handler runs, we find the actual
>> temperature read in ADC_TM that led to threshold violation by reading the ADC_TM
>> data registers and we cache it and return it when get_temp() is called in the flow
>> of thermal_zone_device_update(). Any subsequent calls to get_temp() would
>> return the actual channel temperature at the time.
>>
>> This is only done to avoid delaying thermal mitigation due to temperature
>> fluctuations. Do you think this needs to be changed?
> 
> I think it is an interesting problem certainly impacting all thermal sensors. It should be fixed in the thermal framework itself if possible. Just drop this portion of code and let's handle that correctly in the thermal framework.
> 

Alright, I'll remove the check for last_temp_set and just get the
actual temperature at this point.

> [ ... ]
> 
>>>> +    dev_dbg(adc_tm5->dev, "channel:%s, low_temp(mdegC):%d, high_temp(mdegC):%d\n",
>>>> +        prop->common_props.label, low_temp, high_temp);
>>>> +
>>>> +    guard(adc5_gen3)(adc_tm5);
>>>> +    if (high_temp == INT_MAX && low_temp == -INT_MAX)
>>>> +        return adc_tm5_gen3_disable_channel(prop);
>>>
>>> Why disable the channel instead of returning an errno ?
>>>
>>
>> This is the convention we follow in our existing ADC_TM driver at
>> drivers/thermal/qcom/qcom-spmi-adc-tm5.c. If both upper and lower
>> thresholds are meant to be disabled, we disable the channel fully
>> in HW to save some power and it can be enabled later if this API
>> is called for it with valid thresholds.
>>
>> Is it considered invalid in the thermal framework to try to disable
>> both thresholds? Should I both disable the channel and return some
>> error from here?
> 
> Well, if the channel is disabled, then the temperature sensor of the thermal zone is disabled, consequently the thermal zone is disabled from a HW POV but enabled from the kernel POV.
> 
> Why not add the 'change_mode' ops and then disable the thermal zone (+ pm_runtime) ?
> 

I have a doubt about this part - if the thermal framework sends threshold values
of (-INT_MAX, INT_MAX) in the .set_trips callback, doesn't it mean that the
framework is already trying to disable the thermal sensor? 

Or does it just mean threshold monitoring functionality can be disabled for now,
but other functionality like temperature reading is still expected to work?

Please note that adc_tm5_gen3_disable_channel() only disables the threshold
monitoring and interrupt generation functionality - the get_temp() call to read
temperature will still work. Perhaps I should not have used the wording
"disable the channel" above, as calling adc_tm5_gen3_disable_channel() is not
exactly the same as fully disabling the thermal zone.

Please let me know if any change is needed there - should I return any error
after calling adc_tm5_gen3_disable_channel() ?


> [ ... ]
> 
>>>> +    /*
>>>> +     * Skipping first SDAM IRQ as it is requested in parent driver.
>>>> +     * If there is a TM violation on that IRQ, the parent driver calls
>>>> +     * the notifier (adctm_event_handler) exposed from this driver to handle it.
>>>> +     */
>>>> +    for (i = 1; i < adc_tm5->dev_data->num_sdams; i++) {
>>>> +        ret = devm_request_threaded_irq(dev,
>>>> +                        adc_tm5->dev_data->base[i].irq,
>>>> +                        NULL, adctm5_gen3_isr, IRQF_ONESHOT,
>>>> +                        adc_tm5->dev_data->base[i].irq_name,
>>>> +                        adc_tm5);
>>>
>>> The threaded interrupts set the isr in a thread and from the thread
>>> handling the event, there is a work queue scheduled. Why not use the
>>> top and bottom halves of the threaded interrupt ? Hopefully you should
>>> be able to remove the lock.
>>
>> Yes, I can use the top and bottom halves of the threaded interrupt as you
>> suggested. But what exactly do you mean by removing the lock?
>>
>> If you meant the mutex lock used in this driver, we cannot remove that.
>> This is because the ADC_TM driver needs to write into several registers
>> shared with the main ADC driver for setting new thresholds, so we
>> have to share a mutex between the drivers to prevent concurrency issues.
> 
> When using a workqueue tampering with registers while an interrupt handler is doing the same, the lock is needed.
> 
> But if the workqueue is replaced by threaded interrupt, the lock *may* not be needed because the design may prevent race conditions.
> 
> That may be not true in this case, I did not investigate deeper in the code to figure it out. Let's see the next version
> 

I think a lock will not be needed with the change I planned, but you
can judge it in the next version.

Thanks,
Jishnu


>> I'll address all your other comments too in the next version of this patch.
> 
> Thanks
> 
>   -- Daniel
> 
> 


