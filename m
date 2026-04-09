Return-Path: <linux-arm-msm+bounces-102387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFYONewG12mdKggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:54:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 967093C55EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 03:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BF4C301938D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 01:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB39035AC3B;
	Thu,  9 Apr 2026 01:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzAT0BoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="By75dVCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5182DC32E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 01:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775699689; cv=none; b=QH0fk9CbsHLacYp25Wv+W0czu+gH4SdDcX81ubsenZOoSxYXLsiNTQgrwY8XiBVszO1uqMzKf2USdp4yoBmxC/fj3EKTQ3TcmCSQOnMzCVI60xD05i4AS0gdUQOxnCT2wyh7sGLa7m6VOiwLCVRtIg3IbAto9yNS8PmESRITId4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775699689; c=relaxed/simple;
	bh=4W+AG+ac+JQIDWNhwfeu0QfLCRda4qkicwneics0M3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1Z/LGZwFxq6Y5+8RhXZRzGHHZkDpw4w/6slqUtLvGyd8MpfIE/lB5XAgukmI27utcaRrd887+8PMde8Dyu4vEETC7hxZRVk/0W8uI/gXuHSW4ad3KvnVSghSSE4ipdpTC6vI9BT8DPSoGnsnKgopRbYFjwNCR/nxWoTjbXB6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzAT0BoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=By75dVCx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638HwC6s061699
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 01:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c6gJQ+eWHrSFA5vMe1GqQ6Bc
	0hkFIJuYP5uJVGYzRYw=; b=JzAT0BoW/EgwHiHxCtVfjHO+33h9PR2fTv/pQp1R
	c/SaFEe5SOdxDPYfrqcCcgD+F9ORmJQPtqkDUKrM+YCYbNo3SkcARZvMXGmT9Mxh
	Y6OTQS0PnB4thm/Z7PbJdlY8ftvAZ74F62qnKuP+tP/q2q6ZCKPECIWZhZ5RdKWZ
	EugPZkYSfcCFli6XsqKkQSTQmij8Z5+y0+OMd+oq5rt0WqJc31Iff9BZFC1M3dAg
	NLjiPeXbE73ALff6Tti/oPAhoz2NzPI7IMZRhCVua2GK1ydZRPYJNw4LqD2N3/z6
	yLIS1KPIin1xO9JBbY0RnaDipT7v91zqf08/LD7Nr/Ac0A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dduvv1fqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:54:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a8ea3f1becso9640616d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 18:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775699685; x=1776304485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6gJQ+eWHrSFA5vMe1GqQ6Bc0hkFIJuYP5uJVGYzRYw=;
        b=By75dVCx29qoY7dsfXp3PydGAU6qpv38kTmdqwYWx7OpPIVG6j+cKmiYG0uUlfzw2F
         vxu94R8Qd/bMtWwDANOrQFTGVejYqxqp7GIPXPKuWBcqRXT9rz6h/ilKZ2zjH5AeDvMJ
         0suwyYP9JC8NEiiNlivQ9gGVm8njj0xStmy3izNKO9WK+Y2ckXwwW5beao09Cr98gV0O
         Iw2ICR3QtqgXY3mZPV/V67CEri1fV5OMYcBBnob4U/smHhLMh9gQoBmO7qGhDg1cSN9M
         S8p/d9mVFK0owuBbn+b6hksLJ9Q0XNLRYDUcG5RV9i5Z20tU3j+aJEPawel6GBB/J7Ss
         tu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775699685; x=1776304485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6gJQ+eWHrSFA5vMe1GqQ6Bc0hkFIJuYP5uJVGYzRYw=;
        b=mGkgATUGNx5ObleqczYEiTmIO6iO31F71dCup8MTDXmjjMavVtw/bTOJ2iE4SulJgv
         jPErAB5JcF7y43WiuR6VcHvOmzyf9RrhysM/4EreDIedOcHCY++Q21tg2QanwR98OXjl
         rBtEeyW34ZoAsn8dnDy+f8aGv5rVyAcMhKWMhgxlgrExePnYMTeHJGYktsVTtvsk3P2S
         LzPCSClFJNRlLPG1m8vKblFFS3QbMgucny7iaI93MBDg16TboITO+J+yOrtHxHm/7Mle
         xBduLMZVfvAj1rdJ5INtEnT+7M7/hVsX5KgaMtkeo076SrpyS5425WxSHetpI+NJrPKL
         GhIg==
X-Forwarded-Encrypted: i=1; AJvYcCXOdSqu7FZZF82cpis2MsacrA6lunOmnZrHZEVvaeMdELKBpi0tqiXpGQ4Pzf7RWMyzXyjuFZ4nCQgF4Mi7@vger.kernel.org
X-Gm-Message-State: AOJu0YyGl9vU3Ibh3pFbVHOM/Vw9xyWQEM54pOw240mAAW3Li1HFfUVa
	PwbM/7gLJtcyY/PSINXc5uryxqXVD1sCElQJ5ZYqqfkK94AMDxFGxLjyAsuJHV3l/48TFV8PZvx
	S8wIGR8S+jfqzIcmlofE3y5pOM+57W+Y3UZUsh8fszq7E9m0qwF9qGCrqJ1b3JI+EvLB8
X-Gm-Gg: AeBDievsKwGyKKF/QXHd6yLaXA++FPkQYMfdK93e6kcqNk+Uc0Z0qB1gU5Qas88buUx
	Cq9I2wAsSgIcfSyNZ86D0blcGIn2om32WQ9zou67kNHAHoFl43W85YwdmDkhkjYn9OnLWrnJEA4
	9sAOv9ZHQ8zXiBjHIfniJooKlVzrctnwA64iW793KYS05UYqT2EpHPBMQ/23+Ft9aaqHN/VPF5g
	AZN6RNXbMhxfq6HW1McnykYqy2OS1tkLPmW5G5ylGj782t+uAK0prHOPEiuuAgliQwxiM2V9szU
	7i3xZ7/gwF59yTAEeCu1gNLUVZiqwkNmmjVeLQJMTyLGPtQ7cCMxpPUAU/lPFYmqbqI8uuoIwg3
	Wy32UjFAmKMRIacfAMQ1W3yjWf82AIRT/ggZYq9ephIhQ0v5ckg9jRstSYoScrvNf9rzw5clJ1V
	31LGLzbwPwO9exp8OW0y+Fp4vhOB3fxtt28g0=
X-Received: by 2002:a05:622a:204:b0:50d:844f:3b34 with SMTP id d75a77b69052e-50d844f4107mr253617451cf.51.1775699685278;
        Wed, 08 Apr 2026 18:54:45 -0700 (PDT)
X-Received: by 2002:a05:622a:204:b0:50d:844f:3b34 with SMTP id d75a77b69052e-50d844f4107mr253617151cf.51.1775699684772;
        Wed, 08 Apr 2026 18:54:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9534asm5067355e87.9.2026.04.08.18.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:54:42 -0700 (PDT)
Date: Thu, 9 Apr 2026 04:54:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/12] firmware: qcom: scm: Allow QSEECOM for Radxa
 Dragon Q6A
Message-ID: <wj52tzstbprop7emg3t4vjuhzq5mf6o3qddzqx3hdzz6acdtop@jrqzgjmdpabi>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-1-14aca49dde3d@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-1-14aca49dde3d@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAxNSBTYWx0ZWRfX0CyKeHrc1v28
 DvUcFuVB0UqhFYXGOY5LWaDRm5XiLc72MzLk0K7SfS1ltaohHmUjpYz9AtNNuUeMvElunJifFfl
 0HbLTcwk2V5fdDlJwdimiCuxQIKdOjM9Zs7GQBvRGQM/pTg6vRKKVT4gtcu2mm8lZJfuvvvhO7K
 lpptTb0Bzayeuu/2Ujurgf1wjvGfvct0sri5JI4ziysbxWTJAOto39Xz3hiEpJYQ+DSFlAvtpTC
 CkYL776WC+hWB71zI/RyjEvf62czCeBFI2vGcDrhf41mExrv08+xIfvblBqNWbwQHeNDrgUG0Ac
 W7BuLhLhNsJbTN4BFg4XdVKSuw0JW9oBLJyIsxZYR/BqrPUxiR4E1TjpFj1c7V68xnymq2EWhPx
 5FQzqf8SDJ3VHlYsJL2zfkQaBw/CX8TK0V9P17tYA5yk0dN5r1fVxs2tnMxtyfIwQPPZr7kXE9y
 5vFbtEv459YEY4Lxp5A==
X-Authority-Analysis: v=2.4 cv=DrxmPm/+ c=1 sm=1 tr=0 ts=69d706e6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=eLdiqSQfWnTWMVjn2-MA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: 7PJssTS4umfKh0GBYeuESjrlwhAFYtKX
X-Proofpoint-GUID: 7PJssTS4umfKh0GBYeuESjrlwhAFYtKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_07,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090015
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102387-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,chromium.org,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 967093C55EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 11:19:53PM +0800, Xilin Wu wrote:
> add "radxa,dragon-q6a" as compatible device for QSEECOM
> 
> This is required to get access to efivars and uefi boot loader support.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

