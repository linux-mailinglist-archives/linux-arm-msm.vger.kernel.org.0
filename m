Return-Path: <linux-arm-msm+bounces-40131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D09139E2965
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 18:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7532168465
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 17:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2738F1FAC5B;
	Tue,  3 Dec 2024 17:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLyEEYXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62101FAC49;
	Tue,  3 Dec 2024 17:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247306; cv=none; b=Mq2oZv+8X0wfF54YUO5QkKCXygoWEviffqxRB7H/sHsrdOOw5IqPrviOYPrhJIbdFieh5VNO29wfokI1EI6hxRvU7w8Qq1DSN1d+9KfEywBiXg1+Jf48sNNc13ic1+DgVW/pIln61yuOZYuNemeWuZi4OfAXG4KY1X9LRs6070w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247306; c=relaxed/simple;
	bh=eA6QP7zlUPnRlFXlRnRcNKCoZoisj1nJYt9ogZo9SG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OA9wMePaRt0Z3Txk13SwA3dlGPy6tommsN6cbbV6L9Tqc0sjHH97pgVMuHJQG0AoPirKEIAINuuxUuRzFx8L3VEKYwxMBsDE6hyZWgD6kTL+AOzQZ+XVB6BKZgGz+vRDFhGCTLwZBXOjt0ES6Az0JoOSmkwLWHKvbNGypX8wrMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLyEEYXo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D311C4CECF;
	Tue,  3 Dec 2024 17:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733247305;
	bh=eA6QP7zlUPnRlFXlRnRcNKCoZoisj1nJYt9ogZo9SG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fLyEEYXoWUST6plAxXF7rPC0TddytAInGAOP/iqc7k9nhdiMThegRhAq03M0uRwgp
	 R3Jsv4XjoRq7calZCE3fITyeuIxbXCiTMemgGVW8Wn3J/d0GdGzQNHZhNlglW60THM
	 fEJQjarODnPSGuhtKD1S1oSQmHUyTHKTzelft7K5Qvavqp6T7y8N0dJ/JrwBQ8YBZ5
	 7S1TLT6XDsvc45I1E9OLJu5f5OSJjncs6+6fqlBI8/Iqjbg+p7wF0maZ7N94rVwbJ5
	 YIqabMqosKaVab3fpkAWB2RjD9QgZ9gBSm6WwNbceQoNY8Ba0rSaPrIWDXQ5oFoTGJ
	 lHzyLwbCXLc4A==
Date: Tue, 3 Dec 2024 09:35:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/9] crypto: qce - refactor the driver
Message-ID: <20241203173503.GA1510@sol.localdomain>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>

On Tue, Dec 03, 2024 at 10:19:28AM +0100, Bartosz Golaszewski wrote:
> This driver will soon be getting more features so show it some 
> refactoring love in the meantime. Switching to using a workqueue and 
> sleeping locks improves cryptsetup benchmark results for AES encryption.

What is motivating this work?  I thought this driver is useless because ARMv8 CE
is an order of magnitude faster.

- Eric

