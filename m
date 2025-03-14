Return-Path: <linux-arm-msm+bounces-51452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C41A6187C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1841E17A5B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14A92629F;
	Fri, 14 Mar 2025 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+HRScj9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B70674BE1
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974469; cv=none; b=RmuEV0OK8HykyZ1yCcfmkUdWkKony8Hn4SJwnDTRvEjNsFX/l6kzEY6IoceHkvPeHRaUKVwumyrJHcVt0U/xdoKoug0tvlli+KpUrALvVC0i/KEf82xS0Q+9LdGZkR6HcfdDCS7D4iNq29e+TzGH8KE0MtLgYrS8fJ6+kILl95k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974469; c=relaxed/simple;
	bh=Cz9IqdGJSsbrOHinN46PD3f22s2tvWPRm3X5ynX46w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWmY7xPkl9/VirLbwEXO1VzyKPuzC0FzyvrQ+8dne1yz+uzyNucZvqgzix9UtiXQyOyKOh5xRv+P+12NvM5rWyVhqQ4ziRaWbnszw2f20m8z0cgS4iAB+Iq2taAc+xD9b4e8CT2ymdeTCGWqxX6kyfrNsfWVH4J3iqUSbP81TO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+HRScj9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EAFK6D027330
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3trivdQ7o12LbJ9lcuWkhugVFBzjQg8EKH9E1tSPZdY=; b=I+HRScj9f9SX6ztR
	7/XS2c7uUnOIihLAdLDNe+uAdbKJSy4UgkoVW4wUhPt2fDFleY8mgMagU53X16Dq
	psyxLauyt/84+yQcyfXZxgpXoUmFJ/vw+h198HVmDyVRswCRRiR7gG1kynU3c3Pi
	lf/RNjVvOC1co+iWqeWD+amkS8zQS7Z2fO5QupKGGRSZrWevgT2dIPw3JBTJMhAD
	3Rb2GhDa76e3Z1OdBeSE2S+o1qgL9ekx6BbQqNYsEsaIR6ZexoqB6QSKO5nZIfHo
	qr1gWxaloQYC2tiSxU8Fw5K9kbq3ZMvNS8lsm/kZZRFN3A8cyIqI41CV3OtPov8O
	OR5PRw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2q20tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:47:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225ab4b8fe9so35422985ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 10:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741974466; x=1742579266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3trivdQ7o12LbJ9lcuWkhugVFBzjQg8EKH9E1tSPZdY=;
        b=NSt7xDp6BgPQIL72zr8vhud7bEbrR1X7uL4cvwjXsh088uIKitXH9F600ET89OwI9A
         08V8sBRWv52stmgPGWJXpf1/9pmNVNJOzB7S2QQ09sZOU1qKVXi2LTGXPJ9BRJ97uKad
         HhdNEopGlmHjCrbOVXsJoSv59WdSJhIzGSEcR66RkdHtEZuV8/9vTZtNhiVc64sr1vVY
         YN84EaxEGnJcn6e04e8vTJMS1rT2u9EwFa4CKu0rkfaBd1OSJNYRGoxjVZR6M+B0MLiK
         Xciy/tyFMrsKkVrytxTTxj31whz5F6DnxM6hdCRyt65+tlABKOuXEEaqITj+Aj7+zgXi
         +CKg==
X-Forwarded-Encrypted: i=1; AJvYcCUYAI2ggKYhc1SQei4qO8wKMh7iumyc4gqwvMSDacW03DTC3Vkmm14ynyl7Ci3JKDe/13JVannoLTSKDKfd@vger.kernel.org
X-Gm-Message-State: AOJu0YxTNO5klM5XFNA4VtuYXVpWUKTVu5y884e4JPONUbTrTABU63YF
	yuN5w5rexwhUPJw+EJJ63atIPsHMEIxiiAcm8uicHjxbJHsMKePuvscypOW60PREACtu8f4DjeG
	WpczLIA/zRrsDqNpo4XTMevnbHP2OdnjHGPLfDkj00obmRK64knDzLKoE+yUFt0Bc
X-Gm-Gg: ASbGncsJIWEgfoLRKLkA/hmGIEs7BY9RRNx24s0pIZMjcg4ugkwZbuqiriFdyRkMAZF
	f2B7ORPlKZUwzfBcZQx6qrIWkBD50F9hRk2VNZ1yMXxZM5skakHLMnGwOGdGa75f2UXKcau2J0o
	mjqg1Cn8BQL0FFZWKBkEYRhiAOsFbv9lng5dH6yS/4yKU8MZO5Tm/VFJ37ukQU/JW35tS+cBJ0/
	1ePZRsu57fhz/MuU57IAgA16VcsscuCpG2ddmswBD7MymigDGeYMgP0COvYwq4Mfk8DYCjdn0DT
	jFWPZSQ5xRs42Yq2AHpK75lDjB2TBgqam+y6uTU1+FqVghUCjDDP5+IBPYzjqGcE8Q==
X-Received: by 2002:a17:902:e74e:b0:220:ea90:191e with SMTP id d9443c01a7336-225e0a240c7mr48640775ad.4.1741974465997;
        Fri, 14 Mar 2025 10:47:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYv8YTdV6WeQaKhcu70Frbma2RwhA504uIwvPTShg3Mb7poSz3L627bW8Os3/DugUp+Zh6Sw==
X-Received: by 2002:a17:902:e74e:b0:220:ea90:191e with SMTP id d9443c01a7336-225e0a240c7mr48640515ad.4.1741974465560;
        Fri, 14 Mar 2025 10:47:45 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d69sm31177545ad.158.2025.03.14.10.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:47:45 -0700 (PDT)
Message-ID: <6df3f39d-d736-4142-8123-b9afbe8a9848@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:47:43 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Address conflict between power_up and
 syserr
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
 <20250314054651.iu6t3q3o5za2zrjs@thinkpad>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250314054651.iu6t3q3o5za2zrjs@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d46bc2 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Md2aUQyrscPzz-KMR_gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LyqqvHk1dF7ougz6xZNORbSH9S7bV3oJ
X-Proofpoint-ORIG-GUID: LyqqvHk1dF7ougz6xZNORbSH9S7bV3oJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140139

On 3/13/2025 11:46 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 06, 2025 at 10:32:26AM -0700, Jeff Hugo wrote:
>> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>
>> mhi_async_power_up() enables IRQs, at which point we can receive a syserr
>> notification from the device.  The syserr notification queues a work item
>> that cannot execute until the pm_mutex is released.
>>
>> If we receive a syserr notification at the right time during
>> mhi_async_power_up(), we will fail to initialize the device.
>>
>> The syserr work item will be pending.  If mhi_async_power_up() detects the
>> syserr, it will handle it.  If the device is in PBL, then the PBL state
>> transition event will be queued, resulting in a work item after the
>> pending syserr work item.  Once mhi_async_power_up() releases the pm_mutex
>> the syserr work item can run.  It will blindly attempt to reset the MHI
>> state machine, which is the recovery action for syserr.  PBL/SBL are not
>> interrupt driven and will ignore the MHI Reset unless syserr is actively
>> advertised.  This will cause the syserr work item to timeout waiting for
>> Reset to be cleared, and will leave the host state in syserr processing.
>> The PBL transition work item will then run, and immediately fail because
>> syserr processing is not a valid state for PBL transition.
>>
>> This leaves the device uninitialized.
>>
>> This issue has a fairly unique signature in the kernel log:
>>
>> [  909.803598] mhi mhi3: Requested to power ON
>> [  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error received from device.  Attempting to recover
>> [  909.803945] mhi mhi3: Power on setup success
>> [  911.808444] mhi mhi3: Device failed to exit MHI Reset state
>> [  911.808448] mhi mhi3: Device MHI is not in valid state
>>
>> We cannot remove the syserr handling from mhi_async_power_up() because the
>> device may be in the syserr state, but we missed the notification as the
>> irq was fired before irqs were enabled.  We also can't queue the syserr
>> work item from mhi_async_power_up() if syserr is detected because that may
>> result in a duplicate work item, and cause the same issue since the
>> duplicate item will blindly issue MHI Reset even if syserr is no longer
>> active.
>>
>> Instead, add a check in the syserr work item to make sure that the device
>> is in the syserr state if the device is in the PBL or SBL EEs.
>>
> 
> Don't we need a Fixes tag?

I don't recall seeing documentation saying that Fixes tags are 
mandatory.  Yes, I agree, they are helpful and should exist.

I am finding it difficult to point to a single commit that I can say 
introduced this issue. I believe we started seeing it with "bus: mhi: 
host: Add MHI_PM_SYS_ERR_FAIL state", but I don't think that commit 
actually introduced this issue. It seems like a coincidence that the 
issue was first observed with that commit.  I suspect that this issue 
has been a problem since the introduction of MHI, but I am not confident 
since the relevant code paths have radically changed since then.

Given I don't feel confident in identifying a commit, I felt it was 
perhaps better to not list one at all.

Do you have any suggestions?

> 
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>> index 11c0e751f223..3dff0f932726 100644
>> --- a/drivers/bus/mhi/host/pm.c
>> +++ b/drivers/bus/mhi/host/pm.c
>> @@ -602,6 +602,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>>   	struct mhi_cmd *mhi_cmd;
>>   	struct mhi_event_ctxt *er_ctxt;
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	bool reset_device = false;
>>   	int ret, i;
>>   
>>   	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
>> @@ -630,8 +631,23 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>>   	/* Wake up threads waiting for state transition */
>>   	wake_up_all(&mhi_cntrl->state_event);
>>   
>> -	/* Trigger MHI RESET so that the device will not access host memory */
>> +	/*
>> +	 * Trigger MHI RESET so that the device will not access host memory.
> 
> Move this comment before 'if (reset_device)'.

I'll move it, but seems a bit weird to have the explanation for the 
logic of the conditionals (particularly the ones added by this patch) 
after them in the code.

>> +	 * If the device is in PBL or SBL, it will only respond to RESET if
>> +	 * the device is in SYSERR state.  SYSERR might already be cleared
>> +	 * at this point.
>> +	 */
>>   	if (MHI_REG_ACCESS_VALID(prev_state)) {
>> +		enum mhi_state cur_statemachine_state = mhi_get_mhi_state(mhi_cntrl);
> 
> s/cur_statemachine_state/cur_state

We already have a cur_state in the function, that is generally used for 
Host state and here we are reading the Device state. I felt that 
avoiding mixing the meanings was perhaps in the interest of the reader, 
but reusing cur_state appears possible.


