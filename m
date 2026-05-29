Return-Path: <linux-arm-msm+bounces-110234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKngNiVUGWpjvQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:53:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7EC5FF8D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61FBA3015888
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254663B6376;
	Fri, 29 May 2026 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRvvS+oQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2gRbSR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A7030C35C
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044805; cv=none; b=Lo3KraMWSavlDkGmCteGN6/A97SKVhoqXYz/Axd2anrK23/v02a4ZM4HZ13gZjX2icZrN/l1yTZ8cbxUARq3JCEilv8cWfbUqSv5gn9JRI+C2I+tgFZe3ErhHKPNpUpjvporBWQ7NaD0T9g8fP7US5y8/pBrJPPFRpmyKohXuW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044805; c=relaxed/simple;
	bh=4q1IzlaMH1i4/ZH2devjql9vNl8F7EGw4Ej1RAH58to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF/WF6n98AG/oTeDvam0+rilbeAb+VRjx2cbq+Hdur/iVcKKPXKH7fYC5qzQ0KdbA+sPJ7UCgdZlfAsfLAgR1d3N/iC8ll1sk6EGLhmtwqaAgfA0xYp7bA3JGn8uwtZ398FjbPJEi6aRhnYUklrWZgu38qkoxSZu+qjnjB6IsJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRvvS+oQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2gRbSR6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6d71S1369492
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J501CW4Qc4fRIDANxnKi68vK
	G6WkIy8ukCvOtNCfiq8=; b=IRvvS+oQM4ZQZsdlS2AGkR26ru84Addn+49ioDJ/
	F1QI6aB5WteEVof9mKVdNl8j7k9algRpjJP5IP9o/ypdQs5FtRPdPs+xzYfvySg+
	qhuRqxKLpoX5+7OPps30MDVfl70naxiis6Qs8VZMeIIDgJ0tdDybQFWtEYmps6ek
	8uTzb/xNoCL9tpUqLGpyXY+8VHPGE1LSfqZ1LQuTgdk1pWnrKvhBwJIGhcv2Szul
	w0s/GTX1i3r4VWiCK1pIhlUqhY1FVOx6kj9490WqheJLLU1XDBDrQU4io9RpTOEa
	BUdyMNoBSVYqBajwT7YyLmMs9rq4Nk5WqP6HksVuBzahpA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5u9xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:53:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517288c4ed0so22423531cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780044803; x=1780649603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J501CW4Qc4fRIDANxnKi68vKG6WkIy8ukCvOtNCfiq8=;
        b=K2gRbSR6uI3DyYWEOA6sKWUx6dT1aCcAhjnSErw4N1KIbk7xfx+O6Zw+0oc0CH5ob/
         8TQzqGFkCMvipymNFwzbTHa+vzxaZh0yydZ4oD2t/EBWT5BVDStxpci5bbEpIZVRt+6B
         moNzHloL6tdaSa3IZRLFBmZafJx9ncM86xcFwE9iJ62EFuewTVwCTjy+/TKoz1+wP1p6
         6/5lzz6fkPAFEMhu8MlL6e7iUqe5jUudejAKZwL4ILcWrlojYTLwgLgUzH2xLMLGrGHB
         wn33uZYuO3af5oQ+4fjy6eO5dbHtOM9oBqfrmqLAUarYLzx6pICClsCmDF9LqS/xTo1G
         UHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044803; x=1780649603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J501CW4Qc4fRIDANxnKi68vKG6WkIy8ukCvOtNCfiq8=;
        b=CbxUPFLB7qzuu0gnInpHONAyZ2DkofbFrs0KrDzeJVspq3dUjn5vWv9BDMCsI+hFbw
         MtiyJZiy8eWuaDDRjXWfztJpqAgx+wJ9j+ZLtlj65icvQXaubRygc4ATrwSuDu4gBbEh
         virpGGWisyr4My23RMn621vcPIJnmbVpqC8WQhrUCYvUInXtt+k410nJTTKevLxSvxwE
         6eqpTL85LD+UL+sYzvsvaQcy4+FK05SGH17U0fhH4JQqtbi6efjc/WeqMJMTchzCJQVl
         N3+quRHi6yieoXUBEDkNB+kwv5mjd+rqA1AZGxC3u9IjeBO240jH9AhpZq1geBaSqQ0I
         eHHA==
X-Forwarded-Encrypted: i=1; AFNElJ+sRRAXkgZvZ/M05AgygtPM4BlsJeLiZphUGydSEjtSZYTdHE286Wd5WWyJXbohbloyM4s0tUfDLqNWZuyw@vger.kernel.org
X-Gm-Message-State: AOJu0YycMdUihjuoZW3WyO4eQivbtm+WousGPF3lnh4QnbvogGOVSSF9
	aIXfWa7Ac6iTIoHuHUxG+gPStr9jujdot4poFiYLOM4f4SZO9yvbBB/KM7QgP6ttfSPJepcUx9N
	8RfEC+wVAr7DIr7sAtgiT7hhvMDLNceZKGFBX2ys82ksdEzbNTsgZyH6SjWgpDOSHCpPK
X-Gm-Gg: Acq92OEL5EDpkkk1qLq7rkK9lesKG6KCEug33pZzQIFNB1Hn0U6051fwDip6MjU8jyj
	Bq9iWgmfVcizU+RW5MIau7VwMIkOp2dhAhExbpwOoR/yjeDLAFm5USwkZYu7F8xOKZJoW5z9UPL
	5bf2hVtveb+NXexHkHk703lecUgEZzkUvxhs5IacJqJql8DKfjAKfPfCiTBwjhTIT8Y+TCUDAVC
	tnpxDT++CciorUPgwQ4QAbvOiBnBbXylWdMjXba9PWzhF4KPehnAyZ0zsrS8wh1u8/7Sq3qzJOh
	pG9sOA3FtnYA/KkIgycKwZVynqUAgVW/r7M/7ojmaf7yIkRv+gR1kYpywZwqYW4BXhFSkFyz9qp
	wzCEu677VvfwAGdx7pumm8MqsvKLHec54krjaHhAtoYHm6EifGX0EqFO1lBrS6DrAY1nKVGoRZU
	vNH6++SM7cY0DrU7Wiwo+G4pZZRWVVdjN+yUu3IFzbYZVv6g==
X-Received: by 2002:a05:622a:4898:b0:516:7f36:a9d7 with SMTP id d75a77b69052e-5172ddef0c7mr22349581cf.57.1780044802916;
        Fri, 29 May 2026 01:53:22 -0700 (PDT)
X-Received: by 2002:a05:622a:4898:b0:516:7f36:a9d7 with SMTP id d75a77b69052e-5172ddef0c7mr22349381cf.57.1780044802528;
        Fri, 29 May 2026 01:53:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0726e8sm139024e87.25.2026.05.29.01.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:53:21 -0700 (PDT)
Date: Fri, 29 May 2026 11:53:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Message-ID: <s6iz6oohv77gj44mby2w24gr7u3k4xucwaknci73hmd7zp3i7o@rcyjzme5wh6o>
References: <20260528152011.376711-1-zstaseg@gmail.com>
 <20260528152011.376711-3-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528152011.376711-3-zstaseg@gmail.com>
X-Proofpoint-ORIG-GUID: G0B-j8P2QjiAuHKp7k5Bh_gd1TDjvS0-
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a195403 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=wdaXZt0xLy4RuJ6k4jQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: G0B-j8P2QjiAuHKp7k5Bh_gd1TDjvS0-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA4NiBTYWx0ZWRfX3MZ3T20u/CEk
 2CVMCdjr1Fi+UsnOJaMdGUpB0ixbBCcszn2kWiAO2vtVNKbtmncGH6QR3Jzg6Lk9TQHnZrv8QJa
 6s1pf1RsLq4h841CHFc5jkU7jKc2isn2/eMg1al48yCfK85nQsY2p70ct6fNKkGMB1UELY+Rv9S
 tnM/nrHiJ2i39pXdhzyiohLOGhV++uMwqqIHdn4ZG4KkKlXBi+vu8Z4KVUZ5kFB4bmu/o19ajPk
 OXsJKGzYMdmDcbC33ns6K3S1QbcD3jgjNayNsOIfAL44NmBPXbeZ6DqQ+reea/rGTmh0h6cQ8+G
 2pKwRhrmlOGnfho8oc7mQXSgGC8mFiccXP9wc7snMsr0FYtbzPpN4mTzZeWMIxVLBPJxEtSzazu
 BHMq9xmESA5i96+w+mzkaf/4YiQLYtoan8hY4FtkThuxkYhGqOtA4oA1dDFyljeSjizdJA+b0pW
 J31kjqIhKc36t4W07xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290086
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110234-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C7EC5FF8D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 05:20:11PM +0200, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 909 ++++++++++++++++++
>  2 files changed, 910 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> 
> +&usb_1 {
> +	/* USB 2.0 only */
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	dr_mode = "otg";

This is default, it can be dropped.

> +	usb-role-switch;

This should go to the SoC DT.

> +	maximum-speed = "high-speed";
> +	/* Remove USB3 phy */
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry

