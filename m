Return-Path: <linux-arm-msm+bounces-99810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPLWCvWjw2lssQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:59:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB04321C7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 09:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CA8F303A458
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 08:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FD139A80E;
	Wed, 25 Mar 2026 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n01fXQBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiHRxcrr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7489539A804
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429157; cv=none; b=HUvJVxYUwsoCboTim+MkGK63b3hLGQYrnseauwhnZLoBo19O7Rk1BxwtgQAx5VXAAtGyaDgRHbHQ9ZEoFRDx4E5vPoC2J+OkYrK9s1xty4iKYQfa3lX7yE9X2Xk9pF32cWTBA9l31U2DLrxzXBj485hneen9gp36wP6wFRmpQOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429157; c=relaxed/simple;
	bh=LrrGeQkd13HyWcnGHUTiOgts1UJj/AN3LGJHiIHfTnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnSl8h0Fj9Ym+5p7cxzl9iXDq7nHTcyEKBUApzxx8r1YbjAJNVYRFE3ZBp3j+iT3FtDUeEFF6WVJq3a3DrHl1pXLZaA8trmyTD5LwZRH17dXB1meL4GiR7KuksZcF9EOu9jGmWWq4A5v4WFgDvYaHY1EgyOpu0NWS7JCq8fC9Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n01fXQBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiHRxcrr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5gaIj2973524
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	birThX4xRYTiUjDh/VakZgxRYC/a1HKA0k4xAl+tawI=; b=n01fXQBBBT/as8ur
	XU1uQtnR+rrA2yOpehml5WjbkdPaX7b3n9fVatWbiegkDXLCpoi8rQM5NThQgAq8
	kes0hWEOI2GV7vlCRD6mYYWzFblcvo4oRfyXu90d/PFGxqD/mEcnHdxCgRw6ZhNY
	SFn/IJ5VBsTkhubeKa2Iqbk8Y2pS2OIgB/Op0amhgf/Pi2z12UeOSC/aBA8m54up
	J/o22VAyCpYhHZCWcUvvOWkP5AlsZ1/enr11xCSlUqFIuEfxvRugvtNi83ynwLLL
	JEaSU1CqJd7r+g6llowEpt2xgb81XFwzXSNKIgdyv7qWzYvnC80vgKguSdU7B3Gs
	4MtD8A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4jcyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:59:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5073ed1ec6fso56013451cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774429155; x=1775033955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=birThX4xRYTiUjDh/VakZgxRYC/a1HKA0k4xAl+tawI=;
        b=GiHRxcrrzV3enXLqbVzEww7b5lvYFfV+mJ2o4e97MmAXI4OZoFUsaL/6kkMS7qVKtH
         Hy9KPmMqJKk7gSqpBZP/n1I4cb/xpfNbzjP+idEqr9qufzSAE0AAuj+BnVLrNgzmmgab
         RRQPIyvUpDkHTEh55sE/B1REVrtNH8hNUGUlDAKmVmWtuOBfx/Q4aqRH7zXFxnhUdUaG
         +XuyBznT6lO0+86hfvWLPaBdXzxr9q0/QYBjXzJIOWmaTXLAvaLRAfp4sSMGfbIjtoBy
         tGTUkHlAsbIqFsef0gte98Ygn3iiFwGx15ae9cPY4/yXRE6Xbcf1di2S7nzKzyPkDXYG
         hQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429155; x=1775033955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=birThX4xRYTiUjDh/VakZgxRYC/a1HKA0k4xAl+tawI=;
        b=GEemTqspepL+zSMqqo2uhZCCW/vOwE59gEQ3+OgkPpe+dTwwrF+5xLqsmFY5pof1Xi
         G/AvffeFvfxkhoQkjYP+xS1au4SMh5m5/xXnV+OTdVjtxa3az+PkUDQPu0RRyyYrwo76
         8eSurc/dJFWXndhClQ2HPF5QFLzVI8QVA+ueJ4fPysKPv7Wbobsb2enaFvmDR2tAECd6
         /aF+8ns/7Bv8zD+1Z83GmeXb01mk2KqCDkDgkjSF+EQ2gFypLpMKciQkF3xtet/vdgzb
         Ho+E97V+wOw8d+r/+Lrhtae4ctT8J5UkbHzVeXz3Wbt051T2yUXIW7pfOl6S4zDibRAM
         qCWg==
X-Gm-Message-State: AOJu0YwkyYtNsg94l77+jSyQxMJd8BZ2vOKdVBfKT7vChiTxFvzDHjXs
	d5eAt8QuDVE3Koh9UOa0F8CXItuTDaohZCDUg4w9FIP1+Onni+0JGVwe72aYIMPC1KUKVaRjEaQ
	S2cQ4MvU/PCcSoXfYXSFBt+ETSlDpN74J+ZSrvCgoFbqz56R29gs25yExKgdInsEV+ihj
X-Gm-Gg: ATEYQzwZ3XBV12hRZfsQ8n4D+UVY6t8J45dzajl89NlO4BmpbkNOrLgVct4wKS/JdWK
	Ozszy/vd4MoDP5gZPHVsWOF00emWk1Ivr3hpbi65Am3mz50wI11L/GrYHYhIwrUTfdE7lcMAHt8
	I8JFPT0BcEuQ08V7cPvvFCyBh7SJpyTR+ZQfbmYOTJI8K8mhMC6f5oOCH4uhhhc27LpCj0mJuIW
	kd7H/cNEL+6rWnBWNYiRMkNMWx79m2pm6zMP+xbetzlVvAG67jXZdZZen8zkuIvcwMB3QEdznx2
	rWKDDnJaBPGetCkn8RjpHK6vqHzKRua2zqhhlIeRs45jOATjcPXxkkYhmhO2srtGuo/LG4tSUXP
	KZGaSB76X2Ay/zGHw6lSvohXBGg6ef0H8ApewSFFWl0uwFlQbVdzaUg4hHqvQw1gIlmca03X8W4
	99Gf8=
X-Received: by 2002:ac8:5852:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50b80d33668mr28746461cf.3.1774429154913;
        Wed, 25 Mar 2026 01:59:14 -0700 (PDT)
X-Received: by 2002:ac8:5852:0:b0:50b:1e21:1733 with SMTP id d75a77b69052e-50b80d33668mr28746051cf.3.1774429154425;
        Wed, 25 Mar 2026 01:59:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43c3bsm761885066b.2.2026.03.25.01.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:59:12 -0700 (PDT)
Message-ID: <ad8ff7fc-f7f9-42b5-834f-9dc2f247c306@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 09:59:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp5: drop workarounds specific to MDP5 1.0
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260325-mdp5-further-drop-mdp1-0-v1-1-5ccee47fd1aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-mdp5-further-drop-mdp1-0-v1-1-5ccee47fd1aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2MyBTYWx0ZWRfX23GmA6muVVJc
 o4NPnw6lt0sq6rwuzEDQhYmMp1MpsdsSnOFqJj4c8IukUmHiyYZSaPMFL/4q0PdU4Sbnzjr1RA6
 VzB91jxKmpj9zx3k+3KNUt4VmUtng+NmaYtxkmF70hAJBWgXZ962pMVOYhVtmC0KgWtlOr3Ilio
 1BgizwkIEO3GiVWKP2cfcJ/2LioqvxkStoL4DPIc+RMGo4Bm6eT+hGkhjXHFgDfFWdF5i/WTzIt
 DHqkmeJ8+96+ynKMQUYJgd9vjxt6uiiePG4qzR5/y81Bdkl3lZ1HSMbAn+ehhJqeFG5bDMRUckO
 5rdpXI2Br8y0r6EtYOsJw8GzeLu4Ypsyml2t74tYyVZ6vNg2K/MB+f7L8Z74qdJvcLSRuQEp1Rc
 0nQ212bdIJt2LSyroapk3jkM0/qwX/SkSmRAn2Cua5oGMLQdDWzPy56nEaJC66QCnphlGtjv1ls
 NPRegGl29DQkOwSepwA==
X-Proofpoint-ORIG-GUID: W2-Fp6iD_9sgFj6lHKYNa3sChEAxsyOP
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3a3e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-owB3-D08_1IoEjBxTMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: W2-Fp6iD_9sgFj6lHKYNa3sChEAxsyOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250063
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99810-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CB04321C7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 4:06 AM, Dmitry Baryshkov wrote:
> With support for MSM8974v1 being removed from the driver, there is no
> need to keep workarounds specific to that particular MDP5 revision. Drop
> them, slightly simplifying the logic.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

