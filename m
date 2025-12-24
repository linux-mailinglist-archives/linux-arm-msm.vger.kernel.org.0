Return-Path: <linux-arm-msm+bounces-86436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C4099CDAECE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51CBB300445B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 00:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D2E2E6CDE;
	Wed, 24 Dec 2025 00:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCRNWuAx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeVwF8tM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1930224B15
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766536169; cv=none; b=sG2F33SECBhuP7xYpJ4ARk7GLbZ2mdu/Skd90MsdWlz7oZlBO3c7W9yQP/VpyIh/4H2gh4yWbb8bWq5G/7sNvvqGy31jA+qGyYs7YBXalHf6a7V2M+piZ69/QcPd5MvMSPgWwDJyGm4ITYV8iJ18MJfSBIXNvEtVHYkFWTADsZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766536169; c=relaxed/simple;
	bh=CPFoVPkXdirpnIpJkbA+pD6Bmx+TLPap+UrhEdXlwrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqlU96ycwgUppAZfx4W6d7K7qlSbTV3Gl2YJQJeZ80JxjSix21Fd1jSwBRC4F6XOB9d3Ff5HDgTavyUr2TkUP0UlJ8M8/uZ30PoNj5R++5KEqL8yMsSXHKXMMnJFmWMdlj/IcahN4HhTDrufmFzYC17UrdfHEB7V8wGSZYqlL20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCRNWuAx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeVwF8tM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNLtLAJ702677
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UDQ3oxT765FpuHJ/jLNPZAA2
	mmhp6VU1FmiG62bSSF8=; b=OCRNWuAxrG8upM6GMPbRGXOMfoOZbeh0Y9XwWCAN
	8qENcEe8xt1exVyYJCJqbLrRjoOg20wdN99zuPfVI2rBF3GPLfw1dUm0GXWsZg01
	zloJLdTXl5uQ3nIamLycrFCIkmxoXsTQvqdHZHhVozikO377dB+o7VrnvpeLyRdE
	dmfrUSuhsFKUhDB18K1jtd+BuakD32ugb6uRyC/s1Cl/AzFj7t3WxDfUTogDkFvt
	IG33ktZQLc50Zy4qqgCULRP9UhSPAHo6MTARXrsG2eSbZCn1uZjTq+xl+3dALN8+
	3mKC1R6mNaXTCss2YbXS0c0/Zwpwskk/uYEy/IcLtoGn4A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jt3p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:29:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a47331c39so139792546d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 16:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766536163; x=1767140963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDQ3oxT765FpuHJ/jLNPZAA2mmhp6VU1FmiG62bSSF8=;
        b=KeVwF8tMgeEct+5hY42IGc9fwHpPUrLnXabcpO+sj+WsayXdOeyitidsl/O0Dj/L7t
         uxpmwFl3H2Wk25SzD+21PwExqiXyDLre1oqaimfVR+bm/FJzFWn1Gyj9iRFPWslUuIyG
         3muRpzREnO5I69YyiwxNHxmrpyKAOCd4j8N6/oEs2lMkbJTlnX5y4US37kQDRIjVG0EF
         2gHUEeM8mf0jLnOyOLP/dKTdCfcsFrSHeUu7DyNyHQdo0gpHH44NPJPLZvTc59UJxV3P
         E/M7lLc5Bx9el9qvB8dOS74srW9dYvz04GyUQr4sPGB/gGlu+yfwXR9EEuP2KSeorSRc
         0Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766536163; x=1767140963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDQ3oxT765FpuHJ/jLNPZAA2mmhp6VU1FmiG62bSSF8=;
        b=MaJqjQB39ZffZVFjXBkKPLS6MaJaUKhR+MNfAXHHY4PFU4grpuaQZ501TinQNsyuVE
         VFqiF1W/JZDWsVPSpePHuerZAu6Y43sx3ugS4P55KMVAdRI/BE6O3c3Sz5UItcPzpPEZ
         inA9TV9eEmTt1sydUMjVCO6wQiuQcSybC45313Wh2pfNfHfO+0u+OCDwLWaV7OtWecEK
         SRZAJgMzyxyOndvIKZeQ+LrTwhn/fhCw+OgwunjbN8h5QwaoCoKUSNs7hFLLqjYR8Xzy
         9LMsu5+UuEiUs8cq3XBjjcPGcJg3B+A7mHCk66PrYle9tpr0S5AxIMXE9misLkuaTp3Q
         LDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjZl2AxwJqWmmN6yHR7mtBcaOZoVSamA8hu3hNZidFujdFwTg8/4M/xFYzeFfB3VNqVYhteWQbS6/Q7r0P@vger.kernel.org
X-Gm-Message-State: AOJu0YwvjJVBq3dXB0eKcmlmwgU3BtCFM5vHhSFEzIDKVNe7F4cDtO4G
	RJVY2e2jpl6P0cEFPeL8hYrPEYmR1a0IwbGrOqoepKdAbCToko4dbSzdNjiPkBIigMUnU7vVY9T
	bZqeQztbHPrx5imoXdKSnckqP266XU1H7TSvTQbQVGRDEJn4r5fh9gEdhapPQqIsYtzxX
X-Gm-Gg: AY/fxX4lBWFJyUl2LJstkg2hkeeY5aJT8oQ6jgIjJAFU4VbxtPLtCNOA/y2JFwbgbLV
	gOhmikUOYWrdvh8WAt7waX9zvQyg+/Gz5t8F/R5OXCfuU3X7wbg1ChstExJf26CtJNc2FxePsAw
	5uRebzxM6clpdf5MENlDxUa5+0kOwvMyE7SFk5uiAbz9UVTfNYTNQ4ry83xNK0WlfXVMdQNcMQ6
	7a+e/YBbsLyIpsLQeK4H3xo6R6Q41YOUPtZJGSn3nlm7Z5oYJlfQDjNIvQVZt0oSscRcmUkkiQZ
	3tgHENjI0F2ogCHrC9f4hoaMVRlcUy2HgtwUUCWFgAo14IxlKIGKaAhBFZo0euvMhp8YeeryoPA
	CdMvE3Xnd/kHUsb6lF9jJOZJ8giB7F+QG32MOnrK1ReQBAGUc+Qh20JwxlaPVTBvr4IlBL6+u7E
	zfoh+L+MXm5E8AAmagGAu9EpI=
X-Received: by 2002:a0c:d808:0:b0:880:1be2:82d4 with SMTP id 6a1803df08f44-88d82236803mr187404166d6.26.1766536163061;
        Tue, 23 Dec 2025 16:29:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Md7PjYRXQHL3Id19oQhC22zfC7CmSq9X6sXaNWDe87LjPK/TEH3ewnXLSbSHp25fi9bspQ==
X-Received: by 2002:a0c:d808:0:b0:880:1be2:82d4 with SMTP id 6a1803df08f44-88d82236803mr187404016d6.26.1766536162667;
        Tue, 23 Dec 2025 16:29:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618ac6sm4507541e87.47.2025.12.23.16.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 16:29:22 -0800 (PST)
Date: Wed, 24 Dec 2025 02:29:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm845-xiaomi-polaris: Update
 firmware paths
Message-ID: <imlvmuludjdqjwmoftazi4dtulasdoypqdmotrg63luamhh5an@glsk5yyfddgf>
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
 <20251222-oneplus6-new-fw-path-v1-4-a2d366f9eb89@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-oneplus6-new-fw-path-v1-4-a2d366f9eb89@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwMiBTYWx0ZWRfXzzomFZ9QTOLT
 12vGF0EpICR85KRx84zwKL2v0LZ+aFNoDrN8AjkPpQyFZ1ToVS24n7lShbL30QfXy3793f86WgP
 CT4PcLftcqPoq4lK1zFham1Fxm9C+z7ecYU2+e+bA7qBnZfXIlKNTP9tsWKQM7+xksZrqUxlRRw
 aQOs0eihAMFIwLA3tekIdpXrB1YcziPTawnL22KhaD5STq7W6preCyXtt85rj1XCoQItEdRdgnL
 Bqx+Q1F8O35oCUp6o/WDMpYNqjWsVsTW1DKljI/A5fZ7qKp6Ki8PdU5OgD4rPkagfimT70OtaIN
 K+2FRlxIN4vMZejMtd2WvQDWWCzO9uheU8HZNN9nm6tRd9aLLt5Ug6qnX97/fMeWwbcuZt1GzH+
 rdgZL5DnB3nC5BWiffJ2Z+YHSJ/gK+MDYBnIZ/A1iA+nWUP4uU4uWHPhP0Si7kuWOSP84B9ZX7Q
 lofYn/KUcBnPnxpopLA==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b33e3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Je5-vcQqzLJVh6QI5oIA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: A1ZmpbUSgVZVfmUV6rJdTUEu58t2wcq5
X-Proofpoint-ORIG-GUID: A1ZmpbUSgVZVfmUV6rJdTUEu58t2wcq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240002

On Mon, Dec 22, 2025 at 08:05:40PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Conform to the new firmware path scheme.
> Includes cosmetic cleanups.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

