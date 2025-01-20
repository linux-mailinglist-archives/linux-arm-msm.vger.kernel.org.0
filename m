Return-Path: <linux-arm-msm+bounces-45543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCDA166AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 07:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C50E23A7D3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 06:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EA8537E9;
	Mon, 20 Jan 2025 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXjridMP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E45224EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737354801; cv=none; b=STm8/9o1VGECoxHNLek9iAP4tdjFwnOCRajA74/tj1Y+FJzXyISo0xT4Y57ktGS2pdIEBvZ3bKdhfHggH0Xgju6de5+wrw5RIzUzi/1G6QZVtG6DLfyq/OH/4i6Tvw4aJoX5gCaxUils1ID3HEZtivTo6WixxGrcDJP2y0YTXO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737354801; c=relaxed/simple;
	bh=lkXkcVBs5Oz7RxmRyrycSBaOllOusJb5t5AmGaecgK4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4fF+sxfL4An9t6w4YZeK90UXGDNJxuRGqXFdS3PP9OYpuVunFxpFdA8ig5sQrW7Lvl5cEhzBIAJFnnLT1pmtGfNeJKLpvdFgr7SR/hdv2B0u+KGBDLCw/8T//DlW+G3QqL2lUezYkbh7W2+VES0kbCt/hn3ZRdjEgDpKSJsKYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXjridMP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K32Gih012464
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 06:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uVp3XNn+9poXy5mSRevBQr0o
	dexdzyW+I7EJrxu33e8=; b=lXjridMPaFP7/q5kZOjxgungdaJJwpjreH0azpn9
	D6HMiS5NOjcoAiMQskdyIOkFJW7tW05cDepN35nCBX/ocMb3wG4jnCyYi86yeVZe
	wDGxPOEPlzMClA0aWcv0DWP6gfSbZ74CBMiitHBmTMWkPPUMzjWJVAp1C2Vi6iSf
	nWphNvQV7hBBZl7GQlQJe4iC60npXMClJBvsQ3PQH48MLQ6CUF4BD9tEW+NuvqRy
	NF6zXEFUE1fgOZpem0N8dZDVkDw2Udp39Mw01IjcewOYe8mcTYoMvAH6VBRNmVR5
	/Sjm8YaX0BmXeU1CvkT+2AmydWB4ZKrBQYwHRQwtf1fLdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449e7j0e50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 06:33:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so7525559a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 22:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737354792; x=1737959592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVp3XNn+9poXy5mSRevBQr0odexdzyW+I7EJrxu33e8=;
        b=pBV5rDTWdBWT/fuhUPltIvKScjKPc7/A7P+m2QkCkjDf8uggzjdFzFuaeKCd4icCv6
         TryaAJ8eIwuipQMlOiXXOcy6QfjXGJASBW5x48JowKYWnTehTOUJogwQy74hJ1B1j/LI
         f3X/b6GQcgsTDdfascEO5y2CuLcn4+vjIRwdUvXAY1BwDF/TOuk+FGCTKEQkVMPnuvyX
         cjNuLCwnMh5QzOAc8B/B6Q9CqG8ZEuAMQ2Fx+qA6gjTIdGgs5/xZVtIoSX0YL0RAcfJc
         viiX3nXbxLNnTXtMgfzW/RPvhapep7ZiAKN5UZ3dBEjNN1ODr+SC+d8w+j5cWE/L6fsq
         z1cg==
X-Forwarded-Encrypted: i=1; AJvYcCURUM0wvMMOpfX9SjOwTwNS1zj/d6plYSZeUCoQbneE0+OQUcaRVgHeJjyN8Kq/Xht+WtcoPCra0WxqFpLA@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEq0y3aPoKSlUFK5RdU+8updr7GI56qMy7XBA2tXrPmm+qEGz
	Zo+Pg4FxQh7JSN9pqeKKmh7kRgou7jzvYydwVs3dQKoenok0VHixe+0i3SfxHnNdRBzq05Wbuh4
	VdAQC7aApySgJhz71s4DSqSz7kilyJuQPaNVxdfjHk7hByrDckhZwGh3/6HQzXY+T
X-Gm-Gg: ASbGncu/QEn8SVTpeoIR/OulLjYuqd2XErw8BYjzct7Gp6oyzYDEA5tj+cXgIW+3l/u
	UatlgALVbow+WnZSoVGkL2mHBRVJQ379i3Tf9PEyNs/7WHDaPUHYtdS2WOh85jjClPVJHfptiO6
	deZOkLphJYDh2eaSiV6tV6kLknRZ8UpyEEa+1t6R6FUY4idiIzAIYqiNApqHy3Pq6S5X/5a65i3
	s3gnSi/b+7yM4fsO/+mkVFjvf5zcuPImLax4C1tO7l8aAKNIjbjFCnq8+/C0/Z2y7jOOGO2fCvQ
	5aU9ziMefwmKUcSgXLYeqg==
X-Received: by 2002:a05:6a00:2d8a:b0:725:1d37:ebff with SMTP id d2e1a72fcca58-72dafadbcc0mr15486002b3a.22.1737354792618;
        Sun, 19 Jan 2025 22:33:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+QbAuKn4OjWr1W2rbrpDJoX3PStAkVif1e/WDg5glmLJWH2Rs5SlcxjvgCPSJjIJxpRqOvg==
X-Received: by 2002:a05:6a00:2d8a:b0:725:1d37:ebff with SMTP id d2e1a72fcca58-72dafadbcc0mr15485982b3a.22.1737354792187;
        Sun, 19 Jan 2025 22:33:12 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9c8d7csm6375779b3a.101.2025.01.19.22.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 22:33:11 -0800 (PST)
Date: Mon, 20 Jan 2025 12:03:08 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: manivannan.sadhasivam@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mailbox: qcom-ipcc: Reset CLEAR_ON_RECV_RD if set
 from boot firmware
Message-ID: <Z43uJHn7Yhm3k3XV@hu-mojha-hyd.qualcomm.com>
References: <20241230075425.2534765-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230075425.2534765-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Sa_UA2Pd_ch8eGs2zmmGQPXTPJawMDU2
X-Proofpoint-GUID: Sa_UA2Pd_ch8eGs2zmmGQPXTPJawMDU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxlogscore=699 mlxscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200053

On Mon, Dec 30, 2024 at 01:24:25PM +0530, Mukesh Ojha wrote:
> For some SoCs, boot firmware is using the same IPCC instance used
> by Linux and it has kept CLEAR_ON_RECV_RD set which basically means
> interrupt pending registers are cleared when RECV_ID is read and the
> register automatically updates to the next pending interrupt/client
> status based on priority.
> 
> Clear the CLEAR_ON_RECV_RD if it is set from the boot firmware.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Resurfacing this in case it was missed during the New Year vacation period.

-Mukesh

