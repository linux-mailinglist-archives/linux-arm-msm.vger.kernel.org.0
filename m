Return-Path: <linux-arm-msm+bounces-68314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D1B2058A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72BDF7A7B90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0E42248BE;
	Mon, 11 Aug 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMyw98jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E2022A4F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908430; cv=none; b=eawjS66B8w5CfjuN7O9ARzlEbfjLuS/O/7CSI0pBAYj/SE6BJbDGdOYe1sZfRQFII5pSsGi7kftzCGyP6rZcOOj8W1qG1DKFBbb/1aTSsBrKbRVLlXY3NBFByRagFx8VSg6GWk4l4JDA7g9APlCJLTgYdieORahAcoIeJiKQSww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908430; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUJRGXKYccj2HXMjMOzbeHcZJdcDX3tDkQA/jpDfjUZq+gx9UuUrU1lfynOPIfgy1v0OzkOtaC/OGG4zqPQoErJ2nRsW1Y3+dKtbSJSnSaB+kIM3uTAP+w1CRZdJHNmYskz+no4SVHC6gaqAS2UX9wcdZJPwFycsSoCcQhCI790=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMyw98jp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dG8F029264
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=WMyw98jpN7dFuV9+
	Yu15OlRj+5Qv7PUFwt0BSU+6s6tZycYVWK/ruJYvkkNgbufHn3KH8UK/yMdoMt/F
	YQLO6mOKbEqbCWadvtBiTKhka5XR0Ad6e1evnoPxHSInZd/l/gb/TUroqcK0T8lt
	vuZn5C7x+86jxq+biDBWIlpqjHsgoKlEwbA8hRSDwnlrOt5XKc764sYiXru2E6BH
	OGzNVvMvQlxPQnYbD8jedvQDZgiwrEri2wLw8Qx8u3XXteytA3tFBgN2F7tosxQq
	CJ+4SnwmZM32zOuMBzpllDQWfMExHL1HZ32Fwcv8fwwOp8t3RFq+NpPwyMCguUp0
	UurXzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbygc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b071271e3eso10786061cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908427; x=1755513227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=bDdPw4m6HwfUbxQtONaot108XRZ8M87ZrHyW7rq2rm0XZhOABc0DASu6SVzVqJ39c+
         H5TErgVoGZLCxuL1urUilaSiqZUowGxDF8O+vbz5pcJttqIP8Cg74ZhH9FmSFvYR0WNc
         jYkSmaTyaEpdXwlwrh+CjHIHVowA+uf/tsHB5QH7nrowJb3RjuccYGBoCOXCioT2eB4F
         tY1Wa8fI15LqxG1ct1pp8wreRWvjJmi9k+dLtn6jXQIWGaPdTWbx9rXddnpwuSv6EdNC
         nKzng4G9Z8a18BavrZd2qEmbUuMQUNaaeDg+jiaqrj00VPKpELE9f/uThTpHf00624bd
         /35A==
X-Forwarded-Encrypted: i=1; AJvYcCVEGksNE3nO+GW7T1d/JXZnq5U1fv1k1fvZg43pU+rWjWKYjUIClJ1tchUEPUx+WI8QO+jrUnWhU4/LrXoL@vger.kernel.org
X-Gm-Message-State: AOJu0YxVw1MZPYeFNoPwZB7gF2KE6blOtip2K6s5iRSJLK1ltZyBnWeg
	v74B7Ekxe1VV5r16cea98hMzWpHEIUYMI5nwI3blUtH/XUBsB0qtGC1RfiAxWBsplVqJ/ComJvE
	noOlD9Rz81K74dykME6Bv3TDKkvAifGOcgYxsULDbY6dN91rGZKuGQcK7ZnXjxkVNdP+b
X-Gm-Gg: ASbGncsAwmlpGjskp8Br425CzY8oveJYx4L3plTsu2Xy2VQjpw9xDBeRU4OwYbA8jTo
	0ebnyvUp9WLWA1Czp92pnfIrGkGc4hgA8H7LWoWqpTcVDQ8m4avZsHYTWstj7qBv6uhzD0pl4lq
	Np2VYvRKAvR6xBIWTdiqo3iOOaGo5OZjdpakHg4eHvsrHCXty2Vdo5WUuHWOsPRZc2pApOG0wEt
	I3NCNOPQWZWIvltffkrBUz4p7mG6xkpVJScrUVzE4cTwPtdt7saxpRJU484NhLQ7KQUxV8W5w15
	rty/TTc4pFB1x3tvkhBH11ABK2g3A0BL3B2istcG4fyRIFr9uVgfOJY6+gsAVK2fxDwq5u5zXvD
	gChRPKkBgOHHxAVb2ng==
X-Received: by 2002:a05:622a:cb:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b0bec78c73mr59284371cf.6.1754908426877;
        Mon, 11 Aug 2025 03:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7IhssFNIcGhOq/EGToUOu4T70RVm2dw0NQGyrObWdTLIgVbBy5n+ITh6LfbnZCeVTNL5pEw==
X-Received: by 2002:a05:622a:cb:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4b0bec78c73mr59284121cf.6.1754908426385;
        Mon, 11 Aug 2025 03:33:46 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:45 -0700 (PDT)
Message-ID: <727350ad-720f-4751-8348-15914072ddfa@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX0auasi9PuJwf
 CfdfhrFOEflTQCqzJiZVYyQFO4qAVkL7bKibBT/zZGrmqg905U0szwdDZbgMqQTHMGdNMkzgt2o
 7zb9c5n0aDIc92ydJFsMA7/9wDBfCW5MLT4iJcAHqyP06hUDKAFEoxZhRGO+I1zWPftlu1LTI/b
 frgVI0c+CEyQvCKefjnrwSikcNZoW9Bk2pt8CZsIRKUTlaHtBAh4aiXrn9UNsAPt7TcX4JpOpbQ
 sI55tZoKyhQG4eWL8pN2b0KvWW8+VyZX3irT+oBRlaPttyracVgxM3UtK0PlOMORfbptY1t6k52
 aN7KyQFceOmyTi11CIARX1U7U+rQ2bNl22d0CQ4wHyswG7KoFaIAFKXaVZS8pJPi8SMpj2X5uBn
 RmlWH7dV
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c70c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: s3Fpx27EGf_1Fg7HSsM3zq4UPKCpNdiA
X-Proofpoint-ORIG-GUID: s3Fpx27EGf_1Fg7HSsM3zq4UPKCpNdiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

