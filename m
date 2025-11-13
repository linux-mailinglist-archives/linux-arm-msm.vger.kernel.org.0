Return-Path: <linux-arm-msm+bounces-81622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E21C57FA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 15:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 847083B109F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 14:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D4F29993A;
	Thu, 13 Nov 2025 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+lYOFyS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYqJK9tD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1D28BA95
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044084; cv=none; b=MWxeqRKaestPMmxHXoCOUrE1L/sGLvWxB2JQNGYYlQoQO/WBpaDZXRIUgpGWiFjpdJamhq95NrVdmoaGpuPkj8pnefEbfQCCn0ylAmx73O/Al/WUgCDmsnoLQyczu45sJZx+GlcRBs0YS9ax7HllsdAsqstBQ8v4f2bbofytBwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044084; c=relaxed/simple;
	bh=wxL6JqA5P6ND1K/mSIMRBRSJ/NijehXz7WxjVwIPCxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzFIkxHp4oclMRqwuWX08m843t7nlOrmX6U0Vn1pMn8rAwQiqO+ZwC78rFq2t0Lzv22YG05OG4mtAQmyHhd3D+d58sjpnjLJ/aNepOa1rN+bNNohR/cAOEcomZ0D34ijVcE3xVCi+nkyEccc0ifJJHsMzQrpvvqQmQNvb0h6bVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+lYOFyS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYqJK9tD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADAHHdQ4097082
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 14:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cvt0Ju6kREFAmxAocRiQVGTq
	zMjryYQhAdRV1lqmy2Q=; b=f+lYOFySTwhBaiQRTWzblGRWvD2Pk9VJhhVFGdRP
	zdSAqcD/MTp4WQZSsMLDiAkbCWR/vKhK7+ZSPsj3qqcCQTYDd8d84c/XkwphgeRq
	FbI9b+qF0/ufnDYk33O0f/vVWVtfTvYdqcNiZJUKyev32S6xyzvUpNlDnzMNabuw
	+uap52v4b1WWGajL3dM9L5Yk30ogSycZuB55MC1siJsjt1OPDZtE5aXu/SDxkmjP
	A3AcoEaJsryNRDWEo4Jl6pHequeo76gFZhEsJef6m2jALHI5GHPvQI4be9mSn3Gi
	iWje3OJ6meGzlMl9UvvgmCXhQfL54Wgo7+wSMhazDidFRg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4addetrq3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 14:28:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b92bdc65593so1823932a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763044080; x=1763648880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvt0Ju6kREFAmxAocRiQVGTqzMjryYQhAdRV1lqmy2Q=;
        b=XYqJK9tD3oa2p533x0yoaR1nqGCJ8ahogUraU1NrGwz7GYAVyaxUg9+ivmfuc7GCOX
         Va+TpfZCO8D2n1u//PTsmru/AK1nyEE62uFYyaalw5fN7IPkDHZcnVw9hZtlXvmQB8S7
         lipvgQ3zHLLrGGvvkER8/jW+2i+Fi7qo8qgTjKrdguOeQmfJw8puXqC85u1p6T4Q8QXC
         3w7aEH9lqg380KNPSwW3YBv8eVcNFYmDxFEnvTMlSEFO5Wdifxy/PHA5ew4CjFtcTfwi
         c5yB4myVGQqSlkJJLAkOQ4X7R4QCLf/OjI8IeBcVtQhRiDIxGYpN+2npqugedOTXuijr
         7Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044080; x=1763648880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvt0Ju6kREFAmxAocRiQVGTqzMjryYQhAdRV1lqmy2Q=;
        b=c+NpPoI5NzYMCoLdMWDiqDHVEE7OeH1aKJQuj4EoyXedLufx97EwEiiWT2IGgg7FgU
         CEuAvBp4IPIwoq06ugPDjdvQn0XPeOtf+W4fL7lBTE3KZLUQwJeJHhZxgKZZzZjDs0mr
         9a1BF9gBavHysxNvMz8cnSC1KDbAIiXVmVBgeA3d6DgEXo3bs2OqVnp0VkSD+MXWf572
         oAmWbt40YDpsyS2tjWe1UIKvdFyasi2X1oXwUFza/BtNVziH2HqmYOE0Vk4ePXlb7yUr
         noUrXOAuJdfeHXv+BcrCuOSVVvdw1f0L1e8ViMpMy01K0mzjmTQE3wiy7rai4UZfKPBU
         BiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvOt2HKBVV1PM7Jz4JSnHtbr5Xm00YFZiBqOlwciOGhyCaCA/1rQ6n5n680aKJxVybvhzewCQ88gcReUrs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd9JslrAlWjg92Aa8Yudq1Cm8sU8ypZzRKxDMFAsiTTI5sNl9H
	c4B4bgKaP0AzHni8dffEqauofNFlCAjbhVPZjlSl5zwgwuCyxhymHImZObwXzGDImBa3eXEE+rt
	HxA7sJp2nr1gRL/eJyzWFjja5tAHvS5RJvHUfCEWmeE5OqV4az4eyTLSNcMDvTJpZ3ev/
X-Gm-Gg: ASbGnctIk5tXUttnQKmp4YLSPBfpzTFcahyM/onWttI4//ofym3WYsQbTC84r28qh1f
	5la++ObKSmgzS6r+ZQT9N8Z/rHHh3h57clc3OZvChapnPdckr5XIO73keliMR6R2IKobSXhM1ng
	R/PfC2uMe41feewVOA6YmRnykST9xQ+9V6bVVPnL/yJGEt88bDKTA3F18lgWFPuj/8GxS5TlKw8
	EqA0FUd0NTInI4vBefX4esLlP5cD7qRPdOs2E2TPJW3XM7hCCiZ2MicOZL4+6anyE8lYqqw+yHh
	98ULEflLjL+3guVM+/hqdOP1RX8Fd50HYmG9cJoKrWVOkBx6gsPcS1OuGS+eN8SqfrEEMZEqmj5
	lzvrzOjlrN6K1+AG1ZBuYxhbaSg==
X-Received: by 2002:a05:6a20:9187:b0:34f:99ce:4c48 with SMTP id adf61e73a8af0-3590b50d138mr11223224637.42.1763044080051;
        Thu, 13 Nov 2025 06:28:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgOhKHdoyd4hVxKr3awuEOk5CzcMCINWva12ZHc3reUPY/2Y1RQ63s8nWM8xy6Dy7GUgjo6Q==
X-Received: by 2002:a05:6a20:9187:b0:34f:99ce:4c48 with SMTP id adf61e73a8af0-3590b50d138mr11223163637.42.1763044079363;
        Thu, 13 Nov 2025 06:27:59 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c22b1bsm2502462b3a.66.2025.11.13.06.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:27:59 -0800 (PST)
Date: Thu, 13 Nov 2025 19:57:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/14] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Message-ID: <20251113142752.syzvlfxe45a7kxrj@hu-mojha-hyd.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-9-df4910b7c20a@oss.qualcomm.com>
 <aRXLJL632V0ys6rs@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRXLJL632V0ys6rs@linaro.org>
X-Proofpoint-GUID: ZEM5SvgTj8QAtWOeNABWiNgCnTbEz2Ju
X-Proofpoint-ORIG-GUID: ZEM5SvgTj8QAtWOeNABWiNgCnTbEz2Ju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExMCBTYWx0ZWRfXwiqIIebcoNzu
 rOvYWgzHwD4x+0LVEnJlcN6C7HOR7olO4dSwzW5B7TQnie6SB8/fPFrFy1nMFGUy5lp94baT1cf
 KEubeQzyTWopLg7D4srxmt/Bpva3oNESi+IQ3TGf0NO1daS2NHpXrfOE5bbCB9iuvx7zHBDEKzC
 A/AmDTZkyw77W/cpJO1T9XDojFZqx/t6PIMyFkWE8GDCsbZdm2huPDAIKrni1cgwEJFP71vxAcd
 5xMIORlB+1oa7iSJ+VZ4/kasn13or3Mm9J3bGX5xnUiDOztZQBcsKkAugy8Vb8P2Yb6WAOQOSub
 ipra49eREJvIJNdINX4ienJJOT/CdMWWgy/FExJGGjdmMHExHJhB0RbS/APjzJ+cQ9yIgdrJM96
 lDlEWQuMldL8Iy81a/XmqjMKCQBQ9Q==
X-Authority-Analysis: v=2.4 cv=QZNrf8bv c=1 sm=1 tr=0 ts=6915eaf1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=O8AhHoIjlE42LP3zLE8A:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130110

On Thu, Nov 13, 2025 at 01:12:20PM +0100, Stephan Gerhold wrote:
> On Thu, Nov 13, 2025 at 04:05:59PM +0530, Mukesh Ojha wrote:
> > Simplify qcom_scm_pas_init_image() by making the memory allocation,
> > copy and free operations done in a separate function than the actual
> > SMC call.
> 
> Nitpick: This feels more like "refactoring in preparation of the
> following patch" rather than a real simplification.

Will reword it.

> 
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
> >  1 file changed, 33 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 550707f2b46d..1d8a2c537c44 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -590,6 +590,37 @@ void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t
> >  }
> >  EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
> >  
> > +static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *metadata,
> > +				     size_t size, struct qcom_scm_res *res)
> 
> The metadata and size parameters do not seem to be used inside this
> function (also not after your follow-up patches), do we need them here?

Yeah, you are right, no we don't need them. 

> 
> > +{
> > +	struct qcom_scm_desc desc = {
> > +		.svc = QCOM_SCM_SVC_PIL,
> > +		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> > +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> > +		.args[0] = pas_id,
> > +		.owner = ARM_SMCCC_OWNER_SIP,
> > +	};
> > +	int ret;
> > +
> > +	ret = qcom_scm_clk_enable();
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = qcom_scm_bw_enable();
> > +	if (ret)
> > +		goto disable_clk;
> > +
> > +	desc.args[1] = mdata_phys;
> > +
> > +	ret = qcom_scm_call(__scm->dev, &desc, res);
> > +	qcom_scm_bw_disable();
> > +
> > +disable_clk:
> > +	qcom_scm_clk_disable();
> > +
> > +	return ret;
> > +}
> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

