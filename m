Return-Path: <linux-arm-msm+bounces-96746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNFaGOZdsGloigIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 19:07:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0425626F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 19:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0032C30CFAF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E5A3D171A;
	Tue, 10 Mar 2026 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0FUhHBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060D3C9EDC;
	Tue, 10 Mar 2026 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773165735; cv=none; b=nBXqJu9jcK5I5NMg6mXtWdUoPHnWU4AlfdYmP7gBFzNeqM/Nx4nVUZsZAiyrNtqRBi3HXpFYjOiYU3D7iZCMh6lLqOi/LlUHXXT1jQ0fMGzuEX1WSREGXgxGnfLhilP3yGq0dA7IW/M+L60xxQXZuPlAEzAxj1CtfvDAFK2ekoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773165735; c=relaxed/simple;
	bh=reQ/kmi8Sjb4oidTs+HBvwFOv2hwV16eAYsgx9QAHCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S355o9cv2O1I4BAbSd+EAOwz8e1a+CUsCxxXnT6uC2MlUOdk2sMiuKJKd+gq0FbG5WWKCDtU0OAfTCAZ/VXXuHKpa5kGf34LVmapsHfAAVL9VGVILOx8+nakVz8xl0A1eAjaMSlofCbeLrtYsUtGwz9pvP/8uXT+KJLJDCP0RXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0FUhHBI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1999EC19423;
	Tue, 10 Mar 2026 18:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773165734;
	bh=reQ/kmi8Sjb4oidTs+HBvwFOv2hwV16eAYsgx9QAHCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0FUhHBIOE8xyfL7IJqPyDD5A6zRW1WI7QAp0NAB4zPoWIL5fi4TInx+tpkSKL2nZ
	 lK/Uf0dExjHRhK2ot7tbkm+DHNEIWhHrao4crZCXJbURaWI8e4008x6hfQBeGF+9t+
	 FoYZiIklAbw0F6MWvG9F/DXpxzAaYIj86NU1EMk1IqWDpmkk4wCkq1H3fq93xeLf+0
	 /LkbEoUtuT+R34daM/sAHqPDqLeWTntpVpBGUPradpdxsw42syoasvXIVc5yBvlo1Q
	 D2lReF7N4Xzo6JfhWrEzveyS9u6qvcjwz/KACelzv1PEQWOM06uzzP/yemEu6dpflD
	 iFrEXL2Zy/i2w==
Date: Tue, 10 Mar 2026 18:02:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add
 Bluetooth
Message-ID: <20260310-maritime-silly-05e7b7e03aa6@spud>
References: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
 <20230421-fp4-bluetooth-v2-4-3de840d5483e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8vcYeGljaN9cb6WW"
Content-Disposition: inline
In-Reply-To: <20230421-fp4-bluetooth-v2-4-3de840d5483e@fairphone.com>
X-Rspamd-Queue-Id: 19C0425626F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96746-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,linaro.org,holtmann.org,gmail.com,lists.sr.ht,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action


--8vcYeGljaN9cb6WW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 12, 2023 at 03:58:26PM +0200, Luca Weiss wrote:

> +&qup_uart1_cts {
> +	/*
> +	 * Configure a bias-bus-hold on CTS to lower power
> +	 * usage when Bluetooth is turned off. Bus hold will
> +	 * maintain a low power state regardless of whether
> +	 * the Bluetooth module drives the pin in either
> +	 * direction or leaves the pin fully unpowered.
> +	 */
> +	bias-bus-hold;
> +};
> +
> +&qup_uart1_rts {
> +	/* We'll drive RTS, so no pull */
> +	drive-strength = <2>;
> +	bias-disable;
> +};
> +
> +&qup_uart1_rx {
> +	/*
> +	 * Configure a pull-up on RX. This is needed to avoid
> +	 * garbage data when the TX pin of the Bluetooth module is
> +	 * in tri-state (module powered off or not driving the
> +	 * signal yet).
> +	 */
> +	bias-pull-up;
> +};
> +
> +&qup_uart1_tx {
> +	/* We'll drive TX, so no pull */
> +	drive-strength = <2>;
> +	bias-disable;
> +};

I recently made some changes to pincfg-node.yaml to detect if there's
conflicting properties used, and these got detected. Should these not
do what has been done on the msm8998-xiaomi-sagit, and delete the
inherited bias-foo from the dtsi?
&blsp1_i2c5_sleep {
	/delete-property/ bias-pull-up;
	bias-disable;
};

--8vcYeGljaN9cb6WW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabBcoAAKCRB4tDGHoIJi
0rVMAQDnCWfS9SVgN5I9oCZV8sUIm4jsdwk8Z93loonuabpbDAD/dsTwIxMkuvPV
hcf46FGtpSe1pKAkNjqG/Nqkn+5wBw0=
=qt9u
-----END PGP SIGNATURE-----

--8vcYeGljaN9cb6WW--

