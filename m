Return-Path: <linux-arm-msm+bounces-68619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D5EB21B3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA49E1895E9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330442D8798;
	Tue, 12 Aug 2025 03:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+4aYat6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067792D3EC3;
	Tue, 12 Aug 2025 03:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967896; cv=none; b=eDBAosmEpDAM8UAlgBc8L//ZcUWFJs+M7r4CFZNd5mbwUQRjFT3n3jWwzrKQtUMZB3xivkN9cHbI8PBI3A34JPz9e45pMmBgQCG0vgqpKTinY1u7E//VNbPARps2vd2Ll07UV19JzjQRDpY/IA52MAc4+Aal77FuJ32o/WEu43M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967896; c=relaxed/simple;
	bh=tXzNKd6Im45I6Jx6w20Ph1axpRXN2A/jsv72/J+RhY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GlJDPDWChr1Z4A97ngM0KJ4mAPx4Muc7IZRAHtX2i6lg7zgbXgnBU18ETzFcWd1Fy1EbhdjL/IQI6twjgO0niDltAyR6d9T167qZ8l/eWYG4X/dakTcSvqG7cWqaMPTBVX2j/fogwK1pdF4VfeVbel/gsLU2iN7Y4sluCgqcSfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+4aYat6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2084C4CEF9;
	Tue, 12 Aug 2025 03:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754967895;
	bh=tXzNKd6Im45I6Jx6w20Ph1axpRXN2A/jsv72/J+RhY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+4aYat6TWYKQOrRB6obLjhmr/HDFy1qgVbM2GVzNFsFwH9LG+uQziN2eqhNWBDQ4
	 O8Ev34CZ7ksEUFqPxa8gPeh0xeVo1TFQR0q2/9eCMiku2xN/6xfEKkB70phdhfG/AS
	 rdip0EtcwKTFVqsMzYjNxL5ah8zIxEa9h/Ubq1rqo0AM3uLkvv3r/gEd1z3RZ0o/zu
	 nW0dPpZUbTldFPhp/Csp5JxAwE1y8wpX2Ncfy7EiXj6RjO+U5dJJK0JNHueh4YsdBj
	 wJK6PxBspHFNAqlMOgYGelOYTYA6vsQ07bjSXBB/ARK0XmYT3OmLk7OnhMiPVwkONe
	 OuUzRj9E8b0fQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sdm845: Use definitions and deduplicate
Date: Mon, 11 Aug 2025 22:04:44 -0500
Message-ID: <175496788911.165980.12035642570238498256.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250801-sdm845-msmid-v2-0-9f44d125ee44@ixit.cz>
References: <20250801-sdm845-msmid-v2-0-9f44d125ee44@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 01 Aug 2025 10:21:38 +0200, David Heidelberg wrote:
> Small cleanup.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845*: Use definition for msm-id
      commit: 285fee8c65efd7969f9376ed9798afece9a0ccc9
[2/2] arm64: dts: qcom: sdm845-oneplus: Deduplicate shared entries
      commit: f72f3aac4a9a990701455a4759a49393cd5802d6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

