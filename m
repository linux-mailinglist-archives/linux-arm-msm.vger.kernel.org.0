Return-Path: <linux-arm-msm+bounces-57499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB4EAB1FB8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6FE91C2345B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDC626156A;
	Fri,  9 May 2025 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyCb549X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A7D261574;
	Fri,  9 May 2025 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828811; cv=none; b=ICVt8Td/ZsNv3yZBPklDpWORuIsoZ54PZsxYhNv5MIJ3Ark4OvTkUHYxtaQbkIrZnmARUvTpumc7Zh9eLM8tbMwfQLlHsPKGCACNtlOrRLXvkiIaZMy+hgsDSAYztwbJz8oLmFeMlq7c8/eNFVM4i7kiQY+HatdVzHWEoF+2Xxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828811; c=relaxed/simple;
	bh=YV+KRG/TjnglbjkMeXDUBX/N8s8EIPboNkrM8Rt9aeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RyGFUs5Ug+gtgGiihriZfq2deOUQJ99rN67VXjoMZUVT7nxiaOmpOp5LcIT6OXQrtoLV6/chgl7z3PC7hfd+rMpp/EorZyLpq7mBn7nIOZJEZ4kg2HU6X+y9Q99dFBKj/eK31tTuxo+vt/v5yu8Ju9r92m5J/IyDgd0sDaNjdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyCb549X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83981C4CEE4;
	Fri,  9 May 2025 22:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828810;
	bh=YV+KRG/TjnglbjkMeXDUBX/N8s8EIPboNkrM8Rt9aeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LyCb549XovEhF6yFxgtE9C0DZaXSKqMPceBUkE5mF56FzFXFevO5Y424ccJh+ZYZv
	 lVjRi/1x3NtefhOYw1R9AcuQ2cYfBxbFniooE9AdKanzarKPyvpPcXXfPl1tSfNZ4Z
	 eizXXIPPNmZZVr6ImioDbAAaG3o8CNWmF4HFda1z5JCpDPojM1gFpjRgZBwTFAMi4s
	 icc6t3pO359aAblk3jFGzAbB7n6wazXfieTuuCFSsvbioulN7SV3X35hHYixLBfWVP
	 L+ouavZt0Yaxb312MmPZUflevaMhE+hsBonfG7YklOLjLXf6RiZ7c5blhq4EX74ba/
	 /gOrN8V7GgdSA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Weiss <luca@lucaweiss.eu>
Subject: Re: (subset) [PATCH 0/2] Fix fallback qcom,ipc parse
Date: Fri,  9 May 2025 17:13:22 -0500
Message-ID: <174682880459.49052.12382717694935503808.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Apr 2025 04:04:15 +0200, Barnabás Czémán wrote:
> mbox_request_channel() returning value was changed in case of error.
> It uses returning value of of_parse_phandle_with_args().
> It is returning with -ENOENT instead of -ENODEV when no mboxes property
> exists.
> 
> ENODEV was checked before fallback to parse qcom,ipc property.
> 
> [...]

Applied, thanks!

[2/2] soc: qcom: smp2p: Fix fallback to qcom,ipc parse
      commit: 421777a02bbd9cdabe0ae05a69ee06253150589d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

