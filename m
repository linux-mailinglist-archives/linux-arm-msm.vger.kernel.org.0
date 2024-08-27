Return-Path: <linux-arm-msm+bounces-29666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6769616C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 20:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CFAC1C23232
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 18:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851A51D27BD;
	Tue, 27 Aug 2024 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwwiMCFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59941374C3;
	Tue, 27 Aug 2024 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782693; cv=none; b=VVWe2oxdFYAHBd+qXd3D/dRW0UlKUYqiwEafKYtvfsPm1vg299wtj8kbXaY/CHorn0OVX/1njlQ/4ev2T59LTPHBrdzmsM0zozKk5Xjpd806uOGRNSpMXcrpNvxvwVl6UHGdw01njZu9UFBVCQLvBqLr06P0YHXdNEzOH7TGzaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782693; c=relaxed/simple;
	bh=IXz9gAaOWQc86hDdF+gkfvUoCEpLdsuH2wBKB+k1v/4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NWB3rmguFVkb1W/fck36xV9ifCU9WzmYEK82k/pSOuoh1liZFTrv24OnYbrjYsrc4GQXKpg/5Wix3gM07h5ReDO9nlvjmYjxPrx7IAnZEcNqb/aGKRQ6W0A5I+I+ZuMmsV66KJbkKF84Hp0T6T8Xe67eFj8cW7+u2bqJVsM22ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwwiMCFO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5B7C4AF0C;
	Tue, 27 Aug 2024 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724782692;
	bh=IXz9gAaOWQc86hDdF+gkfvUoCEpLdsuH2wBKB+k1v/4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TwwiMCFO4fEbx//cyIUMV7L8/LxvNbRZ66l3nENqLqbbNUe2Q9J8iMKuAnPqnNuFt
	 m/khH2d4ZSnwG71bOYwbSnsOQpYy37VoREpMgwowc2ht/PlD7yUe9MMDMArd8Y2Qx+
	 mhITSP1HkhZProh5Fzd5zLzfuACkJfgUQkZJkwBJ/cRK4tsqGp05Nv8kHmlSgYZvCy
	 sdDhJ17z/f+sBgdcsIRBLGcHZr14nGQ5V00znlrbtwXkQ9SO7OVpV/epj0kX1bOcMT
	 5bHHsBQEk/IZYt/7pItnrQhkN5a3EmzNvMaIW1jYPUPsbFTuE8OrUE6ZQUHS4XHPql
	 aLCW5ALF15pTw==
Message-ID: <9ce5d7b09b5358c9190d8a999d79de23.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240827025252.3512746-1-yanzhen@vivo.com>
References: <20240827025252.3512746-1-yanzhen@vivo.com>
Subject: Re: [PATCH v3] clk: qcom: Fix error checking for devm_clk_hw_get_clk()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, opensource.kernel@vivo.com, Yan Zhen <yanzhen@vivo.com>
To: Yan Zhen <yanzhen@vivo.com>, andersson@kernel.org, mturquette@baylibre.com
Date: Tue, 27 Aug 2024 11:18:10 -0700
User-Agent: alot/0.10

Quoting Yan Zhen (2024-08-26 19:52:52)
> The devm_clk_hw_get_clk() function returns error pointers.
> It never returns NULL.  Update the check accordingly.

It can return NULL if the 'hw' pointer passed in is NULL.

