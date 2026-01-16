Return-Path: <linux-arm-msm+bounces-89451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C2BD33884
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 17:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D16D3141493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E51333A716;
	Fri, 16 Jan 2026 16:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlklGxgX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wx5Y/UfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8240D395DAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768581257; cv=none; b=q2gppBT6sgbuIkEg+BeU4R911tJeeCLx5WWF6eTjxkseupP2OBPIk4bpYv6lxeCrSmAVsthRnBeqt26qTdoWFKs3r70r+CCyhQqcSFSG3l4Hdy1wkj6CwamYORuMGtvlNInGK1bqldUTWfIzKj71wx0a70HZzZwkRyQ0myi9feU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768581257; c=relaxed/simple;
	bh=q74+5ZnUwcdx1btcAy2zqzv4xpPqKeKYliKs8FQFcvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPwmTRVv/2wrED+JQ30NnRkxoI7ByIbfye8YHPc6Z6VpRP5nKpCJN9Kj1vuC11L7V6njxYEBQRkwzoYlPpgPyWlmKxwqkB6YOR5NxzJa2B70XoXO7fdQpRb+dCSvfliXnj2l7S1Ghw+iRixKj36pg+3Fk4LWBPXFlF8WYJ+Iuco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlklGxgX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wx5Y/UfI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G9iIKB006930
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ibXM/IJs9WDuZYSVdiNej6sR
	HQ0vHmfue7ThjW1H/ok=; b=BlklGxgXzEpdrHjixzkmtBz5qOh0KAbcMtdkXqLf
	thqtFeDPUY0ZsYsz821bAIawLyT6WN1MZRD6cwJUzSCgC/YzTYAWUJegDG4iVnIC
	17fuY/iUtlI7EObiMSOGcKL9MR+QsGeSj7toXEv3WOscKFWmtzTeo5trtJ2IPcav
	KR7l5iQ3y2tpMdJqgaNGAZkj66Sed19vhNQ+1Omm1Yr7Ydb2T0Lw+XRmMDmRQE2i
	h4L1mwgYQyCnH3w6WfXfHyySci90LAuxZCuuq+12j7wJOladCRbvxGhDEhY/EEYp
	8hkXxzPYoJqk0oh87VMPfvI4p/a1WbLAVl3i1HjVLb+7Ng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqjy9s5a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 16:34:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a69b7813so244289085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768581252; x=1769186052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ibXM/IJs9WDuZYSVdiNej6sRHQ0vHmfue7ThjW1H/ok=;
        b=Wx5Y/UfIFLTOoi32qYscrXw75WFj1apllJFzinR1rTEojY6eKrNAZyVPfk2S8pHuU+
         mq5oq6UEOyilijxVgpL7PzIwkoXDjt8dczU54NMQFEMn8fqRM4ZIFT7zWlDf88ocKVSO
         VgQurAG30zDL2L0hr/lJqAl/WtuE/2pca8qldLqer5ajIuJdKJujKfQyX7ODIF2+WD4a
         KPXj/Mbuiymay83paXpcWDSus77uZ85inlP+W9rBLeBQWz28odgu/HH5/Wu5SPgkhNbi
         Woa/eg4adycSLd9V5y+lTsrjbkipwmA70r0NjY/ktIzxx+3Iq5Q2QScVfyeDZEDpFhZR
         Ptqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768581252; x=1769186052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibXM/IJs9WDuZYSVdiNej6sRHQ0vHmfue7ThjW1H/ok=;
        b=NgwfIIeXMEnu4adKHg3r/n3sE9EkX8d0Tjkdg9M0b+dEE9rF23SkcH7PLnNHc5K731
         vfhuL8s6gdxlQyc1Hu5HRH4y3CbPyuQp6UYBVky6rZMYzMsFFCQp27lOGKd5RkqfE1sj
         SMCT0A7QpTS14wceLyOcTURiKO6wmdtUlP2Ar6UhptFcYiru7An6LC6C4PhUAs3aEBqX
         I/VR/VwmD6ynDioJRblDeLHfcGHhW0Xt0Im2cvwfTqovhMNDFdABig1X2zcYPPzL/yHq
         7nl2ty2n+10JaSpQZECpYXGNNA17+oWKQyUYW3gZnLy6oQSMPrfr5K/ZAj4MUoIxMtFq
         lIMg==
X-Forwarded-Encrypted: i=1; AJvYcCXxtVRowUURl0h2+BiF+gIX9NHYDaP4JbJounvWXIqE/Xvf7NVrRMN6oJ83Of9s1w89TUdUNXRGySnXNBuG@vger.kernel.org
X-Gm-Message-State: AOJu0YwOQZWTDQCVWvotwa3zBBXyCH2npPG2HSRF0V8sZEXF46sR7J5p
	hcYdw7F0zAu4TtNY7PUD5u8RE5ldMe7PfyWL6NGM/V8LIyALx+R8emY/01QJnCh+nrJuCYT7QNz
	xon9QR7wb3WyB+tTNr40nV1qqH/JNTGj8W2NTDKzYbiizDc78NvCBGL+bXM6w7AydzmYC
X-Gm-Gg: AY/fxX4O9XceDr3OfJBzG35MbMugwopU8prgCwWJtpW2B2fhuxpZYJyhjzPWPNLliBn
	kdqwo9AXth86CBObRSAxnLP89oG1ixAP4fjfzwO8N+AWqsliyUn6YN+ujSYtl1+s/GX2twNA8J3
	cCYd7XyGKASWcmP1gqMkal9NJMXhVqd79IbcEU/lDnJL9UTa0TDqUQVUHUYq8rSlw2dkLmFGAWz
	x1yDFVrg1zl9mdoK0Im6RfpVIA/BNdgeooULBHmze43ih/KR68m2qHC0mdQB8Y3wh4gFi4tkwpn
	fZqRKW7QJZEe8uuoGawaBZ63WhP4cgnlDYdwKVNOnAZOMad3gRRL6AvQRNrvunup/hA4coyKY0Y
	7HRwuHkK/kR3vY7SSdl+c80K2gPkOAUj0Dkcf/RPr4gxvslYYqmOdxuNzK9iJZDxi/yY7YaNfFG
	B8FH60tNXMsJwFs9/7n9YE8TQ=
X-Received: by 2002:a05:620a:454d:b0:8c6:a22b:e135 with SMTP id af79cd13be357-8c6a68e828amr459905885a.36.1768581252231;
        Fri, 16 Jan 2026 08:34:12 -0800 (PST)
X-Received: by 2002:a05:620a:454d:b0:8c6:a22b:e135 with SMTP id af79cd13be357-8c6a68e828amr459900185a.36.1768581251735;
        Fri, 16 Jan 2026 08:34:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e7fcsm905003e87.20.2026.01.16.08.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:34:11 -0800 (PST)
Date: Fri, 16 Jan 2026 18:34:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
Message-ID: <cdtaituwzxzhv653ahzfmrcux6emgmrnpp43xzs45e6dsy3uls@vefliexuk6vk>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
X-Proofpoint-GUID: Vd1Mt_GFS7CaL6KnhwF7u1_9yThkunVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyMCBTYWx0ZWRfX4bxp3G0v5u4x
 Vut2Yu4ZiFiE+KQU6CQE9Z02mXhXFwa2msSFYHSXwc18th30xHPfIdMWM25Ivr80Sq6vMG3CCto
 BFxVmeEGSBXGBkKNMylr8+GaLGEtdMk4SUYitJBcmwwkMFIqQpWCNO2ecV9bNZ0vZMwc6FLyR3h
 wbDafggO0xAk9wmKVIc4MuhAZ2tKrt/JvjjxJoCsR2pUXHMu2ZDU5L51PYV3GEW4+x3KSKkd9ii
 WoBLzrHZXlHedaStK5qMtJwwEljMh5klPtYv/gb5l1Z9pq1NpGAxHjrtsKYilpylxJXlcBxR8xl
 rWdDYw1h0wd/0VcKNiMXdm9alBAUPylnWte8+7GtV9YYTdcg06H5UuYoyJcMwI0gu/9ZkGCBH/0
 vovRb+4FpeL5y09ZWx4hvy0zKC1mSdQJs9R7Riydb87WLLxQdYK/ZIKmFcSGKZ7GU6CqnJ0udFk
 HriK3rmZwWgk0MB3M0w==
X-Authority-Analysis: v=2.4 cv=OJIqHCaB c=1 sm=1 tr=0 ts=696a6884 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=uEvfv33MuhQ9VhGiz4IA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Vd1Mt_GFS7CaL6KnhwF7u1_9yThkunVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160120

On Fri, Jan 16, 2026 at 02:17:23PM +0100, Luca Weiss wrote:
> This GDSC requires an interconnect path to be enabled, otherwise the
> GDSC will be stuck on 'off' and can't be enabled.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/camcc-milos.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

