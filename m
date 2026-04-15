Return-Path: <linux-arm-msm+bounces-103311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJu6LIT932ntbAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:05:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8A407E4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 23:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D7E6302E3EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 21:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9B834751E;
	Wed, 15 Apr 2026 21:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUiTObtd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D731282C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 21:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776287106; cv=none; b=HyQzkZj9spgoh0WsBiJEdngx2n3e/JEFuTfPVk7dR8WgLJ2dNzTIAtB8y1i6PO+0wfBnGyCvNgC/tD/l5JU7dZaCxL8XLExrLM+UU39r2SGxl/GQxWLdw7sZw97JLfhgQwuEUpvNWxQIqZKVlsUY5g7ysCXQ9Xo4bYC006Re/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776287106; c=relaxed/simple;
	bh=xYle8OALelDvpnEKaAewXH1F9igqeAq6EIsjrDcymEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EM5i/Nnmk6vdUgD1QXI9hvvSppZw2qU4Uuty9ZuphTaEg+zHM4VZlpFbSbrxejiypQ4xKWnoNx063QUJVzLHD2JMKJSK/nQLX+d/w9DDOZmh2Y1hOhK30fJ549dnZ7lMc9HS5rWhpDWYzbsFv3iTdBoVm6S8C6l02F/tlf/LXN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUiTObtd; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8a48deebe95so58873196d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 14:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776287104; x=1776891904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3h/QztRQ32hYvS/TluXhLyLjB2ztnFIYcWLAXwf6aE=;
        b=VUiTObtdbtuIVphLWg5yjP1AaYunCAFuScu/bBC/tt+OQc7zls7fKiV9D2LFerACIl
         MbjXFMzykJvffMHA+XOvp0HPgm4z2a87rjwjO5p6EXdDdMQGcwX3Y6ttRBED8TA38MCB
         DhYhTHBFrUfuRF+a0no1vPupv0Bq7/Z8MhmNeElMeuWia2MnsiumpDBg0Wv4/en7buP7
         Id2vNTwy8eG4oI5Sfntoa+Ze62D2RKDbF+wpg8nh4OoL9StzkDuNrdsOTcA6cZo0WWgv
         mh+b3Xb1jXmF51PLV1lthzqyviLvgv6CmpYy0MeDcIB51uvHr7Los/MR2eTDvwq3faHf
         fs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776287104; x=1776891904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3h/QztRQ32hYvS/TluXhLyLjB2ztnFIYcWLAXwf6aE=;
        b=gCa/GLywUeomsGwrEri0n84jKhTZAfzSVmItdp9eub6dCGZ/WPXKytGGr1dWIgeAzI
         sRncsZf5J4mUgnyYWfz7T7SsELGc4PyJ/EqTxIsvDgN0etBnqoKwYFRYkRFowEoxuOeJ
         3JVcH7Q+yAcowdV6rAzBONY52pcugRyGH/2ky0WSV4D6u3IiAA8YV0vj7woWM8swyM7g
         3nM5cEFjEd40dpfO1673LccOIP1sCKvP1nnSF+bZFrlbJAcEQB12Lrr74uz0JxI6upFe
         4o438wSLfc4kmD6kMmS9lVLXP0HgBEx2Kj5Ye4nIYeYsgZAuab1yaqfXQCS9vgFByJYN
         ZSuw==
X-Forwarded-Encrypted: i=1; AFNElJ8HesHiW6PMpkId9E+iENlBGNNLM0kg3CoqGJfIX9bi+YvXF7qsNvk2ONHHHUq3TqU9fNQOXlf710kLmE3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzGjrtX8qL/63bPxFoRojjywMsYtMZTcbsC7RMTJEqlj9WDvBt/
	04lflk6iHk16Ltxb22xxLfvUtjABcpjTP3l6fMU1T70WpvRk9cYmUOPF
X-Gm-Gg: AeBDieuyK1qzF2WykWFf1LYWps3zQpr79P3sMlUsTkTbcA2TCZr393dot+Yd6a3WbgK
	VEC29plwSkFapTqimM6wCgpQoAIy6hoPD/iJLnVHSZyhHbdqYMbeD23/dyz05wcCnogdJt5npLK
	aaq81nPEvcNbHabuGzM4r4mniRv767a2UqxtaylNm++xKYwHlrevZoESwQXiJP8+8tEZOz+gr7g
	Oehn2pVNRODbyMBXT0wUpk3xfhJg8spwLEhL3aZaZfu7M+eRGPG0czJN/i2+4b61/jnzpVfALIo
	No436HhL41WQ7alvI+UFKucgtIDPEq0UD8bOXSt5gHJHXmL36gyq2KZJR57xMGBstkaDwaEUQQp
	q4QNQ2o6RZWrhdVWniLpFtsx87EOBQKag0uxDNe2FbFnrsnIEs8sfwy27pFRETmTaiN06LS9JfD
	/rHlNRA6NtjdBP5FE/LFGoiUu45A==
X-Received: by 2002:a05:6214:810c:b0:8a5:fcce:1da5 with SMTP id 6a1803df08f44-8ac861567e3mr324194876d6.10.1776287103955;
        Wed, 15 Apr 2026 14:05:03 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6cb9eb87sm19935686d6.32.2026.04.15.14.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 14:05:03 -0700 (PDT)
Date: Wed, 15 Apr 2026 17:05:44 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm660: add thermal monitor
Message-ID: <ad_9qM6JjizihQwY@rdacayan>
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-4-mailingradian@gmail.com>
 <e72ede03-94cb-45c3-95e7-63dff0ca3888@oss.qualcomm.com>
 <aaXKyIJQA9SFqt41@rdacayan>
 <4311c618-f084-44c5-86e2-7f97661d887b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4311c618-f084-44c5-86e2-7f97661d887b@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103311-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.85:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.13.72:email]
X-Rspamd-Queue-Id: 27F8A407E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 11:15:57AM +0200, Konrad Dybcio wrote:
> On 3/3/26 3:25 AM, Richard Acayan wrote:
> > On Tue, Feb 10, 2026 at 10:59:20AM +0100, Konrad Dybcio wrote:
> >> On 2/10/26 3:18 AM, Richard Acayan wrote:
> >>> The thermal monitor is used to monitor arbitrary ADC-based thermal
> >>> sensors. It is suitable for use in thermal zones. Add support for it in
> >>> PM660.
> >>>
> >>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/pm660.dtsi | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
> >>> index 156b2ddff0dc..7cedf6980b34 100644
> >>> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> >>> @@ -197,6 +197,16 @@ channel@85 {
> >>>  			};
> >>>  		};
> >>>  
> >>> +		pm660_adc_tm: adc-tm@3400 {
> >>> +			compatible = "qcom,spmi-adc-tm-hc";
> >>> +			reg = <0x3400>;
> >>> +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
> >>> +			#thermal-sensor-cells = <1>;
> >>> +			#address-cells = <1>;
> >>> +			#size-cells = <0>;
> >>> +			status = "disabled";
> >>
> >> Can we enable it by default?
> > 
> > This is for the ADC thermal monitor, and not the ADC itself. I don't see
> > the need to allocate channels just so this can be enabled by default,
> > since the thermal monitor's purpose is mostly to send interrupts when
> > the ADC values go above or below a certain threshold.
> 
> Sorry, this fell through the cracks
> 
> I see your argument, but at the same time, there are channels that are
> always present (e.g. VPH_PWR) and any way to reduce the boilerplate is
> welcome

If you saw my first sentence in the reply, why are we talking about
VPH_PWR? I don't understand if you're asking for the thermal monitor to
handle a voltage sensor here.

