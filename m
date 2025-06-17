Return-Path: <linux-arm-msm+bounces-61642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E27FADDE0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 23:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C9823ACE81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FE02F94A1;
	Tue, 17 Jun 2025 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHpZwRbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE8E2F2735;
	Tue, 17 Jun 2025 21:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195903; cv=none; b=uPsi62YC8ITxX10aXediiAsreRCJbDCtft56c5rcVr+o860PpZGi9imNZQSOenvMqw8deE4J6NMn1tu78Nsf3CwLSeXI6NGPAUMjuJiSN7EyLF13XC1IGx5m2JyifMNzSHkmC16X2VcZWAGk5qe+SfmEomwV1oFZbicRQ90XmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195903; c=relaxed/simple;
	bh=n0fK+Y7FKX+Yod78GlKCXCWSHa3VLt6/sk6IuN4jSuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hJtx1sLv0X2pn1HA37Io87ibUlmexUHcYJPDTabM4EOgLctbXfHiSlAOfGB3ib67+uvLO0f673Sobv7Scy6up7U55q5SnL63arF6T5dE3j0vymZ1J/5e8WO3wKkiVhLEnx/Du669Wd7plxuHfvb11rtX9PD0Hw/bVZgv4ZfLpXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHpZwRbV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FB8C4CEE3;
	Tue, 17 Jun 2025 21:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195903;
	bh=n0fK+Y7FKX+Yod78GlKCXCWSHa3VLt6/sk6IuN4jSuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HHpZwRbVNZs4qeigd2Z/Hmka9bdyphhVIEt0khgD6QTge6yKkOz6J5bKWNoHDgixP
	 dlOSNYOs7aSRW8WuTnK6AIPrxsjT926J686Xpt4GzLha7yhNOB011PZu/sp6Lj1CJb
	 JTn4vu/foF70hiOWaUF/RdrFZpCEsBPCfVE4w5icWqkVfMBeoXlqoacDQHzIlRDbrt
	 XfLm/xC6SzXXqXX8gRTaeklnzRhsX07gLSiy5l5r8XTAqITxHb8s8+Uv/DU0iSnFJm
	 xoFLxEi2m3Mw1BMqvPNKZ9v98NLVemrZSnAotteOW1UNW/OP89iql/QyeDyKqUx0i0
	 3K5vvEWZ/Yhsg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve TME build details
Date: Tue, 17 Jun 2025 16:31:27 -0500
Message-ID: <175019588865.714929.6194965927774309821.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
References: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 19 May 2025 19:14:01 +0530, Kathiravan Thirumoorthy wrote:
> Add support to retrieve Trust Management Engine (TME) image details
> from SMEM, which is present in the IPQ5424 SoC.
> 
> 

Applied, thanks!

[1/1] soc: qcom: socinfo: Add support to retrieve TME build details
      commit: 64a026dd896e423a177fe87e11aa69bf5348c27b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

