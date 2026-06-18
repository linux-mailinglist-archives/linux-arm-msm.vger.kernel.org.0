Return-Path: <linux-arm-msm+bounces-113693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QZRPJUCQM2qYDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 08:29:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C369DD85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 08:29:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EqmCezUi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113693-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113693-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF15E305C5F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 06:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F643370EB;
	Thu, 18 Jun 2026 06:29:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8870146A66
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:29:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764156; cv=none; b=YGKVdZu9Ofo+z6nvV3wTsREGfnQH0YzXovmf1rJ3DBvSX+JWyhOji1FWZjUSScg3ajossR+hw6pZFL9ac8k1cvXvhyHZUCeZgqJQ+Nub9baRCsSBEAIXWqUPd0mbaj9mwmp463/vg2wQvfxEOGKZCfd8m/vbQxe1wdaFr/mGNFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764156; c=relaxed/simple;
	bh=6uEUT4qP1wOmOU/2p/3q3dn23U+/yYEA6rSJUqAvQ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj1yzmW+zFO63P85mBkyRQ45jHfb9j35d9HFa9WPVmqJbcWIMXAU2wiljBobg4FOQBHkS4kE01Y20JgX4MWNUN71v34q9lxDOuQ9Bir9NuJVpDoH7+nI7+4f8BZJGB0/Dr7LH+TFvN9QWMIkKvlf6yJc290eNxfSUZ2CHJ2dZ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqmCezUi; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so491101a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 23:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781764154; x=1782368954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3rT78+mh94p30fmddvTsOsxlBAZusjF98/VgMVvL8Y=;
        b=EqmCezUiIoAyhonpK6XDX+5dLcNRbP8M2R/v77ileoMnKS1xeWYVS9mRDwd5S3SAB7
         pOS/K8qfGa/Ahl4VTp/Fm+pgMilsccanm75AIQTpZt1VXlg3qlYtRuFov+mL9tsNR5gW
         cq9h1yyvuDgrXfxvhiaSr5youy+2U3PtSzAA4NaiRZNd7XtqDZS9IuDz9+j/R/4VBR/2
         DU0ZpAwNtIomEwQwFnh19jKCHvvXHyn6k1lC4bsXPT5RBQ4wd4sLNL9PCOhRwkCF6oa4
         uI3P8qcfT4iUz3+FzcKrtLHNfsa4n+zhplOjTqs4fR1Bqmcj6PXLblVkCYV1NPljNbXp
         5kFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781764154; x=1782368954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3rT78+mh94p30fmddvTsOsxlBAZusjF98/VgMVvL8Y=;
        b=PAwd3qVKqLn/AzT7gtsJ7pA5XNjz4qesovV+Exak2xs2PPGs8vv3no2lb8f+cZvmw3
         CgpG5Uqk3MsAgvKpxbMbdDW2TMG0UqyxpSBsh04BrkcmlUjHdM9QcScu+PzN6GTzCB+i
         NKAAxx6srHVwL+tREiaf1P6vvj1o8QVhSRSCA7O3KeR0QoEPIfIDvpIx0aQMauagT0I6
         k41xnuPx7Y4nkS90iUHFr4Uoa9+p59x9zp1ggqtrKh1kh3Xds6IM8hS8dhbx4GTkbXFS
         YoKn7ZwqbIQPAP9efg/gMrpuoJwpLwblNu751HFtJfxRcVOCV7NN2yCRtWXc6hX/7wMz
         dykw==
X-Forwarded-Encrypted: i=1; AFNElJ+B3Z3J7f8YHRIKt9Bn/mo+MHRgqiYemr0+GlQ/anZxuQME0d06oOmduzUTLbPbpxSKHSQ8Ttwz/Flbg3fA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+AqcVU6WZFN4IEza5Z3aSgUQ/L8bvFbny34q7e7wisTJBHIv8
	YIu/Xh0LKX9KZAGCjzxRlJEBG5LOXaPSyro2HCjnuH4dhZieYbVdW0Xz
X-Gm-Gg: AfdE7cl3fHy8Ov4JqTWBomsCsHjCawYwCY2SwZmQA2OEIVVZkc5tjB8NjPW7UKbxUSN
	S8aitv45gE67xs/osQSvMH1Sy+0D05BEUWVY+HSwn1ZJwigaPCOswr1xIABvtXAOBdMdCCuxlEY
	TMyjSv8HxjeC+jaZAIZbL9GNxQ2LEFbW5/iEqQhgaq/uhoa9ztsD5dEezFhCDM1UVi13vNB0z7/
	sQJfLCP+XZpVgv9lHi8q0plRXB2kXkbC7DSwTCdQVV5ufyybszGb9E4Dw6ogD7nrtnt2z7JjHgN
	I9Y4uRjZYNyT7QTKouWMAjqD5ymg/3QFFmpQR5IfBB6JverZ1jfkw7McXwF3KRY0fPimL5ZwSAp
	1buE1HAnhDTxiDaDfZTp9uK3Wfm6OH/5VeSWwgDiXnNecPyZwSvin3R/TzSFAotWRNezkbpJCey
	qD1h0ytJEETuQTjf8rwyOGf/VI3Q/aDxVt71VUso4cttk=
X-Received: by 2002:a17:90b:4b89:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-37ce449eb62mr2607325a91.7.1781764154038;
        Wed, 17 Jun 2026 23:29:14 -0700 (PDT)
Received: from page.local ([2402:a00:163:2ce9:b105:207e:b570:6867])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521efb10sm8200881a91.9.2026.06.17.23.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 23:29:13 -0700 (PDT)
Date: Thu, 18 Jun 2026 11:59:06 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <ajOO6bx3KmYzhVdy@page.local>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
 <aiuGjH4qeOIXXgqq@page.local>
 <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113693-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 049C369DD85

On Tue, Jun 16, 2026 at 02:10:44PM +0530, Konrad Dybcio wrote:
> On 6/12/26 6:16 AM, Ajit Singh wrote:
> > On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
> >> On 6/7/26 1:36 PM, Ajit Singh wrote:
> >>> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> >>> QCS6490 SoC.
> >>>
> >>> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> >>> support along with regulators.
> >>>
> >>> The UFS ICE block is kept disabled because enabling it currently causes
> >>> an SError during qcom_ice_create() on this board. UFS works without ICE.
> >>>
> >>> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +		vreg_l12c_1p8: ldo12 {
> >>> +			regulator-name = "vreg_l12c_1p8";
> >>> +			regulator-min-microvolt = <1800000>;
> >>> +			regulator-max-microvolt = <2000000>;
> >>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>> +
> >>> +			/*
> >>> +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
> >>> +			 * VDDIO and the external 32.768 kHz oscillator.
> >>> +			 */
> >>
> >> Sorry for the long review timelines on the previous patch, many of us
> >> were out for conferences..
> >>
> >> Is the oscillator used for that WLAN module? Would you ideally like to
> >> be able to turn it on/off?
> > 
> > yes, oscillator is used for WLAN modules. Oscillator is powered from the same
> > VREG_L12C rail as WLAN VDDIO, so there is no separate regulator control to put
> > in pwrseq. So I think this will work fine?
> 
> Probably? My point is that you marked it as always-on, so it will *never*
> turn off right now. For e.g. Qualcomm wifi, there's some timing spec that
> needs to be met wrt delays between toggling various regulators and GPIOs
> going to the module, hence I suggested you may need some pwrseq inbetween
> to achieve reliable powering on/off
> 
Right, I checked the module timing requirements.

The module requires VBAT to be present before or at the same time as VDDIO, and
WL_REG_ON to be asserted only after VBAT/VDDIO are valid, around 2 sleep-clock
cycles later.

On this board, VBAT is the shared VCC_3V3 rail and is enabled by hardware, so
it is already present before VDDIO. VREG_L12C supplies WLAN/BT VDDIO and is
kept on. The WL_REG_ON timing is handled by the existing mmc-pwrseq-simple
reset GPIO/delay before SDIO enumeration.

So I think the current sequencing matches the module timing requirement.

> Konrad

Ajit

