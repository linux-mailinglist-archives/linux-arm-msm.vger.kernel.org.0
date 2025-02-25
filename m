Return-Path: <linux-arm-msm+bounces-49364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05290A44A57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673293B5890
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E8020C033;
	Tue, 25 Feb 2025 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kldOzG+a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD3C20C006;
	Tue, 25 Feb 2025 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507508; cv=none; b=qiRwynU/50k+I99vpI8I2mLV1UoKUyi6kBic1H7qfzS5qMLLTXQvFL/mHQqw5rHj6K7sHxd+YNCJ9GCG2Gr4s/20hZEiCvgZn4F2QvuNcd7r6miqekJKkTgk950mHT1XobOmIEh7Hm+QFzi9UIpcqs7DEl5D5hNhpAVYOQ+XZmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507508; c=relaxed/simple;
	bh=Xft8rabj4Z6MJFzoPQ8QqkOY0yZRQgoBvhMCTp+o4nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qHM/tlt8JyY5yuM3UPTvC6eGYODttuFT20eTwRsJGdDFOKMPrlyExnJaNn5aJk1T0GiZEik7wnvlF0nH+2QHKYQH1fMeasPmgki3LMAnFpfHLeLRpa9MgnBkZ/l1CR50WI25rJDelTkuH8t6tbxB8m/rgLVRXJLZkrFWCcqyl6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kldOzG+a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5130EC4CEE7;
	Tue, 25 Feb 2025 18:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507507;
	bh=Xft8rabj4Z6MJFzoPQ8QqkOY0yZRQgoBvhMCTp+o4nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kldOzG+ac2+2+x6xVt4WSfgBEKiDeqwEUmX21Z/rvN0YgeDz2dLkfs8E7LQ+FFiNM
	 CqNhbpV+TjYFjmTj5OQhYoNMZMYglFh6lX3v2whCV4k3VAZyfEkqD6Vnz6rKkt+88f
	 rH2QUvC1Sry98ZfqWC3gVi3av3w7dTgRrXn9zuKTH9+8+TjpqXhJOav0lPP3bGXgC0
	 w1gZE7whNA/ubRwJkJQhoZU6ORthUxldlzqYsEw9IsK0V79Hn91ZzRp2ewivXUQeOb
	 aLEfKBos0JSxyia37F5WlcYd0UHm9CtI8W6Z3JRfJtK1YliW0JbV8OnU6IL5yipT1Q
	 qBFMWvYyOgqPA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: quic_mohamull@quicinc.com,
	quic_hbandi@quicinc.com,
	quic_anubhavg@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v10 0/1] Enable Bluetooth on qcs6490-rb3gen2 board
Date: Tue, 25 Feb 2025 12:18:08 -0600
Message-ID: <174050748690.199016.14847996516945478408.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221171014.120946-1-quic_janathot@quicinc.com>
References: <20250221171014.120946-1-quic_janathot@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 21 Feb 2025 22:40:13 +0530, Janaki Ramaiah Thota wrote:
> Patch 1/1
>   Addressed review comments related to alignment in patch 1
> 
> ----
> Changes from v9:
> * Addressed review comments provided Dmitry
> * Link to v9: https://lore.kernel.org/linux-arm-msm/20250220112945.3106086-1-quic_janathot@quicinc.com/
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen: add and enable BT node
      commit: 914d16b4a9c4569cc8091a1dfda432dab2fcb9d1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

