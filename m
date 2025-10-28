Return-Path: <linux-arm-msm+bounces-79287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DB0C16E43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 885C73AC6BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4632DC331;
	Tue, 28 Oct 2025 21:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oxRg1590";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsrab/L+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9870F2D0625
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761686051; cv=none; b=ZDW66l9wzF8dgWWHHsBzpGn6OeWXcnNmeE36J6g/0OLdgU6D+mLWM0z7wfmpoExFoncwam1VagppVSTJu0PeCSMvW2uBZtN2IJB3xhmm4KCjKlX5uOezIIydgsmp3D6z+CwVSBdTNqNkj9DAVikC9lnhC8SDs9y/zkFedmrY4H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761686051; c=relaxed/simple;
	bh=Hdrhvu34OFmzRVJk5JtCHMiW1j+sCWTKLvaq4pLg8S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IukesRptnc+dj8OrY12WVhAslLRO6Eg8G4mDQnOSUzTyjhw6fsdFk2zPg3FGuzzd3NkRC8CON5o6vkB2riIePmuqG19SKlkL+Ph/xOkQWCSu5W0YiFpjQbJUCFNcXaK0O9GhxKwLUwI+Q8kAfVv9hIXEK8goMcrIxWwU4i1b6S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxRg1590; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsrab/L+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlWmm2503342
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xTWwykbZ6R6D9hl0dhVafxlJ
	u6iTqU6PDg27OWKqzjw=; b=oxRg1590clFM+wxULx8FbKJMZ07H5Aj9b+yUNN9o
	fvgNE5Sqsizp8qfPQKPM/V9nCCFUoPxrl4kk6Kj+MwkcjPgiBtxTidKuVZTMUOrk
	EASvtgnaAW7JMEr1TLjnF69Tc55AW/9T98NbAlbIaDMUXTG4BKyjdy9a8KW6iX26
	boHHht+jwDCKcCJYTp7CqCdlk82r2Wfqct3fePmTL7YfUJV0IYSrJbqdPtwxeDQs
	5lHWMOUDe2epNny9z4/mR1JPY/rxvVuR+9s98jMesYdt9omEQOisggGgJodfxKhc
	cAQNnIJf0GyfcHO5z79LWuUwENb2tJ5Ub08XfT9IBhvaqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g6f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:14:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8aafb21d6so161182151cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761686048; x=1762290848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xTWwykbZ6R6D9hl0dhVafxlJu6iTqU6PDg27OWKqzjw=;
        b=bsrab/L+OQ04h25MqQc9xb9314rfAq0+I9dIzsRf0hW8+BDGtHvpHV3dCihmx/V9ok
         pzpgoF/pMlaNSARJvVGW6epkb0YPGSLF/qeuIDkHKEM2w+jxhx37S6jTchK9K9rJKkZz
         QFmU1pBtr24YLxjxkn03cvwnXHNYv3B8xmbecjLvpdMn0A4Wp0k/QM3ifBGmV3MWHDyn
         MRL4N5lER841goSm09nfSMpjIACYIaOf55g6haPa3KkHHmjkm3UHIZUf3EyfBdb7kUES
         s5d9egLv+DNKynf2HAVygzJFF5KbCBMoqCURIhZI3zUcHvEoyqFPQbt9N0BwwSGxUtBK
         QoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761686048; x=1762290848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTWwykbZ6R6D9hl0dhVafxlJu6iTqU6PDg27OWKqzjw=;
        b=ZZpFZdlTvaytZie+OkwmCsglxjhW01Sbu7qKiY9arTkBO9qHd61VpFVD+Ynqifgf1a
         1Sir+N2/ItKFzZKntDfxLFCcvnTBLsOkFxFYYafKGH1YTs+WU2D5WllAULIpa3Btvr4J
         1MhmXjFHplQRG3biyOTJwwybrwhhanUVFWTK0d5DTRYzE7VLcurTORgaS6fYKXTREhX3
         hH/2LSA8aFkYFTiSHhuV800UDWQBQsIIKNXQWLySPLZa2HugQ11XIBu9qdyHNB4TIFHs
         m+ejnO0UDnzLeJwUH0bkd06oWEh7GtgnDZ2ci16iusrGPiYHUpXhj/gZCjKU1UXfSepm
         fPAA==
X-Forwarded-Encrypted: i=1; AJvYcCXPyg+5vzW5gHzU+jZOhf7RskC7pAM8RsZ2Hsy7rWnOCCT7biWGIoB92zUv3ibEnOz1homsUYhLzLAHM3We@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbnh4oeAUEKSByrLu3J7H4bCbcqX3WnoBXAgYczNB1UpkFBNvm
	lAGyW5rdoH/lS8E1uqrndcj0lt3eqETExlKIIf5XWESbUWrKo0qWOc9k/bE1DN/FZ7HIXNmh1Mp
	NUeNwzAkVBF0XASdtm5ea0jnmiFIZIbi7QcIGR48nuYX3HAxLQTfUVU59da24GOOUhUub
X-Gm-Gg: ASbGncup5nQ9snG9FB0xSkS8G4S+0a1bxTNvghSbbj4G33zoh23iucjHejmA0+rao9k
	tOPGwHWzGP/ATYX/70PxaSGZgVQrVFcvC3ankaupgolbS06CFLChkH8ZXScMZFpWYfpH6Juu1Zv
	Kqs4aYELl9FkbBNE50hCbcukStkiBNBEJ9vaqDxcpHKBRjYOq7q+q7aML30QJUZcBCVayfbKC4I
	qDcTHIf85qLsd9l5BqL03gAguFl3fpJTYOKiE3GEMtqY3IKeNq015thgLsfxRrzgn90Mtq2FWwL
	wB+EqUtLWl9kPAJHf7+ZPuSWFsNBFI9VWmb68NPQ9ib8IYjtB3rjKGN8XX3e1k5s5+i3vTCdqZJ
	Q0OmdOW1+rwxDPYs3sLiRWKlmOJQLk7vfcOz11jJFgx7twFcmpYQghuQCfxkyybYH0m/LeuzEZG
	0bd5ViPOFn9kkP
X-Received: by 2002:ac8:6f0f:0:b0:4eb:d841:e5fa with SMTP id d75a77b69052e-4ed15c96c40mr10033551cf.55.1761686047868;
        Tue, 28 Oct 2025 14:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4jNVFQa5Ml7nGusPIXo01lvYQ4sYR0uLu/776uyIYfy89z02I3sSL0gA2ygG1inHEftMOcQ==
X-Received: by 2002:ac8:6f0f:0:b0:4eb:d841:e5fa with SMTP id d75a77b69052e-4ed15c96c40mr10033121cf.55.1761686047410;
        Tue, 28 Oct 2025 14:14:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41d1fsm3319357e87.19.2025.10.28.14.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:14:05 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:14:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 1/3] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
Message-ID: <eczsb4xsrfowfalgjaoy7azkrriitaietkjjkl2smceeasie3j@uc5ynursx3ot>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
 <20251024151521.2365845-2-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024151521.2365845-2-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=69013220 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=c0kVAxtEfwLV-oNa8WoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -tkorxzfWTUgLsVjUamQfTzqNgZrvLuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE3OSBTYWx0ZWRfX3/6jgjlJctqJ
 n3COmDZZk9qkYxCbP2ZfUj80/pVd1Wbqoq7L8m5aA5f4kRx6l71Cbndbu3loi1mWy4lFvemkJOF
 ATBwz6Pd/W7p/SKfPe/HvcHapbyRrZu2uBdZIu4yfywnUmlnKFnvoj13inSec8j0B5F368xD8Le
 g8M3K0mK7RO3EMZRvIQDd9sWScry3Lo9r0of0r1wJiTV+cyxokwqNDQZtOm6TAQXa6/QtZ7Uqbq
 Cj20pjq9R0LJrN3gfPtO4/vJ/IFVvi3C5glHyh36D1nBQfh2DxYtAohmrlLMKlgHIXdrh1kPcoH
 de8xS8UzZiHaAt7EvV8gBZ0PU0SIc4jKxK9ZuryliGSpvBQvncnnNq0n/rfSci7Eor6rIYbMZ+y
 wTaOYYw9NmrQH7i1MYzDAmXFDEWlqA==
X-Proofpoint-GUID: -tkorxzfWTUgLsVjUamQfTzqNgZrvLuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280179

On Fri, Oct 24, 2025 at 08:45:19PM +0530, Krishna Kurapati wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> SM8750 chipset contains a single DWC3 USB3 controller (rev. 200a), SS
> QMP PHY (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is
> the transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> [Konrad: Provided diff to flattened USB node]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 158 +++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
> 
> +
> +		usb_dp_qmpphy: phy@88e8000 {

You also need to update gcc clocks properties.

> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x4000>;
> +

-- 
With best wishes
Dmitry

