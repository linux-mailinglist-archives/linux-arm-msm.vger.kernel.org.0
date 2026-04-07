Return-Path: <linux-arm-msm+bounces-102041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OSiI85t1GmatwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:37:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E738A3A922B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 04:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DBE83008794
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 02:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DAC2236F7;
	Tue,  7 Apr 2026 02:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jD+BQQVS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKcG34tC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75B01FE44A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 02:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529420; cv=none; b=d+5rIhctNUzq3OwGvl2xDTSsPD+xPzVguys2czC7/eldoMwlBz1bn/NVwK2WttlcbCP/7BbFFttaGwysjoF5M/zdk9d8Wmq+KLMKPdv52xRHiA1yTieuETefioxuF1mhnSdhYeTR92RxvAf3pySLbi56L0AmHV8jh/RQvirzNrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529420; c=relaxed/simple;
	bh=DGR6js0kmt7+9FkSmOJhyy2G4lgDVyq4gXa3+N5f53s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFpWVBnhKgn+dRZ63ElQToUfhL6O4uP/xzFb0KH1AQQXeBcIxcPYOdz8Vq5Uh8GnyDV4EqAxf9dh7KGt/t9NHIR3xta4p86zz2snagj3SOYjO7WAFfa0FyCWRGXsS7eCRKnVKGzVCuHC9bdP/cChrhQvct0aGkjd0SGjynhxRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jD+BQQVS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKcG34tC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQBUI1404166
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 02:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rP7QNfv6ha6cStrz92Y08u5fmQ49YKBVYPbtSOrnZ24=; b=jD+BQQVS01zRWx0D
	eBPsx140V6CnvnmituvAg97pVj1XVAmwswzXr7b8HsLE+jYs46s9LeKoiuYrInqN
	bnMznjcIlNmdBOiztIFMSrbmNRws8wHhTjfHGfsIG/UbnIqHa1trwJBoGq8NKL9l
	x0gkR7Xj4+wSZgHJjLPanf91MkDwVzH86hQhAB0CkFd4baxj6QQlDPiJwaNlxzJU
	q6nOfhPXRnpW18FlPfBdeslGdPjFEIWfbm1PgVtB8Hx2DNM6De6wbo0VucgHHIRj
	sEmFEH2uYYk95qH1aME+9RQzQVl1e6lqb1Z59aYrNOUgUa/n+BVO9mobhSICIjuc
	UF/kyg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr88njw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:36:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d90c7ec5aso11544482a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 19:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775529417; x=1776134217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rP7QNfv6ha6cStrz92Y08u5fmQ49YKBVYPbtSOrnZ24=;
        b=UKcG34tCp+2/YjCZwnfO7M6qsoiOZzX6T//X7m3thWkhh9kMajSp+M4KR0KMY82nB7
         4HrrY4itfcpUOdhPt6IO0GDuBPO2r63sPn2JJw7S+qOrQROjSQODKsni7vNjWln5Wn/Y
         AzaeOc51g7P8MP5ynpZMqBEqYDp0v96VnSC3bfadChANRsUCG547f928u3+7dfUK0tzL
         qgsGzCJwbAHoxySTMczScKb6F/hC0n1Iz4lsnYZkheguQxozoa+JmjdmDCStWDFZk08D
         Ey3j5cWihicf516xb5Yu03yIKy0OdC2eqANt97JV6xJSyK3uA2SnyYYeUQ29BazFp/CR
         cavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529417; x=1776134217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP7QNfv6ha6cStrz92Y08u5fmQ49YKBVYPbtSOrnZ24=;
        b=AH79VLk3O7LD2b65lPhTW2xdMi21HZmj6yAqUSnszo4Y96y7NOl1XzarRRVgVpg6AL
         QQlyeAxYgJE8oCy2+CaFkW16fkcuWDvqpW6IRbyCfaYZFq6vedJOly8pXYx4ZjcvLMIR
         UxsskqjK+0ntvVG5CS+OBiwcXg/q8b8LpAIckMNMlHnAIJiDGAh59z7eb2VXcQJLUQg3
         gZ77EsssE5uFglGFtbaFt+4aa+ANeUT83b7QXu47Ca+8mIp5n3spQ3XI9qceWD5pqPiE
         7JD1hywTpcYdV3gXMA29Rs2qZqoRhiHQQ/Qru2H7Pb2hXvHgZDVhhaLqEZIivZoh36T5
         OF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeKc0tsfBh+P3dzliugQbW40JrFwES0MWjbto4LVz8mGQgRo6Xz4k/M+JsJFow/qnsDYEV6qbPywaq9F2L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy807/k924xutlWT1ZSgyGGnJG5Hnhk2OMgGh4x0ux8tf+Dxp0G
	39gqzPhZckDjD1ggqMrJ+DPQi3PXLSDZCf4KNHSAI8leQAzASIR3Sr+qwz59WDNIg3MHZv3L+vE
	QuWa5nQlPL3l/S984dv8zibx4RcLWLSzKYLUN1vEFDK43XTt5fcn60RcPEjMr24Q2d3Ym
X-Gm-Gg: AeBDievU8KZg7MU2TQsERA8twp5tdm4WrBdV+Ox7zeRBIx9fZlokvRi/7uqIHbSG03y
	mBLqMZM93EWGFrJci6slU+ktm5UBHb+s4rnXDfZcqug3ggBCllRkOnAp6W1VumNoMXCgZD7EeCx
	/TIByzAMT2dJgOWkqlHi0MaxVCfa5WckquSX31JCLOIubgesr54X4TEA5XbOR0Uyf2KkHhOPXAh
	NJl1kCDF/O5yVT2j7GFEqI5L/AYYt92Lxy/A/cLesNevU0vCGNaDe+oMJ7UdXMlyp+aPAZHNwUg
	umCDcnSOiTSgqwGYyfx1RT7IiCvQTD650u0T059TbDi/b4sUcq5aVHsu5YPcPJuuFfwt/izmCYx
	PLCKVRA8fWmCyczC3DAITvu7cVhAyL4dsqqTCA/dRxTNLaEL/DagmOY66OyhoGFSHXKe7pYNEzt
	c+9N70M5MfnT2sxHiKow==
X-Received: by 2002:a17:90b:3851:b0:35d:9d4f:f58a with SMTP id 98e67ed59e1d1-35de67df975mr14429984a91.9.1775529416694;
        Mon, 06 Apr 2026 19:36:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3851:b0:35d:9d4f:f58a with SMTP id 98e67ed59e1d1-35de67df975mr14429947a91.9.1775529416223;
        Mon, 06 Apr 2026 19:36:56 -0700 (PDT)
Received: from [10.133.33.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de51710eesm4244919a91.1.2026.04.06.19.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:36:55 -0700 (PDT)
Message-ID: <360d6087-2907-4db2-9273-c3ecc39ffb12@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:36:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 33/38] drm/msm: add support for MST non-blocking
 commits
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
 <20250825-msm-dp-mst-v3-33-01faacfcdedd@oss.qualcomm.com>
 <56tbubd46myozsycduvb5ds26smzosydr5fmbvmlv6yoiqt5wr@3ib5gnspxxqa>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <56tbubd46myozsycduvb5ds26smzosydr5fmbvmlv6yoiqt5wr@3ib5gnspxxqa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TUsQTj60sVWFdVwLsCtBOPgZ4PitI7W2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDAyMyBTYWx0ZWRfX44eWMt0V+m+7
 SctKvKCX0Xffvq8wF1+9diavWYE2eJwXcw4gPo7WQzMnowV+S46j49o8Wr8R0Jfsi9/YKehPmkC
 FVQ4NG8LLhunqhZQ0V7udTAkyy+4KrP8CfVXKhK9VLPW4kamwhMIna/XrJqQRk6Hys8W9BGuytS
 GB3EHXebqJAE/CXMSXGR2KBNtf5YiWCyHh2cTHB4GuoDEexOUxJLQJvKQdslHrstGPo3Qwlw4nO
 MEnuiRlADMPe4yw1VlL47xpZYsvKmot69OruxaD8n5tDZ6wDetaeJCc7uJbB6qMYa2CuJZhhl+x
 syOwJYQJ1xDd8HTncQS0QByeL+R0ViiuK63elA9HmXSc2WxpXmnfB/QeOP0yjxKuQ9Rqt14aFuw
 y+dNM2sqJt7a2BOKbyz2/GoDp2Byg//wF+jPE0VPFYg1YcDeVlZCKYRHSr8o5vZAeWSDw8cp6u+
 FBgkaX/EBQi3J4AKiDw==
X-Proofpoint-GUID: TUsQTj60sVWFdVwLsCtBOPgZ4PitI7W2
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d46dc9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=v9bGeqcMFpeTl9iv2AIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070023
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
	TAGGED_FROM(0.00)[bounces-102041-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: E738A3A922B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/27/2025 2:47 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:19PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Integrate MST framework APIs with atomic_commit_setup() and
>> atomic_commit_tail() to support non-blocking atomic commits
>> for DisplayPort MST.
>>
>> This patch only applies to MST. For SST, non-blocking commits are
>> already handled via commit_tail(), which internally calls
>> drm_atomic_helper_wait_for_dependencies() in the DRM core.
> 
> I think this should be squashed into the the commit adding MST
> atomic_check call.
> 
> Otherwise:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
Will merge 2 patches.. Thanks.
> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>>   drivers/gpu/drm/msm/msm_kms.c    | 2 ++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
>> index 3aa0020dec3a90b693ad3d4171cfcffc091aad4c..b1656fb456d54af11ba8a30d4971fface114c7a1 100644
>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>> @@ -4,6 +4,7 @@
>>    * Author: Rob Clark <robdclark@gmail.com>
>>    */
>>   
>> +#include <drm/display/drm_dp_mst_helper.h>
>>   #include <drm/drm_atomic_uapi.h>
>>   #include <drm/drm_vblank.h>
>>   #include <drm/display/drm_dp_mst_helper.h>
>> @@ -226,6 +227,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>>   
>>   	trace_msm_atomic_commit_tail_start(async, crtc_mask);
>>   
>> +	drm_dp_mst_atomic_wait_for_dependencies(state);
>> +
>>   	kms->funcs->enable_commit(kms);
>>   
>>   	/*
>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>> index 6889f1c1e72121dcc735fa460ea04cdab11c6705..09776be1d3d854f4c77d7df3afa8d56f53639411 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.c
>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/sched/mm.h>
>>   #include <uapi/linux/sched/types.h>
>>   
>> +#include <drm/display/drm_dp_mst_helper.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_mode_config.h>
>>   #include <drm/drm_vblank.h>
>> @@ -29,6 +30,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
>>   
>>   static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
>>   	.atomic_commit_tail = msm_atomic_commit_tail,
>> +	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
>>   };
>>   
>>   static irqreturn_t msm_irq(int irq, void *arg)
>>
>> -- 
>> 2.34.1
>>
> 


