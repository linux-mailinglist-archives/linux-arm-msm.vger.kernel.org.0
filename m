Return-Path: <linux-arm-msm+bounces-58372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033C6ABB657
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 09:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 953BD171E69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 07:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2D9257ACF;
	Mon, 19 May 2025 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0QrJhkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E853D515
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640514; cv=none; b=b5JMDYFVuWjP/w6eP0bFWlq9jv2D2WswBccX/gBynxC2cR7a8mLgdzs1iO6SiW8E8ZLulSZdGekmbqCT2TBYY1zKuHGGXeh/x7k3Q7iHpPrhcbfBkaSpkcD6dwwQfacTucpjafS4Gs2m9Ui9uCFme9wr6F6+IgHc9nHDNpHyffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640514; c=relaxed/simple;
	bh=vk2JBAbC25ErFqWfBeuURkGjcQMndPvAFYVIsJCCaxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGPJRGmsLS6sCo8NJ5fHYo6nW/0X/YbA0Hl8ENXQY9OhsEfneglpKue1jnSD3leyZV2T2Dr/PNyI6ZEGPpel0tijSYuPEc+ST3RyqD7ShWlMiSoLcj9tm+MVWNXlfbu6QbedIKuAz3xK9uArbx9reeHY6q5xiRzudTbm0CDtClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0QrJhkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILpEDA000481
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 07:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GDNjg9CVy+PvEX5/Lt+VfpCC
	TKTdj8ZZWuSFdP68hXA=; b=a0QrJhkduYTi6k9BXTJEPm90ATc0ZTixqaGxQD3F
	Fdcqu1naqbZw2meBivpOQ2JAJG3cV45EImKWO9SpuEXQ7qFInQRQ7Min6OtPVi/+
	qLdTvZvnN1qBhIQxIRFWXIK7kzGQATGkD9ebVHgIQnHyjRtMz3D7mzk0PkfBWwn8
	8FGgd1KycSemxKJZg5tTwVx+VjvA19nHzIzH+HBSqsj2SIiUpUMMuf90YTibe0+W
	s6zmKgD7EstmOJ+SyI8lqaNz4xu/GTBh7XYz0ntY19G1nqJSn/P5JEoI1JrMs6RF
	KJC7lyjPM7mOYR7ksoz2dFQfZeGpWLZsiylDp/Ala/kuGw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9ugkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 07:41:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so2462218a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 00:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747640511; x=1748245311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDNjg9CVy+PvEX5/Lt+VfpCCTKTdj8ZZWuSFdP68hXA=;
        b=UCh6XTBbYprYR/XV64j8X8p+KGuBCRkemXHzbu+YUfGq8LT3m34Y+I1MqpHOHWr4HW
         BzQHQxEI7Gtq/YeqixPfmwSFXK4y5nQ/m3T9WoLjZV7jmtJFTJfQ1hCCg90ggr3OMjrz
         qCIabItGLE147l+uEFkOkcmmF7H+lh7+q83XEGjWZcOrTVCKWEByUpC23L5/82bWlFwe
         /NZugJHxG3Je9nEPyL4jLtc8OvaqvVbwGp6pDUvcvY3PHIh2NjQ5Oy8QkF4ddQpzGGU2
         HKDRVTjCON4euOpdgeMKgaSAMYiuVpBYWmGTe4HUYVo4Z32CqShnRt3ArKKTKWqc3M3l
         8xdw==
X-Forwarded-Encrypted: i=1; AJvYcCVGGTpR9zzWjXp045FFb8QqfXnb3T40siMhxW6Xq7jct5t/YTqwfYHvdCn3JwOJe6sF4S8LBFsl+K23TNbR@vger.kernel.org
X-Gm-Message-State: AOJu0YxAyeKgB8nnPo3YM9euBjjlaJZshQkV+l/JsmqoCw8/RG/y8y48
	ubh/iPexlsD2rntbeARuwmVMCfYokLkEMS58QoDuIQJ7bva1jxCkGifcjtm/Rnifdgh1PHmm8gd
	BilNrpIRdWnTaweX7ifkpiotpPMxquEzA+jrtDybh2kyfy/hVY30xKnJb7w1MPWmkdtZT
X-Gm-Gg: ASbGnctif/2/Voct/4Mna1bjV1HUoQ0TCy3LHTOPSaUDT55QxEgiN+Piu/KsoDe3+ev
	7QzbEXI0ZD0p1LtIaYOHe0x8fI5JBBOkhCHagpdkDnGFR3SuWWhQZJ3uZwVIrWepqC3SUinlc/w
	vmwFMEhKZfV2KEgJ4gbovYpZSnU3fzq/DY3gYg7OTCS0gjcMpQ05vscGBRwGaRU3D2tftd0rmC5
	den0wl2p3wOOQVEpFyQiJ6ETp0Lya0koHDgp0xkkJZRHHStiiqJiEWgzOt2c2f8ctuAPM1yQnnC
	cS9Fvyn+X3bC46Ob+cNO+hquKOhJOBMIC1WD5ac=
X-Received: by 2002:a17:90b:4c0d:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-30e8314bbd9mr16540685a91.20.1747640511266;
        Mon, 19 May 2025 00:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3pyCMyr/gG5Or8VZNaN1zL5hwnJXCU4mQRJygJCN20gkdCDZOvJ0RyHYVIoqUvhRqTC9BbA==
X-Received: by 2002:a17:90b:4c0d:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-30e8314bbd9mr16540658a91.20.1747640510802;
        Mon, 19 May 2025 00:41:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm5659201a12.48.2025.05.19.00.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:41:50 -0700 (PDT)
Date: Mon, 19 May 2025 13:11:46 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: qcom: socinfo: add SM8750 SoC ID
Message-ID: <aCrgupYa6J5rRJYL@hu-mojha-hyd.qualcomm.com>
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
 <yv3ageskkr2mwtgnrldlpgmvgqbxfullp52w7yjg47lm34h5cb@n27gdmljehyc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yv3ageskkr2mwtgnrldlpgmvgqbxfullp52w7yjg47lm34h5cb@n27gdmljehyc>
X-Proofpoint-GUID: yi-8XTZU_2ycVpAWDScAoHyoglwKMN__
X-Proofpoint-ORIG-GUID: yi-8XTZU_2ycVpAWDScAoHyoglwKMN__
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682ae0c0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=8TtkWFPNHdivomkhMlYA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA3MSBTYWx0ZWRfX4RF6cwuDjPPQ
 sm5yC8vGHskPaclhFksy3GhsimcFTRxvbY37a78+eo04OEkCrYAn0Cm9rz+ri8XOtuIrp45fU4k
 gMsW1Y7QAAsng0w+V5bgdBwCBR0KFPCl/XpauuRC/4VH2/s4xNShdpKlwAA8WfDVuBAzV7RxnfH
 7xfIhLerMd8VFDgY32+vnHeBCiZfKIUBJHCpyu/E58qvlTQIQ3fY9dTUXjzpebpn5T1E4WqkRy5
 LIat1EZXiITYt+R841x0nwTuos1WMurjuzBifjMgmmO77u21IF2Xz/br1l24nHdVOndkWnvIsRV
 Hzef/cSXOePY3ZCQ9FF+oH/AxK7YAx7ig+gbZ2Mg5cEY3KUVFSNU02Kj8nWpRZfh0KwvlTinujk
 YSZA85FJtaL/oU+XPyqFHsHE3pTm6AjriKjWbF5DMWMt05ZcTvV0F5vyN8mg0DoyelW1h7Fr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=816 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190071

On Sun, May 11, 2025 at 05:30:52PM -0500, Bjorn Andersson wrote:
> On Thu, May 08, 2025 at 07:16:34PM +0530, Mukesh Ojha wrote:
> > Update soc_id table for the Qualcomm SM8750 SoC to represent
> > SM8750 machine.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >  - corrected the order. 
> 
> I believe the feedback given related to two different issues with
> "order", and you fixed the sort order of soc_id[] but not the other one.
> 
> Patch 1 can not be compiled without patch 2, so applying this series
> would break "git bisect" of the master branch.
> 
> 
> I'm applying the two patches in opposite order, but please do make sure
> that the kernel is buildable and functional after each patch in the
> future.

Sure, Noted.

-Mukesh

