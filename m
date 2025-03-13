Return-Path: <linux-arm-msm+bounces-51231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407DEA5EBDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 07:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70183A788D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 06:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134011FAC38;
	Thu, 13 Mar 2025 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="azVlnN6w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442752E3366;
	Thu, 13 Mar 2025 06:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741848283; cv=none; b=mAV5MGfYLSLOWnQL80rDoxQtLnwjKKdqvGUMTk/PMtRXxMnRUOyVo4dgiTXyD6UBlGr1ama8WhQPeN9CBawi/4Js3n+DcWb7yGKPGEP7L9RL1j/f+XGdfoIA3opYub1XNZ3dzOM2Js5PZ09DuLConTjxUBEYxRfu7abTx9UlR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741848283; c=relaxed/simple;
	bh=uFpbn6jHecNILbMAG+EBfFcnSlK7cpmTNiz70ZcairY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IdSC8w0N3mBmNtRDFAw0rUBTIjdXINSZ837ZtoX6DeLanC+OBj2KmrBxOvD4Pf/BrqPn+aJhFN0u6bl7n24+DCpOI2GrTz8TyaDQjfSgcLXnBltRq79jtj+HIVMyt+HJiQZet7JWmY00QqXwHhvquP9qQHUxc56TrDki/VzP8iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=azVlnN6w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CMO2sV032542;
	Thu, 13 Mar 2025 06:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ati43Uiw1jJYUMFIZ+KhsBapS1EYJugvkHnoAsgvNA=; b=azVlnN6w3Gj27Npo
	uP5bz9n08fZYSWYULNxB7eM00LHneC1XFlB+UuD6QSCjj1AUN6dW7tFY44NKMraV
	m6ApfW3mv/t+9vcvXkFUUsPvalDBYUQ0EMk+SbxOyjVQdLBWCt6XAKo9VbssnyB0
	y2CWJB0Y0y7YHAqlLqLjzscopHhUt8PjM0sIoxV6nuhTX6YMi/aI9ZOtUHbwgC7E
	vikvcTTIj6UFQD/EYF7xrxnS/z3dy2SUoxsTDe8txuVoVKHjK9W6NJ5acA2TxkSH
	vbNrMS16M0+flqPqADcxrkyOwjQxDkMntlJutSVyvRZ74XK1SNCdkGc4QGaOhLrx
	U02VMw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qmvpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 06:44:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D6iEvs017553
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 06:44:14 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 23:44:06 -0700
Message-ID: <2c10d5d2-a0bd-440d-b385-28ce3fea7d7c@quicinc.com>
Date: Thu, 13 Mar 2025 12:14:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
CC: Dmitry Baryshkov <lumag@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <robdclark@gmail.com>, <dmitry.baryshkov@linaro.org>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-10-quic_amakhija@quicinc.com>
 <6gdd6p3ca6w2gb2nbl6ydw4j7y2j5eflelbwntpc6ljztjuwzt@dqwafrtod5m5>
 <da9f80e6-bb4e-4568-aa2c-d70383b12e3a@quicinc.com>
 <CALT56yP+UDF1YeotceqOevr_NTeGjDVw92NwtPDgRK6GvvkyHw@mail.gmail.com>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <CALT56yP+UDF1YeotceqOevr_NTeGjDVw92NwtPDgRK6GvvkyHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XTlGKCS2lxlUZHXFVPfL8KaEwSWk1IQT
X-Proofpoint-GUID: XTlGKCS2lxlUZHXFVPfL8KaEwSWk1IQT
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d27ec1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=l2xE3416p9ZTIAIoJBwA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130051



On 3/12/2025 4:33 PM, Dmitry Baryshkov wrote:
> On Wed, 12 Mar 2025 at 11:47, Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
>>
>> On 3/11/2025 9:11 PM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 11, 2025 at 05:54:44PM +0530, Ayushi Makhija wrote:
>>>> The anx7625_link_bridge() checks if a device is not a panel
>>>> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
>>>> the bridge operations. However, on port 1 of the anx7625
>>>> bridge, any device added is always treated as a panel
>>>> bridge, preventing connector_detect function from being
>>>> called. To resolve this, instead of just checking if it is a
>>>> panel bridge, verify the type of panel bridge
>>>> whether it is a DisplayPort or eDP panel. If the panel
>>>> bridge is not of the eDP type, add DRM_BRIDGE_OP_HPD and
>>>> DRM_BRIDGE_OP_DETECT to the bridge operations.
>>>
>>> Are/were there any devices using anx7625, eDP panel _and_ not using the
>>> AUX bus? It would be better to use the precence of the 'aux' node to
>>> determine whether it is an eDP or a DP configuration.
>>>
>>>>
>>>> In the anx7625_sink_detect(), the device is checked to see
>>>> if it is a panel bridge, and it always sends a "connected"
>>>> status to the connector. When adding the DP port on port 1 of the
>>>> anx7625, it incorrectly treats it as a panel bridge and sends an
>>>> always "connected" status. Instead of checking the status on the
>>>> panel bridge, it's better to check the hpd_status for connectors
>>>> like DisplayPort. This way, it verifies the hpd_status variable
>>>> before sending the status to the connector.
>>>>
>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>> ---
>>>>  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
>>>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
>>>> index 764da1c1dc11..ad99ad19653f 100644
>>>> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
>>>> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
>>>> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>>>>
>>>>      DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>>>>
>>>> -    if (ctx->pdata.panel_bridge)
>>>> -            return connector_status_connected;
>>>> -
>>>>      return ctx->hpd_status ? connector_status_connected :
>>>>                                   connector_status_disconnected;
>>>>  }
>>>> @@ -2608,9 +2605,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
>>>>      platform->bridge.of_node = dev->of_node;
>>>>      if (!anx7625_of_panel_on_aux_bus(dev))
>>>>              platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
>>>> -    if (!platform->pdata.panel_bridge)
>>>> -            platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
>>>> -                                    DRM_BRIDGE_OP_DETECT;
>>>> +    if (!platform->pdata.panel_bridge ||
>>>> +        platform->pdata.panel_bridge->type != DRM_MODE_CONNECTOR_eDP) {
>>>> +            platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
>>>> +    }
>>
>> Hi Dmitry,
>>
>> Thanks, for the review.
>>
>> Yes, it is better to check the presence of the 'aux' node for eDP or DP configuration.
>> Will change it in next patch.
>>
>> -       if (!platform->pdata.panel_bridge)
>> -               platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
>> -                                       DRM_BRIDGE_OP_DETECT;
>> +       if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev)) {
> 
> This is incorrect, if I'm not mistaken, please doublecheck it. I'd
> suggest following msm_dp_display_get_connector_type() (feel free to
> extract that to a helper function).
> 

Hi Dmirty,

Thanks, for the review.

If we see definition of anx7625_of_panel_on_aux_bus() it is doing the same
thing as msm_dp_display_get_connector_type().

static bool anx7625_of_panel_on_aux_bus(struct device *dev)
{
        struct device_node *bus, *panel;

        bus = of_get_child_by_name(dev->of_node, "aux-bus");

        // if aux-bus is not there it will return the false.
        if (!bus)
                return false;

        panel = of_get_child_by_name(bus, "panel");
        of_node_put(bus);

        // if panel is not there it will return the false.
        if (!panel)
                return false;
        of_node_put(panel);

        return true;
}

Above function will return true in case of eDP and false in case of DP.
So we can use anx7625_of_panel_on_aux_bus() to check whether it
is DP or eDP configuration based on aux.

I don't think so we need extract msm_dp_display_get_connector_type() to check the eDP or DP configuration based on aux.
Let me know, if I am missing anything.

Thanks,
Ayushi


