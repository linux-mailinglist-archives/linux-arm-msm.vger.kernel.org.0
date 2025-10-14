Return-Path: <linux-arm-msm+bounces-77251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD80BDB1E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 21:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2746E4EEA5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 19:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A0B2FFDD6;
	Tue, 14 Oct 2025 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFhYfeFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07102FBE01
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760471427; cv=none; b=Gz63NKfMm+VIf43NPqh1IFIVy+UHGmfZVjGWUUrCZ0YjkZk6pm9aJBa2dDdF3zmnIDW0GCLzjSvJ/NRlQCfOyUW1pbBf7VcqV4e8lQ9J41ohZbY0Z0jg7NvZsSIwjb05Fj6ekeaLS1tGOTZRVuLdXlmSGjTTU3taAsR+h1xJGf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760471427; c=relaxed/simple;
	bh=kvdd2VQ7EmZ8FVKXUCYA/Pag/CRKLVkhbOU8rp/HZa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/aE7fQx/Rk9EGXqwIXYiMaJtEWbl99sMY+KnGm2X16G/8BnKWY+d1gn2aMQ+8VvyZBeZDZSCWWEAOv47La1Vmy7KaO+jfQ5mmcjPO3QyYH+ABLzBFZ12gpbSGOnO3+iKAMpxyOkYPTY2GqfpR8bACt09Snj8xL3oSEUTdpow34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFhYfeFz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EGBuRR021148
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hoXaxxAh8HM/NnL2U+whNfVg
	Ynbh9JZ3GGYiHNKdMQw=; b=WFhYfeFzTO9webJ7RVqkMZsclTvhFb+CfHvDOT/R
	GATWvzYy0L23twFn/CAaFdL8QwkfRZ77CZIoeiYSX6d3rTn2zn4naA/mWoLCb7N8
	z2RX3Dw/WocYxrfhlwbERqirPMwpAXQ8XyIMVQZ8Ic/e+eDDOn/T2b9sUqbTsZnI
	XHSroKWxZF7KHU3ijsYrOdRHrM2iICLGpUlxPhQg3KiREcQJaRIKpelWOrP4q7+Q
	NzfjAhgIb76nPJBp0XADW2qgTJe1XMVSJHP3+LE3+k53yKOuNf6xztMfHTOeKRVw
	fNc+nd75ZRMTWLdUoLtTSOYUfw6wWz0G/O0nuARhTEXW3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwm49j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:50:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8217df6d44cso2464757985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760471423; x=1761076223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoXaxxAh8HM/NnL2U+whNfVgYnbh9JZ3GGYiHNKdMQw=;
        b=qYp027ZrdI/TG+pgYyDZ/+y7kzVu2JxvjTwdQeqk/R3RhRmXv3AI8Rv6ogktOW6QaS
         +i30jGbW9FBPj0c1UxxfEVMTlQbxDQKDJVcwxRumjzDO7W+VQA71qn5fHNuzFnOcIQQX
         D5ECqDERbcOW9Upkh5ZevFOEI6453/NUTisVQoCynrGcnil2Wa9xgMtx9ug7Ch5W4HNE
         TY9RD8usPLARePFONxZqKAfXDoROrTevKT8rpw+kKo++ytof2EMjOlsg20BqHZE+Ur/S
         hJYAi2KK64gHkxRvbByMYUYOqxBkF9YvxYJth149LEw7/GtOF7Px8cXy/mqjlp9na3x8
         Ck8A==
X-Forwarded-Encrypted: i=1; AJvYcCVeBKxN8sflw12/wz8POBAD5NsoZs0F7KMKDzQ6HUpXTJwrlYf9a3WQn+134WfGg/H6l/2yxUW0JnxNXy/B@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3UGwhACQ0RS4idG8c9nT0tWwf6sbMVQqF/mk144XrtZDjjU23
	ROYTUIgpU5wmJzE9az3mpKU0F10vnAmJSf9ajDe21UEk/ICHy7QBYTeeVsJRH1Ev5phNxHMRFU9
	O65OEYZgxDP3/GktM6/2TQu3jtDiben6+yqcLbYUOQczh1l20xpjHe3M2EkLA5YhoIWH/
X-Gm-Gg: ASbGncsTvT8WVmxvAirGp8agvCNwsxGhyfUTA/5xfrGbA9Dedh3aB0muh+GUOXn9lWR
	cyFNLDGS3VRnQWX1z5f1qFYFPAvoS+bcJ4o7ZHaarGx7mT3n3706A6c+YdVAiFxXA9oDhz9it1E
	GvaDk+ZnsoisfH8WJH5+nj9jP/zbIPlfbdEh91kdRMhiq/fNquFFOmPrTa6HuwhDbncyKqaDVNx
	HmCOu5F/ylPP1VN5nOviU1vM9sl7HwzcP8P1NmMzc2A185sq9JUg+KC2Gsvn+9/tOr0xZWpErb6
	ipa30rNCNcwzK9BtIvl5HDKT09TIjX6PlFHMVyHO0HAxC8YKbzew02x/DtPz517dE3J22ABvmy+
	yof3Cgy4GQ6loxNbXExWm0/u1jTpxKprq1MyJomhMPQP2C4Vww8pO
X-Received: by 2002:a05:622a:148f:b0:4e7:1eb9:6075 with SMTP id d75a77b69052e-4e71eb9639fmr134514261cf.24.1760471423452;
        Tue, 14 Oct 2025 12:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5E8/aPEwYwGIvty7HBIiP6izQb7EW36jmKnfvDtGc+uFowF5L0vJTo44+JikizgOXq93qFA==
X-Received: by 2002:a05:622a:148f:b0:4e7:1eb9:6075 with SMTP id d75a77b69052e-4e71eb9639fmr134513931cf.24.1760471422969;
        Tue, 14 Oct 2025 12:50:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e09sm5522722e87.23.2025.10.14.12.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 12:50:22 -0700 (PDT)
Date: Tue, 14 Oct 2025 22:50:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <f4yvyh4yg4mjuukxdee3pdxcslucj2k2icqc4d6qfzzmctlffn@gxtzhgapvnv7>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX6WmJxlHBW0AB
 Xw1Iu/VtE/nw900Op1j/gxCgbu2chWn08EULvCsHI/ezygnQiQQdKRuALLtbu/m9CI9R7IGAY90
 TEtpc2bfuu45UyVSesoQxQvRzfBhFhSKA8heUbq+VALTHvmGsR5UMBahQwLogN02N/WXspmdO4V
 aR8LGhml6YVq+OHeqaJHj7KaFWI9LZLG4/O09x2RAAGusyTE+YgeDrRYohmVUke7dGbH13JFkAN
 t1VY2kzG71mcHpuJWkNpzSxQLN7bJj6PEAn1V1joO9K9AJKftH2dblvon9hLoG0R1Psoalxg9HX
 TZG21ol19aPTNyjig6kdgrR8CLL5WWLj0PdpDUQxoV9a0t0lhLAJ3nUhSCtzV9Li3xS4oJ94R4R
 dIzMiA6SiH9teRs/v9rdIdaXyW+N7Q==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68eea980 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rYq5acLp8HI6pBODZ1gA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HKyyXW-SHZBzursovlGtMxFejQSfCpY_
X-Proofpoint-ORIG-GUID: HKyyXW-SHZBzursovlGtMxFejQSfCpY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the new Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

