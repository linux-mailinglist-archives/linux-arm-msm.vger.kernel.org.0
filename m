Return-Path: <linux-arm-msm+bounces-10549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AEC8507B2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 05:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B43EB227A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 04:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB029FBF3;
	Sun, 11 Feb 2024 04:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WOI241wG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC09290A;
	Sun, 11 Feb 2024 04:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707624410; cv=none; b=HmiBrfU2K1QqSKt5SCrtAJmT7KZh6cpsyQedU3TCwlz8A8CbtaGKH98ttYKulSip1eidL6GlcUVxSreMynpE8cRqy2EQ90fkVXoITmRWu97fkS5vqV8aTMt9sMe91eIRjv4sqb0plYlm9s8hGjxo9ghkiFBs0o296QJ+mXAgfYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707624410; c=relaxed/simple;
	bh=qG6su5loYMjrhmEhFxVZQu+qsjjXxwE0bl8ZY+ycKGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EGuV4Cet++c0pc6oxyLVVA/PEkiNMGY+s79ywm0MTYwPTLDMZE/qx1isnj0vF7y48fHOP7exmNURihKFkIxe14sBuyOJ6S9WU0xPTr7OjOyROozt+AJqzvBBa1c89xYIdWNrg77p3j+W0DVzoyyg8L8quq6IYJ49QtYj6xJuqh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WOI241wG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41B3iVOS024923;
	Sun, 11 Feb 2024 04:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7fIiK3wyBMs3zBW+j8bs3NHlCqPJY3wAvpIyuNUJnIM=; b=WO
	I241wG4pMZ4IUZNgoK6RJHufO4mRZ806Dqb54mQT85+yuuMPtW1u0FGWXmoNrzxY
	65drwXRRthrRYfglW2P1qoZjGdaJK48iuWSUZrbP/ALkWUoZUo7VkCpuXcLOqbmM
	QgR7aMJFBh5sUU/tQXtnhZTJqgq607FRjPHLaCmKWOO+4IHsa3kyJLaACfsRhFrY
	jXofOP4IbpfbYEsJjU3/WY5RN1ohjIttK9TOdaFoQMROKtMRbOEEWFJgxDAexha+
	XKi8MyN99YVaopIMEiTc/iGiWjT0ri0dxQyMiVA2fuKOOgHTum0SB/uQ1EvCrAP6
	RNZoAbUgEPt2A1XXGNfw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62q2s90t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 Feb 2024 04:06:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41B46UxP010406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 Feb 2024 04:06:30 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 10 Feb
 2024 20:06:28 -0800
Message-ID: <b1793aab-6fd7-14d9-baec-834bc63dae2d@quicinc.com>
Date: Sat, 10 Feb 2024 20:06:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
 DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>, Helge Deller <deller@gmx.de>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>,
        <linux-fbdev@vger.kernel.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-14-quic_parellan@quicinc.com>
 <CAA8EJpq6EFn6xix2GLej=bB2JCP7btuQ+zugeJTeLBH+mVKdSg@mail.gmail.com>
 <6f4a0a31-e17a-3301-aacf-a88f458db6f3@quicinc.com>
 <8f728a4d-eb62-add1-1f67-8085eaea3102@quicinc.com>
 <CAA8EJpoct4xTYL38zNOuD=cy9J4_2dStGh+r2YKUdSxRQ8Zhgw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoct4xTYL38zNOuD=cy9J4_2dStGh+r2YKUdSxRQ8Zhgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9srwWIIl54XInskjHjCoi7pNaVcBvvaJ
X-Proofpoint-GUID: 9srwWIIl54XInskjHjCoi7pNaVcBvvaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-11_03,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402110032



On 2/10/2024 1:46 PM, Dmitry Baryshkov wrote:
> On Sat, 10 Feb 2024 at 20:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/10/2024 10:14 AM, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/10/2024 2:09 AM, Dmitry Baryshkov wrote:
>>>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano
>>>> <quic_parellan@quicinc.com> wrote:
>>>>>
>>>>> Add support to pack and send the VSC SDP packet for DP. This therefore
>>>>> allows the transmision of format information to the sinks which is
>>>>> needed for YUV420 support over DP.
>>>>>
>>>>> Changes in v2:
>>>>>           - Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
>>>>>           - Remove dp_sdp from the dp_catalog struct since this data is
>>>>>             being allocated at the point used
>>>>>           - Create a new function in dp_utils to pack the VSC SDP data
>>>>>             into a buffer
>>>>>           - Create a new function that packs the SDP header bytes into a
>>>>>             buffer. This function is made generic so that it can be
>>>>>             utilized by dp_audio
>>>>>             header bytes into a buffer
>>>>>           - Create a new function in dp_utils that takes the packed
>>>>> buffer
>>>>>             and writes to the DP_GENERIC0_* registers
>>>>>           - Split the dp_catalog_panel_config_vsc_sdp() function into two
>>>>>             to disable/enable sending VSC SDP packets
>>>>>           - Check the DP HW version using the original useage of
>>>>>             dp_catalog_hw_revision() and correct the version checking
>>>>>             logic
>>>>>           - Rename dp_panel_setup_vsc_sdp() to
>>>>>             dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
>>>>>             currently VSC SDP is only being set up to support YUV420
>>>>> modes
>>>>>
>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 105 ++++++++++++++++++++++++++++
>>>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |   6 ++
>>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 ++
>>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   |  59 ++++++++++++++++
>>>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
>>>>>    drivers/gpu/drm/msm/dp/dp_utils.c   |  80 +++++++++++++++++++++
>>>>>    drivers/gpu/drm/msm/dp/dp_utils.h   |   3 +
>>>>>    7 files changed, 260 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>>> index 5d84c089e520a..0f28a4897b7b7 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>>> @@ -901,6 +901,111 @@ int dp_catalog_panel_timing_cfg(struct
>>>>> dp_catalog *dp_catalog)
>>>>>           return 0;
>>>>>    }
>>>>>

<Snip>

>>>>> +static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
>>>>> +{
>>>>> +       struct dp_catalog *catalog;
>>>>> +       struct dp_panel_private *panel;
>>>>> +       struct dp_display_mode *dp_mode;
>>>>> +       struct dp_sdp_header sdp_header;
>>>>> +       struct drm_dp_vsc_sdp vsc_sdp_data;
>>>>> +       size_t buff_size;
>>>>> +       u32 gen_buffer[10];
>>>>> +       int rc = 0;
>>>>> +
>>>>> +       if (!dp_panel) {
>>>>> +               DRM_ERROR("invalid input\n");
>>>>> +               rc = -EINVAL;
>>>>> +               return rc;
>>>>> +       }
>>>>> +
>>>>> +       panel = container_of(dp_panel, struct dp_panel_private,
>>>>> dp_panel);
>>>>> +       catalog = panel->catalog;
>>>>> +       dp_mode = &dp_panel->dp_mode;
>>>>> +       buff_size = sizeof(gen_buffer);
>>>>> +
>>>>> +       memset(&sdp_header, 0, sizeof(sdp_header));
>>>>> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
>>>>> +
>>>>> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
>>>>> +       sdp_header.HB0 = 0x00;
>>>>> +       sdp_header.HB1 = 0x07;
>>>>> +       sdp_header.HB2 = 0x05;
>>>>> +       sdp_header.HB3 = 0x13;
>>>>
>>>> This should go to the packing function.
>>>>
>>>
>>> We can .... but ....
>>>
>>> the header bytes can change based on the format. These values are
>>> specific to YUV420. Thats why this part was kept outside of the generic
>>> vsc sdp packing. Today we support only YUV420 VSC SDP so we can move it
>>> but this was the reason.
> 
> These values can be set from the sdp_type, revision and length fields
> of struct drm_dp_vsc_sdp.
> The function intel_dp_vsc_sdp_pack() is pretty much close to what I had in mind.
> 
>>>
>>>>> +
>>>>> +       /* VSC SDP Payload for DB16 */
>>>>
>>>> Comments are useless more or less. The code fills generic information
>>>> structure which might or might not be packed to the data buffer.
>>>>
>>>>> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
>>>>> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
>>>>> +
>>>>> +       /* VSC SDP Payload for DB17 */
>>>>> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
>>>>> +
>>>>> +       /* VSC SDP Payload for DB18 */
>>>>> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
>>>>> +
>>>>> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
>>>>
>>>> Consider extracting intel_dp_compute_vsc_colorimetry() and using it.
>>>>
>>>
>>> intel_dp_compute_vsc_colorimetry() uses colorspace property to pick
>>> YUV420, we do not.
> 
> Intel function also uses output_format, but it's true, it is full of
> Intel specifics.
> 
>>> Right now, its a pure driver decision to use YUV420
>>> when the mode is supported only in that format.
>>>
>>> Also, many params are to be used within this function cached inside
>>> intel_crtc_state . We will first need to make that API more generic to
>>> be re-usable by others.
>>>
>>> I think overall, if we want to have a generic packing across vendors, it
>>> needs more work. I think one of us can take that up as a separate effort.
> 
> Ack, I agree here. I did only a quick glance over
> intel_dp_compute_vsc_colorimetry function() beforehand.
> 
>>>
>>>>> +
>>>>> +       rc = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &sdp_header,
>>>>> gen_buffer, buff_size);
>>>>> +       if (rc) {
>>>>> +               DRM_ERROR("unable to pack vsc sdp\n");
>>>>> +               return rc;
>>>>> +       }
>>>>> +
>>>>> +       dp_catalog_panel_enable_vsc_sdp(catalog, gen_buffer);
>>>>> +
>>>>> +       return rc;
>>>>> +}
>>>>> +
>>>>>    void dp_panel_dump_regs(struct dp_panel *dp_panel)
>>>>>    {
>>>>>           struct dp_catalog *catalog;
>>>>> @@ -344,6 +399,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>>>>>           catalog->dp_active = data;
>>>>>
>>>>>           dp_catalog_panel_timing_cfg(catalog);
>>>>> +
>>>>> +       if (dp_panel->dp_mode.out_fmt_is_yuv_420)
>>>>> +               dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
>>>>> +
>>>>>           panel->panel_on = true;
>>>>>
>>>>>           return 0;
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h
>>>>> b/drivers/gpu/drm/msm/dp/dp_reg.h
>>>>> index ea85a691e72b5..2983756c125cd 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>>>>> @@ -142,6 +142,7 @@
>>>>>    #define DP_MISC0_SYNCHRONOUS_CLK               (0x00000001)
>>>>>    #define DP_MISC0_COLORIMETRY_CFG_SHIFT         (0x00000001)
>>>>>    #define DP_MISC0_TEST_BITS_DEPTH_SHIFT         (0x00000005)
>>>>> +#define DP_MISC1_VSC_SDP                       (0x00004000)
>>>>>
>>>>>    #define REG_DP_VALID_BOUNDARY                  (0x00000030)
>>>>>    #define REG_DP_VALID_BOUNDARY_2                        (0x00000034)
>>>>> @@ -201,9 +202,11 @@
>>>>>    #define MMSS_DP_AUDIO_CTRL_RESET               (0x00000214)
>>>>>
>>>>>    #define MMSS_DP_SDP_CFG                                (0x00000228)
>>>>> +#define GEN0_SDP_EN                            (0x00020000)
>>>>>    #define MMSS_DP_SDP_CFG2                       (0x0000022C)
>>>>>    #define MMSS_DP_AUDIO_TIMESTAMP_0              (0x00000230)
>>>>>    #define MMSS_DP_AUDIO_TIMESTAMP_1              (0x00000234)
>>>>> +#define GENERIC0_SDPSIZE_VALID                 (0x00010000)
>>>>>
>>>>>    #define MMSS_DP_AUDIO_STREAM_0                 (0x00000240)
>>>>>    #define MMSS_DP_AUDIO_STREAM_1                 (0x00000244)
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c
>>>>> b/drivers/gpu/drm/msm/dp/dp_utils.c
>>>>> index 176d839906cec..05e0133eb50f3 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_utils.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_utils.c
>>>>> @@ -4,6 +4,16 @@
>>>>>     */
>>>>>
>>>>>    #include <linux/types.h>
>>>>> +#include <drm/display/drm_dp_helper.h>
>>>>> +#include <drm/drm_print.h>
>>>>> +
>>>>> +#include "dp_utils.h"
>>>>> +
>>>>> +#define DP_GENERIC0_6_YUV_8_BPC                BIT(0)
>>>>> +#define DP_GENERIC0_6_YUV_10_BPC       BIT(1)
>>>>> +
>>>>> +#define DP_SDP_HEADER_SIZE             8
>>>>> +#define DP_VSC_SDP_BUFFER_SIZE         40
>>>>>
>>>>>    u8 dp_utils_get_g0_value(u8 data)
>>>>>    {
>>>>> @@ -69,3 +79,73 @@ u8 dp_utils_calculate_parity(u32 data)
>>>>>
>>>>>           return parity_byte;
>>>>>    }
>>>>> +
>>>>> +int dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32
>>>>> *buffer, size_t buff_size)
>>>>> +{
>>>>> +       u32 header, parity;
>>>>> +
>>>>> +       if (buff_size < DP_SDP_HEADER_SIZE)
>>>>> +               return -ENOSPC;
>>>>> +
>>>>> +       memset(buffer, 0, sizeof(buffer));
>>>>> +
>>>>> +       /* HEADER BYTE 0 */
>>>>> +       header = sdp_header->HB0;
>>>>> +       parity = dp_utils_calculate_parity(header);
>>>>> +       buffer[0]   = ((header << HEADER_BYTE_0_BIT) | (parity <<
>>>>> PARITY_BYTE_0_BIT));
>>>>> +
>>>>> +       /* HEADER BYTE 1 */
>>>>> +       header = sdp_header->HB1;
>>>>> +       parity = dp_utils_calculate_parity(header);
>>>>> +       buffer[0]  |= ((header << HEADER_BYTE_1_BIT) | (parity <<
>>>>> PARITY_BYTE_1_BIT));
>>>>> +
>>>>> +       /* HEADER BYTE 2 */
>>>>> +       header = sdp_header->HB2;
>>>>> +       parity = dp_utils_calculate_parity(header);
>>>>> +       buffer[1]   = ((header << HEADER_BYTE_2_BIT) | (parity <<
>>>>> PARITY_BYTE_2_BIT));
>>>>> +
>>>>> +       /* HEADER BYTE 3 */
>>>>> +       header = sdp_header->HB3;
>>>>> +       parity = dp_utils_calculate_parity(header);
>>>>> +       buffer[1]  |= ((header << HEADER_BYTE_3_BIT) | (parity <<
>>>>> PARITY_BYTE_3_BIT));
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +int dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc_sdp_data,
>>>>> struct dp_sdp_header *sdp_header,
>>>>> +                         u32 *buffer, size_t buff_size)
>>>>> +{
>>>>
>>>> No. This function should pack data into struct dp_sdp and it should go
>>>> to drivers/video/hdmi.c
>>>>
>>>
>>> What is the difference between struct drm_dp_vsc_sdp and struct dp_sdp?
>>>
>>
>> I think you were referring to the fact that instead of a custom buffer,
>> we should use struct dp_sdp to pack elements from struct drm_dp_vsc_sdp.
>>
>> If yes, I agree with this part.
> 
> Yes.
> 
>>
>>> It seems like struct drm_dp_vsc_sdp is more appropriate for this.
>>>
>>> Regarding hdmi.c, I think the packing needs to be more generic to move
>>> it there.
>>>
>>> I am not seeing parity bytes packing with other vendors. So there will
>>> have to be some packing there and then some packing here.
> 
> Yes. Writing the HB + PB seems specific to Qualcomm hardware. At least
> Intel and AMD seem to write header bytes without parity.
> 
>>> Also, like you already noticed, to make the VSC SDP packing more generic
>>> to move to hdmi.c, it needs more work to make it more usable like
>>> supporting all pixel formats and all colorimetry values.
>>>
>>> We do not have that much utility yet for that.
> 
> I think you are mixing the filling of drm_dp_vsc_sdp and packing of
> that struct. I suppose intel_dp_vsc_sdp_pack() can be extracted more
> or less as is.
> Once somebody needs to support 3D (AMD does), they can extend the function.
> 

Yes once I corrected my understanding of using the function to just pack 
struct dp_sdp instead of the buffer, I understood the intention.

We can try it. I have written up a RFC to move the 
intel_dp_vsc_sdp_pack() to drm_dp_helper as that seems more appropriate 
now for it and not hdmi.c as we already have some vsc sdp utils in 
drm_dp_helper.

But before I post, we will do some cleanup and see if things look 
reasonable in this patch too because we will still need to write a 
common utility to pack the parity bytes for the sdp header which we need 
to utilize for audio and vsc sdp in our DP case.

I am thinking of a

struct msm_dp_sdp_pb {
	u8 PB0;
	u8 PB1;
  	u8 PB2;
  	u8 PB3;
} __packed;

struct msm_dp_sdp_with_parity {
	struct dp_sdp vsc_sdp;
	struct msm_dp_sdp_pb pb;
};

intel_dp_vsc_sdp_pack() will pack the struct dp_sdp but we will have to 
do some additional parity byte packing after that. That part will remain 
common for audio and vsc for msm.

