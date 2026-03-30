Return-Path: <linux-arm-msm+bounces-100733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB6yBM9Kymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:05:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EAE358D09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B83D3035D66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF4438838D;
	Mon, 30 Mar 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSwlnorm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9yccywp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030403B4E8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864643; cv=none; b=QjdGPeX6SlCKh0VHBqXJP0HdQo9q5x9B5SIi8epKDjSPMyoJkPUehxW4VGpgCpFCzqU9p+2q2q5m1zaHGOph2YTcmciYp2UxoufWU9V6LOeP6en6PgiJsevwzZ8jBFNgK2hfuImg2Z4T8idwIKuk4owYzSSoyt6hx2cSRfWR0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864643; c=relaxed/simple;
	bh=BIZ2xVvrz7ufWQZCnlXQg4j8fC0K5mDKmmIaC6nKUy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2sMi4iqqBT/QDnoVi1EkIwo16Dn4aVuFkWGzR2L/Qwvff2qfOQWIROm05Q1JHNz4iD9U0ChYJqd4XMQnTGajDZ0KW5kHoWxALKbaMO4VVqP0wXgZeLGjHvK6eCHIXLRLcTANwXwYzypXvAn5X7fudP6rZ8TCEKlAiEMr7EG0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSwlnorm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9yccywp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9nAWT3721893
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+q+5RHoG05AQakEjF3RsKZ6QTb82SYW8BIOn7cpF4Q=; b=pSwlnormFTICBJC1
	YN17+71CfmPcq9N6kqRvKF9dcIJ9K3K/SJb4UCVH8BT6X3M/crTNdLyaCLayPNE/
	5tuyTF6yVJCX51sRLMk+PKRTRqJGr8rjpxgDOJyu8hvWMiyq2qhzKtgQ7lvAWhq4
	2ZQTti2UWrX5YJFoqtkHmAxJbpSB1NuHICBTYgkeowWx/1ATG3r83TDJNnyo+Ntm
	FrupbIVi5GQLwABPhsReaQlI+WIyDZRPG0IdrItSVgSQ726s2JV3X3mGaqkZnckJ
	h/yX63q/trLJThX4QT70pCAj1bKPaFEFtelF1OLZ2DtohMacD4BYiRx5sgzgT/0S
	uGGpuQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7pvmr0yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:57:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c699d8caaso8165389b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864640; x=1775469440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+q+5RHoG05AQakEjF3RsKZ6QTb82SYW8BIOn7cpF4Q=;
        b=b9yccywp79tWNu2pq/MsEtnitooyW/F9KcdRJLPsy0JhP2fvbUc2JeJ1LYSp6xf6s8
         WtuhpqIaxiqSMneZKMat+ajXe18SvJDicEamf7PXg60ovLzNDWE6k75GRk/AWCvIm9b8
         k07xkDMolIKo2CQm2T2yEaTAH8VKTITQCWTPTVW8b4fo+P9k38clB915u12Soc2sAj+b
         5JU6N+Ysjn3tS6Gv8xz1P6YXk12JqgVlHwG/QdWxoU6yt6vWTGGjIW/92ZbqximcrU/v
         8qbds7ksoYzO6qLv4Xbas8PQxfb1HTfxUo6XXmu9qX+dJySzT73CJEg4sMQ0mTvGQwad
         /h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864640; x=1775469440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+q+5RHoG05AQakEjF3RsKZ6QTb82SYW8BIOn7cpF4Q=;
        b=AmiKaVWrUShAuBogVbJ/0BTV/kFhpuUzXg09++4i6m2+y62pLzUZgGkpUIPteCa4L9
         awx/S4s2u9HjulUj59Jh06r5QTft51Rj/eGnPXQRcJpErq0kPxiB4oTm6V1/ubkg4aeH
         Jqq9kiXO6/cjqMIvfIOEnxjOVp6vUAE4RCXg0k2XQNRi7hSts55JtwwkH80ZUDa101jM
         DIyL9u0WiofL1A4w1CCHaObhGyHTtx0UspmgFlxzzUd/4UgxecsFBjQW1Ot/mCyRSPc6
         g0uykAbWqQoEZL4PIeHSgmOKRMHtJKbMw7rLS0QX5FeWZCmWa/cKw+gxPDaoie/Zvss/
         n9oA==
X-Forwarded-Encrypted: i=1; AJvYcCVOc6vvdU2ce75fKgjxlPkrOy6sZMNdOyZ+PpcYRS+208QxaEQzB7nL7vW8F7WMnExvv+JT8ktHfbMA2xkX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7zrV6nj+L0muWo5zFZuwjmnumldZnya7IUIa9oJWrVMKFYvt5
	RCAzB8hZjFWtEbPTKBeQiQZvTJwc4A8Be8SmQn9o2CBXqa+tNgFiJcSOqhTNiXKEzoGHVZ8E1Gn
	PwXzuWzZE4umj1D/78GUKNVTHUQbX4TES8dMhmoyfJS4DfAOVeJNySSYRZIdQv1dvquyW
X-Gm-Gg: ATEYQzwBB9FQAPHgOlvH6v++xN9GXYTj7vOS8YMRRqDltjdfKhNX2RRQCmAJeGsvN3K
	5oF/UE3iGF4WwQCFkooTgUkeNG3Kqj5F3CSykW0hdXXjkKCO2TwVV8cJ9YVWi+lE3HbF3Yj1TqB
	fuf2Kud38dE+3px4Ns0t54pe55B88W4zFR5TRsa+PeITTCZ3yTGgoEQvrA5rP3zbGqE8rxKqOvJ
	SC8k2eK6VhwtFFSMTPeO8tu0TpA0r8jmIZE0AD3BP9vji4kaiezhxOQDKWRPdquOdLTgoGWxRCd
	VFKuUMgBqeLC6kwZwmSOUXXQZSEvO9GH3FTmgr3SmWkBXCQFHyyrV2d6Wcp1r77QTa7WGYYYC2v
	Kj8/k3DyF5tFG9ZrBWStm3RxbJoDNRhUh0gHiNwVsv6/iauFL
X-Received: by 2002:a05:6a00:f8a:b0:81f:43fe:988c with SMTP id d2e1a72fcca58-82c959d4bb4mr10970709b3a.6.1774864640008;
        Mon, 30 Mar 2026 02:57:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:f8a:b0:81f:43fe:988c with SMTP id d2e1a72fcca58-82c959d4bb4mr10970675b3a.6.1774864639520;
        Mon, 30 Mar 2026 02:57:19 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc756sm6320616b3a.47.2026.03.30.02.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:57:19 -0700 (PDT)
Message-ID: <c71ea478-ed93-4f10-aba2-023180c2ed42@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 17:57:13 +0800
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
 <ltlmp5ytl2f7no7aqq7sl54pwd4f53fuema23xnuwu5uthhbg3@7wamwvv22nle>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ltlmp5ytl2f7no7aqq7sl54pwd4f53fuema23xnuwu5uthhbg3@7wamwvv22nle>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K1dVKw70ZT02yIw0brRfnuN9SarNRwnZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NiBTYWx0ZWRfX1RFNRmHzE1sG
 Btbb+UkoBteyy6Xpl7JGjHPhd8Z0g77H/9e7qRHR9umL+XU9ICyNQHFx+7Dl6n5F9hjAjMPA1cW
 axOaKSpE10985PC1pC7CKRPt4D3FQggsQCJWTlEfPkIzBym4rYyoq67WFvGHn7PW/o86dxxVUB8
 CZolMD4d6Guk2P2F3/Jr1O31vsrHOX0XLheq5otk1xh4HZQ6ou8I/KVrNqZPghfRFYH6HdE7+Ey
 rEMRAReeOo/EYGErpI+dJ9qo6Nczi4Nz0GaG6HOVJd5UTXkXxHbCGGzOLAXT2ZT0Og12rpas14d
 jnYA3au1IlprapOBOQHcezCVcBZjO8QHPM4Nmel7PBsRpk4L6Xe3RJhlrrjDeh9JcdLb9G5Nl5w
 O5FiQ7GF2yNdqBgF7hVCCvF7LbjoEL2oKkisLDSm/QfC19NgGe/IkRXq++DHkkzWvIBSb29jvs2
 ZBetrrlPn2KhtDY1yRA==
X-Proofpoint-ORIG-GUID: K1dVKw70ZT02yIw0brRfnuN9SarNRwnZ
X-Authority-Analysis: v=2.4 cv=S9rUAYsP c=1 sm=1 tr=0 ts=69ca4900 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_fflomLE3yKvlCkzeqkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300076
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
	TAGGED_FROM(0.00)[bounces-100733-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
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
X-Rspamd-Queue-Id: 45EAE358D09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 1:42 AM, Dmitry Baryshkov wrote:
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
> 
> How?
> 
Each DP controller have it own msm_dp_desc ...
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
> 
> Why do we need the separate boot field here? Isn't it enough to check the max_stream?
> 
If remove mst_supported, condition "mst_streams > 1" will appear in 
multiple places.
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
> 
> Just use 1 it's not that magic to define it.
> 
Will fix it.
>> +	dp->mst_supported = FALSE;
>> +
>> +	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
>> +		dp->max_stream = desc->mst_streams;
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


