Return-Path: <linux-arm-msm+bounces-51560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AA7A63C46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68AF0188F62D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A396219D09C;
	Mon, 17 Mar 2025 02:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfK9oIg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7971119CCF5;
	Mon, 17 Mar 2025 02:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180173; cv=none; b=aRWKEffZz+W7KQttDlIuyoZHCj1xpNyaLEIncUdC0gZZUNAtRpEXvS0E3s2BO/f31VHRQgxgzb/wtBsQLbidNJE55UNcJXhi3Efgd31UnIL+Z24K+85XVWtwuyRPB6b9IGgXaqkaXt4oW3tmIkJk6X6MjMaLFn8L0uLVzpPdVYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180173; c=relaxed/simple;
	bh=AWdBVBHSjTrA0WeIWDMgFO5MH6Y2FHBBqGx+GwZf6JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p9CiucMCb8/0OafaU/eVOlEECtJHQs1XxcutLwYjjVR4mLNvNGXfvowXmaqTSVzRn8I2osYnE4zmGevgnETUsjy7smJip1FNiOF0ZCMt4flpOIixdc7rQgElmD8Ax/YstpPbBGYg+vKl6aVX+Scg4l45ZElPso3i5Mmh6GymjNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfK9oIg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA27AC4CEF5;
	Mon, 17 Mar 2025 02:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180173;
	bh=AWdBVBHSjTrA0WeIWDMgFO5MH6Y2FHBBqGx+GwZf6JI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lfK9oIg+Ogcc1V4sPk1RgR0mdDhSDgbWHE6lv+zBXLJQ5KjukJTZv7TBoe7Fowv9m
	 HquVqkm0gkcRjVhasHUGxfW49sNi2u285160QKoqZCsIGZ58HZXeB7Ttc9p33895BU
	 0u+APRr9RGRHyPdatNoVch10Bd3rUFxoJ7RIbMQithEnoyA32lsVtG3L/T7J9aLqFr
	 3mHJrqg3FVujKCVDFelB5qKpPlgtAWTxNbtYM1hDf5D+ApuQwFt25yBWhT5GdtLzd4
	 MijsqWMDcrhkYEBfQKieqnybz5uXxB+20dTbEasH29s0lwEFbn4GTZrpJ0qA2IjXLI
	 esk4QH/EHdkOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maud Spierings <maud_spierings@hotmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100-vivobook-s15: Add usb a and sd-card reader
Date: Sun, 16 Mar 2025 21:55:53 -0500
Message-ID: <174218015896.1913428.12978955124031483726.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
References: <20250119-usb_a_micro_sd-v1-0-01eb7502ae05@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 19 Jan 2025 15:50:50 +0100, Maud Spierings wrote:
> The Asus Vivobook s15 has 2 5gbps usb A ports on the right side which
> are controlled by the usb_mp controller enable them and the retimers
> required.
> 
> There is also a micro sd-card reader on the left side below the two
> usb-c ports, this one is attached to the usb_2 controller. Enable it and
> the retimer to enable the micro sd-card reader.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A ports
      commit: c0c46eea2444dcd78400bfa6b264f59dd55aaf42
[2/2] arm64: dts: qcom: x1e80100-vivobook-s15: Enable micro-sd card reader
      commit: 1fcbbdc0806219153dd0761999ca4bf47d164787

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

