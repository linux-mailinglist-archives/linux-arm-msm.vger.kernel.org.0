Return-Path: <linux-arm-msm+bounces-90188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKtONAgYcmksawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:28:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC5666A1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9D99572881A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 11:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A1B381710;
	Thu, 22 Jan 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbbcHAcf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD1C33F8A2;
	Thu, 22 Jan 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769081576; cv=none; b=YQniUJjAXUfvVx2Fcxp5zJRKWxeBY6fl5qygiPCfd02iZ78qCOxlyF5jEmSiEejJlW9K439bUhkKijT5c9EaOgSikp5CyE2ZFgOTFsRuKc+mkzbzl8ThdY89/LbnU8aUKmvv6Unk+YkQbrfaKhRpATi4LUPZ4qOXbrvBFRBpyuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769081576; c=relaxed/simple;
	bh=9F44Mz4Z12fSoodmWG8gkmg6dJaFsGYZtL80+pf+7Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJSgK4JfnAIIxzSznDIhGspVqqKRjJbAtXuCSKO+CKd88gHya2i+FJdlV3lbXGpkohYwuFMJzVORoLjsMrkLoE8EtbnWlT0ajIHHSWCPDZVwHAua37n1a25Qh6Op1dxw619D2QA5pKAB+frGEhOGsLybVTOm2c+oUsd6N/NIrA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbbcHAcf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB65C116C6;
	Thu, 22 Jan 2026 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769081576;
	bh=9F44Mz4Z12fSoodmWG8gkmg6dJaFsGYZtL80+pf+7Pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EbbcHAcfi5w6orn6Jp7Hqf95kC+RtcBvoBnoixgZVL5FT1mUtvGY5EvEvvRe5PxX0
	 79LwRo5M1XQeUlowv5/qXOe3ETU7GYbIz3oHmiViz2wZuwELUgIzVSoSFYgZFgvxrs
	 T10UssFqPuOLama+F+VfNI1tTfAf9vn4UhZxr+7aezdwGTerE+QE7VTQsH4CMbm2tb
	 QIkp3lT8+EQc1ELBNsF8rhKa/DF4pRhOMCCkERBwr1L/3ee2vYVSBngzm9ep7z7603
	 HppZegKuPze7N7Z60+MS9Pj7JZ+0XC/Cpg75kuOJoBaSNS9nAGhWCzATXTy5ShNP3Z
	 lnMnTlspY1atw==
Date: Thu, 22 Jan 2026 11:32:50 +0000
From: Lee Jones <lee@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: qcom,spmi-pmic: Document
 PMICs present on Kaanapali
Message-ID: <20260122113250.GD3831112@google.com>
References: <20251215-knp-pmic-mfd-v2-1-1e91138c6fc6@oss.qualcomm.com>
 <176789374037.1117798.14242637055422802029.b4-ty@kernel.org>
 <b393f218-df47-4119-88df-9b3ce23180ae@oss.qualcomm.com>
 <45e5526b-d565-4420-965b-1c6a687cbbe0@oss.qualcomm.com>
 <20260122112721.GB3831112@google.com>
 <20260122113018.GC3831112@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122113018.GC3831112@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90188-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BC5666A1B
X-Rspamd-Action: no action

On Thu, 22 Jan 2026, Lee Jones wrote:

> On Thu, 22 Jan 2026, Lee Jones wrote:
> 
> > On Wed, 21 Jan 2026, Jishnu Prakash wrote:
> > 
> > > On 1/21/2026 11:36 AM, Jishnu Prakash wrote:
> > > > Hi Lee,
> > > > 
> > > > On 1/8/2026 11:05 PM, Lee Jones wrote:
> > > >> On Mon, 15 Dec 2025 16:39:35 +0530, Jishnu Prakash wrote:
> > > >>> Document compatibles for the pmh0101, pmh0104, pmh0110 and pmk8850
> > > >>> SPMI PMICs.
> > > >>>
> > > >>>
> > > >>
> > > >> Applied, thanks!
> > > >>
> > > >> [1/1] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present on Kaanapali
> > > >>       commit: 2a84a41a8c2d3cbc2460d2bc60569a35c4157e76
> > > >>
> > > > 
> > > > I had pushed a V3 version of this patch earlier and Krzysztof
> > > > had acked it the day before you applied this V2 version:
> > > > 
> > > > https://lore.kernel.org/all/7c56b471-5fab-4cad-bf48-4da261d5bd9f@kernel.org/
> > > > 
> > > > Is it possible for you to drop the V2 patch and pick the V3 patch instead,
> > > > or do you prefer me to send the delta between the versions as a separate
> > > > patch ?
> > > > 
> > > 
> > > If you prefer picking the delta patch on top of V2, I have pushed it here:
> > > https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/.
> > 
> > I applied v3 already:
> > 
> > https://lore.kernel.org/all/176892549681.2317951.17154378493870916934.b4-ty@kernel.org/
> 
> Scratch that!
> 
> I don't appear to have v3 in my inbox.  Please submit a [RESEND].

Ah, the subject line was changed to:

  dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present on Glymur and Kaanapali

I have applied it now.

-- 
Lee Jones [李琼斯]

