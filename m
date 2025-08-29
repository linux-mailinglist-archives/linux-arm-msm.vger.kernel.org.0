Return-Path: <linux-arm-msm+bounces-71241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C953B3B709
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 11:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BCD31604E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 09:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B033043D8;
	Fri, 29 Aug 2025 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRyib/iq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E08B303CB2
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459254; cv=none; b=OeMONM4kywpKa12iD2Z8xuOu07T/w8LWLPYJfNmXnsqQHrGT+SGZGBUGKPDNb96amrRnG6i73c9FNsqETJJIscxzUPOjD1wYyTskVsw/x/cxmwZiuYvgb/VWgX5gQKQ+rc38GOhaqLyuDqRgrrExAycLpJl4nf2PM3Rsx4EZdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459254; c=relaxed/simple;
	bh=41cPbZW2JuUamvHD0ni/4zW5qEt98VIFHzay0uJyE64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIwgxM6F0MOSPsmtv6Qdwcq7vbF66mXdEUsNfkHG6jtSg7PrBwWr+vYO4EMUl/UbuvPh23mz9RypUxUI6c0xYL1DJs56hlMAUG+/cThVXKyftev/TxncyXZ4qwU6c3oTowyRbos+Lb1W4k14obiLoAdUoGcSGF8mRbiUokFVm+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRyib/iq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85G99027404
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 09:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VsGRi9TWtut80xRESvMijlEz
	Jj+9BIG8rviOsUN+Q2w=; b=DRyib/iqMVUgY+4U2/xa1PZEfrNYqH+CO6TheLAM
	f754gQa0ypq9f/ZcukNVmys08FJn+FxHy1J22okyW5Sb8nIUWpHGAjLDQoBaSNyz
	Kv/+IfVKWqKJMBfn2XtQMUIC/lj1JBTbjMudKe/c0HfCVJCrclLXhYwxIr44m4Sy
	cyyl3s1k3F+H47dD7qF4OHNWDkXq3KGkP/uj15XGoBit9PPFJSTpwnYbaJlP+Kqv
	TpVVCx8N0k0FHJGoSYDC7Xk6lJVFiZklYyvXo6qOCXfbynPAjcT0VUMuqqPmfOhS
	Ze80Ap2WaPsTEU6KQ1IeVoOdZPDjKLV2RztEoLrPWKEMYg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umkhf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 09:20:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70deedd1deaso36039186d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 02:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756459249; x=1757064049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsGRi9TWtut80xRESvMijlEzJj+9BIG8rviOsUN+Q2w=;
        b=Cgcy41LtMP8ic/7YKOPo8FAcaU9M3FUgFNfbvjYm15xyVcKGVTZQ1YJa8PgJYRK6t4
         17XkzSlqAH8vYOPkfU5iyG+x30inWlV+cJMQTCLqbOCiF86l2I+9zwjGaFaEUEe2xSgo
         dX+Y8O9brw2nwqNQ7aLcplRgwnWu1Zz5Jl3j85ICCII6OllHHt5u5eEi3O08sRgcL6Pl
         1bNBIfr12i3GL7HTHsuFKLjZBhW+H/7VO05rFnyz64669XndBxrwtzIUbP5zKku2dqZy
         kNHaXQEThO6EzADGO4xZyvAfblgU54d1EyrBjzwM49XCw4NFG4lSHAtDYDpNkoKdF7tg
         40pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq1pxPkovoZg5aOfjcY/6JKCUAIQ4YwE88m6U9wdh/AlU/OV0UWl0pBDMHDQa+f5sxat0yCKaQeu8QkhL6@vger.kernel.org
X-Gm-Message-State: AOJu0YyCtllP5U7fnucsmq19Fjr+TNEq5UY3o8qhFbCUoeU10FUDEzDF
	IkauKXH8Fc2rXmHAXTEl95xaTapx/8CX2Aq6prwXHSETeOSQ+DvKrCWd4lQWj2/6YmCfDeq1HxR
	jZoa9K65jmzgSi/6XO3sQsC3f603+eXr6bm6UpnRDANNJKsl/e9ZPkXb2fgAgPwdawB2t
X-Gm-Gg: ASbGnctwst6qoQ+TuBcX5x9pubgR2pQw265rzlQHBYuj/orAgM/U/KIx5B2CVh/87qL
	8UE/SC4BqW05TG/iqXmESQfL0ELy+je22SOZOLqZ2wxTQUCy23HyiiL5IRwkBUiR0iSh1RN9L2B
	FGs+/Z14ai1HoUXrPm+KQKOSUidH13aZOGPBm7bbLLImd63n5PLb1mf+VpqsuzuBNYbdQCIBzph
	wqnvH9Tx160Fhn9zrH/lO5qlKq66ijkyIWwry5UKamYxfTOFzZKvRdw0KRVDqZasB2OWGPWxwK+
	Ds/4cddejfS8zUUh1EBep8naWFDn4DIPeEt2MVHRaZ+kQFyrvoGCxEpNBAgV5+6W7zXG4HaKGYx
	1OGLheGP/DOPsxfC+xhvEFKT49RgoxpOMF3xa/SNL3b/rybcA77H4
X-Received: by 2002:ad4:5ce4:0:b0:70d:d5eb:cb09 with SMTP id 6a1803df08f44-70dd5ebccafmr134046296d6.20.1756459249029;
        Fri, 29 Aug 2025 02:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu+l8+GZuUy+NaTPLiPmyXfppCCrSzXfTWjiiARcq2CiwkxvRqPIvCjYJyzT2ulw8LGLrwHQ==
X-Received: by 2002:ad4:5ce4:0:b0:70d:d5eb:cb09 with SMTP id 6a1803df08f44-70dd5ebccafmr134046086d6.20.1756459248542;
        Fri, 29 Aug 2025 02:20:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336b9462e97sm2472451fa.11.2025.08.29.02.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 02:20:47 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:20:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, jic23@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, lumag@kernel.org,
        konradybcio@kernel.org, daniel.lezcano@linaro.org, sboyd@kernel.org,
        amitk@kernel.org, thara.gopinath@gmail.com, lee@kernel.org,
        rafael@kernel.org, subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org
Subject: Re: [PATCH V7 0/5] Add support for QCOM SPMI PMIC5 Gen3 ADC
Message-ID: <nsyhau4pnn2nbxdf35npwq4gvjiphocrftrwi4seirxqzurww6@6jgyzzmjyg7q>
References: <20250826083657.4005727-1-jishnu.prakash@oss.qualcomm.com>
 <20250829-demonic-soft-guppy-512c13@kuoka>
 <zgm2k2osmasdal6anba66pw24a7fiypgwlf3c36kvteshz7uef@wee4had7x54u>
 <8fdc99b6-4ad2-4a08-9dca-6289c8fdddd6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fdc99b6-4ad2-4a08-9dca-6289c8fdddd6@linaro.org>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b170f2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=cXZZpXjwJqeueyEXUCgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX0X/CA9yD+TJz
 5I22dWLlUUnth+PHJtSkdHvS5S9xAiHyGvyABcx3wvBBRjWX0jp17khdr9NkIKoIoXT0aNlTBRk
 mOlr93MzuOFDGRQ9n1njCyxt5FXvFDoyj6rq7u2G7PaG5n0loj/pWPavlkDM/LwlC9CWsPr/1en
 FRrhpNIhTSs2LQT7x29p7KQ0mKAgQ+BVFY9xhsBdkh6n4TShtl8VFavuFTOhGot62jFd/fzVjK1
 reaJLPiviKOQa1fWsiYVcXAxIU5o71U7XW2Rd6EPR2Hz37YL9xF8jyYVTL5BsWFMjIbrYSUa4YA
 dcOar3YS1jKuLqeTM1UKsg7TR2uOUwGbBpM251DdzoVtbQdaGTS7/cde3xlgXFC/2lymT1k0W49
 oz2jCCvQ
X-Proofpoint-GUID: w9sy45xiKjkGAlCTFNnsZW7gO1UMidOZ
X-Proofpoint-ORIG-GUID: w9sy45xiKjkGAlCTFNnsZW7gO1UMidOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Fri, Aug 29, 2025 at 11:11:48AM +0200, Krzysztof Kozlowski wrote:
> On 29/08/2025 10:09, Dmitry Baryshkov wrote:
> > On Fri, Aug 29, 2025 at 09:12:59AM +0200, Krzysztof Kozlowski wrote:
> >> On Tue, Aug 26, 2025 at 02:06:52PM +0530, Jishnu Prakash wrote:
> >>>  create mode 100644 drivers/iio/adc/qcom-spmi-adc5-gen3.c
> >>>  create mode 100644 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> >>>  create mode 100644 include/dt-bindings/iio/adc/qcom,pm8550-adc5-gen3.h
> >>>  create mode 100644 include/dt-bindings/iio/adc/qcom,pm8550b-adc5-gen3.h
> >>>  create mode 100644 include/dt-bindings/iio/adc/qcom,pm8550vx-adc5-gen3.h
> >>>  create mode 100644 include/dt-bindings/iio/adc/qcom,pmk8550-adc5-gen3.h
> >>>  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pm7325.h (98%)
> >>>  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pm8350.h (98%)
> >>>  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pm8350b.h (99%)
> >>>  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pmk8350.h (97%)
> >>>  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pmr735a.h (95%)
> >>>  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-pmr735b.h (95%)
> >>>  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-adc7-smb139x.h (93%)
> >>>  rename include/dt-bindings/iio/{ => adc}/qcom,spmi-vadc.h (78%)
> >>>  create mode 100644 include/linux/iio/adc/qcom-adc5-gen3-common.h
> >>>
> >>>
> >>> base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
> >>
> >> What's the base commit?
> >>
> >> git show 0f4c93f7eb861acab537dbe94441817a270537bf
> >> fatal: bad object 0f4c93f7eb861acab537dbe94441817a270537bf
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250822&id=0f4c93f7eb861acab537dbe94441817a270537bf
> 
> I see:
> "Notice: this object is not reachable from any branch."
> 
> I guess you think this is 20250822?

Well, it kinda is. It's a commit by Stephen, it has proper contents,
etc.  next-20250822 is not a branch, but a tag, that's why you observe
the warning from gitweb. You can verify it yourself by manually pulling
the tag from the repo.

-- 
With best wishes
Dmitry

