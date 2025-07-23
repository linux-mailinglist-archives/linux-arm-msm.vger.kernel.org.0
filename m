Return-Path: <linux-arm-msm+bounces-66272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D99B0F111
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF2A817D744
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4F92E11B0;
	Wed, 23 Jul 2025 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxK2IUO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9732C1581
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753269707; cv=none; b=uRsfcKiUnfV3Osnqa01dSFyDipaaDxktiHe3odsnATkjuIIKI4UZ2nsjv3Hi0eWF03wFydt6Shc034fzVnqSgT6Qpbc5cVy0foIUXI7pTQzBiZ+nngOxoWfJ8vbZHkQaWXaQTHNuenVjZ+QUZkJqt0y3AdH4E32SY5bJnu48kbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753269707; c=relaxed/simple;
	bh=xiHjPoZ1Ch+WHyK1NS8LeVxkzMAb19jum18ZpdtDhw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mesAt1un7QCY5HLAEoATcn46960BfvdonICVFQVG/RKnJpJE7kDlo2vbetJz+TSkfJoWwwDjN/j62W7MXw8kngY0tavG2BBMGMd9VzH0jmok/clwUXlFcXvIpkCDyOP1JL8cxATG88k9Ap4JxBE/ZxQwK2l1RBEySRDaZ3wsf9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxK2IUO+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9jbIv007921
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2+gD+y9pyiuUumkiPvbz0Pru
	9JWie49LumrPX7GQnkw=; b=ZxK2IUO+0YFoi5xXH+EbAoHuWmBBG25g0RuJ3M0R
	WUZ5xc+1rwleMgRso6KHrwlowF7twXbEEAxYFFRGHcxRs5A/4BHVluKpD6cmsMOu
	eSdECwsAdSaFLC+rWhZS2EHTIVZdZy1K1eS13LbouNx79qt97GCdw5fGUxHcjNUM
	6MDR3pEwkVpXP1280dd5AFLONIhnuWECO4C/d4moBnERpj6XHoGibU8Dyk2Q7NZP
	Ozx3sY3JGONNsw5zoUq10mIklh9tKFsBnJBTnuLfZWRcpICx8pt0XHUjFjip4CNA
	0P90ktKRo8tofabzn/SgpqilMGABCAcTKsnGsMnb38+Kqg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3htybk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:21:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6face45b58dso102910356d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753269702; x=1753874502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+gD+y9pyiuUumkiPvbz0Pru9JWie49LumrPX7GQnkw=;
        b=DYLCMM2eIc1xxmkAsaLaNSbXLdaE3vTEjMyAhJnXBajQsx+WgLh7DevISv8owgsumV
         Tlv8vb7jrIJ9L7TgirmxdqFh2BZiG/OIV4QzON0BWsTYy1cuc0uEbGdUl8gVa7LnZWl8
         LIZXk6Hd6UwAwugYuxS6a7pzSrpvWX5KhCCZHxA+rkFhSUecl/f3HoqesLaPjUGko3Ss
         MYER65BwvDzT70VisDowfPs+aehVMdKhjndTXRcd2+EBIwZybeXSTjNanE1R19x7Qs0z
         Io6s1q5nGJBjxjko/JObg6DOtRGQ7RAChPB3XMZHUqRzS27MiczpKuFlGIU1KgKHbrkd
         MwGg==
X-Forwarded-Encrypted: i=1; AJvYcCV4fEAUyNV0AYpaYg+1aiq7dCw2s160vseRYHrx847yWx/d9L4JsHmU25yyZwcf7YhFJt4FtDakcikPcM7R@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbo16PToybyitJebE93S3yIrZLB6KGQcf21kKqBxTa/fG85t+L
	AQeyw25M4utpev3gkMmND9Xw8G6xNGAotdN4Hq51WHlF4w/8LaxbtvWvavrE3gNBbl4gOFXsWUI
	8ExWM4FVFYEyUn1D2CDeiLoqScmHskMrrp/hvuXSgLmzABbgNo1Wwyz89F/Re2b3KHduW
X-Gm-Gg: ASbGncsWmTNaiUTRW0453WjmyGv7xniFWnKC2yAH4W5eb2jkIIEuWClgLzNJSTwiojS
	WE0s5Ipxc5h1OfHSP8oruHpjbAzdJRpHzJ9INOpGQ5RmDqrBo6tT52kVWgeSHKkKkALl/XoFLFo
	7dHLTfJYAA1a2KputVUb/MlAiCNfEqmDzvnao6dNQOyseGI5gLREaOIPy495ogxEGEmQ/cFd+FY
	LuLzs8oJr6yLBm7KWON91XjKUiDbdwju8RdhqDTl486MfbcgOvu8Hh3+2j4NB1pjPbtv0UDm0NV
	l5rOKQTUKC41+dQREeU195zHCXVdcBK9E3XZWLI23V4RPHpx5cGWK8ljJxaw29F0lAoaJqLeCMV
	3A6X34FskJfSSiGSI3zaQWJROxdLcpaIBTDohjx4ZHOtD7YCH5lfi
X-Received: by 2002:a05:6214:529b:b0:706:f753:6b1e with SMTP id 6a1803df08f44-7070058f7c7mr37003936d6.18.1753269702393;
        Wed, 23 Jul 2025 04:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/jRwjTFDhjdTQ6agzavI4ZAmFD7F1mUk3/N3mbcvr6gWVlMoJQxSTH/nLA14Ob6QuV9j+zw==
X-Received: by 2002:a05:6214:529b:b0:706:f753:6b1e with SMTP id 6a1803df08f44-7070058f7c7mr37003456d6.18.1753269701946;
        Wed, 23 Jul 2025 04:21:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c7d0sm2238663e87.121.2025.07.23.04.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:21:41 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:21:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable display support
Message-ID: <6wwcxwgcf4wm4ekb3d4ukkyyqsseaawo6l66umzxim4kcilynm@fc6mwj6ymnes>
References: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880c5c7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=FtQQbC5FwJ0cWtqdlLwA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NiBTYWx0ZWRfX6pAMcyoamb5O
 cQJr4UWIrRwKZ4/2CLCta1v7gZdASvEBaFhtmjQ2Wur4aU30jksJcWu0F07v7RF7flQvQBqRpxW
 WT0W0vSC5x5t6kJ+1rV4Yh6yNwAgINAlEczhQwz+ioNmfo12rJhaG6KWFVslx0oddt+q6rNjd8J
 XoinHwal4TpFmk3a8ijUvzLbTucp4bPqa7f17pcRJsfPbJ0dhOC97GcrbNfsM5wCw9rhF4cH/KI
 sUP0fzIWOjm7GtZ+YjL4gdRRKDYcHhKLs2MkLnX/yDJ+Jk37jcXi3OdAj+a30VAL0Qcjouf4XKE
 Atxvoamuu1WKdLbR1MZTJcf77HQLtQ25E/Ab2GExuz4RpI4MX9FIDHVmhAjPuSDNnKzmrkDbfbR
 ZYrrmk6wCOr2NTaaskpBJG8PGSFQP971tyVuys5G96AnFdIZuCg2DHMNTJVaJAECjDDQn+Cz
X-Proofpoint-GUID: rCi56FHTv6L_OIWZrJHdC_RvEkeDdAUM
X-Proofpoint-ORIG-GUID: rCi56FHTv6L_OIWZrJHdC_RvEkeDdAUM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=973 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230096

On Wed, Jul 23, 2025 at 02:14:55PM +0800, Yongxing Mou wrote:
> Enable DisplayPort support on all three USB-C ports of the
> hamoa-iot-evk platform.
> 
> Unlike most X1E-based boards, this platform uses FSUSB42 USB
> switches for the USB0 Type-C port, while USB1 and USB2 rely on
> Parade PS8830 retimers for Alt Mode switching.
> 
> Support for the PS8830 retimers was already included in the
> initial DTS, so this change adds support for the FSUSB42 switches.
> 
> Due to limitations in the USB/DP combo PHY driver, DisplayPort
> functionality is limited to 2 lanes instead of the maximum 4,
> consistent with other X1E-based platforms.
> 
> The platform also supports embedded DisplayPort (eDP) by default.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This change made top of initial DTS:
> https://lore.kernel.org/all/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 156 +++++++++++++++++++++++++++++
>  1 file changed, 156 insertions(+)
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			mdss_dp3_out: endpoint {

Add empty endpoint to x1e80100.dtsi, then patch it here like you do for
all other DP endpoints.

> +				data-lanes = <0 1 2 3>;
> +				link-frequencies = /bits/ 64 <1620000000 2700000000
> +							      5400000000 8100000000>;
> +
> +				remote-endpoint = <&edp_panel_in>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry

