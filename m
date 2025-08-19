Return-Path: <linux-arm-msm+bounces-69747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67828B2C0C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAA35167837
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5792A326D4E;
	Tue, 19 Aug 2025 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VaxJIgHC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE74A326D52
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603722; cv=none; b=CmPqoqZNlqb6JwHarOfPhXuFvKCTe6TyoIIM1HBUYMTCJ4o8v5HwcT3glAeqr5PjNKMZqS9oaa/NnUykCzXKs6k+uRDwn9lbfrDxwx4kH8QWzO9jZ5Q31ET4h46JvhsvC0mbq6h5hSagQCFfsZM/jdZZI4VyvqxxGJ0mLxB2MNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603722; c=relaxed/simple;
	bh=3c3P0Ov512KLcw7X5QWcagNzRtomEDe0KgzgdF9pzJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRMACrP2FmszAzpqWt8phIrhXy9Z7dsObL9n8f9NA4NwM+jTYLw0d4gqpujR4VRQ1fF9zOjo1Nk2fkf43geIGSJmfbIesQQUjk/ElB/yYgIJRm116KGzjdkB9bPxMWiVecOOavqab1J2SyisLgusCN2T4oxZNEt9E/RALmebraM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VaxJIgHC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90X3t007209
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yJsIOx1IW/4ds5LVu6MmGmTI
	aDxN0yng90bsRAipNso=; b=VaxJIgHCTr0KeruNb+U5eRAIbhjNNBY/jddFnlwY
	V61HjMaFXSlYcS4ELLYLh1O7VyBD2LjpDb90f4FHI69UR3iwuKRYZR1SAAVi6PXC
	SzEZZYw2DS8rWGMApvvkG7FSlUvEHgblCMVydRN4mlB02ZAQ+aKDLLY1tsNShwWu
	JSSgyEXHQ0CLz3zPV3lIpVAON/wIEfUjibvxv145UuHfYEurRLcmDXQpan7/YPtL
	BNi74D49PnDPUF3vO5tgUkf2bxAJHpkqxR9weuMdJPUiowcOGnZCNgtDTegcCqhA
	bk8F0FrK0LIntMBgpxtPoRO/iloC5JcU4ZfDDnpWWwjuoQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj748d08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:41:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88dd0193so118481486d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 04:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603719; x=1756208519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJsIOx1IW/4ds5LVu6MmGmTIaDxN0yng90bsRAipNso=;
        b=jgO4y3Fzlyq2u+9sOM3QbBDYk47gahIn1tmPp5vOjiGPIq+xUwrrWGO9C8NoOE+urE
         +ntAVa6+sM9QnjOTbg//TWoX7y9D+gk2NJDigOECEIFrFxtt1ByFM2xDl2cIhg+ztpIn
         9q5wcCnX/iTu0ehYE/xn4wR5cXV/P9sQif6x1zTAWID07rwsYxR9gGCyl0+BtPGNJxur
         MxThq0xDGOfwMZQ75sqBVxZJ/tTrkCpNr0cYNYQQZYpxtn3QBqmyrzFNrKHywSjQA0g9
         5AyBDCkyMti7UCxiPzcxetXc1eLb1bbrXskpnG0UpFs9QDdK+R8nwIjRZFpOX2IxB4g4
         T4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXxsPfxwfB5rBX2vr5t9ciMdYHgnU7vH/3DFzgB92yDS+t9FN3z1ENtSZumfaVGFh03nnS9yzwWtYno1sIj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3LScJX/pp+TBO77Sg+TjzTSGlZDJSbZdK/8gJqm/8/xxv8twV
	LS2GsWNCRkcrprtwAimSCMwNkyzHCl7iVew8+aGTW2DpRAPtQZk5EFZW4hZAtDXZ51YLlWD1Oaf
	0GpbQpG6yuXbLIratG98/6l3vX3K8OPXHY6UDsXtbm7h5RQ7mnNxdNv69bm4FrkukNWe0
X-Gm-Gg: ASbGncu57aG7+jn0c20ozoxKXr+O5VsE08XAXa8vZ+BT/JnHSZRvNIacjJd/SMH/QiJ
	Vk+Tr4pfr3wyCz240gTAlcNLzYd1H9yKTsUfH33d4qPyXO4DK6VpB3XCzBIP7pOUzqbVygDwj6U
	5qZc0iXxewck9crzuE5AHoNbpbTCucjrOa7iOhZu/eToG47+XrEgF/IL+vaP0Ni9ujdZmZONmNW
	fm0LyV34dr4ZVpeDwKJgth8udQM6DDaNIoI8VtNQaN7i27UrCNGxEp40HDNBOQM2IydPzeRboE7
	vaQkb6d3DkZhi3DKKuQPXCaDP4sF/gi8G9pebdtn0gRuqep6FiUK4UluOUqhHB/1YGPej0KcqZd
	jyLVOTEJyuclnn43ZxdIeFr3ZsJTRZ9+XZV06A/uEPOSXKuemXQqq
X-Received: by 2002:a05:6214:494:b0:70d:6de2:50c7 with SMTP id 6a1803df08f44-70d6de253bcmr9202846d6.52.1755603718546;
        Tue, 19 Aug 2025 04:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBTVRhXL0VqlxRqCJ+EUnMTs21YdzGYhSmteWvJJMQXmf///NNrDhrQtJS5kls23JWTZ/Z9g==
X-Received: by 2002:a05:6214:494:b0:70d:6de2:50c7 with SMTP id 6a1803df08f44-70d6de253bcmr9202516d6.52.1755603718021;
        Tue, 19 Aug 2025 04:41:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351646sm2071880e87.17.2025.08.19.04.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:41:57 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:41:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5: Avoid handling handover twice
Message-ID: <r4kjhua4aakkgni2y4feigk5vvaz73ncetdvegic74lhuadosg@s2yzjlgb65lu>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-2-de92198f23c7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-rproc-qcom-q6v5-fixes-v1-2-de92198f23c7@linaro.org>
X-Proofpoint-GUID: _GvCLwgc9dMIjChO--8zF0KLT6wT6_lA
X-Proofpoint-ORIG-GUID: _GvCLwgc9dMIjChO--8zF0KLT6wT6_lA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX9PXljYOsl4rQ
 FUGsgRS9LR5VKhq9mgLshBpCHlUHcelVVj3AS6KKpiaf3FIW0yG65LvS3E+EDdK7S81DmkahV4s
 4O/7R6sh5JBiDUk4NNZhVmpCFu15dkces3WFkCcUQ3RAULkXCuiBLvHPowInWd9TFGByVhvvEpf
 bdiXDD7FJRR3URxtBSzCDTp3Eo0pMDVzH4nx4S92cuc5B7FzR4cyCN8kmaGdQbI1GQJ4zlTgA0H
 rYwWb9v+cQNFDvwt9wrjXUK5pqwnWCHBliykbhZh8lP/VDqqrjv4d60pRrmBZi5Kvzdotjggo5b
 wLcK0aZzNEuhm4NV6XmhP96Vj/jvT3ISBDrqF5ujm1czEYyNwtGDvEVewfeLBS4iiRF2BQqd86U
 tU6FV3pq
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a46307 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=HqFbQBYZsyKi4bDvVsUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

On Tue, Aug 19, 2025 at 01:08:03PM +0200, Stephan Gerhold wrote:
> A remoteproc could theoretically signal handover twice. This is unexpected

theoretically or practically?

> and would break the reference counting for the handover resources (power
> domains, clocks, regulators, etc), so add a check to prevent that from
> happening.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index 769c6d6d6a731672eca9f960b05c68f6d4d77af2..58d5b85e58cdadabdd3e23d39c06a39196c3a194 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -164,6 +164,11 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
>  {
>  	struct qcom_q6v5 *q6v5 = data;
>  
> +	if (q6v5->handover_issued) {
> +		dev_err(q6v5->dev, "Handover signaled, but it already happened\n");
> +		return IRQ_HANDLED;
> +	}
> +
>  	if (q6v5->handover)
>  		q6v5->handover(q6v5);
>  
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

