Return-Path: <linux-arm-msm+bounces-79204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BEC1577D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4293B461ED3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6776F33F8BE;
	Tue, 28 Oct 2025 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhbZFqaO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D23338F36
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665416; cv=none; b=fcOSYAJ9YQWVf3u9w+VoLAxFW6+/M0iIHBlkC4H4scDqsqNTgdrx8o+fgxNUy3cFeYoSuktyipZOR2xZeW+ikgQb02g5ENr3Cs+Th6sy2cuiqj1G5kIOAqiC+fRm8VcC5/1+NpUs42Ok8fNbHgpY8UOLS42H2sm7ZifoJWLAQFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665416; c=relaxed/simple;
	bh=GYKf1Zkv3JxGImNaWPJcp2l4cntA4Qaaj3JKVyCraHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgZSnioRppUdUxz7wH0V6kWuc3kmNodLafhxGaw427kwGxBj1sH0sL534ZT/vXfIfmLUkXJdP+NGSfBaJi5vzgOfWhCaR73NuOgX603m0IUvr/k3uV84uIq+WfxbN/ZSSrH3VSC5J9m2yw8tEeIZyaaEN2p3Jcf1QvQJV1UHSkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhbZFqaO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEoOG11861146
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ziHqZ26Nre+FSZRTP4tBX/uS
	+PYMS+5i5oLrGECrPLM=; b=hhbZFqaOmXteW2bd4JXD5RuBAzvCex85WcsoAscz
	irviZx5zBy9QjeMtoSlW03/l8K+0Qj9oJee8Q1Q9CU2SzWZxCvHm+B469muBlRmP
	dr9IFYh9E2hUuQGkiM/KdVHIwTNaTw2YTtYYJ0/42XtTHWTQRi3rUFvMoCUCP6fv
	k9JqtjdtbAn/TU7INUaAR/PqVcx80TpJXPFigxWnUjmKAcUG4yAICytOdx88hqGz
	Gq25BVPyrl5jDklVoVJXPWaVa+W5zwqssdr8risfXEnQW8nMROXhuvD15R45osMo
	NES+EPHG5LWKjEcrx0UQFUkSXUCGrXjyrtRWdKT9W6ibUw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2ur3gy2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:30:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e894937010so171436621cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665413; x=1762270213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziHqZ26Nre+FSZRTP4tBX/uS+PYMS+5i5oLrGECrPLM=;
        b=FznuoZ5R+yZt460RNmCfjZJgP68Tflt+U0DB3ZUG56BdKIKR6RnP+8WQmYyMNShksN
         bx0nYVwdYd7Nus8sCJPUsG77JEcwE2J3dvZgz2Yq+c5FuSzvq89ePPcEVcbpLJut/u3T
         oVMbMl3T4if/lx0VyIXbwjFEH+3ZMFKOrhsVlj38fJzCPWqIz5inJv88f2r4VxTC1Fxn
         H/mRLiMX801theZG8T/VGhP6Zi6O786xHK5GBrTwev77gnB4blPkD7C7yLIWtllwrQWN
         3tAW6a/f2K7O+bFNU68ysZBUsahhLhZhJ12vdPTiekNkJEdO4fKFRpkYyxBU7QzNZspN
         ElfA==
X-Forwarded-Encrypted: i=1; AJvYcCVe3QIezh3Qdi47wu1pZpTAFyChwulsbo7YtbhjkTcAIT0Tqz3BO+O5xKcyt9PZLR5Cc7FAhU2yGp4B4dnx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+c0BntiObcqVvNV03CfByLVT933w2inFySSFmtuoF+UfgT96C
	agSxJS8GVh0iZZ6djuP4YFqrLA2c10crD6FRi0M6O++CtAG2648+/MGlMBQEP8Z6yg5SogAaeKu
	TrSR+q6pauTWFRhoxUDybBHEg71JY2n5BYPULFDhS3h1yro7r+AsCKPHopOEurL46cLBD
X-Gm-Gg: ASbGncuQIJgU246y6JaCn/zOD7kd3R/iAQB/sfuje3t7Ye0ehXoSLMa8P6MDbSk8LoI
	L3bJNmz4n7M5E+CsxrpO6vzJvhWOYMhRHy1+6nMWzaTbKjJ7heZttrprwO0kchyOouEsjZfOzsT
	EUfaZ9cMasYW5az9xRGH1yN20ADzaelcu29fGVvJ41AjuXXtB1jAerx9+7fffewYPUOP6oufOxR
	lyIlgJuG7O28oijKBXKm27+4I/CAOlABa+8FxC8Lis/n2h3qqqt2cnOAlAKSEnrEB4SCfwDvxPD
	B9bXzF8kM4LCYh4+oTg8zUoMyGZT1ftb1eMB/O7U2GimmYICPglcpzKy7gpmnO6l3TpPqEiOK91
	qRz2XcY+SkSjSehj+T4+mqSvG7L+30DHjgSp9J0uLhz6ON05HsVK2jnWLSr5iWlgl2WC26FgZZK
	lyVr7xXy25YM+N
X-Received: by 2002:a05:622a:11c5:b0:4ec:fa87:4652 with SMTP id d75a77b69052e-4ed13170110mr13343191cf.60.1761665412661;
        Tue, 28 Oct 2025 08:30:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg7P7iCAoIlm72fWxC4E6hnb4vx9CUyOoG5mm3iPgoXzkpB/+xZKhybNgY3uywIyNmJeQepw==
X-Received: by 2002:a05:622a:11c5:b0:4ec:fa87:4652 with SMTP id d75a77b69052e-4ed13170110mr13341941cf.60.1761665411805;
        Tue, 28 Oct 2025 08:30:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41cbbsm3174644e87.2.2025.10.28.08.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:30:11 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:30:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Skip setting orientation for UCSI
 version 2.0 and above
Message-ID: <mjgwv3soxgdcybkoo6xglxfpusswmjoyit4z3qpbnyhatj73od@ywmnx6vyupsi>
References: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-ucsi-glink-skip-orientation-for-ucsi-v2-v1-1-93e936ac59b4@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEzMCBTYWx0ZWRfX+fEjncOAHWez
 wsrck+fJMG+6Yh87AjEzLQLWjYfcQpwy1Mfkvz3ljnZojlC2Ll0Elo0CWe+n5BNiAkH4E3O6aKn
 Z2TCYuFKV5oCaWT5HmGPWbcau4a0iS37GzPTp7KMgDAcvS4x+eetUeApSaZgA99TmQXTw86czDy
 fNHQ0N5tLH/1/P0gBOftlMRZ7TOMdLuSE3WIaFHLroQVeBld6f5NdZY5QNl5RSQgA5uyL9qXoxQ
 ya5gAxYLaHQvtm1DSKnaVu6jR3usCEFersDVmUBNBxBLeqvqB2KTFcIU2RCRgGFD1IG3FDu5Ajt
 nuuvtN9IPoP0pOab/6/XsKNyKkS2VauBeOmO9tDbGfpy64t7rbEWo/PEJR/QFhdGELNBu5DadMn
 SaoYDChVAreHM2YhT7eqJffnR1xm4Q==
X-Authority-Analysis: v=2.4 cv=Jub8bc4C c=1 sm=1 tr=0 ts=6900e185 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8
 a=KoMzjsMEiVGJI_OJEYAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KE4aH4eewWkzMoxgzzPO6SBRaz7TKnsU
X-Proofpoint-ORIG-GUID: KE4aH4eewWkzMoxgzzPO6SBRaz7TKnsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280130

On Tue, Oct 28, 2025 at 04:39:19PM +0200, Abel Vesa wrote:
> In case of UCSI version 2.0 and above, if the orientation is set from
> glink as well, it will trigger the consumers along the graph (PHYs,
> repeaters and so on) to reconfigure a second time. This might break
> the consumer drivers which aren't currently implemented to drop the
> second request of setting the same orientation.

Might or breaks? What happens if the driver doesn't ignore the request?

> 
> So lets leave the orientation setting to the UCSI generic implementation
> for all platform that implement UCSI spec 2.0 and above.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

-- 
With best wishes
Dmitry

