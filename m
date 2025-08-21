Return-Path: <linux-arm-msm+bounces-70124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9EB2F4C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5A9060463B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017B02DE700;
	Thu, 21 Aug 2025 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJDL5LB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF872DCF4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755770429; cv=none; b=oUrfvYaz0uBegqEQRFoMHPkpENN0yR5rxPMiq06U59yUtNlQRRh7H8UDhYDVLDHNIFsAuSBvzC+81Opfzzep0KWXhHFI71h/vGETQbejDql5jB4tc/QNKmaLPVuAofp3lAb9Tyz5QFF0RYfNWbWaTLMMYlwcvrTsbXxu9efelGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755770429; c=relaxed/simple;
	bh=Y8oFffjKoApbub4tCKt/v9xVNo7J7Qh09vDhx0yFE5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpExP8wKh3bVwKThJ2/OBRfxXFVpyPnGyx/C4AJREe0kWKvvoShFgHslWvzEqcbotFuzMS+q8u3xXqWvC+/yTB9vtg7+WThjgkA72ioe3r43cMtCmY+wiMaMCRV/YQsCaDeQBaz/HMd9Nn/xXzE9WCm1QtgQimQpK/7kKR04cIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJDL5LB9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b6Ml026986
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BEHubwHefQwrPqwhX3iHGRRX
	J/TlvHydnjvXdxeW7/w=; b=UJDL5LB9WOYnkibCHOzq+rrOD+RcdU+K5gaJYLOe
	yQuOBq2CFD9a4vZHWTnfMIIC9dMefUY3h5wbKD9wgLuBI4+dVjxRNtUKo3EJ0Udu
	Oy8Z0T+UFugboBg7OWS/DQG6oJ5ctOHJrWXq1sXMwjKTgA7Wj2/qQeu8gGvHIuhL
	szd6VVKzDc2kzjcoyMsretV51subasHk7+OSBTxxAIDoRKjcdCyPcxVhtZ1BzSJd
	3K3CIPwlu9hWMnmO3EaJI5X1ZTliZmb9LoDeBOuij0jh2/3Af+mFx2ZU/SK91ToP
	PddmZOndf+A8rqTHta4j80P9aRtol1giG6X6CkHjpKZskw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w01f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 10:00:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70ba7aa11c2so19191896d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 03:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755770426; x=1756375226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEHubwHefQwrPqwhX3iHGRRXJ/TlvHydnjvXdxeW7/w=;
        b=iiC1Ije4z574wS2mpgGS8kVCuhhRnxcAgDBo50vm68W7e9KL9bOZFUbKDWFlUFgZ1W
         ZL7MUOcvCypO7ThXPlZZ6TVN7P94w7GUwj1pqB/AfIV0HqLeuoQxb8NOI4mGqSWKJWZs
         dcZgVFHbXnNpand4p9ngz0ARq+u8/+IAAQtNixdDv6YdUaujPoRH1+fAoVaq91nrkT8V
         Rz5FEkhs4LFMf/day+T06PR5mvUjNBedDTS22MlYQc1OSWeH8ZC9zktCoi115dPTlZ+h
         LmN8pGV7chL2PVaeZX5yxfaNwQkv6Zig6fZYmpkBBfwIu1+e8AUwM0qlKKnPHiFImpX1
         8Qxw==
X-Forwarded-Encrypted: i=1; AJvYcCXGmJ8EvFUN/3saTIpst6MOsYOmdqQ0OcPMpE+wMeMMbsoo4Xkr+auO47dWypo1vuKz+cA6knlm/Dp11rQ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl0lAbrbpGKRFsB7SnFQql0LkWFPrbufYefGS9eJpR13+W0So+
	ydHJMazcmqq32Wz569RECd95O0YCvlwVBIQXE0hD9t6F2eOSqBJnTouU5yjge0Imqe/vbCojLaG
	zXJS0eT/H+DonzprSxAgwDZORlHIWuOrstktjP9K+0vcSbKwkChW50nbSUv3Q5jOhs4Rk
X-Gm-Gg: ASbGnctrl/4fMqLl5BNhIyT4wM/iZL6CPyQY2E6XLhnTaXLaxZ8DIEHPjMtA6Q7YrZa
	hBd6SU2BkbDXR2dRLtv15Cq/1vmT2ZE4aTCvFg9ZyoVWVIYzVnLtTtrtpjCfNqFPQk4I0Jr+QcV
	NVJs6Rb6uR0fVGqs+fiMiD+GCXbLdGDsJMXfXQgQolBzry5E1Y4yZBmyl29dBUagFapPZy7jn9j
	EVHVQdO8iwGDJPyHKTGjk4mrcfOtCwrrSyUunzhFHvqkgxUHPx5KWBdqHXZYpfc3qGLDGSa373c
	nEDbcs66sIG9ISBIriErVzm7NcbMNTPzNJDJJCBB5IoXDPZ9Ewgm6CsFWtIF16G13g6OzRcwHH0
	C6ZXv5iepn4TzBQnj02P/ziFdJIZH/XF6ba/e6mAn1odYzfooFo2v
X-Received: by 2002:a05:6214:20e2:b0:704:9239:bdf3 with SMTP id 6a1803df08f44-70d88f81867mr12888396d6.40.1755770425842;
        Thu, 21 Aug 2025 03:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7GWcK1Cl7yi0H9LNf9qwylu6UzN+J9gWKQiC6yB/eosOSwsmqO6HT7DI9oxpCQE6vFO0F8g==
X-Received: by 2002:a05:6214:20e2:b0:704:9239:bdf3 with SMTP id 6a1803df08f44-70d88f81867mr12887946d6.40.1755770425174;
        Thu, 21 Aug 2025 03:00:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3517f7sm3049579e87.31.2025.08.21.03.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:00:24 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:00:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Wenbin Yao <quic_wenbyao@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3] phy: qcom: qmp-pcie: Fix PHY initialization when
 powered down by firmware
Message-ID: <opdbvesy3gomk7k7fmtd5dqwycfc2wjdwhjrjedsud7zrxwnsz@zlmx5sdjdk6b>
References: <20250821-phy-qcom-qmp-pcie-nocsr-fix-v3-1-4898db0cc07c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-phy-qcom-qmp-pcie-nocsr-fix-v3-1-4898db0cc07c@linaro.org>
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a6ee3b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=t-ghYzj4duJAONndmXwA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4y46TGLCQkr5lJONJ1dPyqrg5fyicgjO
X-Proofpoint-ORIG-GUID: 4y46TGLCQkr5lJONJ1dPyqrg5fyicgjO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+59slNXNjG+X
 JEuFB6sRaZ2WqdZ77cKFiIdiJJyt/o2l9XK/MVnLB+8ECELVxr9YUMKQZoZNV6Z/XZKvdXDmGZV
 qBlsQNVGPd9UV16xdG/nrLT9HanmYf3B6LWMHbiFgtf+KLpvF5sjULO/Uo5rQCosoBp5F0Y/sjs
 h1c1L+LB0QuJHvAwpEaJN3Mr1VV4xXL6kigNZf+NZGKX4BRgnev1ooocLt6ucd45JMIkMeuUvZb
 SObhw448HGNBV89VWP6vFXbbF/Xcru+YOSdZ2I9ldeiZ6PtGL3ytFfmb+wFJa05GCGPd4Ef7xYm
 6AyL4CkNwfNComgTJKw2CyFx4wMdIop85UXODeo/LIrQ3evogGYtcn0kZ5O8VhMNOSUboZbsbCq
 MOFdynPvOQv9PyPjvMAT2LJboXjjGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 10:01:47AM +0200, Stephan Gerhold wrote:
> Commit 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention
> support") added support for using the "no_csr" reset to skip configuration
> of the PHY if the init sequence was already applied by the boot firmware.
> The expectation is that the PHY is only turned on/off by using the "no_csr"
> reset, instead of powering it down and re-programming it after a full
> reset.
> 
> The boot firmware on X1E does not fully conform to this expectation: If the
> PCIe3 link fails to come up (e.g. because no PCIe card is inserted), the
> firmware powers down the PHY using the QPHY_PCS_POWER_DOWN_CONTROL
> register. The QPHY_START_CTRL register is kept as-is, so the driver assumes
> the PHY is already initialized and skips the configuration/power up
> sequence. The PHY won't come up again without clearing the
> QPHY_PCS_POWER_DOWN_CONTROL, so eventually initialization fails:
> 
>   qcom-qmp-pcie-phy 1be0000.phy: phy initialization timed-out
>   phy phy-1be0000.phy.0: phy poweron failed --> -110
>   qcom-pcie 1bd0000.pcie: cannot initialize host
>   qcom-pcie 1bd0000.pcie: probe with driver qcom-pcie failed with error -110
> 
> This can be reliably reproduced on the X1E CRD, QCP and Devkit when no card
> is inserted for PCIe3.
> 
> Fix this by checking the QPHY_PCS_POWER_DOWN_CONTROL register in addition
> to QPHY_START_CTRL. If the PHY is powered down with the register, it
> doesn't conform to the expectations for using the "no_csr" reset, so we
> fully re-initialize with the normal reset sequence.
> 
> Also check the register more carefully to ensure all of the bits we expect
> are actually set. A simple !!(readl()) is not enough, because the PHY might
> be only partially set up with some of the expected bits set.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Changes in v3:
> - Move up existing comment block and clarify it, so that it is more obvious
>   what the additional checks really do (Bjorn)
> - Link to v2: https://lore.kernel.org/r/20250814-phy-qcom-qmp-pcie-nocsr-fix-v2-1-fe562b5d02a1@linaro.org
> 
> Changes in v2:
> - Ensure that all expected bits are set (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250812-phy-qcom-qmp-pcie-nocsr-fix-v1-1-9a7d0a5d2b46@linaro.org
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

