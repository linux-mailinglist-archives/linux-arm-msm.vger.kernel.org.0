Return-Path: <linux-arm-msm+bounces-107068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD6oAJrvAmrAywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:15:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD9251D6D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 841FE3040959
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3660D37F01A;
	Tue, 12 May 2026 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QjTrzsM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830223ACF16
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577176; cv=none; b=IhWBCvNNlUQ7kyV7FPjltk4+gcFMBLsiyzt4OtLouEoCmA4uZ3TW6fk1dA46u+9s2ihtfIC8xd23vFqHquNaM9l8Jvw5mCQczCMNFi5jBsSppNWkw8sVTE81wQrgy7RVnIQSmSYBYixVCwa5rV4cjDaeONnou82MVwu5DOKa4WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577176; c=relaxed/simple;
	bh=Hmvqet4kbFwaL08Mu7Pz01jcDh0YgWXxaL6SEe+Gr5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfcUp631HPxCjL9GcCTjRUfFI3j6j5ofmgNnso7TpoY/n6GeP2fIgYYA2giHxzHU5akYXSpTeBtvbvLrAho7rQJaEVLQF2AjssI7pinq7aIS7RpEsSl5tPJLAJUbSvUGNp5fose8yNZgZzRg96vFxQAwoA7G7DFp9Gp6XjIsLT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QjTrzsM9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Hmvq
	et4kbFwaL08Mu7Pz01jcDh0YgWXxaL6SEe+Gr5s=; b=QjTrzsM9WmneiwbLgXaq
	qamQaRNAa7apfXfxho0azXMdwxlCGZ6rRsLWeABPKjZzFR9cPk7V4KFIFsF0dv/x
	dHXBFLf9c92m7/S8W4hw+N06zUphNcVdub8IARYoxFlIDT56xZRhxtEI9OS5byso
	Dqb+wpZn0hViBitsDrP2myOk/qv6r7SA8Z6lkWbWc48uBAnTWelASBlD4959jwiq
	MdF7eS1FrATqSgRLyMXTuP3wwHjRraiNe8ePeolG3Wnw1uym51CaCSGo0moLqZQi
	CnuVhurN9PvNUb9gT0/12I0DljjgCcQIBTfuUoS2/bvBkiKurQWdi1s8xjqiZasT
	RA==
Received: (qmail 2922095 invoked from network); 12 May 2026 11:12:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2026 11:12:52 +0200
X-UD-Smtp-Session: l3s3148p1@tIWPRJtRhqwujns3
Date: Tue, 12 May 2026 11:12:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andy Gross <agross@codeaurora.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFT] hwspinlock: qcom: avoid uninitialized struct members
Message-ID: <agLvE_i3irNRWP-I@ninjato>
References: <20260512085509.30626-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/f5t8uwuQj2pD9+U"
Content-Disposition: inline
In-Reply-To: <20260512085509.30626-2-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: CCD9251D6D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-107068-lists,linux-arm-msm=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--/f5t8uwuQj2pD9+U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Link: https://lore.kernel.org/r/https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com # review of patch 6

Bah, the tag is broken. I am sorry, will resend!


--/f5t8uwuQj2pD9+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoC7xAACgkQFA3kzBSg
KbaWTg/+O1vvLAt8WU94ivURcDUsLE7KRVUuT0DgmpN9oCMll3Qv4KX63mTUWFhN
csXa72f7Ypksi8UQ+EwrfmAlVxgZSaHHkUs6P1TmHutPcDhZ9ygJM13d8ZnLADO9
BKfvzxSWxMpWUkUiYV/a9suRj1VfnKv0GoaS40dYOTtttN+qzOCZs/e9pU2zdk/U
iL8JR6pdWIQGSxdZlHMZQhueVrppmFpJsjdhFY1zWeQqAe0eO2+l+qK/uiLF/IS5
CKzKDBhdWDiOBLZCacbiMgVG7EZyCWH+ZRsQugqm7VRROpMDcyOAgVVrE6IBXTxX
7vZACBV/+OwQp+/ru9NIVDWoS1o93h0Abi3Ox+ou2t0qxI1mb8i+bqj+SGps4HBt
A3i9PPxx1W4NVRDHnkZHyEY/FraBPqvFvWln9g4ayYxbnB49Z6W5ZKZI6WNxY+L6
V8/Y6fVcJd/mwFZ6mcL6tbCYk2iubOe6sCDPr+JI1+CMlfVLZMi0yoco0sm0qZq3
oyLJrTUc8el4oj6MXQfYyM6vrqIsed3E6G2ekIrdW/6nbwJ9WV71yBhoKMakmqiO
CrCE+uzEBmVJYvVM8kn3UT7++IK9BMTlai1kbgcTE0NHXoT852K2d0Iu28TYq0Ru
fY+71iFEuqbcV0KiJaYKt2Y9YC8lHWAxoox8m1iQrohT07ftJF4=
=nDaB
-----END PGP SIGNATURE-----

--/f5t8uwuQj2pD9+U--

