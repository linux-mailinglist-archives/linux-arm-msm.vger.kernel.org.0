Return-Path: <linux-arm-msm+bounces-26599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B993529E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 23:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B68B5B21A43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 21:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215857D3EC;
	Thu, 18 Jul 2024 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdMOX1/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9907711F;
	Thu, 18 Jul 2024 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721336564; cv=none; b=sgFh13gSngA6VzXFAQKVmxL9ZUJT76cGnS9r1NdwafbnixW/nh5WxxTZhW2PW71wm6oa+PNRnB7Cmyp7VBu40BXafG08/EiCEA4SMSFf5rGYVDdWl8dB/o89T/EaQJcOP9SzPC9+U6b7wetVsbse5MqqmnhY3xS2d+qhhsG6KJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721336564; c=relaxed/simple;
	bh=JnJPdOQ++LyvYtN/uFD9SPmT2LCystUqG8M2Z8vySzM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=jkU+PxfJqbiXq3IogfabEkkmHhDM+2gUiDI6GpSz2PTzN50X5nsbpBqxHeJQpYjUdj7krxYG82GRjtSO1fwtGgBY0d1xVBHzIjY3YQhUK+GKpExcj/H+Icst9bbLI7FroK7N3sC5quFXR7eNWdw9tNdKHrT0c01NaCg+uJh23hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdMOX1/H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6FEC116B1;
	Thu, 18 Jul 2024 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721336563;
	bh=JnJPdOQ++LyvYtN/uFD9SPmT2LCystUqG8M2Z8vySzM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IdMOX1/HQmFOJCbkM74K2VnowihXunqK/qAj/tDmXQmjgZi6Qc1KW4hmtEeQX2rPx
	 RzhAFWJYv1Isg++nVrH1B0IyRHq0jUOkyOJaK5x+QUyaqd60XPTgKqKsDC/34LQyE1
	 OJTD7NXVFyWjXQhtfqjJNx56XheQNedRRikOQhNeYucHH9ghYfMXPGnD31bvwLbJmF
	 oNqgz5e7V06GZ3qhVtrYwt4M1v8wh42cTK/x7r4XcqCJJGFDMJK999s33Pw6LJk4o/
	 lhprH3RtSSZiMtKwM9HQLkGH23OmlyzHlYq4SEUDL3eGb3eQQNFj9noC+37Huj5Lxo
	 RCOqo+LGEhplw==
Message-ID: <83d0693141a5c2ba7481f7ba9a7fd40c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240703221248.3640490-1-quic_collinsd@quicinc.com>
References: <20240703221248.3640490-1-quic_collinsd@quicinc.com>
Subject: Re: [PATCH] spmi: pmic-arb: add missing newline in dev_err format strings
From: Stephen Boyd <sboyd@kernel.org>
Cc: David Collins <quic_collinsd@quicinc.com>, linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
To: David Collins <quic_collinsd@quicinc.com>, linux-kernel@vger.kernel.org
Date: Thu, 18 Jul 2024 14:02:41 -0700
User-Agent: alot/0.10

Quoting David Collins (2024-07-03 15:12:48)
> dev_err() format strings should end with '\n'.  Several such
> format strings in the spmi-pmic-arb driver are missing it.
> Add newlines where needed.
>=20
> Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead=
 of arbiter")
> Signed-off-by: David Collins <quic_collinsd@quicinc.com>
> ---

Applied to spmi-next

