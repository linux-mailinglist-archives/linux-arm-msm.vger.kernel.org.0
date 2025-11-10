Return-Path: <linux-arm-msm+bounces-81022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD82C46F4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B94188EFAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 13:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398FC311C21;
	Mon, 10 Nov 2025 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nu/5d/oG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlfD9z4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A784311C16
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781766; cv=none; b=FMvlRBu/K6BZpsSOjQeYvKmsnfbhpEFJgWizsN3+90hYv1j7X55UUJ+LxbmdXBSxT6bAbvpWJAWcBGFvCRSOkTVv7G2xpZKspwqNojrhUnsT4y6SUlUWRcU9sQ3FvzdSHImElgLw6eQavcVAt8Urpow7Mq64lZ9b91CKNh3T9t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781766; c=relaxed/simple;
	bh=QS9cmXQXKGnwoD3mp+GBzdPacfCPhiiv6IvqF7RF8mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOVTvi2gY9K9xAgGy9VTxxdAXi0qnad4I3ZcB29m2FMrdd427qiyffWnZKlpAM6XwuwBA2W+uTFJopPMSbjzp8/ewviAF3EHe8bBBiZG1G6t2fZFepgYXAozXEJgXfz7HdzVxj4GeuRIpXl1JKRqzseydC1Dpfx1I6dqpMp4DCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nu/5d/oG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlfD9z4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA8UKxK1809202
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=awc78OrtB3yTTjJ3NNR0OiAT
	MRveR6javZmhFpqenTE=; b=nu/5d/oGWTBNWdterKNkxMYu1n7CXAIf05HSkfEx
	ZLEz3kkLla/FdmoMAwmdlgPTDsOyMudJ5Ku1TkmlZGm6ySqR4bLqueSolciCEZee
	VJvY0uu3kZ8mVCh3kzQjn9bOdfGFj459ZprPA6FY6C3B1QG4Os0aPn246S+UBJjA
	eG64P7mpmzSKlXBtq/TD8pJB115bC3lvlsrUYMMvz41QJJmj0OK+G9PhY83wFTTm
	9GAY11HGbTZ/t7cq4AeDn7kboJgJqh40XStRlKR6DNfG09Iparb2swr0zrbxO/pQ
	s+U4VYUxk7UanBCg3SzfJdgLJJVs3EYaMlPKvXuv8vmZbg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1j17a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 13:36:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6466f2baso86215191cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 05:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762781760; x=1763386560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=awc78OrtB3yTTjJ3NNR0OiATMRveR6javZmhFpqenTE=;
        b=JlfD9z4YYMfXVsmqxxfxSpMHmbnHkdy8uOGnhoXHPd7qn29AtYbv1vP+yj8fqOg1zO
         1La6CCRRXaz2gahwXZBWCrik67CKHjHdZAk6b2ddhCmA1mYTD+gs15+f2fe8iSz1JceU
         YKU7u9czms7sQ1LYk166rH7G4GFKORnCWO9kq1WBgLDCtMtfFpnjcKD7p0Rw5VNmh6gD
         r423CU2VRcHABpUMDMAkoqkIsHxaI5D9NOxOO1txOuozIXSuKBcCaqw7uvhhhH960euZ
         4tUM8Cc7RqgwLOnOd0EDkD8so93hw0+rNBPQhdFVSuKmb+b2LnttDpT7BL8vX5DdLQm0
         WK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781760; x=1763386560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awc78OrtB3yTTjJ3NNR0OiATMRveR6javZmhFpqenTE=;
        b=Gir4yD8qgMpUAlfT8l1eQfWVz+P5gJNfg7LIHpKq4bcooFA9Ve5QVSsAMWqnPJA6K/
         bnf/CEcqRm96JBOBCdOyPGk8DElACpGef25snl9ZNrYJzQq3KkS9WtLK7+7ELlGCZgua
         pZCG1KAftAxHYKuLBoMedP5yko/BEnkuMyy0u7OKp+X776J6T3dgFXm7AhEleMiPc7EO
         qMaFzNB41fQ17hDqtqwrtKRyo7mFiVMj14okVx6S9k3jcpkGpc3g7cybK1AZqpsK9tM1
         ifHugcaCGKdxreIyq1fCN7Z6MFz1lzCVBnCcjKdNbd9aHf27tempNjYErJnxb/rwgXJp
         LPOA==
X-Forwarded-Encrypted: i=1; AJvYcCWJMkeYXP9FJdxbV02ipY1K2s3IX6xNNtAk9FsSa3eSsvXgmbBcL/zOQHwknopMLu1vHh92/lGRxWvckgFj@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6idSo+9QGf90QZDvSp2MKJ/3MTLZQPl3tSf/TTpURtJzpKZd
	lmJ46ifpSPCS0jlZERaRn54NuFvcTYPv65L4U9ekgxqAqkRlTcyrguSU+vbp5FmyYyq5so9o3Yz
	VQ++SxgeKsS4/Unfy/hXCZ9lWv33lHHpRz3TqTff/tuMUKkl+TTiuAErrrbPn/VeTSkAu
X-Gm-Gg: ASbGncvsM/p2SOP6I1k8fy3wnfcIZQac6r1l+HceNkKeKYio1IREvEuMkwvc6UDDdcr
	Kvk7RIm4ANcaJ5pFk6fW6tZ1t1rKUE2fi8icjS+eLMc+uQzPRBrvV1U3uijwX/OO769M3buAnN9
	LTA6l6LSo9Fhp/hHQlYAMieEC4QwAqJoDsZYnnB75gp8F6EcGLiDZlnflHuxAI2wrbGlDXTHDyb
	lxIzuBZoDBY/iCfEhAVbczCdaONOCkVUntYqSAPW5eu0W7DKduBLYIDbytvt/Mvr4WoTkE5KyNt
	wIxdh/v7MQk/SaV/RAJKhaDuL28JYTNvVplPHCAhg9svYH29bRJ6LEFxtoyBJdvBxNOmOzknRG8
	qRMSW9UTb76xbsiAStWlnqxRs9yjTSdtRrLe44ZRLYDuxympfR8rlcg0zeHyQmDnE6XcysQPofZ
	mSQ7GRS9upb/bP
X-Received: by 2002:a05:622a:1a97:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4eda4edad2fmr84130851cf.28.1762781760584;
        Mon, 10 Nov 2025 05:36:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXJ5BT/q7g/MBAV87Zw3lOF0GB6xqxQQW1RPh+OIbihbzKHhzyxU1QwSdJdQsAkfFK4qJhZw==
X-Received: by 2002:a05:622a:1a97:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4eda4edad2fmr84130551cf.28.1762781760095;
        Mon, 10 Nov 2025 05:36:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a024f49sm4049881e87.42.2025.11.10.05.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 05:35:59 -0800 (PST)
Date: Mon, 10 Nov 2025 15:35:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v3] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
Message-ID: <l2djrmw5i7dfvlrqyn3a5yrohbtpxr72xwwrgojvsfwo7w4feb@254rjgan2fyz>
References: <20251105-iris-seek-fix-v3-1-279debaba37a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-iris-seek-fix-v3-1-279debaba37a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDExOCBTYWx0ZWRfX58aH5fHmeS2a
 nbZ5rm3ymkqgdVN323wpoT39IKSw/P3FjvAxEkam79/H/d0M7RLTwAQTO5+K6yg/7IQVMAntirU
 bV+gcHORPZ/KpIxVBUe7RnbMtdY4oG3E1Kd48FuHvxEQ1GckjG8mUv83hHgCR1LkoPn5DzvuwD4
 RaKfzlNPFFnx7sKOWGvoW9WYhIDZk4EWa+vZaXIFMWoiV0A+CIUmn5Yc68JFDfImyJR7vLTNBmk
 ksdV38/E/j4DyRhNJwEqe3c/BdJ0RHOioYvoyF1FCPKMq1sPZCPzHZTmTE090VipWpHC2OUpSbl
 o5lVIlXYPqogFqoWYnyaVGUhrIi8m6KcWCRMD4U1x6oPgowC0NmW6MIhSQJGoa0O1SxEipHiNor
 W2TAxtm9nUriTUG4RnAl5u2wapHT1w==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6911ea41 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K7FOPutcZWfKzoRN3qAA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: FLnjdc2UwctJfWc9HTVpnBj_AOWqUDTl
X-Proofpoint-GUID: FLnjdc2UwctJfWc9HTVpnBj_AOWqUDTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100118

On Wed, Nov 05, 2025 at 11:17:37AM +0530, Dikshita Agarwal wrote:
> Improve the condition used to determine when input internal buffers need
> to be reconfigured during streamon on the capture port. Previously, the
> check relied on the INPUT_PAUSE sub-state, which was also being set
> during seek operations. This led to input buffers being queued multiple
> times to the firmware, causing session errors due to duplicate buffer
> submissions.
> 
> This change introduces a more accurate check using the FIRST_IPSC and
> DRC sub-states to ensure that input buffer reconfiguration is triggered
> only during resolution change scenarios, such as streamoff/on on the
> capture port. This avoids duplicate buffer queuing during seek
> operations.
> 
> Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in dynamic resolution change")
> Cc: stable@vger.kernel.org
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
> Changes in v3:
> - Fixed the compilation issue
> - Added stable@vger.kernel.org in Cc
> - Link to v2: https://lore.kernel.org/r/20251104-iris-seek-fix-v2-1-c9dace39b43d@oss.qualcomm.com
> 
> Changes in v2:
> - Removed spurious space and addressed other comments (Nicolas)
> - Remove the unnecessary initializations (Self) 
> - Link to v1: https://lore.kernel.org/r/20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com
> ---
>  drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> index 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..7f1c7fe144f707accc2e3da65ce37cd6d9dfeaff 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -91,12 +91,14 @@ int iris_process_streamon_input(struct iris_inst *inst)
>  int iris_process_streamon_output(struct iris_inst *inst)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	bool drain_active = false, drc_active = false;
>  	enum iris_inst_sub_state clear_sub_state = 0;
> +	bool drain_active, drc_active, first_ipsc;
>  	int ret = 0;
>  
>  	iris_scale_power(inst);
>  
> +	first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
> +
>  	drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
>  		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
>  
> @@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *inst)
>  	else if (drain_active)
>  		clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
>  
> -	if (inst->domain == DECODER && inst->sub_state & IRIS_INST_SUB_INPUT_PAUSE) {
> +	/* Input internal buffer reconfiguration required in case of resolution change */
> +	if (first_ipsc || drc_active) {

Another question: can this now result in PIPE being sent for the ENCODER
instance?

>  		ret = iris_alloc_and_queue_input_int_bufs(inst);
>  		if (ret)
>  			return ret;
> 
> ---
> base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
> change-id: 20251103-iris-seek-fix-7a25af22fa52
> 
> Best regards,
> -- 
> Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

