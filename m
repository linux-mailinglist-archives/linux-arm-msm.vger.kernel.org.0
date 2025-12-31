Return-Path: <linux-arm-msm+bounces-87137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B90FCEC5C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 18:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4D13300D164
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255FA2BD013;
	Wed, 31 Dec 2025 17:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJMm3lvy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrM4Zjqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B21E29E116
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767201590; cv=none; b=C4k0NEYbkw14Yfp+WkwXmYKC4OINjtT6a1yKDL8RRR/mk40hohxp9+Cx65BZ14q9/bEG971FdKnARyzn8KHd8QGqv9rreRbHibksVRIbXAqFyuSEMKTnLFhSUZzqpYu8W1nn/vRooTSlKQomiBM9/1kR3h/mdn4F7c6NJmBBSJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767201590; c=relaxed/simple;
	bh=id1IeA3bx5TmCwoJSrmQiUecH7EPrlkffZHJvtfx5nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J10Tm9WdVKOzCR7JhiXgvDx3xBTWjun4XUNZYXzbFbx96VXaIkB8RhCJCRevY2/w5B/8iKng+olQDPSPJgCqEFsc2DyqFLmueNStdtNyNvESJi88y2+YuWoRJ95kCET/DN36vK9+1l/PBxwToUns3oRTUdOTljZEavfexYMmoEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJMm3lvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrM4Zjqh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVDItRR3293302
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsVwhGeSNZjfI/xypJprbyAZCILTaLME2r61MFMi/rc=; b=MJMm3lvy/Y3eQX81
	p8lLCK0eriJYaeMJ6JuMn/cjt07FjYOWk7wUlpbgdrZVZ/0dNvoxqBbBTuN7l5hW
	mtemvEHuwI/+iEq5whqBp4cOPxh735vyuvtI1YeOeccb5T3jDEM+cKxawQwcXSWj
	vs78HRATyEEzqVdgUZsBHNLOcPT1H2y1o/1/28mnPRBBJQ+lzBEiB35DfUex70qb
	SI38zYCmFz0wOU8y0EmUaNfE9KCmrsMChAM5QR4p3p1tqBRwphStt29mkAXtwI2O
	2Ol1TxcPwliGULd+EaWKVo3XSrQT/5JgYXydZAFfYBaasDNKq9CbkMuw2OGlJa97
	q6cKQg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88ym1yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 17:19:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dbd47fb70cso28383743137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767201586; x=1767806386; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FsVwhGeSNZjfI/xypJprbyAZCILTaLME2r61MFMi/rc=;
        b=jrM4ZjqhfULXxiUCDQ/gCl13rO1gnr+mGDTjwFt1jo3IyHC0g40FjU1qjGOOmJT3Xs
         khhDoQ4Vkj3u1yV8WdX7d2Aqg3kjQ/VTyLHCY7iEp0m2dB2dSLI1vz6XlIZ8jlHUnJzB
         VMCg/3DU8YIgqUrRJ1qWPdQ/NIo//peyEMKzRDEZ8HNd00jestZRGuJ8ewaVoCDVOtjK
         2qJIEPt40O5EF7a5wd1aItGT5Tjq9d233Qri64VHZBaer9qvqVyiDdaAySmRz6fmNgnq
         1mQgiH55vo7x+N5Plh/yre1vDQycCYIzBysxzdil737e/82Pq9II69Vqkj0DKogJU2cr
         QTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767201586; x=1767806386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsVwhGeSNZjfI/xypJprbyAZCILTaLME2r61MFMi/rc=;
        b=v7X8Mq4nRcC2KJYHfvk+kkEvzNFTJ0r1qRcOSU6F8E8YOlJ5GCwkY6VD6fcgv1qJLx
         x06ZMcaioZiX/jN5vpNm3n4KJvcjOoewEFHKzNLnli8Go7zwiGXCYzfFl/wdAFFR1CM3
         dWK37JrZmZqI/XDlPO5s4HNxZUqEqvyaiaTdVu7Jl2M5Y3gO7wavN8lrfjrmVDKwkm04
         r2VlBdrHxeXD7cfwL9tUZBezfmWoAYY28Dao3IDx4IzXUmBGGYs2EPdBUzFtGj/pGffV
         L4EiIMLrJNvSMDEA54g9iKSQ3YiSOwElW/kv9aIk85V3l5PY+LudwS+AlUcDz6mR3BGp
         iheg==
X-Forwarded-Encrypted: i=1; AJvYcCWFNnW0xs6fWT/h7TygCPtPrdXDGGZrFSPW+kXQuRne1W5FDzTDPwj5/DyL6byJn2t+7+VqnrfOttCes9/F@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy34Mx8Yl6BlvR+Dv/werGB/vvKUpZqhUv0Dl0IDhQQeh3DUPj
	7ureV9bu6AXXMwis01l9XTtSstCiDF0+fByf2/xEKr6r2151oKse3fXHs1ll86wEMhCNNhTQ5XF
	TcFfnTYLjlmpi80dyw9iu53qzEMG+M4Ew1lJGTRwoNj1A3wNUadAme6a93IOVxUAU+kJI
X-Gm-Gg: AY/fxX6wa9pzYaZ1FMcSMbCRfGXv+AX700knSOaL1nOFNWHJHIWlsnHopaJ00e3cAsw
	SWpY73bO/szFp8cGyq565aGtbrEJcRT9DNyeYDniKkuFrDY+eCNy8W7wa5GxmwUxdsNuFdYEIo0
	OpyfDBbEBfTqlVvHDiuepDW/U06haPx2T7cbq9c1lzfgCbo2iEIvGABRYy7am/0MqdVeAID8IQu
	qj+02Kr3zSHFRyLKLl5aC4rxG6iBt42LwciBGf+TBUYuskiTKBLD+cvEbofc56m6uxBr+fTwj3D
	trdglAxGztTium57JCEUX/ImH0/Tk1WcxEuN7lvTGaXdhfx4Fkb+3WeWPrq4IsqCUoRvxO2DFos
	7aHMbBKosQqwu5TkqFlCkr3vPVYDE4BqZYY8u9G8WBKv276xNgEpRNng/wUJufpYQrRYe+IZ2v/
	oTQJbDzLHCCoQeNDlRynXc4E8=
X-Received: by 2002:a05:6102:6441:b0:5dd:37a3:c389 with SMTP id ada2fe7eead31-5eb0237d5c0mr15223324137.2.1767201586366;
        Wed, 31 Dec 2025 09:19:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx3T6dkQkJD7EfRSRFNeeLsOEG0OrMkSaoi/pwalLJ0EQtX2UMRuBKbYrQVKniuFZcoxPG6A==
X-Received: by 2002:a05:6102:6441:b0:5dd:37a3:c389 with SMTP id ada2fe7eead31-5eb0237d5c0mr15223311137.2.1767201585958;
        Wed, 31 Dec 2025 09:19:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812267b184sm98222551fa.43.2025.12.31.09.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 09:19:45 -0800 (PST)
Date: Wed, 31 Dec 2025 19:19:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: talos: Add GPU cooling
Message-ID: <gwrg55ytewfhlz7w23yl5ac2sjic5uise3cv7jnmuahnolompj@jl7ufr76wokb>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
 <20251231-qcs615-spin-2-v6-7-da87debf6883@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231-qcs615-spin-2-v6-7-da87debf6883@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=69555b33 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: jgx0RU88R8DuuzwsiXVLcme3N8CHsTJn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MSBTYWx0ZWRfX8GIHUFp74l0C
 zN2nlNrVKa6uR63WSMCFh/iR74T7jSvu6oNSqDHJrvvBYYplsDI1j8uR6su77QcTwAYYaWpJXAO
 YCPe8fzAkip+G/usR36cUyc1B0pBbypjYJMy6AvdcSzDKx3N+Bp6qaAOddoVfooAr62Z/3N/8FO
 4h9OlJTcpAM4ESzBafuzdZ/l5K2sKV3+If2CZLcKhzlq+c2qQwNJfuur06uAP0j75JYwfQ9pCmT
 AI5Lq661fCuHChW5fRbHvcI22/SYhy1mdeavXPOsJ0fIwLxEvn2agobRGNlyC8wuFNV9Jw3P/pF
 py9Nev18mDu1CI5mPUQfad+ggiJxZMSwJYDB6aTzFD6QIyEgtJllpDeoGZiMdXqeSGpOabCstsd
 QPt/0+9RPskpRe1BnpBAWxhnu8jdtbVdDCtYE1nEcilzkcvspZSNmYPh0fecrSMIjXMy70ohsNl
 Jzr2GjS3dYnsAK9zgjA==
X-Proofpoint-GUID: jgx0RU88R8DuuzwsiXVLcme3N8CHsTJn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310151

On Wed, Dec 31, 2025 at 02:15:28PM +0530, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed when it reaches 105°C.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

