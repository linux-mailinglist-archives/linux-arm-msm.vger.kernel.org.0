Return-Path: <linux-arm-msm+bounces-77471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AC479BE0961
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 22:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2F0B9355184
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8E430BF52;
	Wed, 15 Oct 2025 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oI0tZ5hX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD982FF666
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760559062; cv=none; b=SrtX4XrVIBIDGP6z6mqOwPiklVRNPu/WRMPevDZwCQmwzEDILzjTSyMsu+XroMoLkW+yiKca0dPUcguFsMItqHdMSlh+f6ieTmnMIPLAg90V+CfHJdWHG9j8Pu8CW4bDQ00B5f4zSEQulcit0Q1BP9CLmYbYpFNCPQzDAm+gdVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760559062; c=relaxed/simple;
	bh=sL8XlQVWDbCwMxkOGY+GElcggW9WEH/bRfpKika/kno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWjp8NnPA4/7lLsXNQQLgnRnKctW4c0M47xP0u4BPJc+PnBHgrcIM6iUYGVYBxwnWShmLFvIJBu71BgVakOJavzkaOIpat0stujfVILR5SbKf+qt20Ks1RI+VrKixaj/WHqnWG7AG6bxd+pbEICOVFD496LGt6QumkG3GNZ2AqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oI0tZ5hX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJsNPA004236
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 20:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/t1dCpZdqV7X1GUFpSEVkBel
	pnG5Nvy1baTgwTwFhOQ=; b=oI0tZ5hXRsmVkvIp3yVduM/Fb5Ze08QMasknNW3G
	KR90J6rTB3TA6qEr5k4rZGFN8MkvuZhziUONN+OWllEQ0zTgpwrTJp7r7k0CyAkL
	uWGTVA1maNugwqGSW7Jb4iLoxQxC6csqeF95N/ZVsVfDo/YW4vs2Fbm2TRX6oYsJ
	OQxmQD0DKXRZIRZZaIBHwqIbLsBzUE17U25Br0SU8Zh7veibg4k0zodmDddYsDTI
	12V0P7vnQUydLZUs2QxsA6NaAGuNu4jTKSm8MDwCty3p6Mkml50Aowzwn3uU2Q0O
	dMPQ1qyqIccATaJ5Xy2lpdub07plqyxDGOhhjNM6XYV9GA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwr3b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 20:11:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78ea15d3583so700506d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760559059; x=1761163859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t1dCpZdqV7X1GUFpSEVkBelpnG5Nvy1baTgwTwFhOQ=;
        b=S0HfNquUyS/8go/McSGBKme0Iy30T4Tw0tI33XTEtcQxz5fjXI1bBjHTTg6ZvCSZ+P
         1eE/7qTza/HqVQDLBrfq4yFbGopsY6LFswVgrw5z0jp4hZ4dmPKbWvzEY7yKAiKQbmSi
         fpe+xM3QKi8gY/geuJWgJpNtSF5UPQlpQnmM+xmXc0c0Uqvi1MZBnKRLh8E1OKKqKaSg
         mP8OvnO9G+i9VShv2VfL9VvOxR94lWkyMCYwg1j3soPquHYPjmS/Tcm18qutrxwbNxJz
         Jvhh1CE8nRh8lHxSViwGxQgtZWzCFthanL5LdHd4bH2QVMULpZg4hXhnYIPbU64uuUTi
         7PDw==
X-Forwarded-Encrypted: i=1; AJvYcCVaaEa8bGCW+d5QraX4Lty43fwu/x+kHMIH9idv4kfXN1TwVdcdki9sKwiOMo5Y65QXxrX7vnEjn0xGGoxE@vger.kernel.org
X-Gm-Message-State: AOJu0YwCRrVSwTYS3e+x8pc2qTKrk2zJBK2FFlo6t+4jJzfm0iVbx6kf
	YGM8H2+OGGonApzEeDSZoYhb0RkyYvwuxRmZcplS0iVgiuoG4AX+Ws7SmyivnXB29Y3fbI3wQ9x
	TaPBX7JRtdLrpdsgWMPG9VJKuH3hNVbUBixEvLS162cPqIda944r3DKTedJtiXxFwDUoO
X-Gm-Gg: ASbGncsImI90lMBAPafro6mawiGUSFJmIS2aETJk5z0a465ArTFQJM57/xxEz6KsH9y
	chw/COs3RVEeMnUt2b0y1vr687yq400VIi9aWvxHXhtmF6FybRVOyforJ8gKlanWAhHUENEkqOP
	Y+iPzeAlHHWLYVQLT0buLBI9nky3ZFKFo04z4AbHlQEM2VlOtTqzP+2Tz+ZnL2zbvHmBnj9tFCw
	BMFrmn3srj8orkCCH+ZdTroQaqTH91UrBZIm4xc/zIRuXKJ66RsW8rGkV66TNCiiaZDjzaOnH5W
	H0ywBpVQ79MIPAu1MD7+WobrHpyHrLPjs7IGuIqngGqwS925+pVq5Bp1Xa8EV6ykNH2Y34hnQiL
	A9hzAkFmhmYVDHcAgOLw6EZm8T1AKw1FydZ0e9Qc69b7gI11HKC6G
X-Received: by 2002:a05:622a:1894:b0:4e8:8590:f9ab with SMTP id d75a77b69052e-4e88590fa77mr43148841cf.60.1760559058839;
        Wed, 15 Oct 2025 13:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/vQDmK813/cqY6aMyybRLQ+i7/pAaAqNshFsyxlW1nEMLUL7OVwu9YAiN7ac2zmKIZfOPGg==
X-Received: by 2002:a05:622a:1894:b0:4e8:8590:f9ab with SMTP id d75a77b69052e-4e88590fa77mr43148541cf.60.1760559058211;
        Wed, 15 Oct 2025 13:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088577f2csm6516484e87.107.2025.10.15.13.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 13:10:57 -0700 (PDT)
Date: Wed, 15 Oct 2025 23:10:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
Message-ID: <56fcl2ip6ecu4inig7ecpjt7qrsdt6sehkrzrk6joysbp6tea7@4xdgxhhe3aso>
References: <20251015-topic-qciommu_bindings_fix-v2-1-a0f3c705d0f3@oss.qualcomm.com>
 <8e7a145e-6871-4974-ae19-40699747803b@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e7a145e-6871-4974-ae19-40699747803b@arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX+8b2L5hyLeSB
 gvpdcrAiesY0I0ZChf5fpBfcrNL6O51y4MDAowtgMUOccNFdw9EffCVagIPvtifbLG6LzhNxsOy
 dHOxH1bYrm/09K5ZqiAY+2x9sRA/rrK3yqE3pdFTWQxDeG4eHRaB4XHGbBHQEsOvXYNoo0Chsi7
 PWuoaR7QJD1H5RXA/GOlDUYdh4xY+GoRUzrjQIxboRalwKqtS2/As8D2191A78DoByEeikusRRq
 kqYe+TDVS0jUUkrixSzh/D7crB2kCKuyfjEFq9wDxHLWZE2oOa6PhVBN5BJPJ41k9vB5DHSufzW
 ZtOKNgLWuWSy1p0p8rjyYnl6lG4YY+tMsRpVV9nVMH2r0yTR8wvBdUWbLbfiWSaRE3a45BOBCCs
 +pLCnhZNeqGTWmn+2iHeN7VJ5oqDjw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68efffd4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=0xTHEX-RkNz-9oJQ5AgA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8dnP_x2NSMM7M7I_I0QQ4A1a3QTKKV4s
X-Proofpoint-ORIG-GUID: 8dnP_x2NSMM7M7I_I0QQ4A1a3QTKKV4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On Wed, Oct 15, 2025 at 05:48:05PM +0100, Robin Murphy wrote:
> On 2025-10-15 5:41 pm, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@linaro.org>
> > 
> > Some IOMMUs on some platforms (there doesn't seem to be a good denominator

It would be nice to provide some examples here.

> > for this) require the presence of a third clock, specifically for
> > accessing the IOMMU's Translation Buffer Unit (TBU). Allow it.
> 
> Hmmm, but isn't the only thing that accesses TBUs the consumer of the
> qcom,tbu binding, which already has its own clock?

qcom,tbu is only defined for normal arm,mmu-500 platforms. Here Konrad
is fixing the older and more obscure Qualcomm virtual MMU device.

> 
> Thanks,
> Robin.
> 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> > Resending from a 2023 megaseries, no changes
> > 
> > v1: https://lore.kernel.org/lkml/20230627-topic-more_bindings-v1-7-6b4b6cd081e5@linaro.org/
> > ---
> >   Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
-- 
With best wishes
Dmitry

