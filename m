Return-Path: <linux-arm-msm+bounces-27476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C5794261C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8460B1C20B5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420C486250;
	Wed, 31 Jul 2024 06:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PoqJslIH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1340882D94;
	Wed, 31 Jul 2024 06:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722405908; cv=none; b=U9WHvkABC2guqKbilHFF0K4bog1lE/o0bbc2u76wv/n676RiP/JMebRFmB4UvTc0oSdNAIkCUq2EkTGwS8fkzu3SA0RGX/t9b3tkylGAPsswl8A8o1mh23AdnBDr6SR/tHLjXmpYzEiD9VOK6eGCevho7kg1uGSDOxUL18dkanc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722405908; c=relaxed/simple;
	bh=S1mRz1nEJ7JVYNUQ85ncoaaFlGf+fC0nhYz8/HWp3rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cglFh8Rd+gRnU7GCYsG/O6O/mSoaAQtRicw17yHdhuRtUfU6JCImva9cnuO0JoazaLVJeUEy35mH+kCFWEBkKSXe91Kls4UrbXmfafOD2Irnxt3wv/xtOhg7OADUwqTThaap/fYmWOt/KMvJwAQJdH6u47mZOTQyqAdRPIhYxu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PoqJslIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V5Bdlx024000;
	Wed, 31 Jul 2024 06:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTwZfJAw7/YKc3wjhtWYXHmkGtk6aKTSZn16F3l5AzM=; b=PoqJslIHW78V47eQ
	OIGDvOwK5FyWNthVsf0aPG2dgrOAMwhYR55el9W5ErEIvTWusWjP+QuXpNEwt7lw
	8W7xo2YZjNtiisz8qGj5WhKtTQIBTo9NYv6iFMnGxuMGr1TBHUeFJlpKzFakmlaS
	MtmgvtROBHkSxAjdRCklZljCJURgCdRPm9fZSmEyx5THViJ2TxphckxHW/5Mt9Ao
	4J+e2r6Bpky3mBF/7xjI3+dXCc2Si/a5yt2kXfpm46YDUTKaT9/4gXHb34UYTg/Y
	GXNPJ6fJVN9anIijjtVLbjgrgcFYVnYTHYvkLTrecqy/TagnSYux5PR0AcGG1M4w
	ZBMExQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw453aem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:05:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V64xW9008209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:04:59 GMT
Received: from [10.110.126.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 23:04:58 -0700
Message-ID: <02e3c217-490d-4051-8fb8-6bfcf322e27d@quicinc.com>
Date: Tue, 30 Jul 2024 23:04:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: pd_mapper: Add X1E80100
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Johan Hovold <johan@kernel.org>,
        Stephan Gerhold
	<stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
 <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>
 <Zqet8iInnDhnxkT9@hovoldconsulting.com>
 <ZqiyLvP0gkBnuekL@hovoldconsulting.com>
 <oj4qv5wdxymsgpuy4col2w5gabn6k5blybf2fmrckydjo6sftd@eppcqaqwjn5b>
 <60aa6833-7e08-4986-93e7-4790a8eb8568@quicinc.com>
 <CAA8EJpopAYp3Y6cW8B+2cVM=_oAnWeOqS6zygc4o7b+r9Lj1ZQ@mail.gmail.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <CAA8EJpopAYp3Y6cW8B+2cVM=_oAnWeOqS6zygc4o7b+r9Lj1ZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bcbEf9fH8yAWHfGGrGWXbJBXANY_Yt3N
X-Proofpoint-ORIG-GUID: bcbEf9fH8yAWHfGGrGWXbJBXANY_Yt3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_03,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407310044



On 7/30/2024 6:41 PM, Dmitry Baryshkov wrote:
> On Wed, 31 Jul 2024 at 02:50, Chris Lew <quic_clew@quicinc.com> wrote:
>>
>>
>>
>> On 7/30/2024 4:06 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 30, 2024 at 11:28:14AM GMT, Johan Hovold wrote:
>>>> On Mon, Jul 29, 2024 at 04:57:54PM +0200, Johan Hovold wrote:
>>>>> On Mon, Jul 08, 2024 at 06:22:09PM +0200, Stephan Gerhold wrote:
>>>>>> X1E80100 has the same protection domains as SM8550, except that MPSS is
>>>>>> missing. Add it to the in-kernel pd-mapper to avoid having to run the
>>>>>> daemon in userspace for charging and audio functionality.
>>>>>
>>>>> I'm seeing a bunch of new errors when running with this patch applied on
>>>>> top of 6.11-rc1. I'm assuming it is due to changes in timing that are
>>>>> either exposing existing bugs or there is a general problem with the
>>>>> in-kernel pd-mapper implementation.
>>>>>
>>>>> In any case, this does does not seem to be specific to x1e80100 even if
>>>>> I'm not seeing as many issues on sc8280xp (there is one new error there
>>>>> too however).
>>>>>
>>>>> It doesn't happen on every boot, but with the in-kernel pd-mapper I
>>>>> often (every 3-4 boots) see the following errors on the x1e80100 CRD
>>>>> during boot:
>>>>>
>>>>>      [    9.799719] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
>>>>>           [    9.812446] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
>>>>>           [    9.831796] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
>>>>>
>>>>>      [    9.269230] qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
>>>>>
>>>>> I've also seen the following, which may also be related:
>>>>>
>>>>>      [   14.565059] PDR: avs/audio get domain list txn wait failed: -110
>>>>>           [   14.571943] PDR: service lookup for avs/audio failed: -110
>>>>>
>>>>> I haven't seen the -ECANCELED (-125) errors in 30 reboots with the patch
>>>>> reverted again.
>>>>
>>>> Here's another bug, a NULL deref in the battery driver, that is
>>>> apparently exposed by the in-kernel pd-mapper. This is also on the
>>>> x1e80100 CRD with a couple of added printks to indicate when the
>>>> pd-mapper probes and when the pmic glink services are up:
>>>
>>> The backtrace looks like an issue in the battmgr / pmic_glink core. Yes,
>>> maybe pd-mapper exposes that. But most likely nobody have seen those
>>> because userspace pd-mapper usually starts much later (thanks udevadm
>>> trigger for triggering all the drivers).
>>>
>>> The pd-mapper server is fine to be started early. Even the userspace
>>> one.  I think we went over these discussions during reviews of earlier
>>> series. The net result was that it is fine, provided that the response
>>> don't change later on (e.g.  some of the firmware might save the state
>>> and won't re-query it later on if servreg restarts).
>>>
>>>> [    8.933775] remoteproc remoteproc1: powering up 32300000.remoteproc
>>>> [    8.934623] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fd5000.phy
>>>> [    8.945244] remoteproc remoteproc1: Booting fw image qcom/x1e80100/cdsp.mbn, size 3027368
>>>> [    8.965537] remoteproc remoteproc0: powering up 30000000.remoteproc
>>>> [    8.971075] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fda000.phy
>>>> [    8.974299] remoteproc remoteproc0: Booting fw image qcom/x1e80100/adsp.mbn, size 21424472
>>>> [    8.999726] msm-mdss ae00000.display-subsystem: Adding to iommu group 4
>>>> [    9.007697] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fdf000.phy
>>>> [    9.101196] remoteproc remoteproc1: remote processor 32300000.remoteproc is now up
>>>> [    9.103860] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.1: qcom_pdm_probe
>>>> [    9.105989] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.0: qcom_pdm_probe
>>>>
>>>>    - pd-mapper probing
>>>>
>>>> [    9.112983] qcom-snps-eusb2-hsphy fd3000.phy: Registered Qcom-eUSB2 phy
>>>> [    9.296879] remoteproc remoteproc0: remote processor 30000000.remoteproc is now up
>>>>
>>>>    - adsp is up
>>>>
>>>> [    9.300086] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 7fffffff
>>>>
>>>>    - SERVREG_SERVICE_STATE_UNINIT
>>>>
>>>> [    9.301878] qcom-snps-eusb2-hsphy fd9000.phy: Registered Qcom-eUSB2 phy
>>>> [    9.306985] qcom,fastrpc 30000000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FAST
>>>> RPC
>>>> [    9.309924] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 5
>>>> [    9.311367] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 6
>>>> [    9.318330] PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
>>>>
>>>>    - This looks suspicious
>>>>
>>>> [    9.323924] qcom-snps-eusb2-hsphy fde000.phy: Registered Qcom-eUSB2 phy
>>>> [    9.325275] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 7
>>>> [    9.326008] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 8
>>>> [    9.326733] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 9
>>>> [    9.336582] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 1fffffff
>>>>
>>>>    - SERVREG_SERVICE_STATE_UP
>>>>
>>>> [    9.345544] dwc3 a000000.usb: Adding to iommu group 10
>>>> [    9.361410] qcom,apr 30000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
>>>> [    9.362803] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
>>>> [    9.362882] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
>>>>
>>>>    - -ECANCELED errors I reported earlier
>>>
>>>
>>> The qcom_glink_request_intent() looks like the only place which can
>>> return ECANCELED here. Not sure why GLINK_CMD_RX_INTENT_REQ_ACK() would
>>> return failure here.
>>>
>>> It might be that the ADSP has been running the preliminary firmware,
>>> then it is shut down and then restarted with the proper firmware (and
>>> Linux fails to track that). But in this case the same error can happen
>>> if the pd-mapper has been running before starting the ADSP.
>>>
>>
>> The default behavior for a GLINK channel on the firmware is to reject
>> intent requests. The PMIC glink channel on the firmware may not have
>> implemented an intent request handler so any intent requests would be
>> rejected and result in an ECANCELED. When the firmware implements the
>> glink channel this way, the linux driver has to wait until the firmware
>> queues the intents for linux to use.
> 
> Could you please describe the actual code path that would result in
> -ECANCELED? Is that qcom_glink_handle_intent_req_ack(granted = 0) ?
> My theory about unregistration is based upon a call path that leads to
> qcom_glink_intent_req_abort(). But if I'm not mistaken, it only
> happens on the subdev stop event.
> 
> Johan, Stephan, could you please trace, what leads to the ECANCELED?
> 
> Also could you please be more specific whether the described behaviour
> is tied to X1E80100 platform or it is common to some / all other
> platforms?
> 

Ah sorry, wasn't being clear.

GLINK has a concept that is called "intents". An intent is an object 
that signifies that a remote channel is ready to receive a packet 
through GLINK. Intents can be pre-emptively queued, or they can be 
requested by the sending entity. GLINK will not try to send or it will 
block until there is an intent available.

Intents are exchanged with GLINK_CMD_INTENT packets. When Linux receives 
one of these packets we add it to an idr "riids".

Example sending call:
     pmic_glink_send() --> rpmsg_send() --> qcom_glink_send() --> 
__qcom_glink_send() --> qcom_glink_request_intent()

In __qcom_glink_send(), we check if there are any available intents in 
"riids", if there aren't any intents we request an intent through 
qcom_glink_request_intent(). This sends a GLINK_CMD_RX_INTENT_REQ packet 
to the remote and waits for a GLINK_CMD_RX_INTENT_REQ_ACK packet in 
return. This ack packet will have a field that says whether the intent 
has been granted or not. When linux gets this ack packet, we will wake 
up the thread waiting in qcom_glink_request_intent().

The ECANCELED comes from qcom_glink_request_intent() when we receive a 
GLINK_CMD_RX_INTENT_REQ_ACK that has granted == false.

On the firmware, when a glink channel is registered they can optionally 
fill in a handler for GLINK_CMD_RX_INTENT_REQ packets. If this handler 
is not configured, then a default one will be used where all 
GLINK_CMD_RX_INTENT_REQ packets will be responded with 
GLINK_CMD_RX_INTENT_REQ_ACK and granted == false. If a channel is 
implemented this way, then the only thing Linux can do is wait and retry 
until the remote queues the intents on its own accord.

This would be my current guess as to what's happening based on this not 
being consistent and only seen every couple of reboots. A stop path 
problem sounds like it should happen every time, and we should also see 
the remoteproc prints related to powering down the adsp. The above race 
should be applicable to all platforms but depends on the speed of the 
ADSP vs the CPU.

>> I guess with userspace pd-mapper, by the time the pd state is
>> broadcasted to the pmic glink driver, the firmware glink channel has
>> already queued intents for pmic_glink driver to use.
>>
>>>>
>>>> [    9.364298] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
>>>> ...
>>>> [    9.364339] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>>>> [    9.364395] CPU: 6 UID: 0 PID: 111 Comm: kworker/6:4 Not tainted 6.11.0-rc1 #70
>>>> [    9.364397] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
>>>> [    9.364398] Workqueue: events qcom_battmgr_enable_worker [qcom_battmgr]
>>>> [    9.364401] pstate: 01400005 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>>>> [    9.364403] pc : pmic_glink_send+0xc/0x24 [pmic_glink]
>>>> [    9.364405] lr : qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
>>>> ...
>>>> [    9.364427] Call trace:
>>>> [    9.364428]  pmic_glink_send+0xc/0x24 [pmic_glink]
>>>
>>> It looks like pmic_glink_send might need to hold pg->state_lock.
>>>
>>>> [    9.364429]  qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
>>>> [    9.364430]  process_one_work+0x210/0x614
>>>> [    9.364435]  worker_thread+0x244/0x388
>>>> [    9.364436]  kthread+0x124/0x128
>>>> [    9.364437]  ret_from_fork+0x10/0x20
>>>> [    9.364439] Code: 17fffff7 d503233f a9bf7bfd 910003fd (f9400800)
>>>> [    9.364441] ---[ end trace 0000000000000000 ]---
>>>>
>>>> [    9.365205] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
> 

