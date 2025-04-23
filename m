Return-Path: <linux-arm-msm+bounces-55141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F013A98B6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20EAC1670D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D701F1A23B9;
	Wed, 23 Apr 2025 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMq2faP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270F1A2398
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415477; cv=none; b=EXI0Ld+HbhQG91QIHRzSWa+VwgTL8lS9KUEmaXEOGeyUoktvaACq70fveGy2TyQQqPyrx36aRbeU6sqX5V0PtASExke6zildjLI+eFz6lHUPCxdTZOVDh7y3CsM6E2rIB0LWA+0g1SmQ/j38TlB2dR+ZuXs2Uq3YYQ/MWctXjOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415477; c=relaxed/simple;
	bh=Bk1vBly7Gn9wz6+X16ugqS+ZdEVmF8hiBAf0LZPkYjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQOZGuTy9XEu5KbKqT5n+hdrtfYjBXmcRixGMoGVctgQ1jURplw+eAsB44RRPXDzEehJfMMTyfjODvYiHtMIC17d4L+O+DNy2zcj4gsrjo2DHU/qDKF+1F08mzB52v/uEh5XkTSqU0sScvKMR+CTpILqTLjVnvNIAae67v6Z/ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMq2faP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAYYCV016850
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+2ze/rnX+AqFYjoGgrqs+s9R
	DoXeSpWH2VHtigOpg8U=; b=EMq2faP65RSDIjkMhd4B/vQC1OAI1u2q4B8h76xD
	bo05K3A2ocZpXMZDt7r/8iq8PtmXUjxoVVsauKPKOvCOisWrNCrKBAA1/fY0Ioo0
	pau+Txpiq+sCHgqfJT0r5wEeLm+GmvzcjuPXAfIOjnj1eOEleAYY/K6hafyWCxfL
	uBoxCQntWvVt689Xcxwy11Ok4ppVL8Hwm52qVNUV1EbFyNO++6dfZROQo1Wmmyd/
	9tmjR5Uw70HUs4Akj7iaFvXMqmImXtj21goy0VVnfU1T0qdHg6VyfXXX2od8KqAT
	VK+E63ecyTp9hUv55QmFN+4AFm2da6ryERG3fZyqV8QKVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j8kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:37:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c793d573b2so1171834185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415474; x=1746020274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2ze/rnX+AqFYjoGgrqs+s9RDoXeSpWH2VHtigOpg8U=;
        b=emA6Ydb5Ghz/FUAAxuw0S0L8Gb0wWQzJ/9lV96stYb6MiHZoWY98CDiJWxO6YIx7RJ
         8t4W3J51V6GVBifp0ICt3BLz99pDZF/Y4g2SToYhM5MGJPwsUEzc0Wxvu/VWyW/f5/qS
         M/hjOg0clkZIvDcvbUJEMFyLzboKXe0VNwwxz/JS3kpti+82YEiZow1SJJam5pau4TE5
         g64tkikbFWl0WjdqIbHMaztJHJZs31aQdXaR9xRpEyX4CYYwL/6+gJt1LgsS33/ACB7T
         4ij5xIPyZHRhM2hXzxHu8zcO+SXkQDy9Zp5/a4UZtZVHkQggamxU4tDOqsXXhx6vBMLA
         pRgg==
X-Forwarded-Encrypted: i=1; AJvYcCVpVSpEINksnvRJo6aEQQMWz/LBitd/xMHwFJ1+5Eil970GOjK7QzjwJxlI0a2qg1Cb2a0kBOvotSgCyB+I@vger.kernel.org
X-Gm-Message-State: AOJu0YyM85WnzCo6kZyH9TEahGcfFqw8OOOMwkyWFkxdOuEE1YSYylgD
	+lOQaqsvuya87nA8spTjdPlv48yAmTH0W+rnvdPzNx2eukuwnFWA5BXSKoIKdAy8LZruZQxoX5X
	uX61+9IcoTHYpfFjJ10OAj6wbE5Q6WVFECfe3d1dV5hLphXtwsklz+KSTs5VP5dA7
X-Gm-Gg: ASbGncsfk7uvTL6ZHCOptgMhXPpcwS5mAOjblJtd9mNIQpngFl7YSp6eUpi4eAI/A8w
	LatoDJdYKx5xycSz8mv7KM6cBQ5DQ8hjOiGeE7qym6OoN3wuFh0eP8NliMP2bXNazd4AVuGyYOi
	VuQt+gNEZkwkJWbrYxsYENGe1ivfJuoC/duue2x/KY49PZ2WQWDtJF9sNgvTXxUVijyR9raBkFB
	DPDQacO/VdM5fSdpwkaXJkTYrBsOn+toUK0H8BDjSiMXoH59R16S4jG92YKzZnZObY5L61BuAkf
	LWsdutP2qUtrBo5pYMI/6dqRkEykRQmfJFKxVgDR/n1rqo/7BTOG8gwVrkqHj3yVt3Dqbk4WFSY
	=
X-Received: by 2002:a05:620a:d95:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c927f63367mr2730405185a.1.1745415474034;
        Wed, 23 Apr 2025 06:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHQxjyT3iMSomg5ijBHCAHqMp5xzTzundL8sqlTqkPCKrDcBt3wVLGtMzpfLC7BB1RtedrtQ==
X-Received: by 2002:a05:620a:d95:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c927f63367mr2730399985a.1.1745415473543;
        Wed, 23 Apr 2025 06:37:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d010dsm1533420e87.120.2025.04.23.06.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:37:52 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:37:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com
Subject: Re: [PATCH 1/2] phy: qcom: qmp-pcie: Update PHY settings for SA8775P
Message-ID: <tqzmof6rq7t7k3jbdmay7dplz7el3c6i3ehesdiqnp7iq5f7ul@3lnf3awj7af5>
References: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
 <20250423-update_phy-v1-1-30eb51703bb8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-update_phy-v1-1-30eb51703bb8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2vSKHw-1EXtducvWKe5BHc5NQXGMOxhx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX2AhSF07zbUNq krfj+f3prFnrpdu26rigmEj0PlCn0NFweuiqkiEON1E6h/2W4+h3ykCg8yE2psybtEGU7ISgBsS S8/4cYursp8IEOVm501jzlDep4lRKOpuZrq+qvcEbqT24cAT4QGWmBdaLu69+2Y3L6D4fG7f1aR
 VtpKOKb1hnWUqj0ruYc1zDm3EumDPexl9qAS4APkjWC99SkhAZDz5s/N/cCpkhXrzEVjxoD7Uwp UZPp9PPyWc4KQ6g73CpU/khg5I+lXAZp7l4O2Wdc3bzUAP5LtHsw6+mZZ2GZBOHcfLkZks3JE0V fqzFrBVXFcRCMmqJe0gXHMCTS3BzR8Gt+jvJGJzlfS2C4250qlDa7dv4szC1mqktc8tb++1N2nE
 gyOq/eN36uql/1QkHx6Jo5rkfn4oBCt0YpIjlqXZc6IDvpKDVFy4vBx3e5J8IFBkTwVF1/ts
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6808ed33 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Vt7sqbXHGhqwYxysgRMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 2vSKHw-1EXtducvWKe5BHc5NQXGMOxhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 04:45:43PM +0530, Mrinmay Sarkar wrote:
> This change updates the PHY settings to align with the latest
> PCIe PHY Hardware Programming Guide for both PCIe controllers
> on the SA8775P platform.

Please read Documentation/process/submitting-patches.rst, look for
'[This patch] makes xyzzy'.

> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>  5 files changed, 66 insertions(+), 41 deletions(-)
> 
> @@ -3191,6 +3194,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
>  	.rx		= 0x0200,
>  	.tx2		= 0x0800,
>  	.rx2		= 0x0a00,
> +	.ln_shrd	= 0x0e00,
>  };

This does more than just updating PHY sequences. ln_shrd-related changes
should go into a separate commit.

>  
>  static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_30 = {

-- 
With best wishes
Dmitry

