Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE6E718492
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 16:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237584AbjEaORb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 10:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237555AbjEaORQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 10:17:16 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87C61734
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 07:15:10 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34VDMmtZ013918;
        Wed, 31 May 2023 13:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JjGDjNRRLoI4daJ4yudQOYzsqnHGiNkyerZHjUxZKno=;
 b=hUaQgdvjfxdypqAhbwWXLHc4pkkts4pYeY9mqK0EZjfT/cydbauA0mMfUp1A+9Ol4F9q
 tqNIGvBCJAR8LMf6cmXLLy+W3mYgXC1R/1S8/6ELM65oMlPU4gNkaD+kDHVPyX+yQtAG
 XcNtRg3M97QV4Q11ZwDXE4QyHPdso4MhgANsr5VNUhP2j/K+WCeMV/VE5pAKtyBQl3OD
 ksZShkzZMMzNVfRzlElXkJHXjb4qtXOE10krEon68a28cbgJPnZAYDDlXULcSUGkp9zz
 PXkqBUthkhgV41BIg+gNKMSCoW6aY8L/w0U7+Kp2GmujUDtdXpjN83fkCsK7c/eFFvDZ 7Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qwryestre-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 May 2023 13:56:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34VDuXFn028938
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 May 2023 13:56:33 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 31 May
 2023 06:56:32 -0700
Message-ID: <84eb3b8f-603a-91e4-ff25-05c3505ba220@quicinc.com>
Date:   Wed, 31 May 2023 07:56:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/1] bus: mhi: host: allow SBL as initial EE
Content-Language: en-US
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Daniele Palmas <dnlplm@gmail.com>
CC:     <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
References: <20230530091340.3513141-1-dnlplm@gmail.com>
 <20230530103103.GB6379@thinkpad>
 <CAGRyCJGR4YsUgWekf_DgYHJqoXNfmFpL-N_virvqE18aU=Ovkg@mail.gmail.com>
 <20230530135620.GA2313@thinkpad>
 <CAGRyCJG6+k4PZq0V3h-c-SiEm_7ExjoACTtbgCOEeSt3AQjM3g@mail.gmail.com>
 <20230531130104.GG7968@thinkpad>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230531130104.GG7968@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jzTf2liMITLbfNRPlIRxSKm6VE6k2G77
X-Proofpoint-ORIG-GUID: jzTf2liMITLbfNRPlIRxSKm6VE6k2G77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_08,2023-05-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310119
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/31/2023 7:01 AM, Manivannan Sadhasivam wrote:
> On Wed, May 31, 2023 at 01:44:24PM +0200, Daniele Palmas wrote:
>> Il giorno mar 30 mag 2023 alle ore 15:56 Manivannan Sadhasivam
>> <mani@kernel.org> ha scritto:
>>>
>>> On Tue, May 30, 2023 at 01:12:59PM +0200, Daniele Palmas wrote:
>>>> Hi Mani,
>>>>
>>>> Il giorno mar 30 mag 2023 alle ore 12:31 Manivannan Sadhasivam
>>>> <mani@kernel.org> ha scritto:
>>>>>
>>>>> On Tue, May 30, 2023 at 11:13:40AM +0200, Daniele Palmas wrote:
>>>>>> There are situations in which SBL is a legitimate initial execution
>>>>>> environment (e.g. modem stuck in SBL due to a firmware failure...), but
>>>>>> mhi refuses to start:
>>>>>>
>>>>>> mhi-pci-generic 0000:01:00.0: MHI PCI device found: foxconn-sdx55
>>>>>> mhi-pci-generic 0000:01:00.0: BAR 0: assigned
>>>>>> mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
>>>>>> mhi mhi0: Requested to power ON
>>>>>> mhi mhi0: SECONDARY BOOTLOADER is not a valid EE for power on
>>>>>> mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
>>>>>> mhi-pci-generic: probe of 0000:01:00.0 failed with error -5
>>>>>>
>>>>>> Fix this by adding SBL as an allowed initial execution environment.
>>>>>>
>>>>>
>>>>> What can you do with the modem when firmware failure happens? If there is a
>>>>> usecase, please explain.
>>>>
>>>> (removing Siddartha and Sujeev due to addresses not working)
>>>>
>>>
>>> Both left Qualcomm a while ago...
>>>
>>>> A possible scenario for a Telit modem not being able to go to mission
>>>> mode is when a firmware update does not work properly: in this case it
>>>> remains stuck in SBL, but the SAHARA device can be used for retrying
>>>> the firmware update.
>>>>
>>>
>>> So IIUC, while updating SBL over SAHARA channel, the firmware update could be
>>> corrupted and the device would get stuck in SBL EE. In that case, the SAHARA
>>> channel exposed by PBL will still be open and that could be used to retry the
>>> firmware update. Am I right?
>>>
>>> Looks like PBL is doing a fail safe upgrade!
>>>
>>
>> Yes, the scenario is a broken firmware update.
>>
>> Telit has implemented custom code in the SBL for allowing the firmware
>> update through a custom protocol using the SAHARA channels: this has
>> been mainly done to avoid sharing with customers Qualcomm IP about
>> firmware update, since it is usually problematic.
>>
>> Firmware update is fail safe in the sense that it is guaranteed that
>> the modem will always power-up at least in SBL, in which the firmware
>> update can always be retried. I don't have the exact details of what
>> is happening inside the modem, but, if required, I can get them.
>>
> 
> Okay, I didn't now that it is a custom SBL, so yeah it may not benefit other
> platforms. But what is the userspace tool that you are using to download
> firmware over SAHARA? Can QDL be used?

Yeah, this looks like a weird quirk to me.  The device should never 
"start" in SBL.  AIC100 has a weird flow where it can be there 
(interrupted flashless boot, remove driver, modprobe driver), but that 
gets handled in the QAIC driver.

Since this for flash loading, I would expect EDL or FP EEs to be used. 
It sounds like Telit has integrated a flash programmer into the SBL 
instead of having it be loaded via EDL.  That is not inherently invalid, 
but the device should still mimic the right flows instead of inventing 
its own.

> 
> - Mani
> 
>>>> Telit FN990 supports the SAHARA channels in pci_generic. It's true
>>>> that there's still missing the exposed device for userspace, something
>>>> that we are currently managing with out of tree patches, but I see
>>>> that there's some ongoing effort for that
>>>> https://lore.kernel.org/mhi/20230522190459.13790-1-quic_jhugo@quicinc.com/
>>>>
>>>> I'm not sure if non-Telit modems have other reasonable use-cases.
>>>>
>>>
>>> If my above understanding is correct, then this patch will benefit other
>>> platforms too.
>>>
>>
>> Well... I can't comment on that, since I don't know if the above
>> described behavior is due to Telit custom SBL.
>>
>> Anyway, maybe there could be other scenarios like, for example, modem
>> falling into core dump mode in a very early stage? Not sure...
>>
>> Regards,
>> Daniele
>>
>>> - Mani
>>>
>>>> Regards,
>>>> Daniele
>>>>
>>>>>
>>>>> - Mani
>>>>>
>>>>>> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
>>>>>> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
>>>>>> ---
>>>>>>   drivers/bus/mhi/host/internal.h | 2 +-
>>>>>>   drivers/bus/mhi/host/pm.c       | 3 ++-
>>>>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
>>>>>> index 2e139e76de4c..3bdcd2321aa5 100644
>>>>>> --- a/drivers/bus/mhi/host/internal.h
>>>>>> +++ b/drivers/bus/mhi/host/internal.h
>>>>>> @@ -56,7 +56,7 @@ extern const char * const mhi_ee_str[MHI_EE_MAX];
>>>>>>
>>>>>>   #define MHI_IN_PBL(ee) (ee == MHI_EE_PBL || ee == MHI_EE_PTHRU || \
>>>>>>                        ee == MHI_EE_EDL)
>>>>>> -#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS)
>>>>>> +#define MHI_POWER_UP_CAPABLE(ee) (MHI_IN_PBL(ee) || ee == MHI_EE_AMSS || ee == MHI_EE_SBL)
>>>>>>   #define MHI_FW_LOAD_CAPABLE(ee) (ee == MHI_EE_PBL || ee == MHI_EE_EDL)
>>>>>>   #define MHI_IN_MISSION_MODE(ee) (ee == MHI_EE_AMSS || ee == MHI_EE_WFW || \
>>>>>>                                 ee == MHI_EE_FP)
>>>>>> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
>>>>>> index 083459028a4b..18872c5017be 100644
>>>>>> --- a/drivers/bus/mhi/host/pm.c
>>>>>> +++ b/drivers/bus/mhi/host/pm.c
>>>>>> @@ -1203,10 +1203,11 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>>>>>>
>>>>>>        wait_event_timeout(mhi_cntrl->state_event,
>>>>>>                           MHI_IN_MISSION_MODE(mhi_cntrl->ee) ||
>>>>>> +                        mhi_cntrl->ee == MHI_EE_SBL ||
>>>>>>                           MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>>>>>>                           msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>>>>>
>>>>>> -     ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -ETIMEDOUT;
>>>>>> +     ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee) || mhi_cntrl->ee == MHI_EE_SBL) ? 0 : -ETIMEDOUT;
>>>>>>        if (ret)
>>>>>>                mhi_power_down(mhi_cntrl, false);
>>>>>>
>>>>>> --
>>>>>> 2.37.1
>>>>>>
>>>>>
>>>>> --
>>>>> மணிவண்ணன் சதாசிவம்
>>>
>>> --
>>> மணிவண்ணன் சதாசிவம்
> 

