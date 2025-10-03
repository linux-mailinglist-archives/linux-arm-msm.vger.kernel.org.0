Return-Path: <linux-arm-msm+bounces-75947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ECABB8326
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 23:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 04CDA348543
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 21:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9837C27F01E;
	Fri,  3 Oct 2025 21:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFQqKnzp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94D3262FD7
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 21:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759527078; cv=none; b=WfgXwAKDnWjCy6roPKqRM+sZZYtrf9O4bs5OSiTKxr9lPXfnl+ou/J/Jeinzm5/IL14TWWW8b2ZeDTgVI4VuJA/3Bk38w+xQ4Bv36n5qPNi8Sm5xPVl4RUpL5uZQ1jDIxxR4c8DxgTROHzL708CkiAfOKtFRZ3iyyqweWS3hzuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759527078; c=relaxed/simple;
	bh=SBy6k5wn7OOCnn1aCmALHU0oQquC4fvA6Tw45eKJThg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eP7XVejXqx7TdheipIXekSuntyyu33jylVRbU4hEfwXv5IBtN0EuC4RyotMdn8bVK491raBRhYg5XfzS9mcf3KTcjM+jazHA+Cwtwn4gWwmTXsEfXL0wOY5P6uDKhHGSH/grT8priGpznPhk4+3mJ6vUaHNHP3cQOCyQeNL0exA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFQqKnzp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BSwTq022897
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 21:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XlsGbOm2FDLEFD7aIg4S0aSC
	svAffT34aitDj5CRKdA=; b=KFQqKnzpWU9gwC9tSWH+wVcwRskn1tYwm2z6wd8I
	mpA8EGyplL7SNfkgA4qW9tOCChfC5MRFo1QwHUK9iRrYi/2nykfZuqQW7qbRE/Ak
	Not1y19Fo1J1PSycHwMcTedCXCbxBO/tTpvpsBI0jzS+Urt7jTkveFOdGBHy5tmI
	pM8wTv5y+QRqMjfm2teUdrjVd+1ZWMKCGaKBxIddAWwYftaL9gkAtXvQrekEwmJC
	tpYU3yG6G3hMElZhWCoXksObUfoHGAp4kjSChOlm1pvdCmlhD4TWol+Va/dpZNzR
	900wkqQ1G+WzA0ONyG3RcTtApHpykvNXRiFz4fwpyLOdXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59ncc76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 21:31:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e002f413e4so29872861cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 14:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527075; x=1760131875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlsGbOm2FDLEFD7aIg4S0aSCsvAffT34aitDj5CRKdA=;
        b=k2gdn/iUzh4DXK2Zj9ndXAiqPDLELJtgvJO/e23G8/7IvRu1xcqb0Hpqy9Mjfxbvpx
         VjhI62AjD1AP808Mb8tzVwDLiK9lE95dfs4Lg4YBAIodrYFCKPHuXB/3cQjFIsKMzX6x
         mPzbk0kKld11mQWeJLzkwefvWguI7Ov78w4uAW6+yWKax9WZY60X3whRq/3rOhW+neRF
         bsVxBthg/bjEfEsNxqV42j7pamrne+tHrthoPXixU+9k1xLlk7Is3YPrBd4DSIKvkABk
         Mtz6UukZBZNq9PuSIftqkF3dGPkYEfsrhkfVvKHxbE7Fhz5rDD5fkysGPpJSpZs7b/WD
         +/yw==
X-Forwarded-Encrypted: i=1; AJvYcCXO4d/YPu9nQ02cF4Yzrlk2G3uQiwES8HmzW3+otrZkamWjr44GITiHQsqAnE/D7xwb/AP6qEtkoFLbyABF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf2SoQzn3k62D4nguAsm+sNx3DwFwcOXJwxggKkd4n3KgPQvmz
	2xS/64S3Tn0yFoG+nkXg9HPaOevdk//Bf8cyZsyrTQilwG+SXFAD+Qz6y7FyP5OECmKtju71ltB
	W28JxKL2iU/rtLuA5Ra+vkHqtkp+ZuTS/xM8FW4IQpTr5hO6v6gSKIyzd3lKQ26C8ctsk
X-Gm-Gg: ASbGncu91bCdeoH12QYyv2tmfZFTzht6aHL3joGRb1vNkRF7E5++v+qUOKYl5PKFJ97
	dHynnE48Ar6KecZlaH6wofLGUrNgkYeBwPX9sRhJZEqVwdC84pNuidflhs9S3gY/jwgwTWPvLLn
	aK18BfKxs56G2/+mg4MS1A7SPbWRdqnzzQaWLVnrMb+pLR0ofKDr5fJwkuEQjRhKqnkx0dhAgdC
	bV9K8vYSWL2JRMBdmwhk7rhMiWkxJGREFfOJqJLJSf4fZ7vzM+Ux18lWEligv+uw4aOlj5Nz9UL
	e+T0ALAXXBJI+HETJVq8/I6qFQXHFgi6CiFo56Da8Q6Q52RlDiBEZ5C+AP9l7jD9ni717R1Hkwo
	vwLJUR9IwqDWQOd5/7FvkMRsLHuA2d8gjrAOev0YpWhOiwDvEQyVLDR8YsQ==
X-Received: by 2002:a05:622a:411b:b0:4b7:9c98:aed6 with SMTP id d75a77b69052e-4e576ada47bmr67589821cf.41.1759527074505;
        Fri, 03 Oct 2025 14:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2/BooBrQE17txVLgWwDz4q7+nVZv+viuExfysHyo4YY5i2nM1gor8h+dIlgtCUXqJYtQPAQ==
X-Received: by 2002:a05:622a:411b:b0:4b7:9c98:aed6 with SMTP id d75a77b69052e-4e576ada47bmr67589351cf.41.1759527073911;
        Fri, 03 Oct 2025 14:31:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01141752sm2190199e87.58.2025.10.03.14.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 14:31:10 -0700 (PDT)
Date: Sat, 4 Oct 2025 00:31:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 01/11] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
Message-ID: <e5ye5qenwdvbwihqlywgs7kxx22y42vvq2li7gqvr7vqoqsxu4@nnizx2q33s3w>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-1-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928-judyln-dts-v3-1-b14cf9e9a928@postmarketos.org>
X-Proofpoint-GUID: JPhif69lXRymLKbaCtQvh9FMgopYSFV_
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68e040a3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=JkoFm2tBDPzt1COVDkcA:9 a=CjuIK1q_8ugA:10 a=5XHQ0vS7sDUA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: JPhif69lXRymLKbaCtQvh9FMgopYSFV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX5LqP2iUQ9NzG
 V2+XAAGg222mVUVJtQjqXV0BEYSYVHEzQgo5z7Mf/Z1AJTcYZ7Os7CouD9DvIneuB8xYq1Wl8t/
 EaGkBQW9ycN/gh/k7mKbWZeZRQtM7p7Ez+cclE64j8v3wFHj7VKNloy9lR9EtDJC0V2G+hXf3ZY
 ebofdgrR9zNyyisbKY48Z2ttUd2/EcTYDd+L1sIAZARt34MwFwfcZv6np02VPrVpsuQQu/fXhzW
 fPe2cljoa3EGCeR3k6I9cE5zP0wnqaWOm5JdwNfLsCutNBcNwUUe108kxNIWJJcsZKpQcBsy2eM
 1NxU9kAdtAGFeyQr1CFUOOk6L/IuYxxx4ZeQQWv7TZu92Bq9z6LFuY/JpmX/hOBAsMzBcRCQl8d
 U20TBb++KgYAdhX5zqa5F/tMiF3uHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Sun, Sep 28, 2025 at 10:05:24PM -0700, Paul Sajna wrote:
> Improve adherance to style guidelines below:
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 124 ++++++++++++-------------
>  1 file changed, 62 insertions(+), 62 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

