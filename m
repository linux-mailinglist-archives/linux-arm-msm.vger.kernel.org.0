Return-Path: <linux-arm-msm+bounces-73490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A08B57164
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B443E3A5CBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B62F2D542F;
	Mon, 15 Sep 2025 07:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="abT6Khm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D351428136C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921201; cv=none; b=tWk3Cmz5M35dgfJdRiaWtjL3pqv0EhhPDoe+a4F0zk6u3AEPO0u+XAIrxa24qrKDK+s+uCcInSNkVb+MJm52mOC0My3Ff604N/KSb6y3PnayDFJGH8EMgEAwkqYQq8XCII87wySe9yvu24SmcFkqeQclN8ctVaWkG3pE9KgyY0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921201; c=relaxed/simple;
	bh=TDAloO3oBVpuTTrl3BA4hwC058PmyPWVEAQeMP+IKXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvgztTWkJcGUvYgJvISG0jQ5OnYeG7D4VUe7ezIlNjjNqrQY5Xy0yx/JvRp1eCfx0RgksQBtY1paaZe9c8nlYCUWocEAtmk4tQzXP3exlDQVMh5dN6LGJ+vssI8Cg9MxdGXCL9WQ4R4FuaD5ipQp+57tWERM3hRkm4v5tZhNV8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=abT6Khm0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7I2RW018899
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpCzPmMYzqhbsZujBIxXKmlSp31STMAr8Naqc5Hd5y4=; b=abT6Khm0hwd/Wsx8
	iR6BKmsS+bG5ryjH4UcNJ1Mf5mAsfoc0ne8TSQ9VDQADEaPuMFx2yuEtY4eGDKoS
	6v+ovVOm+mn/aCFfIu7G4PyRquWUHS+RKPaQAtiThOlT7vWxLXc/COXc+rY4eDs5
	u9JWXG00K/YcshfFFc7bEXQ+YMUGTXCbCJZDSO6TmpwAHwBo2YCEm2j3wtasq7N7
	ZicPpm28wVpCb+6Uw4AaNW0kj3GPNAzaf21PLR/SXq461nZN4shvOovkZeKcOVOw
	EAKv4bTCpTvKpbbhk1JLLt/i/bliGiJLR1Kqi57iOiwbEdxPaXijOJv/IWWC7Sob
	vC7lJQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqptpdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 07:26:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77618a8212cso2230306b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757921198; x=1758525998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpCzPmMYzqhbsZujBIxXKmlSp31STMAr8Naqc5Hd5y4=;
        b=JASZzLLTKrICJ+3lYARRHpn5wsJ2uB5mucFb8ykU1HNo88w7NFM4InNW/SZRzszZH8
         g0Nl2rqCPEP9wr8hNFE0LyzoN0zl9sNO/D7I2QpnL4UVJJeKrd6SbfjJPYjd5bus13IA
         pXtbVSq2thVqbzbQFUQE6Tk3wZ1/eVqo2QaAqjseSNmuVfI/wBCQzT5BmeNAV5ytip/v
         CabvxYOdlPFtvKMtK42B9YwSrgjXgBWQcwV6e81kUXUkhKDOe1/KKXtp49bMl0H0Pl51
         DNYZJXlBEA2cCJDr1ZstJp2hEnkObmuAlEdaOf0QEM3AGZlJTGHpk6BR9gcCe4W2x+D/
         /I7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtM7z/pfaxNdQ7hhcaTABH5gmF4y2JbOHxVwWv9fDRijNplLTXfU92H+4q1OtcUjopTycjhPgHv7GvMBJn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9zmHrNslILPS9veejS5hePiKyQbrZ7u2wyq7NeMVW+xDxIWMn
	XWWYHJGqtkmnRibeuHhX+KozrRTInkN1FmjajIEM1pT59Njbi/FGEQrjleVsGPtbtS4rBMZ25Ut
	oiOYOdOIkYet4l+d+gBWjonYbR+kKdche/4YqthRJ1MHpTBxLKSM+QU1VWy4NBMq9chpZ
X-Gm-Gg: ASbGncuIn7SuVie+jacNUX2QAMz521o07mmUQ9N+VNQBjOVl4qHPh7TsrcBhVq6P1k7
	cUj01aK22InOjuNfKEeJ1U+Ba6dKUUx15UetWMn2P3hSB1imQnMjqjF3szFtjcaT76j+wXl8DZe
	WdiQjDMx813pqKgda+IY5C7l9WLNO+EkuaEEB8YK9lFI5IzuUi/XgF33F22sXikYYOXUrMDVm2v
	S8NJD+exP5/mZM9jXtVLo1m5zKqqqoQe+NrNSg/Uu7B2/dfE2RJGxX3SmElrN3gI9xQX6cPBWVw
	rHwQLSpTaCUi7VE731CXX7cfvZGroY6k7dYYc/CA+gfYqGpQI+rwsMWMbdVlyFVqF54BaLZGAw=
	=
X-Received: by 2002:a05:6a21:6d98:b0:246:458:8544 with SMTP id adf61e73a8af0-25cf5d082a1mr21923019637.3.1757921197822;
        Mon, 15 Sep 2025 00:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEewNIc9ydvy5wy5hm5/P36oyXjxjPVG/IVE9AHKYUMCIiJRex0UM13Pf4atLtTuSYn+Tvr8g==
X-Received: by 2002:a05:6a21:6d98:b0:246:458:8544 with SMTP id adf61e73a8af0-25cf5d082a1mr21922952637.3.1757921197292;
        Mon, 15 Sep 2025 00:26:37 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54b5568a82sm7028051a12.34.2025.09.15.00.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:26:36 -0700 (PDT)
Message-ID: <6510264c-d91a-45f3-b484-18d334c515e8@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 12:56:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Update session id for each suspend and
 resume
To: Slark Xiao <slark_xiao@163.com>, mani@kernel.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250912100827.294443-1-slark_xiao@163.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250912100827.294443-1-slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cQm3brR-9Kdt-oaM5eP0P5S_cHTUpKt5
X-Proofpoint-ORIG-GUID: cQm3brR-9Kdt-oaM5eP0P5S_cHTUpKt5
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c7bfae cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Byx-y9mGAAAA:8 a=QnQY4Z2GrxFU2i-fODsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX7NtiQfcrBzSG
 VJx/TRDRq0/vkckqXf/3nmyrLla25tH+MMyXmrIndy2nPUE3VFLS4qCa8ssNM+NeM5MwHsO2KFm
 Lhtm8uUljOpURnelyjjs0NlceEy1q13JvOmLdL4d+zQWl25l5CXVbRU1/f2AtTNkxsjOb6v09Fj
 GTWJqNRubko/Cn+vTGGTKG2VxIvaTp//+mcmedSw2p4AzxifMNKYxWtzGrFpv956s1hFh9uuAr6
 C/2wCVbWCzI6JYpcF2OuYPmZ7QQctNYVxVHVIqXkgUcFyXXmDqkbQY/68wyTNfu9cWNgVGoNLSt
 Qk9H5UKj3jIlqtDCut6d882QXatMdN5ci0M0StjnnFdkt2FJrzRjM1418cDC8As6oEwArAPrip4
 tYFnVZJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186



On 9/12/2025 3:38 PM, Slark Xiao wrote:
> On Qualcomm module side, there is a UART print as below:
> session id: 0x355fe689 state:2
> session id: 0x1f478e42 state:5
> The session id reads from register BHI_IMGTXDB(0x218), and the
> state indicates the D3 or D0 state.
> 
> In Windows side, MHI driver would update this session id for each
> suspend/resume progress. We benefit from this mechanism since it
> could help sync each suspend and resume progress between host and
> device, especially for some suspend issue which needs to take
> hundreds or thousands cycle. We can easy to figure out which
> suspend cycle get a problem and what's happened at that time for
> both host and device because they have same id.
> 
> But in Linux side, this session id value would always be 0x0.
> So we add it for potential debug usage.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>   drivers/bus/mhi/host/pm.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 33d92bf2fc3e..a6573f687363 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -864,6 +864,13 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>   	enum mhi_pm_state new_state;
>   	int ret;
> +	void __iomem *base = mhi_cntrl->bhi;
> +	u32 session_id;
> +
> +	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
> +	dev_dbg(dev, "Starting enter suspend, session id: 0x%x\n",
> +		session_id);
> +	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
I agree this will help in debugging, but unless it is documented
in the MHI spec we can't have this. Since in future if there is
some other purpose for this register we end up facing issues.

if it already part of spec point it in the commit text.

- Krishna Chaitanya.
>   
>   	if (mhi_cntrl->pm_state == MHI_PM_DISABLE)
>   		return -EINVAL;
> @@ -952,6 +959,14 @@ static int __mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>   	enum mhi_pm_state cur_state;
>   	int ret;
> +	void __iomem *base = mhi_cntrl->bhi;
> +	u32 session_id;
> +
> +	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
> +	dev_dbg(dev, "Starting enter resume, session id: 0x%x\n",
> +		session_id);
> +
> +	mhi_write_reg(mhi_cntrl, base, BHI_IMGTXDB, session_id);
>   
>   	dev_dbg(dev, "Entered with PM state: %s, MHI state: %s\n",
>   		to_mhi_pm_state_str(mhi_cntrl->pm_state),

