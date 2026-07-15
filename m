Return-Path: <linux-arm-msm+bounces-119216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iV8AKe5lV2pHLAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:50:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D891F75D1B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:50:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=zzDOhNjd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119216-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119216-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B70ED3030E87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1484483A4;
	Wed, 15 Jul 2026 10:49:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7B446853
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:49:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112582; cv=none; b=Epq4kiEukxC7AS2wwcBFwWkb1bEOWqEh9fQhdpWJmZDTy/9uljyVYKRjwkXOixgeY0fqjeCTM0ncDgk/ImQlAWEl4x1rPOVzXP5fXZ0OruuljG0/5cQZi8y2r6lWyBr1Hk8k3p8eoDMSM9arpzMnL9BX4dZ126i1j6w2JQXNxDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112582; c=relaxed/simple;
	bh=wylHWGzjDFIH1QOZ54Z4bb1DecJkGi8SuPFSZbyjgr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqTqTpwvS7d0kwrU8JwROUJKU1nxMxgOivBokH2I1sfODOYTIAX7cSzVgYFUWZDwkKkMSarQpcFFhqkiv2I/AucE3d1J0+g3ZHdT2/7V9KfppP0as71eiedwLaH8NC8HlO8SiKEUrcxfcAKB3r79SIzlM/bO9jce/B0Hn5oXbnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zzDOhNjd; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f60208a5so44930095e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784112576; x=1784717376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=49AS4xsltVhoKM2n8krRWILDUm/Xmz/Du0DlWZ1325o=;
        b=zzDOhNjdwwpXzQUuyT+wrxr0zqWVlAdUxVJdAHRiJfWQnSxgE/Fi7vat85DPw4MN9a
         w4L4RGOSAXlx4mEqo27UDFV3YPysPE+vGj8677VK/OCqTf3subeORtnhfTygdl7Tj/7I
         Sy5z2lxxY5PjsnD0mQD5F6CpEMV8TWHJhXt1c8ZJ13+CNcgHGEdNhIfKUbDi6/GDSm9Z
         BGh8cWygUcN9EKj6j+exM+hTfcyQ0Q5fxsxkcZcOVeNID6tnzU7WDnf7+sda+OHLA30+
         1SOIAhxVpKiXUug2/Awf0HVwbMqrKw866O8qNIqaq0LYww3CkRlcbsPhe788Os0RyrrD
         jdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112576; x=1784717376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49AS4xsltVhoKM2n8krRWILDUm/Xmz/Du0DlWZ1325o=;
        b=AxG5iKzLwI6/HHAcnHBWNhyrabPFSe/MBHDhxN1ItSvmum5Rl4Zmfo4kd2EDOxnCsm
         vdFYELagWmL55I59uJOSVF0SPavckNBiC7AYkUd3SCnTDNDkrDZBaizD7cn6d0B31GA+
         jUJJ/ydGnWOoUJG9s5xcQVHuKpAV5NCAKN1B5czPo4P53XLOG1p8Mh58xxg2GkdycAgk
         DX8X23nnep7wFhNfPEXLMA/0JxGge2WOiRMviarB4arBsGq0sCLhj8Hwnk/l7kX3zttq
         zljrNEmVvG7gBOcvGvx9wpqlBrndLKAZ20N8JpLSFIrPmlQsmwyrx02564EPMmnE+7Br
         SGIw==
X-Forwarded-Encrypted: i=1; AHgh+RqeJrVu5x09xrREf8j53gvLU/xixznCcYscAB8HpRa0crNudOOqwokieFJUIJeVC6iRyP8C4IYZCPocIzGy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy01jN8gRTYB2ctEV+2nNlBUG0W1frC3loADKZUqTCCVKdhoNox
	3AT6x8qeqVhQq6bmvKyQ2LdmER3QIQqPdunuonaRDDK2dyRhjQWYizVMbnb/LuiRVrE=
X-Gm-Gg: AfdE7cliw/5AFGV9NN6kQEdx+FRvWCSqFrIgWnUggknk1Cz72cpEEhInJx5eM1oPeKw
	uDsqeAAZ13TQg6kI5Ac1b9KmfOH3xX1XZ2P/pkkFeZJBppseo+wGiDIeFndSXjkj4aAWDvi+Pqv
	Tfn7vdc3FkRleZOJ9n116YI47s/8Kt6/87/EwZTg6VhzNUeVS4mhflz8o+pajkWDJW9bNYA8F+q
	kzGHER45NOX66dP0GX3KpEj3p/lS2HYngOXqvD1K1nqF8x2drnNaTI1DJd+fNQ7RN0N42eGCo64
	SoxnFDDaWHMknYUGWmKONqTv2Y/BaVl069H4R6nx6aF/zDHIu40qHCZVgmdNch4h6hkz4HhW2+9
	SkMTmJgkBnlzd02VUf4TLtHIrhtnRih9jLpBoi/M7YdVrTHKgWl7vJ/CMJVSeT9e99zbl137Zyi
	SQenV91tW+1dmfGuT2D5jC48h4
X-Received: by 2002:a05:600c:4e93:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-4953c286bbemr26256415e9.26.1784112575922;
        Wed, 15 Jul 2026 03:49:35 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:d62b:a557:d06c:e9ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm13449387f8f.21.2026.07.15.03.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:49:35 -0700 (PDT)
Date: Wed, 15 Jul 2026 12:49:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
	Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
Message-ID: <aldlu-Qdf_T9uwbf@linaro.org>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
 <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119216-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D891F75D1B6

On Wed, Jul 15, 2026 at 12:45:48PM +0200, Konrad Dybcio wrote:
> On 7/15/26 12:34 PM, Stephan Gerhold wrote:
> > On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
> >> On 7/13/26 12:25 PM, Sneh Mankad wrote:
> >>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> >>> the latest wake up capable interrupts when the CPU cluster is entering the
> >>> deepest idle state. This is done by sending IPC interrupt to RPM and is
> >>> implemented as .power_off() callback by registering MPM as parent power
> >>> domain to CPU cluster.
> >>
> >> [...]
> >>
> >>> If MPM has not registered with CPU cluster power domain, utilize the CPU PM
> >>> notifications to manage RPM communication when the last CPU goes to power
> >>> collapse.
> >>
> >> I have mixed feelings about this case. The RPMH RSC driver keeps that as a
> >> fallback for platforms which don't have PSCI OSI mode specifically.
> >>
> >> On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
> >> all of the arm32 platforms) that don't define any CPU power domains, so
> >> perhaps it's necessary after all..
> >>
> > 
> > I don't think this fallback is relevant for the non-PSCI QC platforms,
> > for the following reasons:
> > 
> >  - They don't define the MPM.
> >  - They don't support cluster idle upstream, so they don't need to
> >    define the MPM. They can't reach the idle state where it would become
> >    relevant.
> >  - The setup for cluster idle without PSCI is essentially equivalent to
> >    OSI, except that the SPM/SAW driver needs to program the idle state
> >    to enter. There is one SPM/SAW for every idle domain (e.g. on
> >    MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
> >    SPM/SAW instances as power domains to get the same setup as PSCI OSI
> >    (I had a draft for this at some point). So if someone ever implements
> >    this, we should be able to use the same approach as for PSCI OSI.
> 
> Yeah I said 'necessary' because of the arm32 platforms. This would probably
> be the preferable way forward.
> 
> > I'm not aware of non-OSI PSCI platforms with MPM either, so I'm not sure
> > when this fallback would be used.
> 
> I think it's generally only SC7180 and there's definitely no MPM there.
> 
> > We probably do need some fallback for the old sm6375/agatii DTBs though.
> 
> The sleep logic doesn't really matter without the platforms hitting a
> specific power state anyway, so I'm not sure we actually have to (i.e.
> the regressed path can't be exercised today anyway)
> 

So are you saying the MPM is currently assigned as parent to some dummy
idle states in sm6375/agatti.dtsi, which aren't actually triggering APSS
shutdown? Or is it just irrelevant because other power resources keep
the whole platform on (RPM clocks etc)?

If it's the latter, the question is if we might end up fixing that some
day without further device tree changes. :')

Thanks,
Stephan

