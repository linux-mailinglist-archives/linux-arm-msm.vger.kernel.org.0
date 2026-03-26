Return-Path: <linux-arm-msm+bounces-100160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA4qBIaUxWmq/gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 21:18:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E3433B59E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 21:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E8E73095CBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 20:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445C83A6EEB;
	Thu, 26 Mar 2026 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQySmhwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IONOYrSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8F339EF12
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774555975; cv=none; b=kfVCJOeTT8AplkGbJWPMDzXO9CEY8LPpPsPamTfINTWPtQeCEy7zv5jaepxB0l4AsmtzQbsCTRQLs5Gz+hRlHjtwrribGPq7J6YaDqhMlJiqu7Q1Qk/8IWNNz6D8FXvtMBZ8JBgimFyMmB3CSndIbKGgYo7uEF70cOMZznBnkkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774555975; c=relaxed/simple;
	bh=5AkZwlLSAkMrjll6QfT18fZ0Lmy5ItVLit6autosngQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nupT0cTuymFpLJnRvEI+e1bY/0E15WqwRK4K3dKwsUupZmrSJr99C+u/oZIs3RbhienPfQ7Cs10JEZzeFnzwN4TojCQUXul7gKBnj0J2okQVPbN9yvvIUy8eKg8Hno+Ab8j65Buj/Rnlxb3SURa1792brS4yfAhT5Uedie66otM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQySmhwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IONOYrSG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9mO5790018
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qsmz1RtLkSbASLYXXxlZoxnDX1y/ZiflBrWH0lwDH0k=; b=GQySmhwvWr292qvQ
	Bgk2fh9i76aQJFVMR7B5IaskHorUINoRFaADSIIgiRRUya4snLSS9ZZ8tgRpXJDT
	EopJIzyQ/7MrCqmKr7Uo1iuUVB2H44ektweW5InsuOO6VsbW0IW7XO164/XqgpwC
	4wR3WoaYxtR1ZL1k1WoVOOKyWNOK8aQ8KLSRB4pE27hC4PPGdevI2q+Cyw2KdJJp
	ELW4/vEW1s8yyOxGgEM2GkI0LgjLaVyUC26YOGMbTmD7NQeWFK2Yxr0swus9ZKZk
	X7nD92gK+luVNm+F3wKGTZ2nsKGCPjX0CeDjKSqbh1pC/wT6V2LOYd80tnNn4l7L
	uLDauA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqhxan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:12:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7651644975so930018a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774555972; x=1775160772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qsmz1RtLkSbASLYXXxlZoxnDX1y/ZiflBrWH0lwDH0k=;
        b=IONOYrSGrVVTHAZ2CDBTfLxJDPJOtCuNPvYDLIMJEbiBUahGdzgWi+foVsNkX08Akq
         JtM9LK+/0mMOZi9d0lJhZ2G1Wrjd4aglD9eoRXdF6BWuOf2hgqVKwmKwxSZUpQ4QVRDk
         z+veufh1Spw2i0D/1bxlWc/3l3ZJSTHBYvIGr48hAuteEbJRepsNjc5PW5NXGETAZQVY
         lLs4VyzACvyFmvoM2o4gqD1f6JcYxRMzScofbuohNuNo0f3YOT63Alnjfmb6M1/lEXK1
         W2omoXyHVZ9v2bcrt2AZN/s5dt9Y/MNagc7QNPUFmoM0QAdEyc03bvOVwSU9am3qJ2al
         HZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774555972; x=1775160772;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qsmz1RtLkSbASLYXXxlZoxnDX1y/ZiflBrWH0lwDH0k=;
        b=BvY9+r5GysDXceHLEnSBlZ4iCrFmjMMrIjd32oDO6fXBzDQmiysrg1r16YTClO34Aj
         PM2irYgFF5ICSi+K9sLDvQLXZz0SgJ2cdqFpu3lizH9qbd2nhfXrkkjZI0K529AjHTHZ
         wLHms8XqUN8dt4eh6uGvHgkj++r+R/2tOHCsbxV2J9KXIpeLrizSfivCHPusoHjTqXsh
         ZZQ+vMgRVNxH+BZBhQ1RNRE9BOZR1nRR7H1E5HFnSxnY29yuckPfjY9cRryVWWECFKv3
         JMZdjZyso6gFv1vZUGBbVvDWYjvtshVdxrB2Hci4QtfBB7hKgYOtgKDXnkJyh2LqTE5w
         b08g==
X-Gm-Message-State: AOJu0YzTg5vZNkcz+YtZJATCM/HLHwscIX5bpDnTRSgI4jWIJ3Gdnlxi
	v4gk6OfDKTwrepLrJJfo5Urbhcejiq5+8xImP1WmiXcn4q4zx7g6PsA9xZvZxAAsxoO+HxKD7p0
	eGkKvH+IabP99HCdYffnvRIcZ4LWe7tKzHDEOIvWP45fjCH7miQNl65jQwTS6N/MsoMko
X-Gm-Gg: ATEYQzzPr88/JGHXB61P7PZuPoogGAGS6fC6/rGw/Uf4nscoD+RCV97WhWvIcgSqQSc
	ub+Ap4/aeR0+s3SHlVQObiynh0a6KQsnFEY4eS55ckaplPsDNp9ISz9IeFM8CmNikS7V4JKT4Kd
	mJt63Kn+tryFXD3apsJpLDliIAIrt3rIlsmGj9Qdb/xq6g2D8pR4dM7wW0jMzNSjUk0muCcAmQJ
	CDqfWawbp0OkJ3FUa+BCbac5HLHIgpSkbyOySKeM4AUCisGaC7D4PnAz6+dBCSp6hL56lHJ+/Kt
	8i0VjmfZU0hNEnzqbenMvdDVSfD915BvtR5+k01MXgffgg/bsEQIsXK1ZMHpfXPZfKJADzzaE5g
	QxpZvn0Yhb4FVIIgCcgSHgsi2mlXWSPZvGW+uunRt+ZMK
X-Received: by 2002:a17:90b:5109:b0:35b:9777:8bb1 with SMTP id 98e67ed59e1d1-35c0dd951a1mr7211378a91.19.1774555972210;
        Thu, 26 Mar 2026 13:12:52 -0700 (PDT)
X-Received: by 2002:a17:90b:5109:b0:35b:9777:8bb1 with SMTP id 98e67ed59e1d1-35c0dd951a1mr7211358a91.19.1774555971741;
        Thu, 26 Mar 2026 13:12:51 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ebe2c98sm44495a91.6.2026.03.26.13.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 13:12:51 -0700 (PDT)
Message-ID: <7d223573-438c-4e93-b4b4-64975c4da93f@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 01:42:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] drm/msm/a6xx: Fix gpu init from secure world
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
 <20260324-a8xx-gpu-batch2-v1-10-fc95b8d9c017@oss.qualcomm.com>
 <e44e776c-df8f-4555-a487-9a7a6fe032dd@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e44e776c-df8f-4555-a487-9a7a6fe032dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDE0NSBTYWx0ZWRfX1kYZfps2Ix0+
 AlqYnyUZjPRiMND/ArP9cTEQJwDVKjACBEB1REFLD8fJbfQNpbP5VnFo8CEJkHbtXE1qwoiPvki
 KyX31JfN9jxeQt+0wmk/asEOAcY4wevf3BqIwVK0cTBLAmaoPZgdx+YwNzlfJZFS4ot1HW0qDcM
 Y6riUdDJQt2VdJVeVFe+FmL3HuiDqs/CMnZOK+tWEh7M/qwTchnpyGPtasMo+vxpmt1PDYoOjfn
 ufkKgeUTDg10P8uKKC6DtcFfGTICKbg8QQbQxkwy0ee0L1Swir0zFSkRYeFC00Zw08V05W178Sr
 KSFiFBupzTz4hpTZt/Y7F1ejV8IwUS9F+KWCcQCCsV8miviKgU3V+BClDRO1c23Y+5PAthuoxVD
 1mfPuylqRjZBlq4QIaL1tcusoa9V+QKvGBCXVoVitSeNwYrykYJdwx9kn57DzNBYkdM4SgbYucQ
 kHOeyAOF9diwNQ858zA==
X-Proofpoint-GUID: lYsFh7G3Myrn_yOw9g8CKics2pdeGrkN
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c59344 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SFlVdHt8JhaXNI1LWXcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: lYsFh7G3Myrn_yOw9g8CKics2pdeGrkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260145
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
	TAGGED_FROM(0.00)[bounces-100160-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 65E3433B59E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 3:37 PM, Konrad Dybcio wrote:
> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>> A7XX_GEN2 and newer GPUs requires initialization of few configurations
>> related to features/power from secure world. The SCM call to do this
>> should be triggered after GDSC and clocks are enabled. So, keep this
>> sequence to a6xx_gmu_resume instead of the probe.
>>
>> Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> This now makes this happen on *every GMU resume*, which sounds
> undesirable (kgsl does this in gen7_gmu_first_boot)

I had this in my TODO list, but forgot to update. Will fix.

> 
> Similarly, we call a8xx_gpu_get_slice_info() on *every resume*

No. We check then slice_mask and return early.

-Akhil.

> 
> Konrad


