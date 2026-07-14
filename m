Return-Path: <linux-arm-msm+bounces-119031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vEgHEGotVmpE0wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:36:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1137549FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:36:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=PynYh0+J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119031-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119031-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FEEA30BA0BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE90A449ED7;
	Tue, 14 Jul 2026 12:27:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E40385D73
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:27:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032038; cv=none; b=MO0uwQObOGyCooeAfRIF4hJ/dHtPzIsRGXXhVFjxjZw4tpuvDCD1RimUT0DdcX6VGOacePjOgrbUtgxpNupbxiOhICxHwm1PtYry7C9Ra9gIWsYAWJSn/S91KgZnQ1J5SKwN3WzFZfoOdVGaPpfBtgNJHyZIzVX0+lAEXvs7tP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032038; c=relaxed/simple;
	bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpJB5vGhJp0W5O5JQ4YwznQg3rb6SGbcbMlSjB6+SD+2n4Y3wfa2VBkks8udp3dwo5Fxa/cjprkaXiOEBVCV6SmTUMZ2IHHsPOBm0delvuaXVWua0BUrAY3ZGMxnujmz8s+Twoq28APCVnVZasHK0bl4h08RbCbou2giiKLmoNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PynYh0+J; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so6124945e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784032033; x=1784636833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
        b=PynYh0+J+gquIeEfFLT4xpocDZspjFo1uC0tvXr4kcCbJclxbeAeA2JOA0rl3y20ol
         mcit2fW+E+jmrCK96IIoCDFJ1VM3XZlBM1Ol1m+WClgum2198FRqcjPPCLV9qklXozSF
         bNqWPUmMRztTIRAr/uC8vS6aAntTLhgq31sxO+VuZBnLE00avo9wPo2ak+Id2S73P6TP
         JyMTv3npRT44eaT/IXdnaC/THJCMEiU1U8Y0HHTLWki0rZkYwd6+emsgtmO5Xkm2w9R+
         pry/Pqru2T18iu+oxY+ijHeqsYm6DhnLhfMAzC4qCJgPOzNSx45HsubeRl3RQLtb7Mxd
         11HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032033; x=1784636833;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSey80JFPh9lTWD+sSqyuQsIg2D7fhxscYbJM8DP7gA=;
        b=LRcssSMCjX/70MdTrm0elUefQ9+Fudexv/+lCfTOu3mAz7azUDeoNnoYKVDU6Movy/
         w6cLov88Q4IxXc3JBecE7OVkXVyuNolZmJeJhR2xf0tZ9SvAPmrz34rqeKIy7qOC59DX
         b3t3gbtfw3zTDEW85ENMGgNuTyVtUfIF14NvFrnL6tYqKbpPaHSNIDU5qclbpQdZ3ytR
         PiO5NhgSEZvr6cNONaIzGP6RtXIKicd/eDFPzrUlxKn7fveB+AJ8zP4CmKPvfiuY6Bkx
         jGYrcJo2j9KswBm5HHtExKDTFS9ZRcuNe8OAC0VGl9zsjJRp8PxWPvI0DQqd5vtPUqAQ
         LE0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp9s2EX1BbcOy2I+qUA44oNLxnsLP5NeESnDeYaPSsWmgz+zxsJ2cDGDEmEiWRs6YhFgMPuzcNMzPwmUMmp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjp+T4YVRAFrslxOb6YCHotFQw5oftVDtODpVHLMkzSyw/WuoM
	3pY+fFw3YtCb0JKaPn8L4DjYoDWQtwDz6BUzz+GNnHg0B9N+fPdb64QxfxmUfSlaIqU=
X-Gm-Gg: AfdE7cmwPy6DkhfdMQcELaImDfwcn8GIm9eMwxbMAtjefQJt8duySssghaxXP06CZ8l
	kT0NC46qRdzHJ6BaIZUPbCy6MQxVnOjozdFqdLy4y0Qazy6d32MypWiceY+ma8TT41TxBvwabXf
	uhtGsC56SthUPpX41L1JpJB57lNYIaeTozvs6Fe5j3V6qASDUarOEiPtTT/KS62aY67m+rmup24
	VA9QfL9zxr3kQHzfj/sNB+cXK6TFpvoGtFegxR9Oc0Lrf8S2fc6espcoxsgLomA8sFn6EXRgxwE
	n0nv698Y968aSLOSjbpar0Xv/P/xQx5ETPsk2Hw2wnK/46OBfVrE8duob401oAgyPXl8ZBgKxVO
	uGY1TsmqHMuEJ/WOPwLNKZAJpSB7UsQd3pYSATK0GRekyJJNQf/DR2RvLwKFCif2vLgURrlpn8i
	/vNrc716CgvX3semTZqAq8NlXRULuwc2h0GCxGoUuZ1dB2V8JdZTpVuwxH7k5TMVCV/whtqg069
	iNzgjV9cYg5Br1k7QHNr0p2qw==
X-Received: by 2002:a05:600c:310f:b0:493:ee3a:f05b with SMTP id 5b1f17b1804b1-493f87d7fcdmr131894065e9.7.1784032033466;
        Tue, 14 Jul 2026 05:27:13 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49508732395sm71538925e9.5.2026.07.14.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:27:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:27:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Message-ID: <alYq2J6hd06g9XyC@monoceros>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ebx5plxbs5ed2t4p"
Content-Disposition: inline
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmitry.baryshkov@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119031-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,redhat.com,fairphone.com,gmail.com,foss.st.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,monoceros:mid,baylibre.com:from_mime,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A1137549FB


--ebx5plxbs5ed2t4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 08:23:45PM +0530, Taniya Das wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>. The latter header is
going away soon.

Best regards
Uwe

--ebx5plxbs5ed2t4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKx0ACgkQj4D7WH0S
/k73NQf/T09jaRmPJhz4l6/RUqCHwddXVzILSJXm5JaBiJDO0DMQ7ba66QjYb4dl
QI1n/Dhb09P32uDl6jsczhMK61GxspOgLrFR2hBJzih+s41bXQ7uPoTac0gcaxYW
7ldbJEM2KWQqFfrv8evU5objg4VkaDip0n9ci9nt6BgjQpYrjjX2clnDM/0zDdp+
J8Dm1K+VIcHnIuhNQqi0ptZUQ7G6eoC2c6bWlZ6aaZm8kmv+yuRaMgI+u78AEzgG
aSj02assVonsMuBMLKWJt55XzGBjwDCaWmUdfxbvs8kPIqtPeP6z5JFX/FcChP14
2tr6zJZjaXuLYoEM5CwI84TE9YnOXQ==
=/t+O
-----END PGP SIGNATURE-----

--ebx5plxbs5ed2t4p--

