Return-Path: <linux-arm-msm+bounces-112393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NjXOJRk2KWquSQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:02:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 207ED668133
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:01:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=dR7GWIR1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112393-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112393-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66306305E355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9783DC4A4;
	Wed, 10 Jun 2026 09:59:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A793E451E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 09:59:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085553; cv=none; b=m2GcMxjlWvv+pzDQfUsCCaghkTKmm/OsDn0R1xG6+FlYzpNUHeW9N3erTPwKRs+PbsZV6IFVZFqVvwKf2EbbbRqxuObZeRFAgBh8c+2mUHFINO8e89GIzLX2aPLdWuLnUact7xkXTXm0rkndDIHxszTKOkYWvZ2TtbivAI1qDqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085553; c=relaxed/simple;
	bh=eKcLzyO67IVgXtwsIvJzg37AHzlW7FvLCJJ0XFLuVbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqM2PFBDJi7UDKF+mONfHRfgoMdc+5ddgpxOsECA+v3KCgq5Xs9z2GhQoCsZDDMZdi2wXg3YTZyoAV99uIATnWOnwH5MYDD0ZpDO9PzcJ0vlFP96AtAhaiJ/kJ9D2q+XfJ6K31QWwmwkLCQLrLieEXnGCKgurCsPfGZfMO9DFys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=dR7GWIR1; arc=none smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68c76fb8009so8590599a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781085545; x=1781690345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qgos6DTNowDu7SOuV4RvbxhjW/qGH8PqNCsJnQH5GLc=;
        b=dR7GWIR1XDJRfwf0HP//FiGANrGEnpgwijSvSWCK7zJkIA4WdJk1aszO6tSbFsP6BW
         sEqoSJw/H6aQezynHHtX6foo7OehshfBydshjcokiUsZYXS8iNRP7+sDH8w2glis+iPa
         PAU2ICyjZTXanQaHPSOItEBwjU6lwtVj9D289xfAelku6YQ0U6rXt2uq/TdVMTZWVjW9
         D9rloq5yuAASgHP7ubTqL4hT8pvml+zvJevHC981vO0KhdYdQ3Gez1xj6YYo+zwgs7uK
         PF+8BJnQwVivMi3NneTTd7CyxmRnIx3PQPKjGq6dfKz0LRvmlAercvr/q5q7DVXcQ0tr
         Y5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781085545; x=1781690345;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgos6DTNowDu7SOuV4RvbxhjW/qGH8PqNCsJnQH5GLc=;
        b=PEJfl83I3IrnYSCdAasjEWsIk23obOuTWO+Igd2KVgbgjpd3r7vOFJgsLcQ0+Tb5ic
         uGuI3s0cUjfGOZhyO9Nmv8klOVBMRtDng1jb0kcX79vEaGG+c4zBMik6fGQyBWXcKtNg
         +gu8T5RyVxTrISURZqqwbwj0JmcUCr2N09uPajMsvfk7g/RHSo0i7S2kaqs1Ww27I+by
         +vrocn4ZsaZSGZSdvVIKL+4HOG6CvhDdQwUjPGMUkW+/vd6Q2OlZ/hQjExHsB3NvQr16
         e1UxErkzRUBQQ5WJYYD6fu+t/Kgos7Ja+FJvU1XVHLuv8zEkDP8Vx8FdlQE8fr1rZGCf
         RFOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4BgmJxenOQ0jLphOzjri48uWuL1hm5h89MGbEsH2AJGSU6qbivTggZypcje3RpP7ovaDvKEL2PDRSKZAj@vger.kernel.org
X-Gm-Message-State: AOJu0YxOU9hufll0Zi6pG/Z2MvC5YOq/yjSWj7Mq+fqNK2QBAmSGoYq5
	7Aiyf9qD2OuuYJXY4xKJex2sm1FyNNMBYBfpN21dOpNvjPAz2oQc7OIftVsut3+FoSw=
X-Gm-Gg: Acq92OE2AiuV+XDi4v6aMXMnYs69hbifkPwXtmV+BqwImBD9DN/J2N7YtCiQyPL2sqr
	dlQ6QEFdecgAjOA6FQ4sp3DCit77TLCBwqv4effe3r0dyS987Nr3sclirdgESKSSMlq+i8NUgeS
	BDZHqOFzPoBBi6e8OldZZBV195rl5tjtjRFbtRzOiuBajj1/fcJuTcq5tvIsjonLbZoLzqMOjIH
	Pn1EpKOd/73lCpa3/l6vQYrpJ+w+7YHYTl+jeGx7vkyouIHfEeH0D34dZFp0M5MXsJsm0yVfJFi
	iWoGu/xWT3HeJBywIKa4u+gXGawmlNnKQToPHcbKqt7wxqZiTSH3/nxxViSf8qulQOz6eNme7iL
	uFwEdfRI6/2IRD+qKniDSanVgiEygY4z1OyLhjMYR8wcVBvXj0tmnQrwmFVUZxAXHUEbSxGKGQ4
	Lpu6SmxToTrhC1JY/Hb/V6WU1SJDKqDOaixVYyS2CeMRujB9cR28/moXIPN9reAhFibFkQFJ6G8
	G2OIpIPh+JkeFt8tb3mywR8gvJKtt8eiJUU7LRjacYqiZoFZPsu
X-Received: by 2002:a05:6402:3881:b0:691:6fca:c1a6 with SMTP id 4fb4d7f45d1cf-6916fcac341mr8225521a12.26.1781085545076;
        Wed, 10 Jun 2026 02:59:05 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:fc17:adf2:34ee:6df])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c72esm9362431a12.23.2026.06.10.02.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:59:04 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:59:01 +0100
From: William Bright <william.bright@imd-tec.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ram Boukobza <ram@imd-tec.com>,
	Tendai Makumire <tendai.makumire@imd-tec.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
Message-ID: <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112393-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.7.a.0.0.1.0.0.e.9.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:url,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,will-Legion-Slim-5-16APH8:mid,imd-tec.com:dkim,imd-tec.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 207ED668133

On Wed, Jun 10, 2026 at 11:21:53AM +0300, Vladimir Zapolskiy wrote:
> FWIW due to https://www.nxp.com/docs/en/data-sheet/IW416.pdf "10.7.1 VIO_SD
> DC characteristics" SDR104 speed mode is not supported by the module, thus
> the selection of the SDR50 speed mode on the host side sounds to be correct
> in your case.
> 
> In SDR50 speed mode gcc_sdcc4_apps_clk clock frequency should be exactly
> 100MHz, and since it differs, it has an impact during the tuning phase.
> 
> Definitely clk/qcom/gcc-sm8550.c says that the maximum supported frequency
> is 75MHz, the same is found in the downstream v5.15 kernel:
> 
> static const struct freq_tbl ftbl_gcc_sdcc4_apps_clk_src[] = {
>         F(400000, P_BI_TCXO, 12, 1, 4),
>         F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
>         F(37500000, P_GCC_GPLL0_OUT_EVEN, 8, 0, 0),
>         F(75000000, P_GCC_GPLL0_OUT_EVEN, 4, 0, 0),
>         { }
> };
> 
> Can you dump CAPS1 register value of SM8550 SDHC4? What does it say about
> SDR50 mode support and need for SDR50 mode tuning?
> 
> -- 
> Best wishes,
> Vladimir
CAPS0 and CAPS1 are below:
  sdhci_msm 8844000.mmc: CAPS0: 0x3029c8b2 CAPS1: 0x0000a08b
For CAPS1: 
  Bit 0 (SDR50 support) = 1
  Bit 13 (Use Tuning for SDR50) = 1
It looks to report that SDR50 is supported with tuning required.

Best regards,
Will

