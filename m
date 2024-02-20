Return-Path: <linux-arm-msm+bounces-11912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5F85C463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 20:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D7581F22A01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 19:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F000A78688;
	Tue, 20 Feb 2024 19:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JG48f+o/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C68412F5BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708456287; cv=none; b=mJtMDuJHvCPLr+TmIMHWq6ec/IqMkswmOrq3fJYioDyGp1vXGZF0uyU3aQKBbkSTTq7nAGT/71miot0wXQVef6RIH0LOnf/mmUSDPrRRRFkiayJZwNiM40HwMvPCyEbOxhrcaMZfUQiSqqsQJbyGZiCgpmEn2j3/rBfuAECRysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708456287; c=relaxed/simple;
	bh=dTKmb9N3asuy5m3AaBoBLmOXLR7/705MrBv34iGAsHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ryCQbttWnkZl+xdbKG5plrGpX63H7+eKwDOIOrjnulm6/rrNaXXPOdNoS2G7s6fBAayKy94Vp7OF57MNfNvGHOkmij+90p6QDDkV03Hv37wxsGGCUwkD7oVVePQKHUeo4+0HpSdiHOzdC0SupDPBvkoTNy5RqqphtgW5JGThFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JG48f+o/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KDWVfe030536;
	Tue, 20 Feb 2024 19:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=k5coFD2dm6ziOQ+2MCGWmBiW0babAHkBczzC59EceNo=; b=JG
	48f+o/mMuW7AZl//AXuTp+v8MaZoqvfRjrnb98FJUp7GMrMPx3h2goe4Q97JUoP/
	nw3kA+BSvpvvjfk9RYNFRIRXibEitTFCUl9RFai3bztMmEgIwS47R4IfeMBOmVs+
	mqX1UTGm1nvLa1soHQFphVfzgTSWYm9bK/7yQ5ieQviHfCuYw+A6gjDM+L37qirw
	iWqa/AXPhTD6EDUq1nWZOKgosczyIFsqog3IGfUBeOEMP0lr2eoinuTcYBcqGBUe
	r/75qw7RipXZJi/9t3VYE1lhv2OcR/2NMn5MYKsSb5Gbq3ntBT7swGIW470UptHs
	uMP5utvNSL0ii7/nymdg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wct2sh5k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 19:11:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KJBHLf000646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 19:11:17 GMT
Received: from [10.110.53.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 11:11:17 -0800
Message-ID: <a4d23a83-e922-29f1-1839-cf743d39e6f6@quicinc.com>
Date: Tue, 20 Feb 2024 11:11:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 13/19] drm/msm/dp: add VSC SDP support for YUV420 over
 DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_khsieh@quicinc.com>, <marijn.suijten@somainline.org>,
        <neil.armstrong@linaro.org>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
 <20240216230228.26713-14-quic_parellan@quicinc.com>
 <CAA8EJppO4FcJJex8mBbPoDyUbkn4zFvDFR0h3sOY75Qth15Rng@mail.gmail.com>
 <30f383ce-0952-0dc1-a7a1-a7565526f728@quicinc.com>
 <CAA8EJpr4XKDQELhhnumqmH2Yh4qzh-gypR4tpRQ0eDhSB3U0Sw@mail.gmail.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJpr4XKDQELhhnumqmH2Yh4qzh-gypR4tpRQ0eDhSB3U0Sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jGeJA2GdLSI5hOdLGRZGxgkJV6w0ZorH
X-Proofpoint-ORIG-GUID: jGeJA2GdLSI5hOdLGRZGxgkJV6w0ZorH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=592 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402200138


On 2/20/2024 10:09 AM, Dmitry Baryshkov wrote:
> On Tue, 20 Feb 2024 at 19:55, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>
>> On 2/17/2024 12:56 AM, Dmitry Baryshkov wrote:
>>> On Sat, 17 Feb 2024 at 01:03, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>> +       }
>>>> +
>>>> +       panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>>>> +       catalog = panel->catalog;
>>>> +       dp_mode = &dp_panel->dp_mode;
>>>> +
>>>> +       memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
>>>> +
>>>> +       /* VSC SDP header as per table 2-118 of DP 1.4 specification */
>>>> +       vsc_sdp_data.sdp_type = DP_SDP_VSC;
>>>> +       vsc_sdp_data.revision = 0x05;
>>>> +       vsc_sdp_data.length = 0x13;
>>>> +
>>>> +       /* VSC SDP Payload for DB16 */
>>>> +       vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
>>>> +       vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
>>>> +
>>>> +       /* VSC SDP Payload for DB17 */
>>>> +       vsc_sdp_data.bpc = dp_mode->bpp / 3;
>>>> +       vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
>>>> +
>>>> +       /* VSC SDP Payload for DB18 */
>>>> +       vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
>>>> +
>>>> +       len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &vsc_sdp, header);
>>>> +       if (len < 0) {
>>>> +               DRM_ERROR("unable to pack vsc sdp\n");
>>>> +               return len;
>>>> +       }
>>> So, at this point we have the header data both in vsc_sdp.sdp_header
>>> and in the packed header. The relationship between them becomes less
>>> obvious. Could you please pack dp_sdp_header into u32[2] just before
>>> writing it? It really makes little sense to pass both at the same
>>> time.
>>
>> Just want to clear some stuff up. Do you want to call the
>> dp_utils_pack_sdp_header() function right before
>> dp_catalog_panel_send_vsc_sdp()? The point of putting the
>> dp_utils_pack_sdp_header() function inside dp_utils_pack_vsc_sdp() is so
>> that all of the packing could be in the same location. Although I agree
>> that we are passing the same values twice, I believe that having it the
>> way it is currently is better since it shows that the
>> drm_dp_vsc_sdp_pack() and dp_utils_pack_sdp_header() are related since
>> they're packing the data to the set of GENERIC0 registers.
> I'm perfectly fine with dp_utils_pack_sdp_header() being called from
> within dp_catalog_panel_send_vsc_sdp(). This way you are not passing
> extra data and it is perfectly clear how the SDP header is handled
> before being written to the hardware.


Ack. Sounds good, I'll implement it that way


>

