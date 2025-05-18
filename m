Return-Path: <linux-arm-msm+bounces-58307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D1BABAEF4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAF26179CF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC9A1DA617;
	Sun, 18 May 2025 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adQzHKR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF6B15B135
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747560279; cv=none; b=Lu6fSzcgFRn+JIrqPGq/mbLpg3J5huT8brizPLDzHEIkGk8V5aZFRTiyLUZpjA+MdOD3fwbIBtCF4MvFLb4FZbntwhQTGld5XFtClzmaiKkoEIcalLyBj97hFmIsB3X5/EIYWmqLiX7u+FoDyES2XXmTE/fv6sRjn1Q8shtPkT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747560279; c=relaxed/simple;
	bh=PhHK2FXoRq2s0pTtxUn+yOnnS1G9sDM8RBCPRarSPVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx5AsF3UT1Nuq/StKkHikZs2rFVc1P+A+GGrUYSoT+hP73yrJxomwMOK9KVoHBRqcmLeuXR697moiEgRbferGGx4oETOFkDj97iOWSmDbATyn94g6b8vmxXVYSG9NhdRRom9kHPj4Tl9Lbo6srwX+k5s27OMOLwY8amDEo4T00Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adQzHKR2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5G903015225
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cassb7i5I8/SYZylgZkn2Lai
	Ek52xXRH5Ohypr5QZYk=; b=adQzHKR2kXA8BIRR3Kai8lgmv8my4rTW8F5Lo9Mv
	84JOrGTiZpixym+d5tEvtAyo7J6ykla60xAfumz6ZiZ7+eRiiG6HGx+sgX7IJ9zd
	MObM+pANPBeKL6/tq6uPTi/vHqnY00uCnzekngAgHiTPnfrdbODPI6NgnbJ/wEX0
	WSaQC0/y5+UbQS1wACa7oHoXvdmC00V0/RJYWvbmYrVBXU6EQSP186e8vfCPBRzI
	4aSPvVRG8D3fka2OiH07bZVhM354RlDA8dt7/9sO380ED17t6aDlJWGID79XkJHp
	00BaJPN7fYgUxj1H8g/TELlPuVKYVtzAE9rsO2ig34bdQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9q1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:24:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caef20a528so938458485a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 02:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747560276; x=1748165076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cassb7i5I8/SYZylgZkn2LaiEk52xXRH5Ohypr5QZYk=;
        b=tWFLnxN44ZtTrtFpz5Qv/Ax1Q7n48ZhTad3jtwERwXyWzdhkcnnfoyEFsQFV6dD05V
         0FDL2x/QTnPRY7SmCoUyZ7lwDzcSNltWf9x3PFHjhlAWVyIs/bJPQkdhCYcm1pTa+i4/
         ygIWePHm1y40HrRewfEmeenb5w47Y295f9Uq1hbYj/dC0+3OHQkVV+Vi0WuTvmqzLaln
         mYxW6bHGSlj1Q7TnbAWTjkIkfcTvqcxeHdcB7zW0/qcZu0fo7Ha9+XXpfQC5TSPcOD5d
         5m2Ub6sYWoEKj8DFjqxht1ITMc9nTfgslEbWgIBgFm/1QdRc3rdqbatA+TIkvukJXjXN
         L+qg==
X-Forwarded-Encrypted: i=1; AJvYcCU0P/tNgnXMzWay7r/n/rnoVcmowW49XAH9WFjD733DA3Rgi5wV+mijlO1r8I5wj6S+eyobc8gLpFvJ4rcD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqc2xaWLCy3PmOyvqQMZk0TeiFET106cnF1WEQwDcEe5lKhyuY
	7Mtd7iESg7ajaXt6SDgmaSDgT+TMSWj5VBwORnoM+3ypKs3jgsFRIsy72jbBWCu5Q6qhiUqbDTM
	6bJ2E1H+INTM6uf/WCXZsIM3cmEvEpdKOjTIxBDMDvd7bQcst5J48NnbyeYaxqbMDTSa9
X-Gm-Gg: ASbGnctWtzttRNswRamfYy41M9jX1jUqw0p0a00eMIG3K8s/qETBhSX0QLxzxh151Cv
	8ZbZNDA5CkCTCh5ETKyhDDvvkDOjc6L1i7PTGXLdL/+nZgDIUmSeg0vioDk4X9DcOzmidjQpjH+
	/FltjX9aU6QKzx/s09wyxZwsSI2aWh7YBB0YUsgP43LhTIqNJZm6y5XhFliAa7k1J/tx5FUQjHn
	ipWSe5+yFoKRiJotC7TvUITuJFhKEQ8lJj0ystOXrLIJhA9SDaqtcpWzmawpl8PbY/BA9HJDRvu
	eAHng5nfulJa8Q6Ie/kWKgWyT9PXcgbIycMIru9wR1ladic5Bh3MPlu3E9RUzNQxqEyjcstXj1s
	=
X-Received: by 2002:a05:620a:258a:b0:7c5:9fd3:a90b with SMTP id af79cd13be357-7cd47fd378cmr1294153685a.47.1747560276195;
        Sun, 18 May 2025 02:24:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC5ZqsVwWr6A16sgKTeonBBfbSpuGBerXLhUNTVdBGhWSe3zc15GZX5mKJSEeRqdCHfL4ZFQ==
X-Received: by 2002:a05:620a:258a:b0:7c5:9fd3:a90b with SMTP id af79cd13be357-7cd47fd378cmr1294151685a.47.1747560275904;
        Sun, 18 May 2025 02:24:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701b684sm1359006e87.148.2025.05.18.02.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:24:33 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
Message-ID: <aza7hgcraahr56qhmremmkfqqvpodgohzmn6iogwqx7x424hny@fopwt6tk3uyu>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4OCBTYWx0ZWRfX9iL5nijOWaNf
 2ZI6pl/a6ysGMp0LXVrncKr/TzYwu1ZeiBof75S92iX7cw091fzVE+VlyxUOLscqgJMMA3ERqVw
 WOMZskOM+hn8WwJ/+dZDjom0ObD+65tkP8P+GQI2lI0VvPKbPb8pxXYtSumK9WV7qRMWsoFTXjO
 a5BsblPBlbIwswjzAsK04CN0FZ31k1g6adifEtMZut4pZbHPNtruZsOuMTnWrjD8qRwx/IOm+qi
 4ockl69L4nbA2WpCvIZXoPs91cnn7WJ5YKugCJFHghtcRwyjy84hNM4V7W8HixgceDQtRXuHm5U
 +gRD1YNfiq0uDqk4rdmQZHWO0wvOcGUCLnXL73EirD4+xjJn0zaxeMOhD9Bd4SX3+5YfnESOTsY
 OVC2cExja7hgLRoHWBNpXYsjn3AoWjDvDLgXlIIaMV9AnEAyIH3FlwlViNbT1K7EbsdT5CyA
X-Proofpoint-ORIG-GUID: 0y74MG0KIYqb23NHpab33L_2eVWNBHx3
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829a755 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UiqBTq1rjkrdqcEHUKQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0y74MG0KIYqb23NHpab33L_2eVWNBHx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=779 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180088

On Sat, May 17, 2025 at 07:32:39PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
> as a separate field.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

