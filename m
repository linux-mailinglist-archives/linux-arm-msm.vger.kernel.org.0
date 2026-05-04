Return-Path: <linux-arm-msm+bounces-105756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB/TBB6t+Gn2xgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 16:28:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC864BF868
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 16:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E0353024C28
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 14:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F02F3D9DBB;
	Mon,  4 May 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6H/8jn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186613DE443
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777904169; cv=pass; b=fyU3KDDlsquUa+XRmvPGcO0BXDnxOTgTVf9rxGdYsdj9PlolzoaGxqZuNkgsKvKDZNAsS3qbsafw8qX5GNsIAGWscBpgQW5vnbDu5GFE6BgbDyT7awEhv5tO4SY9+NxrcejKyGf8qTuNbPQcsmtx5ESFaV5DaXKlVyFGCboET0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777904169; c=relaxed/simple;
	bh=VOn49HlNRay1uKQzA9gv8X3gxIOUwSLBeqqmLJ+Vnq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQZiPtVb+iXuUnCKISmg0NtAONPKAbUPOvp99SejYHF6yeVgAZTdLDSYmkRaeo+xZyTmERtTfu7Ed2l8v51JpuAbrmUZywL9kcMS3ECdurCQsbBWerjoNRKkn1EPjEI4uHaFID4BwPh5yXme/VILWKa1IJ0vgjehzs9nZbs01/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6H/8jn2; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64eaf8aa893so3272130d50.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 07:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777904167; cv=none;
        d=google.com; s=arc-20240605;
        b=bvXStut5UmvNnvX6JPjqL+t37xaSUw69eM+ebWqjRSRp8jb/wSodHHG1dbyuyyP8rZ
         CERZoW3DSRnpHGHKJQfq+Ug++CL+ZeDaZE3ULDhSRUv5a1DCUxFjiC4Z0ugnTC0x4YiL
         Zwfvc5CsiWmG2G9hxTpRSGeeHHwf8H/004hNnfX2/eE0T4EL7vQV/gKIJFmbj7wWTAzS
         T4RNeNMoF2+L9Rxml6oiwyHGPINoRqNHtQwVFR20v7SU5U0UFyQqPZY38Ba33s9MnvyH
         fQkAp126pnPM8/6k0rYHHqfvJ4xwvYHTYBP7h3qeKfuMVkmxEwFBxbo5PUnj6VcJz0pC
         Obeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KJYvNhQ3mzD7bXhkgriTfy1RxP23dOYPeDTU/pUBZ1I=;
        fh=MqH9r07Df794DLKoGddeH5/S0fBt8TgzX9LavusA0SE=;
        b=kxUBhsFV0WruIekjd/nZblb7WI+xytk9+A9oSgip1rLXqfjxS8bigtGSTW4wt01LzU
         iZpd82QmICo9Y+oX3ylBO+wSFuGE59UJ9G3p9w3fWrJuiIKzR3zGaWXfsOn8BMZwOC7r
         2qVAIEGxNgywrXHCm5zCUHfYHIYNx4K4Qy+MHh+fP7+N4e0EuyepW0hjWCWDFNa3cN1h
         KX6KYP50Z9dpLDynceJOD0MmPFStuHdFbXSdAtZsLVuuweJYIf88xZhzt6wSOhI9CJ+T
         QX/eOtgHuIKAW7e5sg43TA3baRKy+4d7wDPHNJiSmpaJ9lIoYTl6AJ77PtkMXVwLQO36
         QZfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777904167; x=1778508967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJYvNhQ3mzD7bXhkgriTfy1RxP23dOYPeDTU/pUBZ1I=;
        b=p6H/8jn2uNhEs2uENPb4RwTeH3NQkKU9CoZkey3WlD1mF0EiCUPfPrnLXbdZ4++/Rb
         Zbw/h5veLwFcqG2DGH7Sli9HDrm//q2oW3Id3yYR2RnvEIEfgjtLRodgVjm7uD4suNVj
         b80gPzPHjLTOci+4wfDFS5nMnBaFAyxffDS0yEjowYcxHvlcD2Kzcbc+j3g++b30esdi
         nE6WlrZp6LSJXDmZEodWroJXHv3MDo3mAaLTFIWUhKsx3PM/2+yTYOBSuUTsWFO0My8J
         MCq8gz78T0W0OMrwq7rRoD1T3qXJ1g7PPlc2f5eyA3aBZELlHUZXUi4wyM5j1EnaU80w
         ShuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904167; x=1778508967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJYvNhQ3mzD7bXhkgriTfy1RxP23dOYPeDTU/pUBZ1I=;
        b=Pz3tugND0O5+NPz7IR1DWwQ9vaHVjuFZZGRE9VKrWi6T4f94POLPniGT0UjACjpLaS
         RNievfcrMd1fAeM3jIKi4wiatNBt+v5UqmMyqeJE+oDm8PmEE/J8FjT5vZgEoi+Wad26
         0ZIX9hr0PnMnaR6QMg2xSHU0OZ6b+YD6CN4wCC3IZ9nFUlw9+4YDorZ5LuxRW80+Jvfi
         McBFXGzQIGirxZtb8xGMuvSVd5krO4exOuQYr9Nacsikk8HnNZY4mk7XWAWThmnaNeFo
         rtDic4x3wCzxlN81cAa6Ef5PZBencX0xd7ULL1aHplS3sccNf1IlYBQf/zuXtJ7jvmhi
         K1UA==
X-Forwarded-Encrypted: i=1; AFNElJ8URMFFb+/Krug1xK3WLS01wK8wKPHlvCUJ3Vcw2dBK4CjHD+E1/xmkQX9BfSmBrdiwbDAuDmNAyKWEbOZa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9eQlpdbOMYvuruQ+qy7zvR6P/KKJISPq4NfRqJgnwKEvhDtOC
	o5M4S7jiXIpA60QunXmNOqvYGU8jY0sddRPod3k/eb522Hnu2eY+oalv+ZdfC9QAfy8gfEQESWj
	h3bs6dbpYnQ4nmflpq+6PTC+SJGawlmA=
X-Gm-Gg: AeBDieuBmHl3fdB8RRhAowZf8RzlCLuHUXUp/V5N7MyLXo6H+FTHTMuCRjKwnMzfvnY
	u/sQzdovtENCHLFXRDg4/y5EJ+XoXfZTQR01gfWpji7vWcgSmxf7CMPMfPknZNeRv8+DoivpRY6
	knl5iBvqVOeKWN0tXSWUN4LINALsRVQnYnT5xtYShDC1ilm9fW9NMNeTkb6Xl5vRoOBZDzplYd2
	r/UMCx7Yback1EDqh8kz8qHmlgucerNWhS92V7i1IEE1wpa8kuwiwWv/3VvszSl1XFOBtJ3xDMh
	LpwXypxkRDB2KjHA+Ew=
X-Received: by 2002:a05:690e:1186:b0:65c:6452:1ccf with SMTP id
 956f58d0204a3-65c64522530mr786151d50.8.1777904166584; Mon, 04 May 2026
 07:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
 <20260504041407.289464-1-threeway@gmail.com> <ffd59407-c65c-4f99-a587-3b968f9c82c5@oss.qualcomm.com>
In-Reply-To: <ffd59407-c65c-4f99-a587-3b968f9c82c5@oss.qualcomm.com>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Mon, 4 May 2026 09:16:00 -0500
X-Gm-Features: AVHnY4JCkZFUA50J5VjxRP-M3UPWI_XzDvfu0OdsGPxK7C4Ok0bBFRM_vOJe338
Message-ID: <CAOvMTZgpYg-UFuQE01NsECTPf3UEHDifnCLYu7iEqOUnvzs0Ag@mail.gmail.com>
Subject: Re: PCI: qcom: Add D3cold support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: bhelgaas@google.com, bjorn.andersson@oss.qualcomm.com, 
	jingoohan1@gmail.com, jonathanh@nvidia.com, kwilczynski@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1EC864BF868
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105756-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,oss.qualcomm.com,gmail.com,nvidia.com,kernel.org,lists.infradead.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[threeway@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]

Hi Krishna,

On Mon, May 4, 2026 at 2:06=E2=80=AFAM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
>
>
> On 5/4/2026 9:44 AM, Steev Klimaszewski wrote:
> > On Sun, May 3, 2026 at 10:37=E2=80=AFPM Krishna Chaitanya Chundru <kris=
hna.chundru@oss.qualcomm.com> wrote:
> >>> v4 of this patchset *boots* along with Mani's patchset, however, v5 d=
oes not,
> >>> and unfortunately, the machine does not seem to get to a point where =
I can even
> >>> get logs from it.  Do you know what I might be missing?  I have *not*=
 attempted
> >>> to remove the nvme drive and boot off USB to test it.
> >> This series, will not have any impact on the boot, this series comes i=
n to the
> >> picture only in case
> >> of suspend and resume. can you share your platform details and kernel =
you are
> >> booting with.
> > Oddly, it seems to, because if I simply go back to v4, the system boots=
.  I'm
> > using a 7.0 kernel on the Thinkpad X13s (SC8280XP).  The sources are at
> > https://github.com/steev/linux/tree/lenovo-x13s-linux-7.0.y (with the v=
5
> > applied).  PCIE_QCOM is built-in to the kernel.  Not sure what other in=
formation
> > is needed.
> Hi Steev,
>
> I made mistake in re basing the code, can you try below and see if that f=
ixes
> your issue.
> I will send this in next patch series.
>
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1327,7 +1327,7 @@ static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struc=
t
> dw_pcie *pci)
>         struct qcom_pcie *pcie =3D to_qcom_pcie(pci);
>         u32 val;
>
> -       if (pcie->cfg->ops->ltssm_enable)
> +       if (pcie->cfg->ops->get_ltssm)
>                 return pcie->cfg->ops->get_ltssm(pcie);
>
> - Krishna Chaitanya.
> >> - Krishna Chaitanya.
> >>> -- steev


Indeed, that fixes it, thank you!

-- steev

