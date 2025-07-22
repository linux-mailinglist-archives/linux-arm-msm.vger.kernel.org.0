Return-Path: <linux-arm-msm+bounces-65990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEC5B0D1F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 08:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24CBE189EF98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 06:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EB228C5B3;
	Tue, 22 Jul 2025 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnZdhae9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337BF46BF;
	Tue, 22 Jul 2025 06:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753166131; cv=none; b=UO2YllSeQE81Ttx/xPXwD5hw7y6Ar+A/JDE9cSbzy96ojTrGTm/orZBqLz8XmXVwhF/FLmTMbn4ytWus1/0sB6pehiavQTEheFT1NzlsryiRX9Y5vGV/iG3ZADSNu+r2a9S+xM4IZj8/QNWAKXq9A4pl/q9x/AeDtaqZGhbbJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753166131; c=relaxed/simple;
	bh=QoC4VDOHBDQl8oqOfQ7J9EPreRbenyXCGwEV1XEUaAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUne1fr9GlKjwFZwcvCd0pmLH3/H/0nZNvK0Fc2t5I8YpOrtGXgx/M10FcO8tZmPedphiyR0WUwfEtRuEAH/drvh1DVW/rGztUUtYCHuXrV1ljj3rz0y1mwq55j/h4rr3YriwdK09zuIS57RlPD099mA+uqqgoK2gbrMRjv5Qnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnZdhae9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B904C4CEEB;
	Tue, 22 Jul 2025 06:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753166130;
	bh=QoC4VDOHBDQl8oqOfQ7J9EPreRbenyXCGwEV1XEUaAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnZdhae9Zfdk27Wdjp/BAGTZNIFpfCAq9khCZSe4XERIrIY3j2z1dqpgGeWuZts5S
	 18duwTjKUZwaoZ9RQEW5cCn+7FkV/MEyXsjh8wIDh/NgHqCcWV+T8Uamj/mBb6d/Ms
	 EUfvW89T6kxlw4snbtXTSafCQCStfR1zerCkndR/W9FjgkcNvl7Nt9wW7HL/E7r7WG
	 F1anreGPI0wUw6AvKJg2eftf/WxoSKngKAH7A9XO4trBg1qkucdOlZW0Hya6x9DBge
	 MFf0c2hUPUL5N2j3ogJ6ly0atONET1oj2mk2eUQe8ZiMQ73H8vzIYs4agXxqPXmOYG
	 Vsflwf15hKZCw==
Date: Tue, 22 Jul 2025 08:35:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, bryan.odonoghue@linaro.org, 
	psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com, quic_arandive@quicinc.com, quic_cchiluve@quicinc.com, 
	quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v7 1/8] dt-bindings: serial: describe SA8255p
Message-ID: <20250722-optimal-striped-ermine-ba3da2@kuoka>
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
 <20250721174532.14022-2-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250721174532.14022-2-quic_ptalari@quicinc.com>

On Mon, Jul 21, 2025 at 11:15:25PM +0530, Praveen Talari wrote:
> From: Nikunj Kela <quic_nkela@quicinc.com>
> 
> SA8255p platform abstracts resources such as clocks, interconnect and
> GPIO pins configuration in Firmware. SCMI power and perf protocols are
> used to send request for resource configurations.
> 
> Add DT bindings for the QUP GENI UART controller on sa8255p platform.
> 
> The wakeup interrupt (IRQ) is treated as optional, as not all UART
> instances have a wakeup-capable interrupt routed via the PDC.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Praveen Talari <quic_ptalari@quicinc.com>
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Place the review tag in correct place, not in random or before you
received this patch.

Best regards,
Krzysztof


