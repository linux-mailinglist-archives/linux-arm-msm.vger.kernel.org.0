Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0AF76DF50
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 06:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbjHCENc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 00:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbjHCEN3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 00:13:29 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135CF30CF;
        Wed,  2 Aug 2023 21:13:23 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3732fdkC017839;
        Thu, 3 Aug 2023 04:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bY6/WyBr8x0sVcweY3FWqewM2dHLgeFD/KokyA3hhRA=;
 b=OyVp8ke7A0FFsSoXoJZGQV8pHdO4GMQkEP2jc/7jNdoH7OfR5u/J8LsiZyhMgBePrD/a
 4TvZH6lsoup2a/dwW+tP1LhMkxF0MnxKmAlQIBskH4We82Zne4Opm5inlBJSwXXNAOio
 CMD3LedwQ3aAD0KAQqkQZz7iFsyHbD97qDCLUMmccxai8gVOHmTxLAKC1SIcHchMeKVP
 TiqJl/HHr1rhU/jrSZON3YUrNyo2MFyR7uxvFnPoFQHpKJggXZDEu4v9cddYTafeyZka
 hUyxAYWpOzLSnVP0LDH4TJPGB6kwujNVioNBz/TaQReX84sWtFQn4Q633gf1Tl92Be6q 9g== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s83nwr3w2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 04:13:12 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3734DBMg017619
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 04:13:11 GMT
Received: from [10.253.73.99] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 21:13:09 -0700
Message-ID: <505fb99b-fcd0-6b80-31c8-bb619242aef8@quicinc.com>
Date:   Thu, 3 Aug 2023 12:13:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mhi: host: Add tme supported image download functionality
Content-Language: en-US
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>, <mani@kernel.org>
CC:     <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_mrana@quicinc.com>
References: <1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com>
 <c8002897-c642-fcde-a7e1-da2959d40abe@quicinc.com>
 <eda747a2-8734-10fc-7453-050948130a6b@quicinc.com>
 <0c47c876-f2be-0d60-8912-34c17bccbd8d@quicinc.com>
From:   Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <0c47c876-f2be-0d60-8912-34c17bccbd8d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pAS5metO4fpNzfUHmCNmJQK1Ck4rHekM
X-Proofpoint-ORIG-GUID: pAS5metO4fpNzfUHmCNmJQK1Ck4rHekM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_01,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030038
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/2/2023 11:47 PM, Jeffrey Hugo wrote:
> On 7/24/2023 1:42 AM, Qiang Yu wrote:
>>
>> On 7/21/2023 1:13 PM, Jeffrey Hugo wrote:
>>> On 7/20/2023 8:39 PM, Qiang Yu wrote:
>>>> Add tme supported image related flag which makes decision in terms 
>>>> of how
>>>> FBC image based AMSS image is being downloaded with connected 
>>>> endpoint.
>>>> FBC image is having 2 image combine: SBL image + AMSS image.
>>>> 1. FBC image download using legacy image format:
>>>> - SBL image: 512KB of FBC image is downloaded using BHI.
>>>> - AMSS image: full FBC image is downloaded using BHIe.
>>>> 2. FBC image download using TME supported image format:
>>>> - SBL image: 512 KB of FBC image is downloaded using BHI.
>>>> - AMSS image: 512 KB onward FBC image is downloaded using BHIe.
>>>> There is no change for SBL image download. Although AMSS image start
>>>> address is end address of SBL image while using TME supported image 
>>>> format.
>>>
>>> I know what TME is, but in the context of this patch, it doesn't 
>>> seem like relevant information.  "tme" is just a name for this mode, 
>>> but it is not very descriptive.  Also, I suspect that this mode is 
>>> not intrinsically related to the TME hardware on the endpoint, it 
>>> just happens to be used on targets where TME is present.
>>>
>>> Is there something else we can call this?
>>>
>> Hi Jeff, sorry, previous reply contains HTML content, not sure if you 
>> have got my reply. So reply again.
>>
>> How about below commit message?
>>
>> Currently, the FBC image is non-standard ELF file which contains one ELF
>> header followed by segments for SBL/RDDM and AMSS. To support TME-L,we
>> need to have separate ELF header for SBL/RDDM and AMSS due to limitation
>> of TME-L.
>
> I don't think mentioning TME-L has any value.  The host doesn't 
> interact with TME-L nor has any way to directly detect if TME-L is 
> present.
>
> I would suggest making this more generic - some devices (for example 
> XXX) are unable to handle the non-standard ELF format of the FBC image 
> and thus need special handling of the FBC image.
This is really better and more generic.
>
>>
>> Add standard_elf_image flag which makes decision in terms of how FBC 
>> image based
>> AMSS image is being downloaded with connected endpoint.
>> FBC image is having two image combine: SBL image + AMSS image.
>> 1. FBC image download using legacy single ELF header image format:
>> - SBL image: 512KB of FBC image is downloaded using BHI.
>> - AMSS image: full FBC image is downloaded using BHIe.
>> 2. FBC image download using separate ELF header image format:
>> - SBL image: 512 KB of FBC image is downloaded using BHI.
>> - AMSS image: 512 KB onward FBC image is downloaded using BHIe.
>> There is no change for SBL image download. Although AMSS image start
>> address is end address of SBL image while using separate ELF header 
>> format.
>
> I wonder if it makes more sense to split the FBC image into two images 
> for these devices.  One SBL image, and one AMSS image. Feels like we 
> would just need to detect if there is a separate AMSS image, and use 
> that for BHIe.  Then we don't need to go manipulating the image (which 
> I feel might be fragile).
With combine FBC image,  we are able to accommodate new image request 
better way with less code change, and satisfy processing of RDDM without 
any modification.
>
>
> Mani, do you have thoughts on this?
>
>>
>> Thank you for your time and patience.
>>>>
>>>> Signed-off-by: Mayank Rana <quic_mrana@quicinc.com>
>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>
>>> This doesn't make sense.  This patch is from you, which makes you 
>>> the author.  But Mayank's SOB is listed first, which means he is the 
>>> author.  Those two facts conflict.
>>>
>>> Did Mayank author this and you are just submitting it on his behalf, 
>>> or did the two of you co-author this?
>>
>> In downstream, Mayank made this change and I modified it for 
>> upstream. Will it be accepted if I write the SOBs as following? I see 
>> this example
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.5-rc2&id=7450aa5153af55a0c63785a6917e35a989a4fdf5 
>>
>>
>> Signed-off-by: Mayank Rana <quic_mrana@quicinc.com>
>> [quic_qianyu@quicinc.com: Update commit message, minor updates]
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>
> This would be good.  However it doesn't fully address my concern.
>
> I hope you are using patch files and git send-email.  Before you send 
> the patch file, please open it in your favorite editor and look at the 
> second line.  It should start with "From:".  Right now, I suspect it 
> looks like:
>
> From: Qiang Yu <quic_qianyu@quicinc.com>
>
> However, based on what you described, it should look like:
>
> From: Mayank Rana <quic_mrana@quicinc.com>
>
> The From: line tells us who originally authored the change (lets 
> ignore changes with multiple authors for this discussion) and must 
> match the first SOB listed.  Since Mayank authored the change and is 
> the first SOB listed, the patch should be "from" him.
Thank you for pointing it out. Will change to "From: Mayank Rana 
<quic_mrana@quicinc.com>" .
>
>>
>>>
>>>> ---
>>>>   drivers/bus/mhi/host/boot.c | 24 +++++++++++++++++-------
>>>>   include/linux/mhi.h         |  2 ++
>>>>   2 files changed, 19 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>>>> index d2a19b07..563b011 100644
>>>> --- a/drivers/bus/mhi/host/boot.c
>>>> +++ b/drivers/bus/mhi/host/boot.c
>>>> @@ -365,12 +365,13 @@ int mhi_alloc_bhie_table(struct 
>>>> mhi_controller *mhi_cntrl,
>>>>   }
>>>>     static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
>>>> -                  const struct firmware *firmware,
>>>> +                  const u8 *image_buf,
>>>> +                  size_t img_size,
>>>>                     struct image_info *img_info)
>>>>   {
>>>> -    size_t remainder = firmware->size;
>>>> +    size_t remainder = img_size;
>>>>       size_t to_cpy;
>>>> -    const u8 *buf = firmware->data;
>>>> +    const u8 *buf = image_buf;
>>>>       struct mhi_buf *mhi_buf = img_info->mhi_buf;
>>>>       struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
>>>>   @@ -395,8 +396,9 @@ void mhi_fw_load_handler(struct 
>>>> mhi_controller *mhi_cntrl)
>>>>       const char *fw_name;
>>>>       void *buf;
>>>>       dma_addr_t dma_addr;
>>>> -    size_t size;
>>>> +    size_t size, img_size;
>>>>       int i, ret;
>>>> +    const u8 *img_buf;
>>>>         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>>>>           dev_err(dev, "Device MHI is not in valid state\n");
>>>> @@ -478,15 +480,23 @@ void mhi_fw_load_handler(struct 
>>>> mhi_controller *mhi_cntrl)
>>>>        * device transitioning into MHI READY state
>>>>        */
>>>>       if (mhi_cntrl->fbc_download) {
>>>> -        ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>>>> -                       firmware->size);
>>>> +        img_size = firmware->size;
>>>> +        img_buf = firmware->data;
>>>> +        dev_dbg(dev, "tme_supported_image:%s\n",
>>>> +                (mhi_cntrl->tme_supported_image ? "True" : "False"));
>>>> +        if (mhi_cntrl->tme_supported_image) {
>>>> +            img_buf = firmware->data + mhi_cntrl->sbl_size;
>>>> +            img_size = img_size - mhi_cntrl->sbl_size;
>>>> +        }
>>>> +
>>>> +        ret = mhi_alloc_bhie_table(mhi_cntrl, 
>>>> &mhi_cntrl->fbc_image, img_size);
>>>>           if (ret) {
>>>>               release_firmware(firmware);
>>>>               goto error_fw_load;
>>>>           }
>>>>             /* Load the firmware into BHIE vec table */
>>>> -        mhi_firmware_copy(mhi_cntrl, firmware, mhi_cntrl->fbc_image);
>>>> +        mhi_firmware_copy(mhi_cntrl, img_buf, img_size, 
>>>> mhi_cntrl->fbc_image);
>>>>       }
>>>>         release_firmware(firmware);
>>>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>>>> index f6de4b6..5f46dc9 100644
>>>> --- a/include/linux/mhi.h
>>>> +++ b/include/linux/mhi.h
>>>> @@ -306,6 +306,7 @@ struct mhi_controller_config {
>>>>    * @reg_len: Length of the MHI MMIO region (required)
>>>>    * @fbc_image: Points to firmware image buffer
>>>>    * @rddm_image: Points to RAM dump buffer
>>>> + * @tme_supported_image: Flag to make decision about firmware 
>>>> download start address (optional)
>>>>    * @mhi_chan: Points to the channel configuration table
>>>>    * @lpm_chans: List of channels that require LPM notifications
>>>>    * @irq: base irq # to request (required)
>>>> @@ -391,6 +392,7 @@ struct mhi_controller {
>>>>       size_t reg_len;
>>>>       struct image_info *fbc_image;
>>>>       struct image_info *rddm_image;
>>>> +    bool tme_supported_image;
>>>
>>> A bool in the middle of several pointers?  Surely that makes the 
>>> pahole output rather sad?  A lot of work went into the organization 
>>> of this structure.
>> Can I add the flag under bool wake_set, and change the flag name to 
>> standard_elf_image?
>>      bool bounce_buf;
>>      bool fbc_download;
>>      bool edl_download;
>>
>>      bool wake_set;
>>
>> +  bool standard_elf_image
>
> This seems good to me.  Remember to adjust your addition to the 
> structure description comment when you do this.

Thanks, will also adjust the structure description comment.

BTW, "[PATCH v4 1/3] bus: mhi: host: allow MHI client drivers to provide 
the firmware via a pointer" from Kalle Valo has got reviewed-by tag,
my patch will have conflicts with his, do I have to send my V2 patch 
until his patch get merged?

>
>>
>> Thanks again and looking forward to your further review.
>>>
>>>>       struct mhi_chan *mhi_chan;
>>>>       struct list_head lpm_chans;
>>>>       int *irq;
>>>
>
