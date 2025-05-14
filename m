Return-Path: <linux-arm-msm+bounces-57997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E1DAB77A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6E0A7A60D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC6A2980C5;
	Wed, 14 May 2025 21:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nh5garwq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640F32980BC;
	Wed, 14 May 2025 21:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256679; cv=none; b=qCZ3yxxlg+Q/tF6LJ0qrny6NMgdv7qM3Yw9AX3BCaaunH1yDQvD8JkYFdnxQXXPaRM/M0+mBFyYqL1xBg6Rm/VUd78PQS7EP+/Xq6CQlGIu5mUR6HzCNcILyGj0jGeXDxR35RHPmxQ0dTL2vYXfqtw12vLSOIJ2o0ciMNJo5cik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256679; c=relaxed/simple;
	bh=s2u2b8c5FrqPvRHZEXaSPt1HFS70iOZgwHrtFP+mqes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VQUg3m65T9y7caBQFsIL5lKjSPjKpIsn8/8zXDoGKG7tsPrXgjpjx4gHdjp7E/y9+nxkaepmayRrcK9kcdJYQV7xDv110OoFXdK5PT2YL42aa5pBtrSWD6wu0yK2r5IiMkQjghVEc+G/wnYTwsVVL9FQlxTrdsmLIT9ls9lZjxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nh5garwq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D37C4CEED;
	Wed, 14 May 2025 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256678;
	bh=s2u2b8c5FrqPvRHZEXaSPt1HFS70iOZgwHrtFP+mqes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nh5garwqQyEz4FPZg4q8hTBDmokrAbS6jZyBbymLjVcZYyqfFF+NKnSL64izuF6n7
	 k+wVLTU20nL94j/1j7rXxN1LwI6xZbFkFVmC3PtbrpVa7MqXXzn7s8MXhMEWYpWb6I
	 wIrAVgeVM6lIyTOcQQcdeBpSfPOd9SGqXTzmQjPayrWiWGMx7KU0FFtBqZjqy3Vff9
	 bIdHHXchzOlMDCHEsjDCgLU9aqJLxBF1jDg9JY2johXNEE6f9cPhVZ2ZuLWC5WIdg5
	 1P+RUhP8KM6B8y22IvPpJdokeL3n/LSmD2+60XbJG7QaXXxx5Zn/tvJr0O1qw/c0mH
	 WYPLmuFBZFZLA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add the missing l2 cache node
Date: Wed, 14 May 2025 22:03:51 +0100
Message-ID: <174725663059.90041.12352596711820703957.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405105529.309711-1-mitltlatltl@gmail.com>
References: <20250405105529.309711-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 05 Apr 2025 18:55:28 +0800, Pengyu Luo wrote:
> Only two little a520s share the same L2, every a720 has their own L2
> cache.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: add the missing l2 cache node
      commit: 4becd72352b6861de0c24074a8502ca85080fd63

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

