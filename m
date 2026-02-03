Return-Path: <linux-arm-msm+bounces-91659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JzGLerQgWl1JwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:41:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E4D7E12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 11:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE3C5304F22F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 10:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA53F323406;
	Tue,  3 Feb 2026 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9df9jAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F1B318B8C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770115285; cv=pass; b=n4SDl95eXHPMOOveTWLia+AoXkJOvT8dY38REjJ2Wq7wfWWsORLSj07AW6Dlmh+qJA7V2T8KLNsgsx2ctqyQo0vlHGAHm1VMd+aFklrirw9ik1oO8sGQ1YBYkKVJecl0zbIuo0ty7mfg0khgp8L9/4DFvZ6ZFWL8c9qwhDs07hI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770115285; c=relaxed/simple;
	bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhMu/2rGpHm/SQrrYG3/BMJ1mJu57+pbLtM0b7gxiZIohAqUP4v6pWP4pQGdOswWrCw7Yekla4U0RWnRvXXWVczp21Z1hrVtt5lUGTGUb+0taeTe4v+uOsNB5z0rmoYTWR9qDQpC3MvX9ceaNOUQvce31qsvu0c1HV7KtYNhRho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9df9jAd; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59dea72099eso6433173e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 02:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770115281; cv=none;
        d=google.com; s=arc-20240605;
        b=iWMKfLvWb6uklQqjpna1w1GbAJLL/aAxN3Qu+Hp2O8dZ06NUsnLfmqwTrqDNIIr8Ko
         tAKhgRO7kCeOTfkakDqYLa1iSRVTat/nt4bAYhdB1KH6WUvbeytbd3c8OHJxdYAUU4G+
         R7/OPH02GSHOhYYXC67mQmBXajQF5zUioZl2WWV6dYWEyRteB4Papei63y3u+yknChta
         7JTcoGuH3LRQokatoW5yES0tiqHzk8P3W0MWTiTsFXQUeXpgGt7oZ1lNfgA81jlzm6Gh
         S2wMiTnhD0iUjUviBOdVx4IeCYqyla2THkER/qffFBXo8FdpkIAPj6r1btgSztxir1+J
         8NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
        fh=NbcLdr9A+91a/ZOkCfLeHbLGC5WQIZZNsBcfA6TOSq0=;
        b=FSORjixuQw+66+m24LlsdWaV2J4QEDt7Uc+cg5utAWP0PQVdwdUlekbLDLtA6fquao
         ZAsrF076g+k/7j4/4H4mvZrQN7gCfQHo6PPn6z5+sdw2Qc+xk/agFunj5F3OWjefPClj
         PDGUQf668DtVh4uAydDXQOIAmDhqPpbw0IjSL25lr2LUEYa/XKXr/g/dmpEQVvwtPyuc
         Zif9s39OnA93wRLHqvOk7JvAoKNoSDeEEbhwYtHoDZ3wVEeVZduPcNFazSa6WC7zsgEm
         zQeudrIqxihfhDJ2SWVfDtQ5AWqjPESHoLcxfv1ZDAxKSo0XnE5hBO5ONVr8QPMVCNNz
         upQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770115281; x=1770720081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
        b=u9df9jAd3ocwpNvTkerjq/5EwbpvelscXEhWSwC3ym80s8IjbgyHdQcqBp45X9nu4F
         NYiYPgWEx4f31cBTrYoFs0mdyAasZdSRvrSGXQx6fAsr6ikCHnpvjoQgP/nNWsE2SJwo
         yTfIIy7K2s35FAt3R959t8mjWSPYNXL1u2sMNnKKypKrwfPGRHk9vzGlihZ/vPEqpu8a
         kJzg9L3Xvo49f0c4ypDqDWW4hPmIy6mkoI/NefVKGICLNXwOEmhaapKDgO1AvB2v8d5E
         pRWPz16LCsYRVVFuNtLdietKnxRklo/lTYqOiCEWmeVFsTJ3Z+BFSR87ren4mP988TBd
         7eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770115281; x=1770720081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZhZoolcVsnf21eiX4kAKedgHHgjheaIc5imb+clfpA=;
        b=PSXyWXl/sQeboMvLpYDKaSR1ZJ0z4Sx5bymOp3WotmXT6Unl/zaCeDaYRcMY9a6qnJ
         6N6j//mQFtVl3GjIvmIYl9FR8+4XFDSijgIDUXbnb8245hAq0Qm9EmeccDF9LyTud2if
         nhOSqHFHy1uImBn8AFmNplIqufs8qUhuwqjx7PoxfrLNig8pTDvDhyqo8gjDNw45efgi
         FKpQS0Vlr1MG94J+9FQYjEFtyAjkWeuItQ/5eVWTruuf+tOb4hRijH4WwoFGj7+XHI8E
         Ox1hvIL3AHO2mANKZ7/Nq+1V2DlShYjr9T9NG3Ff7UYYsEa9XJTqJxeDMloO8MCdeWTW
         XRRA==
X-Forwarded-Encrypted: i=1; AJvYcCVgK7wD+gzrAs1ES7u3iOL9LVaDdaBtMRPafgDW4q/cA/pbGhJu8Zod9/PWmtfpfXtjEpBJjEzh1uBw4TEp@vger.kernel.org
X-Gm-Message-State: AOJu0YxeG4mNs44axpH8BTm7dYpLeOI245KZxTeKFq8RWh5EHjqXL7dw
	LtmkY+vMnd8MXHSrkkBwHbo0/WkmTif57hrG13dhFJyAJVzMiYsKDgQU/5PFlxmjz/ALHDLS2Bw
	2U1ipt2t+TNu+PsjbvSuh6W84KqRhgWShqPBDZyZeDw==
X-Gm-Gg: AZuq6aIgwiJPKEYKlEqM0IuCQgaovfc4xaAgDgxwbn86Vpg/AKbhIbCjMWRhZa2xySx
	sSuRgjtqNuzFgptzFOWp0TrYW9Hmbg2KN5uISU6EUAa2B2DuWUyDNf4h272xe/3lgulrXJmhLCG
	dZlpVnBSqubCslRrM6ZhbWMAn0UZVTbN03wCidtzlGCMHH36YyDdA9XHFIuG7tdGtuiubFWgISu
	AVE2/gegdpjccOFJhrzX7punVUXCsEVjaNyotAb65Hu569i1vummG8Njc74MKzidKvLDQpJ
X-Received: by 2002:a05:6512:615:10b0:59e:1704:e0d3 with SMTP id
 2adb3069b0e04-59e1704e0edmr3493618e87.14.1770115281299; Tue, 03 Feb 2026
 02:41:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
 <CAO9ioeXkhxjghtGVGsOH=1hwC5FvS_4LEXt3hmAEuAbwVjct3g@mail.gmail.com> <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
In-Reply-To: <l6o4lv2sy7x4g33mjigeh6sb6cmrfyz3xshhmbc3el6qvw3oep@okwpfykypawa>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Feb 2026 11:40:45 +0100
X-Gm-Features: AZwV_Qi-wgYVrdRqK589mxNzs1gxGV1Oudp9yxPTCOEtASkncTUH7LC0VHPXYJs
Message-ID: <CAPDyKFrX7NieYszgEZXFyQJr+PA266MJZTvJcGFmrQ2oy7Mj3A@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain handling
 on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91659-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,linaro.org:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 4F7E4D7E12
X-Rspamd-Action: no action

On Mon, 2 Feb 2026 at 20:22, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Feb 02, 2026 at 05:51:16PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 2 Feb 2026 at 16:46, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > As pointed out by Konrad during the review of SM8350 / SC8280XP
> > > > patchset, Iris aka Venus description has several flows. It doesn't scale
> > > > MMCX, the frequencies in the OPP table are wrong, etc.
> > > >
> > > > Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> > > > stopping it from being overclocked).
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > Do you want me to pick up patch2 for v7.0 - or what do you suggest at
> > > this point?
> >
> > I'd prefer it if it is picked through the immutable tag/branch.
>
> Another option would be to ack merging it through the media tree.

I didn't think the series was considered as material for v7.0 as it's
getting late for that.

Anyway, I have queued patch2 to v7.0 and the patch is also available
to pull in via an immutable "core" branch in my pmdomain tree.

Kind regards
Uffe

