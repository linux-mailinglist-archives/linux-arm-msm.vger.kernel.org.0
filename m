Return-Path: <linux-arm-msm+bounces-79026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C8C11BE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81DBC4EDA4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596E232F774;
	Mon, 27 Oct 2025 22:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDwoc4+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2902E32E74C;
	Mon, 27 Oct 2025 22:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604494; cv=none; b=csJ2/WlTcQ8S2N04FoPOjilgv9FZChJLT2XOMY0T7Nc0HEjTP5+D9lth2Am9TPp5DLQsmfRJbREv41giy5BbuKia6q3mQJVnknC5yXnNAhcNo/RLE7AUdNd4qu4dJ6GNXt2AnKawyiFH8dPl2P3GCPPO5rFuTs1c0U19TYaNnes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604494; c=relaxed/simple;
	bh=ynAn6vL6WFPLPUwZOjvbGZSI2MDOk2qYvDQ2SkXGnDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jeYjStE3O68u3W2fQ43yxgXaWGz/RWuTP0CZHdoGQkdlAIG+Np78evY+DxSAH82Ze5eA1dIzha/ZS3MeKSo5bOrnIg2kVPgMUEPv0ySduC4XQCVUsszCjbEaMTSCKgk/pdDVfZAztEpQEJ7CdKi7u2W1miZ39I+TZo/4CiVBPEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDwoc4+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C36EC4CEF1;
	Mon, 27 Oct 2025 22:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604494;
	bh=ynAn6vL6WFPLPUwZOjvbGZSI2MDOk2qYvDQ2SkXGnDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZDwoc4+AkZdtLRzJ/fv47ak2hP3431sLENFcHjh08RgVoDNcufklWbAl4vvkmWFlA
	 Ee1eXY2HlBSmr949GcHfGvcenUmBuQLkX5yRWrwV7Jghst3DvVYQhYcDcVcfN36DxT
	 n/OWMwoiIGoYYkW7qFRlbpCvkWhioIMxfz4Gb+/98qUZhlPqtHc9KHtKeGJg5X/p44
	 PwFZVPopsm6kXZfM5S+vlTY4/XITiVAImPhR8fNl/rlkQ7vAHFRRJtACZVkeGNM1wF
	 oCJ/kx60HAKm/abfHDOnh/A3IjLdG74lY2LBi1DthMfPa7SXw/z35Zh8BbHCtHrtYU
	 e+5LQbxqJn3ug==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Sajna <sajattack@postmarketos.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Define guard pages within the rmtfs region
Date: Mon, 27 Oct 2025 17:36:47 -0500
Message-ID: <176160465242.73268.13521873940732799291.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020-sdm845-use-guard-pages-v1-1-64d714f8bd73@ixit.cz>
References: <20251020-sdm845-use-guard-pages-v1-1-64d714f8bd73@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Oct 2025 23:12:56 +0200, David Heidelberg wrote:
> Use qcom,use-guard-pages property instead of polluting device-tree with
> lower and upper rmtfs guard nodes.
> 
> No functional change intended.
> 
> cosmetic: set name the node rmtfs-region.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: Define guard pages within the rmtfs region
      commit: ab9a2c821ad229c4e8dd48b0126e40cc85a8cd51

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

