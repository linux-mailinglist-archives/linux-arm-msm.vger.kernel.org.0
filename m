Return-Path: <linux-arm-msm+bounces-55102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB59A9859B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C30C1B64E54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF701DFE20;
	Wed, 23 Apr 2025 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c1wwUiRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180862701A9;
	Wed, 23 Apr 2025 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400815; cv=none; b=Bw9GugGKPUVN2VzM3CAAtH79+Pbpc8BKw7cHpa9SUX6bR6vpEmtHEHnwbsbSY/RZrpTOIUWqiiK8iuuCOSAG1iiZM0PVOMz3ohy5VZLeHBQVOKVO491BfwmzmDO7iqC71QtNQYMeH0EgIXtn8I71amsl/Wd4c3aA5//a5qUHbag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400815; c=relaxed/simple;
	bh=DNwhxgnabuj2cWYGZLkPSQWMpjM4HG1BDJe7N9xRsYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iF0n8cXWbvptYCT690m6hYzZX014V4b1Eppd9F+YRpKSBZOsY1WaDqJTqXcD55L/IBE2pJqgZFB65M4x66lH0TYSAW3LaQSrTbHWn1YOUEzjf7/yHdW6kL0H117DDcfg/sEImSyQ+2rH6y4Y5lVX1g07pSBsia7YqxmkI+X7Plk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c1wwUiRr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iA17022006;
	Wed, 23 Apr 2025 09:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nVlsx9qZswuIkhwiDwB1700PG/9McPtWUYBeZgLA4uw=; b=c1wwUiRrMcFRDHYr
	L2PpTwzcCo8e77KUwioOBUJFoUBnuTHsRURijECbrcsy5jj8JnIxyXWVZ0QtfoUM
	2Uh9CmMNAtxjLBd1qlW5nqLbClCeYgeCCEAgq+Qbpl0FLc0DTC9OmhCKcNMVnfkl
	e9TtTQvnd8jiZSltMSLxYKdhjLaTSaufbpFmzVGwzAkgNrQNLNR14BNO3uVOTESw
	gt8DP+76ie2BfdzjxcfTXRfNHwyFwFxYwKGbRpGozRm9AkpDX5vm/bmZ3sNAWs4p
	SQWCulEqyJc9DCfBJmLccD9SpbLMxHCYkFBvU83uuW4umwa8bkcNiDvrjXfDTR/A
	zFMJrw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh11m9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:33:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N9XBmw015675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 09:33:11 GMT
Received: from [10.204.76.38] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 02:33:05 -0700
Message-ID: <783a80d6-63d7-4c00-ba09-0ec07492103c@quicinc.com>
Date: Wed, 23 Apr 2025 15:03:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/11] drm/bridge: anx7625: fix anx7625_sink_detect()
 to return correct hpd status
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ayushi Makhija
	<amakhija@qti.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
 <g5mrn6o2arkbt356xtisszqtiokxm4oq4gkwa23y3f3aaahbfr@umcg5ikf5qjb>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <g5mrn6o2arkbt356xtisszqtiokxm4oq4gkwa23y3f3aaahbfr@umcg5ikf5qjb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: atwl_ogHiymCFyzGPglBsaxDggYiZ_PA
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808b3d9 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Kes1uffF6ZZPxm_MNuEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: atwl_ogHiymCFyzGPglBsaxDggYiZ_PA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2NSBTYWx0ZWRfX+u+Dv7Njo31q 3eOyB258d1hnhilLnobUfIX5r86javbBhkh8qwEuo0ZAhujxMjX7EPPRD47QZTPNcnZqZVL7wrJ lS4HxH/2mJ63EOcdd3uOIb8efa/2XgFOrdMzluDTeS8bHwF/jnCEgaB/qJnE521YC2OOv3zY3JI
 ZLZCWzlNkCs2uAL1gHwH2Z0OMj0zHAjZalcWN97/prLYEk+mXgZyxkB/sPpNkfOOdbWNAqyxoY7 LxzqDB6PoSRKLV/OQEjNA0YkzYAi7DqKjg6v54KQ44O6SXw8a8M6ZOs6xFufd202bLiGkl5wuyj S3fp8U1H1xx0TghyV1bCAIttRMz1pAk0xMpiWbSgcRz/R1tnziluekWBCuI4LF7i88VLouiR3Zf
 FT4cTTPHGlDDCuDR/f3bvflONWLWZVk2kX3gy98CyRCZmsGMOf1VDaDbfZYaFKngUQe/jxF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230065

On 4/17/2025 4:14 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 17, 2025 at 11:09:08AM +0530, Ayushi Makhija wrote:
>> From: Ayushi Makhija <quic_amakhija@quicinc.com>
>>
>> In the anx7625_sink_detect(), the device is checked to see
>> if it is a panel bridge, and it always sends a "connected"
>> status to the connector. When adding the DP port on port 1 of the
>> anx7625, it incorrectly treats it as a panel bridge and sends an
>> always "connected" status. Instead of checking the status on the
>> panel bridge, it's better to check the hpd_status for connectors
>> that supports hot-plugging. This way, it verifies the hpd_status
>> variable before sending the status to the connector.
> 
> Does this work if the Analogix bridge is connected to an eDP panel? In
> such a case it should report 'connected' even before powering up the
> panel (which might mean HPD pin being low).
> 

Hi Dmitry,

Thanks for the review.

In case of eDP, anx7625_bridge_detect()  will not get called, because this below condition
in anx7625_link_bridge() will not get satisfy. anx7625_sink_detect() is getting called from
anx7625_bridge_detect().

Anx7625_link_bridge()

	if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev))
		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;

So, during the probe time drm_bridge_connector_detect() will return always connected for eDP
connector. Control will go into the else part and for DRM_MODE_CONNECTOR_eDP it will return
the connector status as connector_status_connected (always connected).

drm_bridge_connector_detect 

if (detect) {
                status = detect->funcs->detect(detect);

                if (hdmi)
                        drm_atomic_helper_connector_hdmi_hotplug(connector, status);

                drm_bridge_connector_hpd_notify(connector, status);
        } else {
                switch (connector->connector_type) {
                case DRM_MODE_CONNECTOR_DPI:
                case DRM_MODE_CONNECTOR_LVDS:
                case DRM_MODE_CONNECTOR_DSI:
                case DRM_MODE_CONNECTOR_eDP:
                        status = connector_status_connected;
                        break;
                default:
                        status = connector_status_unknown;
                        break;
                }
        }

https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/display/drm_bridge_connector.c#L180

I don't think so, by removing the below lines of code from anx7625_sink_detect(),
will affect the eDP configuration.Let me know, If I am missing anything.

-	if (ctx->pdata.panel_bridge)
-		return connector_status_connected;
-

Thanks,
Ayushi

>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
>> index a32ebe1fa0cd..365d1c871028 100644
>> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
>> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
>> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>>  
>>  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>>  
>> -	if (ctx->pdata.panel_bridge)
>> -		return connector_status_connected;
>> -
>>  	return ctx->hpd_status ? connector_status_connected :
>>  				     connector_status_disconnected;
>>  }
>> -- 
>> 2.34.1
>>
> 


