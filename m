Return-Path: <linux-arm-msm+bounces-89895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KLqN1kDcGmUUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:36:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E984D0F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32997B23075
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FC23D523B;
	Tue, 20 Jan 2026 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mhqw9naw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmpXvcVP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408B03D4133
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946615; cv=none; b=qgLlE1/71sxN4WSc7RxkjA/4wokZRAj7lyXa9P8h13TleRGg/Vn+OXe7gGksyBTDnUbq6DCN7Edjhr2pwpg85D2TRfbVyMWqIClBPlj1Qno8GAL2VZkC8FhCjoKYCfNuAzKPXivO5VBRdSJqBk/sqtHJb17J0szgDK70Jk5/JME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946615; c=relaxed/simple;
	bh=IsjGtIkDgzUdrN6ePwaBEYZlrOJK82ZTG0kUiJy+FXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icuA/6xBi/kbqIs0TO9nyBGMDxpmRnDUue4VRJZaKdfQe7scGGqQozw2CmZhYSDfYbrD6WHHk+vqUDZ0Fef9H0ahGLuuPGp7QhvHxsT0NCHbxBG6lcH+pEvA35Bu05Bc8dAfyxT33MO1z0RKUwLJ48ydSRWAjqXK6D+9MPnjE9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mhqw9naw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmpXvcVP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KKj6gT798267
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y6CYv7Tl4oV6DXKYTi16x+4R
	G5JfzB9SKqpy+LoHMFc=; b=Mhqw9naw1Ds8ZBTAJEF6qglZE+8T7pA+pw/yPEJa
	tAckAWNF8Q72rLXcbmyN4GkHArstBC9zcugY1/vzm6c+cJb4BKb/1h/UGo28gQC1
	CHCrz/0nzxPIKOJ3BPEfBT8MT/XztdjEackVfTYGqq59TKhyJQLKwhzmEc2ZDMRn
	10lTeGMSXD5vJlSvSuDMzM7s6TjCuFfnVPP0wraFbisy67c4MuH0ZOguM2wBs5nr
	oikQvvr9jCoFrfH4nEe70D3bNd2wJ7jTh3GnVmDN5zDiYa2EvGKue4TKtTnvtPqn
	aAttcia7HYa4CO/VH+87DpzNtAIGsFtwM7ooOop1g6hcwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q1t2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:03:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52fd4cca2so1472332085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768946611; x=1769551411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6CYv7Tl4oV6DXKYTi16x+4RG5JfzB9SKqpy+LoHMFc=;
        b=LmpXvcVPp/e5lhpV9AVlA+UkEYD0mGrju+MyESc8z1f9BJBFv+KgWMhEjrRZYQs6r5
         5CgPJ2vtbtBm1lkVaCVcyKi8RahvsxYoe/Fnt/pPpjO6FDsPJ140+huY23aLxs/I8jTL
         xqMtPL1o5ozPeflcmU3/WvyZ8I1OrPNmYm19EUQdOd1ibL4+xqoIbcj6WDvohApHMJtn
         T6Um8k21fvrBfQnpcEb1Bu8qkXk4XLl/8k9gslnGA+yxCsQ1uyc/qc+v68larhPOGUsO
         mHCdto9iCjDk+LRD2XW5I4DYfrecqut2mpUI9RbAOBl+AkZnsS2xc5TvBv1KhB/BC8kx
         l3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946611; x=1769551411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6CYv7Tl4oV6DXKYTi16x+4RG5JfzB9SKqpy+LoHMFc=;
        b=nIlCAKXyS2uH6zswBDORXiWhEVokd8XE84uJ3NDlqQ5YeCFLFdtQ4G15F6M13UtTHc
         LMiCn/TwjsgACOAXKOqDyWzq1unwOezVbnxHq7dnaPKnUgR+xluVEu22zB/lDiqZKCW+
         In3WAaO83jtMRedSY9oQFIMIVPaOyVVn0FgkjWDvBbRLI81gpdUdebp1EgtL/5b4iIzT
         V7Jx/KUnliy7tfdVRItrs6xG+vzFT9PcAfi3srVrZetocTmwe0E7p/9gTz5cfTMOwkXX
         aIzk67H9oeoK3We+hjXAHyWsXmCbyX6gtipLltM48oA+L5+UCdZPNWgyXFZLQh2ZbWLi
         WRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNVdriPLEIHXSpn+wlgie81vKOVl7/oISmoaQGB34exPLVcFqnNlY8Q+MDPciPVdH7qYvbXqLDQcn/xmNv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ypaAYifs/gv0q3qHKq9ofjuCinZlzXITdYjmi3jRSbD9IAAV
	B/RQuOyRVn3BIOAfDKnyEawKshSk33yZANi4sQ3apCNxWkiHTZQq51a+5jz131r5wh1QYi6Au0S
	XJJ1JUpnDGauvhQZdyWFPaZxrNZE/7RO92eCVxmYqPuA/h9PWV+KHxwL0HsasB+U4uY8y
X-Gm-Gg: AY/fxX693JYRFBAj7Y7P5F7CGWGP+Dd1D02XLq6x12y63GQ/2gEmL1ZpUl4mzwwyJpX
	7hVcpHPAPZp5fqN0qwJolPSBLJ1ifuGNsPn40Suz5B3z59QI4uuEJmN/y8HGK/ThgTCeO9ThlPN
	kxzcojV9C4UknyRJGRFbkVf5Ws5f6q8lb9PT0NmPuE/HM2ui03hZf0K9coSBot6Hc1gVzzaB1fG
	54d+5+vXVmpHk4OTAbh+U1XHZN8gXxgdHYwH5lIFB91KCxTxF1hTRqIx93NtyjmLncBA1ygxX4C
	Orb4M+PeDXPzfjzhV4ZGOb2JCgIkpC5H97Kxcf/8CJteGEYf/TFF2KQkpj9qG7cWDd+2LuRFq4N
	zhUjdZqsQKccrtvWTLGhtUqLBqz+nm6a0okZ1fLYcQpej3ULlBnlRYiZja6o71Bjm1K9zdtK2z+
	jZ1k9hvkaqf7+xAu0Z61XwhkQ=
X-Received: by 2002:a05:620a:29ca:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c6ccdbf247mr448374885a.26.1768946611114;
        Tue, 20 Jan 2026 14:03:31 -0800 (PST)
X-Received: by 2002:a05:620a:29ca:b0:8b2:e922:5282 with SMTP id af79cd13be357-8c6ccdbf247mr448370085a.26.1768946610648;
        Tue, 20 Jan 2026 14:03:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8e0e5sm42321881fa.17.2026.01.20.14.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:03:29 -0800 (PST)
Date: Wed, 21 Jan 2026 00:03:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc7180: Add missing MDSS core reset
Message-ID: <xdllt4b42d4srxaqszlk5tadjvd5zyj5oae43sgwllvzcsva4i@2er45lhhfwij>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-3-0b1b442156c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-3-0b1b442156c3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=696ffbb3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HRRn__jHw68NO7zq-skA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX8a1/aXIVLk/w
 OyWqeYzb6+jmh367IsdcDkh+CH5VmD7lkeOrQ2TuhSXqUBYV/8E8Xew6cZXCahbsR0OGnA6FoiM
 /NHzNVymyHupM1LNM7/EkH+tlWXScxYCGu3Sc4TK7Grlu0slz02auyIsCFPxKzZ7gyNeFFbzr8p
 WSEhYjf/QZ5jtavpJEKo4aihhzHECaVdZuxkErEb4LCF5+daBVxQze+mhNBChiJF6eFER/qGBG5
 P0TmEPARGsXrqr5NNJ4sSmB3jeTTxPRvna4vBCIG+wABeIX5ZL2/xz//G3hD9YjlpmmSK1IitL5
 muJwnvmjMt/yUdZIxzOoqK4keOGwXqfccHP1mzDa9W8UgSmSwIjaYiF4Y0hykiA2MpBnlYJZb3d
 Z1xiVpSomQXFzvhXqGAQjtX5zKbeKqNSGfCZ6uyQ3YzbaBMm/2BwukpCK0cCjlqP09rznYrhrVJ
 QG8bkp/fpMimXvxCjPw==
X-Proofpoint-GUID: R1YOemUtiU-Dji2uGrodV60QNItbB8BW
X-Proofpoint-ORIG-GUID: R1YOemUtiU-Dji2uGrodV60QNItbB8BW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89895-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 61E984D0F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 12:19:27PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> To make sure the core starts in a predictable state, it's useful to
> first reset it.
> 
> Wire up the reset to fulfill that missing part of the HW description.
> 
> Reported-by: Val Packett <val@packett.cool>

Closes?

> Fixes: a3db7ad1af49 ("arm64: dts: sc7180: add display dt nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Let's check that trogrod users don't have anything against it. Doug?

-- 
With best wishes
Dmitry

