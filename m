Return-Path: <linux-arm-msm+bounces-109034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFWpKNryDmqmDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:56:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC395A4519
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7958309C7F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F44137F73B;
	Thu, 21 May 2026 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osFvy4Sw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOH5yLQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7FF39EF12
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364240; cv=none; b=Qla1J/IwzUNDx8f7TcP4zWxM5GpIgbDFoxr7nZYlUmIZAFcpRf6rqgefTtIXHSmTu1Jy2YDsi1TwwLG1QoKCiANfobVILL7w7674hmMI2Li6TIWIpgM5eu0zMeeB7iUVu8dVgvHF8rAg3le2QpN5k3StcQfV4yAUQongQGJrJYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364240; c=relaxed/simple;
	bh=na4Yrh56LrwwqwnhkLr6jRj61EwxD5szqXlu73VNAaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7P+THhwEzaVT78lKrzl3wJsmV8Ky3CuEal1LRUngAenpHVhA/NTeHSEWtGqrmxTkuWvGqnczzm8eKzPJzBle/0YR5IfAT6JNlP3XvO6KLOsEJ3L/DIbN1N3ymCpPB7qkvphZldjOZvLrHc9EUvnAwNhLAf2mT2D9oaddMTh1vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osFvy4Sw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOH5yLQq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A3N13119321
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxy0JnT+XYA3BAOhh59TerxutRU2a8v3x/R3dSaa/UU=; b=osFvy4Sw0cC7VYci
	hR1cSkMt6V8W3035RqRYHak5h1MeUhHdIxcbKDDxHMXbkwCzZVBjElZEYP15DmS2
	lGaVkr9p7IfN4LJeYmipPqM0wzl5bOn1FJ2jbZm/jxj1eW/4azpCuZFelsh3KzhG
	z9Ig6wiRYQl7sLZ8cf8JmKPuXnwbhPBR4st93s9u3/AFvLs0pWF7djWGMCtqSqci
	H6CbSD1WUTEXP1M7FLAsbr0gJGpIVSIrL33pmpMfECFgje1BHAmFjkYxH/b5xaQM
	CnvbkBgKZXw3gAkvPGyf1IPe9Doqp7cTywGGfDwHvNN5i1wrdlzd5R43p2hKmwtl
	lp02/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r96291b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:50:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36865d109dcso5681366a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779364236; x=1779969036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxy0JnT+XYA3BAOhh59TerxutRU2a8v3x/R3dSaa/UU=;
        b=MOH5yLQqij41lgpst+nNyUQR+th/A8Ojckd2QtEg9ZRsEzCU06dUwvsvP86tSULJ5E
         yibeINcnzhUWemHucHMX4P8Qw5xEyXBbcV3KTeEev5ALDw1WFp7tcbeifxWyAb6PLdla
         PxXxx3UEXimqvo651Gl/K2LAz6Vlyn7NWGtc1EOuL8h/xtlJU32UrVm7IDMmExW8xHJW
         P8FsPfXRdhDc3FRWX3eWL3viNzhLmnWnn7bQoZSyG3rm10Gp/AsaxzFhHscoEzhyw1fJ
         Y3W5b9Yh+ErFwFdxXw+XphPgV43QFgfVYxBfumbcTRkLm/bOxkhkM/3A7f9FQViaKpSL
         if2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364237; x=1779969037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxy0JnT+XYA3BAOhh59TerxutRU2a8v3x/R3dSaa/UU=;
        b=RgBhwkCuWjPhP2zxa8fmpOY0W4KWQRkn4D89BNreTKUSHEcfS2ePIlYsHjtn99mzi1
         jdBNP/NDC+lBrYszeAYCt3yUtLk3AXVJ0yLP4HRBoElUNV5dVW28HiGQxetFl/8rhP1z
         P8TxSOBO9229Djc5+mBPUWSesEMy0pMhGTNxvNmRc7LVOQHbdXQMJnchky8hlijkqiEb
         f72Wy1p34nyRkxbAJ+ifgDjX1eknJ5paaY6REzasUDvqPVPPHXlO+yBLfwGNobr9GoFr
         I2Wtcck3PIFhEANFeKjYWfRp4NEp4+AKuUMAzST0asts01AWjNHoN8aTgk/hOJLHjjiH
         e+BQ==
X-Forwarded-Encrypted: i=1; AFNElJ9N19NhcDiZo+bqil+w1luFSUaqDyX9iwLPH1W3xvMBTOAmlFP0czz3MTQzyofXAA2oafYZvleqWUOwI08z@vger.kernel.org
X-Gm-Message-State: AOJu0YwOHzrW6ycc/Uw2CTh5OVQAsqFGvqlPshM8HYdJyJmW90E37fyG
	cHtyXE46CcyIkYh0lwyZOVNpfHIBU4nm3QbOkKOL4tTvZv8Wj07GA17vLD64wrcWXkASRzP9O2O
	hotq+JJx8HFqiVL6gXQRzN6Xbp4d/LCWBV/KeJ0lzqoXqtgknENESf7S5rilV9O7ZRf9H
X-Gm-Gg: Acq92OF+2s69CrK9eHJjLhwiUhZMMnsJmlYn0lK4hFM62HtTj8f/yz/77ThP3/QgM1J
	5UHCd21kLHY2T9lPDv6lyUFHBrlGx0EhnXW4tjAc3gH8bWMSE6x2XjDgbMZI6XVxlDUhZy8d0aj
	F93aEZSUTGsdO7wP4z+UjJxiWq6B1yenOctDbREeRH13FhWa+UQO/mb+Wf85pftxUFB9uZXBqxm
	On9urhf6GvD8QsjPZwtoXdWKA+jcG65T48xT6thdx099/MtziK+i2dn2W4o6ia/kkgAUmfqfOAB
	0QZNdVflPbkk6LFADLfTT59ZVewbXnxNeq1uibm3p3c3ghbkGVy5oBgiQlla+oKa/44S64wvqEi
	ZQe/H+tHNnUbF5UpMrOouG5RcuPJugc9bqGs1mG5UsPKVjvgESAzn9/ulnLDeWdCDxhDTgTFlDF
	JcjOjgP0jDRVLYUQD/zg==
X-Received: by 2002:a17:90b:5644:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-36a44f17d22mr2822216a91.6.1779364236525;
        Thu, 21 May 2026 04:50:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5644:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-36a44f17d22mr2822176a91.6.1779364236033;
        Thu, 21 May 2026 04:50:36 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5b349d42sm533826a91.15.2026.05.21.04.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:50:35 -0700 (PDT)
Message-ID: <55081f4d-f1a9-42c7-a1cd-cdcefc008668@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:50:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/39] drm/msm/dp: Add support for programming p1/p2/p3
 register blocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-15-b20518dea8de@oss.qualcomm.com>
 <zputabw52nsba4ddwg7gd22tyouobkmlpq6blos7w3kx457otx@gitmjwroo7ou>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <zputabw52nsba4ddwg7gd22tyouobkmlpq6blos7w3kx457otx@gitmjwroo7ou>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xoS_ma_kG6vQRxn5b35BM_84JSXHmr9y
X-Proofpoint-GUID: xoS_ma_kG6vQRxn5b35BM_84JSXHmr9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExNyBTYWx0ZWRfX32bj5WFDffzV
 AIehP9hThsrXG93yTwyEJxiOcxvA9WGWBJqFZDPjhSDKDf2bADXvu6BvGSyMFkvITO9Ogygxk05
 3bvFUyUsNRV/aUztR0Ka6980/sqWpgw8rk22KhHy4aTQ8YqdxW/pmZC8kMq9VDqlfEBSitpBZXb
 iF+9lm+wBtmT9skJd40ASfrlt0cCnYX/GQSFCaNYrU26kdpKZKU4qmhSERlNwZ+wZxXBKYpOtvs
 GQB2CsxUOKmUAiawd+qxGT1w2tbm2HuwwvbPPhGqlh/KvRTlKCigekjBxnC2+6lsTSVhFzMKFhl
 oYMYtDCLgSz9h/nPGFlWGJGx6gJFN66uxPkZGFtSR7ifWjNlcgxv1OoHIAV71Pc3lQlPXYj/6KO
 2gKX2NHdij1cHe67C1MD+KfKQN2cRTO2h7TENkDevN+aNdVPNVeI8uBBRGKeBIYdWeqXI+HbdCs
 pipAX4GZynaNFSPVwLg==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0ef18d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=AGOk3BmGE1vnVxrgsN4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210117
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109034-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CC395A4519
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/12/2026 2:07 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:33:50PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add support for additional pixel register blocks (p1, p2, p3) to enable
>> 4‑stream MST pixel clocks. Introduce the helper functions msm_dp_read_pn
>> and msm_dp_write_pn for pixel register programming. All pixel clocks
>> share the same register layout but use different base addresses.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 40 ++++++++++++-----
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 89 ++++++++++++++++++++-----------------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +-
>>   3 files changed, 79 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 7984a0f9e938..ff506064a3fa 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -85,8 +85,8 @@ struct msm_dp_display_private {
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
>> @@ -561,7 +561,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>   		goto error_link;
>>   	}
>>   
>> -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
>> +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
>>   	if (IS_ERR(dp->panel)) {
>>   		rc = PTR_ERR(dp->panel);
>>   		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
>> @@ -769,6 +769,7 @@ int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
>>   	}
>>   
>>   	panel->stream_id = stream_id;
>> +	msm_dp_panel_set_pixel_base(panel, dp->pixel_base[stream_id]);
> 
> Hmmm.... Would it be better to set it up differently? Allocate one panel
> per the stream from the beginning and then simply get the first
> available panel when required? This would require some minimal resource
> manager, but then we won't have to pass dummy register base to the panel
> code. Or actually allocate a panel when it is required? Do we need a
> panel before atomic_enable()?
> 
In this series, panel come with MST connectors, Because the connectors 
are dynamically assigned, we don’t know which connector corresponds to 
which stream, so there stream_id and pixel base address are dynamic.
we have 2 optionals here:
1.panel come with encoder (after bridge remvoed), like that:
struct msm_dp_mst_encoder {
	struct drm_encoder *enc;
	int stream_id;
	struct msm_dp_panel *dp_panel;
};
2. During enable and disable, allocate and release dynamically.
would you prefer which one?
>>   
>>   	return rc;
>>   }
>> @@ -882,8 +883,14 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>>   				    msm_dp_display->aux_base, "dp_aux");
>>   	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
>>   				    msm_dp_display->link_base, "dp_link");
>> -	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
>> -				    msm_dp_display->p0_base, "dp_p0");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> +				    msm_dp_display->pixel_base[0], "dp_p0");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> +				    msm_dp_display->pixel_base[1], "dp_p1");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> +				    msm_dp_display->pixel_base[2], "dp_p2");
>> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>> +				    msm_dp_display->pixel_base[3], "dp_p3");
>>   }
>>   
>>   void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
>> @@ -1163,6 +1170,7 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
>>   static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   {
>>   	struct platform_device *pdev = display->msm_dp_display.pdev;
>> +	int i;
>>   
>>   	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
>>   	if (IS_ERR(display->ahb_base))
>> @@ -1192,8 +1200,8 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   		display->aux_len = DP_DEFAULT_AUX_SIZE;
>>   		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
>>   		display->link_len = DP_DEFAULT_LINK_SIZE;
>> -		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
>> -		display->p0_len = DP_DEFAULT_P0_SIZE;
>> +		display->pixel_base[0] = display->ahb_base + DP_DEFAULT_P0_OFFSET;
>> +		display->pixel_len = DP_DEFAULT_P0_SIZE;
>>   
>>   		return 0;
>>   	}
>> @@ -1204,10 +1212,20 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
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
>> +		if (IS_ERR(display->pixel_base[i])) {
>> +			DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
>> +				     display->pixel_base[i]);
>> +			break;
> 
> No, return an error.
> 
Got it.
>> +		}
>>   	}
>>   
>>   	return 0;
> 


