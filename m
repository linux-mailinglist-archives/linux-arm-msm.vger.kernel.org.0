Return-Path: <linux-arm-msm+bounces-98171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLlRBYtTuWnYAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:13:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 677282AAA01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86F0D30C8A3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4073C73FA;
	Tue, 17 Mar 2026 13:06:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74525217648;
	Tue, 17 Mar 2026 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752801; cv=none; b=Xomfj1rXAHDUXzHyV2MvFVP165zrde5WE8+iyvfQf45wIihkc7VkFFLHltSQSiKcLVnoGWvf2PPmSPDzCSib2DRaz6+5xIkaOcGNZcuFP+T3lLlObP8OXqxxh/pdyEbUX+BrRRxIAuSQBM2iPoCLP/2W6LiWANYNcP6oVRyqsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752801; c=relaxed/simple;
	bh=KRepwqeLG0gPjMSZjBr2wV1K+JcfmTp01L90vMpgRWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U//3uF8t308Cz8KK2rGY9/koC4/HJRu8sJMcCTlmWML3lo5kiltnFpBNSKg20Im8LWWeRrGI+RRyT9DNwmOmWBg7CWql3QSDkWS8GdiY37N08XeLZ3S4n5eegXNzmpLOen1z/cEn/2dRy+n/IullSvM+khvTcKxaxWgQiI4RsmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DE1C4CEF7;
	Tue, 17 Mar 2026 13:06:37 +0000 (UTC)
Date: Tue, 17 Mar 2026 13:06:34 +0000
From: Mark Brown <broonie@debian.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Roger Shimizu <rosh@debian.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/6] ASoC: qcom: qdsp6: q6prm: add the missing MCLK
 clock IDs
Message-ID: <df7c1043-c3b5-476a-93dd-572e12c45388@sirena.org.uk>
References: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
 <20260317-rubikpi-next-20260304-v2-3-5634fabe0c43@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0/PhQeokqtBtI2+T"
Content-Disposition: inline
In-Reply-To: <20260317-rubikpi-next-20260304-v2-3-5634fabe0c43@thundersoft.com>
X-Cookie: Must be over 18.
X-Spamd-Result: default: False [-2.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98171-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[debian.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com,vger.kernel.org,debian.org,linaro.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.927];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@debian.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 677282AAA01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--0/PhQeokqtBtI2+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2026 at 04:35:42PM +0800, Hongyang Zhao wrote:

> +/* Clock ID for MCLK5 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_5                                 0x305
> +
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305

These two share the same ID?

--0/PhQeokqtBtI2+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5UdkACgkQJNaLcl1U
h9DFpwf7B+Vm/ujithNmBPtnB0nAgCuF99nY8t1ppwEC9v0HUsZI7psRJ2kyLfKU
Mu+C47lAvT98BrZrv6Vb4UJmI41qVYbN2rD+kbVrZKPLOg1lym0W7BBVZGA1ogAG
2vmJNr+IFsws/yByU+fpxO7M32Q57LFwvj596oTR16WJHQaJddO0dqXkrPqVTGg0
pn146Tc7UXJelgF2TygmcMmSihkgyeLsHaNcPA/xvSuoWraEe+zlMfIE9vdT5kSC
PpOyOSwSQ7WZYUP246go2T+1jGjkybplCLFQq9Wk33DTueDyWuwTxvfJIslyvIqt
wO9hu0Yq1GYEC/U/jEokIQZLns11sA==
=QG0/
-----END PGP SIGNATURE-----

--0/PhQeokqtBtI2+T--

