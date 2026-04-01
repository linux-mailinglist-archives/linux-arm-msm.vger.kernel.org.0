Return-Path: <linux-arm-msm+bounces-101239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLE7AGO/zGmYWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:46:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2D237560E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFAFB30A5819
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFD82E7BD3;
	Wed,  1 Apr 2026 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5hHg7qE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjTLY9l7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F632D7F0
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025662; cv=none; b=WoJXw7w07L2NA1WXSlWVRmFlrFGJgVroiSZAViMvaCR+aDngGClsWOe81i8AtCWr5DhR1bdbjmG0RRYBcNWfDg67bvtuNBZ+BsWpAbGCsHhT8XsvzL5FX3i++xsq2oGqlT63QifUAtLU7fRMASo1n8yMh1njb3pw/JgnLKqVSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025662; c=relaxed/simple;
	bh=M3fWa0CvsuPzBq9ey8O6lLPoij6MJTxj7uTqnAOzez0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1QkYbxLO3/nYMf+pvBsmwvwyiYhAWqCGEhQW/vl7awZr3n/nuT6coSjFHt+RQ4kGAAVdRWoHPogbova0qwn30ROoz2Bib/RAMkDoxAkFqECdGKXUNKH8in9DLguqs0rahJCAJUwfTrMfj26h6HvGCCl94O12+LYQnQRfPmgYbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5hHg7qE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjTLY9l7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63102ec93240141
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rzTAady7xf/9UKre2SGj4SnZ2Yd+FVnY2u9zy40iksI=; b=e5hHg7qEt1Qck8Df
	bA0oasMBGuJDJiJdzk6tCYGo/uSbiEaFjlmyLjmne9OSZC02OW0KySxNGdRTkKwZ
	6VMWfp2oZnwiB5EPR0hAydnxtuwxx5drfghe3PZcLXnSj1iZqDnStJxO/6lzPnKZ
	NB+O46txLIHiwLKE3wWGtrePXN6E1p8TjHgNzmhzPnngGi/x95VIuz59+Yc+J7gm
	kjJqob0DH6eUs6jhRD/YlV8sxpLCSbTK+Gctp3g9rBinga8KK5XNPGzYemftMv5Z
	4hEdV8oWNHCUcV+avC1+LEu0HsnAOlYjEGcwy7tJAfRIEHhTpxrV13B7ZilxYov/
	WhZ91Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yw44f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:40:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso7559995a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025658; x=1775630458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rzTAady7xf/9UKre2SGj4SnZ2Yd+FVnY2u9zy40iksI=;
        b=YjTLY9l7CVExeSw4RREGYXKjWgdo+xEDS+i5hfTPB/NlIG1X2jp6lphIxP0R9XSmOw
         GioXKx60uFznc8HaIbu/6V22dwZTo/vPX3v7IUE2z92+1mmawxe4Sq+CnvhuiM/lN+W4
         vPx35TE9DVoBSgvmnRqt36R0jrtEASJL7GFaUgtyTVPTHPealdQ+KzTq23hMECkRMAsm
         zJC+lazuCSB4300XV12hipzeUEgZYiwNHvmuD3BILuKpc2hZZyB018J2Y+Idu4/D5w5o
         F54r3KTArG8CDrfGsa1MYPB99giE0YZJ55zVPW46huwGa+QozaSygnAjh/7HuXLLDlnQ
         6q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025658; x=1775630458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzTAady7xf/9UKre2SGj4SnZ2Yd+FVnY2u9zy40iksI=;
        b=AAgyFtXyytBLjqF+5aL07VzYobQvIvSBueNhMJmzudF4zOFNalWpwoAy0i/I8mWWvj
         Rz4QLPSzBUPv3aBg69nfMic7mYmP7ilbgRQ5iTz1lpq3w+dGPfX9T3T3EJkbKNUbdrYu
         /mQ5XpuPSGajHdTRablKm1Qe+sgdPZn+jXD+4NfBPGcAjL52zhjBmIKeK1L1GUw43Qpz
         zuNpm377UFf/IoPV7i57dvKCeC9vIwdV+t7k/MP2iSi/40mIdEDGExeMs6bchcUcyIqQ
         ARA9jK9607Xo4lWyDTx7qq4YHKo+gcQMU9RthccENMpgGXvlvIpQPp/c1ym4mnCc/GNV
         ooBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/zQmPSPoWJDVSJ35gl9bRGajx83IJIPnpvQ47AsYm4txyHoRsmxlna8IGRaM7cv4/Ku4ojULqjDK8t3kQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwVeJZDUIDOZ0s2b/Nb9ojq04Af+5xdVld2/0j8HktaUB9TXGN2
	7RzopKuJYIj23Dn1zk3x0Xf7qNhPrJsynSeY4CsnEZ4oQIct/jbBmCxrD4O0vVA8BqOfjwzw9gm
	kuDyuvK+MzmeD3rhJRmpg4Jwq/LNbb+Nh+YjmaMODwIUsaKCzj65mS2tOmSfo3g529Ul8
X-Gm-Gg: ATEYQzxTX3M9+EfWcnHtmDUOTXVXqpjH7n+buQ9KlTdtWZHNfzafYreDTSi35OxeWqx
	VG7JVhpsxXjFbGvHIqohHvB/wrNqvzJH5tznho222ggVt1/bvlOvh84r05GsA3PWSLzichjIvE7
	XIUkqLGi5hRUR8eqpob0OjVQwZKFUyJLQMXALyajPfyayZwNBoK4731vH9ZW8+QGNN0tRzjVcVR
	ll0TPf0lEjcTpAWDv784yYf7LcildxJUeuVSZsizJxeDWF56+jLJWsnU/f17im1qSaQ0Yg7HFBO
	cX86XgWG/SMZDx9kDoGEP/lXOxVysoMComoIHS92NUlx7EohGNtsiTlTZh8YdbBrA8bGBIDV93K
	ELNLGXEdQ/JyENDGcrCsY5Gnh+eqP6jhmDKILfvtPoAjRqc3KTNvFWYBSo8U7kGoEqQAisBh5RR
	246oJdjN43/nuUSlrQtQ==
X-Received: by 2002:a17:90b:2ec4:b0:35d:a8d9:3a8 with SMTP id 98e67ed59e1d1-35dc6f7ad0bmr2322312a91.16.1775025658202;
        Tue, 31 Mar 2026 23:40:58 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec4:b0:35d:a8d9:3a8 with SMTP id 98e67ed59e1d1-35dc6f7ad0bmr2322289a91.16.1775025657673;
        Tue, 31 Mar 2026 23:40:57 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbb96a125sm1434666a91.7.2026.03.31.23.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 23:40:56 -0700 (PDT)
Message-ID: <4f7772a9-2ab1-426a-83a6-7709bbdf0825@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 14:40:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/38] drm/msm/dp: Add catalog support for 3rd/4th
 stream MST
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-16-01faacfcdedd@oss.qualcomm.com>
 <j6n7jntsapy53ojyackylfctouuyu762pjf5dsbjhwoti6cos6@5ppukry35xo5>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <j6n7jntsapy53ojyackylfctouuyu762pjf5dsbjhwoti6cos6@5ppukry35xo5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: afzEKkCMuFh-sZkZNJUY52RfdM5B-sSi
X-Proofpoint-ORIG-GUID: afzEKkCMuFh-sZkZNJUY52RfdM5B-sSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NyBTYWx0ZWRfX8p+CQd34blfJ
 7kGHtOLfUS/ZA00zT/o0Kdr9CTVXiyDtl8zPRdSKD6CY9Z/F2zks0Rki7AvitS65TsASJfPF9hk
 R2MjMvRHs8om1Nv/L4d2i2sspNFtSBhtPnCQKuDaJ16byMENWnFHtv8u5whPHFdaioejq0S777q
 y/FufIRkBvE8eZFg616dRWuwNy9GSkbXDna7xgo24TwdJtxVYn2TpGYsHon23yXcBsI7UaFHJWm
 FvRONbtjadpTIGhcXlsyiJ0p2HMptxblEdUEQmU0CfOqZHYxm6uupIk2AfzXoopUJ08vtwWw3X4
 T1bjH/UDhL10gbkxl2WSXzIFtcLWovG9OceS5ln3FuNvOlEG4XKN5l1qSEgGqqJHecVLjOXPjBG
 W/iQqYIVBqtvJIlCLhAv4mMTeHOITaW3Mvhv8kyOfmRXW80QR6v7SArpt0Lbqr+Mu2OnsyTbfVZ
 leQDG6JmdCB9l6RMitg==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69ccbdfb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EADwIwZ3O8U4OMQTBn4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010057
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101239-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 5D2D237560E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 4:35 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:02PM +0800, Yongxing Mou wrote:
>> To support 4-stream MST, the link clocks for stream 3 and stream 4
>> are controlled by MST_2_LCLK and MST_3_LCLK. These clocks share the
>> same register definitions but use different base addresses.
>>
>> This patch adds catalog support to enable programming of these blocks.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  82 ++++++++++++++++++---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  24 ++++++-
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 138 ++++++++++++++++++++++++++++++------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |   4 +-
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  14 ++++
>>   6 files changed, 230 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index b8b6a09966aed96f705bdd54cb16ea63e5f0141f..608a1a077301b2ef3c77c271d873bb4364abe779 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -118,6 +118,8 @@ struct msm_dp_ctrl_private {
>>   	struct msm_dp_link *link;
>>   	void __iomem *ahb_base;
>>   	void __iomem *link_base;
>> +	void __iomem *mst2link_base;
>> +	void __iomem *mst3link_base;
>>   
>>   	struct phy *phy;
>>   
>> @@ -172,6 +174,40 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
>>   	writel(data, ctrl->link_base + offset);
>>   }
>>   
>> +static inline u32 msm_dp_read_mstlink(struct msm_dp_ctrl_private *ctrl,
>> +				       enum msm_dp_stream_id stream_id, u32 offset)
>> +{
>> +	switch (stream_id) {
>> +	case DP_STREAM_2:
>> +		return readl_relaxed(ctrl->mst2link_base + offset);
>> +	case DP_STREAM_3:
>> +		return readl_relaxed(ctrl->mst3link_base + offset);
>> +	default:
>> +		DRM_ERROR("error stream_id\n");
>> +		return 0;
> 
> I'd totally prefer having a single set of wrappers which can handle all
> 4 streams. Having separate call sequences is not a good idea and it
> makes it hard to change / extend it.
> 
Sure. will merge them into one func. eg. msm_dp_read_link(ctrl, id, 
offset)/msm_dp_write_link(ctrl, id , offset, data).
>> +	}
>> +}
>> +
>> +static inline void msm_dp_write_mstlink(struct msm_dp_ctrl_private *ctrl,
>> +			       enum msm_dp_stream_id stream_id, u32 offset, u32 data)
>> +{
>> +	/*
>> +	 * To make sure link reg writes happens before any other operation,
>> +	 * this function uses writel() instread of writel_relaxed()
>> +	 */
>> +	switch (stream_id) {
>> +	case DP_STREAM_2:
>> +		writel(data, ctrl->mst2link_base + offset);
>> +		break;
>> +	case DP_STREAM_3:
>> +		writel(data, ctrl->mst3link_base + offset);
>> +		break;
>> +	default:
>> +		DRM_ERROR("error stream_id\n");
>> +		break;
>> +	}
>> +}
>> +
>>   static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>>   					struct msm_dp_link_info *link)
>>   {
>> @@ -386,7 +422,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>>   	u32 config = 0, tbd;
>>   	u32 reg_offset = 0;
>>   
>> -	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>> +	if (msm_dp_panel->stream_id < DP_STREAM_2)
>> +		config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>> +
>> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
>> +		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
>>   
>>   	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>>   		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>> @@ -401,8 +441,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>>   
>>   	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>>   
>> -	if (msm_dp_panel->stream_id == DP_STREAM_1)
>> -		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
>> +	if (msm_dp_panel->stream_id > DP_STREAM_1)
>> +		msm_dp_write_mstlink(ctrl, msm_dp_panel->stream_id,
>> +			REG_DP_MSTLINK_CONFIGURATION_CTRL, config);
>> +	else
>> +		msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL + reg_offset, config);
>>   }
>>   
>>   static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 43a9ce0539906e1f185abf250fdf161e462d9645..a806d397ff9d9ad3830b1f539614bffcc955a786 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -142,6 +142,7 @@
>>   
>>   #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
>>   #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
>> +#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
> 
> Please don't mix registers from different register spaces, it's
> confusing.
> 
Got it. will put this into its own MST-specific domain.
>>   #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
>>   #define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
>>   #define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
>> @@ -163,12 +164,19 @@
>>   #define REG_DP1_SOFTWARE_MVID			(0x00000414)
>>   #define REG_DP1_SOFTWARE_NVID			(0x00000418)
>>   #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
>> +#define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
>> +#define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
>> +#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
>>   #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
>> +#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004C)
>>   #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
>> +#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
>>   #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
>> +#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
>>   
>>   #define REG_DP_MISC1_MISC0			(0x0000002C)
>>   #define REG_DP1_MISC1_MISC0			(0x0000042C)
>> +#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
>>   #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
>>   #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
>>   #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
>> @@ -236,9 +244,11 @@
>>   
>>   #define MMSS_DP_SDP_CFG				(0x00000228)
>>   #define MMSS_DP1_SDP_CFG			(0x000004E0)
>> +#define MMSS_DP_MSTLINK_SDP_CFG		(0x0000010c)
>>   #define GEN0_SDP_EN				(0x00020000)
>>   #define MMSS_DP_SDP_CFG2			(0x0000022C)
>>   #define MMSS_DP1_SDP_CFG2			(0x000004E4)
>> +#define MMSS_DP_MSTLINK_SDP_CFG2		(0x0000011c)
>>   #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
>>   #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
>>   #define GENERIC0_SDPSIZE_VALID			(0x00010000)
>> @@ -248,6 +258,7 @@
>>   
>>   #define MMSS_DP_SDP_CFG3			(0x0000024c)
>>   #define MMSS_DP1_SDP_CFG3			(0x000004E8)
>> +#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
>>   #define UPDATE_SDP				(0x00000001)
>>   
>>   #define MMSS_DP_EXTENSION_0			(0x00000250)
>> @@ -297,6 +308,9 @@
>>   #define MMSS_DP_GENERIC1_8			(0x00000348)
>>   #define MMSS_DP_GENERIC1_9			(0x0000034C)
>>   #define MMSS_DP1_GENERIC0_0			(0x00000490)
>> +#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000BC)
>> +#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000C0)
>> +#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000C4)
>>   
>>   #define MMSS_DP_VSCEXT_0			(0x000002D0)
>>   #define MMSS_DP_VSCEXT_1			(0x000002D4)
>>
>> -- 
>> 2.34.1
>>
> 


