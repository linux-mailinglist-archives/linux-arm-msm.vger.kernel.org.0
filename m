Return-Path: <linux-arm-msm+bounces-69799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3571EB2CC2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B533171252
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E0C30F54F;
	Tue, 19 Aug 2025 18:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzYMIuO5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF40261581
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628635; cv=none; b=W3WoAs+NEZpy2i7WYssKnNDVgDDZbl79oGIy9DNGA7ZlmBh4vsbpf6SjHUxBUcuwy0+jsd+oa/8Y2BQ/xFXAmNt6EsfJ4n31hcxhycy6jyZLF6FkcSjUcEB5qc3YQp1h1F7m/CK1Pw09ZP7pm1uhOJNayAZMBMav41FT9rRtF0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628635; c=relaxed/simple;
	bh=vrW0EmPkI4zd+cOzmIRYMTsJL+PuP37DVuXcK02yEyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2xJeDVYhzl6KRvldyWy5UTTG5+DbahDvlGFxOei+XrNPYQvWWXZQCMMRYIHgxz9BDCBFcX/Qrw+k+1S2vA9W6ynz+cJ7d510cpSvR1RRWLQnxX1/Lxb4GeyLu/Gokr289OWuuUmQG9Pu/fe2KbzFf9lOzoDH4h7tcp6Syk8gAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzYMIuO5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHWmXK004523
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8zzsSlW+vfcoetmh+aNUXt0n
	PW6Hm6tovpVdqMFTAKg=; b=YzYMIuO5P75hXFa7sLMDAQzgo14DO9mCdkXrao46
	qQJl//f/b5p7Di3PkGHO5npgEiNmOpPmqNa7WN2/KGeKJfNg55WbQK79bWbgnjEF
	lCNAkqCFPc6ZaU4gXV16IEglfmu3M+KwhxjOdlZ6pip2gRpqONewYNdkb6dHbfhl
	tPV/xGX3wlZeo+nbjHAe5OfXsOqStpWi91bE/FUrcG95z6JN8Sj46BsibsX+380R
	D/cCiILzF8vvHgNZ7zerKW/SKiiwzRSCzyf8xYyvW65X1lXJzob1YyLKy5w5Y804
	V0+gWtC9MpCS0YGw495qHGTS4cgmqUhY237FhjzkI1w5bg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh079k88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:37:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e870627e34so2532880285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628631; x=1756233431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zzsSlW+vfcoetmh+aNUXt0nPW6Hm6tovpVdqMFTAKg=;
        b=oQ1qH8IV8kJw1sOjfVwtw53gnnNNhR//vvUcw1ELuAbQEvMYpIPwfbuBkBcXx73NK1
         jof5FLxl1zmEQiH56pRtBpGg/rf11mr9v5QMcdRtrLatDekgECvPx6adn1juUbKOrBN3
         cC9/1I+5hN5Ut/xvuU56hUn54Lmq6UsRLmHAD2gxvVu38Z0QIgo7Yaa/lgZUXqJbQ97g
         70RaFR5HjNgABSKo8VkNUwiJ8AvaJcHY4ia2lgBWKKg0ER5giuTXu2tsKziC5Hz8k4zW
         SQN+nQeicnmhACkCeGGbtXURPp0f3i25GyYqykqEMmXUJswtSB6FNkeCN6gmmHEDzb9C
         GEJg==
X-Forwarded-Encrypted: i=1; AJvYcCUGzMivO3b/zC5wk7wz6MuYm3FfWAvaRGOOYxzpXwbn2Z2YTyZeSV8hMHlw+gXZCf+X0PTflwu3hEXh7JdO@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGOtoCYD6w+514iAOLKI7qcpAKqy0gNRfUuEGFYc+pgtfxa8q
	3+R/P71VhR4uS2aI+WUh+vjs/AguoDOL8fb3oSh0WTpjJROqHRu3bzr32OY4sXLZu13RR/Z5gZl
	Gxj3Fcxd8e9dIkPQ6PfOSkbWq/QwtnFIR5JrdbTY1LlWC9u4I2lGel7lvY1LHqaOSEDZ0
X-Gm-Gg: ASbGncsmZIMQ7qy2ujc6bdJmkucK3ePK3UipYn/nzQNzV7bwy+kP/5oqR/sZOTyAQR1
	kSGPCF5gDlupVBZ1wRHNIHN0UiIr0NLTBv+qBVr69BrHU2zosi+5n//3MSdjN5DIwkf7wUves34
	obtSc+h+5Hu0PmfqvhEbzmNxMeQ7c7e2W+ZcG7POQLqhFgoKuSqUY316MguVQG0fvJCkmy9cvnS
	I7IskLKFfYrIW0v4CjvuvtyEa0CfIFrVPT52Ptf6AvGLBePeA1idvj5AyCrleUDtMwCbGtov0CU
	0+2OT/vzaXYyZS1auaznJ0ht/cFir1vYrJAkyilkQO8WsVxif1HjU+3pPOcCkPANh3B5kKWC9xw
	taX1LmB++OHfHcf94eWE9PrWaiXfj1ebLsEuQkxOpGGT2c+rVbwIx
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id 6a1803df08f44-70d76f92bf6mr680886d6.19.1755628630717;
        Tue, 19 Aug 2025 11:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/9Jbw5k2A7/yG7vgxGLA4vjWJwQp0tKe2YMtTmRKt/1P68C9GEw3yPXUBXiX/mkaJHk3uRA==
X-Received: by 2002:a05:6214:2526:b0:709:90d2:4628 with SMTP id 6a1803df08f44-70d76f92bf6mr680246d6.19.1755628629913;
        Tue, 19 Aug 2025 11:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ccd7asm2257069e87.82.2025.08.19.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:37:09 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:37:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/3] remoteproc: qcom_q6v5: Avoid disabling handover IRQ
 twice
Message-ID: <lf37hp2tkiv5xmhc3jrm2rulzureegrixxzptlffvscxbg3yhz@3r7bsvtuehjb>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-1-de92198f23c7@linaro.org>
 <czaabkgp3aerp7fntqnpwgilipnum5vmdwwrkem5mugcs7vvd3@q2mwq6ijfbmt>
 <aKSQTc5u5AePWVwj@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKSQTc5u5AePWVwj@linaro.org>
X-Proofpoint-ORIG-GUID: SztlygE-z2LxLaoXULU5-dx6-nmEQLco
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX3AmJaaPn5RyD
 FkYxTIHEc6u1/fx/SMMelyacQgAr2YcSeugsT011gbbHE5J4htS9h4hASYQ8IAUSm2zThirfT/l
 U69TXlp2TC8twG+eIq2dFiolSvPJqofKp9ckCF8Q/v131yvjXUW5ZjAUHr0N5vhouyOlGpmtRlX
 jVsOmHi3TbgT59WTuoH19UdrqfwrfrXxi0OEZmQ9QCEHfkkTsLsf2Go2nrMkIqNruuQntVsTYBz
 U3/HwBwCx0kw2jMXVAYDztxLnjrlAQxSELjt6AFRJL02ZGmmpbXLYcpKHlwPlREEWogs9PiqNOC
 3MpyJ12B5NoQ7wJa6lBVGP+3/LvDSiZeGqk9JiOlxFypPhm0f/6DhXm5YQDA3S+oVoivbspp1mF
 Swhpuf52
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a4c457 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=512bcEdpdAFZAVaU8m8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: SztlygE-z2LxLaoXULU5-dx6-nmEQLco
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

On Tue, Aug 19, 2025 at 04:55:09PM +0200, Stephan Gerhold wrote:
> On Tue, Aug 19, 2025 at 02:44:26PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Aug 19, 2025 at 01:08:02PM +0200, Stephan Gerhold wrote:
> > > enable_irq() and disable_irq() are reference counted, so we must make sure
> > > that each enable_irq() is always paired with a single disable_irq(). If we
> > > call disable_irq() twice followed by just a single enable_irq(), the IRQ
> > > will remain disabled forever.
> > > 
> > > For the error handling path in qcom_q6v5_wait_for_start(), disable_irq()
> > > will end up being called twice, because disable_irq() also happens in
> > > qcom_q6v5_unprepare() when rolling back the call to qcom_q6v5_prepare().
> > > 
> > > Fix this by dropping disable_irq() in qcom_q6v5_wait_for_start(). Since
> > > qcom_q6v5_prepare() is the function that calls enable_irq(), it makes more
> > > sense to have the rollback handled always by qcom_q6v5_unprepare().
> > > 
> > > Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource handling")
> > 
> > Didn't earlier versions also have the same behaviour?
> > 
> 
> I don't think so. The "extracted common resource handling" came from
> qcom_q6v5_pil.c, but q6v5_start() just had most of this code inline in a
> single function [1]. The handling of enable_irq()/disable_irq() through
> the goto labels looks correct there.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

