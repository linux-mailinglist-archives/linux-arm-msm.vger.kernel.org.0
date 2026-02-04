Return-Path: <linux-arm-msm+bounces-91851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE7YDybWg2kHuwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 00:28:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FEBED445
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 00:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4805E3024161
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 23:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2095639B4A9;
	Wed,  4 Feb 2026 23:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5Y1A76i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QxQSzbQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36939E199
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 23:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770247405; cv=none; b=WAoJddL5yfkOhyKGiVp0ssWXG4U7R/9LKk1AIxVVqmNcfkdSYwSXcDOH+KRMAAf/c0/M6ReXYT/bhiiJNkKRkJ1Cr5bFOLrA4Il4noAV0ouzY0FW+YdLQi0VMC9/edJie3sTNKawuMqnpHomBlTmPFay4V8kI5lrI5NdWNVQunU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770247405; c=relaxed/simple;
	bh=vFafNjXxA3QHAp3IHCM4QRJ0CkoJCZu/NyaGiGZsQH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBWN1R34xlrPFuL5/S8D1d71OBBk3rxuP7U84/3N9DON8tNzXuo33vyjXN4cb30aaIoW3w9xB0O8d2ca9+VqbuOudYaF/ccVDVhmIfuB3hYDkee1vilZfu3Mex68XUQhoGNO0biK7OTX0EFjqnzxj7BLP4fgDeClA8UytWh7CBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5Y1A76i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QxQSzbQ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614MDuUQ2188121
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 23:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F0VqtUTNkw/MR4kxiNcfyxI5
	XFsKlMvndVSuiRgonqM=; b=k5Y1A76ieZ2744uabJvm5K5U3PHzUzBA+UdJgv6f
	d4hNsHGNFAcco0y4wFy1OjATkcwzYEFLEGO/Y93OeOmIExw8J43rO28Bpu/UW8wW
	kCVGHfF2sMZz4zZEVG1sZEqei6luc3yZ63aEpjT2v6Lxr0XiMt2I27GOsaV++po9
	Z0gqDrj2frQwNg0ljEOlagj8jb6JAQyEJ7Z90PqO3mRp8hxmb3hEqKssvP85eSIz
	ACclTnEZDnOEnF91pYiZIriDp7rrlnNsv+RNJYoYsYKss3b5O3xBXOLzgnhBTNk0
	u9ekhbfX/xivy1GcjRi6Vta+u2Y1tilK2+9Rg0S9leu/NQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c445wjaf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 23:23:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52d3be24cso38547085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 15:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770247403; x=1770852203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F0VqtUTNkw/MR4kxiNcfyxI5XFsKlMvndVSuiRgonqM=;
        b=QxQSzbQ6REgIxt60ohy58P9vXP0P6Ji7GqUPyki6/Rb5PyLZwr8oSJkyKIEGcc8x/p
         9FPasCOTr9i862RcnqhsUXUF/axOctOHYKF2mR6D0c5PzMBnn7z/PURt91DVeur7v5bC
         SegUBx5TwlwO4QTlX35EXXuzgUGrNKk4FxMqgDILRYtZSk8Ntw3L/sP3j6NtdcFbjS7Y
         pkcxwqAuE/oisNfl+IOiEKQzreuhvfJ0Snwlw45/Q4V0keJq7FafWrUVfGbAMNoKOggW
         n6gYq8RReyAcyW8KcihvAkFbaiQyLez6wdvwB6ss7inFa6qbn+wXXivJ0K4YIApuvW2S
         nxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770247403; x=1770852203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0VqtUTNkw/MR4kxiNcfyxI5XFsKlMvndVSuiRgonqM=;
        b=vCfBmySytUJm62nDC/V2m7URs/e0W9TEDzB2Tq8MK60a4hdR/JE5o6EGx2qdbGVrkV
         ePfMarsSvpUgStndDF0JRQ/aFQ7FSLDkq+AvCVuvbQjFOst8M7XqUqj0dhrGcvwiZigJ
         imuE6rLgtK91NZp7j8gxtGWDY2d1NvOjPiiz9k6Anc29WuRpK0uqo/IcOn/x6ZPFQAQk
         aztJPohXOPXIKJL0EZUg9S0ozcxXEnIX9lRupwW600JQ0CyPUwUNx4RfOMHa4cqdCBJ3
         eIrT8ONJiiLeUMzXruDPtMeV5FDjYW63HbVpzP1xtyp0sgYFCKdkRQpe+QALAneoqkBk
         nryA==
X-Forwarded-Encrypted: i=1; AJvYcCU05WegTs5GSbIj2be2AqyQPGlW4M57gEiWgwgJ/rEmjgWppyr4Ox8TmnNq5xFdsmZHs/yvzeh8ofXsjBzv@vger.kernel.org
X-Gm-Message-State: AOJu0YxNADmyrLFHbaIdQbJHjfS0RViT1nP7zreiXIweKld4UnHwzzFm
	/a1l5PNtjtqzlc9ltEVYMV0rgKXDrbldOZIeqrpBzglwJDtvMKOu6zmQZoZqUyOdUV7StdBc45w
	S2tg/0Jh7e45WrJA/pI9pMnhCH2ilGZF8ynOcSH/zwfTJCUyHLt7/ppI9ZsRjIT9uOsCT
X-Gm-Gg: AZuq6aIBame+cMeC/dj48UODYebZvrr6Whg4zgZY9Zw+X9/lz/S0Yz6o8VUCkxO+xy7
	FiNdhEFxBHsuxwOa/LaOJgjNZOU2xEsQ/ykiW5zitIQRjcNruaY59EY8dbrxQC33rc7PO+jSILg
	KCQDS97PqqnHExiJfxOTPqBhg0apbjYJ4pmJEwrq5sEOXAinP35KI5i8RRer3djWq/ye0V+RzD1
	BQN5NBh/3bkMPLSP5u/p4Z4Y7QuoXUqAehOy3z7IB9Rz3JEB52jtQf/nyOd8V4QyZsf0X0TLSA/
	V3NQESgdnvqGe6nTKUmFUIjQUpUKzME+jO5FulIVj5JaUsYeKU543G3AlB5UZ9W4+IeH6ZyeJHd
	4RkIUdpR6naaloSmMR/UGi3vqUjqT1382LTbU2p8Y/op5BztoTw6Qs9uQ8krkf3elpxffzi0UPB
	SUQBnM/4cxnJYvxuuM/joOVJQ=
X-Received: by 2002:a05:620a:3953:b0:8c5:3202:8bb1 with SMTP id af79cd13be357-8ca2f82e2e5mr584373385a.13.1770247403012;
        Wed, 04 Feb 2026 15:23:23 -0800 (PST)
X-Received: by 2002:a05:620a:3953:b0:8c5:3202:8bb1 with SMTP id af79cd13be357-8ca2f82e2e5mr584370885a.13.1770247402406;
        Wed, 04 Feb 2026 15:23:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38692040049sm7450971fa.26.2026.02.04.15.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 15:23:19 -0800 (PST)
Date: Thu, 5 Feb 2026 01:23:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, linusw@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco: add dt entry for lpass lpi
 pinctrl
Message-ID: <32hbjz36hdun5gsuoq4ywpjxl27z2rn5d6puontgb2doie4l2t@l7imzn4vyd4w>
References: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260204174237.2906-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204174237.2906-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDE3OCBTYWx0ZWRfX6hMKZBYMtvaJ
 wFJjD7vmdvQgLOJYu4UEXqvKtgRi0YP5YHcc3OypTsjaxSvub7c8mypkYsHoB0BDN2d1w+lQWrE
 7D80yJq6i5coGvL0M/36X8Hub87f/ixduaVb28ljtSzX85zUoNjKuX3dvlcMOWV5Ak4g5eUyE4y
 t8WCTziVv1SuAErb2RdBGa4SIt/+bsNsjoJOEWPi6cbZfN2+DAcDkMs+UvjkfqbJsZ6XSRqqKD/
 c3ufhWVX7k1NH7TmzxJMgm+gmmFVdgXm7t6lkm+D4PEC9BQ8QpLlgbAIP1uHov29Jw4y97s6+0c
 BzTyzYxK1nCgE4kF6GoxBtbQ6AGTjTz5GgYOCH2QgEZROp0PPcjfu4ncw8hA3KMDtZnPvr52iOq
 HlGxlv831QUBPYyYx5OehQM8OFNvbyqA0KLINeindrId3vj5e3XNKL60o6S+ScDCTM9javyxKDC
 4eB+acLLHT4RviS7eOg==
X-Proofpoint-ORIG-GUID: buqv8DHn38hd_rPTIe0fT8tl-Vp1LF_f
X-Authority-Analysis: v=2.4 cv=GvhPO01C c=1 sm=1 tr=0 ts=6983d4eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NEtT6DXtd9CgoZuvRooA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: buqv8DHn38hd_rPTIe0fT8tl-Vp1LF_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_08,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91851-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,0.52.125.128:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65FEBED445
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 12:42:37PM -0500, Srinivas Kandagatla wrote:
> Add LPASS LPI pinctrl node used for setting MI2S and soundwire pin
> configs.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 5d2df4305d1c..e1ea94d2f0f3 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  / {
> @@ -2866,6 +2867,21 @@ q6prmcc: clock-controller {
>  			};
>  		};
>  
> +		lpass_tlmm: pinctrl@3440000 {
> +			compatible = "qcom,qcs8300-lpass-lpi-pinctrl",
> +					"qcom,sm8450-lpass-lpi-pinctrl";

Please align on the quote mark.

> +			reg = <0x0 0x03440000 0x0 0x20000>,
> +			      <0x0 0x034D0000 0x0 0x10000>;
> +

-- 
With best wishes
Dmitry

