Return-Path: <linux-arm-msm+bounces-41857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D659EFE93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 22:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB8EC188EA1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 21:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B7B19995A;
	Thu, 12 Dec 2024 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="abykQa+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052F41DC074;
	Thu, 12 Dec 2024 21:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734039717; cv=none; b=RF/QQt/vY1oSB4sV5DlAp1sjEUYh4aDfhjjAI9wD6rgKAQli1chPi/hU9Qb/BODvyacpQpdjvKOzoM/MtUbDVNrwnoIy5UMEH7JMeF0Zi4HhA6DOBw9UUquQar27iouJz7EOmsL5H5MD1e2jZHue+TxEAaSYTrVawIpEWWMgAVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734039717; c=relaxed/simple;
	bh=tNZ1E2etLfiPcjnAFZ05VUtnnHWfPmwpzVH3DDeDvK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X66irttOmmqHkQuuWlQ5gB61vpF3ZiYs1QS8Qx+PGLFCQy3YcIhdeJ0jrRbwuhHsS1qqW7aKhODLK7N1s7aVK6IdoXkMVfOyDSaoLeu+ehmHickluLyim8/2ROT8aHZG/JjillgUHGLUWntAYWWnpj6Pn32mfFVmtGHrzQYQKWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=abykQa+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHDT4j032125;
	Thu, 12 Dec 2024 21:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Om1zsw/Zc+hL2Ghea70rvaOGhofExIkR5yfS8LyQX0=; b=abykQa+hEnxM7F2M
	LqfWogNywimUX3I2JobwLhY0oRyBHTIKJ5Mc7fk/zBC9WGVS23xrIwerJUi3JR0h
	cRsPltwzcaox2MWIXdR6PXmEJ6d43qj7ubQuDPQ89fsSynRk6CJt2zBPnMqhnHXz
	NNIHJmYSpeK9b044KHtOyFp4K+eQErup6t33hXt2gdDb4RY1zpVis2ztf+ADQRW4
	/sWP7uygcoFMss91S7wtnWtMyuAma9dAIrorl3qLhtOwgVmfWmcMfDa8NvVtBKOs
	kCD3+hSDi1GB1+LPcUlnys6AMw9zCoeGP/DhFgU2nLykloT3QDn6BRBX8kmT9glP
	4ZrxKg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfdhyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:41:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCLfiaT019025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 21:41:44 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 13:41:42 -0800
Message-ID: <070dea1a-c300-4968-ba24-011625e4c133@quicinc.com>
Date: Thu, 12 Dec 2024 13:41:41 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
CC: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd
	<swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-9-0b1c65e7dba3@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-9-0b1c65e7dba3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qTvo998WlMVw8kSiU3rAAyj4vR9PLZHL
X-Proofpoint-ORIG-GUID: qTvo998WlMVw8kSiU3rAAyj4vR9PLZHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120158



On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> to program audio packet data. Use 0 as Packet ID, as it was not
> programmed earlier.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c | 288 +++++++++-----------------------------
>   1 file changed, 66 insertions(+), 222 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 5cbb11986460d1e4ed1890bdf66d0913e013083c..1aa52d5cc08684a49102e45ed6e40ac2b13497c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -14,6 +14,7 @@
>   #include "dp_catalog.h"
>   #include "dp_audio.h"
>   #include "dp_panel.h"
> +#include "dp_reg.h"
>   #include "dp_display.h"
>   #include "dp_utils.h"
>   
> @@ -28,251 +29,94 @@ struct msm_dp_audio_private {
>   	struct msm_dp_audio msm_dp_audio;
>   };
>   
> -static u32 msm_dp_audio_get_header(struct msm_dp_catalog *catalog,
> -		enum msm_dp_catalog_audio_sdp_type sdp,
> -		enum msm_dp_catalog_audio_header_type header)
> -{
> -	return msm_dp_catalog_audio_get_header(catalog, sdp, header);
> -}
> -
> -static void msm_dp_audio_set_header(struct msm_dp_catalog *catalog,
> -		u32 data,
> -		enum msm_dp_catalog_audio_sdp_type sdp,
> -		enum msm_dp_catalog_audio_header_type header)
> -{
> -	msm_dp_catalog_audio_set_header(catalog, sdp, header, data);
> -}
> -
>   static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
>   {
>   	struct msm_dp_catalog *catalog = audio->catalog;
> -	u32 value, new_value;
> -	u8 parity_byte;
> -
> -	/* Config header and parity byte 1 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
> -
> -	new_value = 0x02;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_1_BIT)
> -			| (parity_byte << PARITY_BYTE_1_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
> -
> -	/* Config header and parity byte 2 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
> -	new_value = value;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_2_BIT)
> -			| (parity_byte << PARITY_BYTE_2_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
> -
> -	/* Config header and parity byte 3 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
> -
> -	new_value = audio->channels - 1;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_3_BIT)
> -			| (parity_byte << PARITY_BYTE_3_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> -		value, parity_byte);
> -
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
> +	struct dp_sdp_header sdp_hdr = {
> +		.HB0 = 0x00,
> +		.HB1 = 0x02,
> +		.HB2 = 0x00,
> +		.HB3 = audio->channels - 1,
> +	};
> +	u32 header[2];
> +
> +	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
>   }

This patch is changing the programming behavior.

Earlier it was using a read/modify/write on each register. Now, its just 
  a write. I checked a few chipsets, the reset value of registers was 0, 
so that part is okay.

But, for the MMSS_DP_AUDIO_STREAM_0 register, earlier we were writing 
only the upper nibble, that is bits 15:0 of DP_AUDIO_SDP_HEADER_0 was 
kept as-it-is, but now this patch is changing that to 0. What was the 
reason for that change?

This is true for all the APIs being touched in this file.

I guess the whole point of having that audio map in the catalog was to 
preserve the read values of these registers. I have to check what was 
the reason behind that as once again this was before I worked on this 
driver as well.

So technically there are two parts to this change:

1) dropping read for each header and directly just writing it
2) Writing the registers directly instead of going through catalog

It seems like (1) and (2) are independent. I hope (1) was not the reason 
to have started this whole rework.

>   
>   static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
>   {
>   	struct msm_dp_catalog *catalog = audio->catalog;
> -	u32 value, new_value;
> -	u8 parity_byte;
> -
> -	/* Config header and parity byte 1 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
> -
> -	new_value = 0x1;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_1_BIT)
> -			| (parity_byte << PARITY_BYTE_1_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
> -
> -	/* Config header and parity byte 2 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
> -
> -	new_value = 0x17;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_2_BIT)
> -			| (parity_byte << PARITY_BYTE_2_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
> -
> -	/* Config header and parity byte 3 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
> -
> -	new_value = (0x0 | (0x11 << 2));
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_3_BIT)
> -			| (parity_byte << PARITY_BYTE_3_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
> +	struct dp_sdp_header sdp_hdr = {
> +		.HB0 = 0x00,
> +		.HB1 = 0x01,
> +		.HB2 = 0x17,
> +		.HB3 = 0x0 | (0x11 << 2),
> +	};
> +	u32 header[2];
> +
> +	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
>   }
>   
>   static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
>   {
>   	struct msm_dp_catalog *catalog = audio->catalog;
> -	u32 value, new_value;
> -	u8 parity_byte;
> -
> -	/* Config header and parity byte 1 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
> -
> -	new_value = 0x84;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_1_BIT)
> -			| (parity_byte << PARITY_BYTE_1_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
> -
> -	/* Config header and parity byte 2 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
> -
> -	new_value = 0x1b;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_2_BIT)
> -			| (parity_byte << PARITY_BYTE_2_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
> -
> -	/* Config header and parity byte 3 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
> -
> -	new_value = (0x0 | (0x11 << 2));
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_3_BIT)
> -			| (parity_byte << PARITY_BYTE_3_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> -			new_value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
> +	struct dp_sdp_header sdp_hdr = {
> +		.HB0 = 0x00,
> +		.HB1 = 0x84,
> +		.HB2 = 0x1b,
> +		.HB3 = 0x0 | (0x11 << 2),
> +	};
> +	u32 header[2];
> +
> +	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
>   }
>   
>   static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
>   {
>   	struct msm_dp_catalog *catalog = audio->catalog;
> -	u32 value, new_value;
> -	u8 parity_byte;
> -
> -	/* Config header and parity byte 1 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
> -
> -	new_value = 0x05;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_1_BIT)
> -			| (parity_byte << PARITY_BYTE_1_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
> -
> -	/* Config header and parity byte 2 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
> -
> -	new_value = 0x0F;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_2_BIT)
> -			| (parity_byte << PARITY_BYTE_2_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
> -
> -	/* Config header and parity byte 3 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
> -
> -	new_value = 0x0;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_3_BIT)
> -			| (parity_byte << PARITY_BYTE_3_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
> +	struct dp_sdp_header sdp_hdr = {
> +		.HB0 = 0x00,
> +		.HB1 = 0x05,
> +		.HB2 = 0x0f,
> +		.HB3 = 0x00,
> +	};
> +	u32 header[2];
> +
> +	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
>   }
>   
>   static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
>   {
>   	struct msm_dp_catalog *catalog = audio->catalog;
> -	u32 value, new_value;
> -	u8 parity_byte;
> -
> -	/* Config header and parity byte 1 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
> -
> -	new_value = 0x06;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_1_BIT)
> -			| (parity_byte << PARITY_BYTE_1_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
> -
> -	/* Config header and parity byte 2 */
> -	value = msm_dp_audio_get_header(catalog,
> -			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
> -
> -	new_value = 0x0F;
> -	parity_byte = msm_dp_utils_calculate_parity(new_value);
> -	value |= ((new_value << HEADER_BYTE_2_BIT)
> -			| (parity_byte << PARITY_BYTE_2_BIT));
> -	drm_dbg_dp(audio->drm_dev,
> -			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
> -			value, parity_byte);
> -	msm_dp_audio_set_header(catalog, value,
> -		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
> +	struct dp_sdp_header sdp_hdr = {
> +		.HB0 = 0x00,
> +		.HB1 = 0x06,
> +		.HB2 = 0x0f,
> +		.HB3 = 0x00,
> +	};
> +	u32 header[2];
> +	u32 reg;
> +
> +	/* XXX: is it necessary to preserve this field? */
> +	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
> +	sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
> +
> +	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
>   }
>   
>   static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
> 

