Return-Path: <linux-arm-msm+bounces-96429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJELF8Rzr2lPZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:28:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA0D243972
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 929DD3053B34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04D72C0323;
	Tue, 10 Mar 2026 01:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBLirpHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68612BF3E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106109; cv=none; b=NpgTT3v8yDmbnfFdvFxzkJeik0VUXYXfeZseWUOE6WGLe9Gnx6E5YMtDim/W3RqsOEOq+Ag9SuUwiF4Ppfmau0t1OfpA4EqoRMu0JbJnTpulPcI7bWCCoPe/x9zRKfy7srbHee0Y4jRGt/vNFzErTuYOa0oicnezPEyNBPuFEcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106109; c=relaxed/simple;
	bh=v7gPPYL74WJ89jCW2wz7YDyPkdh/3hKFQA82MrNW43g=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhWtCl47Qb0UAm2efk4u4gZjXKigb2BNjC2aYtczm7BFvT18jHVWjwKLbGL5ai+V90hhy36HqB0ssYUPNBZE7XxLDEmjNZysFWfJQSGNYHbRgMUK1RdEUSRzCqInAJ1tT7ki1N9ObKQuq0ZYkd6r/yYW0ww9umacOpO8Z2+ggYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBLirpHG; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cd80f56b27so214957385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 18:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773106108; x=1773710908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJmRGOM3tXkUFnl1mES+/42tH0in2Gb2lnZjoNo8x7A=;
        b=CBLirpHGNurlQ03vtsSquFWj8Tq6NxmJgjluG88hH3+BDQvqVnQsxUtBWXqvqg3fBg
         XFXlxrOMUc8mvBbb1jaRN+FsbYr1StKxrkeHyt7o2fK9GR3h5SyHvWatIZ/9jJfwlh77
         6hIh766QdsJypSad0b+n6F4K3/EB1sZN5/7fHyKWVnqSTOkLIKxrPF/b3LiBGd4x2BVG
         dEn8yO1uovx1wnpkXzBhlPVdBlalDXCjfqH3J+9CxYRlCckLuJunzOj9xXVG9ndQjICT
         LkZnUqpA5oM6b5i5ZQKwhKDYucvZJd3qpeT4m5nxPRrhYKsYHt25KFU4jnKmY7grG/Ol
         NzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773106108; x=1773710908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nJmRGOM3tXkUFnl1mES+/42tH0in2Gb2lnZjoNo8x7A=;
        b=oj22+aSDztvDllyRECRyMQ4abROigOPNQPLoRL4dAQLDiWbMONk2QNq62xCWKQzci9
         64HNy9SYK87Nmqtng9ibMfubg6s3q8gEkQeOAMDCGrPUEenLtCuM1p/RzEkKjGXhK6oR
         lZcAkvMa0Jq0LDyRFQ5uOHgJZhKL8zUWPBuye6Bm+GvL9DBfOoOH/zPAfqFWSJvdZu0j
         WZc4ckwxTNzdU96+LdMDtL4tNa9iMPk0lwuSLW3g4xaz/0b/byN0lk/Vvh/Maz0tZaRa
         enLGClRUKgBQVJMUmbwxUsoWwf2r/YkUlDEIfSMpVb296phjk2w0vmWa3k4L3Ig8aWXS
         xInQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAOvznr8ix+yNsinVPafDoLRpsX4l9TrZ/z/jcZtXe3/9yQUbuG2z7Bxopn9yBo/X2hqf2iNYMHXVpNtfu@vger.kernel.org
X-Gm-Message-State: AOJu0YwW07vTSqETPVm+YJRyOOrS8wJIZ+WGeqtA7kAZtZBpLYDey+da
	40YHMgzh0CyEaOuZSIiFXqC+3T3/NfleUJXuQ1x8hf+efgcDPACpQbI5
X-Gm-Gg: ATEYQzxPYgdYfVlUXJD899oN224m7ngw30SvlliKPdEQP/ib7MNNaoQERsfOkTqkl2b
	BeTkTQYPq95RGQeqOwwTPymaipVhVAgnYWb2lcChKHvU5iA3+Zr1NIVTFBVVVTgj8ajC+epNgSs
	dl3y9q7s/tM6JFvLAZHWaP08uAfg64QMUBSNufx/hynDEi8FpL6RemvKY2RFVkP+EkAJ15lN6Ox
	FxXOoXBH6iCykw8RabPbmlCohQmyR9Sds8gXKAzNDK8DmW9Yl4yL2qQaNjjV3RNuh88SugPeUxc
	8lvQJDc965hejjxqCBXVIO3vCKWbqoAi5P2wuSHNUvDT1npWvaUsAibnJUe3zPx10/pjFlmWOuj
	JP4JjQIoGE3LewMTJ0XVMZjlMICf2UUI8m9f8NnErvnQhQFncGj28GlQ2ohQCIOpgqpieW9soLg
	9hs0sGdz+WNA2+kI/i6veWQMRKfXZjDF4EWMXLn7IeKj1fxVw2Xl5+aEwWOy691kRwE17BSajyc
	UCix9B3ww7Vi1Y=
X-Received: by 2002:a05:620a:45a8:b0:8cd:92c5:b3e7 with SMTP id af79cd13be357-8cd92c5b810mr293297285a.18.1773106107657;
        Mon, 09 Mar 2026 18:28:27 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f53bbbesm757747885a.25.2026.03.09.18.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:28:27 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:29:08 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/5] SDM670 LPASS LPI pin controller support
Message-ID: <aa9z5DKgK99mL_58@rdacayan>
References: <20260310012446.32226-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310012446.32226-1-mailingradian@gmail.com>
X-Rspamd-Queue-Id: AEA0D243972
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96429-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:24:41PM -0400, Richard Acayan wrote:
> This adds support for the LPASS LPI pin controller on SDM670, which
> controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
> not sent yet.
> 
> This series depends on LMh because the LPI devicetree node is next to
> the LMh devicetree node (NOPUSH: link to LMh).

I don't have the email check anymore. Well, here are the dependencies:
- SDM670 Basic SoC thermal zones
  https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
- Support for the Pixel 3a XL with the Tianma panel
  https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com

