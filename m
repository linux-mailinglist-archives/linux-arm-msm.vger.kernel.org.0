Return-Path: <linux-arm-msm+bounces-100908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JE1D/bjymloBAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:58:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36873361353
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BEF7300C390
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E163B396571;
	Mon, 30 Mar 2026 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aysNMnhq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/bZRPSO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75BD1C2AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904303; cv=none; b=VV1pmJeovHGPNOsSm7GD4cTcJKvSebvweVLbDyGFS90iYorWbhECXjeORrrvIDjvOfI5SwfO3LVO1U2XfN8ueEgTr/UjMlQ/bSnAS0jWnh0cdGzt68yvwr24pIXR1cBXouIRZfytDJTgDltcmTjuMyC1OoybBysYV285agSgaY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904303; c=relaxed/simple;
	bh=imydbM5uqsi9oCjEymIDvm0CULIhh3IM2HfueGyTX00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eKIBvYHWub+W9Ys4HPN7NtjRZwGkQ6w/UZr0pdAQ0LOowo1eI2N3XgtNLZaL6wR+2uznZv/W+NOy0cXkhsqChip4A9Tl8APUQcLv+P4JtGHj4TYzuDY8/1j9RQtNewqnPsTWRi35TjK/5fa/m/FwQPOK6xHPvWoxIKzr1AqJTXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aysNMnhq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/bZRPSO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFtoo93173909
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chPx8cXnciym/K6h9a7scU1acS2Wxk7ww2bj8KuF2bg=; b=aysNMnhqeWZvoOBg
	iwxl73FVEJML7ywueCuW9ztNAGF6flWtv1goO9l6nSBvBE0VqOPm6skT3Oxizpp3
	EDPZ1f+gSaSVMPtP3jTX/npZbBBw0AgFk7/aUBiT2fOsOLA9+Ir5bqSKkC/HyI4/
	kXYM6dhQ0wAyOPvuuPPMidPiqtOyI2VGYV3u9gAxyohmk9C7xhuLYXzd3zu3mZHo
	D5C8J/Ld2QNbLNrBo9IomQk3XQ/xBc0kQVhKfDFWF6lIOHX/z7pGwmIdnjX/KMSm
	R7KkVQWsbhAp97MU1iHSWhztfvUTIIF0s+d/XjIdGwQApwdEItevRI/aFaedqR5O
	WFKYQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h2dy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:58:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23af7d7e8so102961505ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774904301; x=1775509101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chPx8cXnciym/K6h9a7scU1acS2Wxk7ww2bj8KuF2bg=;
        b=M/bZRPSO5Za8e7kpNKLVIm/9E9CQlCxUMf8f84njw2KqMBMrRocP62rnnrpQ85MkyS
         WQDxXcYAjgrddvohe6VmxDY2yhhSbTfZSgzJbX06Nv95kGlkAgumUh/xk/Q6l+iM5UZb
         Ya6BCs0KePNgY3Zy79de3s2rMYmpCnw46ZFq0IPc2zzjUhcUi8VtK/xtbFSrDVhnBrFl
         1vwnZ7msgKUQAIfVlf1iHcCPJ+GE/jABaH68rGrW4beqMou3epV/TJs2pNqCn9Gq5H3y
         c9lc/ERYFjRtNacE3BiAMyKAT3djJcSv3gkqj/0iCWDcuP7jgg8JBP55I+rutPmsRunp
         pRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904301; x=1775509101;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chPx8cXnciym/K6h9a7scU1acS2Wxk7ww2bj8KuF2bg=;
        b=UUEeuEWuPmDTUwShJ4UhvonzotX3VicWT3yo9OGpwsdCA4GixE+da/mQR0EQMREuJD
         KAX2sznEr+NqMiDzM6VOwCm5mncTW2Q6ZCVCt8QVdjrritv3izQ1FXRp37TwQrADh+FH
         2EU/wBP5nkOXSLYSS0VH1cfaZsl/N/VYCBgoVdwFdWpXP/3WpxmdbuFc0CCv5gNrCaCO
         g4CoMrL+vThyO0XUxMn645Aoul1CcftaGbOW2kc1q9oS2Msmzd0ksLIw04lZKFciavip
         BMDO4cjFuoAx4Tkef6kUYr0zT6nlSPYaDG03L3tK8beznNNbi0ksT7mpVbmnauw3yc7i
         Jyew==
X-Gm-Message-State: AOJu0YzDsGfFW0Ur/SQXbVttekULt1L+TSXzazZUFNWSF3Nqn/KxMfbX
	rC7Hk9mUdCtwpBfAqbyZ+czRg6vYeaEhkBHrhU/jrdFaE1pAugLk6EYytJ3CttPqypp2eEer3ZO
	wwXp+XJlJLu2BNO2KtGtzEXoNYb5fIgAM/J7m7LxQ8dfa98/+p+/8Zo1N1lHDoLoUDZB4
X-Gm-Gg: ATEYQzx/X1O3b+XS4TO4CE3+81Z4V/XH2h7gyCJsrrAI6FM0reMnwxlTypUrZsl1icR
	YIaG+3mZv7C6ZDzOe8IKqcPuztwhsXvD3PkzoLSSh0G/3j7B08htVIqqU0evt7RLTIOWLQbHXVv
	AB/4qurIVGUlsmLlEIsleR1UqclSQPGwy0bzLKKmqH5m/yLjGAU+20VQAuHhCsZ93z6iwdMQeW2
	ePg5lyemh4oFVvucUOpuxz04NK+hEDwMlD5ncBqRroHTDOnrjaqWtItFmWMUQHZTPy18WWGC9o9
	obHWEpOFR+E5kcIzZtX3o4+x4lCYVmHL5qNDHLDJTuT5o6IcXivlBrvDRX/DEnwj5PzUUXk2npl
	oj24nEUBD2bJ5uG/9p02zvjDtcDXG1DovUprl3DvJi164
X-Received: by 2002:a17:903:230b:b0:2b2:5091:1c0a with SMTP id d9443c01a7336-2b2509122d8mr60116795ad.41.1774904300668;
        Mon, 30 Mar 2026 13:58:20 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2b2:5091:1c0a with SMTP id d9443c01a7336-2b2509122d8mr60116645ad.41.1774904300188;
        Mon, 30 Mar 2026 13:58:20 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242765b93sm97317885ad.51.2026.03.30.13.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:58:19 -0700 (PDT)
Message-ID: <d1122bb6-da47-4089-96d8-9a3e7673fa0e@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:28:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] drm/msm/a8xx: Fix the ticks used in submit
 traces
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
 <20260327-a8xx-gpu-batch2-v2-2-2b53c38d2101@oss.qualcomm.com>
 <438fd5f0-8a03-4d86-bc5a-6fd32c7a6480@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <438fd5f0-8a03-4d86-bc5a-6fd32c7a6480@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3NyBTYWx0ZWRfX5McT9I+C2Is9
 ZkRYfOCrK+h27VvHaarP5xA9wpvY26nngV+lqX3mmBcUFt3GoDrzEbqULKIkfef2STRRAUqnn9e
 fipd2I55Xu24FA4TX1NxnHmKu7cc71lsGw/jqnfW3RdJ1DVM3e3tkp6+UJENE2s8oXv61z7PPDQ
 b0+sj0EFvE35sJtSxXG9s2GfY/Z1yCpOrfXiuS7/zaKaAARZExDBRMmu0CL4BzckLKVhI96bGcg
 J95D3sNWaOv+7NLZI4DVzcEE+RU7l2ynPcj05pXNENA6WaxL9ZjrT32Pz/uUeJlx1VybcDpwU2j
 dDSyCCr0VD9qEIEbYhXi/3C3oFetTfiUtxhEYqiZ4y4RelrYg55GqbCvAz66YL2L71ervyR7CEk
 OCx5MkKZYfoePQuSOAdPkKdLsSsIMsXo2epEevGLDA/m9WB7mSF9J0lejM6upyXZfYi7ijGDGE5
 2+mYHZDLcNL9TfZujrg==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69cae3ed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gMX6-vXHZE0qzWHLqhUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: cWd5lbGPXNZhzTIBliYldNU3_fJQe0qi
X-Proofpoint-ORIG-GUID: cWd5lbGPXNZhzTIBliYldNU3_fJQe0qi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300177
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100908-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36873361353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/2026 5:07 PM, Konrad Dybcio wrote:
> On 3/27/26 1:13 AM, Akhil P Oommen wrote:
>> GMU_ALWAYS_ON_COUNTER_* registers got moved in A8x, but currently, A6x
>> register offsets are used in the submit traces instead of A8x offsets.
>> To fix this, refactor a bit and use adreno_gpu->funcs->get_timestamp()
>> everywhere.
>>
>> While we are at it, update a8xx_gmu_get_timestamp() to use the GMU AO
>> counter.
> 
> Which I assume does not need the GMU to be in any particular state, just
> have its clocks enabled?

On A750+, there is a cx timer calibration during gmu resume to match the
GPU AO counters with the CPU counter. That should be complete before we
read this.

-Akhil.

> 
> Konrad


