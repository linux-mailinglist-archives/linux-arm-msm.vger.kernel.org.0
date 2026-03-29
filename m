Return-Path: <linux-arm-msm+bounces-100635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ9eLa1qyWnqxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:08:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF503538DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3FE5301BA57
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5578386578;
	Sun, 29 Mar 2026 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d37PnIhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gI88UDmw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C137BE64
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 18:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807672; cv=none; b=SVcjptKpEB4FIc0ka2b7X4tCjed+dIuTSB3M3RQU++F1PAj/pde8gVIgwcyHLpJ1biiIHGQoMv+Khy0lofEg1zRNogQKc5vJbmhdrPRGUjSDN0SVxjGcA1f/LgnDe0TxJBveAj8sMr90tqorulQ4oMaTft5+SFl/9SekGIzC2fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807672; c=relaxed/simple;
	bh=vUowB7nDStoKSADM/vzpyqzwMh4olIo9XS20qyLDbT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnhppAwUqSuwr2nkAXMJhEWHY0+rbs4pYVQAs8eOOLXQCDBhOSfjAIFlShO2vlW2Tck2VzJEn7ArBGd1lBP8J98T4xPWtc7eTfWqrOUmKYMlBSlw1+UBQlwoliEUk1uimfckKxZ7alYwFJgUSTBIHtxgwnOy7j/cTRzwIa5t64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d37PnIhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gI88UDmw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhYsV3864100
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 18:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YYl0wwaAziKR5O9zBqq1rjYn
	ijj6Hj+e36Geyq5FXZQ=; b=d37PnIhcE3QpLKIyhmgkimQ8DHespxGbgx6SkM44
	9H85TbHWOTnW0xsANb+ZgSNSGfKpY+92WzfazYeC1sO8qL84QpnnH6QqH3onVKJ/
	8GHfQ1m563t+W93IdncEbDgahJcIZZRxJ2Mbiht5jo/YAMN3ix9eJurluhAZaX9M
	EIMEQVDJy26c92VSdj2qy4ReLL5fiKDBo0w0SKAxkS1zdo8XaycGOukD5+FpiXzO
	cUsypOhNl9JKbi0EMdDDrz3zTQMX8RZzX0+Ue4SmTcfAzB0NPs1TTtJpvxL26zi/
	6IKeWm0yQJnIsP0YJrUmO/5iAAYJ595WNBFZnETtIIvzHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm3ppr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 18:07:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b31cff27fso35881151cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 11:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774807670; x=1775412470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YYl0wwaAziKR5O9zBqq1rjYnijj6Hj+e36Geyq5FXZQ=;
        b=gI88UDmwEnh66sCs2QRoxgE3dAKKkzKpR3gzjOZniRiH0Yz7qUlrUBsR7ynFK6UzO1
         awGWO+0oRYoRtSCtJVzy6MtMbnkjx4DjYCT+ddWC+397pZ5m6boNYaYApjgxEJrUtdXY
         uHN3AChzou6TH9TFGgn3yzJEqLvAWFPN6CbQVkMniSXpaDeyS0ydfQJVyfCSoagr29EN
         4qCQcbOmMbMbTXGXKX0PAHN38lj0d4hoRJJ14KKnUnVUV6BYl5vvJxF2+Ot2mOqbBItD
         kQQmdoXy2kDVN7+TqUz3hU9FW3TkSThDTZbJgBd4Jz2Jvd2WAJRH4n/K2YMCP/Aar8tA
         yFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774807670; x=1775412470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYl0wwaAziKR5O9zBqq1rjYnijj6Hj+e36Geyq5FXZQ=;
        b=EHPs2MJ3DYh8VVP2u/B87uLtiXEeIEdIDze+KZz3UsQ6l8I2xV6QIc7YvLaZIEwqYc
         5Vx3XXNkPX7P0VRLGG0HX22WgZZ52WC6RZpX9TV+NYgZpqdnbn8dAzZf7bY1JtvvyNYg
         N8Jn6sf4aYNXCYQTlVBKrtyPAwgMZSC+N2e2FhCW81CeVvQvF0Nu+xZ4/ZzZ44TFgbH6
         pVD5D4vKe9nIQLUS6FsDPhyiPjtxi7r7Hkwm7VwnyL6LCf1IDSLnkxRjl0m6uYhsSr8m
         mo4WkLZ0Oh7j6vrwvSkyLwowoCZMBD+y/sE8FS/HJ3wnvJMXPCkNSkKBbf4lfXdCI6Hs
         fiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW1uh+oG3S01ktHBNGzCZOamaICCFo6BUuJui+iE6A4j1aTXwHPFhEDxdG5cjL3DYK9xPSZZ8bcOOwvSmU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rupMs1YRYsiVGTa+1ZYhP3MJC4/oWHYKCzu3A+MTvEL30UAL
	Y7Lim7rvAMQkl89i0Fw/24UwQxW4aiqDudGAvVHPZ/rtdxpicnKuzoTpV+EAKYSx6lc/funxSlq
	ULvuOGrJKXfVUKitf5EOhACfBIuazLbVm6t4OZGEYBQFy4poXSgd0/E6h9AA3I2DZpKfX5lMLW+
	Pi
X-Gm-Gg: ATEYQzwwLSVIDb3Pq7BXur22OReH2qixkqNH56SJVfQQbTKhwMdR0Y+8uhVkVCplNuq
	04aODa7WxEN0KTAxqlj7G0aJcY370dbdmNLKYzCiQkCrx3pN5ghdTIbHy0vwIADTVdGlc+GbW7/
	6IOs/X7AMiOg3SzLRrZUdkrbnUdybdyiZ9bJ8Vm64y4L+WZX7h7KTRU75kx7mw5C3ofron1mZLS
	7N0G2HVQ0ELWP8IDMkKcMyI4pbtmIq0ra2zSPAGFpkgoJOglYOkdOSHRUgr7vMkxan3KC+kmoXn
	HS5qE/FK8OUFCKyE3ijo7+TYgXWLJW2W1thWER0wDvFKbqaPUbCEi5Pc1t695aBwv95/RjQhjbK
	ueF9D1f6bHvGtqbDrw2YgKhri6NoZfDFgFvwzKli6CmbH6yDWuH8F3TqOPsfFIa1SJd8SjXspLn
	K/g+h8OhZkS3xJCDyUfR7hzbnI0Z2qRF9rMt8=
X-Received: by 2002:ac8:7fcc:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50ba38095c1mr130949601cf.8.1774807669627;
        Sun, 29 Mar 2026 11:07:49 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50ba38095c1mr130949301cf.8.1774807669118;
        Sun, 29 Mar 2026 11:07:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd743sm1157062e87.21.2026.03.29.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:07:46 -0700 (PDT)
Date: Sun, 29 Mar 2026 21:07:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
Message-ID: <qycxxxlt3koyt7snnwpkmpo2udskhad3l5vjpj3mpdi5qyoriy@akxv27lrpi3n>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tvCO0HVg_Mvsj4jQYHz6PEa2Zgoer5sP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MiBTYWx0ZWRfX100uME77w7Gz
 YCzbIOqrXHFrrwUy5daALV1nQ5pkModWcMjlKyduRwykcKMwNgxQrUp2d7Jg7IoDmoWoU2yX2Pv
 4LctNx+3xkMurRvtrEpzA8gTOg1znzHVbWLViNXwC1m75qcGGn/s7gaRjhqweVgVQbsY8CYJ+m8
 KmDq32Or/Ql9TOLCEpFPSJpE3NxO2KfGEv3bWyxNuekqG/QAsa1Z7YzUof2OzyUdDda7oj2pEBu
 AHPTEPlQt45UK4/Kc7Q0bk0MFW1pMXzaVfmp6doNXUG49gWF0+Kh23UiVnthR1ulyL9C4/wPD1c
 1MHR0AZehX2QFuddPOnjJpZytJaSfNWEymAheHcPjA3aFASMgtkvxVsN/pw4Yq41YAlPtUDJYtv
 oflweAiAH41JT7zCE9xTcZCCuGks1pDvaVlWUTKLV7bUJBgHuEa6pdDFkf7VuUdzKK+ITTM8Tx/
 VmwR4TBt39cY6PJkKPw==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69c96a76 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2SPG-oWb6AOt4c0v4PsA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tvCO0HVg_Mvsj4jQYHz6PEa2Zgoer5sP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290142
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100635-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4BF503538DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 11:22:49PM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali QRD variant. Enable USB controller in
> device mode till glink node is added.

Why can't it be added as a part of this patchset?

> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> index 6a7eb7f4050a..1929ea273a4f 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
> @@ -80,6 +80,11 @@ key-volume-up {
>  			wakeup-source;
>  		};
>  	};
> +
> +	pmih0108_e1_eusb2_repeater {
> +		vdd18-supply = <&vreg_l15b_1p8>;
> +		vdd3-supply = <&vreg_l5b_3p1>;
> +	};
>  };
>  
>  &apps_rsc {
> @@ -821,3 +826,25 @@ &ufs_mem_phy {
>  
>  	status = "okay";
>  };
> +
> +&usb {
> +	dr_mode = "peripheral";
> +
> +	status = "okay";
> +};
> +
> +&usb_hsphy {
> +	vdd-supply = <&vreg_l4f_0p8>;
> +	vdda12-supply = <&vreg_l1d_1p2>;
> +
> +	phys = <&pmih0108_e1_eusb2_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_dp_qmpphy {
> +	vdda-phy-supply = <&vreg_l1d_1p2>;
> +	vdda-pll-supply = <&vreg_l4f_0p8>;
> +
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

