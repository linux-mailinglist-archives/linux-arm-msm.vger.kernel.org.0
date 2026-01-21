Return-Path: <linux-arm-msm+bounces-90049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPUuJzsQcWlEcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:43:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A15AB0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32E73A85148
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D758478E2A;
	Wed, 21 Jan 2026 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUn5CB4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632B2DE1E0;
	Wed, 21 Jan 2026 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011543; cv=none; b=LJTc7AuPgmvEcJTF81IGFtiFW8I+PCWqeFG1i3CcvN/B8/vjXU5J+6fs0e4m930FAJ44qR/RqGZsQdEHhnv/asBJ1kWwb4jyFivhA5heeGjNT98AQetKdTLv/+EW7d6+59VHOLvcap9lbI2hzUAUrpolUKxIjcFP86b9lZYF4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011543; c=relaxed/simple;
	bh=+XXifxIzgcTJ3aqY5fFJg3+/NCrXj9uBQTF3nUjPP9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeC1nHaGaqMX8S2m9s7E3Nf3crlQeLBlO7ICiK4mGd9TT/Nt+U3fAd5lbChgoEAJLKk84ShZGOZyPyncqZqncZ4yBQQR+n9Xp47aRFWf/yE0rEM4W8BgR8Q69UuziAN9cYTUHIQvFTTqs6qGe5QctfflxsdxgnnpCEWG/n2Bv+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUn5CB4I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C317C116D0;
	Wed, 21 Jan 2026 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011542;
	bh=+XXifxIzgcTJ3aqY5fFJg3+/NCrXj9uBQTF3nUjPP9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hUn5CB4IDHqmXukCU9BcL26Tvfs2z2HQcgoOZ8LRzJonMdVZcU/eZXWSiWPRappxn
	 ZOiCU1bbToiOU2MroEzxliimiv3Pdoc2iN4ELl5E61Y5DZtgNfCk/knferG74NiWuU
	 napIpiKCyCo9VEhy0x1y6DDWS7nDGv3WaNs6xothT8Ra3LVzfkRregRCUC2xW2iEAt
	 HSYQ6z+qjgpEUWEsXrvQXmjBBKAiGoNfoDE6+cKOCg+zAp14ys+OaFww0eEWrhHdIP
	 yT/yEtNKoM6vtt1Bqwo5Qrkx7IMrTd74qeTCrxO+ZQ7A2qrU7srGVFwkZ4uywFL10z
	 esSnPABlYVSjA==
Date: Wed, 21 Jan 2026 16:05:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, robin.clark@oss.qualcomm.com,
	hanguidong02@gmail.com, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@oss.qualcomm.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Message-ID: <02db754c-b689-45f0-92da-521e273f025e@sirena.org.uk>
References: <20260121141215.29658-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ChzoroEYYxNMitxq"
Content-Disposition: inline
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
X-Cookie: Eschew obfuscation.
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90049-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,arm.com,8bytes.org,oss.qualcomm.com,gmail.com,quicinc.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 013A15AB0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--ChzoroEYYxNMitxq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2026 at 03:12:01PM +0100, Danilo Krummrich wrote:
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in
> qcom_smmu_impl_init") intended to also probe the TBU driver when
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding
> platform_driver_register() call into qcom_smmu_impl_init() which is
> called from arm_smmu_device_probe().

This fixes the boot lockup on Juno for me:

Tested-by: Mark Brown <broonie@kernel.org>

--ChzoroEYYxNMitxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlw+VAACgkQJNaLcl1U
h9C2Awf+JTlEPX5L1eRIkZ1G0xUwbjSgqn3cw2vE2R6ou1mn1B+Zg7AQrliouFA1
lhr4dlAVlvMhPb0Pj855r6Xr2F7UPxR3rX203ecrbXUQoCN/NjEZkIMBFGy4Cxpr
tvLQyKjpbijfqqPARYEke+46IlJyaykzK3175jQkx3z+tNXMfB84dbJXOntcTBwM
adtPwEAraVaenGkGmW22AkSE1WdKPItAwic6142MyHpJHEzwc3k1ssAFmHPWuV5h
lsdJpfidJto6uoI7BgDkZ7ufFYGgQQIQE82CG/l2lAVVlt6NtXRrzARRGlazDLSt
viADbl4xQiZLJW5dZwom6oP7pcoS6w==
=Sdwb
-----END PGP SIGNATURE-----

--ChzoroEYYxNMitxq--

