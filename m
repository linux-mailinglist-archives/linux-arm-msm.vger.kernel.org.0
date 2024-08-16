Return-Path: <linux-arm-msm+bounces-28836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E30359552A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 23:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17AA91C21DA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 21:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466B51C3783;
	Fri, 16 Aug 2024 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEzU0ThS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1486C13DDC7;
	Fri, 16 Aug 2024 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723844904; cv=none; b=KYe4BIoa9tj5C2mXVzX2fIxXL9L3VK4sP/TAtg2oAekC9pru3r4Os3dH5EwlG7pwNPaINWDoblE+1hPxWXuowbPV4MImnzvxySUDwArsro04W5+c82sTzDZGOHNv7SrCJbrM+wbc8mGkhONgzIpQOKVEQ5mYHzSY46L+3BcEEYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723844904; c=relaxed/simple;
	bh=rL46LviV35ffgtQIRMZzkC9729C3qrIS+NxdvXSXBZw=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Y9YPf2k7xs8sry1xkuE9NUWHvHmt3Y8kZPneU1QnO7cX3dvOZ46KVEeGWp4057SZljWIfvyW6lB0zpvto5YcrYZT5e8OfRHfZHR3L6KwwxG1mlz1lds2NAldgbXGeRpEyGba4LHFI7w4djCZlQQlPmVe+llPxy+9Za/cif6rvPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEzU0ThS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDD8C4AF0B;
	Fri, 16 Aug 2024 21:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723844903;
	bh=rL46LviV35ffgtQIRMZzkC9729C3qrIS+NxdvXSXBZw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cEzU0ThSRKssJPdpdV5PmLqAr3StTwcoO6tZw4563Dh/S5N9cXaUNTq/E7dzE0Wp/
	 5CoICPWFtU/F7xofJQuSM4yjIfJqb1357Iw1BxPqRT/ny7LkJSFB9fGvO/aa6oGP6Z
	 LSYwJeg6K6I6wtm1BipzJZ3KhiM0VcCOkjMUHgYm6GU390jbZk2TpWgpQ2Ezv2zCqn
	 EkAt+OVI8u4wgklf+xgvD87ZVVW0EH2w1TIkJwkSTyiCk/QGPY9Jbj1dgfuAeXGEsy
	 +PchzFlpr79X0uzSzST8mqpBFYqNdXddHCs+/D6ph4TQnGjHSRuhys8aM7bCE8g+3k
	 LowvQKKD54gLQ==
Message-ID: <496d7baf4c0e7e83c54f57edf789eafc.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240813120015.3242787-1-quic_c_gdjako@quicinc.com>
References: <20240813120015.3242787-1-quic_c_gdjako@quicinc.com>
Subject: Re: [PATCH] clk: qcom: gdsc: Add a flag to skip setting power collapse bits
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Georgi Djakov <quic_c_gdjako@quicinc.com>, andersson@kernel.org, quic_mdtipton@quicinc.com, quic_viveka@quicinc.com
Date: Fri, 16 Aug 2024 14:48:21 -0700
User-Agent: alot/0.10

Quoting Georgi Djakov (2024-08-13 05:00:15)
> The sdm845 platforms have a hardware issue that requires keeping
> some of the MMNOC GDSCs in SW collapse mode (which is the power-on
> default). But if some driver tries to use these GDSCs and the mode
> is updated because of runtime pm calls, we may get a board hang.
> Introduce a flag to skip any updates to the power collapse settings
> for the impacted GDSCs to avoid unexpected board hangs.

Can you add a Fixes tag? And does this need to go to stable kernels?

