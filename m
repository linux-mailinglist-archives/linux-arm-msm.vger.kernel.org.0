Return-Path: <linux-arm-msm+bounces-42377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C09F39EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 20:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95CB6161A83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD1C148314;
	Mon, 16 Dec 2024 19:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vv58uAt2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8EA61FF2;
	Mon, 16 Dec 2024 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377591; cv=none; b=vEt2TPy3KuMwSXSIysthgxljxb5iRQM4LCPXFWzXS88ywelUdqfGsJucIdOT3qWvoOMc35XPo5catGGNNarFjR/FDlbAXXOp3Pdg3aPcn6HLK4ZoEzi0vH9SiPG65ELoQTSPh5Kcfo1vJUTDvstRyBXsTtPxuQtee7/eT+lhgVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377591; c=relaxed/simple;
	bh=U1fbGO0BSNRpKiIjjNf+s/CPVnOP8eDf6pahtLW3rcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GDLPoWywnhv9vUK+q3Hz+HgTH0Gjz3P7li/hZ7regogLhqBi1PfPiaWJVI3BOk6Kdu82zu3rPzQa86U7cDRo2uZBaoResmgJTsyfjB16gXYsSxgGZvnDW9cPJPD1FYVwlG58+s4L7LcF3ibp1WbipiZkwPch5XxKqIo1sSAfcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vv58uAt2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGJ7jpK022392;
	Mon, 16 Dec 2024 19:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hwarrb2xkt4Df2SqtitlS/S7AbnfxS7sGXFzsoFEwWg=; b=Vv58uAt2j37qFfB3
	klTvBiyJhvOT6p7UzmkCJK/W761VaVymPR3mIiyM+fFFPBWBMqQyDmVuCzl+n5Bn
	/jUt4MkzT/0SgxqKu71rAYHoxuakbT4knctMxhT+tTMO7NOfJ0ye4mxWsLe3JU7I
	Umo0/IxTnMHwYkHXJejl+spTualaoYVoQWeZ2J00eSBgDAsoR3ktlyA4s9VU19Ag
	aScbRFkLlGdOERNSdGRiCihWyCyw+ONMiA7P2MxteZSvCxH4hobzFLT5STCSs6J4
	nfqFAyCRfBWKvNQRkzbnIaazHBV/JpgpXRCuDLXAml/fBB0Kh11zIdWNtaQuZVES
	IAxEuA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgrr9s2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:33:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGJX0fj020921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:33:00 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 11:32:58 -0800
Message-ID: <0cbe48cd-b830-444a-8de0-529343d86192@quicinc.com>
Date: Mon, 16 Dec 2024 11:32:57 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
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
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4aO7QFkh3Wz9UKW4dyj__2UrxqwR-yAs
X-Proofpoint-GUID: 4aO7QFkh3Wz9UKW4dyj__2UrxqwR-yAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160161



On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> to program audio packet data. Use 0 as Packet ID, as it was not
> programmed earlier.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c   | 268 ++++++------------------------------
>   drivers/gpu/drm/msm/dp/dp_catalog.c |  71 ++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  10 ++
>   3 files changed, 122 insertions(+), 227 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 5cbb11986460d1e4ed1890bdf66d0913e013083c..46fbf8601eea8e43a152049dfd1dc1d77943d922 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -14,6 +14,7 @@
>   #include "dp_catalog.h"
>   #include "dp_audio.h"
>   #include "dp_panel.h"
> +#include "dp_reg.h"

This change still does reg writes through catalog. Why do you need to 
include dp_reg.h here?

>   #include "dp_display.h"
>   #include "dp_utils.h"
>   
> @@ -28,251 +29,64 @@ struct msm_dp_audio_private {
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
> -	struct msm_dp_catalog *catalog = audio->catalog;
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
> +
> +	msm_dp_catalog_write_audio_stream(audio->catalog, &sdp_hdr);
>   }
>   
>   static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
>   {
> -	struct msm_dp_catalog *catalog = audio->catalog;
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
> +
> +	msm_dp_catalog_write_audio_timestamp(audio->catalog, &sdp_hdr);
>   }
>   
>   static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
>   {
> -	struct msm_dp_catalog *catalog = audio->catalog;
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
> +
> +	msm_dp_catalog_write_audio_infoframe(audio->catalog, &sdp_hdr);
>   }
>   
>   static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
>   {
> -	struct msm_dp_catalog *catalog = audio->catalog;
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
> +
> +	msm_dp_catalog_write_audio_copy_mgmt(audio->catalog, &sdp_hdr);
>   }
>   
>   static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
>   {
> -	struct msm_dp_catalog *catalog = audio->catalog;
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
> +
> +	msm_dp_catalog_write_audio_isrc(audio->catalog, &sdp_hdr);
>   }
>   
>   static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 6a30996200bc7fbaacd0502f096e787f754752de..8fddfe5d85d6398c6582e1f74647f4cd83f5a4d9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -1122,6 +1122,77 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
>   	return &catalog->msm_dp_catalog;
>   }
>   
> +void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
> +				       struct dp_sdp_header *sdp_hdr)
> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +				struct msm_dp_catalog_private, msm_dp_catalog);
> +	u32 header[2];
> +
> +	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
> +}
> +
> +void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
> +					  struct dp_sdp_header *sdp_hdr)
> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +				struct msm_dp_catalog_private, msm_dp_catalog);
> +	u32 header[2];
> +
> +	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
> +}
> +
> +void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
> +					  struct dp_sdp_header *sdp_hdr)
> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +				struct msm_dp_catalog_private, msm_dp_catalog);
> +	u32 header[2];
> +
> +	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
> +}
> +
> +void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
> +					  struct dp_sdp_header *sdp_hdr)
> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +				struct msm_dp_catalog_private, msm_dp_catalog);
> +	u32 header[2];
> +
> +	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
> +}
> +
> +void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
> +				     struct dp_sdp_header *sdp_hdr)
> +{
> +	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
> +				struct msm_dp_catalog_private, msm_dp_catalog);
> +	struct dp_sdp_header tmp = *sdp_hdr;
> +	u32 header[2];
> +	u32 reg;
> +
> +	/* XXX: is it necessary to preserve this field? */
> +	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
> +	tmp.HB3 = FIELD_GET(HEADER_3_MASK, reg);
> +
> +	msm_dp_utils_pack_sdp_header(&tmp, header);
> +
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
> +	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
> +}
> +
>   u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
>   				enum msm_dp_catalog_audio_sdp_type sdp,
>   				enum msm_dp_catalog_audio_header_type header)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 62a401d8f75a6af06445a42af657d65e3fe542c5..4a5591d9f82a21d7a3bb64ad6b486e39bd406cd5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -111,6 +111,16 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
>   struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
>   
>   /* DP Audio APIs */
> +void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
> +				       struct dp_sdp_header *sdp_hdr);
> +void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
> +					  struct dp_sdp_header *sdp_hdr);
> +void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
> +					  struct dp_sdp_header *sdp_hdr);
> +void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
> +					  struct dp_sdp_header *sdp_hdr);
> +void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
> +				     struct dp_sdp_header *sdp_hdr);
>   u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
>   				enum msm_dp_catalog_audio_sdp_type sdp,
>   				enum msm_dp_catalog_audio_header_type header);
> 

