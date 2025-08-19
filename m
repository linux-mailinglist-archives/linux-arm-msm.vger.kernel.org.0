Return-Path: <linux-arm-msm+bounces-69802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E2FB2CC3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 570E01885150
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32C5315764;
	Tue, 19 Aug 2025 18:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkOEH+DI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680A530E0E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628771; cv=none; b=cdYkLCt9OS7Pjjo5Ew2RYJIE0PmSxJU8bEwritLx/t9780shVtSGEHSgKb9N0PWm6cwc8Z93qL7zhgM57ITqDcaUROWNubxuLzUPsh46Jf15CraHfQAv1WRrY1gKIYePmk8RWFkKz4+IAgAOJO6vcCDIpvApNDguAz3Lr45apko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628771; c=relaxed/simple;
	bh=DphpoI7NXovRpi/mf9M/ugrTSvVQEjkllTxUfrvVcAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmVz+CC/Np7Nz4svKLNkKpzStZ1vkwzcYDCJPxJxN0xL8f08vvt+HoKkH/6Ot6MHCRHPNSUmNPKEQiXirnZhmkKZxQMXdtgo/zlU5Wvz2SkP4alH3KTXEJ53lOoNqhDaRNYrQixB30UiJ3vn+lvlqRzpInQxcfNvf4y/yMuqnd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkOEH+DI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGvZb6032441
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lfYBgc3axqIAGUVU7JZyFsZe
	IIPCOJtWH9T/sg37IAw=; b=nkOEH+DI+y1tFw78E+OAqO/2Y28QFKaD0Jaoxznd
	kKsEGK1YG53mSeZ6IiE3ARCozJh4JO8oqH9o/L7bFC02e/RqD4MuGtXeGTgwgM1C
	NQZ9ualhAJMbsAtUuxQ/q7Rhssd/FnN+zWklmFritO61Xyusd26YXzPRj88bzTxt
	hDTUFZ3rlj7I+vRULOZne4wH+7IrzwFB0iFi5dmhNFZPuJSdYX9GGaMqtakn96NB
	4gtvnYN/JxzpL0pHJy9hAGXd2FHhMAO4ohjtlI8JXd3mOCF5oDWn1PDwlV5N5txq
	OofrmDEZ4niezWQxxCryW3/bJfLiJFzPbVZjt+pwB8IoqQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2uhns6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:39:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88d99c1cso124704946d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628768; x=1756233568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfYBgc3axqIAGUVU7JZyFsZeIIPCOJtWH9T/sg37IAw=;
        b=aGmKXNwEfTDTtAzhYwURQrrHf2xipjcbN/NoN6eGQejnwvZnoY4e4lOSHGOj6xkVJ0
         0UXssUyfqWsTEsTqtglWhnLh3WVdxmwsKks3jRdrqsbHoudEduiRPJcB4qXmBOhgNu80
         unfMY4fGMt/MJCTtLVI7ibwuSPX3dRnEA0xEWxkW3NfOk0diIiDkCcF4BHwMU5PhBHy7
         ECTTI3KM5tG2z7ULqlm2786NWnZtPPHTxa/A5Hf8nI8iHvOnwCjrcelTvEPxKtjSCuY7
         g70XAjilrL+HiAX6QD3o3MmaEuZqcGw5qtQpNgDMI9jwy6DB8UlVUBFLnXSHau7H1wMz
         ZuAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvuyCFOaKtNFni8oE408gNXdy4J4YKIrI0Gox4PbdFtKpw7gWNZaUkNsnn6dSLF6W0gjjgTh4KiNXXl0ma@vger.kernel.org
X-Gm-Message-State: AOJu0YxtG+4lp6gDentmrlWsXLPSbihVBl1a15GimnYlr0pyWDaKOnyK
	9jpmc6U1BdATLi2+m7tXI8KQW+V5usHZDc4VP30NYsINPRDLYhAFCw6K7CvsLYD2b92Gn220U+1
	hddwf32O+4MUdq0LcN8j/yLTRUCcaza4SiqUMvR+/mPcOWyG7phK0SaahtL+4rldFQbzX
X-Gm-Gg: ASbGnctXUv+UxEZHrny+teO6j7vpXgGxV4AIEVgRKoYar46FFu9rnWTdJ2t6f5DY7Of
	XGBD4MiGC+WeZfrUuxvTOW8CsPJxY4m/U8JP2eZ8KvXXCJaquirkq60nm32SsczuhBHISpBY0ki
	s0YB7WIo6RC3h1R/QE+4pk4GIORW1812RqaMlG9aR/trq50vpOzyYoMzZ4dDtOM5hIrqN8d3Ici
	ioVoHtxRaJ/1qJkB+193Emqroh+6D7T1d7c8TA4d2Mjt8SL6htXG4UPwSZ7FVgQCS7mwSPWOoTr
	JNlFApBQ8SnY9zzW3wy7LX6OGzRd1dEXw5PffbpczavL9SlaQQbo410G8010awGadISbEg54H79
	IFyjKR15ID5GSo/wiBFWNQYDbZdZTB3Jcd/576EVpb2xsq/wkUIko
X-Received: by 2002:a05:6214:1cce:b0:70d:6de2:1b35 with SMTP id 6a1803df08f44-70d771c9465mr190346d6.65.1755628768190;
        Tue, 19 Aug 2025 11:39:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNb7O7hD+Z7kJbkAR9HXYyXCiP/vd3BX+PGDI99g9aEsnVyz9Xn+VwVrQ4K1qsah2RnqEAKw==
X-Received: by 2002:a05:6214:1cce:b0:70d:6de2:1b35 with SMTP id 6a1803df08f44-70d771c9465mr190086d6.65.1755628767607;
        Tue, 19 Aug 2025 11:39:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a4758bfsm25175301fa.32.2025.08.19.11.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:39:25 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:39:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: qcom: apq8064-mako: Minor whitespace
 cleanup
Message-ID: <tkbyz4pyvcahoudw3xwnmate5hcba4jqrak5nz5a23kmkhv4yv@y35jv4bzmnce>
References: <20250819131717.86713-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819131717.86713-3-krzysztof.kozlowski@linaro.org>
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a4c4e1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EEIZnOjFFfZb4VbM-nYA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Mk0-ydhtdS78wzSU_c0ukNqho3tYudsd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX8bchjA9+pKlg
 vihwqHtOuXQuQ6MYFSmGQ4F1hk0PNXkjkePKXWky2Cqz8j20hzNqzEu1mYoftrvDjhdDhdrGXR8
 KtYDgBn3I6+nz7cDyOqMdnwdVpG0vYXibXmq2P6O9UBNU1UB2w5pVHqD/Y5RA9sM7ksHg8Y8vZK
 EMzNFmJ3+ovngivvdVytF7aLhcbTlEjys6N/k88ECkVgcncH9HW1G1dh/h6OD2A3IYkIHn9hTJh
 EeLjvuqoGmCcuF6cBQGzZMZB4vUtB9RWxvq1AVvbUDiv36FUAe3RcObKqMLvB3P+zjYNPTI5qvO
 IGekdFWNws/HJ/M4QFIQyrmy7YxW6ANjVB0GscCsZo1J8OD2keMCudw175aXSpiZEqLEArgT/8G
 +Ke+J5C6
X-Proofpoint-GUID: Mk0-ydhtdS78wzSU_c0ukNqho3tYudsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

On Tue, Aug 19, 2025 at 03:17:18PM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' or '{'
> characters.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

