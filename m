Return-Path: <linux-arm-msm+bounces-82457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8608CC6D918
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 89CE32D901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94862333422;
	Wed, 19 Nov 2025 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F133vRw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fLR66Z9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BAD33344D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543041; cv=none; b=Qe19jZnPxa88jQTZCNUu7KJfsBBLFmU7lNFtX2JH0duWJ91/m4IJIDBlnvJfPFQ3C3VtM/7PxFis4bJzQYr8kmn0XRrsiPkUI75U+q+QK5alnABf2Omr/0sWh09AyI3377JjnsaQSSgx4RA8XVe/2dONReAAuAKgFEQ8dus6lN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543041; c=relaxed/simple;
	bh=7PYuIVxtoPFYg62jWxIrmMhmv/W6lp9AHKj7G26g0YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAGNY+256EJie0yd9OpEF83EF1V2J3+ATzt8Zfv0xKlVPwOBS7MXNdcWB9LbszolxET7L968mJq/UOGzKLkdkQQIhs+z1tTlB/7vqYW6BDN2KY1eQoZQLECnu1ISyrENNz5OOnfl8xTuAqAfRXgLtJMA/D15LIU5erW1H8zzHoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F133vRw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fLR66Z9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ5QUHl2802300
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/DVKl889ORLjBsf1CmtN97Ol
	7Es2W4sbC50Q/Zqk7ew=; b=F133vRw/ZJ4fThE/cs7tswbRjcTnZTuiyAs967t1
	NxQHcSXheN2PJro5DSDzxHxsHezA9zxtMzf0jMlIleexCKkH18KfJ3waNPYNOezy
	ISGNC6ijgr9lWqeCpvuvS9BaOXMbTzHtaeycy5f2b05aAOfxOiYkaYauwx7lqUw7
	r8SK0bKAasUHFzybeZjoH1vd6UYCs/UvmXqdml8cuDduOa0bjIZ919Mk+W8lBbH0
	ChUwpaFfwePjxBG9hU/9S3zEmqNC7KbJlo2rlQyV8lHCf7KgY7gaX8mf5IZYjIFz
	VqBWB8QSKJguAogkBGypg9Nx19QZ/eicOUTPLSurRncNYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk23b4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:03:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee3dfe072dso25473921cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763543038; x=1764147838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/DVKl889ORLjBsf1CmtN97Ol7Es2W4sbC50Q/Zqk7ew=;
        b=fLR66Z9TltbigcI8DJYw5dISyxiqjHLOHDSkLySxrHxUar9kKYq2XucypiYwD/KihC
         XNV0v1jmuXlS2pDc0AWkKTIpYjpWhcbRjVZApoWbbzH48HFhww+BkeaLJP2EbSPTduRV
         64difajofcehKA55DLusLncrwmU1gFlfKHkTvzaoQWek7JutsaIl0qd9BeZXyfeTRe8y
         xn1xwxdd13sT+dwNVXtE5H/iOycZJ7U7IWiys6tlN7RxPaoi5MmdSTfG3N4I4TC4t8sc
         wuESoLD7YGNjvHlC95Ra/tX2CnRBZ1wk51zJVNN4gc/EEjppWo/MQCKDVmEsuh3uT1KW
         opyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763543038; x=1764147838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/DVKl889ORLjBsf1CmtN97Ol7Es2W4sbC50Q/Zqk7ew=;
        b=JuOqAuKZdITK3dvwkgkmBAlE0CNW0aqsk3MduHZQLRNA6YsP2mfrsa9ytRDUCimJbi
         P32xUCbZG91K2uzvivZr28p+7dlg4I0ZgtwNrbEIqcy04VKT7Vwli4pYf35x/bzhX8jL
         WgOB5PtJOg+nOAL72/cbXvFcUl5Qbr6kw7J3YGg4kFSDMhr5TuFH3R0wXNLvMSxnP2Ag
         WRX1TOvQ7ZTu7ovdZYgpJ/ijhysbkUcNxJEpCPBtZyAT2x+aqwP3u5n/cxz9y5WtDFSN
         qpzK9eJitjR5iLzk4OfRh8l515EmPw5lShWNFlC72Er756Ic1U1NTIj5tJESVXUdxgBo
         pIig==
X-Forwarded-Encrypted: i=1; AJvYcCXRtJtY/WSpFL2nX4bSJza6I/EAYBzoixBiitSEla/yQjS2lQWHENnzKAEX25mM0hUzJWCEc2phSn0zZyh0@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyH2THTUDK24Q9nU7AdrVxmQqoNMlnkDcbQQ3LLyOqlFI1IWJ
	+AHyvL0v4Hd0Q7l4bEKFnyPGdpUyJ556qJdOITCv5DR4+39SnLCxMle8U5MfAdze/d1hp7sqLAs
	slj6uI7aYHJtc3+f+LiAP/qVbJc14tQR4nCQJgWxSyk1SXPWHvy/aDYhbnVlzroZd+x8A
X-Gm-Gg: ASbGncsbXdVnnz7/vRH2pq10nlmO00O6llRO20UOeXdsaavYNb+3WQHRZ9nBCtz10yU
	88MLcqur+iZUr1yBafBI1lEVb5TchdBXaj1VFiJeVSmbrkHB9p8TTNGUHg/v8pGnvb1xFHiT6CL
	zvOBPSXEvfey460dc9Hlnvk4OqZEpJi55VWISWr7pxA0ykR1ldXPWVcQ3AzqgGuG6mhDLI71UJ9
	Mh5kPT9AmIAhY6nRi9OKJrCjA1ZBrnpaDe24c52NRC7dk0XJ0FjDKoyf1+jhXnJlLBYL1Xd7mmf
	HNigtwcgORF2ZworUUB0mmWcS6m3/qIi+e2zgH9Ehc3X7nIgemiJgm97Zxs0Zh8ieltOMu03LqS
	9JsRqh8ayHIaFYSJRE/qCcX4a3wVhGcp7zg4WG+z4t91WgyB3vHiIFIEZ8J/oho9rb/qCBaIonT
	Xjd+AIVso9dfvpVuPKe9xK0t8=
X-Received: by 2002:a05:622a:87:b0:4ee:1c10:729f with SMTP id d75a77b69052e-4ee1c1076admr155151781cf.35.1763543037804;
        Wed, 19 Nov 2025 01:03:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgCgf7dxZdMMwZXKao/8OhfR5srPEi9FV8w0+XM6CwVTnm8sYFYyJRINt88wai2SJeu1RY5w==
X-Received: by 2002:a05:622a:87:b0:4ee:1c10:729f with SMTP id d75a77b69052e-4ee1c1076admr155151571cf.35.1763543037376;
        Wed, 19 Nov 2025 01:03:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b8bc7sm4478697e87.46.2025.11.19.01.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:03:56 -0800 (PST)
Date: Wed, 19 Nov 2025 11:03:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] phy: qcom: edp: Make the number of clocks flexible
Message-ID: <basmm6j76upxmb5h6tmqvuuehg3qvj3tfkbq4q6e7tugfkv4is@ttu4dam5h2gx>
References: <20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org>
 <20250909-phy-qcom-edp-add-missing-refclk-v3-2-4ec55a0512ab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-phy-qcom-edp-add-missing-refclk-v3-2-4ec55a0512ab@linaro.org>
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691d87fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=77Gn-jvO4NWksBu-1S8A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pApP2F59eflP6axmyMkc-7mH1cnLXD-N
X-Proofpoint-ORIG-GUID: pApP2F59eflP6axmyMkc-7mH1cnLXD-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MCBTYWx0ZWRfX38TIgyhMz9XD
 y0eCW3ss/oaSNrjqVWH1ngoG3gRk1li20C2LKyd91MBXmwD1rHiQnpsdQwxsLbVviDXYEVwX368
 l/p6/sUyiRq7+/Te5nJKzRUqsjRfjpcqggXlxnl34nb3KQbr7OZWkN/vSu5D3O4ebPxJDIqiw5y
 tqhC6kPRd5D3kO/iyErFzeF3WlwmTSSfYWBblM/sc64nhTt1S7GM1Z4YbbVKs74rSdm1qPJ3sNU
 4GDIM7ouzDzzY34ISKKR/rIOAeRcYViR/H1l3Gsbqzb7fc2lVqHiHy+gFboGitiD6aoraFMQ0jd
 q8+ANPHcm862BV2G/VHlppCqDmziGHliWKlA48yU14dDNe127e22ZbAZrnI+2UTanyJzU3z6c0f
 mGcA/cN8lPUzkRRlabMicMdoNZPtpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190070

On Tue, Sep 09, 2025 at 10:33:34AM +0300, Abel Vesa wrote:
> On X Elite, the DP PHY needs another clock called ref, while all other
> platforms do not.
> 
> The current X Elite devices supported upstream work fine without this
> clock, because the boot firmware leaves this clock enabled. But we should
> not rely on that. Also, even though this change breaks the ABI, it is
> needed in order to make the driver disables this clock along with the
> other ones, for a proper bring-down of the entire PHY.
> 
> So in order to handle these clocks on different platforms, make the driver
> get all the clocks regardless of how many there are provided.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: db83c107dc29 ("phy: qcom: edp: Add v6 specific ops and X1E80100 platform support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

