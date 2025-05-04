Return-Path: <linux-arm-msm+bounces-56699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9AAA874A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 17:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 558703ABD70
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 15:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646A91A4F12;
	Sun,  4 May 2025 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEjiQ9sv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C503FA32
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746372471; cv=none; b=ag/Ylp3zXXUJU4wmvWOGKDiQ37bYuv7dIDKRWlB/uRDGyhFDEFsssKLvy8M6jq2VU8e0IBBfFg+3oMUR9oro+zfhkYj5Y89CN+6BPi6CWG89H411HT0KnaV2yqPceioXBPDstFrQYMA5Gqi8XadblhxrP9B0r9XmhH5Fl2pxAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746372471; c=relaxed/simple;
	bh=LUmwgjsGIZY3yOOJYl4bu107Ntl6Jtj40wTSgSGzqeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkGENkDb5B2giv3Fw/5tidWyEcQa5ub00EMZn1vqb2/pxInZeu13xM50oukQo4QU++jZxgeF2jDA8GSyvme63wE3oDYSrKK/9TRTVuT9RPl83EsrkDuzZ3JMOcXAaqeOOkVnInUbLN4kGUY5k8tWmQVQ9p8sjJ8bQSLyNthzyRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEjiQ9sv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5444fnLC005482
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 15:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMiOZyNbZ5taHnkDse6HWXJ6
	dUdIIbmPQ3Vxz/Yy7xI=; b=OEjiQ9svz1JEfaxj2JOruNUd826815zcljHZNM/i
	MyxtwzNfmBwd3UMcPzkt2dqVE5sfBBjJPA+GYtHqP0XdbjeQL+WIxReGWvCG9JGT
	q0IzTeWwrFRREV58xBnBKgtKHSCAsO6czaGLTZfoZTQmqFNaQfp/Cy30uE4s8iDx
	5baCw6/DIviJNWSaiQRzoPxB5uIrVrJ1wbJsJTr+uI1BmkB4I/3KYcTgSVIDUFnA
	Fh3bWVKzoAOpGGrr3bbayRPXMGvHul5FTP0r8dtFM3kSSQlwSdJs6IhKTBS7SLYM
	oGAl5sXC5Ta8mrUBQSlUhVFtJhGPaS8StNthjlSnISCDtA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsrmw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 15:27:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3c8f8ab79so58197885a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 08:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746372458; x=1746977258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMiOZyNbZ5taHnkDse6HWXJ6dUdIIbmPQ3Vxz/Yy7xI=;
        b=Qx8Ompequ/bESl52iQOus3LVMYpsF1aCsIMJcU4CwKQb45Rbcd6hmLgquy/q12K+Yv
         Ret0aPo2ws56AQPiBmIisRjVhRqT03FRVapSkE7UPdM2SLEALNse5o0VOcerc3LY3eQl
         d3cnm2cz5kzEgZ/kPQsxPWjU9vK0CdXtqK2qUFNs88s4njA/m/lOTh7hA+u+9YA2g5az
         q2Z/3ueF7j74Fq3BpfOV1JtvUyD7qaMXYgHD3jHN0NGv+tG1EAT/6GqfevU+Gdugj/E1
         fW0rpBMzN8Sl9NXk3cyqivv6zb6At2hTSPbWD9OV8Sh+9gQfUVWpxNAekB7lgNyT4QIQ
         FCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUquuXIfJEXExwjlVLvTJS2YM5KB8tMwz75YyLdwIpr4oVYj1H2N+pg7FOc5OL8bo1zp7FnTmRJtAcZsxKX@vger.kernel.org
X-Gm-Message-State: AOJu0YxFjd7KTlRyQLU/kaCsWAC+W8pxNZL7ye0G6VoHDooAp2ti+qfD
	nye5qW+5YyuS/8au/OTbgqUkCCfp76BU0a/15yH20C9MI5zFm0clphQFYGh5QDI7EX4FEBLe+3S
	viy4VFNFqUkztqMhtW12d0sXyuEkgBDD2cK0NTm0ABqtqhd338SAN5LcYRb27J+bT
X-Gm-Gg: ASbGncveI+2pqSRpXMlMx09JyUbvUr7R7L3iguSEv4eTNe0AqCCkUciA2nYZtITZzrl
	tV3wgWdgcLx3WFeLpLn4ADXU0H5VAcIeHzj6iFbei9itPm9s3Ei0sOgoqln4JSIVMF87XOkwXWu
	YkvW1+81c59ZVHw1jxCKqL+y/pKs/HkDamBwTcorkq5bJCmfCz5/6fj1ooh3wQVdQ0E6NIBOJC2
	eQwcsJG+zkfVPETEWXSxp4SQh/jlZrcUduU06AXXCm1Tflist1vM51THCIUKQ9PQEWLbGwhTKAE
	yQ5iv/Kgw3z3i5FZEq4jGPARi66HUmbheE8kljlwwTkmV+GMqA9XExurdELDJiMLOtNcg/dT3yk
	=
X-Received: by 2002:a05:620a:454d:b0:7c9:2537:be51 with SMTP id af79cd13be357-7cadfdd5c66mr743897285a.24.1746372458203;
        Sun, 04 May 2025 08:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVX+z7TEc6vt6ylfXVwNT1h9JQA48LH+Jzgzss3FvyThLUZMiNGTS8I+avTmoIzuwv2wL0/w==
X-Received: by 2002:a05:620a:454d:b0:7c9:2537:be51 with SMTP id af79cd13be357-7cadfdd5c66mr743895685a.24.1746372457874;
        Sun, 04 May 2025 08:27:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b179bsm1291505e87.27.2025.05.04.08.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 08:27:37 -0700 (PDT)
Date: Sun, 4 May 2025 18:27:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V4 04/11] phy: qcom-qmp-ufs: Refactor UFS PHY reset
Message-ID: <4nfhtdavca4aqiqfct2wvqdwq5kskfzh5kffnz7utnyreiichw@giixjxypwdcq>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-5-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503162440.2954-5-quic_nitirawa@quicinc.com>
X-Proofpoint-GUID: HUfMnfbrneImNEjvHd-fC7z8JN1U0ot0
X-Proofpoint-ORIG-GUID: HUfMnfbrneImNEjvHd-fC7z8JN1U0ot0
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68178774 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=eTLblWtPMpn9__zQJdEA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE0NSBTYWx0ZWRfXwAoSCR+7V5Xt
 Rwc+oWHUMRcFoO57E/2WZkZ4D9yzeXGX6exy82cofXESOxMXNqDV5NX+kkM3Q31dAaKSKJEISM8
 ufc5MbipkTRxN4UIy8DsngjlEekSB/CvRi0zi8wLpMfAsBa84kCepigCwK2xp8vyoAjTRjDjwF4
 Sexm4gsJ16rvvq3pbCgbRQdzXup4yXqyGSNLpR3sqXylAVQcv33a/w7NkjiBpnV0ScMe9yUrpxQ
 Ld+nkIwb0R901QpJigsOQ5Bus8ihobz+wKRNeEZzoDbY7NRV/97EL+uEqSiEooopnvEsdQ3hCYK
 OU+OweRAAQMcq7azdwScP51PUP8YKUhcaoOewN7hGlX3Z7MckBTUoU42YKM7NO67rgnkr5J/gI9
 SwwmBgZ8X3OkN8sZq/8aik+7DSwK6m+m3tMDE5IoG4ye7UCi0jvpa8K03HR/+6lYJgb4LrUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040145

On Sat, May 03, 2025 at 09:54:33PM +0530, Nitin Rawat wrote:
> Refactor the UFS PHY reset handling to parse the reset logic only once
> during initialization, instead of every resume.
> 
> As part of this change, move the UFS PHY reset parsing logic from
> qmp_phy_power_on to the new qmp_ufs_phy_init function.
> 
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++------------
>  1 file changed, 31 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

