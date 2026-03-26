Return-Path: <linux-arm-msm+bounces-100157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H4AFb2KxWlc+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 20:36:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E3A33AFF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 20:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FF0F3014747
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBAC39EF2D;
	Thu, 26 Mar 2026 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEpVVlGq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHC+s3D1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576C393DE8
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 19:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553589; cv=none; b=Wbip++4FRW6gN058PJbJF5Ccf/MYSB4spc2FmMRGc5yWc7DQXIFESWS43sHOBBRi1h1QBmaecX/EBDWqlzTIsI1zW/hXUW8O78VyS0xyDjsQVQ4mpVAsHrZf1Ykz2cxCNzl/mIi1OcjqGmed0lAEnk95Qz1NMmO0T8YmWuLhUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553589; c=relaxed/simple;
	bh=YdOyyIGyOTHsZA+h3GJX/eAon8T4KU9DSSPmwuZosGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjB1o2LgSaCZdAGpM5B63KT/7W8Zz77kRrLdvOBckovPuFLTFoa6oFF/LqkYPsCf2+RG9y1j2lYaQTUUnV61pT6hsj8GhAa7BzheZTMP431p92aIdoFJEnsxBd7qTykr7ePkZSyzISNTGOjgrm7UbhKyFej0SKOxpDwtfw2VQAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEpVVlGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHC+s3D1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9j2G3898356
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 19:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6zDneLAI+dFgFezoOZsrgNyIkV7FoVpzC9Yw1wzYoU=; b=CEpVVlGqlQv+naoL
	50X31IgRBH97q4IuXtxL6pQu01uS3bRCKnRw5IO4tN56vBSwf+D+FHDn1+zjlw+0
	Qa94UPjoLxh4aANcYtTiXB+3aPnSstCjLofDMlzbfYCDGO51dYCRaDiozP8xmLc9
	K3HOUOQB9eQLqWU9G3shYKuTt5/7ocDqWm2NKiDg1xi/M8K3BumMQPblqCh/meZC
	JaPTqzUo4cE9Ek5rlL0zhnSy4n2VFzN9UO6PtEAlBCcephkTSQdr2EKJt1yqq/3a
	jHmpJ+2+qgeCwynMEcEazkKNB1lhk8oP1dyf3jiHPRN4e2B6DO5sqY50KfWcwdmt
	i0LZUA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kgahww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 19:33:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c63f85c84so968851b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 12:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774553586; x=1775158386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6zDneLAI+dFgFezoOZsrgNyIkV7FoVpzC9Yw1wzYoU=;
        b=LHC+s3D1GevMcm+QXF29jSpsXCapHL3inC0BwDYYIbcsHQZlmBX2N5l4IEvY2YcRZP
         BQ1BfSjxqXdDIITSg5ysFRybm2VKaGPn2WycXJBTmy0dRWQqYM+8++Hoes7YD0Pcrb0k
         +Kzxce1eefqgH9EL1NUfQeaAuMlXaJcjwQpXsLadKydvVOCwGUK05USFyrOH/6nqVM7y
         G5BEV095BBfKP9+CtLfnb0dL8BCQYUxTrpIrEGJ02O4Xm0RcwemBXA/tKQdgyGjc0a/M
         V15DkkZtHHe7stvL4oSUBDEeBXjk0IJNVW6s1tRcu8ee/W68X7XKtIxEpH0LwBvr3fBD
         ejrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774553586; x=1775158386;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6zDneLAI+dFgFezoOZsrgNyIkV7FoVpzC9Yw1wzYoU=;
        b=iI/664fFNaHkabhcI8hrc/1z+NAk/W+biV1HzWeQMNWZomrt8M5CuOtmmydZ6TmBsn
         QqUzgWT3h6M1FBAlmelYcVwGJs53EWxUlBAlbfjccSI0OrCQZF3cWwKlT67ypXbY43oS
         nkDTgwQJwyOOCNs5ecegayZciIIlRO5+0Z3G4aALORNaMyhlnUWA1meT3BtksNv7q8AG
         VKGEVsqn67xOWmijfve7+lWCgC9WzG1EIpj3IWeq+wGw/EmNlmFlg1DQAklywQiK9FIU
         zMTAlN7p/g1yv9/YcsjkCs5x301s46b7mOdlHFTXQJfhhn8ERauw/sud1vV/7IJkDLw5
         JZfg==
X-Gm-Message-State: AOJu0YwBOtnhZfqmeRD25u5KoS0vTo6iR3vQCcnGLcwXgTOzwDbv9QiB
	Kt4RjRGORKd5ReVxxWymkpet1W17H617sP7JYaB59Erov/tvFOr++uPN5RnILMjuaDa/KW4v6Y7
	W50ztXfuvhBPMJnzGqncv5CxwEUPh1ig0xtXogcycj/CRPOUrX1OCoD32nmz42FaFJoHO
X-Gm-Gg: ATEYQzxbFuAnOWOAz93lfasIGYWd+3U220Kg9ZRb8NhhMtTQisRX+lCbxPMxqQtj9La
	SXoBiitN3fwdg04q4iIWFddHzyoJ4o7692RC4kx6+2HT0zMV9JJuz2HhCupz5vdmtf2CHttsZVJ
	zsBJpvT9RorLiluNCCHd9zEygKWOlonbuic1z34IY5esdS2n3rmyYXIW5dwDVx1l2cbcgxDQk3W
	9A3Wz4SYVHF0HRn+lX7dWCpIZnf2tzhcK+n+aikjaJxscHTzyhXm1HSPLuLXW5p3ac2SqHPDCN0
	UeRpC3BqR2wMmJnZa8TMidsd3AWKdJfFC5B/8uz3Bba+yz1Tjt2rn2f46Zr+sv6NYRUwC1Ni+HY
	XfvV0eUVnq8gajjURP5oHvYOZq8g+y/HP86ewJZvDingk
X-Received: by 2002:a05:6a00:194b:b0:82a:190b:2225 with SMTP id d2e1a72fcca58-82c6df6202fmr8356395b3a.31.1774553585483;
        Thu, 26 Mar 2026 12:33:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:194b:b0:82a:190b:2225 with SMTP id d2e1a72fcca58-82c6df6202fmr8356344b3a.31.1774553584960;
        Thu, 26 Mar 2026 12:33:04 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e6439sm3444265b3a.11.2026.03.26.12.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 12:33:04 -0700 (PDT)
Message-ID: <3127ae70-f9d8-4881-ae66-5231833e61e4@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 01:02:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] drm/msm/a8xx: Implement IFPC support for A840
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
 <20260324-a8xx-gpu-batch2-v1-13-fc95b8d9c017@oss.qualcomm.com>
 <54b03221-d21b-4582-b0b9-d2384480356b@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <54b03221-d21b-4582-b0b9-d2384480356b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c589f2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=rL-UvztjHAg8Z-035zcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE0MCBTYWx0ZWRfXw8+vh5bzQMty
 YrQ2SU0AJ1HzXTrOGKpscXRqK43/B3ZMjrz7t8GYZRU1khioWRcKx8+M1+4fXT1R4msN1uv2u+V
 MTgV3OzkGBZMlSSsobONN8EZguE1he8CLk5+YsUmqrKd1qW3iKD7tOWB9PzkcYaBHXoTHYqSqeR
 Y7IycCkNJxxS8S48QjiFW3OghoqNCT3IIWHE4k5oLysWkvCoX9yjLHthrDOScaQUWsRJu9aYCTB
 9ch5GNYIgxMtCsmU5ygPoR5cY3jedZgfn97FqnzvK2Bnp2Pt+5z/LggUPbrMmFkHzYCjXx1PYiC
 BMOIlCVSIEewTCEgwZ53mUDJSHGdrlvnBqWpW+rStBUcJO0wIDsz/fsQsLQ5S0/fwT94fFAOoLA
 k2MJ7b5PLQOXnYbpT9b+quBXWVzLWTF0UBMQtbW04wi3MDAkQSbJWDL6G72eMiVDCC8qxhenLeU
 lCv5Z5shbLCvnj9/8rA==
X-Proofpoint-GUID: 3U4BWmj7jewe1On4QDYRfHbjrwAOvBmi
X-Proofpoint-ORIG-GUID: 3U4BWmj7jewe1On4QDYRfHbjrwAOvBmi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260140
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100157-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4E3A33AFF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 3:43 PM, Konrad Dybcio wrote:
> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>> Implement pwrup reglist support and add the necessary register
>> configurations to enable IFPC support on A840
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_DDE_BV; pipe_id++) {
>> +		for (i = 0; i < dyn_pwrup_reglist->count; i++) {
>> +			if ((dyn_pwrup_reglist->regs[i].pipe & BIT(pipe_id)) == 0)
> 
> that's a nitty pet peeve, but I'd check for if (!(...)) instead
> 
> [...]
> 
>> +				continue;
>> +			*dest++ = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe_id);
>> +			*dest++ = dyn_pwrup_reglist->regs[i].offset;
>> +			*dest++ = a8xx_read_pipe_slice(gpu,
>> +						       pipe_id,
>> +						       a8xx_get_first_slice(a6xx_gpu),
> 
> Only the first slice?

Yeah. I think we just need to pass a valid slice id and
a8xx_get_first_slice() will always return a valid one.

> 
> [...]
> 
>> +	/* Lo address */
>> +	OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
>> +	/* Hi address */
>> +	OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
>> +
>> +	/* Enable dyn pwrup list with triplets (offset, value, pipe) */
>> +	OUT_RING(ring, BIT(31));
> 
> I believe you need to patch OUT_PKT7() with the updated cmd count

Thanks. Fixed. I guess the mask was probably helping when I tested.

-Akhil.

> 
> Konrad


