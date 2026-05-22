Return-Path: <linux-arm-msm+bounces-109275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHFyCXxAEGrzVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:39:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB75B3218
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96A2630265CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6863D3480;
	Fri, 22 May 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMOqR9z+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9a+w+3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1823D3491
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449329; cv=none; b=LTGVtTsCzvPbIIN2nWTkQaJ2tbVJjI+3hEkgJZcyVBBcjG3x+M6CapdXf+wKi74ivXKBZePfQEHYXAtQcquTLc+tczUSM0qeBlC8sWw/CeBA1mifH1M9SBn/WZpziPFuR9qLSD/0euIKUy1g0gxng3p2t+pnJNTQ6nCv3GjCwkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449329; c=relaxed/simple;
	bh=fNzzd7iS6U7Mi/0PPvhUU9oYzpEW/tR6rsb77qlxuhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RB5A3+EfiYm6+/uTxatO7kP7zlLsD8GGcuSAgyx+a8AjS51VTnEj0RULjGtssyPKa13ETD4FppXT+qONLfjW0nua+KcFAttriGrOgWxwq3Fme+ja5wRvjF8VKkJ7DlPlV0KC8+lebFO6bV9qpWjoKbvrTiRx8pDMdPuJUMl5XsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMOqR9z+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9a+w+3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBGvZ81960034
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnhOOcTcjq/QyrWBsiSMk8cqc2b43JhyotHaDX3ndwQ=; b=TMOqR9z+ARc4Ae56
	xEn7nmwPJVlu84c/WAL55uvLoaQ9H1QgojrjzVF/OaiEgPW3TYHkRXEFsUA7sS6s
	gzmfgjY4SABCJqD7w1RTmuLESjVzUnR4EI5ddSp/fUjDwCe5bI3PhMHXCBcFB5t4
	JBRg5cuYH1vec+Ls+pX06rxxfamlR8CkQAGQTYJzPfDaygrWcG32q6CsxGnFJNKb
	KhVUOWJuPl6ImAPEinRnZkcrUYGnR0K/E0Hd1m/ILcAl0V+6a6/D55sFghwewR3w
	0fg9bnJ31ZSa8crKsePVvPumXhdvFmzF1tpsgHqAUimBhoNw9BwW24fBiIPx8HOp
	MrHNLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxes9hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 11:28:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-910a755d717so104937085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 04:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779449326; x=1780054126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnhOOcTcjq/QyrWBsiSMk8cqc2b43JhyotHaDX3ndwQ=;
        b=R9a+w+3MWTcW0UmqlQYm7BWAag43UO6qa0JcBarM27l4nCTHleX1H0AlbF/vtyyeGU
         XeIOtVjpy4EbeWY5TEQw2BryWpD1rAiSnlPVYCs+hKfyC7nr+si4Jb+vBMKvmoNoTbAd
         tJetGXg394Y9wGQqtGc4RK0d3RgN6r2IF8evJ+8/TxA4OakNEOL9fwRpQ9ZnDNJWHpqf
         we5yPsVGuxxralvOzdc3TW/wI84ojzhUVMMQM2skyEEdzdnnOJF7d3YXOzkXAdi/6XK/
         WeEvaWhy+L3Myj2L1fjfsYDquUSNbHKVUpuektsTCEoneCNIygs34O2gdhVP62uxUpSA
         PW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449326; x=1780054126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnhOOcTcjq/QyrWBsiSMk8cqc2b43JhyotHaDX3ndwQ=;
        b=IimOXlDgtmU7QdlD8GZcCg7IrISUWl+k9BEM2mkerrjqk2neuAfQMo7DXo6gIJ4NJO
         +1loXeE3h75LpuURIknj25ZtRhwJHv5ZAflTvVdl6IFDvBNH7Md3yfhwwq5gtQ4xNNOZ
         j9J6L2dFLp/oS8jzYl67NO0oD+BqSDHftZriOCUqCPzp5ut1xemLVnA00sJWS1rWF9+k
         AoZwfWR0rdqd5dBx4FtITG3sMaWJC/ZKLJ3E7usEmrw/+N3MivfJFlpsoQqQ3G9xvWoC
         2PurdxCTaq615jtpG90hd+O0+6/1wcZ3PajljbQFX/LZ2E0bRPM9SbI6awgt4ICYhqn/
         mhTA==
X-Gm-Message-State: AOJu0YwukeSvJI+E+r6uz0hT5eFsHEtnE2O0ND8dfiuRClt+g9g+Mqg3
	r1izFln+MI4zdC3kYQ+AHIZiCtUB+58XJV5kKdj948mermkguq/1wxMjvl7khNwqM/5PkD0FJDn
	YynsWdneBkYx6bxX9Gje2AgkaQFI6XCgpPVgdomqOvuf5T1U5vkw+T94gDRbbxAQ2UK8B
X-Gm-Gg: Acq92OFXsHVWmG0L/wBeVAtEZfYF8wO1vDL1uypy4RTuSEXwy4CvD6Y8Mccmq02lbnT
	aGA6iRKcCjewln3s/IWW8tX4QJw4M/g4sIbjydQCfj27zanBh67GSiyBueseG6FItGwqWkQsq46
	rvoDbzSQbtBiQ1TYAlaTdmMu1ZxQgti9Md3daV43v7m6x7MxJexvmtAhRjhT5654CUTkIxlTVpi
	zpO+Xn6XMtO5i9lAgbO/9JlbIoBfse3cNrshlXDl0R05On2XpQ+qvx4YqYPsQ0mriVh/d53f3z1
	AEQhD9IBAByXQL3b7A39NW2v2EHJKKADAJZd048fxe3JN5gJLYnmEf9xuvnrpics3REBU6J4aMK
	TasJSSsq65nJUnVrmovJsxmbOAqD1vtBX9OpxWmHRK2qhaA==
X-Received: by 2002:a05:620a:2682:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914b49a070dmr333131885a.6.1779449325910;
        Fri, 22 May 2026 04:28:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914b49a070dmr333130085a.6.1779449325479;
        Fri, 22 May 2026 04:28:45 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d70a5sm45211066b.48.2026.05.22.04.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 04:28:44 -0700 (PDT)
Message-ID: <86b69fee-b588-45f0-b682-744b9959e86e@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] drm/msm/dp: Fix the ISR_* enum values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-hpd-refactor-v5-0-0c8450737d64@oss.qualcomm.com>
 <20260314-hpd-refactor-v5-2-0c8450737d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-hpd-refactor-v5-2-0c8450737d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDExMyBTYWx0ZWRfX2UrHnoxNx9Az
 6adryGTb+s/gZe7ncdFkkaVNhDoJr/Pl0YduPYEN9gZ+i5QLtX6ojmv+5XX/h03acAiMJDilzQW
 IzK8JOjQ1WBhUVXGc3gHnEkoMCoQ5m5uB1UsagVaa/vVIdIfWHaEcLTWEWITiUMm6zCiZosossk
 E0PFodgjpGMs0LHTWD6bS/WoXu1RL+a8SQ0eQ3ggy0Dy+kNoawLYyuPa01VYqhfXyOfvgC0jxGJ
 PW/tOmRtKelf/kO5efDzx8IY2zI0or9pIjgMz6oL/ogPysM/K7QKEX7HfkPLNCBYjOEowtjUhQP
 V0Dqn1pTRu0qJ8SXzV1PsHFOJxL3OQ7z+wqdGyDWtQ2IVzNdyZ+BCVgljgz8tuIOZSzNu1/ls8l
 evQjgiEDa+dRWhReoFrwaFeH9Sku4wlcAhbnBjCAqEpZ4qO76uxsT+NTcENq1Dho1KaBbOw+Z9x
 AyRFm6Z9VnsC4VB00hg==
X-Proofpoint-GUID: h19ULS345ZIQoiO8-qSoLXi53zXfttJK
X-Proofpoint-ORIG-GUID: h19ULS345ZIQoiO8-qSoLXi53zXfttJK
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a103dee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hxhQaWjiUK3sto3hAJ4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220113
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109275-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 1FFB75B3218
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 2:09 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jesszhan0024@gmail.com>
> 
> The ISR_HPD_* enum should represent values that can be read from the
> REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
> ISR_HPD_REPLUG_COUNT to map them correctly to register values.
> 
> While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

