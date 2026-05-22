Return-Path: <linux-arm-msm+bounces-109196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLMqB8sNEGpqSwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:03:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3775B0517
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92580306CC5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 07:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135C5396585;
	Fri, 22 May 2026 07:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuPUmRr3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CvCJ8yPo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6430387377
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436696; cv=none; b=GzbYS8ZiaVN+erIoS4+sQYXWU5zOg8bE8EQX4O0zWUnmcp69v96DKZfdC/zYp6kvwkftGEnFmBtkb8iCf5m76WHh4d2caJ7GUB8Xw++JUM6C2recu8QByFipVgBLz0c8MFJAkuGPR3aGc4yeyLByTscKVG7vgturZ4GU7Z0VZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436696; c=relaxed/simple;
	bh=6WNY6+7JTzSDWCJvJvRITSaXaAln8yAoOqxMVXSKhDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5WFx8WSDPaeEcw+sM5A0jj+c5jFbohyIUWCA8s5o5sCedVel9gAX9rcjQD5d0VK75PoLqYfOoDTI9ixa1b8lO9q+fHciRc2nTpJUzafBLlumTk4Z0FX4pz2qWBpY1LCjafXoEvsVHi5PbgnoyomKPGPYujvBoqe2cMlN0Js/Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuPUmRr3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CvCJ8yPo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6UEU81298051
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxBZMjXWfEDezTxhg4NXRbYWC2H2xYO8KsQ+Odv+Xpo=; b=nuPUmRr3EY5asGTb
	lm33cvgGHMoqefeW+ED9j2GIonpRmQSfAB1mFs3S+0j13/xQ0zZTeyHq0CR4Hf+T
	ZmJPCHrY3W7SV4H15GIDOcJqbq3jJOxWes79HqcgZ3dnDQnGNFB1YItcUc7ffiGl
	PGri1GJqDyQlheewdPUQ0ObvAOl5sJA4R3fBBf5zBjffCodkWBROe4CG3XVsCgAI
	k+CEYCryoFJqAS7p3npIxxsZZgK3Brc4AV6hM9q9lmRyskw3KdaV2ha35U8jFM6q
	fWqKv65+x1RaMGBQAiN/yGhsy8NIK/jpR5LQGa03CC/0ILjXEAexRhhXi9+wa1F/
	5QaiLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah09sd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:58:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so118767145ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779436693; x=1780041493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxBZMjXWfEDezTxhg4NXRbYWC2H2xYO8KsQ+Odv+Xpo=;
        b=CvCJ8yPo66V0pYP8uynAZrkohnvkuP3MDhB3dGB7LzAfkGT7simnluLRx5+pyIyAAw
         dThR1f02BTJmLzIt1eEuOZkQuKeHYIeUnNqSJNXJdGhxcbuJ2KIZONrnqW8S1Y+OuS5n
         V0WxOuexXIbtb5v+B7O+hRwyRLFUhicZ2xxVT02CkBoxt8T9ysdL90wI7myxHJ18wgFI
         nM++/njkvcY3z1hTkBPcB2w84eGFBK25pIBnCaAZCrJ5FWKa43kgF/7bbFDoJ6fk1nov
         QTgbBvD6OHpM4IL4xXjWC83y9ZJr4Kh7Nq9kosmb3NE9kqxolhXIbWoJSXi3uSe9j4L1
         MAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779436693; x=1780041493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxBZMjXWfEDezTxhg4NXRbYWC2H2xYO8KsQ+Odv+Xpo=;
        b=HfDDFWCw+vCvjbR1ZINAfVIrD/7FGX/vqT/qCiQJRr1lPT6cfCIzuB3dYmKrB2r/56
         m5QFhxd5aDgGxZi7pldSBItjB2kILr7uXbAS4gBBXop15KwK3penY0oFgwKL7pqwEwV9
         jVTAOkYpgxpqUukwppuPvTMNEYNxlO4cfsSdN2ppprzEWxsgM1N8DAOwjSwaereUQ4N+
         Q6zCPXycAedogE7PJi2/kP9aEVPaLnjVPEpg6ajIN7oNdHamcUUQtrGNqOYMn3sosJZD
         wgwAFzVpiMP0kwtU/AiCNVykQf/T71pDoDhvoS+dxeF174Ld8mfHvTmmpubafyEvPzCG
         iwZg==
X-Forwarded-Encrypted: i=1; AFNElJ+4Uz7eijPNwrgnYzS40wAQtA7OPfJvjcfFmmjaOG4FFAeY2owqnkaaxIGe7NbBBmubhwGuW+nH385tL8f3@vger.kernel.org
X-Gm-Message-State: AOJu0YyUpSRhO3fA+JVywXYGw4hvZTAJy0AqaDrBkFUugqG22DzrsdE0
	T8TGdxH9tNLDSbmnqPBlNFEoyOqcDH8njKN+q1sD84aSvZq9vTjpdOWg4gpXGxuz7+NkwQdUZUO
	2ttnogzQaPfvAdg1M7PF2sqTNdmRw1P7PRUcsc/le/CNIG43zDR556GIpu50VlApnXbw9
X-Gm-Gg: Acq92OHFXz5FVY3+LuThNwTlyCuPDF83v1lUJPHMy3Q3A+7mSgmkFEEFxONNdYVlGCs
	Uxe0x+C+pX1SjX8jfs17EH0Q9t2O7you1bWh68SyIeUT+IhO2Xa99LVSX+CuWQWB2M21TCk0Tif
	LHZkhhLUAqZrOtAbBaiQ9mt0kST8ZfVuoqonac4+xQbGmiQF8LapOoguYhDrKPDB9ADO93Tediv
	ebkUVLZIgrFyPXDRQlGKwdyRVv+cZYGOHxwLPIAtTV9xt3/0uHACWkeDUxmIjtbMzYTcxMqDfB2
	WK1T5M9fqGig05Pyu7WOHolX1HIFeIwY8U63ef1NujUmE6DTYLxLLpvTjlQWVA+jhcEHKFkcw2S
	T1rijEe/u4e6i+HzhRGd4W9TtH87xEfY8DtCslQ3rSn5dAL1sR/U0hOPA/UAWRmerNaaY48pOG3
	6hGCMfzevTf1tV1cMpJIeHDh0NUvqv
X-Received: by 2002:a17:903:2c04:b0:2b2:549f:7d2b with SMTP id d9443c01a7336-2beb0596f55mr27972655ad.11.1779436693303;
        Fri, 22 May 2026 00:58:13 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2b2:549f:7d2b with SMTP id d9443c01a7336-2beb0596f55mr27972335ad.11.1779436692784;
        Fri, 22 May 2026 00:58:12 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56958d3sm7780935ad.12.2026.05.22.00.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:58:12 -0700 (PDT)
Message-ID: <33ab5c3f-5a6d-4d81-b310-760ac519bfd1@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:58:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/39] drm/msm/dp: introduce max_streams for DP
 controller MST support
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
 <20260410-msm-dp-mst-v4-14-b20518dea8de@oss.qualcomm.com>
 <s32w4u44y4jhuk4c4qxsytat2pdiskzuvbozklhofpjh54r7pc@2i6vvbaen2ur>
 <0e39dd9f-9858-49cb-a052-7d0791b694af@oss.qualcomm.com>
 <p3jfi2cxevvdtqathqrpnxdkzrwuna3hojovfjvdni7zvjec24@pyvaubeq77qk>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <p3jfi2cxevvdtqathqrpnxdkzrwuna3hojovfjvdni7zvjec24@pyvaubeq77qk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3OCBTYWx0ZWRfX6VnW0ASEBtwK
 km7pSipZKsSQcpOO1tnh2yjRRLzdAXthb2f9K32LWxUpVUPNndxLFp2o1aBtJ1HpSqeLFeuUM4h
 6UyRTaYSkiTEYlmiVTjsjnX6btkxBg3pXGYQAyKxTFrxkx6uRa4QtFmW+vqJC0O+WQqTNT3K6KM
 aelU0V5Yp0YYygO3a6PzR+gc8wWxYTnnKhwCdYjkAtKljoj+ITWbsPAqZGqq9F/fpGsz7tUgR9U
 0GznnCPtPThy5bNMREmd2y07SBkgaaPyZ4sC+WBwuVfx5MQu9CdIkT+fY++Iuc/hWmEVPQawHJH
 bLGZQhC4Kgm/sgXAObXOERi6BXcnAXaMRva3Ma80r70D2dFxouQCAi33FpscM9KKZ5MoAgdohT9
 Ywgyn3qgC4ZNMlnUyXIPw+l/0SbUlVtPXLqfWCChjnfWcCEcVrmGu1IfF2rcbwcFK9S8Z8e7DSZ
 nAqFQlfF3EZnXUgtquA==
X-Proofpoint-GUID: TA-DYm0x1xRhd_N8fC6E2ba_BhmmVByh
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a100c95 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=tbUuAszfmx72r74QhgEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TA-DYm0x1xRhd_N8fC6E2ba_BhmmVByh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220078
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
	TAGGED_FROM(0.00)[bounces-109196-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 6C3775B0517
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/2026 8:07 PM, Dmitry Baryshkov wrote:
> On Thu, May 21, 2026 at 07:34:32PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/12/2026 1:59 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:33:49PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> @@ -2740,7 +2741,8 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>>>>    	if (rc)
>>>>    		return rc;
>>>> -	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
>>>> +	ctrl->num_pixel_clks = 0;
>>>> +	for (i = DP_STREAM_0; i < max_stream; i++) {
>>>
>>> Why? I think the code was fine with getting up to DP_STREAM_MAX clocks.
>> Sure.. will change max_stream -> DP_STREAM_MAX next version.
>>> In fact, I'd rather use that instead of the hardcoded value for
>>> determining how many streams can be there. Think of the old DTs which
>>> didn't have extra stream clocks. We still need to support those.
>>>
>> The current logic only assigns num streams to dp->max_stream when
>> desc->mst_streams == num_pixel_clks, otherwise set to 1 which mean sst.
>> I would like to introduce a switch in the driver to control the number of
>> streams, rather than having it fully determined by the DTs.
> 
> Why?
> 
1. In some scenarios, even if the hardware supports up to 4-stream MST, 
we may not want to enable all streams (e.g., LeMans: 2xDSI + 4xMST + 
2xMST, but it only has a 6-layer mixer).
2. Currently, the DTs for all platforms have already been merged, and 
for some legacy platforms, not sure if all platforms MST will work.

If my understanding is incorrect, please feel free to correct me. Thanks.
>> Do you think it would be acceptable to use:
>> dp->max_stream = min(num_pixel_clks, desc->mst_streams)?
> 
> We know that num_pixel_clks <= desc->mst_streams. Otherwise DT is wrong
> and should not have been comitted. So, the min(a,b) has a known return
> value of num_pixel_clks.
> 
>>
>>>>    		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
>>>>    		if (i == 0 && IS_ERR(ctrl->pixel_clk[i]))
> 


