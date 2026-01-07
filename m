Return-Path: <linux-arm-msm+bounces-87812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A6CFC8CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 09:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BEAD3015D21
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 08:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5208427FB3E;
	Wed,  7 Jan 2026 08:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYkU0qoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZSAmyh9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1A52367D5
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767773768; cv=none; b=O6muGsjy5QhwdiC3xV0WtIKJlS8DYCh7GIOd4zqs3lQF/MrETx7TCfpTCQiPRTnmPLVsmCyQyOTvlDGE4cNAZYD70HlThTJKR6WJPVlyTxMLMiAEEQyD970j7RbXQGOdNKY1sCfUASgeRvYD6aubLLT0Vub/+WxGAMWbKCbYMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767773768; c=relaxed/simple;
	bh=o1AWs4MhRK9ALRPlsS4BuKxVmEr2fZTG2p/UNW2eyJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8sM3hRwB/hOBvJY2L6TqPtXjsU2XNBIp9XmooVy8aSldjil4BsWUpAR9rAwKXbox2v5KOZBu1Fi47ywdq+crrjIyjckF01rx466AjY1YG6Y34wYDaV27T9vAztU21c8hiXWIp1G8pJe5ZTV9ItMnMRAesYGW+Z0QUxWUqbxWy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYkU0qoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZSAmyh9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074m0vx1642748
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 08:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qm5MJrdnuggNNNAB6F8dt9I5
	TzWW/Oz189rKFUnNs0U=; b=WYkU0qocoyMYrpP8b1PRLyQ6jyqcNuOptcrZYj33
	1fxfO3T5IGMi3Se5aveHkB0UzjdiHwynNRfKseiSx3U+z9gixYIHRfFcgb4PZ1Sg
	1DBiIyRWqVJ9hZEXQqm3UXbKwY6VkkmadP2uMJ+MH1VCdMedLPhCuKOxsHlmgpEK
	PrEO1p/pTvbXQAIPbuctuvl0gcx5DY+ohleduZJ7gF2OHBPV9VGNcZI7Qt4gyaqI
	Ff74KFah0wiFEKA2ke9zU3FSBjeOSJjG2Jkymp4KzmLlvwTL0t3VBXLb0I9FD7Fg
	d1MBvazTiCqxhLrycb9JeyiNp38uU/Pl2vB77NBaXnrg9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfgkcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 08:16:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c38129a433so434713785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 00:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767773765; x=1768378565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm5MJrdnuggNNNAB6F8dt9I5TzWW/Oz189rKFUnNs0U=;
        b=DZSAmyh9JiOkLcEQ/Dqacj0ug6dafZLZ+xIl/eZOImOkmfiZm6HILPFF5X/VivAwAn
         VqdRj9AXyDS949ADG2UUIXNUEgwXi3j7BZJjvnPtbExpRVUY0XpC7sblLxU7rYmVbFyr
         4foiTzc8m9Z7HKv1JMW+4I/zfD7fk94uvHrFZIzJSDA3kLrfl03ShkZHsZ9v2gyREZPI
         RajUB1slS52PWF8yVmvTacJYCZRKDscHC0QXdamsj6MCHveO/D2Ueu94eVASHe3BGrUz
         CIqDANU33pV7m12TeOWdZAYoHinNuvzEJIZvzbM5lgy8rvnzLMtXukFgFifW5b8xxGXB
         VWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773765; x=1768378565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qm5MJrdnuggNNNAB6F8dt9I5TzWW/Oz189rKFUnNs0U=;
        b=XAkI4k3/xWwncn6KghwLUYYaeJ75eEYSEBqjX7nfk5FEGR+7IS6XlJLzFmAo4CNy2D
         5NyKhvlF4Xr8HXV9olzc+gvDqlbfuRiJsvUWMiIq3jWCIqS4U/9xPVTNs3a+6bKCAS36
         cvArTSFqzO8B+Poej7dQH9pptKvm1YA8i7etN6RljrHdbQUzgYScfr2gI+waHBqg0l2X
         imkv3U4gBdODzhKbGDE4sriawsCEnqTq8IMoOax0hJbdS+zfbdX0JZxoX2PsKVdXWUtK
         Fe15/MYc+L1VGlxqiTibwTkpd2lTTg7AdOsrMn5Npt6Dc/RS5kzx6/73Sa22jSOUlLU/
         lcKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVZhwiAUD7gxGAeYavOaZvi6D7y6FAdVhuml2Vzu5PIlFN0f/H/Aua1Yy9xL4qgeCMNAqFjqndi7yKgWcg@vger.kernel.org
X-Gm-Message-State: AOJu0YwrLEhNLBrsl4CkVtqRLZ+c3jfb83SG9Sor6X8kOZS9A0FPmipT
	UMvqN8UFjzesUyfrSaH+iYR83ozlyZmrqs9DTLdBapxDdxy+2Oijbon52gzWy2ZxJ5RFMfq9MTO
	onXt4rpkchZ7wTGXX8F+mwVa+6ZS9ojrN+McIcOBj6pWgrSQzMy5R4pxwnXS0LfelOykQ
X-Gm-Gg: AY/fxX4GM8kzMzXzzvlOamVrpXbs2LGsPrS09pwXEmCpaNoqrcsRz/b57nrN3oXbKEu
	c0Z9+48Nx/AGyhgQaU3DFegKXUFWWhhxJC6aut0wiuspY/A91OB9S99LR0rGeTgpgA1dg9cJG2B
	SiGMFUaOq1QH/LQaQYHLGcFrXw/R6zDSYKNMTiIRRXF/9LcDdwrveDy0nC+cUrkheHepMtVWm6b
	KJ5ngsvHaBMPPKBNArUKxzdXzJuZWkgVLtj/qt3VqN7rMsSXc3brXHxBNpY0RI5l+hWYHRmyls8
	AqmwHFO1UKq79BadMx7Rkx/5K7xqhGpK/JuzC4V8J7pYmQ9QDkoJVW2iPJDC6uTltFtUpSpt/mZ
	PjsXTqMfn7hvI2JI1Y/2Ubsva+G+ZeJF88Celn6mFj5SSWoRKOqISBRAO9Xz7hDJvIdEzo6GxVi
	W1W0ejjezcsbfP17mvIHevWCk=
X-Received: by 2002:ac8:584c:0:b0:4ff:b18a:104b with SMTP id d75a77b69052e-4ffb4958e3cmr22071021cf.23.1767773764775;
        Wed, 07 Jan 2026 00:16:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLeBGot7Id1we2Y9b6hS91s2FZEXZi38CtpMmDPlfGWQHJ6LjX4679mu2YzAgFfrJeuO7bxA==
X-Received: by 2002:ac8:584c:0:b0:4ff:b18a:104b with SMTP id d75a77b69052e-4ffb4958e3cmr22070791cf.23.1767773764383;
        Wed, 07 Jan 2026 00:16:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d108sm1137893e87.27.2026.01.07.00.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:16:03 -0800 (PST)
Date: Wed, 7 Jan 2026 10:16:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
Message-ID: <jbunqx5xj4kff7qxajgu7lszsmkpw5cq2bceuz7d2me3fkydph@k5b7aqggxb47>
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NiBTYWx0ZWRfX5C8/5R25f5Xg
 o15sIO3Qar19vy2HC50axdbVp8M0fqwh9esAV8LQbTWeuP0DD6ooqNdgKqVxujM96wSKBlVlnC4
 6xdEyfvyYqoo7Nb5yG0Iof9Q/9ubfmoyGrA/7zqb0DFwTJ7HMbw765zm1likWjptry+vLbp/QvF
 OILtEQ7l07FemvqAn4Y0UBIARgwCd5I9b+L91DoyxeTXYhuDb4Emni0V/vqaKs+4ZM8mv0+Jy8H
 iEqMGjfHyP9szIq4kHi1ZQQCn2xpXYrcx+UY4yWAhvMO2jBmiwm8eTxNWwah0eNiG6lCIYULCRY
 d+wTwdHvhja1eqjc3I3d0klhfWBFqjj1PTEQBZ+RwFM6NY4FzG2w0fJUTH6Q6BIicCmR3G85xJQ
 d2VK7P3lbp9Kw21UiPFu4602XyCnU7y0/vXg4rOGLfz7XRbmC1YdsJ96pBsX04OBe0nvWTx7vpa
 j/XqMpXEHOUehI40FAg==
X-Proofpoint-GUID: 9Md4gLHkT1qodD5tHW422wfskV61ZT9S
X-Proofpoint-ORIG-GUID: 9Md4gLHkT1qodD5tHW422wfskV61ZT9S
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e1645 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=PvTnMlK2driW4fpN2xAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070066

On Wed, Jan 07, 2026 at 09:05:55AM +0100, Luca Weiss wrote:
> Add the nodes for the UFS PHY and UFS host controller, along with the
> ICE used for UFS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 127 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 124 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

