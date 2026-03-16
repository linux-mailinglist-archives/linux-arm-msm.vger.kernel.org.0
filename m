Return-Path: <linux-arm-msm+bounces-98002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GB4Ei1AuGnSawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:38:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BB29E663
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 837BD3015EDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 17:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7696F330B2E;
	Mon, 16 Mar 2026 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="CR2cezEc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271E73016F1
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 17:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682646; cv=none; b=gZoao4jlhCVal9jUwYv5j7MPfHaJgRwxsb7fm+K8Hptl9XVU/nwlsA7mNyO5i4psQocWNhQ6lxO0p+4SJBnwX5yesYIH3Gw9da63MqRSzmx32FZYIh2Feab9ZAMy9ftMlWQky6dmbey5Ly+a3S21/KMYiRIPP1b34ospnKhRdMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682646; c=relaxed/simple;
	bh=fYb6sHXn7pJsZ6vBGxZq8vNzfRcMGkZh4X8AJVjPgDk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OLcFBuJH+wNkNzK2vh3MtxuJe+6oTC9no6huFzvvRT9nwI49hxcgCuJiYczYiNJKy9xLbx+AFr4WdU3gVJgllwu4rHFvNLMqI3MJC8TGTX/Fbb8af0P/2r3iN0kk7hV99TGfN8s8RNGCTREuK6vhJVBJ9/U/oVt7FXXBL1CnawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=CR2cezEc; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89c52db6231so13833416d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773682644; x=1774287444; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fYb6sHXn7pJsZ6vBGxZq8vNzfRcMGkZh4X8AJVjPgDk=;
        b=CR2cezEcc7IcJd+/kAnmtdi8ajWLY76td/NKOTgQmtOmJsPhojNULmfUVAh7KPMVo2
         uZb+t7uRls0npuPUFRwVUZMyIr2EAPD8bhOsOrMVplLtiYwrZgjlGH+5XrPpFJUvp5Vh
         AkCnkY75PKxBWYmQnAQq5M11MqtiFCEBNWs2+kDDH1znx75K9hH9YF1qPS3/hEqrgKQG
         Vj/IhL6YnL3iFeZiLxU/RWZdvxZWShdG8BK2ESQG2l95RKUEWb1hoTCPmo9zNjkinfuI
         wW+D8G8VMRojnx6bm/+iJ7FVdgJNYN/r3G/eSnTpmMJzzy0+y4fD+qEgMEaw0xkjkjIU
         hamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682644; x=1774287444;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYb6sHXn7pJsZ6vBGxZq8vNzfRcMGkZh4X8AJVjPgDk=;
        b=DcubUBPM0Wv5t8efAu+95fZgIIramQ/jvZsW3PD3D56V4ukNbJACeC/5NT8HI9C8ss
         KNQxAngJtl8fzr8dqGZ6jraGnZfgDuMnHXdL3cLUCKLAiSoq2CPDbcP/wSgZ92xrdWqo
         6xEkoIfTZnnFm0PucRuWOS9/7IyJLTVwH1U0FOQLHvEKFjsQhzs/8dfz8JG86XWccpn0
         K0cC9yxxBgPa2npjKrHqiGu8MOo14+Q9PqIaEKOgBtWr/aBW6wxupSEUFzHiunOq6Mn4
         FCeGGcHDJhw+l7MeeaaifvP7cO6XGY0/O6MoLvyyODSsuT+5+X/tStoSyLDfREgBPrmL
         W1vA==
X-Forwarded-Encrypted: i=1; AJvYcCWfTpGF8rYkGPgd2AvGObr4OmGJzIhO+E6S9naSJox7WwmFxvx6j16Ah/ajF8z74bG8LS6aHc0PsXiRZyxm@vger.kernel.org
X-Gm-Message-State: AOJu0YzzrZicZ+rat/Hg5l0FnjxAo5jZbYBklXtMHp9Sb6ubq/Etd0av
	ChloWFvALF+DQRdY9QumTCrWRBbtiEuuAexBTdDdsRRJdzFzok7HRFHGE+BndeTzVXY=
X-Gm-Gg: ATEYQzyw34UddxlMyQzHjEySO+BiDW28JM7wgkWWUdqFDphIcSqZyC7Mx6eGQXl/CCz
	ZsfP2xT9mpMX2jFkFZKsTjuBUAHc7h6/ew8RVJS+2ji6rDqPzsIx9c94IbOuG4ACt9VD6dLOfiK
	IYK7/cd8Rcn1SBHUB0Ar10lBtynx690FFv/of3reKD++oMS9A/dYvB/bxDlIAiSTFjBGjHQ576C
	y9+j3sHtfTz6dNtWyyh8tKIWA2umk9nuNPrvLZ2HFBk+shr6gyQq6HJknGsCF6u0DlI+kIDUkQq
	oikPYbtR/NoYKwp3appGhPPI2eA+ICjXsSy8mFqMChlGc88sY+Ohs+hz3auPvuCKhQEFycIdAIM
	Ad2pG8rAkyL0wzNXJdmzc8kWw7+eKZHyQ/ycV3JViURfr3nGcZ+9aaAVg5CeIosV2sffp1Dmoer
	vHo3c90st5n2RLGncawMU9M5WkeeMh
X-Received: by 2002:a05:6214:3001:b0:89a:125f:37d9 with SMTP id 6a1803df08f44-89a81f60619mr201273256d6.50.1773682643931;
        Mon, 16 Mar 2026 10:37:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a6947c4b8sm121138966d6.20.2026.03.16.10.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:37:23 -0700 (PDT)
Message-ID: <69fea3d9214405996d2ecc50419e539e84f22a3a.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: iris: add new rate control type MBR for
 encoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,  Abhinav Kumar
 <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Date: Mon, 16 Mar 2026 13:37:21 -0400
In-Reply-To: <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
	 <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
	 <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
	 <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-dHCDRYTp/XOPcjihgPWz"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	TAGGED_FROM(0.00)[bounces-98002-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 489BB29E663
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-dHCDRYTp/XOPcjihgPWz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 16 mars 2026 =C3=A0 11:52 +0530, Sachin Kumar Garg a =C3=A9crit=C2=
=A0:
>=20
>=20
> On 2/13/2026 3:24 PM, Konrad Dybcio wrote:
> > On 2/13/26 7:04 AM, Sachin Kumar Garg wrote:
> > > Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
> > > Encoder will choose appropriate quantization parameter and
> > > do the smart bit allocation to set the frame maximum bitrate
> > > level as per the Bitrate value configured.
> > > ---
> > > =C2=A0 drivers/media/platform/qcom/iris/iris_ctrls.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0 .../platform/qcom/iris/iris_hfi_gen1_defines.h=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0 .../media/platform/qcom/iris/iris_platform_gen1.c=C2=A0 |=C2=
=A0=C2=A0 9 +-
> > > =C2=A0 .../platform/qcom/iris/iris_platform_sc7280.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 202
> > > +++++++++++++++++++++
> >=20
> > Is this really only available on 7280?
> >=20
> > Konrad
>=20
> Yes Konrad, in this series we enable V4L2_MPEG_VIDEO_BITRATE_MODE_MBR=20
> only for SC7280 because currently, we have added the support only for=20
> low tier chipset. MBR rate control aims to improve the compression=20
> efficiency of encoder for static and low motion scenes for extremely low=
=20
> bitrate use-case.

Without a spec definition, which constrained the implementations toward
interoperability, this needs to be made vendor specific. That being said, e=
ven
as vendor specific control, I think it deserves more documentation for your
users.

Nicolas

--=-dHCDRYTp/XOPcjihgPWz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabg/0QAKCRDZQZRRKWBy
9F5hAQDkXsgY4OHgrg9Op2qeSXSgs3hkumaPyQN9NN/hrd3dZQD/ewAMalduGh3w
N8XNdHliFkPMAADO4AyWA5qKf0tqcws=
=xtn0
-----END PGP SIGNATURE-----

--=-dHCDRYTp/XOPcjihgPWz--

