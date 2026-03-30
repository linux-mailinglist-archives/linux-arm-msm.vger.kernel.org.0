Return-Path: <linux-arm-msm+bounces-100907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPamEuHjymloBAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:58:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0CE36133D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B794303FDE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84419396571;
	Mon, 30 Mar 2026 20:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hi8SXscp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKPTu4CY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559D7382F25
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904030; cv=none; b=WlthyxBO8iXHoBc02v50NtBT/W3NBXBcsQTGOIipFm5o6eYTyOtqNzErn5qlaC/34uqsl8uKEAimp5cjj5iqEu6djGWJlsMASvU/3aDlUtcERw6Ng1DQBwW8VoSLihItoRyhfTdE2F5nshku+l7+6e2d9J18Ds5dZBpV3a9yK4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904030; c=relaxed/simple;
	bh=r2bDbbwinBhT0kImelkuosKYz2ehp+3o7+Sa+58qmuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OE8wpfweN4e+PtHhms1P8V+wuaUMolHJ5Td0eO7mI0R2nzw1ddjPvlK/hEnhS8hAab4QZW31mzSazTB3O/cjJVkJviaz7dj5CGnFlAr6FL0pAXh+dbPXsQLhoJRF+FTz47Pq+XesNjF+is/ee7ipqdoRl9IGqtJWIb08YfrI9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hi8SXscp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKPTu4CY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UF02Zw2391920
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4NMG2Us6RdtOdQH6URthKWnEZugYWrLpT5hHK0H9okE=; b=hi8SXscplMRd7i0j
	opOa0miUqPFOpcsU01HRL+wCujH+UmEMpqkXrclnduJJj6GxupX2D/zwibURTHu9
	TDNrgQ8YpdpmU0JH0bAMbn7W2TBwg1wlyc3+ygjHaEIw4TDqtLsnusut32caIxTf
	5bO+hmhu/9e60sgR/T1kcaNv8POnxUMnmVnltjbtZgz/4BPvMHD07R40tjQumFzo
	IRZfIK2HatfFSgFrFW+2K7GVgz7PkS+ICaT74zl6kZMxkOhipc3tV9ywsz97+wv/
	qKBpr1s/6+jfwmjj4KEWxLM5hx9mRCeQ+eUmL0Dbz7WsDPKhMRn9T7sNnddplSd2
	mIcuZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7hb4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:53:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23af7d7e8so102872385ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774904028; x=1775508828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NMG2Us6RdtOdQH6URthKWnEZugYWrLpT5hHK0H9okE=;
        b=dKPTu4CY4ntyilNaAza5QTpb+JnA2ez60tFfgUNdwc55bipxJtGos6I8IQefSudBNl
         VGLSVorpCm8rHDRO3KgUKP2hAHG0H4LqJ+nDzbY9MS5aOO6GmVLz7w7zs7nYzDA8zH0s
         zR27L/yzV25gbIeG7Y7buQph9tBsSi3cDZLztGZmRS+BTkpYkd4WphgvEp0kZT01SKBR
         L1JVSVFohGNxKgKI1G2R95meAOGj5J6HnpBfIsICB2UnzQOu3ltLLGZyYT9czK/SjmGO
         9Zz71ATaiDiwuzFQl/KJdAryTH2YRILUp2P6oPJwt1O7anLOTc+euxMnB3KA/3NP+uTX
         p7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904028; x=1775508828;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4NMG2Us6RdtOdQH6URthKWnEZugYWrLpT5hHK0H9okE=;
        b=ZuVJ6JFl8LKu7SQVp0IPMJKVoqUOztLsmha+ygHb3rTbrKUl1lXwgTY1+4GOlc+NA4
         2YrI8C1zBzzA9HwuQBPzroMcRF4l76WNrkUCpvs/7LuvDy5FyXv507ceoJi3Up3qUF7M
         gAJEkj4Dk1wXBQ91unObWp/fxc+XjjkAm1XzFKmlFh3sjVQ7IAeREyapXdQlUifw+EjT
         r8TZhXzkCvdTAf6W1KHQaKP6Uu0t/KYMqZgbb0s+kdFxRcrORYRGlYmKN7C3US+od2+w
         A1GyMVI6AxGoTV8XVtvnfdOfYtRmjnIbei3IhkTkOtw/3ramFHQsr4ng+1oSZrsKYxqD
         Zqng==
X-Gm-Message-State: AOJu0YydZTbInXs9icDAO1Cp+ffZ4I2RROslNpukg/XG3nQBGascHlzj
	GkuBnSr0K30kYdZ+hRfQe4CH2vb6M0IxUn+Ms6r2UP8vFgRnDnGzPTq+h7dKVVRTrjvTZNmqEl0
	TDipP/07IbIvxKJKMYe0CEoU0TBboVaEa2M+s4HWsQCwcPXUV5jhbuGt6a0+2KaX5o/LH
X-Gm-Gg: ATEYQzyOSVHA8l4St3KrgNqH0tXJzCeoa1keZ6KbDOUWGeeDm17IdAxP6OaiEIW1kPN
	6a2gBJSxZzNVS3tDKmD3uX496V9DjRZinp7ywyFLVaPuU0bYggNj3+zZp7N61L2aVpL4i77s8cB
	qOMo7KL/jvh/jIe6WRr+Q6j2838Fwmue/VJ6ZusjHYVlzruePipG25Lfa3b3/UbMxzydpBT07jh
	rU48np92YMCreYei1vUgigY2tSEHCeTWt4ECDjEpbYRZUjztvZbDmnjly49iKZpUNYVXCYqXuZp
	27HQk2HYT0L/xBPK0RbcsfFPowbMEHHhEQkk3qxsY75NMtfkuLv5YnWJeFqiyPngpAej1qyK5Bd
	rzMIGCHtd5fvBlxTbcdiWcyMgrv1Ws1gQgnLRD7Mj1L4G
X-Received: by 2002:a17:903:228e:b0:2b0:62dd:3a80 with SMTP id d9443c01a7336-2b0cdc28171mr154611815ad.17.1774904027903;
        Mon, 30 Mar 2026 13:53:47 -0700 (PDT)
X-Received: by 2002:a17:903:228e:b0:2b0:62dd:3a80 with SMTP id d9443c01a7336-2b0cdc28171mr154611455ad.17.1774904027321;
        Mon, 30 Mar 2026 13:53:47 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aa9fsm87281055ad.20.2026.03.30.13.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:53:46 -0700 (PDT)
Message-ID: <fb325d6e-09c6-4cb5-b04b-ff49aa5f34d5@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:23:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] drm/msm/adreno: Coredump on GPU/GMU init
 failures
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
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-8-2b53c38d2101@oss.qualcomm.com>
 <8114a15d-510d-498d-af79-a75493a8fc71@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8114a15d-510d-498d-af79-a75493a8fc71@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NiBTYWx0ZWRfX2CBsJFbOIVrz
 0RhZ9SJTyTF07EQQmRY1rEgVK9aWwCIBvZLQlHsUJPm1+qo7YldjVMd8hGVAOVf03mxAW1jUjDu
 g6xWbj452qcFQrHRQ0YYR/VcxFplWicGVqi2yc3+O9pKcnonRb0bjUB8BmmVwNOKR45Yn63gxnY
 r38H/3UC3oAihCQiI6M0ErutqgR1eTkzP6F7gprRUSb04yvPLgBtHFe1ReuvymEkqQDSagqe/wK
 QO237f0e8+Yy1NRIdVvDEDqeGh5pw5bQq/NVcNBY5NpkP1J3ix+YH9OeIEmH9K13xNwuibmYZbC
 o/a4q1FgBuGP3A7rLxSWyP/IhmkvPVqxo9iD4lMQkXxrJE+uNkGf1sMLEp31dIKktsDfyJpWHQd
 JEti2csbmm1URp6E6k3Y6D8lQzo3rAjGJw9qxqvojRNk+D9pM7WSvWISvI2KEYxlhLafFnoPskV
 a/izPyhSkh894lvXXSw==
X-Proofpoint-GUID: umOxJZ-iNIdFq4MJGG6qTx2Nx7xYYjHm
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cae2dc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=O8mXyku17EuJp1xFqKwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: umOxJZ-iNIdFq4MJGG6qTx2Nx7xYYjHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300176
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100907-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A0CE36133D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/2026 5:05 PM, Konrad Dybcio wrote:
> On 3/27/26 1:13 AM, Akhil P Oommen wrote:
>> Capture coredump on GPU or GMU errors during initialization to help in
>> debugging the issues. To be consistent with the locks while calling
>> msm_gpu_crashstate_capture(), call pm_runtime_get(gpu) always with
>> msm_gpu->lock.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -391,10 +391,13 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>>  		return 0;
>>  	case MSM_PARAM_TIMESTAMP:
>>  		if (adreno_gpu->funcs->get_timestamp) {
>> +			mutex_lock(&gpu->lock);
>>  			pm_runtime_get_sync(&gpu->pdev->dev);
>> +
>>  			*value = adreno_gpu->funcs->get_timestamp(gpu);
>> -			pm_runtime_put_autosuspend(&gpu->pdev->dev);
>>  
>> +			pm_runtime_put_autosuspend(&gpu->pdev->dev);
>> +			mutex_unlock(&gpu->lock);
> 
> This is something to take care of in a separate patch, but get_sync may
> fail and then the read could crash the device (GMU may be off too)
> 
> put_autosuspend could theroetically fail too, but perhaps -edontcarethatmuch

Right. That is something we should fix everywhere separately.

-Akhil.

> 
> Konrad


