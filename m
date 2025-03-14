Return-Path: <linux-arm-msm+bounces-51449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB21A61784
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6853BF46E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E53D20459A;
	Fri, 14 Mar 2025 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otAqmW8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF34202C55
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973175; cv=none; b=h+z8KfyOWoe2EPmeJdi1Qav08eOEOGlv6I4a/gLC0rDsF6414PwLYbY3T4uKgE6eh7iSjsTVY+4ewVQ8OppQsVJ/Dpy2Dz3Mbra/2iS42KGccYk2S8QM+OM7epkoJae2v7FU5oqZD8D+V0FUsiu72kLJpo/dXhgrILqC3tj/cT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973175; c=relaxed/simple;
	bh=+okW4+RAgFVmyFVr/MxQPEoMQlyAaRDfGnf32s2CINc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XaHxv8ZzuSr/zvLgUldVy9Dlp5zlo4JvmjNk1NgHlSbG3c67mFy9hXefcXcc8EhoUorBpVLzKc7e/7tFrVf2HKMaVf2mbb/mRc3AShRFcGHuTBfBz64/WKQ9p5fqzrIOZ2B6fGIltsvGObrZv44PAdpejf28YzwakSeOlXIqWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otAqmW8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EBkh6e027314
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5DBgBJ4SmhP5QCOBqNFl6JYfXejQxJnNsneIADsXsQ=; b=otAqmW8F3qsafeng
	Gwm54SMAETBHWbySUXvuvJ0lMhkgLVNmBborZhXmO258yFb/gin3B4eEd/pzddHn
	MohzmK/U/OycH+vCCmpYQUU8NBIsWwtkGy06xWafXCDM+PTYRDx/LoCTHJIB0dwY
	0I1c3nSA7uP5847trFR7u76Tg8AHFqircGggnx5uoJpTG42FSIZOYC7olDq9EWLg
	6PFwu5H1tUdRNjPf0gmdb6C+K7KmDnznOPCS+akOJlv4diW+mF9P2SZxXnyyrFoE
	rfMYUvVbjjkn8YN6ZW0SyaimOhFgLMgvE3AuZGcSn9aG2BImP2ZBFP7UmS3Bhpn7
	WUYhZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2q1y1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:26:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225ab4b8fe9so35227185ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 10:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973172; x=1742577972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5DBgBJ4SmhP5QCOBqNFl6JYfXejQxJnNsneIADsXsQ=;
        b=X3nPEj9tk8sQ1rScpjynExsXcyhd1uSRWI7tjh3OlPCIAsORPWz7LqYAmimuWJHu9F
         5G4Tr8i7UFqagawi7Wq3qaQY46gKErgg8zwEE90g+lizRgpDGupIdobUqaar+wWLuOG6
         709yMsfal6W+v7gZsKjRABY4xxiOZfI5pixgW8+3LSH0MVjnzJZdBSh/kB4xsR4mjLSs
         kUOzv8cVdROfz+o0N135Cnszo8utAQT7DUAxCxH5eZiEEjpeG31izlM/akkjRjqkkHsg
         cEa22VNtJSdl9H7uXPZbqkjhUBhcJlf9UXf0/Qu02n5q9mSqFwAydXTzMN3QQaBDaAVL
         4ptA==
X-Forwarded-Encrypted: i=1; AJvYcCWIjbEAfxjenVz5Gx/9YJqWkZLwvmttRz+LZaZQAc+Eh8WyI4eSsSxzpn+K8rhdT6ZamdXEQKMbyTn5G0Vp@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNG7CPCje673IWutFs9tC9CjjlVVTB7IMosJvQJ9fvR8+ry+W
	kYn2H6pgYf3aOjgLTCe6eKI3Y0O1u36jBudd5/I8GxA00AUHk2VRzEA7zD3lKkjMJFxRPhc4Ool
	8smM+kJObPXOqoJbbafmsrgpfNjsw9QoK7oVg9Qp/rZLoqcFhJ9iew+aGfPujXuORpGoJgKMt
X-Gm-Gg: ASbGncvVgUWcJ3fWxV5szybcGDmOuF6byV+ycHJmqWUff/q+zScU2GwECYrfNoCcyl5
	ZSIkqqsyDMZ34WwSGtEwgrZNDiydOqNpjNwsTeNn1PRJllRCHWl4Ba/X8cUxLZAdNPW4yJ/ejGd
	V28EKb2Rp9ouHCjD6Vo79QV6JRc3jdh5j8lX6Pt8T6wyMMnrY4c5mSUUVb6x6ORWoUg8lLs/Jpy
	yhXiIYfXHuQf96O/hDy2Fv7SS/B5wwRy16FUhyNDpD6gUqOPiTfdcce77wIiFJrVa8vLOpb03f0
	yr6qwiBnuJeGpvx+/RutqeTy0GTRGgg1PhZZ+B9Dai6vuohXD23JT1snBZTbE0HXlQ==
X-Received: by 2002:a05:6a20:9c92:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-1f5c1126c3bmr5066489637.4.1741973171923;
        Fri, 14 Mar 2025 10:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwAEmdbr/Vq7w+JI3H6BGHP4+f0TgBKDxJRc2Y0SP12oc1dN7y4NXGuP+XMF6fJyiEQ47HNw==
X-Received: by 2002:a05:6a20:9c92:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-1f5c1126c3bmr5066461637.4.1741973171551;
        Fri, 14 Mar 2025 10:26:11 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711529368sm3126031b3a.8.2025.03.14.10.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:26:11 -0700 (PDT)
Message-ID: <6c7189ca-172a-4621-8405-3def0ea24612@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:26:09 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Address conflict between power_up and
 syserr
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
        quic_carlv@quicinc.com, quic_thanson@quicinc.com,
        manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20250306173226.857335-1-jeff.hugo@oss.qualcomm.com>
 <6a6d8710-304a-d3b4-3721-cfda420019a3@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <6a6d8710-304a-d3b4-3721-cfda420019a3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P506hjAu c=1 sm=1 tr=0 ts=67d466b4 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5qkPrhqw8Nobq0Q6xU4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fRdMioYE3DqCuaKiqdQt4w8Uy0FvogbO
X-Proofpoint-ORIG-GUID: fRdMioYE3DqCuaKiqdQt4w8Uy0FvogbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140136

On 3/12/2025 10:54 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/6/2025 11:02 PM, Jeff Hugo wrote:
>> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>
>> mhi_async_power_up() enables IRQs, at which point we can receive a syserr
>> notification from the device.  The syserr notification queues a work item
>> that cannot execute until the pm_mutex is released.
>>
>> If we receive a syserr notification at the right time during
>> mhi_async_power_up(), we will fail to initialize the device.
>>
>> The syserr work item will be pending.  If mhi_async_power_up() detects 
>> the
>> syserr, it will handle it.  If the device is in PBL, then the PBL state
>> transition event will be queued, resulting in a work item after the
>> pending syserr work item.  Once mhi_async_power_up() releases the 
>> pm_mutex
>> the syserr work item can run.  It will blindly attempt to reset the MHI
>> state machine, which is the recovery action for syserr.  PBL/SBL are not
>> interrupt driven and will ignore the MHI Reset unless syserr is actively
>> advertised.  This will cause the syserr work item to timeout waiting for
>> Reset to be cleared, and will leave the host state in syserr processing.
>> The PBL transition work item will then run, and immediately fail because
>> syserr processing is not a valid state for PBL transition.
>>
>> This leaves the device uninitialized.
>>
>> This issue has a fairly unique signature in the kernel log:
>>
>> [  909.803598] mhi mhi3: Requested to power ON
>> [  909.803775] Qualcomm Cloud AI 100 0000:36:00.0: Fatal error 
>> received from device.  Attempting to recover
>> [  909.803945] mhi mhi3: Power on setup success
>> [  911.808444] mhi mhi3: Device failed to exit MHI Reset state
>> [  911.808448] mhi mhi3: Device MHI is not in valid state
>>
>> We cannot remove the syserr handling from mhi_async_power_up() because 
>> the
>> device may be in the syserr state, but we missed the notification as the
>> irq was fired before irqs were enabled.  We also can't queue the syserr
>> work item from mhi_async_power_up() if syserr is detected because that 
>> may
>> result in a duplicate work item, and cause the same issue since the
>> duplicate item will blindly issue MHI Reset even if syserr is no longer
>> active.
>>
>> Instead, add a check in the syserr work item to make sure that the device
>> is in the syserr state if the device is in the PBL or SBL EEs.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/pm.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>> index 11c0e751f223..3dff0f932726 100644
>> --- a/drivers/bus/mhi/host/pm.c
>> +++ b/drivers/bus/mhi/host/pm.c
>> @@ -602,6 +602,7 @@ static void mhi_pm_sys_error_transition(struct 
>> mhi_controller *mhi_cntrl)
>>       struct mhi_cmd *mhi_cmd;
>>       struct mhi_event_ctxt *er_ctxt;
>>       struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +    bool reset_device = false;
>>       int ret, i;
>>       dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
>> @@ -630,8 +631,23 @@ static void mhi_pm_sys_error_transition(struct 
>> mhi_controller *mhi_cntrl)
>>       /* Wake up threads waiting for state transition */
>>       wake_up_all(&mhi_cntrl->state_event);
>> -    /* Trigger MHI RESET so that the device will not access host 
>> memory */
>> +    /*
>> +     * Trigger MHI RESET so that the device will not access host memory.
>> +     * If the device is in PBL or SBL, it will only respond to RESET if
>> +     * the device is in SYSERR state.  SYSERR might already be cleared
>> +     * at this point.
>> +     */
>>       if (MHI_REG_ACCESS_VALID(prev_state)) {
>> +        enum mhi_state cur_statemachine_state = 
>> mhi_get_mhi_state(mhi_cntrl);
>> +        enum mhi_ee_type cur_ee = mhi_get_exec_env(mhi_cntrl);
>> +
>> +        if (cur_statemachine_state == MHI_STATE_SYS_ERR)
>> +            reset_device = true;
>> +        else if (cur_ee != MHI_EE_PBL && cur_ee != MHI_EE_SBL)
> why do we need this check? Above check will be applicable when EE is in
> MHI_EE_AMSS also. we can reset mhi only when current state is in SYS_ERR
> irrespective of the current ee.

No, it is valid for the host can reset MHI at any time - not just in 
response to syserr.  Figure 3-1 (the state machine diagram) says that 
the RESET state can be entered from any other state when Host sets the 
RESET bit.

AMSS EE is not really affected here.  If AMSS sets syserr, or we are 
here because the host needs to do a reset, then we will issue RESET=1 
which is fine. (if syserr set or EE is not PBL/SBL)

However, as the comment states, PBL and SBL won't respond to RESET=1 
unless they are expecting it.  This will cause issues as Host will issue 
RESET, expect PBL/SBL to clear it, but they won't, and Host will stall 
thinking PBL/SBL are malfunctioning.  This is a side effect of using 
syserr to signal a device fatal error when PBL doesn't otherwise 
actually support MHI, and the Host offloading the syserr processing.

-Jeff

