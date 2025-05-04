Return-Path: <linux-arm-msm+bounces-56703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA604AA8777
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 17:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A36A53B5B18
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 15:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797101A8412;
	Sun,  4 May 2025 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSziVuPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E4413A86C
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746374207; cv=none; b=jJaBzvndswp10jK7OQcRGjnJAOBaw1QfnLkHR3u5HmLNuxs5Wdq7Rv5JGJbDG08Lut4k5y4+EcAXuPbfoNVl0EbDuW8cBgS2zfMwzReg/wTbz/eQmje+o69sUuSltSwx1MMYra3X7DTdiRCOz66IXxFwFtVb19HRy5FzG5FBPc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746374207; c=relaxed/simple;
	bh=QEOJkA3etMlLHU4ekcQkPSteBUYWoWBdktp1CtObWWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggj1XdU9/a8i4YYjJm83LVE+14IxT1zfUDYmDT9aIUjyID2IHj0zUXsNUhyH0SD/HyA415mZlnOZctpU2oP2h2q++pQk3mefYHlK09kJ5+GRBcMChcPFaTtkWkAEVUMtNK7d1xh0yiAHwH/d8rinNm5EMI0Y1edRW0DIwkLJa6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSziVuPN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544CEBt1022351
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 15:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fU7EPeiJhp/W6CddOsK+6Ixi
	fqtfkJGM4QHGsWZLeEI=; b=WSziVuPNpJ3zezhWR4Lq8u80nMe0L9Mn94da4JgH
	gMv4OLRdHdkmx/uqaifOcb6KK9tLXRFEiI91Gc7mtHbG+Hj4MrZrAUMx+huA2wtk
	EJFZwFpoYa6PWbksPWfOSXWL3JmJrJzFqSM7mVwmvWpbGM/1Y0HnBgkHNCcIhEy2
	xIfoNMLF6gWGGkHvnJx/T9YZ0UsF2gmXwPRsNUFdAy6tvNysRBnn6uyQ6Y8mxbTx
	moTHuxGMGmjtpqvkhdfbqcbexET7R1hWvS/TdfJYH9WY3GQLvizrED4Yv/F5B+R0
	Gl9zTtrODHinAi9YgC16ayGYN8z5N8Lv+5ihEooqFOmUuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9a22x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 15:56:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476664bffbeso69375221cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 08:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746374202; x=1746979002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU7EPeiJhp/W6CddOsK+6IxifqtfkJGM4QHGsWZLeEI=;
        b=KYF8+bNtNVYQjaCvsau4HIcxY+9gKqNGrlHeOfyphPOdl29dJ3NKVCiqzjR5RFb+//
         As5ju3/JnZTfKtVG5UYIOf64XFPNpyLs9DheiSVmC+6Ib+7QUit3M6bF4Dbw5CPLlBju
         0FpV7uOsFz996TqWd00jYQFzQm1VbHYqdsfCzTO50TBd234OCKURVF/zdgax0UxFPSD8
         Wc/kVxAsR78CAIjt/A9fA/MV2dpl7/lGfNa94xcOBGZxObQs2yahfARlFql2SkD8c1CI
         QLUgIojcfKRJnNlkfVYNSDBZgG5QTbHNCd4mnrM4TDQc4qmR+M7AzfarxD+lP6WI1kyK
         wnSw==
X-Forwarded-Encrypted: i=1; AJvYcCUrSO05NYH8LIg8KOcwQ/6nIxIuo4WKnv6TL8WM4QpyHCWat32W9TQt1+La3AeydE9/wJho3qYHODmVYRhF@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9fXmxH8zxsQsFJa3SFA4WlaD7bErFdTDE3dNkBs/Y3e6Azhb
	/tPgQbDPc7ryOAO1YAPAmXzQinv1rklwiRwGZ/L75T2GHoebBohZ8Dw8bQnEoM19ZA8Jj22ahWa
	i+GYAWTBWHP1eoY0aGDP2crbKOEQC5inQT24yX/N2tu5sxqEhJAa4PHE0yKaCdk5b
X-Gm-Gg: ASbGncsye0RcaQ8ZvFl5MEZNPcJLqOy7gfeH/Wczk2F4XUpoi0PS3PY30hkMPlhZ7em
	M7i1y/9PcBFOzlFCczRbSJhxWu1tekX/shaQlHOmrK0r+jXk37JCmgSFAsdlz+5HPHm0e9XrBUl
	uYz81q17OC6Kh8kcYFGxAloPOI7tEqOd0/LM2By4ZhcZkKMxn3gzV7uZw3JZ153IuuUDnn+CY7u
	fA/+5M27Tv9nfEpQp17giaW4ZALBDwTutFwbWDeCxbA9A+lqvmdGVp+HjJBA4lbahYsI/2kOKam
	MxHnJjj7dshvAmefPaRM49SzDJ6OU0yiBYGQdDFx1l4STWPyZx5kY5AJhwto41LFuDUmpBKHKfg
	=
X-Received: by 2002:a05:622a:350:b0:48a:f7d7:f9f8 with SMTP id d75a77b69052e-48dff9db952mr69708851cf.14.1746374202464;
        Sun, 04 May 2025 08:56:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN4u9AyjqDi5g8VZkq9PYV4kNa6a/Ba8/S+CxQZZMJL5dOCD2iDARt0FReF8lX95lkfsxStw==
X-Received: by 2002:a05:622a:350:b0:48a:f7d7:f9f8 with SMTP id d75a77b69052e-48dff9db952mr69708641cf.14.1746374202092;
        Sun, 04 May 2025 08:56:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c8d40sm1309157e87.98.2025.05.04.08.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 08:56:41 -0700 (PDT)
Date: Sun, 4 May 2025 18:56:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V4 07/11] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and
 Inline qmp_ufs_com_exit()
Message-ID: <bu6jivw4mtxcxo7vyoeuzn3unck4ehpsknwmhp4rbm4rkudt6b@xenhgqvyltug>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-8-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503162440.2954-8-quic_nitirawa@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE0OSBTYWx0ZWRfX9r1jzb1Obu64
 oSXSMzXMKiurvugta8ibWt3SNTtLiS/IFbGDOL8dJss26YyMsya6emt2tZ6dDEkqg6yofFCZix3
 6iCAD+6n/GcdzLuBs6TNy7CqsKu1R/2yDmXG+p/Rs+UY2LNhWqnFpvm7JOquEFDqj0ZUXyVMixB
 o3xPIhzfpVZxBJET3TVBOGpFFnYz6ppQZu1LLkjeJLJqK0dNMNheZBwAiEAUs02JwrEuEKjnHiW
 bXQ6ZBbDDE1zkgRbkkDvsPMLR3rOQwoJ+suMhG8DAmam3CjFyijdZKvwrwYbI72xC57qY0nUYZ+
 nnjFvv0moeuhfveknK96X3fS+iQFiyy3yf+BwHMR+SZdZuhzm3q0FWWDWjMjBojHf4LmtgUgwOE
 ke9iSw1r9tGBoalt/nKHlziRAKVhL9dg0iniWLPVSShBQWWwpB/7utwc8Mt+BWEWtK1XYV2h
X-Proofpoint-ORIG-GUID: WnTWinBgaXkQG4RQjBbn77vsn-PaULVD
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68178e3b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CU_EFOmFiVvtlzqC2ZoA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WnTWinBgaXkQG4RQjBbn77vsn-PaULVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=788 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040149

On Sat, May 03, 2025 at 09:54:36PM +0530, Nitin Rawat wrote:
> qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
> Remove it to simplify the ufs phy driver.
> 
> Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
> into qmp_ufs_power_off function to avoid unnecessary function call.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 29 +++++--------------------
>  1 file changed, 5 insertions(+), 24 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

