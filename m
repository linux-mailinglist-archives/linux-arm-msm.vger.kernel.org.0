Return-Path: <linux-arm-msm+bounces-91351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TBEjKa+zfWkSTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:47:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23707C124E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A7E33014426
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149E019ABD8;
	Sat, 31 Jan 2026 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bv4IHS8m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmUnQQMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C04318141
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769845662; cv=none; b=mOm9bsLOxSH8GvPamA0bzeOvAp7L4uoLAnVybSN2xF3aXXFDG9GE1lcqaMZt3BeamkPewTIFRN9FFNoFjjpWZrIzPwYtVkryx/GDnueG/W0aRTUWCHhWqhvYkM/3QbYaTZ0jWr6AOsLPnxMLzIGqoNO0EoJvUHeYKG13sgpEWbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769845662; c=relaxed/simple;
	bh=QqoWwYzNi4zrXNukoRiPgcsL50duB/mc3/X7y00nsoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVwjY6Lol1SNMK7MmQNHzQr1tlE8aWWfOEUPBuT3h0WHHWZZ2rSoS/vupCdEdW+wHrOfjx2I18CNAyJf5my2frQjZbMN6DZKWsSfvJ5WPcbdJ/SeB2NCDNa+b7bzURhtGgICGOlm+VCHcJT/RWPUmCKh/9YBWg8FHO7dNpxc5XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bv4IHS8m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmUnQQMN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4bnfA1061573
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QmhRuIXw0mnjE3kiuOWUvcMk
	udqfG/1kwYIgHFoKJOo=; b=Bv4IHS8mUhj32FWAQ38C+ndsOt7+TlsCj2BO0Tnk
	Yholqn9vyLapTTiiJ3cGL4fQ7EK6/Y9OppCMIFJaDEWgIkJhWLOyAl5vxzOlFY99
	hh/Qt+imVNnKBN7GSuhi3Wlh2dT3YslRLNj1smVKlFE0yAIirhPIs6/6NKOtWOAv
	bBqatgFqJCoTh6NCjcypwlEMd5YIdUgHWzvbOZQXewoxTlpy0PYUYDsZrZkRygDg
	eIkCdCc4X1QZDx9s83+j40o2vptlWKQ8iICko/9blx8ctsr/eeVy1JIEgSxFgEX2
	u02Vl9EXml8zljkJObwAk6BMrg/DncCYSFyAdp3ASqup8Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avngd17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:47:37 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f6a0da26dso9558960241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 23:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769845657; x=1770450457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QmhRuIXw0mnjE3kiuOWUvcMkudqfG/1kwYIgHFoKJOo=;
        b=DmUnQQMNhe0+9drzSR7vOXIUlku1iqE9LIAi9GCd6niD9BCc8BtnPb8L6bfx+HR2HE
         WUzP4QmoWsbIt+bayD6ujNe8ibucrTRGwb1B2wzqzirfqDyMjAKsHvm7GKURPRKeR6fs
         qiiKxI0PiBOC+PNuGb7fK7yF/NcrXSinwHb7T/vs9o2QT8NTBKOut2dLHx1AzQzj2mcX
         3NKC813wErmpd+aXAN/4Q+daUZK5NzJhHiMdpEiiPX9qLNZWSF1ErD38O/4+Z8VlnqcL
         OMzdKcLYGoYYm8gQzFwc71+wJmmWhvM8ehGit538jYXKAgIfLX5bKwXT5VkrAforlCHz
         DAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769845657; x=1770450457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmhRuIXw0mnjE3kiuOWUvcMkudqfG/1kwYIgHFoKJOo=;
        b=gwnp+K/0SF/pXH1EIVdUdHL0SG1Hd2JnZOgYYdccTphHyC/WAQMUxcBuLAC2rBL/vl
         AZXS+ccyl/Z77NzQyJ3seTMYIDW9f9oF0nM8GViE/QNqhQeKIG2JkJONFCrIUo0PnmLe
         QAjNgi/ZgeChJP050s/dYbKnuHY2ZRRegohzl8cvAl4NQa1asuiJfXWL2WikprUxzr3d
         QnOF5aF+ToH57RbA3vXXQyw3bqg2c3ayKm/gfFEZdV42zfSW/NGyNQfvabEjj2O+Ajjc
         UbMbWEkAH2Yr//jPaSCY/LC3BaDGqHnTdHS5EL8Q8rZDFgb0k6m3MBHRtYWwhmr+9jQU
         P6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxpJ5xVVDD2VD+mqvU8TqQFrAwiwGF+xbQ213hXbf+se+3hbQ7LuVaPOMjE9I6z0vHrqfMnDFJHIxMAZW4@vger.kernel.org
X-Gm-Message-State: AOJu0YzjeH2dk0NnS5pFvVu3h8ZjqUqA9MUSOroPCi6akvNsGIAdE4/u
	bFP/mmMIuMyeyDefSdnLn2YqiVlgdHHi9D8+hfhda+af1t2+Nl3SUZk0Gvsqy2gIQIJ8HnzXdzM
	X3YHAbnCSdexJbzRgXy5sx/BQ9Vy86DdosZI7dvcq91hzkUA2uPtTqMCSJHZ3hLvVCWQ9
X-Gm-Gg: AZuq6aIFR+76giUZrVmrfknjK5H47cP61lG7F77lnfi4b+dLPIKyT/w7R+JWgC4EF9r
	/PTdUBgnHauDUkyKbGmO8qeoGacOMIDQdqNJjWk/DfvOhLaOZNjjFsxl8BDYxkYb3yyNtF1R9ak
	+FdOXsFsDfePcW45cITnm4GEybuEIadsVcB69v71FhfoBFuMNMdgMN7GQJsQXtvKY8vlZXpqpSV
	ZkkeJqK2BJW647NZ3VE9R6Xp2CtwFU63Q0XLGwlPecSXI4yF/Kq00yQNFwrW9mFyt7yQmgmoMUt
	3LZsEYnSgS0iuvByg9HMzt0Dww8dbJu8sbPvIUYHgbHanBOCQjka+VlQTQx5oXLFImfN07/Qphb
	+sRJlldFmGJOVEZLsWofNNcmxLbeN0fqvPLfW17VRkUPEjYNyVHxSqq1jYfxhDndio1GH7xA6sQ
	gGK7x5nixBWKTuJnyISsWxT7Y=
X-Received: by 2002:a05:6102:418d:b0:5f1:b865:aaa4 with SMTP id ada2fe7eead31-5f8e25b2372mr2109705137.21.1769845656990;
        Fri, 30 Jan 2026 23:47:36 -0800 (PST)
X-Received: by 2002:a05:6102:418d:b0:5f1:b865:aaa4 with SMTP id ada2fe7eead31-5f8e25b2372mr2109700137.21.1769845656519;
        Fri, 30 Jan 2026 23:47:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481c22sm2216368e87.10.2026.01.30.23.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:47:34 -0800 (PST)
Date: Sat, 31 Jan 2026 09:47:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Sharma <quic_vksharma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: Fix DTBO boot failure
Message-ID: <7d473eubnez5gcbou6mguomeetpotp73q7cjol3kfjlg7pz5r3@yjsh4rd4mwbv>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-3-abca3be14024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-sm8550-abl-dtbo-v1-3-abca3be14024@gmail.com>
X-Proofpoint-ORIG-GUID: bwDbYEHBSReEPJMnF3l1Dch9Od0hBcj2
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697db399 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PGwtHbjD0iUC7m23mMQA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: bwDbYEHBSReEPJMnF3l1Dch9Od0hBcj2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2MyBTYWx0ZWRfXykHArAyE/+xt
 ZX9CvsG6kjHi1yxlutYGQ5L+JI5DDoXNka5cZ06n/HnFIYEJEd+F3ltU+UGebi6aj4CIAk6XHu1
 cljVBKtPnQHFDadZ/DYmwBECBpFkJpx3TWnVbtgJos3QcS1JgGBx7hmkGpRlF43Y+v7UUBtbNba
 iO1mq7OeC4gPKChotRxYBW6CaRa2hkaYxZ4pXPVI/3WH4ct+h3qXh1PZZXdUfOln6Bx2l9XyHOS
 5QWaXokvgb974SCYG+qktI7S4DIh1M+zabo0iRP7Cs5ZPlOit89ND2zhtELEefxIFyIYpy0Cjhk
 zQ8T9NqJdQ/S0MAp3/bxg+ee+M4e9z7FxQCNLO7Mo3ZNEHI/42UYmHQjFzH9BkqJdb6GE0/J7wV
 1xzHGOnnUfdhtdQgMyc0Euaa2kCcWS5/Ymv+5zXPf3Xemo9fj9TkQR1q82tHltt3ZY6GbFurUtw
 XUE/jPfvuCEKv19ZNwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91351-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23707C124E
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 01:46:32AM -0600, Aaron Kling via B4 Relay wrote:
> From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
> 
> ABL requires certain things in the base dtb to apply a dtbo. Namely:
> 
> * The scm node must be named qcom_scm
> * The timer node must have a label named arch_timer
> 
> This aligns the sm8550 soc dtsi with those requirements. Without these
> in the base dtb, when ABL attempts to apply any dtbo, it will fail to
> the bootloader menu.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Did Pavan provide an SoB to the patch?

> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 740e3c238e8ed0f162dd168291f6e307ace66e80..d7cc20e1931904e7c603b800089f00955ecec3b7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -329,7 +329,7 @@ cluster_sleep_1: cluster-sleep-1 {
>  	};
>  
>  	firmware {
> -		scm: scm {
> +		scm: qcom_scm {

This one is a definite no-go. Device nodes can't use underscores in
names. It has been told to Qualcomm for ages. If we didn't comply, it
doesn't give us a permission to break the rules.

>  			compatible = "qcom,scm-sm8550", "qcom,scm";
>  			qcom,dload-mode = <&tcsr 0x19000>;
>  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> @@ -6764,7 +6764,7 @@ trip-point2 {
>  		};
>  	};
>  
> -	timer {
> +	arch_timer: timer {

Please add a comment, otherwise somebody might decide to drop the unused
label.

>  		compatible = "arm,armv8-timer";
>  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
>  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> 
> -- 
> 2.52.0
> 
> 

-- 
With best wishes
Dmitry

