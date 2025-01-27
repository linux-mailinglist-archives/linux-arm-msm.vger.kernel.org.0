Return-Path: <linux-arm-msm+bounces-46308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3CA20122
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39B983A50CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7441DB365;
	Mon, 27 Jan 2025 22:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXb5KPk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABF91991BF;
	Mon, 27 Jan 2025 22:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738018361; cv=none; b=qm+gch1iFre2G5m+iLL56DBZgGnYDVz6QaoRl7DSefafd0yjdMigPn93RkIZ+Ofj+ptxF2Z+O3n+i92QdVFLQE6iJjLqU56wO52Qbk6INZup7TCMuA6MpmmpZlmE0F8/JoxdfVy0KJScZoXPCJTO76ZZuRyTrGIeLB6fRFx/+Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738018361; c=relaxed/simple;
	bh=1bHnV9dPOYzzIXzHfF8t5WGKzDZNNjBYgAKsqoYIa8o=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mYChx/DKUUQSxvglYFr+sy0wQ6F1f7sLxRRwrcb2N6hYsYFgiCk5k20jIj8xkow6Dxq8ALvOyg1FRfhwq2H/Vqr2x8EX5MKtrvWlB35kPMV9mZ082gJERu8Ifbcvq/btpVI0aJkSRY3Nj1fG6iZy8csG+VIzxcJHrTpKJvS9bQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXb5KPk5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E3CC4CED2;
	Mon, 27 Jan 2025 22:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738018360;
	bh=1bHnV9dPOYzzIXzHfF8t5WGKzDZNNjBYgAKsqoYIa8o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XXb5KPk5Dg7bgtbWNpFrSZLNGflbdxbGKegbLyFA1ZoibJ4RQnldJkNctJpKZ7474
	 5tPFkJOat4A3aW4gTloCMXdjCwTX1caHFCi7+r+m49th4u0pZYwjpQtWR8WOIHJyX/
	 cPzvv1c0pkYB6T5wkXwFqm3LOpbiMsWZbocqYsjLowg9vTHylLGMefRsKT91PA04Gq
	 45E3Z6u1az3f+jdEP1iqSe5OY9WYrS/EvYoDSW0OulSU34/5fEqKw791S8hF1AuQAW
	 LIn12AK8KAxRCUHgWIPvasSV+GihRF59LyiXPb+S/a5jsjE+h0d9OVT+lAR1LYH1ir
	 2arDK5EGpv23A==
Message-ID: <9e9f5321ae41a7d0114bf23a437f7639.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with exposed clock IDs
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Jan 2025 14:52:38 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Krzysztof Kozlowski (2025-01-27 05:21:04)
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

