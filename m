Return-Path: <linux-arm-msm+bounces-109951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCwWLpm8FmqHqQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:42:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1844F5E1F3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69EFB306A98C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224A73ECBFC;
	Wed, 27 May 2026 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc0uvHsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986D53ED11B;
	Wed, 27 May 2026 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874616; cv=none; b=cHKChcLTU+fPYsFaUV9Mv/2i975O4u7WxL+PkZZYOoLlXI/0PsAMlF1eb/1cpMckrjtNrAr9j5qYSxmAP0u+YUWWoOzeGq3EMZkfpqbeh1eVvOBBoaF4NuQrkCuyWR06TsYQXCDrkPASuaac33fa9XmbHxWMcigIC4AZyJb5Q+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874616; c=relaxed/simple;
	bh=LUXNmxSpR/amWsuk9GeJ0XJxJZMK81d9md/HMAJtStc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOVuoDAEaIrfF2n1A+U83rmfi07b+eN9mRCgnPKjTGgZjqgErkmrKY8G6CGoh33esYq7uQxB5pRpNI/sS5vxpzkRupK+71ysc5aJPOxGazEtEgGfZas9vy2Kf7n8yphxvO0HQFOUSMmd6RC33lxtGNx8zZC+XGFEnDtuTb2/phw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc0uvHsU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A801F000E9;
	Wed, 27 May 2026 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779874611;
	bh=hSn0APe8SR1UUgViq9+cqpZdVUS8xKWS9pp0z2n5dCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jc0uvHsUTYfR/8uABurmjEHlvO9waNo8t2WkjUOr1AxJMeqnkbXUiyNtKbspYVgUP
	 93AiX/SvWEhUHAvhXgJ2trbAXSE7Yl9BOrbxudmM2MmhYuKv7QVK5mQ9mK/3N8OWGa
	 ZpdMzo6uWnQ6BVVJNuZINfxla+WV3jqSbC3KyplBLiDOu9h+tFJ8WzcMUTeKuGnFRd
	 hEbvKZFFMwY9cF61/y3iZnUW54Af0+cL7ji4Y1jBjyT0I/LY/IAn6fWahYmp+TVJrp
	 MG1YKkDtCKyAaFZETn8vy1+tJH6AjS7Iz6NVAksmNOB2x3ygEe86PCSnOAmzzow4E/
	 GS4FYxjlSynKw==
Date: Wed, 27 May 2026 10:36:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	mohammad.rafi.shaik@oss.qualcomm.com, alexey.klimov@linaro.org,
	ravi.hothi@oss.qualcomm.com, mathieu.poirier@linaro.org,
	verhaegen@google.com, andersson@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] ASoC: qcom: audioreach: Add support for shared
 memory push/pull modules
Message-ID: <6d5776eb-c181-4ae0-886d-8d8dab7be7e7@sirena.org.uk>
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260519131527.4002526-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pZWqzjKFWfDNj8E2"
Content-Disposition: inline
In-Reply-To: <20260519131527.4002526-5-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: You are fairminded, just and loving.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109951-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1844F5E1F3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--pZWqzjKFWfDNj8E2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 01:15:25PM +0000, Srinivas Kandagatla wrote:
> Push-pull graphs use MODULE_ID_SH_MEM_PULL_MODE for playback and
> MODULE_ID_SH_MEM_PUSH_MODE for capture instead of the legacy WR/RD shared
> memory endpoints. Detect these modules when opening the graph, cache their
> instance ID in graph->shm_iid, and use them for media format setup.

This doesn't build:

/build/stage/linux/sound/soc/qcom/qdsp6/q6apm.c: In function =E2=80=98__q6a=
pm_map_memory
_fixed_region=E2=80=99:
/build/stage/linux/sound/soc/qcom/qdsp6/q6apm.c:218:42: error: =E2=80=98APM=
_MMAP_TOKEN_M
AP_TYPE_POS_BUF=E2=80=99 undeclared (first use in this function)
  218 |         uint32_t pos_mask =3D is_pos_buf ? APM_MMAP_TOKEN_MAP_TYPE_=
POS_BUF
 : 0;
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
/build/stage/linux/sound/soc/qcom/qdsp6/q6apm.c:218:42: note: each undeclar=
ed id
entifier is reported only once for each function it appears in
/build/stage/linux/sound/soc/qcom/qdsp6/q6apm.c: In function =E2=80=98apm_c=
allback=E2=80=99:
/build/stage/linux/sound/soc/qcom/qdsp6/q6apm.c:943:41: error: =E2=80=98APM=
_MMAP_TOKEN_G
ID_MASK=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98APM_WRITE_TOKEN_
LEN_MASK=E2=80=99?
  943 |                 graph_id =3D hdr->token & APM_MMAP_TOKEN_GID_MASK;
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~
      |                                         APM_WRITE_TOKEN_LEN_MASK
/build/stage/linux/sound/soc/qcom/qdsp6/q6apm.c:944:43: error: =E2=80=98APM=
_MMAP_TOKEN_MAP_TYPE_POS_BUF=E2=80=99 undeclared (first use in this functio=
n)
  944 |                 is_pos_buf =3D hdr->token & APM_MMAP_TOKEN_MAP_TYPE=
_POS_BUF;
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~

It's defined later in the series.

--pZWqzjKFWfDNj8E2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoWuy0ACgkQJNaLcl1U
h9AmNQf/Z7lGtJZkA9cVFYlkzDM4qybHUDtJDWz5NJkCyb5TEj8AQPW4FH/Y2DfH
EVrZxaX0WPzyaJiA2bR0qJ8oTfwIJEAw87ZNb+kvP//2j7vEWpoUkoOz6obBLQ74
UqIQkoVxdBfmgWZZ2076w7tbK6tw1ULrBI6IZAhg8XR3fgtecurezFUw5LMbJo/H
fLEoYBxqwxxoBVtF/O/u9TQEz88BBcM6nNWhRYH4vHTPDbjefBskCNv3pojX6QV3
C6XnbP+5f87B8h8rWbt0OJnHN2cijt10KMQVf8L/xagTTGAK2JZPCb4lOUO3iEmd
eoOhnadIlUrlA5gYjF0gZTMYC2q6pA==
=4G7x
-----END PGP SIGNATURE-----

--pZWqzjKFWfDNj8E2--

