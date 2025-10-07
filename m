Return-Path: <linux-arm-msm+bounces-76137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DA9BBFF67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 03:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35CE218946FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 01:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41F81E5710;
	Tue,  7 Oct 2025 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlXMoU66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1667527707
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 01:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800486; cv=none; b=JTyCjT8qUBV6e4UbsxyaP2m+dVT48twscdUXUW+UbHkj2dfTQai1BYUUpE7SXfHiHCXXIDoHbe+0MRcCfG+w0MDhX0/pSWwefOhzJyyFaf+IGz6ApUpyiZcVzhHBbX0E0BYexZ6VmWaGMVNMnAnaHlFSr/QDd+3ZqKI9SI36NGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800486; c=relaxed/simple;
	bh=4ualLk1DeZlEWqfWckWpbEx0sirQm5t7gARFYSVy84k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sn7PpC67SHcbLtS6ITsRTw9Z2X8rK7EHj4ivyIuEwcAqTCI6DOmls3R+KK1L+veNiq6f/xOziRSGBzD95m4QZBDV4D52D7QZ7Rx37kYttVoex6wpbh0+EUvNQJ5AhpBVMzofCclKqdMuXKUFMzFaNWKI3NOsCNC0b2aeI0fpAbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlXMoU66; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596LL49e019013
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 01:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i2Wck2j+6o7Lb4Qgkj6MN4x7
	UQxZYVDXXZmfJzy/gQY=; b=OlXMoU66GWfO5eZBg1onhe0qcCdzcoLKfwG/Wa30
	qhrX88P/JBS8XLvDm+nxwYn2lASkLj1Tk4rrACWYWjEn/KDK2sB/6zARQkaPAjCn
	PhDKzJMOx6zLbxza4CcHM6cBjkRI0H0uPIGJmNpOHZWAekbmSsOsgr74nVthpaDF
	M/docPEEpBj+nClSsHQk9SQH4EGumkMvh9mjaTTwvu0OUCThv+yWCVPvttkqzi9p
	jI0lBiKwsgCZUYGruyxeDmLgiqVtR+vjWSCcqGpi6PoDm/Z5oqp85g/ZrE/1QMFi
	3GLLZkSuu+p2t8h3jw9jDGYTJeIfWDZyfpjYpvjmxCF8Hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkprffy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 01:28:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de35879e7dso82073401cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 18:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800482; x=1760405282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2Wck2j+6o7Lb4Qgkj6MN4x7UQxZYVDXXZmfJzy/gQY=;
        b=Gl+WSnW3DF+IxN32FZbMYtdz9N4YUCnviqVgGCIgkfAGykK2aWFQ3cwF1np6Mxd9pf
         ivqcFwg1+kdRIX8l1ieh4HzT881BP+n/8gVm1LXAnrvJzVHH/NFQ4VXT9sjpyC4Lw6BJ
         j/S5abapzJZDDwrvJeHS6tG/KKa2re2fAdEi/cRW/9RJXiU3vw9Rl3mTNF1YDUs3s6W9
         GJbddZNNusDj1qudEGyI3UlwE0+JjS329xzb07a7lM/nd4sjMMejP6+axArf5ntxKSgs
         BKzzI3VIM4XdFPDVd7CQmwouXFq7OZDAbkXFbFbIr17qXZDt7KKZA+ESWvOtSBjZmnxe
         UNww==
X-Forwarded-Encrypted: i=1; AJvYcCV+wZyvmiEeWKcftQafU3axgmurPXxEOQayOU4/FNaubX0Q0iqAXqppIB0A5/fXKlOwL1u89J0uVJpOEV0n@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3cLcRkxE7V8cPXSubOnW9Z2z6Hw8SxpK5ElJbBRn6PvyY/3z
	L+OZGycW8FK/W6CGGFJ2OlTi6zBoER4dk0MWRXGXcLWv7Mn7RinoYGkQTKpvKAD1kMNw/jq02Wa
	d9zQ56Z5gjar767LchuW5k8MlCqJI7vf0ryNBSgMx8Kdd0zYF7g9fSdnoexS3OJvziGdi
X-Gm-Gg: ASbGncvFVEV8qgJUiTwGeSEITWMO07dG5yA+pUW3ppF20r7cQ4xq3+5/d25Uf6SN2G8
	oNvLEFAU2M/EWjCK5afvW8cw9NpUfGuGlos7zaK+QNl6FrsAOtIHoS7Dsjxidl3e8cFG90nW1PN
	qGx7Dt+MhqmexuO/jfsoZu+GF56IcoiWkjIlQXIUBdK4UnSvQx7p9SRun4Dci2DzJiPRyJee4Vz
	Duv+EzVF7u0TIYkPFDJo9u1pbnDQK1tR0+y8UH3Uq8XavijxZWd8VHCU1k39aUR35dQWntDbCsi
	9ZTxtc+LUGIsiJlWUmK+5r7YBtu4pHerbNog+MMDd89DqZ3te+u8NxUXiVNnAT08Cwx59URHgW3
	TXV0qifyD/Js3RfbbrKnK33s9M7lJ2AAFUkRq+6Y9cYs6znwJB3l/qutxAg==
X-Received: by 2002:a05:622a:5c17:b0:4e5:6d3e:d769 with SMTP id d75a77b69052e-4e576a4668emr191842911cf.7.1759800481773;
        Mon, 06 Oct 2025 18:28:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxfeNp2wWx3PYGTBtbjUe4nY/+LVjFKId/qxcvUtH9OJG+jhOdfQBv8YVwQTtsYrG6Pr+XnA==
X-Received: by 2002:a05:622a:5c17:b0:4e5:6d3e:d769 with SMTP id d75a77b69052e-4e576a4668emr191842691cf.7.1759800481346;
        Mon, 06 Oct 2025 18:28:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01135a82sm5548587e87.39.2025.10.06.18.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 18:28:00 -0700 (PDT)
Date: Tue, 7 Oct 2025 04:27:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add support for Huawei MateBook
 E 2019
Message-ID: <uehcbtdwrvkkluy3lszffukozmumbxbltbmdzagwd3ecmlp6an@lzeffmk6fx3o>
References: <20251006121456.26509-1-newwheatzjz@zohomail.com>
 <20251006121456.26509-3-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006121456.26509-3-newwheatzjz@zohomail.com>
X-Proofpoint-GUID: 6ibm6IWrJsByA9X7oyGPTlTa2od6qZtm
X-Proofpoint-ORIG-GUID: 6ibm6IWrJsByA9X7oyGPTlTa2od6qZtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXyf/hav0gyv43
 4Vlank/SkjlqHD9PbEYZRDAdY5PwaXbeXKzqb/0epi6WhyuJL3zvqxEGYGMy7od6e8ihFrJQeu+
 P7Ct1vo+iDltx2owvnEUaq/mXln+WObFe/UdbFwv8Ws3YVyjLaNS7fFepubfw1bC3UzMuuNFlgq
 VpgZGXiAucx4NT8+O6P84ZfHZZOpORLjNgPLjV2qOsYnXSAuiLHsVMVtVNnQk2rWASG6sB1SebF
 DU5S9P1BnekaSbWwfuZapLTXh8KU7kL6eU4QgtSE5A2XNQS1KeVRvSZkNU4EYNfvRmH+JitZ6V+
 HYDuVdN7pk2BhpTsCakAgcz2H4XvEvMluGVgyJ9TeFYQ4nQOwIWZEZORqbRm9iszK5UGnOKO8qM
 1mh6YU2GSL6i8KP184BIDsrsWGpG0Q==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e46ca3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=l4nIPSqNMi1mnKGloYcA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On Mon, Oct 06, 2025 at 08:14:55PM +0800, Jingzhou Zhu wrote:
> Add device tree for Huawei MateBook E 2019, which is a 2-in-1 tablet based
> on Qualcomm's sdm850 platform.
> 
> Supported features:
>  - ADSP, CDSP and SLPI
>  - Volume Key
>  - Power Key
>  - Tablet Mode Switching
>  - Display
>  - Touchscreen
>  - Stylus
>  - WiFi [1]
>  - Bluetooth [2]
>  - GPU
>  - USB
>  - Keyboard
>  - Touchpad
>  - UFS
>  - SD Card
>  - Audio (right internal mic and headphone mic not working)
>  - Mobile Network
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

