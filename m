Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E62473377
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 19:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241597AbhLMSAs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 13:00:48 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:45642 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236059AbhLMSAm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 13:00:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5B13D611B4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 18:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417A8C34605;
        Mon, 13 Dec 2021 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639418440;
        bh=YFqukNs+Og9qk/2yG+rJxGiiz5BS2yPPUMTffwav1QQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WS8oyyYJycmr/sHk2TzEhrQCrgB4i8oxjN1gHssg56OEA4uFh0e1Qcb3zeO/9zQzk
         9TJ6u045thOyEFuoROv4LUx6AUE/4OLunHZsnL36PLNrvdHJx8RzOozEkVUVP9wXXQ
         hJK9iWG58HESVEptEBCgqVRP4F0v2nu5biOt13n9WV7wJEpYr5Su4xjNpbzeX9xQmz
         f5c40IoCYaJ97q7HIY8WTPJAa3Zv976LaBlCs2/pBHfXjs8TZOExMrI2P99raOnnio
         ZtqlgWfRn3hnFLGsAon6sFtCuBh3gOjdMf7e586/ic/IMJTrIE7Yan3bnbeUbkv4yH
         hXPnZVJUye5Dg==
Date:   Mon, 13 Dec 2021 18:00:35 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Judy Hsiao <judyhsiao@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, judyhsiao@google.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] SoC: qcom: Distinguish headset codec by codec_dai->name
Message-ID: <YbeKQ3mLqe1RoUWJ@sirena.org.uk>
References: <20211210051907.3870109-1-judyhsiao@chromium.org>
 <CAE-0n52z=wRS3rXM=zQzcy1yryvzwW6iGA75UYBiYSkR_5edTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WyxKWAijYORUCs4s"
Content-Disposition: inline
In-Reply-To: <CAE-0n52z=wRS3rXM=zQzcy1yryvzwW6iGA75UYBiYSkR_5edTA@mail.gmail.com>
X-Cookie: No solicitors.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--WyxKWAijYORUCs4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 10, 2021 at 03:15:49PM -0800, Stephen Boyd wrote:
> Quoting Judy Hsiao (2021-12-09 21:19:07)

> > Fixes: 425c5fce8a03 ("ASoC: qcom: Add support for ALC5682I-VS codec")

> It fixes something so what is it fixing? Can you add the call stack of
> the failure and explain how this patch fixes it? We have that patch
> backported to our chromeos 5.4 kernel tree but I assume this reproduces
> upstream.

Please don't encourage people to just paste entire panics into things,
what you've included here is vastly larger than the entire original
patch which overwhelms the content in the message.

>  Unable to handle kernel paging request at virtual address ffffffbfe7bba9ce
>  Mem abort info:
>    ESR = 0x96000005
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>  Data abort info:
>    ISV = 0, ISS = 0x00000005
>    CM = 0, WnR = 0

Information like the above or the register contents is not adding any
value here, it just makes it harder to find the actual content in the
message.  Sometimes a relevant portion of the stack can be useful but
that's not what's happening here.

--WyxKWAijYORUCs4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG3ikIACgkQJNaLcl1U
h9DEvgf/SGigxmX4RClSIJHxCB78eNZyY+qRHmxY3ooT5MmdyLd4mqYAHxGvUnfC
EU8ca4McwbTvDom1GS0+Dwt2ICBJ1zW090xrQuP3QhfIoCG9x+G5uAfWVBBUBi1o
Rt0nYzMzvUSn0qbcaDt2UMjQBObE45kr+GUdvi8D/JwI/IjSNbe+swI3uMqi9YMx
71+yCi0ujwvds+EN8243AqAbKlSa84TTrA+EaQItnu/6q5/rZ4wGw0C03Uz4i4Mr
WjC6UHT3ReggqRqDsrJEzMdopnv5CF5LuByjWz/yBXKbNzpvMta2RyJ1hY7itOBZ
p73/f3DFGRpsB21CdaJvPV6FevqduA==
=zoNv
-----END PGP SIGNATURE-----

--WyxKWAijYORUCs4s--
