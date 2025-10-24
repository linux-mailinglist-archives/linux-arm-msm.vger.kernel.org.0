Return-Path: <linux-arm-msm+bounces-78665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB4C0440A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 05:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1202E19A3467
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 03:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D2326FD9A;
	Fri, 24 Oct 2025 03:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSkLe2wE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E36326ED31
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761276489; cv=none; b=qd6EXtWZOmCHFCLKLqIk6tBPvaFG6aJbAYqAwFVbFU8JNVsRbKqYWd9g1+I3Z8tCj7hDbRnzN/SC3I3hXmFNm0j6XjOvm1uxUcDOqiSgD0Y0gYg48JZ0P4kK1ABX1xj8gdqxc0h2ijU+Yu+/4usedb5tsSByTszcpRCOTiteO04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761276489; c=relaxed/simple;
	bh=URfQXCT0Oo1XzPB6UUfoeOejCbgTclqtEEluHABIaUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QE0tHnzdWloUu42OQ/+8/cD1LIMwUlW7/ENTVsJUTFpe59iT4iWBiXCEi/ThhCNThRJ7z5G04eSoK7bmBwbmDHAre17htPJf1b/v41en580UasyUQxbX1ipvOlFc+FwiNkgJuJKeL1/XxF/WVntuQMqjVs8A6IgJTgTaf9UIh4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSkLe2wE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3M7k0010231
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hZRKGHf5eiS7medbsEc1yTLg
	vLooHsK/MU89hBujSiA=; b=kSkLe2wEBX6htBZhmJddfIpPgH8+2BOgJcKUnTPn
	LA7b3rz7bThHoqr5R3H4BHfAnHL75uEabGJ7D7mR1QR+Ns3xXgWtrugaiV4V6gNF
	5KRbQ+cavGnM4Od0PZUl9GIBFuedmlbwW8DOJnE6jW0H7ugjPcZ1t6LgmM605il4
	qqhHDdV/3qZNooHaCR0TteVcp3JaVzPKYRaVEsCWVeqwGZSbX9LIlAXM098HszX5
	9tll+BVOkuhWRdEU7yFPdzRkhZJQNkdLk9Q1Ml1YAe/mddkZzUrBrfcBsx+ZlROm
	FAX7Ju381ZYHpsYyJOxhel9T4MY4IFug5XCl57pHafLXEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524cufx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:28:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88d842aa73aso563445585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 20:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761276486; x=1761881286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZRKGHf5eiS7medbsEc1yTLgvLooHsK/MU89hBujSiA=;
        b=tLX5Jdgnirv9rmV2SsZGU5i5orWatevu/XGt7YZOyn5VrijGLBJIzCm1Wzh8I/sa3v
         LM6QVbRoa7SypokaOOCXWau6X9Pg5RQC/Zmynxu/R0c+REE28+gFcaDnRDowAwT1A1Gw
         9y+k6CG5mNZB0Kg5/xgN10AX0c0I+U4evGrFKCZDnu/idXezGqDhT/88EbnsV1ySG6sl
         RjIsFtXdc8dMiP4vUOaRv7uW2J7Y/bzLd3tNbNOfZPlEOt1bwFCWJLnAhkWLd4KfNB+W
         LKCi1hEdC+a6jkWt7MZyTraC+Iycy0SIufkUARNX5JWel2j4REWlrNjsBqphgyrw3Ref
         PnTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/Xe5VUUN3A1J1hKCO1sZmgBDcMCGv1AcGH6tsI2mnUTjz4GL65gIiGpxcoZZLD5cFVE/deUZp4VaDKmmo@vger.kernel.org
X-Gm-Message-State: AOJu0YzfpPXEQIQMgRqqHU1+7TsSlwYUflqhTfGB8j5DmihPR/7R37ym
	efS6gWrThAFgql0LC1wxyB7O92N8P9oqWPWzdc+vUxNFgnGWWEc3yGJz2sXEp2FxSUZcVBGcdZ8
	1kudtzgH3CBpzgIozbalR6key4hSJxLta41GhRM6xCJUW1YyTJTR24eUDIiJWlEbZad/b
X-Gm-Gg: ASbGncuy8269iPlK/hVIqIDAEq523MJM3rnxfkcBh4thSxoOBEiyqIIIHF72krFhaxu
	jeAlyLLn/TTEaAwHFPo4MZutcL5mNA92JqWNPysqPOvVXRIiMzNLSv0dvdtKRtJefo72mxL8XJ2
	CBSIzjwaEQujzBtFatv5SN08Ozjqo+efJxJ127SYJ1GJTSIx/tztE49RohJo7ksiFzrmYJUMJYV
	wLRSlBjTjy4OfxjpM3yrSDK1p63yStMDZ6vn74gwbt7cipZ3x8awrCx2Qfli25RDzXMe0TeUEy4
	1Wp5aFH8lSY4EXekqL/uGMIdI0r5m0fnuuhOfzABbIF0ursbwDime3604mZb0t4w5D18xgLzCg8
	0Osr7c6zzxm8iYe7JypUXMSRaGsfQnB8K+GqigYvrV8Ev0z2UBTh6CgQWXvvC
X-Received: by 2002:a05:620a:6884:b0:868:1899:b3c4 with SMTP id af79cd13be357-89070115826mr3155292285a.48.1761276486133;
        Thu, 23 Oct 2025 20:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnIyfQMj4mmjccKB+vbnKu6/RWvsqjZb5kPuk+y1TdkZQGLJl3cVSm65rC7YNEyAuhfj8+ig==
X-Received: by 2002:a05:620a:6884:b0:868:1899:b3c4 with SMTP id af79cd13be357-89070115826mr3155290385a.48.1761276485620;
        Thu, 23 Oct 2025 20:28:05 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89c1169a47esm299748285a.37.2025.10.23.20.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:28:05 -0700 (PDT)
Date: Fri, 24 Oct 2025 11:27:53 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX4rJKMzm6tyC9
 G48lwY/9HMx2zhbFqp7vZdMyxXNvOBqOZNKZOe4XitGb+RsO0+jG5NjkKZkCgkAW1BXfsPcI31Q
 WBOtLKaTjvezUUw5a67hYmHg6Iso0IcK72eQ4pUUGd6Rf3YkrZR8y2fNgtQEJQ8XOWA7UCsbPut
 g8eASQhPwJonIym6Edao6BJH4teZahCvjia0KhNfkokte4j7v73HA5zyeqYnSFTAAYTwq9pabz0
 zPCJE3pi084bkB7ymFkfCrs3Ub1W/fN0FSyYKMDokOIyvol3Vgq5X1Z7Q/xUc2qg0gF/p4cGp17
 YEZNheB+UnIHLYtUka4VUeZNfmImowW28XpwpRuNymg/PPr/+wWGwe/Fwc5KQMKJqOTTsEAdzN8
 JKqFgBVPc9nPEL6uKZTLmI1i+rw18g==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68faf247 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w-wrxfCwE3y99oquOGQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ibbyT8DIcYGQbVyasD4cAYOHHvZ3vay3
X-Proofpoint-ORIG-GUID: ibbyT8DIcYGQbVyasD4cAYOHHvZ3vay3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> >> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> Add DSI PHY support for the Kaanapali platform.
> >>
> >> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> >> +	.io_start = { 0x9ac1000, 0xae97000 },
> > 
> > These two addresses are very strange. Would you care to explain? Other
> > than that there is no difference from SM8750 entry.
> 
> They're correct.
> Although they correspond to DSI_0 and DSI_2..
> 
> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> new features. Please provide some more context and how that impacts
> the hw description.

Thanks for your reminder.

Correct here:
io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1

And v2.10.0 no clearly meaningful changes compared to v2.9.0.
just some register address change.

Thanks,
Yuanjie
 
> Konrad

