Return-Path: <linux-arm-msm+bounces-103295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EWKIcWT32kiWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:33:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B7D404D80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 15:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36EFB3013A99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C715D3A63FE;
	Wed, 15 Apr 2026 13:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oPhwp4K5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M9Cj1NE+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F979244694
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259979; cv=none; b=AGj0KsRa9u1iOyeszzZdftWgkAs/ZUM0cJ01ka+2E4fMm7r2c0XVkDMEQu15e5UWrso1q2adN5z/V+id78/nXdugubd0+l7tPzT3pRkOjNQIn5InS0F/7Bujk58cK47SRjXQLrEp9/S+zkKolDYfrjBPFoFOLqQRx2AFE89al+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259979; c=relaxed/simple;
	bh=NAj2suSUj4tUcP5Z2Je1pZXruisEGSgGpugY2xNyNh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isVYwuf/opmplQtfzRi/RwehPcRe2EGPHGJUK0gJz/l1d9fis4wyvzsIKqDSXiT9KmVN3xhimmB5qLjuOepvnLtaPKmIRKjTW+sKhocQJ99PrrxbRkr/vaeUYqe5nmXbsBpfUXrXSr4SdNzBJ4Wm9tDNHqymCmmWXtc9Ji+jV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oPhwp4K5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M9Cj1NE+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F98GkI4053341
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7VmMGbz1juC7H4c8Lb1ZUKNh
	tUA/XDl4zcDA/eoPAlA=; b=oPhwp4K50aPuXTYKvq7u97E8+3WjGALcG4XFxzqz
	D4RrZwZ307Mg5K2UdVDofAbNroECsdofnLpF6sLXomjLWprg9pQmyMYCuYYwa1OP
	L51AhBL4Pu1q2aujFQKPWiwJNX+UwP1JIPsL8spEVIku+6iqb01h+JajWuI/5+5a
	mBP5y7LemVwNBflbcSbqMZnG8ejGVJQYp69jElqhAXwmB/pPlMlNtNcDvWnSVHd2
	xD6bZDxxVHeAbr2PwQ0uozCU7KCQpIY+zlwhq1Wcism4Rf8ZRY3yG3g0ex9bzgi1
	AWhCbojQujQ6SxFIRme5SK8Cac+IH/eqCOdxGuAX0O2g3A==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7s5rtnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 13:32:57 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-40ed781f705so9568176fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776259977; x=1776864777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7VmMGbz1juC7H4c8Lb1ZUKNhtUA/XDl4zcDA/eoPAlA=;
        b=M9Cj1NE+OQeXhaMZOdgpYZlt7UhfEmQ/R1QYNYvARLN9/DeG62jwwqkop33wCe+DdV
         qhbbOKF48/8cRs/awe0oOhi55xX6i1kFcr69S/yP8h85S2JART3d3wkGMTTNfBMRgkNs
         NTrzLEKXsZzb7UYZLnhQka2esOIkURh1F4Td2bJnSZ0q+M1qt0kWt6YrtCGcVybNgC6U
         /3Iupj7VID20iPrDGWUYyKDMnFGw1i1rYXKYree7syuDUcw2pGfj/zPG8T6ARKXyuuSi
         CUMQIo6ypNuJtpz6vCPZQwlyqSqnTAfwc/8yC86RMy47uKeThY09Fq8V94QGud6d56hX
         fn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776259977; x=1776864777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VmMGbz1juC7H4c8Lb1ZUKNhtUA/XDl4zcDA/eoPAlA=;
        b=lucl1eIpAJ+KVonJp9G/nQQoJq/93sLtpf9NjJjTrMJ88O3xo0L3tofaj1N7A3Z9Fw
         BY1t5NPgEZ8ujoMpccajgM10CASz2ezsaxnDi703VS1VzuxBOCiLlPnk0zcRQfJMTA/r
         IPREL2WM3S8P1FbaeRq/qRx3zaU0UbOkC0iD+87HapGj8W0wl+Y2vD4qmIdoc9uwRE07
         fc84H8yB6TODrKZtr11h7KAorLWjEodmTQDc25B9e9Z1VVv+hnQMijBrB5el6JiBQ43n
         GDxcs7rf6+eAT6Z+o9xqHOA+pwSfhTRY+rVp0BdG0xL3PTb6x6XDlhu96qxtfepSZ0u7
         thgw==
X-Forwarded-Encrypted: i=1; AFNElJ9WE/Zdbi0vcHu+jNFKDmsJSu4AAKPuv5qj6uagVXJxjptvpAKYuISowGo1cz6JLrSRSEnP9WiyblE00uDK@vger.kernel.org
X-Gm-Message-State: AOJu0YwK3E5C4/nrPaMq2hs3EdZjFJzYhBITwVqxzM92UqlwdxmDJtIG
	VI/1MjYVUW3RrbS3eFg3iSXdJq1BqKRKDi7p5cYZYfKwi5tyCGz4vvgLFiJ+UbJLzB90t28bnbD
	BunhMZqMDU8RhbZqmYN5Y1UXkO55mqK9AsZxh8uFDDbknn+6qk9cd8Z9g6u9GHwmS+elT
X-Gm-Gg: AeBDieutK4aagzF7ACb1x7ZWkAdP1TiK1hOXLBTlu74++1FcCQ/OuH6S0iU9EUM7ODV
	bSrXjkgXZD7lPdhLKHZJ+8eJQiQqH8YEI6Ah43b620FcRsN/rDsFqilxP65u0hS0ftx2dqvVfSw
	SmFCx+qCIhkfwkfJL8PCQOxE/sTR7AlueFf0D0I1aODp5On+nymwPwZp7Osdwv2S4Hz6g0tajGj
	CR6XwxsVr4r1Zhu0TGYeKMFT3IbCcAOEl5VT99yIJSWpsjh2BuLczMdJkc2uo1vjx96aZg2EHHT
	P4eAhO78bA7KvS3Ln3eQwZR82G9MI7NjZB9Z9UkSoYVCGak5ASO63Ym19VFIGdk1MNWECSRHisW
	fNCHrAktt3OOc2tAHrPIKEtSanqdynnl95biauB5x8rtdyc2fbb8P/F9Hdxj4okeAOv+wGSJvp5
	AOxFrddN7nlkbpa/bw5OjgQ6k83YoACL+0RL0uTv6aO4YjcQ==
X-Received: by 2002:a05:6808:1c06:b0:467:2609:1247 with SMTP id 5614622812f47-4789e03d193mr9596428b6e.19.1776259976916;
        Wed, 15 Apr 2026 06:32:56 -0700 (PDT)
X-Received: by 2002:a05:6808:1c06:b0:467:2609:1247 with SMTP id 5614622812f47-4789e03d193mr9596408b6e.19.1776259976444;
        Wed, 15 Apr 2026 06:32:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a2fbdd0sm459812e87.68.2026.04.15.06.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:32:55 -0700 (PDT)
Date: Wed, 15 Apr 2026 16:32:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT
 properly
Message-ID: <ftseg6hw5tbjwbxkz5i3rt5wnauypdtw7pmt7fqapmdgm5dhuy@ht2mxa2qurju>
References: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
X-Authority-Analysis: v=2.4 cv=A7Zc+aWG c=1 sm=1 tr=0 ts=69df9389 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=i1Qc4F9nIsNgxiQxDngA:9 a=CjuIK1q_8ugA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: nDsgMUn1d6rQTpvBGcfK1u_lEPwlliZM
X-Proofpoint-GUID: nDsgMUn1d6rQTpvBGcfK1u_lEPwlliZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEyNiBTYWx0ZWRfX7DQizTqcsLmD
 MTY9do1wGh8D5C1u+IoAFbCgeLvabr6dsqWoa65grvYdt5YxB3CariiTOyvbfYokscaevhfKOAn
 KUSZI6ZTmWvA/+u2kKi+/k82fodAPrb29XTpDwdCLvXKAJZpezWKuyEV0Nrsr5YuazUjacy0+me
 pTnOLH2M8cnPJFob3Do/RjAtom8MIojYSojRIGCqLt6oRok1/JcE+WgPEYeXqvTOIvFhezHniDg
 jVrqqv5dvIxohjEC1Ga361UVRXaJi7JzgXekBbQGUotEEg4RdA6rY3Uo0qyUMKbsk5Kf7ISH0i5
 U++0kbfeyznEKgtDkhvyHxQ8WgmxTxxAKnWinpuEnDhQUG5pcIRFaTQXOzu/aM+cciH6m+NCvNv
 DhEon1r0NqoUQl7JSFzWF5qp+r5C910JMIWj24cleg7TmKX7jOJIXUx9Yl3CcjC/0JTTEll/VDD
 llUmT8bsFs4BlEI6nmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150126
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103295-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,ixit.cz:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8B7D404D80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 01:56:08PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 65 +++++++++++++++++++----
>  1 file changed, 55 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

