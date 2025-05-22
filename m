Return-Path: <linux-arm-msm+bounces-59028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E73AAAC0919
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 11:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686061BC6589
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A45B28750C;
	Thu, 22 May 2025 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KR3Kh0at"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC22874FF;
	Thu, 22 May 2025 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907611; cv=none; b=Moqg1h0qlhEcfZJ7nhvSO6lCICdwhgFWg9ky7ffN6aN0LxDfIKJ6/TgmdDyDNVBKXljgNtQT/rgOqIv1omZGVrJiQFeBOfNbSM2XVJNmUOrvYDqpKahUnG5+ZE8mSEXULBXw6mk6DeeUIjDtMDWKJNMWy45xg09+SKrB/00hMwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907611; c=relaxed/simple;
	bh=mf3lgwFsDehq4XSm2xQxv37CGjvwGdS7AT+p6mnDavM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u/iob6r4U3NwKYnTsF2x8XSECyd7kul3ZvOge9zgXpo6SMs6/anR/bEGEm8O/GisE5fAMSg1xdZoHGdiqRkuEbb2p/yOD4naVbcdBIPNp32RtBbLAyR8Xv3r/gmKEJRKgk0RPgRHXlpxhKjEFns8MG1cw4bu43QBVTV8p3VUTQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KR3Kh0at; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8As42006659;
	Thu, 22 May 2025 09:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGNzBVStC/BD4Tl8xEFOQH7RDXdac8nIDWsJh1Bphwc=; b=KR3Kh0atXcoKaF0t
	vcm4ecbyXgrB7zoc7ucD1EoBydPqogMDXyucSZ0rvmFEK8YiKkC0iFJp6FVKGRuq
	K1qQ+WBXwy5W/epFv7Cj5t+BPfpPp6qPKbMU4dr7W5StwGkpfEPy921QB/QkbNDm
	cAKAcTU4OR2s+H/GMx6dDrytHoWgjO86V1/o4h7tdhXHFoQFmwO6UxTz0NHekOJ7
	LvsvRzhe09WnHErlpAQGQbjssKeDBFxb73iY921VTB/GLXODtyHCYbd2+1q6TxR9
	dnAzqDLJ7yJhhQgyDyNZgr1Q7tgmKfeMXPerDL/UXSjQcrRCQcf6qGyStB96Pd5G
	4ga//Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0nxxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:52:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54M9qQxZ006854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:52:26 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 May
 2025 02:52:19 -0700
Message-ID: <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
Date: Thu, 22 May 2025 17:51:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/45] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Rob Clark
	<robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-4-f8618d42a99a@quicinc.com>
 <osctzl3bgutcjt3hjvgxaq64imn2i67hagqm5slfozf33tnj66@5hlfmqmt7if5>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <osctzl3bgutcjt3hjvgxaq64imn2i67hagqm5slfozf33tnj66@5hlfmqmt7if5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pjVLWMCjDjiUVndgGbzSwlZMhRbpFVbD
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682ef3db cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=D1FkwUkmBHUbuiOmTNcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pjVLWMCjDjiUVndgGbzSwlZMhRbpFVbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA5OSBTYWx0ZWRfX4jzYY1q+Vnuo
 qJwDy56Mj/mGf7Ao2K117Ez5GuG0qT1XN6S/q29nIoAkKwANNEE1e0JeNKzlTLwHC3Dk4TZVpQa
 AGPir4lQOrFv0vi4aKAOR/wJUPH8C6bHtDmy0aghokjwGW4tJNcubgrAVYh/SNaCsOGAcsr1cdv
 n7ImjusMxsrZ07mWwHTwSzePq+Z129IRgvBDLTq40xeJ26o+ondc8KCLX1wbcjJEUO9eG9jW5J9
 FzbqAEpWFl4a5YSgjAhsG+Juq4Aod6WiVf84CBd4X6/2hLnfoQMN4ppjE9YAmQM+NhAJPVLVWJr
 JR12Omx/NzcFRu8eLDVX7vAQwshlMowAUJe/3eUlkl6th4YOyIymECxKUSSbxHefexGedBN/J7q
 oW3BHQetelFPtLUu0xa5MQtT+37dk8iSueAbj9EkJSto7evvzyY9rAq7ALg3D9Cs72diSOEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220099



On 2024/12/6 16:51, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 08:31:35PM -0800, Abhinav Kumar wrote:
>> In preparation of DP MST where link caps are read for the
>> immediate downstream device and the edid is read through
>> sideband messaging, split the msm_dp_panel_read_sink_caps() into
>> two parts which read the link parameters and the edid parts
>> respectively.
> 
> As you are touching this part, could you please refactor the code
> instead by dropping the msm_dp_panel->drm_edid? There should be no need
> to store EDID in the panel structure.
> 
Hi, Dmitry, Abhinav will be leaving the company and will no longer be 
responsible for updating and address the comments. I will take over 
handling MST patch series. Regarding this comments, I don't got that 
where the drm_edid should be stored. In MST cases, where multiple panels 
exist, i think that there should be a separate drm_edid saved for each 
panel.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c |  6 +++++-
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 25 +++++++++++++++++--------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  5 ++++-
>>   3 files changed, 26 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index be26064af9febf4f4761e21ea7db85ab1ac66081..052db80c6a365f53c2c0a37d3b69ea2b627aea1f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -372,7 +372,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	const struct drm_display_info *info = &connector->display_info;
>>   	int rc = 0;
>>   
>> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>> +	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
>> +	if (rc)
>> +		goto end;
>> +
>> +	rc = msm_dp_panel_read_edid(dp->panel, connector);
>>   	if (rc)
>>   		goto end;
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 5d7eaa31bf3176566f40f01ff636bee64e81c64f..d277e9b2cbc03688976b6aa481ee724b186bab51 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -108,8 +108,8 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>>   	return min_supported_bpp;
>>   }
>>   
>> -int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>> -	struct drm_connector *connector)
>> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
>> +				struct drm_connector *connector)
> 
> This function doesn't require connector anymore.
Right, will remove connector in function.
> 
>>   {
>>   	int rc, bw_code;
>>   	int count;
>> @@ -150,8 +150,19 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>>   
>>   	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
>>   					 msm_dp_panel->downstream_ports);
>> -	if (rc)
>> -		return rc;
>> +	return rc;
>> +}
>> +
>> +int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, struct drm_connector *connector)
>> +{
>> +	struct msm_dp_panel_private *panel;
>> +
>> +	if (!msm_dp_panel || !connector) {
>> +		DRM_ERROR("invalid input\n");
>> +		return -EINVAL;
>> +	}
> 
> Neither panel nor connector can be NULL here, please drop.
> 
>> +
>> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>   
>>   	drm_edid_free(msm_dp_panel->drm_edid);
>>   
>> @@ -163,13 +174,11 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>>   		DRM_ERROR("panel edid read failed\n");
>>   		/* check edid read fail is due to unplug */
>>   		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
>> -			rc = -ETIMEDOUT;
>> -			goto end;
>> +			return -ETIMEDOUT;
>>   		}
>>   	}
>>   
>> -end:
>> -	return rc;
>> +	return 0;
>>   }
>>   
>>   u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7a38655c443af597c84fb78c6702b2a3ef9822ed 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -59,7 +59,10 @@ void msm_dp_panel_dump_regs(struct msm_dp_panel *msm_dp_panel);
>>   int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>>   		struct drm_connector *connector);
>>   u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
>> -			u32 mode_pclk_khz);
>> +			      u32 mode_pclk_khz);
>> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *dp_panel,
>> +				struct drm_connector *connector);
>> +int msm_dp_panel_read_edid(struct msm_dp_panel *dp_panel, struct drm_connector *connector);
>>   int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>>   		struct drm_connector *connector);
>>   void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
>>
>> -- 
>> 2.34.1
>>
> 


