Return-Path: <linux-arm-msm+bounces-70364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB67B315B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BF675E324C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201832F8BF9;
	Fri, 22 Aug 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4g/xQEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D49C2F49EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859549; cv=none; b=DSFqzjHvx+sWr5EuBGMtf0yV+LF9s1PhRBANGYPJA+xK2jHEVA43Nl3LU2VC4EXs0tNhBNjlSLak9U0h1xIbx8FPe3ffpqCXzdwdpzJC51Set8wAKFjVdz8m+QDeq2l8Wi1V14rAn+iOVbjXBLUSb46h79WqkTQBi7fS1gEYnUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859549; c=relaxed/simple;
	bh=4Da/rNoRqu+KdQDZuIFjb/Wxr29c5xO+u3Hrcn4ak98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEa5ESrS08hKRiypT603r/J7/E8o47rNe+Vd2pgmnZC9UOebP3F4PiUnfkRQquL7Uvanmq5Pa93pZX5elydZHwxI2b7ZPyIt5jN2qpndLUjhwyGbKPt3OkH+ENNJs3DjHi3pz1jSljTpA8eSul63VQryJB7/B2d+i86sFyVknwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4g/xQEJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UMt6024183
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hr+Bv/Zl6+bC+J6poy0J+QYU
	64VF4tnwHUKsj9xxJFc=; b=G4g/xQEJnImASM53PVeNpVVagZBInqutQoH4kfyM
	hClyz50JGBjRwqoLX6m6KzuXLQweSIbWBHT+AAY1JTlqWIp8sQmtmUrJKPqgvH1J
	QyZv7i6OpByAXOd1178UhgFbXK2xrd0xyrOnmSyF9K/337WSx6S3NmAgIimdm8gP
	ybYPq3x9asUlaed37uphv23dIJRUka3JbUdEYmy0LnzBpOUtienbH03fVCbJZNrj
	bXUNPcXQaSlm2iZOH4RQ4XGpFg02gvLAcY9VkazpOiveMH5uKvvdNNqK9FljrzWY
	xVZPiion8T15WfZz53N26BtSlG2MPn5WXL0J/pZ+7+lAzQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52agyxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:45:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d9eb2eb9bso5436986d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859544; x=1756464344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr+Bv/Zl6+bC+J6poy0J+QYU64VF4tnwHUKsj9xxJFc=;
        b=KJvYmN8OmFl2d5EtsuIT8Dx2QnImRe+vR38bUvnAOoPXhAe4gWj2MNmrGNkLmLKCjv
         b4zQyXd50KXahGWW5/bq5Qfm59yIVJ1wsIhVl3LBLzF7t7yRCOEfZC9HkOXePD1FRAcj
         zfrYBudSzel4x2rrpkoM1djDjrhoFAppFaNi/PyhRFBFsXztfND1s3ZmFe/KdBxTpIfQ
         wnh4sxrBmffHwXBVUl+cLCHXXQFofX5rCBPjADlMI32dbJe2lql/VjmLGgtIrOtkVwGK
         vx3GkjQajp91iyCkOnCnLR0kBGOwBFvWVw+d3geierur9ph4YIYpMnanxo/d8WnnpBHy
         v7qg==
X-Forwarded-Encrypted: i=1; AJvYcCXDTj2PkRmFn8f8dawkmtpc5MUKztLukQFtTQCkhPiKv8aQeZzcnZ/7tTF7fHcNyGd0MGKXaUKfNjLpSZo5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/dIjvFeKfJdO7qNDQD2ZO4+Bq6Di59BgjFDuGeWRmG1v/QZtx
	Q6RZkuRm7qsw/JWlN+l7rUGIY0QbdgZ+39bWjQOvq1CxHeThbXebYWay/9OWe8d5T8TvaA9z4lx
	ufY1EYoy3MPhCd6nJevOS6yWaecP7hzNIeYpYGqzVbqsOjaGZ+wzrbx1tKTOFVo6gT1zo
X-Gm-Gg: ASbGncvaumLb2BHcQQIVcO2H5bJxpENbzkswC2ijIk+GeyG+auEJmT+GAiR/Dp/WVx+
	grRIApvizQyXWqthGRYexyI99byXzqBezh/dnJ6MJRk2dmGVMhIwwfVFrowW7ByFy1n+0Hjguq7
	6/SoY/c9/b2c3d4m7WGwSRG1HJa0p2oRAfk3jz/7zPx87vNQol0gyuaf2EM+4bWeFDHkUEYHS/Q
	1n/3rh9fUzmWVZWr7bpG5WkREj9/+KM/rq1qrVXP1sit+y9QJp9ZVKpohicMbLjQyTibbIiswVU
	KY/L4diSynwo4aoT36aqr07BYMA0J4pNdvd+a41lfMpZqVQQ8DWZTfBcUnDbL2P8pgXqznlTke0
	v1WZC6Wfujbv5SxCA2OjZhXC0Kph64IiSivS4OduhjhJkoF20ok83
X-Received: by 2002:a05:6214:226d:b0:709:349d:14b3 with SMTP id 6a1803df08f44-70d9720675fmr28383366d6.47.1755859544314;
        Fri, 22 Aug 2025 03:45:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsiu+jZSuPp3DRAgJjk7+bqDL+G4Om108FdlP41DzJWGtQBNAjJ43xnePD/yq1clCP/p+4XQ==
X-Received: by 2002:a05:6214:226d:b0:709:349d:14b3 with SMTP id 6a1803df08f44-70d9720675fmr28383086d6.47.1755859543653;
        Fri, 22 Aug 2025 03:45:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55df8db7463sm2149334e87.166.2025.08.22.03.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:45:41 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:45:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH v1 1/1] soc: qcom: pd-mapper: Add SM8750 compatible
Message-ID: <ccr4gnk5dehm5mjybyumu5yayde2wws7soiqv2cuqauggfcenz@qdzhzm2kewog>
References: <20250821160618.1037157-1-quic_pkumpatl@quicinc.com>
 <20250821160618.1037157-2-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821160618.1037157-2-quic_pkumpatl@quicinc.com>
X-Proofpoint-ORIG-GUID: pGknyvXTe-z5_isVVWzzIs0w9CC_ddg3
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a84a59 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5LXwvtfwI9oVQe0OSlgA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pGknyvXTe-z5_isVVWzzIs0w9CC_ddg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzGnz7KcQeeWj
 La8JCBz5IENQYurT/SbAL5MWZ4hf48XVzAmvPtugn4a8Ct+W2TC/i/N85xkXc3XQlJnjdDJuJx4
 I56oEUkBM3wBYY/MzCUxtIUcpg1SXNpk55wirbawIGv3QiP7nNfQGutU6BfHk5eflNec/3PExK3
 DU7SleB+V0hOvg8+pom/8B6quNXw6qMcKi9W811Rd1m7pkfBzRTEZNSw042EEcbZ8ySjV8g1dn9
 H594MOr5e2tNYJq9+x5MP+WpPsCtUiIgis9DG5dxv7m50c8Orc1PiTtTro3GzDxFRnxcLAIpp3Q
 PvWCvLAfmY+gMr2rEfUq0eWVLeunlieNycsap5lz+fE/Ag0eGiNwEmR6h82dcstnF6o7HBs095b
 QdBJ6JJYpMGQWslFST7got7w9vg00g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 09:36:18PM +0530, Prasad Kumpatla wrote:
> Add support for the Qualcomm SM8750 SoC to the protection
> domain mapper. SM8750 shares the same protection domain
> configuration as SM8550, so reuse the existing SM8550 domain data.
> 
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

