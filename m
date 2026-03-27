Return-Path: <linux-arm-msm+bounces-100490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCmVOo0Lx2k6SAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:58:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F0B34C2B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 615C6307B547
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054093A0B1D;
	Fri, 27 Mar 2026 22:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXbgFEkx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alTGfJXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D0739EF2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652258; cv=none; b=WTkpbV4/88vp6d7ZNHQBt4CeILxRGc3jaQUOyePKUD1hFy67fF/wwTaxcWGWXdyZ9oi529B6Qe3CQqDyz1gbs9R55hpNiITwgLHhHKnXwjs6dk/LgYNqg+zhRSOFfXKli4+PEZxP/5ULtssUetA8L32mqn4h/kckVmlVhXhBibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652258; c=relaxed/simple;
	bh=mWr3INx56v17cs1bsy22XJTVS9xOy8x4DDFWsqgvvy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9H1OmNmVz76lJDTuPoHU/duK1J4yFR7jiSv1ER/dR2yfN/qZiVmk9inZvFmCLg9DbShqSHu22oeZrfxYIU+VJO1zf8vydMoBdI2ArWs+8AtmLIkwNVixBixQnYIvbxohpYknG5lE6DZ+We1lSDJ1J1yXVwN2EGaLDNyFFDLv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXbgFEkx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alTGfJXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RMo8Ll2066238
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZD0T2UGNWyjaocuRVZIPGls5
	8uRnomBelAEtEdMD7Bc=; b=LXbgFEkxwdptNZ5NlStNkQVeG0+zkErpr7g1hdkh
	D5YSMubcjdDfNB2k4oooVFglvcGyuA7HaqsNk1hjQixBz2lZCbhRDf2PLxMI4jpf
	z7+P5+ZfVj3TbHR/vergFA3xy/CJS2ihzmUAxo4zAuClCwaONq1AqOci9KaZ1+4Y
	s6LPMx52rifD6nq8vB3wR1k7FAi6/dQD7Yv4TzOs0BFHXjB3krKvyoSk2Zx9UnZx
	DD2aDOo+Gf2yRDpfuoZrmRI2gan1V28z+jvMF9zBDgwEprFeDgBdeUjbGIRq6ide
	BozXbP3Eij4f2Qzvs5845yHX7x1nPjcYB6boetdcxp/qOg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d631q00fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 22:57:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so6072951cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774652256; x=1775257056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZD0T2UGNWyjaocuRVZIPGls58uRnomBelAEtEdMD7Bc=;
        b=alTGfJXCcCF6Qew9FoOhx2yjayV80prsU7wOwmJs3rwMdoUF3MuHlhrzWWTMkRyH56
         3xXEwSWYdIMSbpERHNrzj+y6GQlWjD/OobhGnrSLpa6Xu1+J8ttbqCWzWJ2go+nQ1ygj
         ZXemoNYjoHxvUxW+odh+9g6tEVCSavaqCwmERUoSp+LqJgB13ECWvQXZGJhQ62F+gRmk
         TVnZknis03BRBtoisboAWtpo/iJ/AhqY1ASsRy4Sw9WYjbeSvNrrYGYqbK7k3hvay8+3
         nFZ/yZZHM9Wk5MwqSaurMnHMtC/SQ83V+ZI/6yPZ6yCWey6yw+lvkO6d0Khg9r/EUox1
         JIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774652256; x=1775257056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZD0T2UGNWyjaocuRVZIPGls58uRnomBelAEtEdMD7Bc=;
        b=lywXOnUCR5xo13cU620DUN6C4AZCEyboxl0p8IQajwPOaXyJilA1+3REAhRcZITsbi
         yNGOUgJ6VLUx0xFu6Wn3sFKBGdqgedX9Xdg7M/lP3peCFJTCiWSnJVYtYafhVF22BK6n
         AJaa87AW+cU/31va7n/3AvJeRHYMrrMQqCbMA4Fmlt7gNnkPxaxl5KcPu8MJHgr9NKO1
         1CaNIWNCfdo/dk+Fjt/PP7h80+m7p+020GO7YTnWKtC8B6f1KWKXGwx//h1z5+mS6eT7
         Sv+LeQ7mjcucqWlBVErLI5+JlYZi2119VYTnGj6OKgY0G9XGzf6WAiZpy3zyxX7nkiYD
         fuUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPSYlTv3S0i1q3RpRVqrNk+0HIIX/Q4W8b1eiuduv5pEzEo4y27HmplKXmSdnJVcRQigJ6BTIinYONZDpE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3OtIJ4BrRNyl4WIeV/vCqvFpoocZngiZCwMni0tVJwEAmWG16
	OcQa3/OGk+AGdLGd3GOda0NWNg6M7VPuGhlfuPgrCNGwXx27/4rICB9CRRP4N7koF3r1YZ8n10e
	eR07wh4gUqBh5LokvawXn1KAFzfnyDdCnL3ojJTEZmcEWtsPgblyLpBYMNX34kT3a6eMeglWd/4
	Fa
X-Gm-Gg: ATEYQzySg5KXkr0FLzduUVwIQR51HsNXzmb1piK5+HNGUkMA11OCm49g3nr1YqyFCLR
	+nivyNlUl3bS7rOHtWT69ApCWXGoTSlMiOn7tEOioFPL4hT7Pk3iddCL2yB4PuuxpYv2a4aVKHT
	a6Ot1TuAE7IAiJW4CtaaMZ+VBI3V6v3RIKxf+q1aTeJjFW1gTDLeSn9c7qkAI6CU3QJwfdQOARp
	HBe56+YRy2BEKt+jbXH9xoXuUcsyVyHSbYrxUPz9kGufTGeLbut94YjbwmC9i7YLYZ5b4rHsKom
	QYpceLHrXRfx4fzHVx1CJjE1TH93vB6afizXwGMuNi8LqY4jwJqbju0b9DLPBJHWHh45WEJ8uIF
	S0xJfouEAz9tEhtUQB+/sIeGQaLEgxgpkmNTz3A1PsOB6qaNoqWP1Yd1SwcXK+jrzWtgnFLh2VG
	olQp23V+xEMfomMdXOT7JFN3QfBMAcTiQPoTA=
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr91618581cf.10.1774652255715;
        Fri, 27 Mar 2026 15:57:35 -0700 (PDT)
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr91618261cf.10.1774652255243;
        Fri, 27 Mar 2026 15:57:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140a4desm70884e87.33.2026.03.27.15.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:57:33 -0700 (PDT)
Date: Sat, 28 Mar 2026 00:57:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
X-Authority-Analysis: v=2.4 cv=OcyVzxTY c=1 sm=1 tr=0 ts=69c70b60 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=ER6jexHYGgKHINCZH0oA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: NsEmq26toZqbdR_ACUlTXuM2ovPsYxzE
X-Proofpoint-GUID: NsEmq26toZqbdR_ACUlTXuM2ovPsYxzE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MCBTYWx0ZWRfX4h72l+/54PrO
 6u5hT8oINSjC4NwlV6Pvz4sLglBSQXnUQLNMwcPrjR7DiWsc/6473kJwoNQ5mmqWvXbSFPARLrO
 I0XkVxBA0sy7wxyWQIMQurihZRsFxbJZSVQ55cpT8KunF8lp8AP3RY6wiXzpwHvDxfMZCHnE30m
 fno+HsGEVyIOS98xXTEN7/uUMPEJROBPxQtReofar+P8bS7tomB5enVMM6tKwWbqzTlTVmvfDcr
 Rzn2zQ2V3LC33lvfq6LaOB9XiRwjA8vNJP+sgc4JkrWdIEHrRiP8BBUW717lo24Zqq2a46K3Prg
 8PRe70Kna9LM8BPRMecQi15uMWItiEJ0pOzySpahAbX41RxmdpmgcwHIZzhHvemZ5+heX1SwPRJ
 +D99R5nqDpfVn2nSYKDMbzWYQmW2kbeZHX+xFkAKDaVLEzRt5/bbnCNGiqUfAXwZWClJbUHU1B5
 ZVPmJcE3nClm81Ijzdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270160
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100490-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70F0B34C2B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

