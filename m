Return-Path: <linux-arm-msm+bounces-61959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C4AE2C64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 22:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DB651897C74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25BB213E78;
	Sat, 21 Jun 2025 20:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M677msOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAAB4CE08;
	Sat, 21 Jun 2025 20:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750539079; cv=none; b=klq8TnUY6+FZf6Mbd52Tnj5khPOSjE4smHKmu8onjvsFYdKJy5J/++meZqC+DnWtYmkGv4SP0mCNQU7roLt1IUCvZBjwTbR28M071BSAWHers1U05PH9AoN7WVgxW3QfbUbaV1zOcX7iwDU8fX8sVMaWCX8i9I+5+lYC8uVEX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750539079; c=relaxed/simple;
	bh=B+DuNopW44+Lh7XHj4O2MzRgvBUrBmL58pqFDgxbbnQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bBwaiadZ/cKoamoWl/954D2MuUZ6s8peDXYoVKUiRc9EE5rgw3Hj3H9HY91BZErDRUtSTk6WCrOmaIuXsFOsp3xoNpSbtEBbNX9HlfbzZWtcd+l3g8DsbfcLNrlj3KRQt8IDIo3t9mSmji+lb4/lfLdbZhRmn4jxy6nYepxuLvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M677msOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2648FC4CEE7;
	Sat, 21 Jun 2025 20:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750539077;
	bh=B+DuNopW44+Lh7XHj4O2MzRgvBUrBmL58pqFDgxbbnQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=M677msOz5QqeisCcomJhJdH5mYIg/X0Hre6RPDykAA70W0SIYwwLTZFI7lVeZE6yx
	 gQ6Dm38jBqTdYeQyJ8rMR9JEEm8NyKQkpT+6PgiaNFBOhzd6A0kU08FQq0JsKZjkQU
	 CVpr3J8GrtqicvzX0SNORe/q1KgPyqfH3+CKWSQJrXLFznFu6DM7ioajp3yBr8OgyP
	 MHK7xkBpyMMkdVipmlBhLrzaejUUh3pyXUXHCOHsi8FzkLgTIb28b35wcuIkLw2C9a
	 P534mf/f8T6+DXXJ5IlYQH8LovHalYJ5wG7L0mr05NWoWD7yLJO/ZwRGRFmGe6YuNC
	 GOF7v1iWW9U3A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <jvsdn67x2qm2avaktnpqzoixcd46xuuf6i5kpeolsnewgoqt6q@jid7unlmmu65>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org> <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org> <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc> <aCNGSwL7043GoJBz@linaro.org> <20250514160841.GA2427890-robh@kernel.org> <aCUHTJGktLFhXq4Q@linaro.org> <20250521-psychedelic-cute-grouse-ee1291@kuoka> <aC-AqDa8cjq2AYeM@linaro.org> <20250523-markhor-of-fortunate-experience-1f575e@kuoka> <jvsdn67x2qm2avaktnpqzoixcd46xuuf6i5kpeolsnewgoqt6q@jid7unlmmu65>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node for clock-controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Date: Sat, 21 Jun 2025 13:51:16 -0700
Message-ID: <175053907628.4372.13105365536734444855@lazor>
User-Agent: alot/0.11

Quoting Bjorn Andersson (2025-06-10 20:31:57)
>=20
> I'm still sceptical here.
>=20
> In the first snippet above, we describe a single IP block which provides
> mailboxes and clocks.
>=20
> In the second snippet we're saying that the IP block is a mailbox, and
> then it somehow have a subcomponent which is a clock provider.
>=20
> It seems to me that we're choosing the second option because it better
> fits the Linux implementation, rather than that it would be a better
> representation of the hardware. To the point that we can't even describe
> the register range of the subcomponent...
>=20

Agreed. Don't workaround problems in the kernel by changing the binding
to have sub-nodes.

