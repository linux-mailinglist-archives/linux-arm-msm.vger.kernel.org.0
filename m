Return-Path: <linux-arm-msm+bounces-57549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1FAB2B86
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F3D3B4BDA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 21:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B873826137F;
	Sun, 11 May 2025 21:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gD/ClAWw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECDB38DF9
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 May 2025 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998030; cv=none; b=f1RPzpiKDxnn7EtvZ7P/ufjV0NkJLOVwXNH9xW9hbsk5pHrOFI5yPRYXGi3rBVYHG8ryuwpRvK//S4aTtPY+fOHfkHeVh/EhEeFkxE5hKI594uRtlz8H+LWlDqsLKPoD7p163Bi5LaF9PGRWx/6BUCFlMQffqMluq+30YT8rDt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998030; c=relaxed/simple;
	bh=lKhelJ2DwtYu1EQnN9bm8YjpdfO2ypAyd+RPpXYUagw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhLfgT/+CGoNi335lYnyKtNNoxhbzKp2zel6H7FMV1ayh7H5ZLe0wseF5KJFV2lv4PpE9458oj2kbzR7f9exWYLkasvB+k822NUNApaH7moCMO9nggr38j4veg2WwqI63eVij9wABUReA3DG3cL6RXyrgOdWw2Pm4fbrJWbolSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gD/ClAWw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BKQD72006038
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 May 2025 21:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8XaiI9UiHHaa4h3ZDY6Ph8BoQyfXmu1/32HzoVTmShU=; b=gD/ClAWwC8+97Kue
	esIEUPrEaCCedZKvJTtKXL6w/v9zYpJtK5epmz7C98ktOicAJF0LtQhPn1jwgNCU
	4wTeMcnMb9ampIu44n3xOHwpZQwGwG7q7SBoAxx4fxXpUJ9oRPes3T7xTZOciqaJ
	/85E6M2pd12pWulAStVeW6x91p1GMeG7oaI9dNEvHz35zisHsP0QJ92i26VJE+Lc
	lTA6nWudh6ufCrdVwhLyEyZ430mxt0YQTSbw/H4aiR5FGWMUR0dvDlemI8G+D8s3
	+Z/GHUcFabZMt9WXPKTB5HxhLliOQJtSxtKl/T7THr5D++z3RPtPauIlNlQe3Bpu
	rt8gfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwrutht2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 May 2025 21:13:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5750ca8b2so570064285a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 May 2025 14:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746998025; x=1747602825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8XaiI9UiHHaa4h3ZDY6Ph8BoQyfXmu1/32HzoVTmShU=;
        b=D7jP8FAufjQWLUQd2WyAvcyrrpAlQmTGgt803CpHua6vdtPm0lzj5NJC02PWCofAGJ
         2LExMO+pcmXnYryvRzNuPYmSeOLcJttQVgarWAp2synw5g0Dh6VGMbYRPwg/mYi6/USp
         ZBplmcZV/yz0YKUP44MYbl00f3Pnl7SCmCq7IsCJY0j/PzRSNzwB5bOborX2CY8IuhUF
         ee9RTAAuqx5uCxKhBxHQ6HTmgj3trhgmYKogUR9XYd0VzTvVW1ueeuxFd+dwsh5MUC0z
         LgaX7fEBUQ4Of6yO7tkojBXAZ797ZqSGixRgNRmuGZgHMgeO8PywLfN30VaqWdZ1n4ap
         /UGw==
X-Forwarded-Encrypted: i=1; AJvYcCWen9btWVX8L0qhBLCuoTgtCCQlcIJbE6fYI0zWfgyUCwe4VJ0rnnH3GbbU4EHSvdB3HWTd905gydLnuonN@vger.kernel.org
X-Gm-Message-State: AOJu0YyZlUEuS/y1zNetQRkdpURIWFnMPAhNX0AgBTa5LbwWaNytrkPO
	Yb8Hn6tJGz7MZOB6Efn4do0bnexDnub8N2+aypU4tgHu8IhJpPNO+bV+D4QLZA6YxQev1y8bmiH
	3I39DWER2+XaUG14s+tsx05sMy5IZDMId9qTZPhZQMU9wS+OjfS9owwvvnsgrdHdQ
X-Gm-Gg: ASbGncvd2Z4rcBG9EnAGkE4qRbI+XQgdF5l2/urMC1lYIWNhWusUYtyWNhAR5rxbsbb
	N3flPw2UFOTEQYdoNZPKEkXKCh+CnWKI0rEfjtp3SzROliZcyBUnXESShLJagiXmWi6rXZ3LyEl
	ivGjWfbfdrINNqB0m2RQEPs4Ut3I1DLzNKTXatuigFvEfmkMVntPF5wOAKb/uV+QnRNd1KLv4/G
	leEBXj1qsaUmNFEMJr2KR0mTvaD87eyqlEQT1x5mgr5Qp4eK9AjFQ4prGG09oIladrOPyqgG316
	K0wnyf32HzGyte2F3Tw3otWG6uDGq9pa40vxSvxLVba0DJ7F+DxxpcR0ubDx9qdo/Ok0NZcBshU
	=
X-Received: by 2002:a05:620a:4106:b0:7c7:a538:490 with SMTP id af79cd13be357-7cd010f3f58mr1553894485a.2.1746998025359;
        Sun, 11 May 2025 14:13:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG9kjNTS7QVk/IBI3fAZ7q6HPf68wGUS7tIWiANtFyYY/r9CODAeCGOJFnFzMk3+bULTdImQ==
X-Received: by 2002:a05:620a:4106:b0:7c7:a538:490 with SMTP id af79cd13be357-7cd010f3f58mr1553891885a.2.1746998024994;
        Sun, 11 May 2025 14:13:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fd30sm1255824e87.13.2025.05.11.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 14:13:42 -0700 (PDT)
Date: Mon, 12 May 2025 00:13:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
Message-ID: <yxmlvcnfjk2nvkqz23lyid4itacrptgpair3zptz7wqsrecsr5@27euwgdw3zvn>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
 <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RrLFLDmK c=1 sm=1 tr=0 ts=6821130a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IBcEPC0dAfEB-spL9jgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: bngoXYv3uiJQWsIotnuRAhOWhZJ0qib4
X-Proofpoint-ORIG-GUID: bngoXYv3uiJQWsIotnuRAhOWhZJ0qib4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDIyNCBTYWx0ZWRfX+ooKvSr3n4qB
 F4Yq+frIM+qi/3kGdKtFNIKFvUnt0Z2XQ1nyRYNppaT5hWeLt0qBwxlCzksCVvyHzShCbGuXNNT
 8VsFGlZiLKavvuhHGQb+WvqlP+fLuJULnMUip3LoYlEiPHqFyqngcH41buqsCAdGrGagu++6DmW
 T7xcNoxxCxNTsI00gQB/o/mWPKYCjbUJftdtiUScVA8k47pJi9bG/nwk4EdF8neeavbpqFkvDl/
 y5p6s6zp1Q9zqMJMJxXMarXRTh2ND0jeQMhy3KpO6K2vkD9hg0rjS/DrqnRle00JXN1QP95dMvx
 iAMphVFzsgHQAwFkrmUoE/CaTS7gKNM6zSb6iM+6pxj/ovCYL7W9Wccz80/NJK8xErtw1Pj+xFN
 1UH9A7WxcL6rqdvJ0ahYuJq8etsDUEDQ5Myq40t/eEFgcmhFla6yIzOw5p8WKlPni90Anw1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505110224

On Fri, May 09, 2025 at 02:28:55PM +0200, Konrad Dybcio wrote:
> On 5/8/25 10:12 PM, Connor Abbott wrote:
> > On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Add a file that will serve as a single source of truth for UBWC
> >> configuration data for various multimedia blocks.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> >> +struct qcom_ubwc_cfg_data {
> >> +       u32 ubwc_enc_version;
> >> +       /* Can be read from MDSS_BASE + 0x58 */
> >> +       u32 ubwc_dec_version;
> >> +       u32 ubwc_swizzle;
> >> +       int highest_bank_bit;
> >> +       bool ubwc_bank_spread;
> >> +       bool macrotile_mode;
> >> +       u32 mdss_reg_bus_bw;
> > 
> > This doesn't really seem relevant to UBWC?
> 
> I'll admit I just took it with the rest of properties for a simpler transition.
> 
> Generally, we could ma-a-a-aybe just make up a common value and pray it doesn't
> break anything, as we're taking numbers that translate to ANYTHING_ABOVE_OFF or
> ANYTHING_ABOVE_OFF_PLUS_1 in most cases wrt a cpu-ipblock path.

I'd rather not do that. Let me check if I can cook it on top of your
series.

> 
> > 
> >> +};
> > 
> > The comments should be copied over from the Adreno struct. That was
> > the main way the meaning of most of these was documented and you're
> > deleting it here.
> 
> I'll do that.
> 
> Konrad

-- 
With best wishes
Dmitry

