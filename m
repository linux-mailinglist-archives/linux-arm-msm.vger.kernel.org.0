Return-Path: <linux-arm-msm+bounces-76804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071DBCE363
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 20:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 719EE19A77A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 18:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31E42FC020;
	Fri, 10 Oct 2025 18:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+JWwdZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DD880604
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760120694; cv=none; b=C+p0HQXd7IoGkDxF1Q/r2LR5iBR/5zR9HIcPTfydVj5geBO35dzqnv+JsDRNsuttrgd1WHN6qw0uzeRQ8FL7fSw9y/6OeJHQ4k+WSJtL+1/hgE6mwuMZPs7CWjCKTb70kDjCllXc+YYhMpzBoqEl4kACo3t84f8pyZWknVBjZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760120694; c=relaxed/simple;
	bh=9h+N7jcDyOc5BGr1kDkWLlpHAbv2LFq75pa/9F84Xl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuf9fKzjvqfg7vrVCcOVuRUNvd3HxJNId3b3K+wuHtObXlmotRmYHkFjz55R5n2oSfG3d0faXyJTDgaoTVb8RNlL596WVv751ffN0NviDLlhLpQJRiMs96CAQBPWyFel14p1Arje1fx5tAUu7X9dKZyWcJNqdMozbaEI1BHrebw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+JWwdZd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFIAAV024173
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9upVP/EYtvQuDS97rpn85pAn6Fk2yzF+mqttaZezhaA=; b=X+JWwdZdAeZ3rDg6
	97b9XDrZ/xBR0ZSPHDZS3h2jz4QC5InXWMJqQ1bQv0nAWAQNMBTcASa84rg8MPxQ
	EgJKPsqcBKkMoofLZu5cj57izKqDqDlRvIpFC3qWsPzAj1onspnHiqMCWOxWsrDQ
	qRW7dRCDAlThIgGOwZN1sYVe4twiXPXggsd4a6pFiDQBItqzAyL2nr2psV6iZuWO
	USVwvIUJZPpATqCcYysbx1YyaenK2g7jK0qs2/EWieXSkkej1222AWQKWr2rpDV+
	dBUX2oxt54stYhZd/BW8uRvSIU93lesPCGWqlxrIAUO5lrZrwRH7rfqDmhlpHqRy
	VjhQUA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kyc62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 18:24:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-883618130f5so106567885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 11:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760120690; x=1760725490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9upVP/EYtvQuDS97rpn85pAn6Fk2yzF+mqttaZezhaA=;
        b=eOPSACzWpSOuZu5Kruiq+nTVQOFZrl/Tf7ycgg3oJinOhty4VjNxeyDMj1QmUsV471
         aPShI2xR2MF62PfHtEPeHXvF2/IJGNTq6dXCrQ5ourIszlhCKgja3uwrlAq1IDIMu+N9
         ksLsI1w02O88KHSvDHuRsMVr344hymNvxZUzzJx+qsWDkDmGOozgz2SoQt+1bA8fSHQy
         UC4in3+JSilZ79o2ZGGHe5uYI8vRPviqRMeU2G86e2m9UbIFtUz+p6b4QMb7Waj0Jcuq
         esII550eIwOIBhBusEhuwkKsAqgUDyKdlAmb/36Ks4pfMvJCrxGQmLUIAhy/wLjop3Kd
         YWfQ==
X-Gm-Message-State: AOJu0YyWzF5bLlcNOjfEH00p0jqbItAvM8xAL6pfskUcwicTmV+EuBCo
	Z76dSjxwFtK1sMHR3cy4/hlkbdOgPFpOu8zoGvjq28/SHB1oNymqk4UGWvRU7qZfZwShzNxvtn9
	A2G0kpalEACeDdn8HmSbh4JvHo4Ktpzi2BF4r6YWmrPiV6mscWuSDgjOwPp5Q2RK6Y766
X-Gm-Gg: ASbGnctGDWXZCBOSEPy59NdXv8wUI7/fwPHApYHKIsA0VDuJdycTNVCyOhPVkg0+Cun
	XaubdaF7FBHBdvOhPoeOf4QdmbtUCjjoa81YMNEUvf1NlYZ3hTfa8p5dpdYCR+B1SMifWI7m8O8
	tq08oQr9PwRR1rp3w7JZug7o8ihR4mqaqRYfKvHnrbu8SXUtemuCbh8rXthAGmxC06jer9Kykpy
	xEYfHt5vOFrzHx2QgktFGJ6NFsJwIuslWfHqEHmdFdc4TuDAFTYUSvKFbaCsyCKwZd4VHwF1LV+
	gHL+UWjrq8YArnBfwXefz7olV8mkKHUVHMWhwOF+2JJJakKFzEmLtiVAKh7GOCVULQ2si8o0x/1
	4woUuLeCJY0rXfVon//pCLQ==
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id af79cd13be357-883527ca0b4mr1292957285a.3.1760120689998;
        Fri, 10 Oct 2025 11:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJDHOXXLxWpzMVsdELZY+jNe3rRfKX4hd2hb4fDYH/CA8/2CoNx4Yo+5Y9x92+KWGKQNrRvw==
X-Received: by 2002:a05:620a:3905:b0:878:7b3e:7bbf with SMTP id af79cd13be357-883527ca0b4mr1292953585a.3.1760120689465;
        Fri, 10 Oct 2025 11:24:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d2ce9sm288483766b.35.2025.10.10.11.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 11:24:49 -0700 (PDT)
Message-ID: <7f10f4b4-a5d6-47e7-9e27-8b6e48866e8c@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 20:24:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm: Workaround IFPC counters bug
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX9JQslxEfBGde
 poGufZS82XerzGh5EtJtC1NYzru/62mEJ4Whp/BMLYiKdbdZDWaF5Op8jfbJhWyT5HsO3ae4B1F
 LhHz/M+I8fi858b1H96uv07UGeiGlIJmwozB4jbd3sNKi+ZFHX3+P05CASBNYSd0kAu58A4ba/x
 QXIwCTtsr62VmPZhBxVubIAE7O+bIA/l0GyGcas1fkeh8mO4gjKdBQSG16oWaVzPEpdye1hW3Ro
 D7gLqOKpmx0/nPde04k/v2gYjzoaPCCrr6yZETM+c2ao70yHNyPYnDyMhZvh6AZekRcpDl7L1j1
 jPtWzWBd6HFvRg7TnCjqxoyQn0nZPZjtwpYP0zyO2j8KCRUH9n15q0zps2WdIry0Y5BUW+hnPqD
 Bm07bySopkf7Vn1TCqze47/KAPDAsw==
X-Proofpoint-GUID: MSlR6HVneIc_wiDXlN7yNpnVBQqIW7YK
X-Proofpoint-ORIG-GUID: MSlR6HVneIc_wiDXlN7yNpnVBQqIW7YK
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e94f73 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=LTEgcuO_lhVDbfJd3wgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/10/25 7:49 PM, Anna Maniscalco wrote:
> When keepalive vote is set to false IFPC will be re-enabled even if the
> perfcounter oob vote is set.
> 
> Workaround this by not setting keepalive vote when sysprof is active.
> 
> ---
> I have little confidence that this is the proper solution hence why
> this is an RFC.
> 
> Hopefully something better can be found.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Your sign-off is in the non-git-logged section here as well

Konrad

