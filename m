Return-Path: <linux-arm-msm+bounces-9278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32182844EE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 02:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 574471C20974
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Feb 2024 01:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB76EAF5;
	Thu,  1 Feb 2024 01:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D24HnX1q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7CCEACC
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Feb 2024 01:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706752601; cv=none; b=RZ+dfyo0cSvdrYuHdizSwQkxsjZWC3Yn2wX9TbXTXKM4KWWnnWfFyK4K60OtZrWfeKd3nR2xy0pMQXHCe44V2+HTQwhgkADod5xaXz4sufI5yIH6rnkfR/wbXdjcoZ85/87X71mlHr/hgcUk44faHucHdjXnKDHG4Uc7vUf3jeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706752601; c=relaxed/simple;
	bh=PeR8iry20/wdWRp6gIkvLoDvuzKjX1odT6u2a5E+kI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Lfh3aQhSFT9g6jI/aiGUKTLJE6H6EgKBEAlxYKytT9g6ROu7/5wVwlY6kBe4Y/yNqaZm3cFfd6yBVYBnj1vzBbgMdNcaFmgyWj7dQ8dRsQOQJAHOHmhGOHJMGmyFeoD7/0mOYv28s9sCq7zy4Rwrslc2xMFOBRZrc8cyytblRMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D24HnX1q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4110wEXi017049;
	Thu, 1 Feb 2024 01:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=6toFNjYtDkRzazZHuxNPiuSBPGge0csmhQ2WT8ZDN8w=; b=D2
	4HnX1qrcwvRWsd21W/OJfdGrFi6WABUpEd/mSsr//TopSHxAxrjBr42bMbPud0l1
	WTqvH0yIqJ6vlGeVZjkcyttvodMJ8aZW6AId/ExjJu9A0S8RCK0UVj3HqWwAbuhz
	xAhEx+bajKmj4mArJvwyiq44iN/kUqBvG4KSWwE8PgdbH0VHs0Fuk6K+O5D8A8n5
	0Mkp11Y070WEH5ectAexy8F16LBmDKDAE9lbiNpUBJT6uoIdhH9lKXBQPTcCXDYL
	GaZ1QITfOJw6pMQg9Yzr7VgzHOIa1yBrq5Be4rLO4c1A5SvoPiD/qJI62f52k2ca
	fcWinqAy8Gccl8M0P6IA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyqvehmqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 01:56:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4111uUgJ025116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Feb 2024 01:56:30 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 17:56:29 -0800
Message-ID: <6fd0cc09-a1c4-123e-966d-111d44263286@quicinc.com>
Date: Wed, 31 Jan 2024 17:56:29 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 11/17] drm/msm/dp: add VSC SDP support for YUV420 over DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Paloma Arellano
	<quic_parellan@quicinc.com>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-12-quic_parellan@quicinc.com>
 <d94434ec-00fd-489f-98f2-8c811522ff82@linaro.org>
 <11c6fdbe-f85a-088d-92df-abd8405c966b@quicinc.com>
 <CAA8EJprPziRHhxVK9mAdQZNEeon9q95ZMKSBhs-s95O-7W10NA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprPziRHhxVK9mAdQZNEeon9q95ZMKSBhs-s95O-7W10NA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hGqkDJlsi80YMVKp2RxtfRaCp-dhNty_
X-Proofpoint-GUID: hGqkDJlsi80YMVKp2RxtfRaCp-dhNty_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2402010013



On 1/27/2024 9:39 PM, Dmitry Baryshkov wrote:
> On Sun, 28 Jan 2024 at 07:34, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>
>>
>> On 1/25/2024 1:48 PM, Dmitry Baryshkov wrote:
>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>> Add support to pack and send the VSC SDP packet for DP. This therefore
>>>> allows the transmision of format information to the sinks which is
>>>> needed for YUV420 support over DP.
>>>>
>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 147 ++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   |  47 +++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
>>>>    5 files changed, 205 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>> index c025786170ba5..7e4c68be23e56 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>>> @@ -29,6 +29,9 @@
>>>>      #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
>>>>    +#define DP_GENERIC0_6_YUV_8_BPC        BIT(0)
>>>> +#define DP_GENERIC0_6_YUV_10_BPC    BIT(1)
>>>> +
>>>>    #define DP_INTERRUPT_STATUS1 \
>>>>        (DP_INTR_AUX_XFER_DONE| \
>>>>        DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
>>>> @@ -907,6 +910,150 @@ int dp_catalog_panel_timing_cfg(struct
>>>> dp_catalog *dp_catalog)
>>>>        return 0;
>>>>    }
>>>>    +static void dp_catalog_panel_setup_vsc_sdp(struct dp_catalog
>>>> *dp_catalog)
>>>> +{
>>>> +    struct dp_catalog_private *catalog;
>>>> +    u32 header, parity, data;
>>>> +    u8 bpc, off = 0;
>>>> +    u8 buf[SZ_128];
>>>> +
>>>> +    if (!dp_catalog) {
>>>> +        pr_err("invalid input\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    catalog = container_of(dp_catalog, struct dp_catalog_private,
>>>> dp_catalog);
>>>> +
>>>> +    /* HEADER BYTE 1 */
>>>> +    header = dp_catalog->sdp.sdp_header.HB1;
>>>> +    parity = dp_catalog_calculate_parity(header);
>>>> +    data   = ((header << HEADER_BYTE_1_BIT) | (parity <<
>>>> PARITY_BYTE_1_BIT));
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_0, data);
>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>> +    off += sizeof(data);
>>>> +
>>>> +    /* HEADER BYTE 2 */
>>>> +    header = dp_catalog->sdp.sdp_header.HB2;
>>>> +    parity = dp_catalog_calculate_parity(header);
>>>> +    data   = ((header << HEADER_BYTE_2_BIT) | (parity <<
>>>> PARITY_BYTE_2_BIT));
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
>>>> +
>>>> +    /* HEADER BYTE 3 */
>>>> +    header = dp_catalog->sdp.sdp_header.HB3;
>>>> +    parity = dp_catalog_calculate_parity(header);
>>>> +    data   = ((header << HEADER_BYTE_3_BIT) | (parity <<
>>>> PARITY_BYTE_3_BIT));
>>>> +    data |= dp_read_link(catalog, MMSS_DP_GENERIC0_1);
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>> +    off += sizeof(data);
>>>
>>> This seems to be common with the dp_audio code. Please extract this
>>> header writing too.
>> These are two different sdp's. audio and vsc, are different with
>> different registers being written to and different amount of registers
>> being set. Can you please clarify since in audio we only need 3
>> registers to write to, and in vsc we need 10.
> 
> Bitmagic with the header is the same. Then the rest of the data is
> written one dword per register, if I'm not mistaken.
> 

We can generalize the MMSS_DP_GENERIC0 register writing by breaking it 
up to two things:

1) Add a function vsc_sdp_pack() similar to hdmi_avi_infoframe_pack_only()

2) dp_catalog_write_generic_pkt() which will just write the packed 
buffer byte-by-byte to these MMSS_DP_GENERIC0_xxx register

But audio seems a bit different. We use DP_AUDIO_STREAM_0/1.
More importantly, it uses this sdp_map and writes each header one by one 
with dp_catalog_audio_set_header().

Not sure if that entirely fits with this pack and then write model.

It can be simplified. But I dont think this effort is needed for this 
series.

So I would prefer to generalize audio SDP programming separately.

>>>
>>>> +
>>>> +    data = 0;
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_2, data);
>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>> +    off += sizeof(data);
>>>
>>> Generally this is not how these functions are expected to be written.
>>> Please take a look at drivers/video/hdmi.c. It should be split into:
>>> - generic function that packs the C structure into a flat byte buffer,
>>> - driver-specific function that formats and writes the buffer to the
>>> hardware.
>>>
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_3, data);
>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>> +    off += sizeof(data);
>>>> +
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_4, data);
>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>> +    off += sizeof(data);
>>>> +
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_5, data);
>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>> +    off += sizeof(data);
>>>> +
>>>> +    switch (dp_catalog->vsc_sdp_data.bpc) {
>>>> +    case 10:
>>>> +        bpc = DP_GENERIC0_6_YUV_10_BPC;
>>>> +        break;
>>>> +    case 8:
>>>> +    default:
>>>> +        bpc = DP_GENERIC0_6_YUV_8_BPC;
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    /* VSC SDP payload as per table 2-117 of DP 1.4 specification */
>>>> +    data = (dp_catalog->vsc_sdp_data.colorimetry & 0xF) |
>>>> +           ((dp_catalog->vsc_sdp_data.pixelformat & 0xF) << 4) |
>>>> +           (bpc << 8) |
>>>> +           ((dp_catalog->vsc_sdp_data.dynamic_range & 0x1) << 15) |
>>>> +           ((dp_catalog->vsc_sdp_data.content_type & 0x7) << 16);
>>>> +
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_6, data);
>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>> +    off += sizeof(data);
>>>> +
>>>> +    data = 0;
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_7, data);
>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>> +    off += sizeof(data);
>>>> +
>>>> +    dp_write_link(catalog, MMSS_DP_GENERIC0_8, data);
>>>> +    memcpy(buf + off, &data, sizeof(data));
>>>> +    off += sizeof(data);
> 
> 

