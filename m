Return-Path: <linux-arm-msm+bounces-69803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D3B2CC3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B8455A4E55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9236D311965;
	Tue, 19 Aug 2025 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HA8HyV17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1B130F7E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628782; cv=none; b=o40qB+QIBMzCQl3G7u6ZXGoGPg+aAFtggDCU1NL5lVFawMvJ4yngSFIP6NwgF7TLHpZU2y1Nv4U2Z2wIfmceqLQV0YEIVwrUpZfXQ1qaex+1Y91nSV5eUSCeIaizQDOyzrZX1hp15vVpZ1WQYsr2n1g5Kad+XDTYTxZIfRuM9bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628782; c=relaxed/simple;
	bh=attFyXnsjHZ7VC6hMeNw79npgKt7Qbm7Wikl7gPhU0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLW59Ygxlx/CfhJOBNia1nO1SexTfDUgpLdHDa5vQUxlbb0hV5ag3OXJ1N+zvKQucnPfwffxrqRSkm6LnCreXxupwqXYr0C7q088895s2Y4r8jGva2Xoa4O8VEB8iFnb5FXqFDl/qF2ArNDb8Fl4h0ALd9634iz7oc2MiDzZv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HA8HyV17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH7rAt007208
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B/NaYmJCzR8gO0DUUe2ae+cl
	BVLL43im9S6/z9w+rf4=; b=HA8HyV175E3ppKJkvp3ZXjn+X1lO3j/LLsRYtcj5
	saZyrC6h3vauSLYZ/bkqJursuLjCblbztWVFx3Rzmq6HmtkK+xYh+a6LUaE90wNv
	IlHvUgN9aCH6Lvs3iRIe7SsVKwYWIundaswflKp8KYpXlQs0/sYVq/4nrGjSpvVp
	abypcNFh+2mVsFV3VOT2iJJY9d18UpOgj0UpAix04OdIj8CKP+BMVg+8i+LaEsNr
	IuOxYjeTUADvIimhGGRRfYMIlnyvLDUYxQlj+vhErW5w1HkW2B9WXdAM/fZACLM7
	X8fZ7qgSiqt6Z0dFKIq3LkQXgcQ8mSVnY1O0hYEAm6t8/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj749ptd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:39:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f5bb140so188025036d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628779; x=1756233579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/NaYmJCzR8gO0DUUe2ae+clBVLL43im9S6/z9w+rf4=;
        b=BXcTDc3zsBd/9JhCeHWSnKg6vLUGl6YbZ+trxn/h6EdKxmcV5u0JQC1Rv/QWCys7rA
         6TFaZ1HoUiVkUzA6NQ15rJM7YVk52rd2cojSUA9ZiacvmC8movgCgtImFBKVi4GnBa47
         d3vEYO1W9RyBOCHdYp6ffih6A0e+Iro8N22EgpuBVxT3EjJPfz9NTQesdWUK1+4nVlOZ
         02VO0h0QkDmNTI4KqxmHbCbt/AEEJN46ywAL6qJItL/Oxmt9SZE7sdAu4Wlb4qXaMIhX
         Umq4O9b+A9Ds3HpX09NW7fPpGCJk0P4OtmG7Ferb4r4a6CzMFtHi1HepQPAT1Ra8/3aC
         FxhA==
X-Forwarded-Encrypted: i=1; AJvYcCVlkCCkXUuJzSMfQnqwJJsPNO33ITw4YZs7OuioFHsX6fJdx0V7Csr4sz94RV5xIUHHhFZOboMa0LyBm5JW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Gqo64t1txeaZ0pL2hJ433GIekQvkU+TH9jaBrmAN41C3Yx0H
	4LMF8Hno81/9NbdqNp8QNDz0YlCh0XB27Rm1K3d3VaKN6CVb5tYCZB96SX+awZ25dxX+c/2vGwn
	B20CWwWG2LkDCx6gFaGr8Hgs6aW7glAc56TAGNWHFKq2HHMDfyF/wkCBr2QdzUCylEUWg
X-Gm-Gg: ASbGnct8SrEJPp1fyzImF+7zb08/bJdgAbmSJ6aEvGxrdlD6Vg4va3D6IjedM+Yohon
	CGg++AgPZ+cIREdeePrc+j1ACHqKa2H3huYcGJ6fWJvUAjYcF0t0EmLh1xM+2ID2zPtuLER/6uW
	lAL5IVX1b/FIWPyenQ1093gIzHI7ELh5AI2T882+RZDOejVbchPjC7nuUMkukLH2NowBbyflLQB
	w35o9LT2N4+fu1NWIjuGeExrA6/y2+BgHs1BUON0ySjGvNdvxF6BkSDqAz6WNCll1AdZHYizZUB
	z4pZb9UnB/xnVjEApzH0ZZsrx6O1+GgHaiigAtSx8fEHdMTXcVtdJYcha9gI677OeUe2P7F6R2g
	hihZA7K5obqUVxs4jArMYts6pUVXj+li2lykeHoJAiFghmSuXX4EY
X-Received: by 2002:a05:6214:2464:b0:707:68f2:3275 with SMTP id 6a1803df08f44-70d76fbbb32mr550066d6.24.1755628778964;
        Tue, 19 Aug 2025 11:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1qwSILdKAsr0GJZliDLF6PIj5cZ2w6GM1QhNowyGfOtSCmwfpTie6OxhRJWiVBpMO8KPupQ==
X-Received: by 2002:a05:6214:2464:b0:707:68f2:3275 with SMTP id 6a1803df08f44-70d76fbbb32mr549686d6.24.1755628778433;
        Tue, 19 Aug 2025 11:39:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cc9d3sm2266106e87.73.2025.08.19.11.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:39:37 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:39:35 +0300
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Minor whitespace cleanup
Message-ID: <vmyn2kj7ln4a2acwfe4c2qedw7onrgzxylcojsxtuzhpbd52zh@6h5jpiw2r6yc>
References: <20250819131717.86713-3-krzysztof.kozlowski@linaro.org>
 <20250819131717.86713-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819131717.86713-4-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: RT0E-v9DDgVJ17uLeqW-12aYs2trBpBC
X-Proofpoint-ORIG-GUID: RT0E-v9DDgVJ17uLeqW-12aYs2trBpBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX5D/YTNJI6acC
 /pV1ON8DJepq+YNP4Ajx80mTfkRb3SlU5DwIcO+5fkKih7fVnjd2KDI2Adv2YePXiWMB/OUavVG
 BZ/SqFnX/6imhTmZcp8sEZQKpmLk9OkI0v5t66SFsXjp05u0chtdSKwNkr3bwvG9aszeCv8AtTN
 kc+EWglKia6qVd2j55yvhjq1I9X0x6FHHnSfd6Mf3UdHkbxc3qZqswyvaOTYwgJ24XB1/xZ9g7k
 I7JzqPkha0JKwcuiLvBVxz2JKFYcvIwFQ9L0CBfUuNS4ef8syAxeuQu1tm1veYHKXl4VIJ9DYsj
 J7LRbHz2uDNIN0f1c/I74TpWHhp8x7ofgCxSem3Yq6Q5JygYMmvh93GgIuhPHpi5/KGHdVs/Czi
 Ip4JQRpO
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a4c4ec cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Gb3ubVUUNhpLmocYnzIA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

On Tue, Aug 19, 2025 at 03:17:19PM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi                   | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8998.dtsi                   | 6 +++---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi                   | 8 ++++----
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
>  4 files changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

