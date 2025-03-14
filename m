Return-Path: <linux-arm-msm+bounces-51493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19636A61BB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D04D42186E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC610214239;
	Fri, 14 Mar 2025 20:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9Mlz2N/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C304C214231;
	Fri, 14 Mar 2025 20:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982514; cv=none; b=STFrjG4Nld62m6orl5GfDSzcV0RNOh6RssH4NKdxA9Hbe4Rb9UTvp7WUB/Cg/WXwWyrmjBYBL9g1j+VE5HEA+yhzvEcosSMK45ciivLdb5nEmyd5JtwqZqDhsfhJvudwQDU8tWtHbBfq9B3E9ydSNtpe/QaCKQ1szV6a38E5S2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982514; c=relaxed/simple;
	bh=7QfOHvyq5ym3XnOPOwH48lBUAnQiCTGEI3zPUtDqyU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iUgaNRmfBdnVgGR9qjEWVtJDWteRBeRjVO2zkr4X3QFdVdDF3CmowXV8DJQ9wr5IwrTrmg+3noTvmlKkZmDjkrDV23C4Q/KqWGa/MajVGeeLu1/bSiBEFJqT2DgqxTbSh1F5GYZNWI7U7pvidYUQU/dMxFjiMaMoF1oNhVk4iWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9Mlz2N/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D676C4CEEC;
	Fri, 14 Mar 2025 20:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982514;
	bh=7QfOHvyq5ym3XnOPOwH48lBUAnQiCTGEI3zPUtDqyU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E9Mlz2N/0DAJkkrdfN7mJ8IK6Kugb9sO1vEu5Jm2xhWT54oiXwyevT3+wsAqGw0EU
	 ql2NV0hRyfdqySBwvj1Z+eLL0mXkraCSUHQf5bv0Db/iW5UZFhsQA6wr6fpZRwLNWh
	 0KlRKmDTvJOuAdJLOTU4ndQb1Qz/o8CcasyKjh5WBmCcSQ+L8Hxt3SjyyxnOQc6n8v
	 XdM/usvb8tpTFyJO/2/CJZBG9Kjz/gzfFLMWcriLtB/uhejYOM1xujX2QXuMIPzo86
	 WgYOKdMnnn24YTGL/nSLXNCgbkpgy+543mszfaoYKzL49p3aYdRLY/7UqKDkT/vhZU
	 XmfCOBNFiQyOA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_varada@quicinc.com,
	quic_srichara@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add reserved memory region for bootloader
Date: Fri, 14 Mar 2025 15:01:07 -0500
Message-ID: <174198247898.1604753.10368894978381616370.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312094948.3376126-1-quic_mmanikan@quicinc.com>
References: <20250312094948.3376126-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Mar 2025 15:19:48 +0530, Manikanta Mylavarapu wrote:
> In IPQ5424, the bootloader collects the system RAM contents upon a crash
> for post-morterm analysis. If we don't reserve the memory region used by
> the bootloader, linux will consume it. Upon the next boot after a crash,
> the bootloader will be loaded in the same region, which could lead to the
> loss of some data. sometimes, we may miss out critical information.
> Therefore, let's reserve the region used by the bootloader.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5424: add reserved memory region for bootloader
      commit: 4001b1bffd21d5cdbdc84d6b97213e68fed9c785

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

