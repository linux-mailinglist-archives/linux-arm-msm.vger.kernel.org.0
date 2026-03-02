Return-Path: <linux-arm-msm+bounces-95026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKbzJjcGpmkzJAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 22:50:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 000D41E424A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 22:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C71B3716E7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 21:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D5837DE8C;
	Mon,  2 Mar 2026 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BnWl7lCv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1178937DE8B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487090; cv=none; b=Rij8sFCZ1bsLoOD1wcDqCYxfJnijgFdJ8JBXueoBFL9oZMRKV2gPMEj9GN0QpO9eE7/axaO0TqGmzb2Z2AYL6piV5QsR7eHZCeQFibxOg482wF5AwFTw0lFvFasRqHhVC7lbhSprFS1RXHHG8PhA1yL2gMkgZkgTDP0QilNSiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487090; c=relaxed/simple;
	bh=lj+j+ZIDkkNeZV0D5vcdutP+M5ePO2d5rcp1CL1YgvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dB75f7BmmJs2BjgljJ8qKh5U/JgfDzSRjDgKcIzZaM7exGao16jGi8vuUjfoKS/dLC05ua8U2NqYFwzdZGv/BebzGucyMTco+sac/Cyj5YHXNaGXS8d8LqdfABEsyN5J1WmO3kMsB9CY2VRjaldE5cGf0RfAmPrj7np/gDa4kZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BnWl7lCv; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdcada445fso3086749eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 13:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772487088; x=1773091888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y2weksujUd1WsP1i8nse0Bn0OZL0MTS4I7qfVTSrOJk=;
        b=BnWl7lCv5PfQpFONCDJupUj6ug6LjDDOni5b1XYkTOhyi/M+0mL37QPTf2GPDmT96x
         I6H+onUkDqEN3ZJofYCfaOCYk8fbMuyyJ+qy9XAxO9EtbXNp189GM8UvwgFDCXjcx+BC
         etDHq2tlAZNKuDK1IBSN8DcZE5b3BxOH2q2UU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772487088; x=1773091888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2weksujUd1WsP1i8nse0Bn0OZL0MTS4I7qfVTSrOJk=;
        b=eQ8wB6NerSZI5qxv/IO+p9A0Ox4kJb7K0rckzBPhvJvZawv1SSsll+HUPDGBdBV5YB
         WGLL8c8khZLHvfpsVgmzlziU314oUjXVAgMDTBQRRVvurDErCNFf2fqrwv2/R7Fp3L2a
         8/kvW+WZ374WC1cJpTYQgOZ1mNisuYuQ1e3obUmYvqDIP7zfU4BnxinwwsE2ZSSylYvB
         FqJAGRHOzKpZ79kL3jpDw1cNfILLhI1iuywF8CRqtnXcOJqEmShqF+qHTv25Ou9rKQTQ
         8sWDLdqY7eHQsIl9w1vjjX232FGoYU2pX9pqGcP2HHzLPp6F7fs0fePl/6QP2+MXbR6h
         fPCg==
X-Forwarded-Encrypted: i=1; AJvYcCUuId/aRoFuzrbyt5Pm3xfr8xQJme2wGrwU2df6saDelAlPJp9SdRX3FugdKzqHuOZR775HZUcqZil6jwUk@vger.kernel.org
X-Gm-Message-State: AOJu0YxZetWvkWKX1BMoJEcbL7xX5kSTJ4mDRhcibPpYEWzYxzZW6VAZ
	f2SNQb+fb9yeMTVkHszwa4zIg1nTypmTq9zqeailhmxqy7j9qzEyB3Zgb/5JkiRk+4zp+zT5AmZ
	vqEs=
X-Gm-Gg: ATEYQzyGuLbB3/y6U0L9ZreIQOrmRfd9c6WDDUfukWzEZmWWK5EGIt6NSmhfT48R70X
	9y5bliQ8ZpCCSdqjV55jDTwDjqF2+EBH/K1QGy1FzsYgo7psMIPi0q4mQacHM/hOo8RmSlitrqV
	I+0cnhbK04wJ9L3r2A5PCROHiNu6gnJo+r3tntwu0XZCacykR1JGYtEBUTnBTVsv3dHCOE0AKN+
	TbdhakTmtHc7CAJz220vR4LJ+U7pHVVqPgKtSvFZP4bJQynt7KOr5cuJMtnnn8Mfa8NMOhZNn6p
	MaNlINxEBbxIlFb74e0G7j7jgsxWJROdhECIw3jfukKlrM8ei5miN1ZT2OtbN0mqorG2vyrFbS9
	RckOUzjQLFJDXP2WjBPRCg9iqR18YpKLKtcLQ1A6FhSDiIoNqBjEM+K2R6VpVb8s5LeU+rGHz8k
	fhx8bhxn7VolJmOQfW/MElZ8136AfELDPBrwfLuBD3FhXsPVbegRHpYXACf6WI8w==
X-Received: by 2002:a05:7300:cb0a:b0:2ba:7b2a:6a5f with SMTP id 5a478bee46e88-2bdd0ed191amr5782832eec.8.1772487087946;
        Mon, 02 Mar 2026 13:31:27 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:4382:5835:2fef:2d89])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2bdd1f49d96sm11395477eec.27.2026.03.02.13.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 13:31:27 -0800 (PST)
Date: Mon, 2 Mar 2026 13:31:25 -0800
From: Brian Norris <briannorris@chromium.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Odelu Kukatla <quic_okukatla@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Drop aggre{1,2}_noc QOS
 clocks on Herobrine
Message-ID: <aaYBrQlaSSf4aWpz@google.com>
References: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
 <20250825155557.v2.2.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
 <90b13660-1844-4701-8e63-7fde2f093db0@oss.qualcomm.com>
 <aMMcNn82AmSavJYf@google.com>
 <b51e1230-d366-4d0f-adc8-fac01b5de655@oss.qualcomm.com>
 <aMR2diG8zwvPRSXR@google.com>
 <aWBM5zl1kgvCZdnV@google.com>
 <8d334226-b8a3-4e22-9257-e6aa60fe2d47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d334226-b8a3-4e22-9257-e6aa60fe2d47@oss.qualcomm.com>
X-Rspamd-Queue-Id: 000D41E424A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95026-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briannorris@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Konrad,

On Tue, Feb 17, 2026 at 11:46:19AM +0100, Konrad Dybcio wrote:
> On 1/9/26 1:33 AM, Brian Norris wrote:
> > Hi Konrad,
> > 
> > On Fri, Sep 12, 2025 at 12:37:29PM -0700, Brian Norris wrote:
> >> On Fri, Sep 12, 2025 at 03:10:16PM +0200, Konrad Dybcio wrote:
> >>> As I attempt to find a board that would boot with your sw stack,
> >>> could I ask you to check if commenting any of the three writes in
> >>>
> >>> drivers/interconnect/qcom/icc-rpmh.c : qcom_icc_set_qos()
> >>>
> >>> specifically causes the crash?
> >>>
> >>> FWIW they're supposed to be independent so you don't have to test
> >>> all possible combinations
> >>
> >> It seems as if any one of them will cause the crash. I had to comment
> >> out all 3 to avoid crashing.
> > 
> > I'm curious if you had any follow-up here. Are you still looking for an
> > alternative to this patch?
> 
> Sorry Brian, it seems like all the "ready to grab" firmware image links
> for this platform are dead where I would normally look, which prevented
> me from being able to poke at this..

I'll say, I'm not really surprised. The firmware here is probably not in
any maintained nor widely used state.

> Would there happen to be another place where I can grab them from,
> perhaps some CrOS CI?

I don't really know of one right now. I expect the CI is not active.

To speak practically here: there are likely no real users of this
development board, and if I'm the only one actively trying to use it
with upstream Linux as a development vehicle, I can simply carry this
change locally. It's probably not worth a lot of people bending over
backward for it, unless I'm wrong and there are more people using it. I
was just hopeful that I could reduce some friction for myself, and the
limited (possibly zero) population who might also run into problems
here.

Unless you really want to move forward, I'll move this from my mental
back burner to cold storage :)

Thanks for your time,
Brian

