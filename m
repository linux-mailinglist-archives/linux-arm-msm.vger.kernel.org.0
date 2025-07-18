Return-Path: <linux-arm-msm+bounces-65719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60408B0AC6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 01:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C745F1C40405
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 23:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E338225A35;
	Fri, 18 Jul 2025 23:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGdaFKpp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF631E8322
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 23:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752879685; cv=none; b=m+g0pgoVl+8NXOp/AtG1vLRJW+a6XWPj12ZbPxvAUyeeo/Hsm8S6yUd0YnRGcEuwjiYbqLIWvEIfQrl4l1mTB6YpQO2OE3dcnkt6wPlB2zHE8N+dRmCxlh8XXXtEACSqQcJ00lEpeD3HSdT98xhtBDLxUdaxWs14TJyNsi3GFqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752879685; c=relaxed/simple;
	bh=o1MhyC7RjS7VgJz0VSkaMv32v+76Isf0N7bHiSxUwrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6CH+HHpQqbt9WaKDKPUYzG9YxVNzAuBabgEjGA8H69F/XkrcKNWHUBstMBNMvuokM5eJvdCMu4MaVayy3+S22QzRoErKT9/u7cSgM8MXwrpcKNIIP8U35FqKrca6Af2arfwrbjelQWMqD1oEjlxkSjLVCaJ//BNFm4Z74LwY/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGdaFKpp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IHZteL007255
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 23:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xounN+Z0k90J1xcOu2qxIF/k
	zUJ4PTRWo/eJEBF8yyQ=; b=eGdaFKppVPxyOPbPOHp7874GCxQPuoj9aGXk3d0V
	sBFpfLndDHmxSy1sxEG7kivH33ulxXSlVwAFKn+PZOTf3Qsrtg9vbw+HhDl7EgEc
	7svHTr751m/gr/crMpD3FA8zIMLgCuiJMkHe7KIsWhx1Hk3eLcSj6UnlMMjbmidV
	mSyCHQcBpAbTXkLPMYmNS1GnxmPAC/VFl6VQ7+kBx6tAUu23un6d0Uq3U+i5QJFE
	08GHkE5mC8pOxEhE+fnGs88rDhr7sdBqfN4VJiNjKaFIe/AhBYf26OgWOC4Z3TkB
	WNv7RNBzuAq64HbFODJiht5RrU0OLsa1nMRYb7xRWLWraQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcaeac4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 23:01:22 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-87ecabfe1aeso455547241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752879681; x=1753484481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xounN+Z0k90J1xcOu2qxIF/kzUJ4PTRWo/eJEBF8yyQ=;
        b=ksi0FqS1/IBE3skkk4HqDFyRQ2+OnJM/I3d+/B0gCQu9mjz5tOCcexzymDx2Zx+K/9
         JkP6ywkZZQfWYkFoupaHPDATPs+UplWtjDnCTrvde5kNzrb2YbPRQXTkwmnaPP8TItH8
         llKrkwOjx0Q3q/pc5k46T3p4mvkY5u7zoKcQoSvWtLJWX3riz9kr1fCOmia9cJHHsSpF
         PjlOvRjiIf95IQ9qiZ9S3kALKq6txEr1Bac1atvA/HQDzHk/h5ltacQsDaMjNho8HkI/
         dzqKLzxEPKxofGplIgtMbVYhs8IOdPUh3QGWRlvhI6pNkhfQmBg/p/iYgh5l1f/501wg
         yKHw==
X-Forwarded-Encrypted: i=1; AJvYcCXH/dkaM0UMdGi4Wo6yy6t8kQtyH785pY0yQVaKMR9MEDuKk2mJP857l43vFt/0xg0SqOuZxkUDbdXKO+mo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz51pnARn/OXMLdRCd74bjWg7PO7rVxTN1jSiR2mZsmycJ+tiMd
	eKLy/OMtTm5pitiYXefEbhB64cSlhSIAl5FPyDI25I2vPyHSeEPo9qaKwR8kRfzxshyD3Rf0fU3
	IHsyQSrlLGFPQ7Y5Q0C75mv8AKK96A7zo5krhXySOSRsSednTVGQ6LEn8dT0vD8OfGwg8
X-Gm-Gg: ASbGncvci6++w+NOvEgo1FDpM6tdRfLZoatkt9v1ebMM8QD7sORcyXVAD+J9JXhWvVg
	wNfPWMYsaOo8IwQZQDPMprqYWhS0oFJE6uQP9A4Udg/L2g3omLOma9OArYouizp5hbZX8+J2KD8
	YglVmeGAk6VW4IinX4dke+ynWov7sCieMilQvtl/sz9JQAMISOLFxhW1xyTbaWMJd64E0lGrRBf
	KNjWekgjXzXkrra6aPXRXqZQaCQvWkne6rzRKDaWyuloUdjJz98dkm1RLmfO2T8bxT3kgCCOev0
	R44omrj5Gy9myxNMYB6OL9DwsjMnYAvIf6kO7Iuycwc1qfgOgjAaeSFOofTLXHdmQye5j4NuNWF
	YTkS0v2+w+CWTCHIRVTNDOXT8eUp1Xf0pKj5gBykB4tpWec4ENvkx
X-Received: by 2002:a05:6102:149f:b0:4eb:e04c:f5ed with SMTP id ada2fe7eead31-4f955a7a6bdmr6898891137.2.1752879681330;
        Fri, 18 Jul 2025 16:01:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgHNVAt2FNfbpkxkswFgS8/fnxZDo97stUFORKL3rP3beeFKI+AoJdG8668ZH5nxa680wOPg==
X-Received: by 2002:a05:6102:149f:b0:4eb:e04c:f5ed with SMTP id ada2fe7eead31-4f955a7a6bdmr6898826137.2.1752879680955;
        Fri, 18 Jul 2025 16:01:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f0b15sm3730461fa.93.2025.07.18.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 16:01:20 -0700 (PDT)
Date: Sat, 19 Jul 2025 02:01:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sc8180x: Add video clock
 controller node
Message-ID: <f2grec2qahffqgeiirr4i55uv4i344bnj7qocapsjodev7rbdq@dptsliaosgjo>
References: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
 <20250710-sc8180x-videocc-dt-v4-2-07a9d9d5e0e6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-sc8180x-videocc-dt-v4-2-07a9d9d5e0e6@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE5MCBTYWx0ZWRfX9tFxZLnfu1QG
 UqpX33ouHgpMX7uDALKq1W1usYbfG+3CyhLJb+0GJ7DSPHTijJiCtDflYPAlFWKsnLLTWh6Hkb1
 kXxIrOe/U95WDTQxK7ZqLHwLTNAy7sGxpltkRmtsuWGdcCFF2T8CQtCfWSU5Oba4RRKsdZCGQu1
 mHRxAqxDdqQdH+kSGDXl+SXWI11NoTs+2fyJizEYHskae22b1lpU0/IUuzgro7nT6ZCdaJ6P90A
 E9jmIsw42Za+e8tGEEzPgYo9nPEkpCudCAlq7/DHlS3DPzD8iD7aYrPtZfgUgNxgZroDByojbq+
 6Oe5c4GsOhCNTHYCI+8wHoVU93rF+CHTEuaww1/+PcRl/LvXDittoxAgbTM0IUUS5M7zkdPnoTc
 m4MQLqEeNheKMKHLj1ZQq/6yvYABxNdubtrhRPFstuPKUleD38q0SPfkQst0MEUYuHJ7uHlN
X-Proofpoint-GUID: BqgVpH0AR5tKBgnZaNnUQvPD-vZjur4n
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687ad242 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=gRvX9a0DaF5FQXGff3AA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BqgVpH0AR5tKBgnZaNnUQvPD-vZjur4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=887 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180190

On Thu, Jul 10, 2025 at 06:30:40PM +0530, Satya Priya Kakitapalli wrote:
> Add device node for video clock controller on Qualcomm
> sc8180x platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

