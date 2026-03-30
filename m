Return-Path: <linux-arm-msm+bounces-100752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJk5E2NRymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:33:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A21823595CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07128304809F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6773B583C;
	Mon, 30 Mar 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Frx6HOcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ddm/8Z7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0263A1A28
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866484; cv=none; b=mI+0K/c7TAi7I1ZcNUuFxEFEhbANEuT4bSMnEQ9oHkvi6YIgVdSG1211zWUMtgLaIr9EPEz7eIGGckoAp6J6vMlBUEhV479LipcdV5MgpLE+UrQYTTlzdnqfLslwxqu9OSDRNqIPJlWLn+7aBc2HDzQihtp7njr/QzfT0bFA3r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866484; c=relaxed/simple;
	bh=Nfm2jL4c8/WrATBvGfw9fIZQBlWo3MIoNo53nnvTmfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8QzV1hNjGNqF17iRfMVydIjhXBWVMdQh7SYNr8yU2FFPbGim563sQIT+V7WcqjeuC+vwWmGRWwx4evVpAxMpqM92QvpJdVXrGHSwAorbiKm1Uh7ZbwrWNU2eR0VfPoZCM6rj24jgCMZKmk0eo/0oeya1VPoj7qafG+GlVyjzE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Frx6HOcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ddm/8Z7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8Q0EP2458393
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Au0+UaYP+ntDqPVDj//xioTgR28L/odTVuFYIMKg21o=; b=Frx6HOcWxje+IL8O
	mZX8p9EwS0PsUO1y81CZn17WjfrG2q9BILudL0olOvL7VM8TF3oLSlJKIT396rzD
	pLs5e2iTgGFls2Oayy6fYVClNIlmweVsCvODkWIPoDcDqcbxqv/8dcElIf7eYDgR
	cJXNnnxUfOS3fEE6XygVg51kFnSCLMP93aPK8aMZNcoORHOW4WL3jTRvj4O1KKaw
	ybgoM9qAywDVJZZcqDvcbgkCUhjDYQRtLxav+Dw9GbjQJ2+HnSAii6Bg1AnqglSU
	KhnrSAhw2YYZCdfkAYFxtIvlE2OOzLx6AvFcC9c8YmNqVqxMLgbw+LOlPpN+bkIX
	eCCIgw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmrgcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:28:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741a9ef5f0so2884846a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774866481; x=1775471281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Au0+UaYP+ntDqPVDj//xioTgR28L/odTVuFYIMKg21o=;
        b=Ddm/8Z7qkRrGJYDpBWx5HS2iCsgk2KZ05qe2TntQgsEUTTzxoQIP89rTgXa94MSaw5
         FvrjV42hrxhL0Xguxbqlx3GVR2SwWHeS8Qd0TrQ/cQbsLOs0q47bXZ2sMOWAdapdBZXG
         OXWMKs8OErtNy4jvFFXMEqxAWY/ZTepUuvz43xEoPVeUI+BQA1Mk9O80t7xN1FJqvyIy
         4G1ezb/OEdSTwUwzazTpmHyG0UWFMUZELnUsYE8ptjwuv+aD+MHm56BIHmaPkFUUJzuP
         6ad4pzFkhYisDGb1aMOtUlkE4JxK36xYWT7ngOcr7DXkuNWS8qcyzJWXo9Kba02CrHZe
         wqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866481; x=1775471281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Au0+UaYP+ntDqPVDj//xioTgR28L/odTVuFYIMKg21o=;
        b=suErCrTEQgtk5tQX4jso718HiD8DyaJ7x3nv4PtFJ2dimiUTpAj9ZfFvGwgjVaX+mj
         awaeh/CCSPbcPcVHnpVa9jn0Tbk7PySFbx3PC/MXknTaZpJozGMSVpH4wcSX3fI1xdVS
         3o9LJk+WRcjJHVypiHJKfj2k/BXMgbvofeexsc+egiPiUkVrSeh0QFqMyWMPKiXHE80F
         VIyJlAXIyiNR+Q9GIotrkC2jqZFoUHEdeKwUKIm++Zg8bBtJIw42kmZOvu2VSC02AY8j
         RSBbMVozsQAPDLOT91j5WmYBliuxFbSMfWtsYJP/GG4cGNOpSdz2H86RHomM9BNnNuu3
         74oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx7cizIr+7MtMZ7cVbVB2MY8GixOShofa1879mvW8661bxVS0DGxkk5HnZNadfPEhJ30jdCqbd9iXB2oUo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjl9AiOuxl+Y0GYHNfCd3pjy5N1LnHB9nZQSFxOx1BqLadaFm3
	yDE2c3LwiHaEdm5+PLB2zojr8TVCs+0AJntZgjaXGCnNXoJZZ4FUBl9rIxW7Kc/LhXVM/n/hkYI
	WRC+D6kqaVL2ERmJl+o8CtpTRkt97sU8Jvg0rfCGjk5iZzH01hlTAE27pOcFdMOLhXFo6
X-Gm-Gg: ATEYQzwS3ZpbvTHrgKl1GdG+5pUyxLalPDht5janI2L4L6AnW8xeMm8EjmgU7J2c0Vg
	WyfumEnazp8V670TndO7+JQkcG/6sWNyDBKooiTHfZF9q7m96q7xPxvbwVWM+SLOwuuIh5RYXa/
	UcRQ3bDd075p9pi/IOsaKjTZN6Mk5SfgRAe9p9i1/pM0Z3nMlJWr+oU+sJob8oS1fMVfPo36a2U
	NR8dZ6gQOdyHij0e5ZRTXNW4FWiQ2aE4BsIyCE6v225AbJpAwZEhYqHaCq3yDwG+dhA2Qb65YCN
	qcLopW/SBmN1iI030ijtRbPrXwsX6b2/aezRciSCtYnqg+IQuMvUk0Bc0XVtWqVrppTCnu7D40F
	ox54Xe6aAphIQqqlpcH1SRQ1wbqlXGPOe/3+56W9RN3KUrBgs
X-Received: by 2002:a05:6a21:3086:b0:39c:3543:b8ca with SMTP id adf61e73a8af0-39c8abcccdamr11068002637.29.1774866481388;
        Mon, 30 Mar 2026 03:28:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:3086:b0:39c:3543:b8ca with SMTP id adf61e73a8af0-39c8abcccdamr11067989637.29.1774866480862;
        Mon, 30 Mar 2026 03:28:00 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917ba961sm5599108a12.25.2026.03.30.03.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:28:00 -0700 (PDT)
Message-ID: <bd0fa742-fcba-47a8-81fa-aa43d9ff4edd@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 18:27:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/38] drm/msm/dp: Add support for programming p1/p2/p3
 register blocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-14-01faacfcdedd@oss.qualcomm.com>
 <34he7xawyuq5z4iiyq4y4ehkjhfalx2vxhtejgyxly4zgyqma7@4uqoas4sz3nl>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <34he7xawyuq5z4iiyq4y4ehkjhfalx2vxhtejgyxly4zgyqma7@4uqoas4sz3nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MiBTYWx0ZWRfX0Zw8H4DHFI1B
 j0VXUa7uGC0MWfPwdHT37r9dSdrOsXY4pvsAoZGGd6cTtslmBz09OYpluUanJ4+9Zdi7Wgra+oM
 ATkeP0Pj1cmGGsQ/Pyzu4R9paEIAiECWupje0xWkM53swcVKdHFiR22g639Nz+q7Nqy/j5aX5cB
 oU/uPoOw6TZAbzFGGHQzlZYkn2ZpITbCL0vBaNa5m+N5n5J3XGuMEiDh0ToKN4ejZxcRpWNvGQ4
 tVxs8KkRKah8DallvSwkRQDPLquWG65mo+3NKphe22h1APYLrx9HRF6SUTUWCbcjAl7KV9PXYec
 5oIw5tfw65+7mOAFHkKf4q34OKpGIbH5azceztv4n28OnvemUqGpwCO4EG/BIdi+X7CQWHCbrjz
 ITFnIESMXy/hk1AfQHm2vV0Y9x9IXbIJ4o5HrZ89pC5uGJZU5zRjmKyqbYtgCNUuoKODNZSXi3p
 sl59WIMgxHfno2HDfig==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca5032 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=OvTKcA9ML1xih0zlansA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uZX8nBmdq2Ad0ADrLAuaWOxG_mmAACnw
X-Proofpoint-ORIG-GUID: uZX8nBmdq2Ad0ADrLAuaWOxG_mmAACnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100752-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A21823595CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 1:59 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:00PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> QCS8300 supports 4-stream MST. This patch adds support for the additional
>> pixel register blocks (p1, p2, p3), enabling multi-stream configurations.
>>
>> To reduce code duplication, introduce helper functions msm_dp_read_pn and
>> msm_dp_write_pn. All pixel clocks (PCLKs) share the same register layout,
>> but use different base addresses.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++--------
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 68 ++++++++++++++++++-------------------
>>   2 files changed, 59 insertions(+), 48 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 3422f18bdec71a99407edfe943d31957d0e8847a..935a0c57a928b15a1e9a6f1fab2576b7b09acb8e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -84,8 +84,8 @@ struct msm_dp_display_private {
>>   	void __iomem *link_base;
>>   	size_t link_len;
>>   
>> -	void __iomem *p0_base;
>> -	size_t p0_len;
>> +	void __iomem *pixel_base[DP_STREAM_MAX];
>> +	size_t pixel_len;
>>   
>>   	int max_stream;
>>   };
>> @@ -619,7 +619,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>   		goto error_link;
>>   	}
>>   
>> -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
>> +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base);
> 
> Why do we need to pass pixel base here? Shouldn't it be pixel_base[P0]?
> 
In the current implementation, dp->panel holds the full 
pixel_base[DP_STREAM_MAX] instead of just the pixel base corresponding 
to itself, so this likely needs to be revisited.

>>   	if (IS_ERR(dp->panel)) {
>>   		rc = PTR_ERR(dp->panel);
>>   		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
>> @@ -937,8 +937,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>>   				    msm_dp_display->aux_base, "dp_aux");
>>   	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
>>   				    msm_dp_display->link_base, "dp_link");
>> -	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
>> -				    msm_dp_display->p0_base, "dp_p0");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> +				    msm_dp_display->pixel_base[0], "dp_p0");
> 
> This should add all blocks used on this platform.
> 
Let mark to be done here. Since a helper function is required here to 
check whether the pixel clocks for stream 1/2/3 are really enabled.
>>   }
>>   
>>   void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
>> @@ -1181,12 +1181,13 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
>>   #define DP_DEFAULT_AUX_SIZE	0x0200
>>   #define DP_DEFAULT_LINK_OFFSET	0x0400
>>   #define DP_DEFAULT_LINK_SIZE	0x0C00
>> -#define DP_DEFAULT_P0_OFFSET	0x1000
>> -#define DP_DEFAULT_P0_SIZE	0x0400
>> +#define DP_DEFAULT_PIXEL_OFFSET	0x1000
>> +#define DP_DEFAULT_PIXEL_SIZE	0x0400
> 
> No need to touch this. It's only required for legacy bindings.
> 
Thanks, will fix it.
>>   
>>   static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   {
>>   	struct platform_device *pdev = display->msm_dp_display.pdev;
>> +	int i;
>>   
>>   	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
>>   	if (IS_ERR(display->ahb_base))
>> @@ -1206,7 +1207,7 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   		 * reg is specified, so fill in the sub-region offsets and
>>   		 * lengths based on this single region.
>>   		 */
>> -		if (display->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
>> +		if (display->ahb_len < DP_DEFAULT_PIXEL_OFFSET + DP_DEFAULT_PIXEL_SIZE) {
>>   			DRM_ERROR("legacy memory region not large enough\n");
>>   			return -EINVAL;
>>   		}
>> @@ -1216,8 +1217,10 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   		display->aux_len = DP_DEFAULT_AUX_SIZE;
>>   		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
>>   		display->link_len = DP_DEFAULT_LINK_SIZE;
>> -		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
>> -		display->p0_len = DP_DEFAULT_P0_SIZE;
>> +		for (i = DP_STREAM_0; i < display->max_stream; i++)
>> +			display->pixel_base[i] = display->ahb_base +
>> +						 (i+1) * DP_DEFAULT_PIXEL_OFFSET;
>> +		display->pixel_len = DP_DEFAULT_PIXEL_SIZE;
>>   
>>   		return 0;
>>   	}
>> @@ -1228,10 +1231,18 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   		return PTR_ERR(display->link_base);
>>   	}
>>   
>> -	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
>> -	if (IS_ERR(display->p0_base)) {
>> -		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
>> -		return PTR_ERR(display->p0_base);
>> +	display->pixel_base[0] = msm_dp_ioremap(pdev, 3, &display->pixel_len);
>> +	if (IS_ERR(display->pixel_base[0])) {
>> +		DRM_ERROR("unable to remap p0 region: %pe\n", display->pixel_base[0]);
>> +		return PTR_ERR(display->pixel_base[0]);
>> +	}
>> +
>> +	for (i = DP_STREAM_1; i < display->max_stream; i++) {
>> +		/* pixels clk reg index start from 3*/
>> +		display->pixel_base[i] = msm_dp_ioremap(pdev, i + 3, &display->pixel_len);
>> +		if (IS_ERR(display->pixel_base[i]))
>> +			DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
>> +					      display->pixel_base[i]);
>>   	}
>>   
>>   	return 0;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index eae125972934bb2fb3b716dc47ae71cd0421bd1a..e8c1cf0c7dab7217b8bfe7ecd586af33d7547ca9 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -26,7 +26,7 @@ struct msm_dp_panel_private {
>>   	struct drm_dp_aux *aux;
>>   	struct msm_dp_link *link;
>>   	void __iomem *link_base;
>> -	void __iomem *p0_base;
>> +	void __iomem *pixel_base[DP_STREAM_MAX];
>>   	bool panel_on;
>>   };
>>   
>> @@ -45,24 +45,24 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
>>   	writel(data, panel->link_base + offset);
>>   }
>>   
>> -static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
>> +static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
>>   			       u32 offset, u32 data)
> 
> Is it really multiplexed on the panel level? I'd assume that each panel
> is connected to only one stream instance... If that's not the case, such
> details must be explained in the commit message.
> 
Yes, each panel is connected to only one stream instance. We just use 
**pixel_base + stream_id to determine which pixel block the request 
should be sent to. Just like your first comment, do you mean that the 
panel should only carry the pixel block address corresponding to itself, 
rather than the 4 blocks?
>>   {
>>   	/*
>>   	 * To make sure interface reg writes happens before any other operation,
>>   	 * this function uses writel() instread of writel_relaxed()
>>   	 */
>> -	writel(data, panel->p0_base + offset);
>> +	writel(data, panel->pixel_base[panel->msm_dp_panel.stream_id] + offset);
>>   }
>>   
>> -static inline u32 msm_dp_read_p0(struct msm_dp_panel_private *panel,
>> +static inline u32 msm_dp_read_pn(struct msm_dp_panel_private *panel,
>>   			       u32 offset)
>>   {
>>   	/*
>>   	 * To make sure interface reg writes happens before any other operation,
>>   	 * this function uses writel() instread of writel_relaxed()
>>   	 */
>> -	return readl_relaxed(panel->p0_base + offset);
>> +	return readl_relaxed(panel->pixel_base[panel->msm_dp_panel.stream_id] + offset);
>>   }
>>   
>>   static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
>> @@ -297,33 +297,33 @@ static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
>>   	display_hctl = (hsync_end_x << 16) | hsync_start_x;
>>   
>>   
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
>>   			hsync_period);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
>>   			hsync_period);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
>> -	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
>> -	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
>> -
>> -	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL,
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
>> +	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
>> +	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
>> +
>> +	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL,
>>   				DP_TPG_CHECKERED_RECT_PATTERN);
>> -	msm_dp_write_p0(panel, MMSS_DP_TPG_VIDEO_CONFIG,
>> +	msm_dp_write_pn(panel, MMSS_DP_TPG_VIDEO_CONFIG,
>>   				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
>>   				DP_TPG_VIDEO_CONFIG_RGB);
>> -	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE,
>> +	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE,
>>   				DP_BIST_ENABLE_DPBIST_EN);
>> -	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN,
>> +	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN,
>>   				DP_TIMING_ENGINE_EN_EN);
>>   	drm_dbg_dp(panel->drm_dev, "%s: enabled tpg\n", __func__);
>>   }
>> @@ -333,9 +333,9 @@ static void msm_dp_panel_tpg_disable(struct msm_dp_panel *msm_dp_panel)
>>   	struct msm_dp_panel_private *panel =
>>   		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>   
>> -	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
>> -	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE, 0x0);
>> -	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
>> +	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
>> +	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE, 0x0);
>> +	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
>>   }
>>   
>>   void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
>> @@ -369,7 +369,7 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
>>   	struct msm_dp_panel_private *panel =
>>   		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>   
>> -	msm_dp_write_p0(panel, MMSS_DP_DSC_DTO, 0x0);
>> +	msm_dp_write_pn(panel, MMSS_DP_DSC_DTO, 0x0);
>>   }
>>   
>>   static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
>> @@ -559,7 +559,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>>   	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
>>   	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
>>   
>> -	reg = msm_dp_read_p0(panel, MMSS_DP_INTF_CONFIG);
>> +	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
>>   	if (wide_bus_en)
>>   		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
>>   	else
>> @@ -567,7 +567,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>>   
>>   	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", wide_bus_en, reg);
>>   
>> -	msm_dp_write_p0(panel, MMSS_DP_INTF_CONFIG, reg);
>> +	msm_dp_write_pn(panel, MMSS_DP_INTF_CONFIG, reg);
>>   
>>   	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>>   		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
>> @@ -673,7 +673,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>>   struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
>>   			      struct msm_dp_link *link,
>>   			      void __iomem *link_base,
>> -			      void __iomem *p0_base)
>> +			      void __iomem *pixel_base[])
>>   {
>>   	struct msm_dp_panel_private *panel;
>>   	struct msm_dp_panel *msm_dp_panel;
>> @@ -692,7 +692,7 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
>>   	panel->aux = aux;
>>   	panel->link = link;
>>   	panel->link_base = link_base;
>> -	panel->p0_base = p0_base;
>> +	memcpy(panel->pixel_base, pixel_base, sizeof(panel->pixel_base));
>>   
>>   	msm_dp_panel = &panel->msm_dp_panel;
>>   	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
>>
>> -- 
>> 2.34.1
>>
> 


