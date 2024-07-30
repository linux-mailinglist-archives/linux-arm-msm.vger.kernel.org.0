Return-Path: <linux-arm-msm+bounces-27453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B0942393
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 01:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFFCC1C2037A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 23:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F5A190489;
	Tue, 30 Jul 2024 23:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="COntvSYT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5972218C90C;
	Tue, 30 Jul 2024 23:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722383459; cv=none; b=Q5+2yl4v1+V6KQPNQyp1bO17y6jRfeu5LiW5vVKzl/Oy3LiF1PtZLGzP+P/u+e6SEU9NDZt52thF13K8qWdhOPuG/ys3t8qmHN//IRgGYaFW9/Oh13esVHOtVBA55ZxEdt7834RtEX/Z1B1AfLDtGokWjwo1Qn1bQoNG0lcoY7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722383459; c=relaxed/simple;
	bh=LYeWXt41VunXQqBk9Y2+cEqG8NraPCmrBoQPsYuXo5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OZRJ4uTANQ8UYfTLCCzELB5/mqoI0oy/BsYMu/H0QP8i4v2jf1MHnTKf70bUUGRpPmvHBeiCyVeaviSmcP4GbPdiap0zBbubpSoZKz5IDsUepuqSfjCqs7idkIDOk85pHbqU3HF6QsmZtMMgvr1DW5S9opog1yKxVIbE/SvKSjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=COntvSYT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UEZwDY027610;
	Tue, 30 Jul 2024 23:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sB6+tPVaYcaqAUVOpuNx6CWccmC0KGC55y/EDArjgFo=; b=COntvSYT08UBrolZ
	9HZEvhNLvXTXc5as6bBByVuOPQGmlPqlxHEi+0r8qMeeGVOEN68xS6VT5e2jjaMe
	qXVaCvt8eUPCqyp4vMgpY9bkfRqVItxmjO2ajfgiLIW6faRLsLST/Sm8+lQrr9AO
	7OGqhF+KO6bOKBcqto880EVex7gKT5uy4kpCy5/IZE7C5D/0Q6UNMdrPrroYfpVi
	nsKPgv+OiHSkbNyZBcxChkjt5UM6SzmkKP7vm6WAFZoV8ZtPIuPgvrudUFxc2ng2
	VPMVM5NdjbiyRtYmfEhMkRLco9qvrkeiJGq/TynGnEC/5q9YAVGTRaROdKHNqKt3
	zF8WMQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40q232sjhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 23:50:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UNolt1012740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 23:50:47 GMT
Received: from [10.110.126.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 16:50:47 -0700
Message-ID: <60aa6833-7e08-4986-93e7-4790a8eb8568@quicinc.com>
Date: Tue, 30 Jul 2024 16:50:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: pd_mapper: Add X1E80100
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold
	<johan@kernel.org>
CC: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Abel Vesa
	<abel.vesa@linaro.org>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
 <20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org>
 <Zqet8iInnDhnxkT9@hovoldconsulting.com>
 <ZqiyLvP0gkBnuekL@hovoldconsulting.com>
 <oj4qv5wdxymsgpuy4col2w5gabn6k5blybf2fmrckydjo6sftd@eppcqaqwjn5b>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <oj4qv5wdxymsgpuy4col2w5gabn6k5blybf2fmrckydjo6sftd@eppcqaqwjn5b>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jhR1by1LCk0v_5A-3AsW3_08zLoo7Gft
X-Proofpoint-ORIG-GUID: jhR1by1LCk0v_5A-3AsW3_08zLoo7Gft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_19,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407300166



On 7/30/2024 4:06 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 30, 2024 at 11:28:14AM GMT, Johan Hovold wrote:
>> On Mon, Jul 29, 2024 at 04:57:54PM +0200, Johan Hovold wrote:
>>> On Mon, Jul 08, 2024 at 06:22:09PM +0200, Stephan Gerhold wrote:
>>>> X1E80100 has the same protection domains as SM8550, except that MPSS is
>>>> missing. Add it to the in-kernel pd-mapper to avoid having to run the
>>>> daemon in userspace for charging and audio functionality.
>>>
>>> I'm seeing a bunch of new errors when running with this patch applied on
>>> top of 6.11-rc1. I'm assuming it is due to changes in timing that are
>>> either exposing existing bugs or there is a general problem with the
>>> in-kernel pd-mapper implementation.
>>>
>>> In any case, this does does not seem to be specific to x1e80100 even if
>>> I'm not seeing as many issues on sc8280xp (there is one new error there
>>> too however).
>>>
>>> It doesn't happen on every boot, but with the in-kernel pd-mapper I
>>> often (every 3-4 boots) see the following errors on the x1e80100 CRD
>>> during boot:
>>>
>>> 	[    9.799719] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
>>>          [    9.812446] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
>>>          [    9.831796] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
>>>
>>> 	[    9.269230] qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
>>>
>>> I've also seen the following, which may also be related:
>>>
>>> 	[   14.565059] PDR: avs/audio get domain list txn wait failed: -110
>>>          [   14.571943] PDR: service lookup for avs/audio failed: -110
>>>
>>> I haven't seen the -ECANCELED (-125) errors in 30 reboots with the patch
>>> reverted again.
>>
>> Here's another bug, a NULL deref in the battery driver, that is
>> apparently exposed by the in-kernel pd-mapper. This is also on the
>> x1e80100 CRD with a couple of added printks to indicate when the
>> pd-mapper probes and when the pmic glink services are up:
> 
> The backtrace looks like an issue in the battmgr / pmic_glink core. Yes,
> maybe pd-mapper exposes that. But most likely nobody have seen those
> because userspace pd-mapper usually starts much later (thanks udevadm
> trigger for triggering all the drivers).
> 
> The pd-mapper server is fine to be started early. Even the userspace
> one.  I think we went over these discussions during reviews of earlier
> series. The net result was that it is fine, provided that the response
> don't change later on (e.g.  some of the firmware might save the state
> and won't re-query it later on if servreg restarts).
> 
>> [    8.933775] remoteproc remoteproc1: powering up 32300000.remoteproc
>> [    8.934623] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fd5000.phy
>> [    8.945244] remoteproc remoteproc1: Booting fw image qcom/x1e80100/cdsp.mbn, size 3027368
>> [    8.965537] remoteproc remoteproc0: powering up 30000000.remoteproc
>> [    8.971075] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fda000.phy
>> [    8.974299] remoteproc remoteproc0: Booting fw image qcom/x1e80100/adsp.mbn, size 21424472
>> [    8.999726] msm-mdss ae00000.display-subsystem: Adding to iommu group 4
>> [    9.007697] qcom_pmic_glink pmic-glink: Failed to create device link (0x180) with fdf000.phy
>> [    9.101196] remoteproc remoteproc1: remote processor 32300000.remoteproc is now up
>> [    9.103860] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.1: qcom_pdm_probe
>> [    9.105989] qcom_pd_mapper.qcom-pdm-mapper qcom_common.pd-mapper.0: qcom_pdm_probe
>>
>>   - pd-mapper probing
>>
>> [    9.112983] qcom-snps-eusb2-hsphy fd3000.phy: Registered Qcom-eUSB2 phy
>> [    9.296879] remoteproc remoteproc0: remote processor 30000000.remoteproc is now up
>>
>>   - adsp is up
>>
>> [    9.300086] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 7fffffff
>>
>>   - SERVREG_SERVICE_STATE_UNINIT
>>
>> [    9.301878] qcom-snps-eusb2-hsphy fd9000.phy: Registered Qcom-eUSB2 phy
>> [    9.306985] qcom,fastrpc 30000000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: no reserved DMA memory for FAST
>> RPC
>> [    9.309924] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@3: Adding to iommu group 5
>> [    9.311367] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@4: Adding to iommu group 6
>> [    9.318330] PDR: Indication received from msm/adsp/charger_pd, state: 0x1fffffff, trans-id: 1
>>
>>   - This looks suspicious
>>
>> [    9.323924] qcom-snps-eusb2-hsphy fde000.phy: Registered Qcom-eUSB2 phy
>> [    9.325275] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@5: Adding to iommu group 7
>> [    9.326008] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@6: Adding to iommu group 8
>> [    9.326733] qcom,fastrpc-cb 30000000.remoteproc:glink-edge:fastrpc:compute-cb@7: Adding to iommu group 9
>> [    9.336582] qcom_pmic_glink pmic-glink: pmic_glink_pdr_callback - state = 1fffffff
>>
>>   - SERVREG_SERVICE_STATE_UP
>>
>> [    9.345544] dwc3 a000000.usb: Adding to iommu group 10
>> [    9.361410] qcom,apr 30000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
>> [    9.362803] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
>> [    9.362882] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
>>
>>   - -ECANCELED errors I reported earlier
> 
> 
> The qcom_glink_request_intent() looks like the only place which can
> return ECANCELED here. Not sure why GLINK_CMD_RX_INTENT_REQ_ACK() would
> return failure here.
> 
> It might be that the ADSP has been running the preliminary firmware,
> then it is shut down and then restarted with the proper firmware (and
> Linux fails to track that). But in this case the same error can happen
> if the pd-mapper has been running before starting the ADSP.
>

The default behavior for a GLINK channel on the firmware is to reject 
intent requests. The PMIC glink channel on the firmware may not have 
implemented an intent request handler so any intent requests would be 
rejected and result in an ECANCELED. When the firmware implements the 
glink channel this way, the linux driver has to wait until the firmware 
queues the intents for linux to use.

I guess with userspace pd-mapper, by the time the pd state is 
broadcasted to the pmic glink driver, the firmware glink channel has 
already queued intents for pmic_glink driver to use.

>>
>> [    9.364298] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
>> ...
>> [    9.364339] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>> [    9.364395] CPU: 6 UID: 0 PID: 111 Comm: kworker/6:4 Not tainted 6.11.0-rc1 #70
>> [    9.364397] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
>> [    9.364398] Workqueue: events qcom_battmgr_enable_worker [qcom_battmgr]
>> [    9.364401] pstate: 01400005 (nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>> [    9.364403] pc : pmic_glink_send+0xc/0x24 [pmic_glink]
>> [    9.364405] lr : qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
>> ...
>> [    9.364427] Call trace:
>> [    9.364428]  pmic_glink_send+0xc/0x24 [pmic_glink]
> 
> It looks like pmic_glink_send might need to hold pg->state_lock.
> 
>> [    9.364429]  qcom_battmgr_enable_worker+0x60/0xbc [qcom_battmgr]
>> [    9.364430]  process_one_work+0x210/0x614
>> [    9.364435]  worker_thread+0x244/0x388
>> [    9.364436]  kthread+0x124/0x128
>> [    9.364437]  ret_from_fork+0x10/0x20
>> [    9.364439] Code: 17fffff7 d503233f a9bf7bfd 910003fd (f9400800)
>> [    9.364441] ---[ end trace 0000000000000000 ]---
>>
>> [    9.365205] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
>>
>> Johan
> 

