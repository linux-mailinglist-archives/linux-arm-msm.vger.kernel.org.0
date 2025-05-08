Return-Path: <linux-arm-msm+bounces-57282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48412AAFF62
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 17:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 018B27A4AD4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6153EACE;
	Thu,  8 May 2025 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ur8eMjfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AE2278E7A
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718859; cv=none; b=gwHvW19oFPmlh4oy8uyeX+Y+A9qXp2OAOD6JeGd4f5UZiEq/9Lh5oM87G2nu9srMuWIM54C3sMASvZsuzRvGmWi78k75lL004I8tRvacIsBlPxGA8wR0RsRUdcZI83KgiQldTEt1f5FYJo/L/7k8LY2SHC5kMEgGT6s43uaHhyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718859; c=relaxed/simple;
	bh=BudoP3nE0bpLdaJ5jrf66L37C2BHjnq7NOC0WAvQgeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i89xNXn5GeC5SBLKhqdPa16DYxcENQLNMVa5EdASuXi+40Nj9bzu00+Tz0SJLEVIu2lFbBSgVGNVI9YzVRDCf0ycyQae2QheXJsu4tFvpXohauggNyIlz3ZV0snhKMnrHPyLzmuqxWq9bBB2gKyg2m7TrEBtKQIW5b/Lrnplz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ur8eMjfm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DFodA014286
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 15:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oOF+MnASMYrIA5de3GFHql4v
	cdTwJ0Xq/bKgRzL4R4c=; b=Ur8eMjfmWQg4g9JIR+AJpDO+sHWG9LTjGeyx8Ekg
	bDeNaTxA45kwH/ih2i42vwan8UbYQdoxXeIEdWTpsbQrqzYDHLwIWTuP+o8I6FjQ
	Bhpwr3UOHhiv1RGJjUMwNoMCgpJ/kJ/em+dJOTscEBK5nr1Q51HnafeGCY5pVNFl
	GCxzZRAlnAJc6+gx90eKea+OXUBb4oIrk76XsSD+yX68o7hQ4Lcor57qeciohwKM
	MwVQTM4GSH2UgtPeAzfF7a+FhX/AdEeVPBeEoqfJQSFrPvl1sNQIrf1/6/ciUS6e
	uPw41PSKOEAXWNBAhbXary+v/GsP+OtDZ7XNsKMUrTJPQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4huck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 15:40:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caef20a527so268153885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 08:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718855; x=1747323655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOF+MnASMYrIA5de3GFHql4vcdTwJ0Xq/bKgRzL4R4c=;
        b=Ps7MRvvN/RVwfkGE2Llf230fNtX0qKNJcBk9Cn8ZzLj65LluEYGks8yrU3vRxpZ4UC
         zv/pUdCKfkp04uXt+9sF8E89XStN1iW0uBZpaWB+CXNm4ECGCK1mx2uezuPs2QOm+pe+
         abpQink8MbrXqJDTPrlw4/jep5Y1JRnGO9TObVgzZ09hPPX2SEoU8Gjtp7k8nFlQEfna
         iHFOvlrmIWSd8PW71O5/bo7rzcKXTG8iXJweErVTs3AJbQi7XwBVPt2DOs2Q4oQdYIwF
         99H0QYeuvHe1VLGJ1i54lgx9aaRLjkxDZ8DI6+Ru+vXa++Gz+5VnS0sYD6pRZK7TfDpL
         gPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7B+IMfr4sRWIpUdnHNsHdKKtTJOyolE6qmeDIhNlh0MdnTWtC5lBzFQwtdf+m1Y6krvZLChEIddq+DfoH@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxMIC9Q5+SMNt2ahsjiKvMSYTI3ulaOsd7Gss+2IkWemUzOKO
	ose3U1ol86MmArxixRoaboFFwFNnlfRW4o4JCf9OI4Nw+In/XY5HaJ9QtQ8izG3UeXiboAt8iJQ
	kwlJsGVE44nlk+8ou6MARUdpa9Cd3cE8jNW4qMKpObWWm9HhdVPPdv1xlaaaCRuMpnSihX9qZwN
	4=
X-Gm-Gg: ASbGncutQHR9X2ADrpvJmVocQNTVhOZqQea7YmJp4yOruf0QXjypU8j+mh/4hXleYP+
	V9TUXyrTrByTEixeyzi+5Mk/ovYljjJssMgBdTSR0FwqR9BxK7auZoQAC63OPiN7pZkgs5WfUcA
	89dwsGwTV5vVMvWlx0Q1QVSh7UU4i3fM+Oj9BeT7aJTmRLETffEFI+GPQDZ93wnyK+D54wJBk7s
	+CPIEb/X6FuBsttNQgYSylPoFdlfQHLFkyiyhZKqARGG/MSgeBO0z2NZ9TVZpcJgSMGJJ4MlGzt
	RXtyJ38xC2tomDQfCG4coXSUz2E/69Xvk3Mbltqg7QSy7Ry+2I7uJd2lyV0FbyJfvpxIgEyCkd8
	=
X-Received: by 2002:a05:620a:c51:b0:7c5:6dc7:7e7c with SMTP id af79cd13be357-7cd01116cabmr16250885a.26.1746718854964;
        Thu, 08 May 2025 08:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH++qSy1o2LpXKpm27+d087eaP/M5azZLvvr1IACNhrczohQ43CEn/1wba7dJLQRJIXoyzPFg==
X-Received: by 2002:a05:620a:c51:b0:7c5:6dc7:7e7c with SMTP id af79cd13be357-7cd01116cabmr16248385a.26.1746718854679;
        Thu, 08 May 2025 08:40:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fa48sm1857e87.1.2025.05.08.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:40:53 -0700 (PDT)
Date: Thu, 8 May 2025 18:40:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add support for qcs9075
 IQ-9075-EVK
Message-ID: <k7xxfhkzv2cuoxnmcwysh5hdqsbwpwiidjgxumlgbhipcwujho@lkbn2poddg54>
References: <20250429054906.113317-1-quic_wasimn@quicinc.com>
 <20250429054906.113317-5-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429054906.113317-5-quic_wasimn@quicinc.com>
X-Proofpoint-GUID: GXlKzwNDzT0edpaWeq2sEvy6Xg8snmT6
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681cd087 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=v055IAusiqpEkrIEdyEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzNiBTYWx0ZWRfXxC4XKg5QDsgl
 4klkSB8dnduuMdVzVSfC8I9/hq79Pr4pGqme0m+QfGMVFzOWo4utdKUTjyDKMK0RhduFamlQFlV
 kAECQCMhezpvcRGs5ryDQWiZJYRResQEq7H1D7Ub21wnEjH7Vi6SW5j7FAoIJdlEMLFsGjZ7Haq
 tPRtDkJMvJqIXfV0caNzypOr0XjqWiU5vMw/RKP3VLELiNzpHDMmjtbWpYT/utHLn2R2xZhqayR
 Ut6jid+A1cRV7O6tG7bfX1dT0F7x0/G4oyBKVTjV+SNHSzUygKXUMeX/MPIrdBnwWPpJS96il+q
 lEQFdL5CJ5e7sAT0BgnpvR4aDMxediGxnQ8LYDuw1CIu7zq9E47/mW2CIC2wHmw6LvdjbuJIi6o
 /dyPleEpHiwx6TeRlIoIuGXllH6LFcI4DykcE8IJrKZKeefbikz+ClHUUETCXJfAo8u7iyoM
X-Proofpoint-ORIG-GUID: GXlKzwNDzT0edpaWeq2sEvy6Xg8snmT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=770
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080136

On Tue, Apr 29, 2025 at 11:19:04AM +0530, Wasim Nazir wrote:
> Add initial device tree support for IQ-9075-EVK board,
> based on Qualcomm's QCS9075M SOM. QCS9075M SOM is based on QCS9075 SOC.
> 
> Basic changes are supported for boot to shell.

For v7 please include UFS support. 'Boot to sheel' as 'no storage' means
almost a useless board, which even can not boot the CI images.

> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 268 ++++++++++++++++++
>  2 files changed, 269 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> 

-- 
With best wishes
Dmitry

