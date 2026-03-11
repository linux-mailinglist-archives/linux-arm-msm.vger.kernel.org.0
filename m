Return-Path: <linux-arm-msm+bounces-96854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE4HGBjxsGmvowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:35:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A925BFF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 05:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48E9730659F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD712DC32A;
	Wed, 11 Mar 2026 04:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4Y1/slm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M72lBZ8H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7A12D6E62
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773203729; cv=none; b=VLezSiG6KueAPceRLV1wqCwdXq1a93d+sI3WWDGDjGgwIOXjV3ycG8KDMuFf4HXzD55LKCY6X9vnujZKe9Zy4kMYhGQZ9oB6K3qbZsz0cGvNNs+PmyjwG6221s7svLqWvBNO8CICx9Loiibhd6JP9L+UBZTIMn6O5fm5C2hPFpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773203729; c=relaxed/simple;
	bh=K3V/AhzU3ZVoNhCPclPR3uwGkKxbiNaGmUxawNV9bt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZstvAF8feHSK95gHIiI/EjOBAtSYPRpbg3ZquP8uZmyISgFAQ3HFkJtgLotpYqwjKcntkEi2cc3sABX82LKuMa31hAXO0qKBwUXawmCDh+K8qoCKR43pjA2w8BC27AYoNtYIPsX8+uVCUz+frk1A4Bwx/PvIR7GQfgSejBYkSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4Y1/slm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M72lBZ8H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3NETG2179278
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0O+PFH1powDcMrvGyf6l9t4Q
	OBpBe/60gS8jjz22anI=; b=X4Y1/slmJ56v0CzcYqS4NsoBkvOSr6tMwB5CEqLM
	7+30+Fq2R2z92Qraq0HgLmOUppV6Rokp3qMKb1FqP3ny56dI6rdpCoh77H8tZbac
	kPM9MfyePKGOzjsoSdnv9VP3xFW0rNM+B0uE6gVaZJ0UX/DdQ4K07xbmOoq9dSfJ
	gugbQdCtHFUQ4VsTJBfLTGebqOTdunNnXk2HJH6JPQ+iDr+1QUZVpWSmo5OPy5Ks
	9IxRVGWlQAw0HDoPJxruRmHET/XI7FEtc9C8wygXbxSDGIBJwSvqqDAszE3FkaeK
	yMxrPgiahzXXXkR1VX+A+2R1Vl4mFc8wk5IadoAKdTQpNA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvssvpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 04:35:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56b1222c181so3915549e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 21:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773203725; x=1773808525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0O+PFH1powDcMrvGyf6l9t4QOBpBe/60gS8jjz22anI=;
        b=M72lBZ8Hnq7dw4IEv8emPF/TcOiLZBxDpY1xwfJSGWPEEtWy6ZA18b1KSchDR8duDa
         gC+5ggSgukXOfNOcFOuBxn/FU5lh3hyaegftoZgS0AJcGy6lOrDLW/tIADtU/dyZ0sqS
         Vjb5bR9o5tBJ0RpeSll0xTD4AdGFC1DwkNSpkyYkfp/CMx2qCCpN6fZmzfsqLkhUw34+
         rxm+ZyN/4nHVnyS/Qfm/gvLERqBtqbARYvzjVY1PcA0zrfjipO6k/qad+qcZyHvM9wbL
         r8almBYOkJ6LNAFOUrS44anmoUAeauHowdTDXxjGZqkeJ89fVXYrA15HImBI6PCRfEiU
         tVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773203725; x=1773808525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O+PFH1powDcMrvGyf6l9t4QOBpBe/60gS8jjz22anI=;
        b=KwligsrGntJNa5yE/+bH5VZqD4wT4zCM8PuUdtPDz+HX3dxuourOLpa0lxuarxiK87
         GSxJnZe0RBmiW5I8t3CspZlYNozbJQQb3Gb+2aMvPM9GTRHk7Hei/OUlEoe6TlPia0Qk
         RCzByzOKm4ShozMNb7tbrLSGvnApD7/m86L+xNMmgwEpEIui6TxgUcaf97ckHD46bPUg
         8ek4cz+PBFYmxv/MszLpfw2P3PeTjl1LYPPmRPcgJ+zR8TZXg5Kl28rXfAoIKBu0W+6i
         hfRcqvbfu1CPeqVUXkjOLyHoByFqdCdevHP+Hx4plhl+VbZCh3fKPUEOsBct3SZcYdMz
         +3oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV1HWle1xSh3zfPpjFylzA51jZxHaeUW9mStxN7Ej32QTi8mmREUHiWDX+yYZkh7i7Zyism9Rr1NLBMjOl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd/oGIW8E1U3BtLsQnV4/aHzIOBxSIOBTDH1nX7xEVKUzFFB+F
	T+ZPzbdosSmiF8i3TAyNMIlT2RCZF4VIQa01KRKOYwAfryrt+Zz73DdtxGWA/edOibLWNozuHg7
	V36Ijus4XOPy3YC/qKbA9IA7mc0Z/vEMBnZSVWQNuyWhUAE7fRxX1Wkkc2KDvlJy/JLzO6kl1hY
	nr
X-Gm-Gg: ATEYQzxh9L0PW6X8ktKliHYkdhVJma77DKU3ivIqcigwuoqOg5EGJ5erUskrLYfNuRV
	9r5tvO7RtSl/d5O8G7kgZlDcH0Zm6mUjhWREHuPgkozCpQps9thaOufU0EBF+IBu+7x0IEL13E6
	q3C5d2NiIWWOCCst5KcYtYTFrp029bOBpfAQiqlofkhe/Obk1DKe3jo3jwQTJ8gBxHlptJ6nG9D
	p55l49ywLQWy3KnGHKAtOU4m8rDMMUiRJkC5yTpRYdXzFnBNDW2MU4/AWtkEFYDYAORdihr/CpV
	HL/cndZmtbMP2MmnesC23LtrvdfFsFM70VPvgzAesLTtBeRoyOmyDLd64ig3pM2z8yPBR4r3hc4
	iBFl6QiDUr+s958h1Qn/AFrSHGi+ZV8KRsN4IKZOTqruEV8FPBlcnqzxeriSazZgnzaDd/wRdYN
	+xFoweFah4NwQ+ilVWA7sI/+GV6lnFfaWCXJU=
X-Received: by 2002:a05:6102:cd4:b0:5f1:b9bd:ab9f with SMTP id ada2fe7eead31-601deed4657mr436791137.21.1773203725307;
        Tue, 10 Mar 2026 21:35:25 -0700 (PDT)
X-Received: by 2002:a05:6102:cd4:b0:5f1:b9bd:ab9f with SMTP id ada2fe7eead31-601deed4657mr436776137.21.1773203724881;
        Tue, 10 Mar 2026 21:35:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67da7aa8sm1689441fa.15.2026.03.10.21.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 21:35:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 06:35:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8250-asus-obiwan: Add ASUS ROG
 Phone 3
Message-ID: <hdgyagvc5nl7io4wadumq3enb4yqj4hz2be2e7mlpyyxaepj54@zdsjw2ezd4r4>
References: <20260308-sm8250-asus-obiwan-v1-0-3c72941eb796@pm.me>
 <20260308-sm8250-asus-obiwan-v1-3-3c72941eb796@pm.me>
 <4df4b8f2-ecc9-447b-8a69-237c2a5841a0@oss.qualcomm.com>
 <L6ofIX7HhqB51HZm7djWZk4K4Bl6g7_AUnOIzqwJZXLyIQtjsJa3kU7WW8343wSFvBkxY2gwu02zeUQTGiGL89D1Z5yzZD2891aBgPhx0T8=@pm.me>
 <UUm2j5FomDWKGaRRekRrUQPsOyj9vm8aMUeFToeZCvtSR4v7CWuNA0diFFUY_-OrK1ShlfBYhXn57Nvq2y5Rxxr5xOA0K__BENXntWbO5GQ=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <UUm2j5FomDWKGaRRekRrUQPsOyj9vm8aMUeFToeZCvtSR4v7CWuNA0diFFUY_-OrK1ShlfBYhXn57Nvq2y5Rxxr5xOA0K__BENXntWbO5GQ=@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAzNiBTYWx0ZWRfX+Jmi2utSKXIj
 HgwVXmofE7eFpW0Y0R+rN/jct6pcqG4QGtq6iDaxgkPH+Ygn8jdrNMFyjKJAgsZsSfvfPpzOrte
 cgxkW0lTFyN4p+na/s6SPh/U8bFrzjfCk9LG7s1pH79wQjn2KTggy/k01bR0rwlXQEGmX0PgZnj
 wRkbb8F7ah9ckUwQ0x+zdzpJXXMqKtNoMfmMkGkawqzK7Lnit1IhALLQWmFXJSOPELtzowH0+Hz
 S4TLlKY+866ut5eI+i1pQh9a2AHB3EXsugfcgQlSJ/TDXrXyBX5aJDCHHuLJKDv3Q2x6S2GnoE/
 FY79L0GtsU+P0YSD6ePUuCDONKxnsqCT4kPPITYGtqfBNQdFqYHBkmbPTh3dz41lmnoey6TkUfQ
 fZafEI5MuQsnFMw+P8RtG1P5XwtbEemJuogPMRor5iwip8OWpWJQt7EDta7raMlhDvsyJdCCxA9
 0bRJi8n8KdGVKcy2ykw==
X-Proofpoint-ORIG-GUID: xAcWsGSGNa_rHG8Y08v0jcbJJCDs-pMP
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b0f10e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=xyuIjJgyrYC9HIK4Z-IA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: xAcWsGSGNa_rHG8Y08v0jcbJJCDs-pMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110036
X-Rspamd-Queue-Id: B28A925BFF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96854-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 02:40:57AM +0000, Alexander Koskovich wrote:
> On Tuesday, March 10th, 2026 at 11:10 AM, Alexander Koskovich <akoskovich@pm.me> wrote:
> 
> > On Tuesday, March 10th, 2026 at 7:31 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> > 
> > > On 3/8/26 9:40 PM, Alexander Koskovich wrote:
> > > > +&uart12 {
> > > > +	/*
> > > > +	 * Debug UART routed through a mux with an enable line on
> > > > +	 * GPIO 170. The active state is unknown, so data may not
> > > > +	 * pass through.
> > >
> > > Hm? Is that software-triggered, or is there some sort of a debug connector?
> > 
> > On second look, it actually looks like there's 2 nets coming out of the mux into the USB charger (bottom port). So could probably craft a debug cable to test this.
> > 
> > Yeah I was assuming that 170 is what triggers UART to actually work on this board, and that bootloader would enable/disable based on a fastboot command or something.
> >
> 
> Picked up a USB test board today, was able to validate that UART is
> present on A11/B11 (TX) and A10/B10 (RX). It is also enabled by default
> and the enable GPIO is active low. Added a pinctrl to v3 just to be
> explicit about it.
> 
> Validated that UART works on this device, nice to have.

Nice! (I hope the UART pins are documented somewhere)

> 
> > >
> > > Konrad
> > >
> > >
> 
> Thanks,
> Alex

-- 
With best wishes
Dmitry

