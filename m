Return-Path: <linux-arm-msm+bounces-41442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE709EC7C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5412285A57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6FF1E9B25;
	Wed, 11 Dec 2024 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/6e6Rw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5931E9B13;
	Wed, 11 Dec 2024 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733907204; cv=none; b=Wkz/EG+tQICPKY+7+LPh/acayopgPQZTz6SPJUyV6T0vUGc+0bNHpXLe/aFP36cKKjLjHU0NG/iiHqSZKDLfUXKJFn00Dlq2BQKKwjwfmE1/NCAsxSUTp0hrwDJdr+JxlgH+6YEm7Sho/z5hyaRs3kexmGBN1Hm6qNpqF54OuTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733907204; c=relaxed/simple;
	bh=GmKklteyfL8iCcHIr+GPCM1D/OeD5zIeRxgPPHhbgi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQLx7z9eOEg2j4BkFho3dQbTLtkb2nTQJbhNaZxufBi7iIgVRTurrNfPpBq3WJTO4OntNBAtCjOByO2ZFz7fkFlNIhQTTY/nE9Gow09A/Rf0d6BzO8kI5pviFOYur9jop4J8GNxsEzqnYSy7I7XgZr1iEYkBn0Hf2HjXYlJfGEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/6e6Rw0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FA6C4CED2;
	Wed, 11 Dec 2024 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733907204;
	bh=GmKklteyfL8iCcHIr+GPCM1D/OeD5zIeRxgPPHhbgi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/6e6Rw0Y41S/zJz4p0ClexCyG0YI4Dwa8Up6AZQ4KlycgOHYVkadRQqa4KOM8r0Y
	 oopNLqYr01Oqz/pn7LZ45hCXpTPQS35S6VW+gEzup1lAMeyx5dJTjQYRe5b4qJ/jiO
	 ddKECgCgDe/2AUjOacDAgfmneMo2VIn3wlRfu0clpl5bQ6+Hn8z0alCLs3oM6rdXIM
	 xESI7D+xGLQ5T3e+4muwpy7s/83fN/hqWOg1ntZDrGw06B+HllcxNnPDCzaG3AgYh/
	 ydwSMG5WhB1YC+qYF6AUBkz5sB0ZZGqEf0j8EMEbEJ+5ZxowGFXexpQBhTgw0y/3Cz
	 gAZH2CI+XP5/w==
Date: Wed, 11 Dec 2024 09:53:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com, 
	quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: Re: [PATCH v4 0/3] Expand firmware-name property to load specific
Message-ID: <hzw3ocj7vzmnnqbgpqxd3if3hww5jsvldhre2s67yugbf4xpfo@3lgyxdiket2e>
References: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210151636.2474809-1-quic_chejiang@quicinc.com>

On Tue, Dec 10, 2024 at 11:16:32PM +0800, Cheng Jiang wrote:
> Expand the firmware-name property to specify the names of NVM and
> rampatch firmware to load.
> 
> This update will support loading specific firmware (nvm and rampatch)
> for certain chips, like the QCA6698 Bluetooth chip, which shares the
> same IP core as the WCN6855 but has different RF components and RAM
> sizes, requiring new firmware files.
> 
> Different connectivity boards may be attached to the same platform. For
> example, QCA6698-based boards can support either a two-antenna or
> three-antenna solution, both of which work on the sa8775p-ride platform.
> Due to differences in connectivity boards and variations in RF
> performance from different foundries, different NVM configurations are
> used based on the board ID.
> 
> So In firmware-name, if the NVM file has an extension, the NVM file will
> be used. Otherwise, the system will first try the .bNN (board ID) file,
> and if that fails, it will fall back to the .bin file.
> 
> Possible configurations:
> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> firmware-name = "QCA6698/hpnv21.bin";
> 
> ---
> v4:
>   1. Split nvm and rampatch changes to 2 commits
>   2. Code fix according to review comments

Which comments? What exactly did you fix? This cannot be vague.

Best regards,
Krzysztof


