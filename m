Return-Path: <linux-arm-msm+bounces-100736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDuIDWZLymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:07:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8B7358DD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 261E23008A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE405262A6;
	Mon, 30 Mar 2026 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+cojxtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpSEY1mG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0651FF1C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864778; cv=none; b=NO+xo2JSqRT4vBuSxVdkDLghrMpVMggBgP8AbaCptV60OkBXVfJIz/Jqy8Fz1qPcP53blG687GipV8A7R/UbZeNxk8tzNGSyuzHHnpgMw3hsd7u8ynxhBWLOaIDxB8ZplO3NXFJ6pfTGc6RdT/FRAiHVgj8tfVomol4M3wXzPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864778; c=relaxed/simple;
	bh=4gDlDOfBmbs+IAQZ4qjeX0ovGi6DxvmXAAy9WXh/geI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzpZgLlktuyEHKevRnFsviPe8FeLEq1ZNytpyqwi84Qj19XfBng8M189BGkPpgr73JcPHtrIy+jwerutYaZwCzcAgGcsQ/uFqsru7eoUbNt06xXfdgJKOUBEzw0QfycbBzK7RvlG+ZmGYtOfSknYkrpueIdwljDL3oQnGSTiZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+cojxtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpSEY1mG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7ZA2D1246114
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+oFEZzGALuVwvBpWKTSR8/70BuWj677y5wYf3rKFaL4=; b=A+cojxtXcurl7zMz
	jSQMAPvKDMu2n73fX2DoO0XHGQ4aR2WDpdvTtv+8qQpctDXjAy7HxU37IKCRy2AY
	AprqsptFy7B3km/iqS3Fdh2vQBYPY+CzjZvHPJuf5OrAHDiGT+LvBzsWEQhJqzCS
	qHritJ0Oxh4UXYo0gBzIUjWUw/caw+W65ynSL0FM8vjAdtQZLxGbwEZX3L+iGmuz
	DWyFwEmrnaoVbqOYjva0qvvQHt7ma8CJuEnra9QcDUtDcxKaFt1ELpWYS8IvlNij
	vo9HFq2erw95EgT21sMZ4usL6eBxwAKpv7Tpx8qFJbEXsg0M5MmZsJXcM7Ds3xXT
	KI74ig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67715jyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:59:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24e45271cso14987735ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864776; x=1775469576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+oFEZzGALuVwvBpWKTSR8/70BuWj677y5wYf3rKFaL4=;
        b=TpSEY1mGIW/+/rndXgrfwKSdZ8j+e3EiPmCBHX/6of/0IC9movxrShLPgv/WD8DK53
         mFH7pK3QfocDF5yjYjlb0/XpFM+hUQ/1a5zt9STtIg43vb08hmC7rUmKMsdDLRCcoae/
         Yz62urNN3S4C46biz4G6BgvsR1/GOhoKfXT2QPojyF4X0bjmUyL3/eyQeq779hfhoVPM
         eRUMw584rzFqFL1xg7G0evh1xfT5O3CHxORzSFyXj5w7+eMCrpFApHZ7SVg5WVYxuUGj
         Cl1xrltl5eDpx5uwE4DmKdQoDeOHYFqoIf9/I5IVo44e2f4qU5nO37lcKF21Jtm8db36
         Vgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864776; x=1775469576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oFEZzGALuVwvBpWKTSR8/70BuWj677y5wYf3rKFaL4=;
        b=DJbG2Kj3by3kdQAZ9osJ+g9DbAXm92kr40PdRQpsKAPNJAu+mCVpDhhEdIPt3N4T6Q
         kl6WOkVsHZDHeEAZ8jtfCbRp7kMARIpyLa41a2F7uj/7ZG6ezxxtbyA1KwQIXA8xmLwG
         Sntdy+B1EeUaFdj6UgIXvRq/7RwrN/Rn1X6p7vSWY+AcRtPUtmvt5RlQKt5odE34Paqp
         QzIZpqOoE1rJ1c7k5pX+X5N8O5rp8n1D+f9l39QSghZjDiToWZw9bG1yg76icaSVklkh
         QFwYEAhQhPfOzV10En3pMViBB0aldexiPqv61qhVrO4G9bc5dAbgO0HiYdyZsjO2k3ve
         4Z1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlIEoDS66ZE/EyDUtagIj+lMxRvuYaKh6qsXkan7ocaKYvcuEQQTjoErhpdtiImHv2YwV27RdNCA0RG4Cf@vger.kernel.org
X-Gm-Message-State: AOJu0YwTLYxFfYruF1fFwv9SuqzyFQpvm5evaY7eBxTMINqu6MsyanME
	vCXW3E8aRB3/B0GLLZ0RdDx8Z3yabGtDUoehbOIDCSW0hjTKly3F5Cgh7QmewRX4WW1+RpGPr4E
	qs88zyMeAkGOmbI4oeGgCZHM0MIzs+7xlIMnz9CTtH6xTfpCONY8sSM0ReI7upHkwX1vJ
X-Gm-Gg: ATEYQzxdgLHjCX3hQw4/tNOgBHuX315idwrP6/Z+30Vu8/cil0Y9++k/bZb3GD/Q4Mu
	q8Twua3sgunRA++bnmkLAgsKJbaLo2ls9pYCAZ53iBZHWOcn08RMLnroFDbZ8uua0932A8hBPUB
	wDNngxze2t+xqQIBkHM6XQH3xFT2F6YefQXGzXSR+6ue3H2TmPzOMh18adk4geLSaDWbkm2eUT9
	EY7Qr3EZqWHxmAihJqvD0UjAOHmZ7+8Dj/fg9zA683ZfmWKpZsSeWqTTtqF40xuykfWh5d9gOA1
	0jXbHOZ3TRQRP9WDFmt7QpXvzunNEcLgpV7k55QpFbKawzuc/qcs69skY5I6EcSnZ1SAJifA9yR
	m2roirQCPZP1kndczOErPdJ1dLrr9/zrNvVnmmBb4h1NDaftw
X-Received: by 2002:a17:902:ce12:b0:2ae:54b2:27c7 with SMTP id d9443c01a7336-2b0cdcca420mr133928565ad.39.1774864775975;
        Mon, 30 Mar 2026 02:59:35 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2ae:54b2:27c7 with SMTP id d9443c01a7336-2b0cdcca420mr133928225ad.39.1774864775490;
        Mon, 30 Mar 2026 02:59:35 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c4cafsm78786605ad.81.2026.03.30.02.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:59:35 -0700 (PDT)
Message-ID: <7e6a7bdd-a94c-418e-92e6-524a58cdca46@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:59:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
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
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
 <lngtq2tw4qajgjk57un5xrveblkmtjkkz3yjgue53vp6wwmqmf@owderf4zerfq>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <lngtq2tw4qajgjk57un5xrveblkmtjkkz3yjgue53vp6wwmqmf@owderf4zerfq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gU4m_krs8nXEmP8xIhTRRQETyR6Y5NLC
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca4988 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=J4JoB0OTnpniNVX1FM8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gU4m_krs8nXEmP8xIhTRRQETyR6Y5NLC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfX3L0Ro6eC9FY6
 eUyylb7Rqp2atQIj07cibMR8kLfLaZOSdGVymK2ZpMEgUAWPuPdDC+C4wGd+2p7X83602L4svBW
 qL7VkkpsYoGGh48hgMP54EvAICMhy6AYNABy5WCzoW7au+4T8qC417B4X9EZJ3MJLW5345vi9bW
 xvgT6HOulDJEinxLF+WsDiLuIC3rVfYdZaqp4CY0zK1oqV/dX4ODwW92PKuyAwLsrjpCPWXra7l
 VPWvR8/KNJK8PHTLuwaf11oHer6E9R+9+Lsu8n4S0axcqB3VCpSiuKD8pAAp3Aeth/T4xfC9RFk
 tN7ieMIRj7SIA809XVJ4txdV1HTzbIVB/ct1tQTvUhJXYYPnnO4Xk1DJkU1CdTP8IbllYpok7WB
 yyfhFHSKT1clnCs0P6VLjGKMqZnyI0hXnGEdRUHnNeH2jcAjkWwSNLVSlNPgFGwOZTjmSKYndvu
 hcGZiPTMDmb4B7H9Y/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100736-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D8B7358DD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 9/2/2025 5:41 PM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Introduce the `mst_streams` field in each DP controller descriptor to
>> specify the number of supported MST streams. Most platforms support 2 or
>> 4 MST streams, while platforms without MST support default to a single
>> stream (`DEFAULT_STREAM_COUNT = 1`).
>>
>> This change also accounts for platforms with asymmetric stream support,
>> e.g., DP0 supporting 4 streams and DP1 supporting 2.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
>>   MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
>>   
>>   #define HPD_STRING_SIZE 30
>> +#define DEFAULT_STREAM_COUNT 1
>>   
>>   enum {
>>   	ISR_DISCONNECTED,
>> @@ -52,6 +53,7 @@ struct msm_dp_display_private {
>>   	bool core_initialized;
>>   	bool phy_initialized;
>>   	bool audio_supported;
>> +	bool mst_supported;
>>   
>>   	struct drm_device *drm_dev;
>>   
>> @@ -84,12 +86,15 @@ struct msm_dp_display_private {
>>   
>>   	void __iomem *p0_base;
>>   	size_t p0_len;
>> +
>> +	int max_stream;
>>   };
>>   
>>   struct msm_dp_desc {
>>   	phys_addr_t io_start;
>>   	unsigned int id;
>>   	bool wide_bus_supported;
>> +	int mst_streams;
>>   };
>>   
>>   static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>> @@ -1213,6 +1218,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>>   	return 0;
>>   }
>>   
>> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
>> +{
>> +	struct msm_dp_display_private *dp;
>> +
>> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>> +
>> +	return dp->max_stream;
>> +}
>> +
>>   static int msm_dp_display_probe(struct platform_device *pdev)
>>   {
>>   	int rc = 0;
>> @@ -1239,6 +1253,13 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>>   	dp->msm_dp_display.is_edp =
>>   		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>>   	dp->hpd_isr_status = 0;
>> +	dp->max_stream = DEFAULT_STREAM_COUNT;
>> +	dp->mst_supported = FALSE;
>> +
>> +	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
>> +		dp->max_stream = desc->mst_streams;
> 
> We should keep compatibility with earlier DT files which didn't define
> enough stream clocks for DP MST case. Please check how many stream
> clocks are actually present in the DT and set max_stream accordingly.
> 
Now these DTs should already have the MST clocks added.
>> +		dp->mst_supported = TRUE;
>> +	}
>>   
>>   	rc = msm_dp_display_get_io(dp);
>>   	if (rc)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 37c6e87db90ce951274cdae61f26d76dc9ef3840..7727cf325a89b4892d2370a5616c4fa76fc88485 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -29,6 +29,7 @@ struct msm_dp {
>>   	bool psr_supported;
>>   };
>>   
>> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
>>   int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>>   bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>>   int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
>>
>> -- 
>> 2.34.1
>>
> 


