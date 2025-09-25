Return-Path: <linux-arm-msm+bounces-74886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D0CB9D33F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 426C61BC56C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6C82E8B71;
	Thu, 25 Sep 2025 02:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UaALzCdV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE59C2E5B10
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767558; cv=none; b=QwzP8otkfSy522F8l5SBVSG57uTV5hwEFCHS1VD3P0KJrUqZabeKrq8ex93yBXkCtc6X/mlCxpVqzz99FiI0R5XXxAb+nwpc1u3dlWHOOOoUXVd8FVpAb7kXeZhLiOS6SSWZ1KeBZjKFnxrK9YfpeAFa3BNkT5sPBpNL73ncgz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767558; c=relaxed/simple;
	bh=2esFbPJwuZNBvuWMWMGHgBr2T2aPcaPBSG9Bo+tbOBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAcNMdhvMTZewz708WLpnah1QnPKgE+uJ0ma6WuJTKBTQv2j7L1ZWommMVSj0ebg78+cSUf9/XwxyEXYIY6m1848BpYvPfzKZ1w+9F9yOeM/gzAsM6ERziQbNfSTqNfqLFoOaL/DlJIHU/JQYegRPIDN9IQ7yAihj8FaUmcUjAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UaALzCdV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0mPIf029712
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WP6034qc9OdpvRUZ+H/itl+v
	tk+A7rdlL3cpQBd8BR8=; b=UaALzCdVvMwadCXCuUupOm0S1BaT2tdFQFTFGMkV
	9RZo1XCqQs2BsOP3INZ01lNXnOXEvVkWCDARxQ7RICiGAg/gVhw9ted+i6vREZ46
	efHVe+eExc8PLhtd5enZR+RBPSFpkcaxcd4vTQrdjLHcl/Mf6Eqc/YHCLp2fKoNl
	wBS0e2kf09AwPDUDhV6oRCC1JGLnWhKmaLc6qzwht3iJe2F0QEsH6ZHuQzUK7eg/
	uHmtG6LTebQs2cm90Xt5JrRKOHCibGgS7ULkUlXiXbcj+njcFkyEtVc7eporB4DH
	cfYNGy+9PeGkAFwtoPI/+AUopZkUuMKjGsKKQ61KoXs7ew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpbas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:32:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d7f90350f3so11563461cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767554; x=1759372354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP6034qc9OdpvRUZ+H/itl+vtk+A7rdlL3cpQBd8BR8=;
        b=poNhDQxRdYFlgDOMJbKjCnZ0ILg67smqSWSKMw02LRxj9rycWA849Madoc7ErSylYK
         v1RwzVzMoTBSKDu+ip6XBprOjcdZrgsGJC8IqNgBC3iyoCHXFpbbIvsAIC+UZZPnxEiV
         LoNfUnoQG40re8I8gVVOe3iKyIO5M5zJJPJPxT7bLbtO6hrcP0FEi9sLyvxjGUqr5Lo2
         ZNDrAHqlDkB23jEVEJ4JcJg+0FEOsvBqGdapAJGXywSrWpK9OtyrNF8pwWIPA2w2Vw+t
         pcpyXXxTkBGLA+uxgpUAnXYtZJ2ncGy3N2v8jUYMRX12Af2wNgZPZzxNq8ymp9zVSnIE
         YU/A==
X-Forwarded-Encrypted: i=1; AJvYcCX1mDuOe707lgtYCe1Vol2hgpmvNiGosAtu9lY3mFQShMey8bg5SokgdEC8TzmEn5IHDW2LF220b7Blg0pb@vger.kernel.org
X-Gm-Message-State: AOJu0YxpsEu9RxB6Kq9NzpXEBh3C0loz+Hh+VLQOeUwJ83lf914QmU28
	IjNsoOupsHOlkX9K+Z0/BaFZ4mu5PAg8CgDJ3HpZhPH8SvrZ4wnNgujh1C+X96NIDd0KsYZ9pD1
	uutET5kwdXpsYsKO3Skgyh1JUmO+s4oAxEPwfEM/iGqczDf3ux5IMnbGCplcvdgyF8zsp
X-Gm-Gg: ASbGncuZ0bMZo8sRkE6L0uVRPr16uFmQL9jJSI5eBu5Ike+D0m05Eur9gOSWQoLXcry
	b6+zhnpbjf555GT2m7ZfwIw6VdG+Jm/lPjoCAOa5i5hTt9JJsCmMHebJubRmo1VpejCgYnQ7nXI
	sWvznPrpKbd4B6YDT9/HvEZksok8eWqz7+0M8IM/U7boDCbtgTEtTAO1WmlOVBymE2JpgUDr7y+
	jqB4iDRqMFv6SJLE1mXzi6ihewKK8t6Czd88Rmtms+EHm/b0m0rWdfaOx45z8PEli+73268s7xk
	kNdXz3W2ePyQ0R+NUgqUlRprOyOtHRJH+GaRfFi4VkhSMW9d4MtuHXJVLxQFxMk//FhHULZGd47
	EXGaKGn4rbu8V1wLMl3zr8zlGVawH/mOAGxsQp7TAt0ZCMk3o+79V
X-Received: by 2002:a05:622a:190e:b0:4b7:acab:852b with SMTP id d75a77b69052e-4dacd2444dfmr11870351cf.26.1758767554447;
        Wed, 24 Sep 2025 19:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa2IDBVMPJ9g/d5ctxxzydrjUFXK6difp7z1Bg2KGvP8iuKn8/jevRHGqUMRizyeUvFoawRg==
X-Received: by 2002:a05:622a:190e:b0:4b7:acab:852b with SMTP id d75a77b69052e-4dacd2444dfmr11870031cf.26.1758767553939;
        Wed, 24 Sep 2025 19:32:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583171e50d3sm237438e87.139.2025.09.24.19.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:32:33 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:32:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] regulator: rpmh-regulator: Add RPMH regulator
 support for PMR735D
Message-ID: <7zxx4kcplkfblivww3b2cm57vgkp6tdspmptor45w653xcwjtx@ziyhu7liqnkh>
References: <20250924-knp-regulator-v1-0-d9cde9a98a44@oss.qualcomm.com>
 <20250924-knp-regulator-v1-2-d9cde9a98a44@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-regulator-v1-2-d9cde9a98a44@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WF0FQqiUY2O1Xt8R3zQwThJn7cR4qGc0
X-Proofpoint-GUID: WF0FQqiUY2O1Xt8R3zQwThJn7cR4qGc0
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4a9c3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B0fzD_Jn_k95df8NiIgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXwVe8BtxfGCAY
 /Op1/ZnWYxmr37DkttkU0q3XpmmvjGIgbx9cg42YYCZMFf6ZtliylxVnuo0LWWn/4tPjfAR8sdb
 Cz2v4kF59gjpIU5JBw/bBisnRQDY4hAm+CEE8YnXSiapS2KKN1vyVzrdwHswv7xUXHdaqg9D6m7
 EY17+cicYD53DH9GZJcIoNUIEVoTNH54NUAEE315NDEfO5Ngoma3HmEbTsMoF2mA6PnuKPb+LNt
 PciwuuCHr3SI8z2kViVTtLYAOy/n+0fEqzKYMOWGgtih1e0J5aaaKr+bp4HDMGbHRrRss358waJ
 lo+re9u50ZcclclC7lYtGsadIKxTwe5JVNVywj2SFpOEzFvaQbDoOc6MpHNGtVXqOsIrIYaDNPR
 L5gA4rc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Wed, Sep 24, 2025 at 04:30:48PM -0700, Jingyi Wang wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add support for PMR735D PMIC voltage regulators which are present on
> Kaanapali boards.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

