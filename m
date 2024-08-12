Return-Path: <linux-arm-msm+bounces-28344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED394F82B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 22:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2501B1F217B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 20:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57628194098;
	Mon, 12 Aug 2024 20:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDWIz29g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F71183CA5;
	Mon, 12 Aug 2024 20:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723494277; cv=none; b=jiFI9gm/r7/IkaC6ySfIP9FTGOV43qB15I5QX6q9Hx5859luJP+FnAjg5TYQKNkF11tKL9fuELh0Fpetln6NCrT2kIiejmkZqG/hW6RFwOGwwMu8LyEbdETqZ2OAYVwSbiobxD6zcenB1HCxD3FWyW2lSysUsx7zdsKCXbxeQTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723494277; c=relaxed/simple;
	bh=qeVfUIcoWdhpUtM/u3eGhXh18DwBT5NJk6teiyVCXc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAHU5s3ooE55jwgOeC3PDu+V0Nvd5P994+pnU9LylAwyAGW9LkuvkShWAjt+yI5kP+Frwnx/T8h0D+doi3xIvxIDHPBxvWxV30EWZ6xHqDQGgO6wOpLgRRWa3OXOoaydQFLbXs7sFb8uCDVZ8CA30kzaloAHJBkvaOY2OajNBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDWIz29g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0F0C4AF0C;
	Mon, 12 Aug 2024 20:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723494276;
	bh=qeVfUIcoWdhpUtM/u3eGhXh18DwBT5NJk6teiyVCXc4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TDWIz29gbxn0i5R6I7puBRaIoL3mzVtHfge3jmD7Bsdl3aA5lfTapvLI3sMAXGPEw
	 PI4GsEzrPlM8Ns4P6qianppIkWh8+Dw53KpogQqRp0GiPxLV0wz9bfmaiyGK9aeA4J
	 0wHmRyxqpjUkviQ79xQxWgVBAivlwnOLyoFAbdh6TyxV3Cj6TFdRrpUktNYK0ZPfKv
	 QR5KHRgCrwSTozdRPZkaDW8ury1FcURRHSZNCQF1XCKrLdonefIRnCOxRMorqS5IgT
	 z+WDAExPR+Ot+WgS1SvmZHOXxiDCppd7b0bcPVOGBzfFILVpwkV0toG2ewbkBOPzyy
	 HI805Zb1oYUtQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso51768011fa.3;
        Mon, 12 Aug 2024 13:24:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhHdw7hH3qr99YE6yqC8o16OcwZZJ+oHgx3GFRPHDsi7f/UyIlBePUtrOHhCVtCJTT49OT5fTrwGpvTPB2KFiL8gnodji/jIAesK270n4WpZYeIU+96AThWww/BH4XJbpeByQgprBOVn7uv3l+8tWnMht475O87d+0zr4zQXGR6oRgjmS1RFfMeifD1ApWtYg1Yoi6oT4kXiCF1SObmflP06g=
X-Gm-Message-State: AOJu0Yx3guwvjllQ8cxW8aVScWDq476AQm+t76ilfXJ+KBCakBAmpDWX
	YfHNTLNKka0giVs0Is+r5TLGYVpCTFQ3b7Bxw7euZLG17XrNY1O8i2N9peO7fDXcJAGV70tOJYs
	sSvf7UP8MoVss/fU6Fwe8eSgyjg==
X-Google-Smtp-Source: AGHT+IHjxVfCOndn+b47XGHH72cKUiyoILGnoGfWC8XZdmZexSAAw/YL/bL1WxJ+jTMixEgHzL/lZim6CTMEs11wsSY=
X-Received: by 2002:a2e:461a:0:b0:2ef:22e6:233f with SMTP id
 38308e7fff4ca-2f2b7155856mr8169011fa.21.1723494274886; Mon, 12 Aug 2024
 13:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com> <20240811-dwc3-refactor-v2-3-91f370d61ad2@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-3-91f370d61ad2@quicinc.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 Aug 2024 14:24:21 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0pX7P70OE8suhCpSsffPcqQffLEUqc3+LSX7ocf-iXg@mail.gmail.com>
Message-ID: <CAL_Jsq+0pX7P70OE8suhCpSsffPcqQffLEUqc3+LSX7ocf-iXg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] of: dynamic: Don't discard children upon node attach
To: Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Saravana Kannan <saravanak@google.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 9:07=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> When dynamically modifying DeviceTree it's useful to be able to reparent
> nodes, but of_attach_node() clear the child pointer and hence discards
> any child nodes.

of_attach_node() is kind of the legacy API. You should be using
changeset API. But I guess you really mean __of_attach_node() here
which both use.

> Retain the child pointer upon attach, so that the client code doesn't
> need to manually rebuild the tree.
>
> Current users of of_attach_node() either avoids attaching nodes with
> children or explicitly attaches nodes without children, so no impact is
> expected to current users.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/of/dynamic.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 110104a936d9..32e1dffd9f96 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -221,7 +221,6 @@ static void __of_attach_node(struct device_node *np)
>                         np->phandle =3D 0;
>         }
>
> -       np->child =3D NULL;
>         np->sibling =3D np->parent->child;
>         np->parent->child =3D np;
>         of_node_clear_flag(np, OF_DETACHED);

Before OF_DETACHED had a clear meaning. Now, are child nodes detached
or not? If it means not attached to the root tree, then it is
redundant having it per node. If it means parent and sibling aren't
set, then what's the point as we can just check for NULL ptrs.

This all seems fragile on top of what's already fragile.

Rob

