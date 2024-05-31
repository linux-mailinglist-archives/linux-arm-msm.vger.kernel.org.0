Return-Path: <linux-arm-msm+bounces-21224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 719C78D5DDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC22E1F26FF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2E478C90;
	Fri, 31 May 2024 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXmOC0jN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADB417565;
	Fri, 31 May 2024 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146682; cv=none; b=P5qUGdw1izrFh5r7gO+kWDo7mwVIwrUM+G4+KF9RnZ9wyG8cMLWv/JkFAkLHsDIQJjSdQO4YmlXbzC/9V/ugRQaSixPuNLWDj25I7Q5tIHEeETgmgPJKf429QffXdm+Lzl91TcTrvnjfSjDf/lPNtnESUX0jhdxOKAc1uNoLKNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146682; c=relaxed/simple;
	bh=Ge2Owzh3S5cehKRYUUe+V39V9v0+HbuSHCXDNGT09Ys=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fS+76CGS2YM/CU3ueTbm4g+jSvQchUqSD8zJWW4e5YXE2I+l0NL8P/LfmDR4oC8tm1tbl3EUNBxmryftp9fcL1V8Qp7T2cNAcAfm+CK3C8WflrxvVSHeYIyfxpcXnjQQBw1+rUW00NiWRcQZZTeQ+npPgf/IBgei0uJEF/ETcPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXmOC0jN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35dce610207so1153202f8f.2;
        Fri, 31 May 2024 02:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146679; x=1717751479; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge2Owzh3S5cehKRYUUe+V39V9v0+HbuSHCXDNGT09Ys=;
        b=CXmOC0jN/3IRcuGlm642YtKa1v4UlEcMZStqZvlRmjxVJOfdkRBhYFiHTzCcbdCYVO
         YFAP6bGArWVDli0n233A2g0ah5JWvYblL0G8FutIMqEXkSAzgW9pzCG/Et2d9gil647v
         u47dVOCQZ7z7Ds7yyAXmnFMwuIQUPNXUZGI24NvqjLSrmbmP8IIPH3HlGXrDC7hxej8P
         54nNbcRSpZgwMd2S5UYLWLWksiOrvBjQdsc6PvndDXZ/Q3Hb9e4SsrUkp0eeLRJzMRhV
         xtUb99RHnUXUthZcjEZq5oIZbBRbv1NFO0/E+CMc+fdK512RQ/+pNEmhHWnkUFBWCL2J
         wGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146679; x=1717751479;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ge2Owzh3S5cehKRYUUe+V39V9v0+HbuSHCXDNGT09Ys=;
        b=jjpHqTVjgJVb+eo1cA2jNnh0pMl8yWOftrjcfejU8oTOQUxsDtniQUfYL4Muu7vClP
         xLhQJLf88Mm6J/ZbIFwzmwHB4Esx5qaIUtgbW1ZH9aQlqyJt3i9CqA/+9KwB5s8lZoXU
         oVOAAEMDLJrHePOe4A38RnZEl/jMe1W8Vdz/IKE35rt2XU8636AoiYtz74jQQ9sAcG0B
         OHBTR0/hTg62q41E/DhPF0nq5P8NUoystpRXsEObk7Nisf1EstkySfX8TmrU2pbT3Saw
         vR8CgA423Yy9L60c1lP1BH/Wgr5WkSGbWNFo6Frufb6kLLpgcAyRIRFrJ/VWfBv1Z3Ix
         aHxA==
X-Forwarded-Encrypted: i=1; AJvYcCWu9FWpE/WP+OvGYLUiYu95BFEyksq1/H7hXwTqi2Yb2GY/lBAILtYPQcOiVMWduxJD2DpZwKI+ZhDrSOh29EojSpqec1gYbkL3XHpLM1+htGnq0Ih2bcjakA3GY/ag/0bgUOCY1gxbsIZdhAY4Wqd8OJIAZBi/imcSzrTQ1Cdz+H9Ot0UP23c+Ou8mTqAkQEqXN5mbnKo8hVFkXYyTuQcoUA==
X-Gm-Message-State: AOJu0YxdNeTav8xdaHtcknT4z9h0DfcvD4ioDcP6sVXYptrHASwBpxsD
	GzEpZC1kAKJ8FpTROeuB8fjBi4l27BbYKEjOyjyHontb6Q5cK0nx
X-Google-Smtp-Source: AGHT+IHjSCeQFuSwL4zgQTAANKUrOtLq+ipp/4k2/cpZCON8iuqmoX8dSGF/d93BBGIHlUH85jMQVg==
X-Received: by 2002:a5d:664d:0:b0:354:f536:31d3 with SMTP id ffacd0b85a97d-35e0f325184mr986696f8f.54.1717146679010;
        Fri, 31 May 2024 02:11:19 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f47sm1409029f8f.8.2024.05.31.02.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 02:11:18 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=44e1abd3ea18a8ea349c6fb2b07d82a6bec49652599fd2a60f6af9c26a3c;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 31 May 2024 11:11:17 +0200
Message-Id: <D1NPP1PJ5UYS.2IGK7FBR9Q6LN@gmail.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, <workflows@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Masahiro
 Yamada" <masahiroy@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] docs: document python version used for compilation
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net> <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
 <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
In-Reply-To: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>

--44e1abd3ea18a8ea349c6fb2b07d82a6bec49652599fd2a60f6af9c26a3c
Content-Type: multipart/mixed;
 boundary=5dd707c8aefca53a80287b4aa87859be5f60dd9e69ea1e2dfc6c279ce4ae
Mime-Version: 1.0

--5dd707c8aefca53a80287b4aa87859be5f60dd9e69ea1e2dfc6c279ce4ae
Content-Type: multipart/alternative;
 boundary=07a5dde67ef47e9448bf0ccc85db98c9dc1a803fa3ba19fc3678c11852c2

--07a5dde67ef47e9448bf0ccc85db98c9dc1a803fa3ba19fc3678c11852c2
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Fri May 31, 2024 at 9:33 AM CEST, Geert Uytterhoeven wrote:
> Hi Thierry,
>
> On Thu, May 30, 2024 at 7:07=E2=80=AFPM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> > Alternatively, maybe Kconfig could be taught about build dependencies?
>
> git grep "depends on \$(" -- "*Kconf*"

Duh... of course there's something like this already. =3D)

Maybe something like the attached patch?

Thierry

--07a5dde67ef47e9448bf0ccc85db98c9dc1a803fa3ba19fc3678c11852c2--

--5dd707c8aefca53a80287b4aa87859be5f60dd9e69ea1e2dfc6c279ce4ae
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename=0001-kbuild-Allow-Kconfig-dependendencies-on-Python.patch
Content-Type: text/x-patch; charset=utf-8;
 name=0001-kbuild-Allow-Kconfig-dependendencies-on-Python.patch

RnJvbSAxNTNlYWVjNjE1MTNlMTRmNWE3ZjhmMmE5OTg2MDBkMDdmMTdiYzg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpE
YXRlOiBGcmksIDMxIE1heSAyMDI0IDEwOjUxOjQyICswMjAwClN1YmplY3Q6IFtQQVRDSF0ga2J1
aWxkOiBBbGxvdyBLY29uZmlnIGRlcGVuZGVuZGVuY2llcyBvbiBQeXRob24KClJlY2VudGx5IGRy
aXZlcnMgaGF2ZSBzdGFydGVkIGRlcGVuZGluZyBvbiBQeXRob24gdG8gZ2VuZXJhdGUgcmVnaXN0
ZXIKZGVmaW5pdGlvbnMgZHVyaW5nIHRoZSBidWlsZCBwcm9jZXNzLiBJbiBvcmRlciB0byBwcmV2
ZW50IHN1Y2ggZHJpdmVycwpmcm9tIGJyZWFraW5nIGJ1aWxkcyBvbiBzeXN0ZW1zIHRoYXQgZG9u
J3QgaGF2ZSBQeXRob24gaW5zdGFsbGVkLCBtYWtlCnRoZW0gZGVwZW5kIG9uIHRoZSBtaW5pbXVt
IHJlcXVpcmVkIFB5dGhvbiB2ZXJzaW9uIHRoYXQgdGhleSBuZWVkIHZpYQpLY29uZmlnLiBJZiBQ
eXRob24gaXMgbm90IGluc3RhbGxlZCBvbiB0aGUgc3lzdGVtLCB0aGVzZSBkcml2ZXJzIHdpbGwK
YmUgYXV0b21hdGljYWxseSBkaXNhYmxlZC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5n
IDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnIHwg
IDEgKwogc2NyaXB0cy9taW4tdG9vbC12ZXJzaW9uLnNoIHwgIDMgKysrCiBzY3JpcHRzL3B5dGhv
bi12ZXJzaW9uLnNoICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiAzIGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDc1NSBz
Y3JpcHRzL3B5dGhvbi12ZXJzaW9uLnNoCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnCmluZGV4IDE5MzFlY2Y3M2Uz
Mi4uNWY3Zjg0ZGU1NWU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnCkBAIC0xMSw2ICsxMSw3IEBAIGNvbmZp
ZyBEUk1fTVNNCiAJZGVwZW5kcyBvbiBRQ09NX0xMQ0MgfHwgUUNPTV9MTENDPW4KIAlkZXBlbmRz
IG9uIFFDT01fQ09NTUFORF9EQiB8fCBRQ09NX0NPTU1BTkRfREI9bgogCWRlcGVuZHMgb24gUE0K
KwlkZXBlbmRzIG9uICQoc3VjY2VzcywkKHNyY3RyZWUpL3NjcmlwdHMvcHl0aG9uLXZlcnNpb24u
c2gpCiAJc2VsZWN0IElPTU1VX0lPX1BHVEFCTEUKIAlzZWxlY3QgUUNPTV9NRFRfTE9BREVSIGlm
IEFSQ0hfUUNPTQogCXNlbGVjdCBSRUdVTEFUT1IKZGlmZiAtLWdpdCBhL3NjcmlwdHMvbWluLXRv
b2wtdmVyc2lvbi5zaCBiL3NjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5zaAppbmRleCA5MWM5MTIw
MTIxMmMuLjQ0N2EzYWQ0YzBiZiAxMDA3NTUKLS0tIGEvc2NyaXB0cy9taW4tdG9vbC12ZXJzaW9u
LnNoCisrKyBiL3NjcmlwdHMvbWluLXRvb2wtdmVyc2lvbi5zaApAQCAtMzgsNiArMzgsOSBAQCBy
dXN0YykKIGJpbmRnZW4pCiAJZWNobyAwLjY1LjEKIAk7OworcHl0aG9uKQorCWVjaG8gMy41LjAK
Kwk7OwogKikKIAllY2hvICIkMTogdW5rbm93biB0b29sIiA+JjIKIAlleGl0IDEKZGlmZiAtLWdp
dCBhL3NjcmlwdHMvcHl0aG9uLXZlcnNpb24uc2ggYi9zY3JpcHRzL3B5dGhvbi12ZXJzaW9uLnNo
Cm5ldyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAwMDAwMC4uYzk5N2Q0MDQxOGRjCi0t
LSAvZGV2L251bGwKKysrIGIvc2NyaXB0cy9weXRob24tdmVyc2lvbi5zaApAQCAtMCwwICsxLDQx
IEBACisjIS9iaW4vc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQor
IworIyBQcmludCB0aGUgUHl0aG9uIHZlcnNpb24gaW4gYSA1IG9yIDYtZGlnaXQgZm9ybS4KKyMg
QWxzbywgcGVyZm9ybSB0aGUgbWluaW11bSB2ZXJzaW9uIGNoZWNrLgorCitzZXQgLWUKKworUFlU
SE9OPSR7UFlUSE9OOi1weXRob259CisKK2dldF9jYW5vbmljYWxfdmVyc2lvbigpCit7CisJSUZT
PS4KKwlzZXQgLS0gJDEKKworCSMgSWYgdGhlIDJuZCBvciAzcmQgZmllbGQgaXMgbWlzc2luZywg
ZmlsbCBpdCB3aXRoIGEgemVyby4KKwllY2hvICQoKDEwMDAwICogJDEgKyAxMDAgKiAkezI6LTB9
ICsgJHszOi0wfSkpCit9CisKK291dHB1dD0kKExDX0FMTD1DICIkUFlUSE9OIiAtLXZlcnNpb24p
CisKKyMgU3BsaXQgdGhlIGxpbmUgb24gc3BhY2VzLgorSUZTPScgJworc2V0IC0tICRvdXRwdXQK
K25hbWU9JDEKK3ZlcnNpb249JDIKKworbWluX3Rvb2xfdmVyc2lvbj0kKGRpcm5hbWUgJDApL21p
bi10b29sLXZlcnNpb24uc2gKK21pbl92ZXJzaW9uPSQoJG1pbl90b29sX3ZlcnNpb24gcHl0aG9u
KQorCitjdmVyc2lvbj0kKGdldF9jYW5vbmljYWxfdmVyc2lvbiAkdmVyc2lvbikKK21pbl92ZXJz
aW9uPSQoZ2V0X2Nhbm9uaWNhbF92ZXJzaW9uICRtaW5fdmVyc2lvbikKKworaWYgWyAiJGN2ZXJz
aW9uIiAtbHQgIiRtaW5fdmVyc2lvbiIgXTsgdGhlbgorCWVjaG8gPiYyICIqKioiCisJZWNobyA+
JjIgIioqKiBQeXRob24gaXMgdG9vIG9sZC4iCisJZWNobyA+JjIgIioqKiIKKwlleGl0IDEKK2Zp
CisKK2VjaG8gJG5hbWUgJHZlcnNpb24KLS0gCjIuNDQuMAoK
--5dd707c8aefca53a80287b4aa87859be5f60dd9e69ea1e2dfc6c279ce4ae--

--44e1abd3ea18a8ea349c6fb2b07d82a6bec49652599fd2a60f6af9c26a3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZZlDYACgkQ3SOs138+
s6HXBRAAsSmvbEsN51NCB4QBYVV1Jn9Y+Tptu+xCkkaqDLbKNSCLAseuPQph4+Sm
yP9zBadxx9tzZ9IiJos2zcoidgtSZz6qf/fltaBjgKesq+YhIoRcjlEOjeBBK9li
d0jZrccvkzNDPJqvQWfCrT7GHcZO5xe1RJKw5YcH5acTmYI0JTkHUpmHPWdC5GFO
3gkvHGeth0Mus2+mGUyWXHgEWaL1iOyrm8fCDhuuFZlYxQfkuYbtsOGDz1gKsJWM
tQcCruBMsml9b5cF88NTLJpJ3drz5RqNkxaM793DXcZVTL0rPt9Pc5m331xaKlKl
yWf84jYCgaxFDk2f3IkWcg0Mm35a0dQi7LZ+LecsXtLZZB915wcAQV67dCIOFmyW
qyxex5Tu5jzxDoOJx5/SJrhIdB2Lz33u+XC6nvgAAhsiAKM6lnTkSq0E/s7dIW9z
9Dwhl4k7KpZ4MAPPqzvEH0osPi8ZqbUiv6xIUHtbo+g5ejAvqr/JXauknDacbvJ4
xSyYAkh7Aqpu6K/y9tuI/A9sDBHhUD8D/JqRXEc9BOxjOetDeg0vpvkMQbrntX/a
kk1pkuJrQwIsffqTOWrje9UcjkvbdzmNOknrC/uv+UTrgut/0Rn8p5zsuReU0hjD
SzzXJF890v2QiUMen3kfPuH5vxdiwXehagUZuHDJuUMmwaMcISs=
=cZjs
-----END PGP SIGNATURE-----

--44e1abd3ea18a8ea349c6fb2b07d82a6bec49652599fd2a60f6af9c26a3c--

