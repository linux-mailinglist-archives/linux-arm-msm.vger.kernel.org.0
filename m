Return-Path: <linux-arm-msm+bounces-100123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLcvLppMxWkU8wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:11:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F4C3374FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C05863031F3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143E13FD15F;
	Thu, 26 Mar 2026 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2M2N7wo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsHi4wef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28A37E2F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537061; cv=none; b=WTX7fn6wFIFiHy0oBCmaHM0Un4brhIOnSOLvxLGS6BETK3HfqzBC3boo2uauU6BZoCck+fpAjU5LCwj3rTTf+xy27RfhhJd0k4cFICM8WYORMoMGvaVdtCEyvEXZHTRdBqsRMCcwH/7ccHrBMRQhBCTGo6ZWQNcnahVuuVwaMqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537061; c=relaxed/simple;
	bh=tFy5giR59BGANCfViN3Anp2TO9bRdYEJwtPDSEpAscA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIVUrqkocJHmtstwIcK0wDiBtRLH0cf+iTsuRKt0aHhLSXRj7mKWu8nUPp8rd/aW73OMcCvRwz5PQxQMim0Ns0KU4CPH9/qIgDmLE2LicyKlJ+bilb3LzoRmzCFanBW8cJ4Ld94ZBhwNOjpBh2npqQ1ez7vSJPZlIBW9wHiPj3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2M2N7wo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsHi4wef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QC5kUG1175792
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 14:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jt4jdDfkQbJQhWE0oZ8OqglR8mliegdo/pvYwgB5H7Q=; b=J2M2N7woSXjLjInS
	oTAvOMnkcaDaeXyYN+4DXMQGDHsL9R90bQM5LoSfJ1Z+8QDjNdFdFv3PuVYunXEl
	D9x5yj1/+E4EMivNeiy6eFXvDmLs29cRgricN9Hxr5rGe4qMVQ10eJg0le6BdqwI
	FkNEw3QfHeTWq5+zU8WHL52+7/VwvKHmfoKHt46uFsr6csK6AhBFn8iKU076MJtf
	gjf0rRqx6kdLgWdiuFnJg55hZdYmbWpAi+1q9P2+h4zepvIHqrPZL+/US2+qqPuy
	i6R62RbYeoD1zZQ4v6f3bQEjPpycyEDSyPlxWDr4tgioaoSE1194zJhIELSt6QQH
	juh/CA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76u8y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 14:57:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c10c2d890so1618174a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 07:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774537058; x=1775141858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jt4jdDfkQbJQhWE0oZ8OqglR8mliegdo/pvYwgB5H7Q=;
        b=IsHi4wefSJq/AN1yEmbJMJid06aRBsJlPDHjK8tnz+zjLuxHaqbnenjxmtHbdaOkbf
         XP68G3Gk1fCiycv6iaX0PVKYbcrQfXmhJqh7evqE6MxxFKcuIEwS2o15IyeCF5R+aQcf
         UpVpSPlucQhjDoI6gYNQNeviqGG3ApZjs7yjnGballBTZ/+hhLZHFD0Op8vdmdXTDOvq
         1pgB0rhQHy55jRA9FC49xDBLeT02xZYP8Lc1wibEUbWTVn0EiJ0U+puMlFJVrEcUNPZ6
         qloJ7eIO/2gnT9X8nLc93lg3PRdQvFUfacvkf9TaChi2on6hJGiDsCdkwLmNqYf7FDU3
         ZkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537058; x=1775141858;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jt4jdDfkQbJQhWE0oZ8OqglR8mliegdo/pvYwgB5H7Q=;
        b=sPnHhr/mPNxJpfR8tCg5giCtOTnd2zJ9cfUwKhYEQ2B0+2sLA14SB9rhxJYyPGoI4Y
         4fVbyQUKGqGRoIp36Kifh6bZfhppwrmHBUh8gAfygI1W5/e/P9OsON1NjpMdhHsGYz7R
         nngw/NjkHHczPQaq2eFRyZFUO/4075fMVUBLpodrG4DebzQOqegWXoohDVrctzmfLGAj
         7gDi3BzhPd2pvf2j6RB0MAAk9lL5Yt7BTV7jjziWK3oCssoeLF16xbcytiy3XxGS20Tb
         c2ZUoBs1R4m5maqzQSSKYWeKy/EIz0GeASqZ4h2qZ4s/MHtSBWo7Og9Ed4o5JYDW8JgD
         N52A==
X-Gm-Message-State: AOJu0YxhImIHCpQ1xOJIxtvFKGB+CumzNP2QRO3nVvZQqivkN/3s1fkk
	e4yVdPFWQumKqrJLbmkOGPc1zzGR3aKHjyYcg17KIl2ZzABTWZsKnU2TKozyQJi7tcp1ZOI6qiD
	uRsZub3x3ptuVW/h5baSrX7Arf56mtHe0M/O65zMMIqnemmeTUGAt3XYtQpe4EYzHmoCu
X-Gm-Gg: ATEYQzxglF0qU4gK3pCTsi6G5R2Cx7TC1WPF5ZpQtyyfLjoqTJ4cyWWJULCjNr0ehZg
	d+90tQLwPO5F4k9cjRqXPNHZ4FiWoB67EH4SoFktdrnAADlMlnEBN+iyWQK+zt92EuUVRuJPcmX
	X+Xya3uLwETyJt7sXRUr/J/wHNrGN8CzGbGPUgCs03IGs4uJ/6lLNCoPXJE9l1cQbVIMUgsj7yh
	+RsDAegWyiMcft24QZc4C2jmvIFjuk6wAr0QqsLpmNpbEAHBiBLklWdN3j/bVDm8fCD5lh3xsFS
	jCDQos4VEDqIXmoaD/1ONp/Gkniblrq2TJbS108KclB3eaJHsQ32+IWwj8VsBXFQpXtpE20tdG7
	AxBHBXom/BBQnu6Xv/FAbQqWwY0h+RTUssUU6eGyBeQA4
X-Received: by 2002:a17:90a:d408:b0:35b:a8cf:7969 with SMTP id 98e67ed59e1d1-35c0dd0d076mr6948799a91.11.1774537058223;
        Thu, 26 Mar 2026 07:57:38 -0700 (PDT)
X-Received: by 2002:a17:90a:d408:b0:35b:a8cf:7969 with SMTP id 98e67ed59e1d1-35c0dd0d076mr6948750a91.11.1774537057676;
        Thu, 26 Mar 2026 07:57:37 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22cebf63sm1853913a91.15.2026.03.26.07.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:57:37 -0700 (PDT)
Message-ID: <66b8deb8-6138-406e-a503-27cbe5dce2cc@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 20:27:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] drm/msm/a6xx: Switch to preemption safe AO counter
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-2-fc95b8d9c017@oss.qualcomm.com>
 <deb68834-f384-46d8-81a3-9eff88deaef7@oss.qualcomm.com>
 <cb4543e8-dcdd-434b-85ea-561f341452de@oss.qualcomm.com>
 <4bd0e8fb-a41b-4d56-88d0-c241d6ab431a@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4bd0e8fb-a41b-4d56-88d0-c241d6ab431a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c54962 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tHuJs617m-YSc7YiAWEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: NSeVUkky4k9hP0SMBrjC6BmaeofklI1O
X-Proofpoint-GUID: NSeVUkky4k9hP0SMBrjC6BmaeofklI1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEwNSBTYWx0ZWRfX3s05onR4OtS5
 hZk3QvKvmlYM+RWM8HSBWafij76OZ2kk3TFMWyMjh72F3qpdjVsSw/+XF/WtthWgSvaTEIjQJHw
 7+ecwFwHprW7DBn3wr3QQ4lnIuStqLvMQwKKmXAS+f1vBBnVoukNqeNuk6F7Wqg85SMlJGMiJF1
 nSss5scoNba7OT/Ly+mlFOgmXCyScoYmwl3G+f4l6ynWRlENkpkTSbNVF5I7lvT3vxLYvf4GBmj
 3EptIFcA3sqOYTk+WveHYPdvi611JKvXl1grd1Wy4REDjy+ZxoVr0DgeopinNwHkBy1OH3Vaxfg
 XbC10FFHauSGB3TO+Hh4FuBxBJX7PzB6zqgChOqCvoXBWup60Md/mM7Yp5JB40/+U76+FG8NNNl
 On/GxE61dzMsIx1zSAloj1mLTpv+TrF0u0+XUa64ri4cHe9O2KLf7udnREqJWih9dK/WGQNj2IV
 jbFdPd0fKBOgeLbG4cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100123-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53F4C3374FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/2026 2:34 PM, Konrad Dybcio wrote:
> On 3/25/26 10:46 PM, Akhil P Oommen wrote:
>> On 3/24/2026 3:21 PM, Konrad Dybcio wrote:
>>> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>>>> CP_ALWAYS_ON_COUNTER is not save-restored during preemption, so it won't
>>>> provide accurate data about the 'submit' when preemption is enabled.
>>>> Switch to CP_ALWAYS_ON_CONTEXT which is preemption safe.
>>>>
>>>> Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 14d5b5e266f7..93bf2c40bfb9 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -345,7 +345,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>  	 * GPU registers so we need to add 0x1a800 to the register value on A630
>>>>  	 * to get the right value from PM4.
>>>>  	 */
>>>> -	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>>>> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>>>>  		rbmemptr_stats(ring, index, alwayson_start));
>>>>  
>>>>  	/* Invalidate CCU depth and color */
>>>> @@ -386,7 +386,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>  
>>>>  	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
>>>>  		rbmemptr_stats(ring, index, cpcycles_end));
>>>> -	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>>>> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>>>>  		rbmemptr_stats(ring, index, alwayson_end));
>>>>  
>>>>  	/* Write the fence to the scratch register */
>>>> @@ -478,10 +478,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>>  
>>>>  	if (adreno_is_a8xx(adreno_gpu)) {
>>>>  		rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
>>>> -		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
>>>> +		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_CONTEXT;
>>>
>>> I'm a little worried about mixing the names here - KGSL uses both of
>>> these registers (A6XX_KERNEL_PROFILE vs A6XX_KERNEL_PROFILE_CONTEXT)
>>> to track different fields of the struct adreno_drawobj_profile_entry
>>
>> But this naming aligns with the HW reg spec. So I prefer to use the same.
> 
> To make it clear, my confusion comes from:
> 
> cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_CONTEXT
>              ^^^^^^^    vs                   ^^^^^^^
> 
> i.e. I'm not saying this is wrong, but rather that the local variable
> could be renamed as well, to match
> 

Aah! okay. Ack. :)

-Akhil.

> Konrad


