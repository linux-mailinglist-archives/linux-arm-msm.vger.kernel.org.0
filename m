Return-Path: <linux-arm-msm+bounces-68815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC4B22AE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 16:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EBEC1898DE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F02C2EBDDD;
	Tue, 12 Aug 2025 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0ZjKE3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9082DCF44
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009593; cv=none; b=NUwnp+KB2iNN+0LBv0LfyoUm2BqNBT8qKXcNB5bDhgF3IvJNaoQfU00n8EW1n4pFOx4v+qmvwNgrQX+i/ujeBD9hZddKlHclXTpOCsjmsMIET1C0N7+9LkVV5x3s7O33Wz2cqSJYcPRXNd7mwMXR41iCJJXC7zf5FBEIFS8UXNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009593; c=relaxed/simple;
	bh=XAfeo4GsE9hEqqUj30tqUKIarmQoDLaJCnklRZZJwBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ug4wSNdA94HfNCWeYjqYw5kNiZMTzdW/uuOvNd88vHUOS0cS8G2arCKEMFLhegciWOc3zYjF2/CKuI1krIdVJAfKWHA9Eis0R09jHlQVpgLYfHllBVNvRWR1gvBT7H7rqYpY6ijT2IjJgmB9MayEj/+EjkoGVvyhBL28/EKCd9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0ZjKE3u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvgko020444
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FcQDffu4Ht2nuqPS+dRUtr1j
	1wHDse8GaW+NYRE0/Mg=; b=n0ZjKE3uLUrCRAWLRPJif+yS2oOt0CKzTi1jI+kO
	Y6J7dUfIHpcXn6G9J705yaGSNjSlPXSyXgGUWoWq/G5prsFHQlF+PM5Nri9NyG6a
	HFMvIl0bcw+tKFACEUqREhzMAKCcYDmGFh6gloRu5ccCywWxDFCiv1fsGIAq76Pk
	biWNsEetREwePadKtwP/+OIi7B4IB+2WtlsoIgm1R5o6RvIdR2qO9Ri54Asyk7HE
	5rxp8mMsioLJlRA46gvGBwdYnK+RnFRVpO8K8UsQpNevrrXtHNdWpAnjiPG1sEeE
	1XwJvQJ+B2FF+W9wmnUj+QlPssYsogA8D8PdmMqcv8kQTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx6mwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 14:39:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7075d489ff0so105342366d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 07:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009590; x=1755614390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcQDffu4Ht2nuqPS+dRUtr1j1wHDse8GaW+NYRE0/Mg=;
        b=AveTpsgkz9axFwIHQH8m/BI7L4rx+H5Y3eG4yoY7f6IOfSMNJr486x9eUzHZIdI2cm
         8YsAbPypSADacVeJQmkwLFze3PAXJ527zluLTnRrZ1KWNHJMV1mK2f8XELe5bM+WDgXy
         i7SMYFskX11gohFUS/810IM9AkDo/Iopkckga4rOCA/EXiSm2LFH3MWBEWNdynsGYT7s
         VlDl73GNhZhl6fzax+EhwYm3lRwRrVNLS7PIjQbIES8HxW5Pi2xRA7Bz/qGPrh7shhMW
         cAR+hulKF7/xNGDZ2OxDGzHvnvlED/LATTjsFD+TtkYP8/prXYTTMbYTpErRKXp86VjR
         FrtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX29Noi0jDLOdpPMjf7Rz3VQy7743eOw+ag0qGXG/9MoQSBwNLR7HfO2QAxD0QTQqjUvVY3LC4xLn5xcc8D@vger.kernel.org
X-Gm-Message-State: AOJu0YzhGtoXJ712OL5gI2M7r4O/rQ7D6JCuqVDpJCcvJO75kxpXrkoJ
	MtaUrHb7M+NU7iMKAp7OX3FyeRi4217k8Nbe280cRGpx6CP+jOimeIl4bAbi/rz2s3uO1LaCsvK
	ht892EO4jpnGPBVyYxrJ4nmZxg3uZ62jGZemX3reoK9rn1XO+As0R7qhlx0K7hmXpKzMn
X-Gm-Gg: ASbGncvtLfRgCxX8ByB35DSU2bk1mNos/zLGkVph5CmvHJGJlg5uG2crD3dx5zhmlhp
	pm/yEe/OXAD30cAUM0XdgkbprqGabfc2nH4LgpBWdlOTfiin9hg9Q2D6cb+vnTSr6hPnIeL3pY1
	AsZOfXUAckdGt9RU/yC1ypPhK2QnRPz6EU+al40C2g/W4+MMM2VV8T9dTKTszx6AfCKeI+Ey9l2
	xrXN6WBKf2tWMK7OjtJvhLPrCU/xOaqCojFtYdbYJrf7ZCbRlxq3+6mVM5VPgOdJ+Xw6UkbDI9/
	h2vMR2zG/5RaUcv+XUgBy2r9m5yDkXdBkdNL7kr4hP5QXieM7wMkF0V6kvOXgthIU/MgdpkoE7E
	7+RdIbPLmfwlQcm+ZUfE3Kc8Gjp3TqeBbAF4c3dxToeAlm6An/7ad
X-Received: by 2002:a05:6214:8088:b0:709:de23:aacf with SMTP id 6a1803df08f44-709de23b248mr33124066d6.23.1755009589693;
        Tue, 12 Aug 2025 07:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ02jwb1BJdJ0GEtq//bbH7kZ/MwabFp5DoHxh2z8a42uKVXly5Dax1fZrPydgEB7NcAq1Iw==
X-Received: by 2002:a05:6214:8088:b0:709:de23:aacf with SMTP id 6a1803df08f44-709de23b248mr33123586d6.23.1755009589227;
        Tue, 12 Aug 2025 07:39:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cce15c650sm1434362e87.103.2025.08.12.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:39:48 -0700 (PDT)
Date: Tue, 12 Aug 2025 17:39:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Message-ID: <2ok6o4e5pz4ichhchycqkns2afzce5y6ppjr2av4yz3wc3iatk@m3cdck7csavt>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <20250806-b4-sm8750-iris-dts-v2-1-2ce197525eed@linaro.org>
 <e414163e-e171-466f-965d-afb9203d32fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e414163e-e171-466f-965d-afb9203d32fa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX8MiNJ9yDY7Z5
 S/cxSYYdyUv5FIYtGa5E1o82bopoYvFnHl3OIdfrYkyrRdrhtCjeSp27glX4Ae68JvrkR+ku9wt
 udZyku+OnB9aQdw1Yy++PBy835uerev3XQLX4np0NIdRRnznNJqjjgVK8eEBwzHRzSmVwcGt+7i
 HtEx7HRsh5BoJYzMZyWuXZzGjgb1pZDX7Q01xkW6TeckhrIP8CK6FgsytSXAX8UQSTdS5K/V1LW
 iqrZzuSfLQLCa/7s06AFhk8a2Oorl5PppfCCiHvvHn8ERBOvk0SXi5uZWc4n1c1AZMiGwvC5dBu
 20OJcgZrJI3PdT7wt2MZpfRrXdDUbc+vjWt4abhmK22bIddA+29HYQ107LaQQ336VkxyUoEKWYp
 DNI/7vP2
X-Proofpoint-GUID: dVztwEZcwb0sYbV5MBbkWexCqb39QApV
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b5236 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=NaKNMKGzfxSzMjQQXCEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dVztwEZcwb0sYbV5MBbkWexCqb39QApV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On Tue, Aug 12, 2025 at 04:21:12PM +0200, Konrad Dybcio wrote:
> On 8/6/25 2:38 PM, Krzysztof Kozlowski wrote:
> > Add Iris video codec to SM8750 SoC, which comes with significantly
> > different powering up sequence than previous SM8650, thus different
> > clocks and resets.  For consistency keep existing clock and clock-names
> > naming, so the list shares common part.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> 
> [...]
> 
> > +			iris_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-240000000 {
> > +					opp-hz = /bits/ 64 <240000000>;
> > +					required-opps = <&rpmhpd_opp_low_svs_d1>,
> > +							<&rpmhpd_opp_low_svs_d1>;
> > +				};
> > +
> > +				opp-338000000 {
> > +					opp-hz = /bits/ 64 <338000000>;
> > +					required-opps = <&rpmhpd_opp_low_svs>,
> > +							<&rpmhpd_opp_low_svs>;
> > +				};
> > +
> > +				opp-420000000 {
> > +					opp-hz = /bits/ 64 <420000000>;
> > +					required-opps = <&rpmhpd_opp_svs>,
> > +							<&rpmhpd_opp_svs>;
> > +				};
> > +
> > +				opp-444000000 {
> > +					opp-hz = /bits/ 64 <444000000>;
> > +					required-opps = <&rpmhpd_opp_svs_l1>,
> > +							<&rpmhpd_opp_svs_l1>;
> > +				};
> > +
> > +				opp-533333334 {
> > +					opp-hz = /bits/ 64 <533333334>;
> > +					required-opps = <&rpmhpd_opp_nom>,
> > +							<&rpmhpd_opp_nom>;
> > +				};
> 
> There's an additional OPP: 570 MHz @ NOM_L1
> 
> +Dmitry, Vikash, please make sure you're OK with the iommu entries

We still don't have a way to describe it other way at this point.

> 
> the other properties look OK
> 
> Konrad

-- 
With best wishes
Dmitry

