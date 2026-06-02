Return-Path: <linux-arm-msm+bounces-110746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O0iBJiOHmpGlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:04:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E5A62A1A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46222301137E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F62A3BE15E;
	Tue,  2 Jun 2026 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eh9NF2Wk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvkpMA09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C0371888
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387409; cv=none; b=H63vJLzKIG7A29Fj6kyA6YJo7YQ1oRP0ebJNmG7S/oHHE5xy9/Ss+gUI00v8veKgOeS8RvG8xG+0gOsQA8q7Nh1vjUgeMQZpPOB7kxpc2t2caytxxlWKlLz9pldwqZ+CV8sR0H5UmEgxfVfZA4ACVwFlIctQ9CvW+AMp3MANwZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387409; c=relaxed/simple;
	bh=UxpA3yT/ePLu44AO/KpEc72wgGrVctYX7JSOD2YtQuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmoW6G3ZwPq6aup43cfByHDFHSRGnXYxJB7i2b9HfaBys5qoXva5+VeZ1cC2i4ZQgc6UWPvOT1c+ducvSXEZx05OvT4fCQl6u8zMgrsW5M3I4ZZj33yn8TCrxEKU8/d1Rl+J9e9gt+XrXgSbwlb99CS1rRuDLGiDDX04BBpDx2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eh9NF2Wk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvkpMA09; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527guki1638594
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 08:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2SH3tRYNqCdFVw1uC5sP1qyrvHciyAIFwzdinJEUYA=; b=Eh9NF2WknlSyINld
	eVIF021KSp0UjyVLCnlEdPWv6fGALXxwaR3hjkgdkRbeJvD3MPtPqP+Y3fE3mwIs
	MBHu/4ZHill9BS9qkj1QqcwB2xLSlRQRssp4tmZWfvoB14C+YCdBMpPyvE0RihrS
	cWC40osBtX3MstedUg8HWCDlm8UsPb76xp8oefRkVwqZYHcewbrUim7toUWR964c
	jaIc5xjh/6qsnD7KTTNAyanb9tR5sdjReNKQBbfIJvzc4LOeCMNkveIn+gfHKs1u
	dewKoojD3cLYODlZobHzNYebn2J7DjS3OMECavv/b/oNAN+fwL9LG5IbIzTlk4Lm
	vWI9LQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu1cg2vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:03:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf3636d6c0so33217435ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 01:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387406; x=1780992206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2SH3tRYNqCdFVw1uC5sP1qyrvHciyAIFwzdinJEUYA=;
        b=KvkpMA099bX+Wc9kUy1X0MKCjCGV/oFvxFh4+3tx5Kz522AucirYiv+UiulQAc+bmm
         mL8m1lNYzDk4XwXF+xvu3onGVYJ6jDKu7afpVafQ1DyFm5cx3KOHaPGgAoLmEfNUmXDq
         g4Qu7Vt4cmKxwMVqhRzmWk0EEDHjfKL+MgdzFVHO86+BQQvw0TChT7veyXspHjpXFN4P
         DJt8AqfnZUaSRSmQaIad3U+r8yMokq4bFM4E4BWrwGBma1d0Hyo+T7QV0ewHnvJIccDa
         eiF+44RWVjYrSM4RtNn+KaLgJjKZMJ1G/qMCEqaMYuEpt2VFanFUhi33AnXD57CyJ792
         qmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387406; x=1780992206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2SH3tRYNqCdFVw1uC5sP1qyrvHciyAIFwzdinJEUYA=;
        b=dNK1qqF9UTYpr74KnJM4kgYMTm4QfkKZcSiV7ui/+4f5wDxzgMcX0npeyRFasp6S+r
         KTWTttkiSoWt/74hSuun0HRFTImrQyf5Eejewiej31AUPsvowmeZqrebT+0un1hJOQ3N
         XrE+CceWBjw9aMhYN9MXOeykYb++h+0YQx8SM4wC9ydUsXMxmilXk7/mhLo6SANPxTJq
         JRBAlHeS1mBXcd072rKdFZHoOwF7rE0Ody4dp3h8zKTA36NZZ8tWZeKb4eCvRqiPcatU
         JpVXwWGkzs6NoTETNVoMe3eROO/CO+0lRv/8p7BSic+tqK8nD1RXsYtjo9Qd/FdQFHhr
         Fzvw==
X-Forwarded-Encrypted: i=1; AFNElJ+Tq9Y+IF4WUr8UBqK9pvaoiVrXPPS1ONnEruDaRlwD27+QdQ74fRAxxCMzCq7CN9GTzis5PohkPlN0bdiU@vger.kernel.org
X-Gm-Message-State: AOJu0YxoUWFbMkSRCwW+GOPY3zBzFDXo/RmJH4kSGlgSb4ZhZ96fz4gB
	26/CbvVZL3NnWZkapUMBXgP+1/EEeZECuCKnWQoE5alBtPqCR0Xmm4+dHMYZpWv6TPjDFDpFf2q
	VTDoQ5qhifUPhZiLHlEbVe9Mk5Lc6pEUEwEM+SpLDq9QYG4bMKwxikPHLuq4MyaBwjTVs
X-Gm-Gg: Acq92OE3MF8pV6XJwGshlZ7+VuQKSsxkflg0K/oRhFa+DlrVEfSjjucPxcvrkeiZ34j
	aGdA0IXBVTIIzoSgRoGAtdOaQIFLhbVSD18nKXZ+OCI/dSRcm7yuqU+y4mIwuitXWrwl1CAzefI
	v8MX+BYTY4nrfrH3Z2Z2sc6W2Uv70Z6N1QvjXaQIH0oulilEhTuUNwbcbSr1ExGIvm6saRrZDNg
	zG2ucTiNxai11iqQqws6SErTKfRSXFPw/64wzgSkM0Ae/o0qEElxPDbvFaaK1staCHZP/EOY8Mj
	UYWKr0Gt3a4gL3hbhJhnNu6BSPRxq7LiKlQwpVUAmJnyefPasZ2OSPv7xSWWWOD3c4ckNfNvZNS
	6BP/YKesCj1XELD+i4eO4vrttSzuiVmYaqlz/VwAuZY1P6QDIJr9JHfRW5Sp8DoM6hMoe3qivCA
	4DE8BdtEa+08QhCqp9H3+YtB0UqzA=
X-Received: by 2002:a17:90b:2f90:b0:368:cefe:ddd0 with SMTP id 98e67ed59e1d1-36c501dff2amr14144981a91.15.1780387405774;
        Tue, 02 Jun 2026 01:03:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2f90:b0:368:cefe:ddd0 with SMTP id 98e67ed59e1d1-36c501dff2amr14144931a91.15.1780387405184;
        Tue, 02 Jun 2026 01:03:25 -0700 (PDT)
Received: from [10.133.33.92] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd9183368sm1918918a91.3.2026.06.02.01.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 01:03:24 -0700 (PDT)
Message-ID: <88eb2a17-99f2-4553-b3f6-e4b5b1c19d18@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:03:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/15] drm/msm/dp: split msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
 <20260528-dp_mstclean-v5-4-a9221c1f1f3b@oss.qualcomm.com>
 <nop7uyplq643ps4naczmrqhukeiuvfxllutmaz2sbohrnxk6ko@pr7emfe5panj>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <nop7uyplq643ps4naczmrqhukeiuvfxllutmaz2sbohrnxk6ko@pr7emfe5panj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P3s37AwdpMnI6JuNF1SvspCmcJJ2Md1l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NCBTYWx0ZWRfX01CjlgT7//d7
 hfgyWAnf9dOTJouvLz+JsUwXeU7vmc0IvGzyWgt59Isd0uj2Ip1HLjPoIyuvgxA3h/md1xPIo8u
 2KvQOLJsNkJ8Z2swy8AyXW2xhIzD3AUHynVyRC/FPiOer+RRKQVUCCDpcIzfRqN0DQYqud2FGxX
 v3k0OWiFLVtuV+0PAM1dYc8Gq9eMPWSgvCR6IrncaEsl7kpxxh9dMUi6BO1QgEKDe3tt704u8wN
 BSY/JzWdYJM20uhZ2s62QAAMyygyOg3TKQESnZIB0pSpUcXhIATVv8o3b9eX8rJOGSqTwNJudcS
 NUNk2AC7Ypu4/p2HG1eshNCnFEnJFtG16n9GpBPPHIeW9Ju3Kh1IJOc5rYB4QaPYLTAPAx8057l
 xNXmjZh0FOzzBcA14zjXpDD5hu3j+lvcDHwYkp7EEtRh+uiu/dl7xlAU5lTaapQ3n7OfjdIyKe5
 SdSiMm0Aw9ZO/AwG/Cg==
X-Proofpoint-GUID: P3s37AwdpMnI6JuNF1SvspCmcJJ2Md1l
X-Authority-Analysis: v=2.4 cv=O6IJeh9W c=1 sm=1 tr=0 ts=6a1e8e4e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=C3L6VYGqFeyMi-qQiaUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110746-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A6E5A62A1A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/28/2026 11:22 PM, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 06:40:25PM +0800, Yongxing Mou wrote:
>> The DP_CONFIGURATION_CTRL register contains both link-level and
>> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
>> all of them together. Separate the configuration into link parts and
>> stream parts to support MST.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 47 +++++++++++++++++++++++++++-------------
>>   1 file changed, 32 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 86ef8c89ad44..cc00e8d2d6c7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -388,26 +388,45 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>>   }
>>   
>> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>> +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>> +					    struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	u32 config = 0, tbd;
>> +
>> +	/*
>> +	 * RMW: in SST, config_ctrl_link and config_ctrl_streams are called
>> +	 * sequentially on the same thread. In MST, caller holds mst_lock.
> 
> There is neither MST nor mst_lock. Also being called on the same thread
> means nothing, there can be another thread, executing the same code
> concurretly. Please point out that they are called only from the
> atomic_enable() callback, which is guarantted to be executed once at a
> time.
> 
Got it.. Will fix it next patch.
>> +	 */
>> +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> 


