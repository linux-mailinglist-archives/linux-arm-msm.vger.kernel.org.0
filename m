Return-Path: <linux-arm-msm+bounces-112469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7tnoJfZlKWrfWAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:26:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E53EC669B29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:26:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W2wsDPig;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NC6cTvlC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112469-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112469-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 738A633052CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB0340682C;
	Wed, 10 Jun 2026 13:20:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBCB3FE671
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:20:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097632; cv=none; b=iRMu9uN1dRAzPbS1BhcXNXwzcyCqXZYo0xlvXhU1qMkkDk1u5fW3eW9jOndn9MHqWxrjRrLVRpzaH09+4bsGV7vZ1amdY4P6F7/+/Rg3Wg6B2beIwOhroX4SmWDKdjqapZw75+NsAGXa+x6fKZDFAXUMvE92ir3lX/ncUiCWaZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097632; c=relaxed/simple;
	bh=fD3dOrtZgpHMYtflX9pD7VK/mi22+LsFBAAJVHHd4M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvlY14iwD5LAyAXeQ/M7L/jY1XEDzNn3PXUTF8/F4BILnv+Nz2npiLzTkfZQ8urNPldN9ubnLBajIDqnOToxRmQYUTHK/qm9YEXEtHE7G5VP+pkYEgdCD0aSxPw0cgV1Fs27+An0Onde141HgjOrjOge3sQFDUVvAZYYwttNYD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2wsDPig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NC6cTvlC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBdMN1137371
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+ILUUeSN9I7rJQjjJXG9lLz
	Il41Tpno6VEpIZWt+nA=; b=W2wsDPigsNbT6UesO9rCDgz0yG6GbY75tZnSU4+d
	sDhFjUGv0pM7sf70salXeeFctT7bxvQtalSCnGKny/Uwq3pffyByBkJYcXOuc3qr
	eKb9ULZHixiO8MzmueVgUofdq0msLz+rXl/IIC7VZlA1ljTaNPdFg8wQ3rZ9DEiM
	MuxeOZe9KDPPTL4BaYYIRyQACXJHmZSNtltSPC60oTeB1gyZbcBtGzOwhrcXi+m/
	i5ffxvXugGUyri9djfUGejRkRyRN6sjE/TrH3+T8ED3v4HtoeKfNhNipGP8LXbpO
	xa4S/aF7ouVr+uzcqpfUpmaTiNTb0osDB5nIxB75jPEU5g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2n9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:20:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-71b5daaf011so544212137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097628; x=1781702428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+ILUUeSN9I7rJQjjJXG9lLzIl41Tpno6VEpIZWt+nA=;
        b=NC6cTvlCDqMolKVGzOshGvxyDUXaWIdUdialhE8B2hyAXZ66543m+icYjGnomPVkLB
         +94MAxEotLgHOm+EAKd44u0bpV7xgQvCre3Em3PGWjCmmmTiqd1azpjpvxYA5xGT8LP/
         qO88TygYG2wrUvxQfEW+Vx952qgUAbbcOyhKT+FMKG0fa646N63+5I+UT8D276otD+5Q
         n//z5lGgVtgjMxYy1c3Y6nEVMRzvsj7hhzpPKBT9mZ14081CyFNLRgbbpNUTphrabfw7
         /BgH0oVFqukfvY3h5NqYrMHwUm22qUAXDo0IussiNKtYhKrjdVFPbL7WN4MQQdsPPvFN
         RwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097628; x=1781702428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+ILUUeSN9I7rJQjjJXG9lLzIl41Tpno6VEpIZWt+nA=;
        b=jLyndcChRh+OV2ybGzCEJ2dHlgsVWQfmpu0Se5Mn9prrilHwdYHD4cH85otCyp4x7R
         1Fjl0MWMmxcUMkWn/InPmiEiHpEVqs89scNbWwEZAPxl/3EAzC5w81CcVysyP8C/rCWR
         AJMLx7FmLVKHIMBoYK3HGXtW+WynDkhOxmHILeQbln3MI8My8Z5GZF6u52hbWTiE6hOM
         i3r6XLBAJpvuZ1ns51TdQFz3ZLFFZXt55EzDil9AqfrMZwYlADfZvnRn+nsUxqWI8I/n
         mVBRMyRFrTXeLIVaCK4x/vt4n2FSXZb39mzWKhDyLK+IEmwtMPKP0951vHukKjQx4ece
         ikfw==
X-Forwarded-Encrypted: i=1; AFNElJ9t759Uv/vGY3PoEjUkf2pXv00AjOlFBfysupr5gQtadjjkwcDJY2E0GqSnb/OZ6KbdCoVbL7uoaq9fZrEX@vger.kernel.org
X-Gm-Message-State: AOJu0YwRhe1CFhGxrcNFrcUpHxffSIET29CJRRi6McpiUCp8TZVKWhap
	9I1OqxVQ4YD4IpYqHNT0P1HbYtC/+PmyPz6MWl6O0+xBU3k0QjZHhO/H0Nf8FzoFRzDQ5l2Vhlz
	Ib+yehVK414ppHwfSWQsP/6CjjbNQpw9udYS3dQtjALwEVvX4lwYDfFJ6QBpt8iAAoXte
X-Gm-Gg: Acq92OHVchvZLko/YQZ5MNwcmzWw1NnIQ22UlZH2NeGMoVvUrsG1Jua74niM1mrHUm6
	De6gYcDWT0ViHxVRitoi0moHc4L4XbxEDelwi9x0lJpPzhN6KkwmHjBdUDny2gBkQ55yLoJ79x6
	5z65jKWr/ZnfzejaQLlMZ4msomxfHH/0P3S3jl42we9fyhndu0NUT94ijMOq6rTvxIZq695YK2x
	aEClZYwK3vOqbbReQeVPZCsfgH5rdpxCKCQ2OYgAwQS0eebIXecSi/vigP2PSSzOnmSRtVYld7I
	eXpzpi569u733vZNK+mFQyQHvO6+nN2UdrrsEsCnwreqinW7vKQXhE6wE1quFtnH1R7+aslmifJ
	OY0uibQTk+PRHxcLGcmfzfBtw2GGmAOQNinZf4anAVRj/3fxEFyLC5P3nCEvn44UcH+Tk02vZC3
	ZufXGdmsNgIwX4QcS+scu+buZ/swLDsBn+cOtpaM0CjI293w==
X-Received: by 2002:a05:6102:5044:b0:6ef:f691:7044 with SMTP id ada2fe7eead31-71928c9b108mr4398291137.1.1781097628045;
        Wed, 10 Jun 2026 06:20:28 -0700 (PDT)
X-Received: by 2002:a05:6102:5044:b0:6ef:f691:7044 with SMTP id ada2fe7eead31-71928c9b108mr4398247137.1.1781097627623;
        Wed, 10 Jun 2026 06:20:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be2absm61723611fa.23.2026.06.10.06.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:20:26 -0700 (PDT)
Date: Wed, 10 Jun 2026 16:20:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
Message-ID: <iykbillfumrcbi36opmu5i2fbcot7lz3settfnw5i7sqdgzmr4@evagz7qqnjpm>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNyBTYWx0ZWRfX/DSFRo3ibP+c
 RF/+Dgw30WMto0KhOw5p01DXc7roSbYGVY9yRxIwtOqVeRNt8AF7ToaVDJ3zIONln/3VE6i6Na8
 3CwcUaFrGTULm5nVZJJzmGNiHvFkC+FopqYySAC2gQmMik7T+jpnL0mrX7GINkeODC6ZI3oxY2J
 hasWTWV4V6SdikNoKGHAuf1wI75Mi98WEQOAKDk7mPdqo5gtvFjpjpeSBMe1DvNIAZO2Zck/8OE
 GmD5cnO7LXxqViDtRzEAof0otqRTmt36nbVV5lTPvD3ExPTX2aJmLc+5DasCzbhEi2bz3d59uak
 bJ3rTEo7XlZZFC4cPlp4QRcn3u4BAaY88K1wyT/HCUoLVoSF2MQJwyIuYRNfAB2sKlOyhThYb2u
 +ubWIKvK3FihfFh4WEQkKPYf45MTjQXDYfzhfmumEZ87k/otmbhlAcXn2KwhwWBcK0iX3vyz70u
 tGt7b9E5BFpQUJPyD/w==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a29649d cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Oh2cFVv5AAAA:8
 a=EUspDBNiAAAA:8 a=SC11PsEEbJH5d9KfBicA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: JYJSQzyLEvVTqp981aMekzIX8TLPqJUs
X-Proofpoint-GUID: JYJSQzyLEvVTqp981aMekzIX8TLPqJUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100127
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112469-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,evagz7qqnjpm:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,googlesource.com:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E53EC669B29

On Wed, Jun 10, 2026 at 02:04:15PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I don't know where the existing one came from, but it's apparently
> wrong, according to both docs and a downstream DT [1]. Fix it up.
> 
> The updated values also happen to match SM6125, which will allow us
> to fix that platform too.
> 
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#145
> Fixes: 7756f1d6369e ("phy: qcom-qusb2: Add configuration for SM4250 and SM6115")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

