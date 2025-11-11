Return-Path: <linux-arm-msm+bounces-81204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D4C4CE9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76EB51884530
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E643148DC;
	Tue, 11 Nov 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdxipmD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpJvYE07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E7932ABE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762855857; cv=none; b=kKjJkc9LqVKjUCfepbzikL2y7Wvk3jatBpcy9gm4BmAg+y9+HnyC3UtX/NHKMNNFEHmKaQokfRmNfnrtnBDk3WHMtqRQ8JPzFgueTUAlX7OwKxo6byU/cOXxBQWLErYqObtimhQ6tEvcoUZKdI7MFJoexutJBjt2roVFyVqxAco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762855857; c=relaxed/simple;
	bh=TejEKnzU93oFfxQT3rclCnjWmOCh9dC9wwXYu5HP1Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2YauH3d9Ozr/3HZI7ujLl/rYZxNI+fMs3vQ44lgbLCQkUxYv3qBCXHxvYod3OrGkkevJD11cBOdS4cOHfsdpEhXfG0ZLDJaovClLx1RQt9uF+DjXPhJ4xKkKfBD157CjoSmQi/muyycFqIspuK/4XrO6/K9OUJjxPb0Hw6CQ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdxipmD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpJvYE07; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB2cmZm1001871
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ShINux+CX6K+oVQkRJuCUkyY
	Klot/zwFGjn2wKGKgRk=; b=kdxipmD2fg0WFq7XUFXXN9u4M5Hz8BqpCRhkgU16
	jtT0eFRCbjustifVZOHMoL0AILDQtCyw/YWFzOtscDCB+bTeOG0VwmzvvynRgz/r
	HHJhLfTcKmvG4BsC//n8ROD1/7V2+sApfd4dsDbPtjBRHFlieRUeeu+y3EVLXAzv
	WYIQDPvw4T27OAqInVX5g+0ikXUBDmx3urXba1Q7FGmXLfXMd3V6f6axTkLVxJiR
	usnvGloL1LKI8/OJBc8Y1yUPdDvhXmT47dT6kQeOQoYDKS+QXVjv4wW7bStiKBjG
	hZQLw4EaYqczNPXEiLd6c9KIWhqt8/YROE1ZMSEpY2YXuQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abvhth8be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:10:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edd678b2a3so858281cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762855854; x=1763460654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShINux+CX6K+oVQkRJuCUkyYKlot/zwFGjn2wKGKgRk=;
        b=RpJvYE07nWNNDz1xgcGqB5Zv3BqedRtO3CDtulceI1u79XyD/xAAm69ZshHhu1HhPT
         FDla32VyEsph/V+yyJf4nwBWXidX9g+PGGzlZBxPspy98XYfM8tc/+rSr7oOwwh21C8t
         SfNLvfls+H1ZL1CLuBDys7dZQ5+sujX/ZJGu+f24G4RZ1P+IQ0zN5KZDH4cTucjKfH3D
         uGR2gAIRfURK2JjKi7T5YN6rBSzV4JAxCU1qFfHFYkCuOkvVF25tUmfSEIK7qbm4F9oj
         RG3Y0zj9nqdviEtFoZHOB9KxgyLJ0LqdR/2ZaAwcqoSJtrNl/dezIao0Ep/KPweROeHQ
         y4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762855854; x=1763460654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShINux+CX6K+oVQkRJuCUkyYKlot/zwFGjn2wKGKgRk=;
        b=R77J25rqGBGFNAnQE67e1cLXVb31VwojzMV25nMs0AheAR9hJ1XWaSJCn/zujd/2IS
         3PcteDc4OY1ZFwM7Rw1L4v1aQHOtaPbk8yxYHa8eGlRDwHKxPxlHB9FVY5/rVqccY6eV
         FOv3ps0sIKHO+W/0bICxh1anRpMDowaFKtU3RbPOp/3eZGekljoir2GYSUNjC5yyzCVt
         TvfDfp/P51+UFFfOpGsdfAHIY28BU5xCVZbIK3f+W+n4vJNV6ciTEPZFMwkg7+x6yj1L
         AXkc4IGnuFR5FRv8yZQvh9v1UpDudAo21fpQzHcZngfbBtNX+gB5BoY8UnviBbjwBM6Y
         yWaA==
X-Forwarded-Encrypted: i=1; AJvYcCWTUDQFJEuolbviOOeVOptqQHg/RiljFNdZhiQsZq4MJwxCD13u4XipStm3OVxy6lEw6mmztKFA8eGr0w34@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4ra+cb5aQ25pktpZOr+Bu4wMeYTy/wqIyqFAaQHks4IG0HbC
	S2JFrNnxUUJcBPswf8KsYXqy3C74iOhp6Kyd6GlD6onJqQ5X75kgZO6M7p1Xl1s1oLNRs3cFJy+
	9ms+xkAPOfYpgK7dpmInHdef2XDHgLEWuxmqbxvckHxs/C/n7j9BK95vuxUCRbvWws9kW
X-Gm-Gg: ASbGncuS24rac5SPrjjNbTmaeZqCqh6y6abi10FhJdnq8Zgzzb9WT10+Y8toD3ZNdG5
	L3bON5Mh184ImnAqekq44KCfWcdRpLKuOmz02XkIKS5mVXHpsYlhn5fEZrDo0INsvqtwpIl3bf4
	bqLYXy2MnccOLhTL+9LPx/Zj0927LSeGFf5s7Gbl/FW7NxQug4ql104IRT9e30W0upTbgNgEJbp
	sbWXSAqgqxF6bGUIYjwG5Xnmji/GwaJ+sIgQpTvvv+bH8Q3R4vIoGHZl+yAfmbU1n6Xnl2XoEKf
	1xHRvVyyS1sVJhqaqHhzQSD7QtIc8eH5cXm/EYPqio0agFHM85Sa0KvNPPKvRWUycdb1ZogicIZ
	SFhNA7SRB6Iff2oHExW1ZUsYZIm1ss4ue6noPzS29w1MUK/65YsC+LShyCWSNZUoQmdL/RjLnqA
	5TZJHcMfHUufb8
X-Received: by 2002:a05:622a:1995:b0:4ed:7f5a:c6d8 with SMTP id d75a77b69052e-4eda4f7a99cmr156689751cf.41.1762855853613;
        Tue, 11 Nov 2025 02:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo8so6zfzeKqDr0YJ7J4ugxf/uG3RX0MJkGPgGDJofMTNH3tXu7qk8STLn9rrmFkBrD2mcWQ==
X-Received: by 2002:a05:622a:1995:b0:4ed:7f5a:c6d8 with SMTP id d75a77b69052e-4eda4f7a99cmr156689461cf.41.1762855852986;
        Tue, 11 Nov 2025 02:10:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b76ffsm4729648e87.62.2025.11.11.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:10:52 -0800 (PST)
Date: Tue, 11 Nov 2025 12:10:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: mdt_loader: rename 'firmware' parameter
 of qcom_mdt_load()
Message-ID: <muri5tcu46ee5ilokspc4eunbobq5yrfxuxsmw5odamdwuuiga@wlpowv5j3xtv>
References: <20251111-mdt-loader-cleanup-v1-0-71afee094dce@gmail.com>
 <20251111-mdt-loader-cleanup-v1-2-71afee094dce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-mdt-loader-cleanup-v1-2-71afee094dce@gmail.com>
X-Proofpoint-GUID: Qa34V-ZFEc0eGBGJcJn8SFno48HjiSLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA3OSBTYWx0ZWRfXzsvor6VVrV5Y
 yYo+M20yjy2nRkv5dW6xBwzFGOzEhL1AGSbdENYBPLWQjUdX6GQ/X97Y/bkUcBZct8E1z+JJ5IX
 nWH6rygh7wH/oY42pB3sMjdqZXO3qH+kWtgBP+73ZdJp8rpCQBdVSDD3P1rFKQCIuKhTxNH5mN/
 sHu93Un+fgHcKzaX9RtOJb7E9cgIRcNdBlZBZsDWKKte3KxtntlgMVKeXJX/GUmlZIvCJnh1u1u
 zV77NHPaTYjmyP61QikYtoPfsVboY8t6g5izXf/k1BXS3YUALmZmunfztqsiTW3AtPH9TlqD9vb
 rGFexEblSidbCRwp/cfnyh/jsn5+EkuXX12AFKIVlGPZ2zBpD/33rhkQlKOPoeeQivsBZP3EoYI
 UBtnK3QsgK8Dh5Wrk+jfi/UKLp5D+g==
X-Proofpoint-ORIG-GUID: Qa34V-ZFEc0eGBGJcJn8SFno48HjiSLi
X-Authority-Analysis: v=2.4 cv=d4b4CBjE c=1 sm=1 tr=0 ts=69130bae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cbnKOLyo8h1vxEnvzfkA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110079

On Tue, Nov 11, 2025 at 08:40:11AM +0100, Gabor Juhos wrote:
> In the 'mdt_loader.h' header, both the prototype and the inline
> version of the qcom_mdt_load() function uses 'fw_name' as name for
> the firmware name parameter. Additionally, the other qcom_mdt_*
> functions are using that as well.
> 
> For consistency, rename the 'firmware' parameter in the implementation
> of the qcom_mdt_load() to 'fw_name' and update the function accordingly.
> 
> No functional changes.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

