Return-Path: <linux-arm-msm+bounces-90380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLGOB4rHc2lZygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:10:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457A7A077
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C23F302C5CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96A22620DE;
	Fri, 23 Jan 2026 19:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNGfq4qX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHsBL7IW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B3E257821
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195267; cv=none; b=Uv1PaZ7DRQMcmgHnOtR20Kv4q79EGo1Fvq+ZGTMLPrH027uKyUqcz6tJdbitbb8LjayZKFGQyCvZlyG+I6EuzZHZxEgSL9IDWcvweEF70jLxs635gsB7hT4tSpZuO4y6nkB+gaEkyKbDjcOaTuzTDXzLI3JKhKl9mSWT7rfGPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195267; c=relaxed/simple;
	bh=LBlAQsCNO9+09TmgNxwCaCBZ9pzWxQNhB++baM60OK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asJgaXLt1gq8TpG7Ed2femnbjh2uI5KTOgaREMx1yEdngY2Ey/islsgX5zPi1BnOz0uRMUTU8Ad5e7oq77sSsbKv1yFOBrxBM/4Bf3kTsaOjf4rBoJevTkR31m8jxVB2JjyUzJlA3iDpRnqa6uOZ92oPTSkS2So34yE/PSSL7uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNGfq4qX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHsBL7IW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NCXs1u3679383
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3CwsgCCOYineJDwVKbLuJ6tk
	xA7rBVSsBjBR7kQMG54=; b=VNGfq4qXvElh7WcDjMb8ezt+RbZiC1A8Uma6e6Hh
	vWUeMfArlD28w1/ySMWtR5+fCTzuqxC0QlVQrQLE5aiQxnAo4JReZUqQKd4eUUtb
	xiO5yGHAqIhBwhCNaiLu/6IIFZtgypt1wqLvlLht5Kn74yMtzFECYl7eV8+PWvqa
	4WQbyGC4kcfk/IZ3AFnn5UoejPHkwRBlOMvYQ5nOSO4SiKY5gPLmXvfbDqAu+c4T
	IcSVRTf2/MBLBLhz0hm557ZAaX6JPatRnstFWE1gyZMQ4SLVIBE8bmDTLCik/ijb
	kApt2MLgucHI0eO5tgx5udAGDnUAxSgJjEXVSKXwGWaTxg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp4t1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:07:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ecdaf59131so2078675137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769195264; x=1769800064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3CwsgCCOYineJDwVKbLuJ6tkxA7rBVSsBjBR7kQMG54=;
        b=jHsBL7IWHqUBmqK04AiloQJs26zx+HgpQU5QeGnPU6GIW/y5hJnia74ttYpW4whR41
         wHs+L369HR7deZ7mL1jSAlMLrwC1kFt4yzplFPtDI4C8Sgg3/z0qOQJuJW3Lldm4C2mM
         vuhPQfx3kIeheFsYmmXDFMi7prpjqxlcSKJ+zbVWJeJfHA4B8nRpoBgR8oE+xeInc//k
         UjVXH3QrpAVNBhkOjsMk9u1D07bBGPB8juj36Ix3Fz6nTxQPo0ckrjP8V3Z/THWxRs34
         7FHrJwsD8XuuqeXnv3k+VV8+vplX3cXsVMlb+tqsvTqkD/c88+9eswvHFh31UpiRcUU4
         MRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769195264; x=1769800064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CwsgCCOYineJDwVKbLuJ6tkxA7rBVSsBjBR7kQMG54=;
        b=WiH6+DBjNgiQlyo0yRtfAs7PqLMtfFzGI7uFaKJ9EWEhhIfc1Gj9wxE6FGL8PKADSR
         /AE4rctKzSpZ8BNuEqWoH0Twm256iCVYEuWSj8F4xc42fWNasByIoe4NvzRVxaXLhmwQ
         gHXY9w2tlncBKamgwWMsnRXgNCnZR3IC/NyynU+OCx0tUcpwD99DsDvMSZDmQzQ9HLuU
         1o93hHG3KxpVga2EIV7SU1SwaNfKzWODztOBfQFZM80MV3kqE1zsGbQxeN+gqz1diQB4
         f++u+bIA7WxoxGMfYNk84OInLVAdYx2iyTZBZla09zN4GYycvWX8mLDyHP8WhHMi673Q
         LZXw==
X-Forwarded-Encrypted: i=1; AJvYcCVwIG3KpsyuVVv779JYdbFE+MxqoYYBENnoZLLV3hOObXpSUvUIYXS22VDAiPn80fmzQASL1amBZmuaCAgs@vger.kernel.org
X-Gm-Message-State: AOJu0YwzkkM5Sea+MrQaAYdB+JWpnGHD4MuJ8ohHhS7FmFO5YBXr/vq1
	S6i+Hko1vxWAJ1Cb6csy/xvRUtQm7SWWQT9whE314E25/W6itLNJA5HZAN7J5pwzNID8O/sDsgX
	3uXY+qg1NEqV3R3vRQ1R8/8Vs01M8NEet7rxPlwVHv44/ua8xFna1dLU0zbfXLWRAm6U+
X-Gm-Gg: AZuq6aIjZTSmMdmZuROqWMAY625QLxxIX0G4JGNxt2oAn6cWuLBlGcfsc5MIzr8cgcZ
	pv8FrjvsaFkF3/OA+0YhQHnhr7JolvaSMGo5Wqw/3zWykY0xpDKpqLo5u7u92wtPDkLhsUKd3gJ
	eknenhkbP9GQXgmvdMSNQD1A6n7CUXJyi7Qy89WcZSSNRfE6O8nTMq6Hui+AwYrxCgwcCl1GjWb
	ztPftJQCBGkGCfOuEc8mF1DJovgiK0EuAWGJ4UCzYYGubHCBGc2wL+bYQyrzRxvjSR/HnPIqPWJ
	ZhZ+J+/q8kzsNUPiLT8MyG/L7PeQUdrOsRDW2QfU7hyXkfR/g8O2EPRFlwFlez4gNd/4U9jhZu1
	atSo3eEpKLKP8ORPGo030Dm9y9jLdAh39t1U/96kUTJJeFccOjt6lu8ubCRvllvWrVSj6Qwim8b
	t5vjqWNIE2GpMXjFwpwJ7ZI64=
X-Received: by 2002:a05:6102:b15:b0:5f5:2e63:f571 with SMTP id ada2fe7eead31-5f54bb49734mr1250817137.19.1769195264217;
        Fri, 23 Jan 2026 11:07:44 -0800 (PST)
X-Received: by 2002:a05:6102:b15:b0:5f5:2e63:f571 with SMTP id ada2fe7eead31-5f54bb49734mr1250802137.19.1769195263671;
        Fri, 23 Jan 2026 11:07:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de49189e2sm843186e87.61.2026.01.23.11.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:07:43 -0800 (PST)
Date: Fri, 23 Jan 2026 21:07:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Fix PCIe1 PHY ref clock voting
Message-ID: <3ivpkq4divmn6q5per2kqxhbf6ufaaa4raehphqbfn3dig3eie@fdqycl454gt6>
References: <20260123-fix_pcie1_phy_clk-v1-1-38f82ea01792@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-fix_pcie1_phy_clk-v1-1-38f82ea01792@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=6973c701 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fmVD6mvdgdatrdQPAe4A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: tRAR8Y9ioVKv-Z589bwZfpSja6oLbSkj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDE0NiBTYWx0ZWRfX+iofnTrQXtWE
 gkkVe4+IOiUJYenrIKNuuxE1AkL94BK/GfB/xOt1XEbpFUFvJBmMboyE4DIr/zEE3fFJsOq1KUV
 PyG3RbhC/qVPePUKAxHRhEQ/SDNlkJuGeHNKDmuWU5m7kn2c7wvrveyQGL0QIJhbRHWW3P16fWH
 qzobLFg/Geoq07DmgUCAi39cr8VjZaDdxZrP22A14pIHuAVtDETi8g/41CkxRGkMo8Uktig2S7V
 XvuxsiDAby1QRs/JkRHBh5krafRv5oxqgciwd9l9dGl00VbgXLOslAdHuxu3h+I+YzKflT1w661
 Kda8TXskM9h4ANPSvNv7hWgPNDnRBGhkNiC4Q9ADr+owLKk07TUHHknhAC6X1NHHvvBR8irdk4E
 bO/rGRDfmO4w2bK3ADtVdz1GQsQAbS+F+Ep4/NpNK8xUW4ir78NtyaZmYPUHakL8ObHDrlW6+fu
 TnNvNqv/r4xTAwt+9cQ==
X-Proofpoint-GUID: tRAR8Y9ioVKv-Z589bwZfpSja6oLbSkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90380-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5457A7A077
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 05:42:27PM +0530, Krishna Chaitanya Chundru wrote:
> GCC_PCIE_CLKREF_EN controls a repeater that provides the reference clock
> only to the PCIe0 PHY. PCIe1 PHY receives its refclk directly from the CXO
> source.
> 
> If the PCIe1 driver in HLOS votes for or against GCC_PCIE_CLKREF_EN, it
> will inadvertently modify the refclk to PCIe0 as well. Since PCIe0 is
> managed by WPSS while PCIe1 is managed in HLOS, there is no mechanism to
> coordinate these votes. As a result, HLOS may disable this repeater
> during suspend and cut off the PCIe0 PHY refclk while PCIe0 is still
> active.

Thanks for the explanation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Replace the unused GCC_PCIE_CLKREF_EN clock entry with RPMH_CXO_CLK to
> reflect the actual hardware wiring and prevent unintended changes to
> PCIe0 clocking.
> 
> Fixes: 92e0ee9f83b3 ("arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

