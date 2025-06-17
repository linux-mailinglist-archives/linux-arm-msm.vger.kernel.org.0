Return-Path: <linux-arm-msm+bounces-61529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACAAADC28F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 08:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 023397A1012
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 06:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835E423A563;
	Tue, 17 Jun 2025 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eF4S37tb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688F2BEFF3
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142854; cv=none; b=dIL/R5MeI7zNyTzNE6fxumgMloLh6FofG6xnJGFzJ73mUaLToj31dOABNSC5hkw9oOVHt0gOsByBrUGRI5Jc83QDfI27HbA8bF+AiHDQ9vwn9QhDhm+MF0LEZG1wSb+XQG78pGI6fJxcYx3A0bq+wMnUymdBDlNQvEjc0eSuKow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142854; c=relaxed/simple;
	bh=uU9hFzaDOTZHD5p3PSB8mgjSUPP2zTLYjpfXx6AvUC4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VEurfl6H4m0+pVPvOEiavode9y2QcbqnHGENNiqjAfUUteu+CjAInhQ0VO5w0HQYQjvYHMZgKakTglpQyTm1oK+CYTuEko+Y1LXioViOcIa+9AYGkKu+nkzPnRGg35vUm7tpunszcrfH0TLBknJ9OiAh0LFFouEw9s1iYI/KY8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eF4S37tb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHwEPA016472
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 06:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jzr9HurUhduvjFSlxdJqGDlJ
	e2HOuYisi/7N0azKI4o=; b=eF4S37tbYiuC25HjDz3vsroDP2wKXIssYQZ2HB6u
	Sv/OaLaI5gj5aIJGbteEIVLqeUG9CCTq3OBfb4l2qOkKuYChqErEEZrSTvXzSskM
	dmMcX/o8+h4kOKYAGJePDz5zWs6LJ7qkf0wn+SxvdW++JNAlUBCGbX/ixJLMFkjp
	YOE36XxrbxD8GYw00wq+9qVUI8jMFi9cN79N6M+oks+dPbbCmSnErBnxXgchVlxb
	XbyM8lMdqrNP/eU8jrdiE0aHpsf6vtAc1AYuYkdtc8Tp1UgZGyZR/W3+mFENg8VA
	9PBCc7XDM7mW4UuHRXLmmAKukIM3AfM2kYvMgOj1wkPg1w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsy2ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 06:47:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb2910dd04so97051416d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 23:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750142851; x=1750747651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jzr9HurUhduvjFSlxdJqGDlJe2HOuYisi/7N0azKI4o=;
        b=vnzkcsYhza7zVc3LSWQPhjVqahGyw9f5ub9yI1l0YqAqMx1ZS57dAvrpZ6erOdnIJa
         k8NTawpUKhB6Wd2OErRI67yuza+xdVD3pWuICIAiMVV6zpAkaQ8/LQHO/THnDD3Ep9bA
         Fe7dRhKSC55K5vSrfjbWxBZCeFzt1Lw9jvntgZeMTSgij26qUDZejqqcofPi2sfw50xC
         EEjALrzDYTfNfk1eMSm2BYGQJcZFlYmOY4yBXNvLi9ShM0vNZBZ3PT1N1hTAwKITLIk6
         M1nDDQfaG5soMIzXXjMu6N5O+yU8l8YYjsWV6U3NsPWQBxWHPhkvX/ZvnpERi8VRnrlT
         rrbg==
X-Forwarded-Encrypted: i=1; AJvYcCWOWEbrFbIxSDPvj9UZQloz/pVm9/KhaHjBNa5IRFBmmE+UAaYiOOVP0DCW+n9U8SIczesv22exeIOyX8PD@vger.kernel.org
X-Gm-Message-State: AOJu0YwchHXw0rR8WWaaKYOXFc9us/RN76AOZVhfoKEbDzziIcJFLDi7
	++iTxQ790eqqJ3V7BG+vv+A8w7Gk82geV7AShqua9b2kz8njWqUywZpVCNXAZJOM9BcD/a5vNd8
	RCIhTjsLL6FGlCl87hVSHAbOk/zeyKOashFGSZu6bSXa1v1K2im0iHv46Y3PoXNtHzUsl
X-Gm-Gg: ASbGnctT8HtzgGbVQpUX14H7Pj7/CLCmhPWAA4H2atkdaT8teX28/3eajyGW2KdjP+o
	fT+xoagQOqm+vKiShx3oLHv5zmnuhL3EuGNHJ0TD2/LDDYbKmbNJFOZ0SztwAsRMg90tICJEab1
	9jf/ibfxBIsQOzH9vVBB0K7x0C31G5DOya3gZzRcf0pz5jOxDzbpG7VZj/Iue7UV4Dgx9TiIiJ4
	i2PvOiKAmhjRYei5Nezd7NeQuzShpbB4bjUCEcTVrl++cLrEWCFKe4+qjVt/HT72OcnGEzpGf8B
	Rw+3kVD1eMSqUfwNMuwdNvOtj8/XDPUNTZS+FZsw0xWUK8i0NiefiOh2ww==
X-Received: by 2002:a05:6214:c83:b0:6f8:b4aa:2a59 with SMTP id 6a1803df08f44-6fb47758f93mr164247466d6.21.1750142850683;
        Mon, 16 Jun 2025 23:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHbGqDog8miVnZzjAR3A8q6IF/fQLMGnjyAnp1A2r896ciWBGYbRf0eCtQ5F2t5j3tp+MSYQ==
X-Received: by 2002:a05:6214:c83:b0:6f8:b4aa:2a59 with SMTP id 6a1803df08f44-6fb47758f93mr164247136d6.21.1750142850248;
        Mon, 16 Jun 2025 23:47:30 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25302dsm160264035e9.26.2025.06.16.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 23:47:29 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 17 Jun 2025 08:47:26 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFEPfjJLEMnIriXX@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
 <aFATp3zoSgkrj3YX@trex>
 <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org>
 <aFBDzWLkKC9MWGoC@trex>
 <48e6cc62-ffb0-4ca7-80c8-9e510db505db@kernel.org>
 <aFBNVjl4n7I+OkO5@trex>
 <c7aef6cd-e07d-4422-a34a-ce04c37ad2e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7aef6cd-e07d-4422-a34a-ce04c37ad2e8@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA1NCBTYWx0ZWRfX/FMZ1OiArRch
 qJGvlfW75EPCJV9fDooMVSKf7EOe6ffkM0iYtVuqJL5sk21vpAgPENTU9mxiVNa3BGkFgIIY1km
 i3muUecy347Dyxa9+/iMnZ2Z/cBPWi0IBftvH/7cY5fmUWiTcaIsQ7b1/uv7M2kXkLv+z1VVNHQ
 CoWZtFJge0h8iZD3QHa/J0CdGKkmuXZ3KRvs2P1KJQbldf1JoFPyvKFSnwN7wZFFRNoiwffh64g
 QUer3jsUgn6fsxx8AOEXo2KrIQyKXECaa4WMeOQIUk6QqXy8Br/QI8ASoqe9llaGomIYMpXZEvB
 vasnFu3qJw8EIQaJUHfk1N7boqi/9jCfs0ZG08rAOHrKn8RMegJ2h94oBQ5hMZzzoc4ilefhOZy
 XrXS85px5T5ZrEp/KQR6mHPq3fp330xtRuoV6fRZykxxNWSwkn+JIehEeDvWwrKNqINBX+uj
X-Proofpoint-ORIG-GUID: HCYvbWpvmEc_HS0RdETGS138Vp01PfVr
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=68510f83 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=ckiIvdw4d6_qyGhr-SIA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: HCYvbWpvmEc_HS0RdETGS138Vp01PfVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170054

On 17/06/25 08:14:23, Krzysztof Kozlowski wrote:
> On 16/06/2025 18:59, Jorge Ramirez wrote:
> > On 16/06/25 18:23:18, Krzysztof Kozlowski wrote:
> >> On 16/06/2025 18:18, Jorge Ramirez wrote:
> >>> On 16/06/25 16:41:44, Krzysztof Kozlowski wrote:
> >>>> On 16/06/2025 14:52, Jorge Ramirez wrote:
> >>>>>>
> >>>>>>> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> >>>>>>> +  on Qualcomm platforms
> >>>>>>> +
> >>>>>>> +allOf:
> >>>>>>> +  - $ref: qcom,venus-common.yaml#
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    const: qcom,qcm2290-venus
> >>>>>>> +
> >>>>>>> +  power-domains:
> >>>>>>> +    minItems: 2
> >>>>>>> +    maxItems: 3
> >>>>>>> +
> >>>>>>> +  power-domain-names:
> >>>>>>> +    minItems: 2
> >>>>>>
> >>>>>> Why is this flexible? Either you have two or three. Not mixed.
> >>>>>
> >>>>> please check 5b380f242f360256c96e96adabeb7ce9ec784306
> >>>>
> >>>> This does not explain why this is optional HERE. You cannot use for a
> >>>> new platform an argument that some existing platform was changed in
> >>>> ABI-preserving way.
> >>>
> >>> thanks for quick the follow up.
> >>>
> >>> but bear with me please because I dont follow - why can the same logic
> >>> be used - it being applicable - and therefore result in a definition
> >>> similar to those other platforms?
> >>
> >> Because this platform either has 2 or 3, not both. Unless that's not
> >> true, but then please share some arguments.
> > 
> > as with every other venus schema with more than 1 power domain, the
> > argument is the same one that I have shared with you a couple of
> > messages back (DVFS).
> > 
> > verbatim:
> >     Venus needs to vote for the performance state of a power domain (cx)
> >     to be able to support DVFS. This 'cx' power domain is controlled by
> >     rpm and is a common power domain (scalable) not specific to
> >     venus alone. This is optional in the sense that, leaving this power
> >     domain out does not really impact the functionality but just makes
> >     the platform a little less power efficient.
> 
> That's not definition of optional. The domain is needed for this device,
> the device is one way or another having its rails routed to that domain.
> It is not optional.
> 
> > 
> > Seeing all these venus schemas follow the same pattern, it seems to me
> > that this is the correct way of implementing the above.
> 
> No for the reason I mentioned earlier.

So just to close this story up, were these two commits wrongly
reviewed and signed off then ? Please do notice they were also - just
like this one - new additions and not a change in an ABI preserving way
as you characterize them.

e48b839b6699c2268e545360e06962bb76ff5b8d
8d3a1cb32124eaeb3f2efe4889de214d3b658d8d

> 
> > 
> > You seem to disagree. please could you explain?
> 
> I already explained. You add new device, so argument to preserve ABI,
> which was accepted THAT TIME, is not valid. You do not have ABI.

as per the two commits above, this is not an argument to 'presereve' an ABI -
this looks to me like an implementation.

anyhow, if everyone agrees this is the only way to move this forward
will do just fix this to three then.

please let me know.

> 
> 
> Best regards,
> Krzysztof

