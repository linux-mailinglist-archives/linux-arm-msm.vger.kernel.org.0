Return-Path: <linux-arm-msm+bounces-95294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YECqGdEWqGlTnwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:26:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C291FEF55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00B72304E7D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCEF3A9DA3;
	Wed,  4 Mar 2026 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F22L43OS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7CB3A8741
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623550; cv=pass; b=UfJyo797irUgcoPTOSyDHkTopd/4OBipM/cwC2ZnbJPLGLk8cgekpfZxfFE+I9o3QBooK+XmgYEW8x6i2MDIL2XWAcB+VXXhIC/JlpK9lN2RkpvozjZHI6rzSjCD/RrR/HLxlkPB2QrAn4eT80iScrM4q1nnVq3zRrFHW2KI7k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623550; c=relaxed/simple;
	bh=oa4vWPoB1fF5ftQFI6lDu1BMB8/GYQYIVMLv015Aa1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyXbGWT38BtFnQAKuaj7kzwhuY+M28PBaZY/YClhNTjBAgzav7CsSSvB/IzaobovBFgQywSu/Qv2LddGmx6lPDy7p+LMBTxf9aFe2Qy0pWNzvXxUeP4U298PsDv2AV97LXqbutz2BOASnpfrlx54urajXJOJZz4Lj9x8nWgbggI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F22L43OS; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a283adc3aso15251731fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:25:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772623547; cv=none;
        d=google.com; s=arc-20240605;
        b=NLEhfgArrsHAfj6/kurIQaEhKvFrioJx9ZhcL5YIqNj8IybL4qOxdJr9PJbIKohTOh
         LrBnbOOzr+aVeqfdIncLigA6CZdtKI4oWLIkQZRATuF0twsg/YGjNcPSOQgFwmemBCQF
         xeINuaF0aeiwvYjrz7X+OWph2bWQVCo9QiVblw5rkiAf0JLttAReJNk1uM4uEd0N9Wat
         /iYoiftWiDhtnZCyVSAlG+YKOri9ebgZtu1XoZRi4GFZiOS7e7Id0Thgd7Ycc24p3aZx
         DtS5E64+I44tE1ivsGXRGh4Y27iKdHN0dG+F/5XvuYwAy1k/J/mfwCPvne6IDZ4BGqL9
         zsNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZFU75WKoCSxMgaLIkMh5UQtNA2gCsSWtdMfcToA7Tlc=;
        fh=N4BUwco0HE9UE1cDDpS8tvbwPZcyz4GvJH2wDYHiSw4=;
        b=YnofKKeJx8gYQ30TWwP3ONWBghuPdO7TB4TptRfBFZUEK1bd183uOvqKs9uUhHex+f
         FJTJ0kAwalrXCu4ZxDIJXjFV5QMBSSdaGAs8rtjgfa15Rk0RmUOCWBoTW8DjG/f4NOXV
         VPFqfW2coOyFS7Kx48JFfsroQDVj1UvEGSW1QEE/2S0+V3AO1LKFdFYs93wgSK1N6F7o
         i/27iXlavPGhUQhXJVwxlw6/pLn3Asz4Xo+DmqI17jXAPldkU9D9wtqDZsa1ASZQMt/5
         XukPvJO3qW4XMQKuaROngoLtiLhFtobcWRIvEJNAt35GyB3rkPHwbLAGcpYaCBW3dUBJ
         D39g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772623547; x=1773228347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFU75WKoCSxMgaLIkMh5UQtNA2gCsSWtdMfcToA7Tlc=;
        b=F22L43OSR8lrj1aIoE2NKQfTAo2CkYa2snPyJkN9QtOVYwfzuDVf/c6ErwnBonRpJ6
         tv3f83DYzCVl75CQqTumRxeElsg70QTpm7nNNBpQO3wltAf3bQOANK6uxLhjg3aOFaSD
         edG7ELKzyo/NJkOeufkb8zjlcyhxqz/DrS3xUWs8z8UuPB9P07YDYJyNdVXD2tGhna+h
         e7XV+6U0KsLMJrkRsWvnGYjkqAfRv/HuVf3JEX3hzyD4AANMJRJsFaTlBLfFqmVFs77H
         8ON1/RkRmyIp6JU/pIgyNRsITfcCjtEyoz78EFz50J2rY7njf8v64U09k9DVjjsx8+vz
         vXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623547; x=1773228347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFU75WKoCSxMgaLIkMh5UQtNA2gCsSWtdMfcToA7Tlc=;
        b=VExMakLjaaRdmSpehHIktIYznOwdskhpgsueF+Z1tRgCXD5WDvU3qbz1l0oBDW8Ryt
         xLvtkoBHzRc93earHfGmx44Sto+id9ZszucfrqyKCGr8TldrTGlECLpKiQiuYcNxhNBL
         R3m+ataoe9MvP1UW69TwJGdBg6NGpEqy3atkDYEroITUyPssJqX/sVgnv9Iye7IvUaOz
         7KfbOCYWa8kHnS2g/3v+rJOnKdk1KWmP7U4nVxCodriQNLV5qgiYY5DKKvxMxOak6wkZ
         ZX0zhx6bwfMuwNJd+YgmaACfCd0YkysPcEAmnL8g/o9RbcfzSircRsvNEaiEslXiiVII
         9jJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZJpoPGnxrFDLB9JNSmXfYRaLY5DMseE45ypEtGcVrVpY75zzD6L1W5FOvYLHlCj08ymACFLEBxZiTDvxj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpk2nPnbye4C+kI5dn0AVaJDRFg5gqEEHJ4yHmOwOq/NNXSArY
	7pzLPaJXjnVpz7fsyXMQRro0C0drae/14cpjeGiLOopWbV9UG1DyUMMDvM3I44935ZeUM73ztSn
	KOJ7+tSjjxC0vrRn37sFB1TlCoES6X0aRwC0l+BNzjw==
X-Gm-Gg: ATEYQzysPKQFj8RsalXrjkIIUr94DeRy89+nlopH2ExIKTS+FdLM4EgVQTWU8wCQ8F1
	YwLpUPcvWzI5U46vA4znL2asyYKJVTmHreyq9vgj5S7aUSjL4JEtTPTuHB7R6E7YjArpd7rzRw/
	T5LGJKvlp6bdjFfYEEHM9/MiMKaTZzqFLe2Hq74SZkGT9jJzqZMZAcRAXDf4hGht1cgI675XaZ8
	dSXkOxGhaN8CPfT5vXl4VXtb7r0eyDbEIHnuKJ7NuooZ3m8PND+34Fy0MkwAC+Kn/eD5nD8Hhx3
	c1vnU7JuF2euD6vllBU=
X-Received: by 2002:a05:651c:e18:b0:383:282b:7ac5 with SMTP id
 38308e7fff4ca-38a2c7bb1f9mr15449121fa.25.1772623546573; Wed, 04 Mar 2026
 03:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-eliza-pmdomain-v4-0-e61ae2bac805@oss.qualcomm.com>
In-Reply-To: <20260302-eliza-pmdomain-v4-0-e61ae2bac805@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Mar 2026 12:25:10 +0100
X-Gm-Features: AaiRm53skmRHI-RjvqHgia1Wivc8zYgqP69t0Gy83VzMqYB1anaikfyRhx3Cq5w
Message-ID: <CAPDyKFrvMieutLjHkL_dvfm6X9OpLsuGn_SPp1-FeBO5oe-zhg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pmdomain: qcom: Add support for Eliza SoC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D2C291FEF55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95294-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email,linaro.org:dkim]
X-Rspamd-Action: no action

On Mon, 2 Mar 2026 at 14:29, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> Document the SoC specific compatible in the devicetree bindings
> and add the driver support for this SoC.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v4:
> - Dropped the GMXC and NXP2, as suggested by Kornad.
> - Link to v3: https://patch.msgid.link/20260224-eliza-pmdomain-v3-0-6e13d3aa70a1@oss.qualcomm.com
>
> Changes in v3:
> - Picked up Dmitry's R-b tag for the driver patch.
> - Re-worded the commit messages with better explanations.
> - Dropped the MMCX and MXC entries as they are not described
>   in downstream and not used. Consensus reached off-list.
> - Link to v2: https://patch.msgid.link/20260223-eliza-pmdomain-v2-0-23fb87eb70ef@oss.qualcomm.com
>
> Changes in v2:
> - Changed the MMCX and MMCX_AO to the PDs with CX parent.
> - Picked up Krzysztof's R-b tag for the bindings.
> - Picked up Konrad's and Taniya's R-b tags for the driver patch.
> - Link to v1: https://patch.msgid.link/20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com
>
> ---
> Abel Vesa (2):
>       dt-bindings: power: qcom,rpmpd: document the Eliza RPMh Power Domains
>       pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                       | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260216-eliza-pmdomain-dd10911bd4e4
>
> Best regards,
> --
> Abel Vesa <abel.vesa@oss.qualcomm.com>
>

Applied for next, thanks! Note, the DT patch is available on the
immutable dt branch too.

BTW, in regards to the immutable dt branch, is that something that you
guys are using or should we consider to drop it?

Kind regards
Uffe

