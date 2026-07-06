Return-Path: <linux-arm-msm+bounces-116812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +hwLJXi6S2o1ZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:23:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E95711E8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:23:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="DRz+/f4d";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SAKQLwWp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116812-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116812-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C3F135DCD55
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AD04CA287;
	Mon,  6 Jul 2026 12:45:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464CE430CF3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:45:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341921; cv=none; b=kSz5hUm6f2LQGGNWrei+m3JLRQkBPt6jGaT8l1FAnp/NM4IDXRBM1hq+6qTyyBc6Gsirf3b55npJeL+bi/MWGR3lgdtTWZvXa6vJ09gBwvY9t6QxHMj3ZQh+Egu19o2Yg/1AmvWCPYSZHeAdYQyBd1PUGlUJ9B9crwPolJjbUqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341921; c=relaxed/simple;
	bh=0JPIOM3bKv+VlgOT5jfNWR3yS4XhT3HggZFHDmH/dys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4WdNsO2KTMiPXKc52VTeiaMdAQLrnaO58B6UqWjMVE8X7TJCdMP4vpdlC+KA7UrHzZgpc9WwqzrSEuuX8fGJRfCuTM9cI7lq+F5kCE0iGnoj+9gtQ2INuKMPFYCMKhYqNdTicCelKAczJxKKqL5HN29OvqrFpR+9v7rah0MKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRz+/f4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAKQLwWp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxPQA369525
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=at2wG9fgDCzLJho8qAuNMi5f
	Pc/Fr7X6A05iUjg+Iuw=; b=DRz+/f4dZLxPlpoBorbK7Nb3wRrQ6wdJT7KcR9a1
	dkz9h+YfFn6qn3SxncWX1EG9PlHlDG4LP6cBk6Ofp8IarWrsPGvDlXFnwNFu+jc2
	HQrKHsH3coewPY0vc9ea7kiGhHhxouemHq3z0kgIVz6T+ZW2Tl9oIzDzILEyoJrl
	Uof8yqWrm6vla9q07m/xB6hywIXX8U3z07uwOVTUARrg9Fyw6GI25LQHK6EyaESy
	r/1d7UK6pU5LVGrksug1Yc8AeVvFm6HSuZKs9LDYnPi+mpoRtJ46lw62FTBW1hOV
	BFbpYNWtqZBXVrM1RSARWbYjwubcAtSwk3+Q7laHiAL1WA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9935d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:45:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9692731af28so318082241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341910; x=1783946710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=at2wG9fgDCzLJho8qAuNMi5fPc/Fr7X6A05iUjg+Iuw=;
        b=SAKQLwWp2DyhygaK3PygNvCaFsm7vFnIvlqhKPu4jxQ01Du+/khADiQ7HCWQqKbX46
         wq/VIVmrAbhLzBeWGN2Tva7rlW2t8Jxkq3Zg5b8FC5/IPrfCysx2Wgm/NxViMqYAjepx
         ir3pR/Ac1yQDcEPvOXWGqS/JqBFSs4oPSmZfnaKm0X/T8dSHJNr23krEZ+GQtUHUeXk+
         nC+3sfpEuHKT0KGyqSmerCJqJwwz5CXphN1iVwwqoAoVcLRo+LJ4GgkX+6pF7iIFIE8W
         xgiLUA5hvsyuTe0pXQtHMaJas27aR+qts6RTYkHiAgZUflsfh8dcc1IxBAdUHvogROJ5
         xbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341910; x=1783946710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=at2wG9fgDCzLJho8qAuNMi5fPc/Fr7X6A05iUjg+Iuw=;
        b=EGUaDjrKpjp9OKUDOxNtJuHDiex4sKUhMFSYh9aJj1jSWimvkxpNEq431MYFATf/Eu
         3WJyTKOG7twmIA5qC/lFNUq0JXiWKEyaREF7moGt3WYBK3kLTFejRaaajDbs7D+ml98n
         3/XfjKBPzg46sves+AyGKUOkgOIRfgSXyd4s3IBZXy/rhfogqVr/XHgJoj/b6FIia4Ms
         fytwKPusIUWD8Eu3B94tBg9Y6HK3G6BDJt709SxMczSuGm2bx1rBzfVmKPKYDKlIeXfF
         MxOb1vf4quL8z2YUicw18wUdehWg79NCG16iAMC8binBYesYG62/77RZW9/69bqNmgrQ
         n6kA==
X-Forwarded-Encrypted: i=1; AHgh+RqxFbYvjDUZ4baQshmy2bhlA/fXAvVKJ3cQitCn5yQiyjf7J3nUm+oVNn+YB4Bqe+cytH71SU3IPMYHdz45@vger.kernel.org
X-Gm-Message-State: AOJu0YxMA48yA7uR3r9wgl9fFX7x5PmkaoLW2Wt9OpsUfJt8UPi8e9/x
	3lrVCX0t5yRn86GOQvKo6GwVkFfEp3qhusVQTlWiqSvmqxQR19LZ39SEoNcY4UAivWHKC911xnG
	ggykp32cKmJlLyLv4PRTV2APjYA/3B2tdDzQ/rpLU6i1PxAWT5qCI+wUoMKhboqaw1FtT
X-Gm-Gg: AfdE7cnEu0pLHY0WUMOrTASS0hJHtM1LkvtSQfiU5tY+LrT9oxxNA0q3tlmXrpK7Hja
	VFakXmyIXhGNnK3/5t1GXXjXIAhQgk4U/NeSbXD5NutXysduv7XfGul38UrzpvPQPKat8b/tChV
	Wmn6nU186z0yjMCQvv/cHPfF2i6y6tSYA/fUtGTKabFgRwPDpBx8f6+FKvRYknBk/rIxUlTVibZ
	r09JvVWh+Y6y0XxOlZ89JwRIXpwlXZiQJMtzzCRDZQirUis5T2WwzmgzXxDTWLtDlnuLqUhk3Fg
	S9kD7h4OAXl8nL1X0R+Vb0q1/0Zq4bP/988cG7oMU2Zl6QYeyO6tphdIQ7uTBQvx8Xd4a9yXTgX
	a+FgAGm0tppc/PQrSajlVLR5sThj6JsUIhVJHkaQxI1FSZdETBouTgYgzzVa5KDy8xy2QppURPL
	cex0lcy4QOi6J6WAOa7NNldJHl
X-Received: by 2002:a05:6122:16a8:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5be89740b71mr170290e0c.1.1783341909878;
        Mon, 06 Jul 2026 05:45:09 -0700 (PDT)
X-Received: by 2002:a05:6122:16a8:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5be89740b71mr170272e0c.1.1783341909306;
        Mon, 06 Jul 2026 05:45:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbbbsm2839229e87.43.2026.07.06.05.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:45:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <h2fskxtlb6wusoz7o5pw34ii5n2il4jltcrogmt36676ioq5nd@klwft4s3mzgk>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: nhpqV-ix4EG5C0aznPTcmv7zo9lkvfg7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX22RmNGuU7Q+1
 nPNYtQoSQ6f7TdH88No6Bu0jaTL/EIyxbqRLAHUYGpJle3dcmUCDG1dL400NKqmlideHYBDgms0
 A3R+IODdl4IJ5V8ohqqlhaEXPp2+bCQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX3o8ucwo/T+/n
 VNd/xeb27c326wtkp9U3KzzEvPYNJoe3MwfXzVpb6lzdag5KkNq4pJKIUD5s/qmAwKU7eh5X7dH
 +trZETElcQghqn5aSbStVk32PMxS8FyY9P/gCf/jmuvxZSuBRc5ki3XpXqetwmBWdyDexds+ORC
 3PZD8ghGP34z7UZ0EgDrDeyqT5tLSI1dTy/4njfAt6eSUD8YogC4DBdnC935jK/jDpwFaD8mEYX
 HHwrL1EEN8kOWVAwVtnn4CXHXgzL9H6l1wxh742boKm5MuQN+So/44OOEP7fWlOKFFwfZkyUv9F
 FmhZHNyjclANmCLufx8Mv0wzSfeIx7GStSzOkNu4Khw+kdgMbiHUZd6awy/6acj1D/9VZSWAZJh
 nInr9kmw8Yx+CH0DR9ddG9drRbuQT6OSoTKNxWtOdm9SRZYLq4NCYP3dANwlYl3YFF1wuLCYhSw
 LVDH6TvNJeAw25wEDIQ==
X-Proofpoint-GUID: nhpqV-ix4EG5C0aznPTcmv7zo9lkvfg7
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4ba356 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kM9LC2GvXd1nFKSqAPcA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116812-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08E95711E8F

On Mon, Jul 06, 2026 at 10:11:12AM +0300, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SM8250 device tree so the
> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 7076720413ab..a089b706f60c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8250.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
> @@ -4471,6 +4472,10 @@ cci1_i2c1: i2c-bus@1 {
>  
>  		camss: camss@ac6a000 {
>  			compatible = "qcom,sm8250-camss";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
>  			status = "disabled";
>  
>  			reg = <0 0x0ac6a000 0 0x2000>,
> @@ -4649,6 +4654,82 @@ port@5 {
>  					reg = <5>;
>  				};
>  			};
> +
> +			jpeg-encoder@ac53000 {
> +				compatible = "qcom,sm8250-jenc";
> +
> +				reg = <0 0x0ac53000 0 0x1000>;

0x0 instead of just 0

> +
> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +					 <&camcc CAM_CC_CORE_AHB_CLK>,
> +					 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +					 <&camcc CAM_CC_JPEG_CLK>;
> +
> +				clock-names = "hf_axi",
> +					      "sf_axi",
> +					      "core_ahb",
> +					      "cpas_ahb",
> +					      "cnoc_axi",
> +					      "jpeg";

What are the clock _inputs_ on the JPEG core side?

> +
> +				interconnects = <&gem_noc MASTER_AMPSS_M0
> +						 QCOM_ICC_TAG_ACTIVE_ONLY

Put tags on the previous line (even if it is longer than 80 chars).

> +						 &config_noc SLAVE_CAMERA_CFG
> +						 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +						<&mmss_noc MASTER_CAMNOC_HF
> +						 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI_CH0
> +						 QCOM_ICC_TAG_ALWAYS>,
> +						<&mmss_noc MASTER_CAMNOC_SF
> +						 QCOM_ICC_TAG_ALWAYS
> +						 &mc_virt SLAVE_EBI_CH0
> +						 QCOM_ICC_TAG_ALWAYS>;
> +				interconnect-names = "cpu-cfg",
> +						     "hf-mnoc",
> +						     "sf-mnoc";
> +
> +				iommus = <&apps_smmu 0x2040 0x400>;
> +
> +				operating-points-v2 = <&jpeg_opp_table>;
> +
> +				jpeg_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-100000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <100000000>;
> +						required-opps = <&rpmhpd_opp_min_svs>;

Inside the DT example i saw bandwidth votes. Why are they gone from the
DT?

> +					};
> +
> +					opp-200000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <200000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-400000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <400000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-480000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <480000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-600000000 {
> +						opp-hz = /bits/ 64 <400000000>,
> +							 /bits/ 64 <600000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
>  		};
>  
>  		camcc: clock-controller@ad00000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

