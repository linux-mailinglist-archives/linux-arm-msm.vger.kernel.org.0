Return-Path: <linux-arm-msm+bounces-59098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75389AC13B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5E747A549F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702CB1DDA15;
	Thu, 22 May 2025 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQfXVjdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D8148FE6
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939876; cv=none; b=lk0VYYyOiLdUSIpVwNgkqTDZ5aJdbnJTS2hmrRfA3R9s9scuzgVXMzah29tAbZ7zfwFa0pFE9Pshm0TOZZfy6jfHcwPeKeyLtuXeBHj4wIjJMzbSo7IkXn4FWZsRSWo52s5WZk4ys8PyTNAso0I6C6rGXs69DDzzgjzZhE0rl8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939876; c=relaxed/simple;
	bh=dqNtVFwXosHyfJy811+mOtb0uLDWWrwysvsFfF9zd3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYoHttYWYZE3yeixJSp+QlsEfcBCc/k5h5K4ltC7hAzYWPfCg4v4Lit6H6Y+IKTikB/CvhMp1mo/uZSha9cMPzMQOcDeXo03XiaprwSqYnWG1McS/szXzKuyHDlnAM9NaQKLviuReKNshRiYq57dPzshlaIzFPMyRa1i8P5EBw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQfXVjdT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFkNuk020598
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k67aqU6MxwxcWVzyNNGDDLVQNHFVM/3/G0wQpv0a0T4=; b=OQfXVjdTVUB2us9D
	d8O3mHVfut7vaRO6SmooWJ7Ogj5mjD2ErJYrabir4eOfc1ELwrUDlLNj6O4siBuJ
	GKnfmwUw+/Lj2JXh64ntnJBYBrAQk5PgNX73I7tA5SyOwrSiHXbmGPXAVisqRYwY
	g8YEQzM9VhRg3n8KeWjcynikSxKTPjZAFq8Jp4rx5M5jEaeaHqXi+2G1y+XrTNKw
	DTxsjRNOAdz1okFSFTKin4D+Rq6iNpB+XKkxwY3rje7faGQ3gcGlfbozp2DXb1t9
	oH/YvrMSmnX34tUla2HyQXTc7mG/Mp8bK3Cre/ToYTar8r4FjIFi+6mL/AdpSjL/
	QM2Hig==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb5u1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:51:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fa8eca6910so9336646d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 11:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747939872; x=1748544672;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k67aqU6MxwxcWVzyNNGDDLVQNHFVM/3/G0wQpv0a0T4=;
        b=d+OdhWCSIsRGELULtFbkdZKcK7Eg5jP8upeD4cUJ3lyzpaQLFvm9rwSRz7z4eL+ot+
         uY0RAcVJ0dcZDaTRamWJnfzGlVYBSdF/I8GA96iBa3Oyfqdqxs0giJhbjB44WuczDE4h
         yLeIxww0IfM7oJ49Ch/xltIiIeXiV+ndP0TBU9OvZJBSjzogKX04q0tzfdrgRtBduQNQ
         OLru/U+Cz971kM2To/grLf68/NKj+lvTZgLPANtzKX3KUMiTnmTzERzh0YitB9zoH2sp
         uI5N62vDTU5MtrvhH366u8B/7qUYC6y//fMIu/6QUD24wSent9oB9yOELqDWQ0Ccv53E
         zmSg==
X-Forwarded-Encrypted: i=1; AJvYcCUd6PGD4gjZw9fi9PqMaG0YsJtOWljblV/aDdzs3RiQLBLvA8WqV8frTzfCG8Fvcr1m2YVLIRVbPPIx1FZU@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXFNgZBfa6zH3xYoir7PRCV1q5n0v+nKXsIeWp7zwJKyMOvxt
	ICuUtPRsciJqIuGlRccjFbnBCTBOdhUB38eKjKMUQSIIXxbqofQQMBA3mI20TXmir1XzQ5oCHgo
	YIbp/LkAe0jxRwgrMyLH5R5sDK0x/bmZIZSvqsPtr+KLQOWn2j9eflE7p6FqrU1tJKrwW
X-Gm-Gg: ASbGncufmCVWLF6FvCNk1Ft/Mw70PS/8Kyjvtyplty+AyPiwef3waIeoctMkoVLPZCt
	Ll6ciWDigGuxH+QJm18n8IAG1q2LgZ8y4WnXymR99AfV0PnaRvyhX9DDHSho28acMSCP4wZN+wb
	ZqajqXBkHQMJaxBQ8RCOP/pflPF+kGBB2nl2JomGjF8aDxMV26J8WAj0BHPrKTEqy0TAloIfhEI
	4HbKZtobhrrCTgsIgL/nkfFU98jbKRrI3JciZV/JgLFahVzDjTzuezBHGzDeHFKNrycDyBXCl8c
	yTGxhOZdliPdw1xMW5okN4lcDyD8BY1jwxQKYAZIMoEY++TLaywZdFwHWVlss+NKydGbomNfWEw
	=
X-Received: by 2002:a05:6214:2602:b0:6f8:e361:787d with SMTP id 6a1803df08f44-6fa93a332c3mr4520326d6.18.1747939872420;
        Thu, 22 May 2025 11:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE0flStxSOiEvdxXO7IMCHMeS5cIeyXW6g29/xF9z/px+SmuyWsi62jJgEVpZCzgjZAt3WNw==
X-Received: by 2002:a05:6214:2602:b0:6f8:e361:787d with SMTP id 6a1803df08f44-6fa93a332c3mr4519916d6.18.1747939872025;
        Thu, 22 May 2025 11:51:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b1746sm34533191fa.4.2025.05.22.11.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:51:11 -0700 (PDT)
Date: Thu, 22 May 2025 21:51:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, cros-qcom-dts-watchers@chromium.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
Message-ID: <fd2vic3g5jjk22y7yv24mtwr27ies2my5lih3zfj6yw4zd2obo@artndh3vepbb>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
 <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
 <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
 <76071cc9-b052-4628-9890-239b0acd260f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76071cc9-b052-4628-9890-239b0acd260f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f7221 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=nHd3A-xG-5ctlzPcnlYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ikj-GHfysyHABRXYDT9tcugkKK1E4_iE
X-Proofpoint-GUID: ikj-GHfysyHABRXYDT9tcugkKK1E4_iE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MCBTYWx0ZWRfX+blr9RRlukZv
 gAlgvtIgRJXtalMbo546LOtlyYJW+zYdCU6ZDL+cD+yLM31+9YBq9lItXKi/uTUwtiVSljb+yCr
 q/j9HX6GE6FrZzWcCIc7Pkul7CKb9vyJZhFVxFcdOjmthQ5e5ILh5EVgkJ5EHIkHJ2TQgo7g52X
 gVLSY8buKcQ6YfeDIg9GGmPmm05dVm2KsWGJewv9uPoQEy4sCu5ACmKkQyoCaQjav9r/00rD0uA
 QULGf6dt7xntykneQlZNB2hD9t6+FisBGBZucEEleBrxw9oNVBlPxNUIiWVusIEA32XZYFEcfoz
 qs9GcgM2WVH0YIOp8nVlZf8sO/nivPNB3t4cpMaMiyT/qyLm/7PCsMQ2UZ5nSh9HDKmJNnQX4cA
 63Xcy5wrTKfVuSAY//DpiCCz/yUi75FwVmKwI11mKd7ifV3KOQ1f/pkgpcjIaQRF+m8QO39N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=932 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220190

On Thu, May 22, 2025 at 08:27:40PM +0200, Konrad Dybcio wrote:
> On 5/22/25 2:16 PM, Dmitry Baryshkov wrote:
> > On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
> >>
> >> 在 5/20/2025 9:53 PM, Dmitry Baryshkov 写道:
> >>> On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
> >>>> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
> >>>>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
> >>>>>> Add reserved memory region and VMIDs for audio PD dynamic loading and
> >>>>>> remote heap memory requirements.
> >>>>>
> >>>>> Why? Was it not working without this heap?
> >>>>
> >>>> yes, it will not working without this heap.
> >>>> Memory region is required for audio PD for dynamic loading and remote heap memory
> >>>> requirements. For more info, please refer below patches, it has provided a more
> >>>> detailed explanation.
> >>>> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
> >>>> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/
> >>>
> >>> This triggers a bunch of questions:
> >>>
> >>> - What is audio PD?
> >>>
> >> Audio PD is a protection domain which is running on DSP for audio
> >> specific processing.
> >>> - Is it a required component?
> >> yes. it is needed wherever there is some audio use cases where
> >> DSP audio PD dynamic loading is needed.
> > 
> > Which use cases?
> > 
> >>> - For which platforms ?
> >>>
> >> For platforms that require dynamic loading of DSP audio PD.
> > 
> > Please be more specific, we are not playing a guessing game here.
> > 
> >>> - What happens if there is a memory region, but it is not used by the
> >>>   driver (SM8650, SM8550).
> >>>
> >> It won't be used.
> > 
> > So, what happens? DSP crash? system reboot? blue smoke coming from the SoC?
> > 
> > I'm asking all those questions to understand:
> > - whether this is applicable to previous SC7280 platforms or just RB3Gen2 / IDP
> > - whether this needs to be backported or not
> > - whether a similar fix should be applied to other platforms.
> 
> I wouldn't worry about FP5 too much (albeit it's apparently not easy
> to test it out and even having spent some time trying to, I couldn't
> figure out how these things connect), but the chromebooks may be
> potentially problematic. That said, we can overwrite it in sc7280-chrome
> if necessary

What about NothingPhone?

-- 
With best wishes
Dmitry

