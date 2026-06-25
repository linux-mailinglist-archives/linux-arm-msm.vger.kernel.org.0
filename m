Return-Path: <linux-arm-msm+bounces-114499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WPggHTH/PGoPvggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:13:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D65F86C484E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:13:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Oz7nSyi4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ArcQTXFj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114499-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114499-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4A71301980D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417B83CF05D;
	Thu, 25 Jun 2026 10:13:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1E1DA57
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:12:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382382; cv=none; b=b/37Cjw7WkipyUTMFFuSE/9tSn66n1ywlkb2uFl7QSN4Rn8/dUCMjzIKhpvLrTAKyDXgFb3sG68I8DC9krVLN99GtQujXr7dMZOH+OwR5LD3aEhabTNrb7cw9txEopnwTmCSScFuiJbnvzcuPM8O33lqIFx5U7SI+yNLcFDDJhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382382; c=relaxed/simple;
	bh=rC7OzT/7r6sK2n+kqX4bThpbDF6h0wHDsAiAxEuyj7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mks41mYF3D+zAkaO9buML9rWGHsHrgAZ5XzuIArmY++512BcWCRZdAMQ79rCCIO0Og0UF+DFUD8+2rKLlruLD03xzdspSdiS9WEos+J3SLBdISaCEVP5DZAfCbCKewgx0sG8eD/AIVjiadGC05JiLc9YgO+xqaQtXT91TTJ857M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oz7nSyi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArcQTXFj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jssX1919010
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UvuIOkwqpIZZcGAEaJzrEqnY
	WDJf24TnV8rXfR0nsSQ=; b=Oz7nSyi44+/br19nE0til3uNXHjsUb3OPCi7C97e
	FYzAP+QcuWpQM0cp2eC99/HhrQd7ChEVoMqtF56VT15cY2IHOVSqermOOcqOBZtV
	855iA1QGP0H+Y61OmgxQaWHPr5h/tMD81m7vMvKjwabhS2GkjqyY7r1ybbhMDhj0
	SwT8RMkq6KOaYIpQT8zchhi2u7ARtDMu2qqi0CH1v9QntDgr49XCvtP9g+R73Zla
	v4rVE3Z1rff6PCNKlZkpd/wXpqG9Aq1jfj7rrN+ghHwDi1WXIleHM4JbT6bZrTVj
	Fc4spVGa3XejkbMdIuvnGGezZyBwz9tH3dARAaim2LfNfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9p9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 10:12:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157f1be083so273792885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 03:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782382377; x=1782987177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvuIOkwqpIZZcGAEaJzrEqnYWDJf24TnV8rXfR0nsSQ=;
        b=ArcQTXFjsFRxJZ7LnUysVWbq2O1tKFPAzj7+eVdXVxdSskJwqAvb8T6xpkFMvL6dqC
         +FLBptWkYQwCq+8PXCmWUxKlUa+SQiUkkyDJ/3/nqI1A0jKej3gUA3qp7f6FqW9H+16t
         EbhJ9XFCJXWSmHQ38VBT2AymlMLNhp47LBUNU9iFGJLgvFLFcJm7uzG+BzC51JgPbqV/
         Byw314subB3PMIPsOr+Tef8/Piw6mfwMpnkEGnJnXc0YmyXasyS0jW6TFP5e4Us9GExN
         LfrrqqeGqMwbq54jzMH42YS/rWaNj/Bvv+PAC4stThQFSs4tXZflG+yBcYNSs7qOJwTG
         8vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782382377; x=1782987177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvuIOkwqpIZZcGAEaJzrEqnYWDJf24TnV8rXfR0nsSQ=;
        b=sLseSTk3rC1FfqkEgUJ17W5XnnxSCVHaCjHcFrZsO4UgIYNIbyCgfQuWpu/PYpxFPX
         MqCuQzzOq6g3/tETcI6q6CImSWTt+hz6lni1/O6l1IwTVlV69gHVNEbWYTYcA0UwyY37
         cEIOzJENA3M3jck+7uq3zN209Nb9NhO/B0QZpiUgavXDC56adPGDYot+ZzkyzjYfYRNw
         KjRJ1QYRSFY+ATfsBhfA9xggPhiz8x97E6cWGFSfcRVQtUoxXh9QBjD90NFb5EGg+t1W
         Z5/OUUm6ohNGEEC2lxYjrXsn2sw4BsulF4XUKzsSwZp3SoDOs4NdYWa5HUn/FV231Eel
         NzPw==
X-Forwarded-Encrypted: i=1; AFNElJ8uWSHcnkb8J/x6coq1iPgq8J6DPOA4TZKncXX7O+nC2+E72oS1a/rjW5zVekH2jiy2nqookw4ETO/2t3TI@vger.kernel.org
X-Gm-Message-State: AOJu0YwekiIpCZnnPvRpZh73Dz0Bb61jm5kpmUY9nQNNax8f20vuUw4v
	eoTww9VE9BDpmjq4ndEmMyaDMaamyheJryOhR1H+vm0hP+Tm+nupXr99sUFYkAP/QSpAbZZfJCU
	BmclpkeBQoRfgeSeFwjdvmokjw5ZaASjZT4hZenIIwfzFTPAxqev3JzfDLDTTvYKwsbEc
X-Gm-Gg: AfdE7cl2WjosRa/ngpkrLNejx3x1UUQ8E6Ylj4PJyaeMiPGbVuavoSthZz/Tr+PmtKC
	Oav5jyXm1fFFQsH2HanRXxpL+GE6hQkxrRoYMW2/5v3l2aJOl3f3z3r7C70JJ6/Cwm6mdzMTVYz
	yIKkGGzybG+qSdl5nnzvgL4iMgFAGjDhKcH9Z/M8FXxRtnWWpO1o1eMhAixv1AQCr6JTPeaJUw5
	+a4KCDqoMd2RDAKJBhZq7sz7S0UkPExdzo4755V0zd58fP6ErXh+e21qWOWCOg7q/ugYRhyDTfQ
	NJgbyxgShZ4ItmZT0+XiUosxWRPN9XEXj1+p0ElCBOYqCJr2LMUTnS+WHq+OyZ0IMOmN9p4FES4
	13xvbyjRG69Xa/Rmpw6stjA==
X-Received: by 2002:a05:620a:4409:b0:920:946c:45eb with SMTP id af79cd13be357-9293b474a63mr236590185a.3.1782382377289;
        Thu, 25 Jun 2026 03:12:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:920:946c:45eb with SMTP id af79cd13be357-9293b474a63mr236583785a.3.1782382376630;
        Thu, 25 Jun 2026 03:12:56 -0700 (PDT)
Received: from oss.qualcomm.com ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d51sm12028149f8f.15.2026.06.25.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:12:55 -0700 (PDT)
Date: Thu, 25 Jun 2026 13:12:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
Message-ID: <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: laQvu-aylv3aj85Ex3LwN-DcRTh9wD07
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4NyBTYWx0ZWRfXx2dUfmSI4VzV
 iK/R0RxMSnibh82/EqpoHjuPy3r1UtVYkbTO+EGJn8q5OHmMaRaavHuAfHXGYmr0pTVcYTe2ttj
 tEPnEUevgd0GpQ9I5RH/SCeuRKW6Mak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4NyBTYWx0ZWRfX/hax9M6mO8pb
 YYWp8XQZd9RzFmbjsWjyyKcp0g4+g2mj3NTWB5jO66v+LmkU90hJUewIFYZLpeuGut4SM7JEo/g
 OQBMWalRNnLxOZKHcHx4O1EJZctaONyQ7PB7XCPfTB5v9i0MAVH/LiFaaIZc2aUUQuF/u9Y+fQ5
 OelceQVvIF8kaXgKoW4KFEbg1tN0xMYIE6rABSgDyS3VoMlT4ighM6dKl7rfQ0NUi2yTL9fpoXd
 InVNI/+V9uZzBULG2r/DEv+o8LJbZ5x36lAlZyafNU7hxbYCSZr7ZtqYoCKDQgg/OQVzSdxWCkM
 xikE5m65OdMsJk3dbTZu4+EfZ6sjH2GiWTaENU9Wq+XTj3FQvCugtA9We2flV2EmWmpjbaw/tfl
 vSbs3dsGoQ7KlkiadmD1G8KClYhWJh29L/ZRpBoNpQlic3Kq9pmn40eHA+m+DZtliOLcLlKOw1N
 4A3Nm6bMU4jNI8b8exg==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3cff2a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zf5SUlF_nZDS2Cpi-W4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: laQvu-aylv3aj85Ex3LwN-DcRTh9wD07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114499-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:krishna.chundru@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D65F86C484E

On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
> the GCC clock references to use the newly added PHY nodes instead of
> placeholder zeros.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> This patch depends on https://lore.kernel.org/all/20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 359 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 357 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index 7e97361a5dc5..2a51da62270d 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -610,8 +610,8 @@ gcc: clock-controller@100000 {
>  
>  			clocks = <&bi_tcxo_div2>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <&ufs_mem_phy 0>,
>  				 <&ufs_mem_phy 1>,
>  				 <&ufs_mem_phy 2>,
> @@ -716,6 +716,361 @@ mmss_noc: interconnect@1780000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		pcie0: pcie@1c00000 {
> +			device_type = "pci";
> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> +			reg = <0 0x01c00000 0 0x3000>,
> +			      <0 0x40000000 0 0xf1d>,
> +			      <0 0x40000f20 0 0xa8>,
> +			      <0 0x40001000 0 0x1000>,
> +			      <0 0x40100000 0 0x100000>,
> +			      <0 0x01c03000 0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x3d00000>;
> +
> +			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> +			clock-names = "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a",
> +				      "ddrss_sf_tbu",
> +				      "noc_aggr",
> +				      "cnoc_sf_axi";
> +
> +			resets = <&gcc GCC_PCIE_0_BCR>,
> +				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> +			reset-names = "pci",
> +				      "link_down";
> +
> +			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "pcie-mem",
> +					     "cpu-pcie";
> +
> +			power-domains = <&gcc GCC_PCIE_0_GDSC>;
> +
> +			operating-points-v2 = <&pcie0_opp_table>;
> +
> +			iommu-map = <0 &apps_smmu 0x1480 0x1>,
> +				    <0x100 &apps_smmu 0x1481 0x1>;
> +
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			#interrupt-cells = <1>;
> +
> +			linux,pci-domain = <0>;
> +			num-lanes = <1>;
> +			bus-range = <0 0xff>;
> +
> +			dma-coherent;
> +

No pinctrl states?

> +
> +		pcie1: pcie@1c08000 {
> +			device_type = "pci";
> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
> +			reg = <0 0x01c08000 0 0x3000>,
> +			      <0 0x44000000 0 0xf1d>,
> +			      <0 0x44000f20 0 0xa8>,
> +			      <0 0x44001000 0 0x1000>,
> +			      <0 0x44100000 0 0x100000>,
> +			      <0 0x01c0b000 0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0 0x00000000 0 0x44200000 0 0x100000>,
> +				 <0x02000000 0 0x44300000 0 0x44300000 0 0x3d00000>;
> +
> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> +			clock-names = "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a",
> +				      "ddrss_sf_tbu",
> +				      "noc_aggr",
> +				      "cnoc_sf_axi";
> +
> +			resets = <&gcc GCC_PCIE_1_BCR>,
> +				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
> +			reset-names = "pci",
> +				      "link_down";
> +
> +			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "pcie-mem",
> +					     "cpu-pcie";
> +
> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
> +
> +			operating-points-v2 = <&pcie1_opp_table>;
> +
> +			iommu-map = <0 &apps_smmu 0x1400 0x1>,
> +				    <0x100 &apps_smmu 0x1401 0x1>;
> +
> +			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			#interrupt-cells = <1>;
> +
> +			linux,pci-domain = <1>;
> +			num-lanes = <2>;
> +			bus-range = <0 0xff>;
> +
> +			dma-coherent;

No pinctrl states?

