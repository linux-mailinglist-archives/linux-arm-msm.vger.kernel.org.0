Return-Path: <linux-arm-msm+bounces-74024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 708B2B82DEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 06:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BF111C21D64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 04:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5795248F57;
	Thu, 18 Sep 2025 04:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UiINsWvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13DD43ABC
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 04:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758168988; cv=none; b=VmILwWQ4yyRgE7LDUETHAo9Dy+kFwEhkb0F6WeVe1i5b1QYXCQMCBHEEIF2v+F0/5Ok1Appv4bstc/GL0MUP/h/mBT40kD7LqhTDXlvDymxlepDBKapI+KYkhAnJ7+Fd3yuva5J4vuGltihMRyZd/FnQn6qmpqZOrW6ITOG75L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758168988; c=relaxed/simple;
	bh=teUWGPDqWxk1e6QP+tLmJUjqK3FLcVCTM1xLobbYDB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl5JYRUZELBSinIHWqHe7pZIyEncTQCuqyHA7jWyhFfB4Phb4wP5o0LzCayf22bHw2IIzI1vbopi78l60K3NyhnGj64AECgZfitJuU9qfEVzcN99ba89jYZ+noe5cayVccRAUi2xlNiASBeK0/FnlWM9qQyUCtSzF/aNTA+Nf5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UiINsWvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3a6xU019068
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 04:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yxrKp1mMNSorjFJ+jYSIIXoD
	/DQOcY1xttowefW1mLI=; b=UiINsWvjwplPQUD3By9AqxtrIJwg3QowkaKPWgjN
	q0ViT4aq+wuyOH6C0ZbnopUIC9Yegfwo3x8/zGmnEVjB19YyStyhJnkkUbzcYoWr
	PkVIvDNfXJP+CGHr+Cvqx6X0w01xuLFUoWflFxcsKI1nixuGr/iGm1i5HbKsW4gL
	UPYh697QsGks1BmMSCc605XxapY+Zw5Rsng+2eDD6lIZHpV49LyGG2smVioXW4ZW
	XuX3OtLa5IJ/JodMhoJ8DfdJ1D0mk6E+ldmv0p8jH1WQkwGwB0iEDdjaz6qVTfK0
	OZvC0fbn5NAWYlmtWHFzZ0Qbe976au09etBgOETIUuERRg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwcuc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 04:16:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so11526651cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 21:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758168984; x=1758773784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxrKp1mMNSorjFJ+jYSIIXoD/DQOcY1xttowefW1mLI=;
        b=J2JtidLpycfhRW5JTla01GsaRIGg4kYzd1il+EpOHNtgBGi39ZU1xcVdfTpw3FlZdG
         0UVKQmSJoom4OT0N7kQIaH6OA/01Ah4zYnFLknXNclZ1rkzQu17fJ1RSKfdhewlSKIle
         GDaZn5gc6JI5S79YC6+duzxARbpI1YWmpRDRJTf+MB0BXMOCZYIL/kQ/3IWzccINRzqE
         y8lLFQeFDcIDLXq8m1NVGT06bKmgw2saNywIpynO8IJmG6oe9zD3okgha6AJ22k/B+63
         hm1bKhKUVa7Jg8N9PZ6L01vlhtLWlaDDSWZqJNtbjX1axonleDaJY0sEc33yj3yKPyNH
         68UA==
X-Forwarded-Encrypted: i=1; AJvYcCUczoA8S1zlF9449kv+Csski+LQ7T38+9fLg0O7wWFPV34X6R5DXy96P0oDL5RmQ2/0PDBxHviHJNYdcwkP@vger.kernel.org
X-Gm-Message-State: AOJu0YxdVb8u0ZBUWJfjVLF0lTnYMQnQtLIQKxdUvqXo1/YLKFHSAgma
	uWzctnIFwM4TSVWMMBBTXNp+6q1jaViiV4P1/l04hf1p86UJaQA1fX/5ZUyRYTphqNcX9G3cVCg
	cjQXhLn8ng7VffF4pXL9Biz1p40bqLpcUjAzNjAd9/62tk5/wS/FASvBYlXdt8RrVPQNm
X-Gm-Gg: ASbGncvNjJxDNTv+HQyk4i1BCOWcY18w13OSxwCqGQHd+B+nDZJxIZxS4iUo/wZgLuw
	dyAIZ/go2aQREht9JN7R9XDJw+FX7EckjnTA2alJ69BHf94XqNO0u4hT25woXWX/gHRWC95vfMz
	tPAkreNNff8NPfMVEZYQtMjd3u23dI5lOshcX6A08oLd5PKFIoqjgUF24Elu7oSPDKc2dx5Y3ue
	NiZU+/TZ4JrsWN2FRh0SoUc9pnvdNuATgo/HBqA02zpdDQFQ1UZ/5KInEu7l/ZWyCNtSatUOdXw
	wf1DsdX0zQvYBes/LMlUMMEHiC1nKs1Rz2IMm+LLTTovMeKprIHVEDnEiLMfR8Q905V+msT/Slw
	VHxhzE+SS0+Ry1WrHjrhDzgBrPVQtBtkIZ5QwNTtXi77gmR6F0juS
X-Received: by 2002:a05:622a:5908:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4ba6ae973c3mr69912381cf.58.1758168984615;
        Wed, 17 Sep 2025 21:16:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8E1DrYRb0Vx7N8mwDUw8Sx3L6iWLRByHuWqoKFSHq7uW/mIRDRIhwltCpukpzhFqll6bC5g==
X-Received: by 2002:a05:622a:5908:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4ba6ae973c3mr69912091cf.58.1758168984131;
        Wed, 17 Sep 2025 21:16:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a90a20a8sm352483e87.68.2025.09.17.21.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 21:16:23 -0700 (PDT)
Date: Thu, 18 Sep 2025 07:16:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v4 0/4] Add PM4125 audio codec driver
Message-ID: <vi6drjvj5xrqmcx5nooavnz3fsrzjs2fmwx2wrnq25waqyjrsd@hzspir2e5utt>
References: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
 <20250918-heretic-spectral-lion-86fdfb@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-heretic-spectral-lion-86fdfb@kuoka>
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cb879a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=r_T3I_alxc_9WHogHBgA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX5ohS2oDrNg2Q
 +tPcLCB1Xfv2/7sRX73NKUR/Z+r+z6HIbnhqRMUuuI2AkEVMCu+I3YXO6ZNLQpEFPbD1g+EtzJs
 Pa9A09jb5VUY+orTcUxAv05iRXwGjQDrEoovlGAu07S38Q/GchFlQXs8gU4WTBz/orSgAvIWxiL
 R0sNuFn74xl/v+1F8FVMd+iYn8JwbK/D+3o5BKPmIZSEaZg0uIOaoNenaoO+AThJeza3UmnBbxj
 lz2vq4A1m2PwsKpFeFV52ttbOQIRX5l353aIvCzrObVVdqhPevPrjjksJvZSqN9ND/4Tw0xP4Ke
 UmLBLL+jyg4Z4K9SbiuKkWcFl5ZfZCUG+pc6JrRkXdJgxBxzXoVeUh/TXFvBXJBHFATLKWMJJwl
 HipZeKho
X-Proofpoint-GUID: LulcySkEqG1WnzZm81Mdv9y_eNPahH37
X-Proofpoint-ORIG-GUID: LulcySkEqG1WnzZm81Mdv9y_eNPahH37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Thu, Sep 18, 2025 at 11:02:30AM +0900, Krzysztof Kozlowski wrote:
> On Mon, Sep 15, 2025 at 05:27:47PM +0100, Alexey Klimov wrote:
> >  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    6 +
> >  .../bindings/sound/qcom,pm4125-codec.yaml          |  134 ++
> >  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |   79 +
> >  MAINTAINERS                                        |    2 +
> >  sound/soc/codecs/Kconfig                           |   18 +
> >  sound/soc/codecs/Makefile                          |    8 +
> >  sound/soc/codecs/pm4125-sdw.c                      |  545 ++++++
> >  sound/soc/codecs/pm4125.c                          | 1780 ++++++++++++++++++++
> >  sound/soc/codecs/pm4125.h                          |  307 ++++
> >  9 files changed, 2879 insertions(+)
> > ---
> > base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
> 
> git co 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
> fatal: unable to read tree (590b221ed4256fd6c34d3dea77aa5bd6e741bbc1)

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250912

> 
> On latest next:
> 
> b4 diff 20250915-pm4125_audio_codec_v1-v4-1-b247b64eec52@linaro.org
> Checking for older revisions
> Grabbing search results from lore.kernel.org
>   Added from v3: 4 patches
> ---
> Analyzing 50 messages in the thread
> Preparing fake-am for v3: dt-bindings: sound: add bindings for pm4125 audio codec
>   range: 6f3a32745b2c..b40852dc84c3
> Preparing fake-am for v4: dt-bindings: sound: add bindings for pm4125 audio codec
> ERROR: Could not write fake-am tree
> ---
> Could not create fake-am range for upper series v4
> 
> I tried latest master - the same. I tried also next 20250901 - same.
> 
> You need to fix somehow the base you are using.
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

