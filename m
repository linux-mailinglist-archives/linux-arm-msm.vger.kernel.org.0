Return-Path: <linux-arm-msm+bounces-61913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7653FAE2410
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 23:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10F96165AA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 21:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39102367AB;
	Fri, 20 Jun 2025 21:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYjD9sYs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3784821FF28
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 21:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455265; cv=none; b=bkliuT5+ubLDVfCDYdJe9K5tHGxf5L9TmRq5MHWfXAqFEz2y4DaPrs7UfleUC3NoN5c06biHI+k5stw44KwkbjMzwRyPMw/vKCA5q7fqd0CAD6sAamRKRzCwhLJmx+uMg+S2JB5kekEXbbLxB+dBjOV4+Mn43a1ghsznn6jWDqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455265; c=relaxed/simple;
	bh=ddeEOwDx9KIEkwLrqjkmYZXL0t1PupX616M914w3kqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBCY03tTsa8h+se5c2zA6hwMhux8FEfTiXNeFDO+6gHF6XznYxS/dqP5IpxBxvqEQ9goyfbt/S4q4LSoKKvln6NmQstICR+vAPhf9QJfrc7N1psTVGx2WRA83C9d6X4hPCQrsduDTpNynp7bgS+bX+Vy9+x9LbedgmZZd425JXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYjD9sYs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KK3hpJ018737
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 21:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I5eUMVemtx+WOtxG7ifeKcbV
	DLFe5coNfGzblu/bS8Y=; b=pYjD9sYs9RyZ3OEacXtIZo34s/uwKLSE7os3otJL
	XywyPBWBdd44hpHxqtKSefoK6kfj3ndV3LfdD55+Ugvu3Y2ngdyxceqM6UP05c+y
	gv0XI3bNjA5v3W689kVZL2VVDr0aGdCa3lnpJmA0OweikRXYLkje5x9HUp0GZBtp
	P4krv3KP1jrlMD/imeN24LgPuRKTQMFksF+nevf/wc8od6jl+in2FoOLExpqPZr6
	Q56NKsB9U6gz22H5fi3c8CfmS8Mnd0qjqm1IeK2QVbCXGbHRm/vG58QeACT0/fEu
	ETvssLpIkHjkVocbU8B1ObByruqcBjxBnfrcxdp1V62OMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47debc84fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 21:34:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3e90c3a81so192557685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455262; x=1751060062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5eUMVemtx+WOtxG7ifeKcbVDLFe5coNfGzblu/bS8Y=;
        b=IK9/O4VF64Vk+PO2w2F+BCqtF2lVHFD4LHVvwYlzPS4V5ynrUQusaPlDGYSsPShY24
         eyl+1IstwLF0PfUcb4XXLnUhhG8z69XYShIvfxTVGQuVrLbaOBZ3Ftsmt/Jmkx0hGgUa
         X9/FF0m4waIJVjLhzM6YQLEqrPJ1reZ1rOBljOmDLCoLk9vUUqloojWPZsumoq+UMXI5
         7lLo4yv4CKwHpyECZtYKEazpxbhgkweuOUmZX5FZ0BBFuQHwEYBhiDayK4jUBdZF94io
         u+Cs05Uw0r1vuN0eW9wlI4Pi7q0qf3dsrjn1Z/9y1wTOCCZPHDEnZJP1ZUB35MhGRSoA
         VZEA==
X-Forwarded-Encrypted: i=1; AJvYcCXONwjDtrTjyiwGIQTAH3ADgZsaj05bXzS/T/EYRZc2Ne0PKAjGmF5xNRUMjiy9Iljl6bVR55kmaF79emFL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3u3SokZ7IkmmoCQan07Y/HC27UuU/cliIYnSukhjpQot1lCTa
	Kl7fwWfP4B9jEvCebMkEvWAaYR7WO6nMexNYjtQQ4Pj02NCi6B1vU7Kfy3X37iF3qshk6Eq1d+D
	bVaWzOZyo1Mpn4CBTcC1AQRqELdn+aIyYHlOAdLbgmzAtFHsrBiB2328tnDN4z2DPU7S2
X-Gm-Gg: ASbGnctrPBS+PdPvssr7m6GhibaL6BtDVmqjOPvSPqoAhk4GfT/VXxqf235EWKVgDYd
	kn2Hgji+2r4ylLMfrF/deS2TmkHqEOtI4G1P6gNf/4VWvyY135DJuvUVdf4j0YrIaZ04u8w+mm4
	Vh9AXmcvTH0zHH1MoehKuFGHNtc4OejW4uiLiit/j7WD/pEsYWRck7oJ6RbKm6l4Lu0qIHz4JxT
	VeiG7vrrPGM0GVJZHGr0cMPJbutKiB9F7JVC4hL1UGcDDhpQkJrE3wk0d7Nlf4VpzXPu2hdS1zR
	XlveOils+IuH/wkVjeLGAJzbvwfJNdI8FX+LmFsNLK4GuI7dFqksJbIPYcI4ooxuQTLvNOexQ15
	KEhHZ3kM3AsHrKvInHtb7dmogo5GMK5UJNvE=
X-Received: by 2002:a05:620a:6187:b0:7d0:984a:d1b4 with SMTP id af79cd13be357-7d3f98d99b4mr612145085a.17.1750455261823;
        Fri, 20 Jun 2025 14:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQgOg+RQxEGOUR5Axw5ElARrL+47mFou5bAIbvY41SUovy9rbjpZJh1+YdUa1r9WfF2UcAeQ==
X-Received: by 2002:a05:620a:6187:b0:7d0:984a:d1b4 with SMTP id af79cd13be357-7d3f98d99b4mr612140885a.17.1750455261374;
        Fri, 20 Jun 2025 14:34:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cae2sm425057e87.59.2025.06.20.14.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:34:19 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:34:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-videocc: Add
 minItems property
Message-ID: <aswg6zjmyi4pcx75uzfj5byadkx5gof2yfpjcu7fspbuniatrg@dy52pmcrgnoc>
References: <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-0-02e83aeba280@quicinc.com>
 <20250618-sm8450-videocc-camcc-bindings-single-pd-fix-v1-1-02e83aeba280@quicinc.com>
 <4657c6d8-8454-478a-aac3-114c6194b72e@linaro.org>
 <5ed72663-da54-46a4-8f44-1ceda4a7d0d9@quicinc.com>
 <6068badd-8d33-4660-aef8-81de15d9b566@linaro.org>
 <ffe32102-cc55-4f86-b945-ae77a4e163bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffe32102-cc55-4f86-b945-ae77a4e163bd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6TIhMKP9eDZ9ICQYA1EHZpk7qlpiZAUo
X-Authority-Analysis: v=2.4 cv=PoqTbxM3 c=1 sm=1 tr=0 ts=6855d3df cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=SDRi_Ghe60FVfvUD7c8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6TIhMKP9eDZ9ICQYA1EHZpk7qlpiZAUo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDE0OSBTYWx0ZWRfX7aXWene4lrek
 LZOHa4cL0kEFPK+VcVrksJ2OcQ0B7mIO40QAogihhVTOWDM/Ufq0nbk4lyAzZpoz4T1goWN14Ls
 mEZ9rFv9BT8oKp4dyjZLl4Z0nDr4fis5JY+bEL1d3wzfyZHhQT4BhokH4z/QlenfaXp1G7Ab2qK
 A1UwI0G7DKNna1hFBHnlfq8nvthnko/8lN8rlWUZgZ4vHz8SeporiRNU0DcTIzUvPPQNisSRJcq
 jhux4gWRaQZI1QiO5Ycp+SAMdXjlY/Np85uCP2G/Ll0V2kMM/XRLZOLnmH6kzOjjdl+wR7Wb0mw
 t3VQ7jGGuH5lAOaOmuw85u9T02vkTriJVR+DVWnEj2l7YhVGp/nM4wH29X4l0EgsBsjJ/EqF5W2
 UXiBzf0uVERsscaQpWGkOGEAtBv6D3GHKNBTakeWt15g6isVxUcSDH/toWzrDl2CWHoLjBor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200149

On Fri, Jun 20, 2025 at 07:39:06PM +0200, Konrad Dybcio wrote:
> On 6/20/25 7:56 AM, Krzysztof Kozlowski wrote:
> > On 19/06/2025 12:20, Jagadeesh Kona wrote:
> >>
> >>
> >> On 6/18/2025 11:56 AM, Krzysztof Kozlowski wrote:
> >>> On 17/06/2025 21:07, Jagadeesh Kona wrote:
> >>>> Add minItems as 1 for power-domains and required-opps properties
> >>>> to allow this binding to be compatible with both single and multiple
> >>>> power domains.
> >>>
> >>> This is your hardware, so you know how it works thus I expect here
> >>> arguments why this is correct from the hardware point of view. Without
> >>> this, it is impossible to judge whether this is a correct change.
> >>>
> >>> If I overlook this now, it will be used in discussions by other qcom
> >>> engineers, so unfortunately you see, you need to prepare perfect commits
> >>> now...
> >>>
> >>
> >> These clk controllers mainly require MMCX power domain to be enabled to access
> >> the clock registers. But to configure the cam & video PLLs in probe, an additional
> >> MXC power domain also needs to be enabled.
> > 
> > 
> > Then your patch is not correct. Anyway, you should explain the hardware
> > in commit msg, why this domain is optional in the hardware.
> > 
> >>
> >> Since the initial DTS changes only added MMCX power domain, this change is required
> >> to be backward compatible with older DTS and avoid ABI breakage as discussed in below
> >> thread.
> > 
> > 
> > So you send incorrect hardware description allowing something which will
> > not work? Or how exactly?
> 
> So I think there's a mistake in understanding the backwards compatibility
> paradigm here.
> 
> There exists a single, objectively correct and represented in hardware,
> list of required power-domains and the commit that caused the schema
> validation errors was essentially "align YAML with reality" which should
> be coupled with an immediate DT update to match and we forget about the
> incomplete past

I'd second that. Let's make sure that the _driver_ works with old DT.
But we don't have to support old DT in schema.

-- 
With best wishes
Dmitry

