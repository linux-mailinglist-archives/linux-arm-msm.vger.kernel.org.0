Return-Path: <linux-arm-msm+bounces-59233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 962CFAC2883
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A621C078C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435D3296737;
	Fri, 23 May 2025 17:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTAa9xm2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86906298254
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020935; cv=none; b=Rx8mXaayOpRq0PCYgnT16zvfb3NwikdbVbtis91soeemSjIm9rfUqqr3UNTCCBKyiHqSjw5dm5o16tu4wAYD345jTnR3vjo/OlauK9Yn49tGiACBWT7qPX0KORURkUflP3ti78B6HzCLqXalq9j6vmJqyRWzR0o1+hWAe7/MCr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020935; c=relaxed/simple;
	bh=bxic7ylWGYsZeNeLyW8IzBgTybAQH82YNsIyG5VYv8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foD2vF72qfAZvECmvfgRLwvHsf08xvzDZMVnYL4rKS9idlBGcUtObjj87PwS4Q2k89Wa7Qlh7/+NWCLLrIzczajsjGKoizT2bE2WhoXcNBWoKR60tevMZvzObxzZbh7hZL0ioL+jXNSfraEioyk9/gbyErD0hc6r9Ck8a8Ziocc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTAa9xm2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFLF1O030210
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CxsPMKsl2e6sLqpo5u4gZ9hG
	I86nBLLNUxNl2LMQS3Q=; b=ZTAa9xm2NICYgs06aK7YxkZtY78AbOpWX8E9Wxm+
	DQ8HCQxioeP3wYdaXd5E8QP/JPgO0mVkvizXHofTYqsou/a9U3/jVjgSo7iXY7kk
	ZcbgiC9GevJash3gyGxGVwvSVsbXsRv2KIsg3e8ehQ6K1GyJxyer3LH2raoxtAgu
	kqkLo0U5o9c9HbZHAhf4JaZmqFgbHmZ4V6h4lJ7I0LItOe82suJTE5Zi3kz8kgCi
	wKQaC8kXOHelOCxHTTQaNW6jl9DoLd8B2Y6GcgmzsJzpkkcTDyddGOGa4U8+rU9S
	0mH7j5y3KlNCwHzmiyav+PNvoxboDC/rT+E86bYksmmscA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa2syc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:22:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8dbab898cso1597346d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020931; x=1748625731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxsPMKsl2e6sLqpo5u4gZ9hGI86nBLLNUxNl2LMQS3Q=;
        b=frmudGVDhzMwP2Wj+uC8DhK6S0fAyoUkcmivEactfG+1Q70DgVzBCPmVMylIp5QBkj
         DBBW9z6m0tvY0CXbBssFKehb1f8vrc4Q8PRfiQpHcVlvc5m/FVZrcUn8hcr8bqWSsKGT
         WUnUTCD1LHX6Vx9r022mj26RlEMMTZWawqrKCadv4uehlceicR2KL+LiR/b5YG8u8iu+
         S5u8LjGhZfuNC6j1l+5Ag1YGlU2Tua+8wlPhk5oUHQLMRUnKlvksNd2pdasn6PeQqBOl
         2VPTqhH56RRtpxQ0i7W3NzxWAS6J2JxU82HU0iKKZAZDQ0xgikkoJ4ksmqJOjtZ/gj8x
         pHnw==
X-Forwarded-Encrypted: i=1; AJvYcCVzyHA9EHobyKWbG39tKTfBSXDHhWiz2hisQqiA30Zx8ZfWuxXabqDouCDQI4XyMThecTFNFMWhP3WGA6b4@vger.kernel.org
X-Gm-Message-State: AOJu0YwYKnBBUbaKDPLsJxTc1CZULezE6Ml2GtSLXsJ351d7oWBMD3Nd
	mD5rd1egWGFQHjhIEC+9XzQpAwrwCr93TgbyaM2MoQjh6u1HNNJDeR2ZYi2TF0Ok92/vPjvFesb
	oRdQBHBXntk8e3PohW8+DZGriZ3tvu5whBh3xyV3TVgp9KBtbbUbrNU7/r/aMDUCB03uj
X-Gm-Gg: ASbGncswcJ6GVK831bz0MHc+S6YlrFgHfuCC5i6PI1Fw/dUe0r+hKYprvPo1Q/UemXd
	nUcHdF4aQTQv8cGw6qLNFE/SgUtLOwcis960ioBm034AC/cMi7UVU1lBh8HsL3Y2vt41VSi0x2o
	VLbSM1/lPVBqGKksg8Io/jGMp8bYEG5xzPm1FqzDKZmlsUcT3i4BPV4yrrT6OwfwwYErjXayAql
	lW3cTXhmbAPnYUKdtjkMdPPgTWvQrM1MVJ8i9qdxcxwHRgd8/suribwLdzw0Q06caT9RdvN17qb
	F2SDmSS3Y3Hk1HY2tHMt6k0TglPHK+/8QSv7YauluKrOO23/PAHQhzYcX2Kw1kdsn7rTM7sAzQ4
	=
X-Received: by 2002:a05:6214:234e:b0:6f5:3e38:6127 with SMTP id 6a1803df08f44-6fa9d2b220dmr4469226d6.42.1748020931424;
        Fri, 23 May 2025 10:22:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVhZP0656eJapAdg9th32cneo9jKCo62NNQX64BGoF8rPR0iTnMnX8waJlfs9haV4AywIsQQ==
X-Received: by 2002:a05:6214:234e:b0:6f5:3e38:6127 with SMTP id 6a1803df08f44-6fa9d2b220dmr4468886d6.42.1748020930998;
        Fri, 23 May 2025 10:22:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b53e7sm38639101fa.22.2025.05.23.10.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:22:10 -0700 (PDT)
Date: Fri, 23 May 2025 20:22:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: enable camcc clock
 controller by default
Message-ID: <bfyursfvqn3clex7qx2oomredybl64yo6dxay7cplp47yzkq7n@ljmyog65hpn2>
References: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6830aec4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oxRLwV8hnwBTO02F5ccA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KmLft7yg_x82D1nBTJcVz4LIJ5yOOy_X
X-Proofpoint-GUID: KmLft7yg_x82D1nBTJcVz4LIJ5yOOy_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OCBTYWx0ZWRfXwwKCNvCg3sYj
 atSQGpZ1U4CUs5xc9vnJaDm9LpbA/QlDMA/wyqQNCQQGNY3Q33zVdr5K2VIsC0KmZUplxLNy56X
 1QU1MJQk4ClZR1dsVPKoOdmvacLHOyhgmT+l8uOqIRR08+ui8X07Tvz+UoQyK4/MIRRuG3vmEdz
 PRyLFfXZfYdRVoVUnZbbosWChjQL3R0IfIV7wTjAyA6trn6y+uDvf2YlMnqmeIYH2pg8FX8UBa4
 mboYDJ+grmIrOdvcSIqWf1j+IqHRCn5NPpOAQhjVRSM2Q8djM8hjfGfoUk5zFafH5dKdye+xgld
 HMP4UpXO4DynYprd6TscMeFjV4Qs7XhdijWAWDHkW5rJyQmZtBFa2twx+5KMT96GTmDPdYGTpbI
 WQ196tFlWfutzV0WyANbi2Fo4xxOgHOnx6TT66plCwtKAb0cdt27wwL+7xp98BdOLhq/Q+HS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=808 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230158

On Fri, May 23, 2025 at 12:23:12PM +0300, Vladimir Zapolskiy wrote:
> Enable camera clock controller on all Qualcomm SM8250 derived boards
> by default due to the established agreement of having all clock
> controllers enabled.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

