Return-Path: <linux-arm-msm+bounces-41916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 061759F06E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E05D216A4BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2014C1ACDF0;
	Fri, 13 Dec 2024 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdOxvaL6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE056BFCA;
	Fri, 13 Dec 2024 08:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734079791; cv=none; b=egCkeDE2ApBlRd04rsCI+mF3JOVYnysCmv92ZKMZUHq5fvJLhpYnSTBoUKgOjg8ZWg+G5NYHgft1IMwNB7+SjhzRFICaX9AoQuha5ueKz635+sBVwWaWeal0XxxvMzIRxK5GWQvGyB/d3HkLcYSUprVVoHIxo5VUNUzAJAD4Bo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734079791; c=relaxed/simple;
	bh=uGYv9JPSUdHkzvZVqTt7TTbPWsYRVOVyjafBD22J8K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjGLDTMVi0i47MsPHc9d8KVqBOsLq9vTkE3NEYo4X+fhhPq3ex1ZLIl+Ppi0beCURG2prbl5YEAhiJe8pulu38j/HZX9wBHFGGLE5ZlYH0g8Xziyz8Q+5NQmJMXwtwMCp/pzC5eqMr+N+T40fM3vnqUQFmF9xH74kfnXOjMDRIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdOxvaL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91F5C4CED0;
	Fri, 13 Dec 2024 08:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734079790;
	bh=uGYv9JPSUdHkzvZVqTt7TTbPWsYRVOVyjafBD22J8K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdOxvaL6j+dBERdwG6abxICQnVQqFiGX4KzgeOvoL3ExFNVXwKF+uufP4mNTNYWrv
	 DkSEG+vFdZzI3Fn0P4YZ3QK00xtIC5TXBxZ302I2i+OMjIBo/qLXbMX/a4wDO089hp
	 zK8I4eQJ/s2fNPLGHKx8m4agrMFYqJLwoOOxfuHx2WM7YKRSKnSOGc874tFf4no6vf
	 /wFxAK0gQn3wCOO06KsHgr2lgwbXhbYSoeSWmuVKYKfVZ0YBHkX+1QwJrPWgvv61PV
	 ETmPEbRbjN+nSIXSLAQaLxlE3fumWTcGyROlcY7MvJEjPA8Ql2/6niUuH2RB0X7WoS
	 +IQAhKl2o8Pug==
Date: Fri, 13 Dec 2024 09:49:47 +0100
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
Subject: Re: [PATCH v5 1/4] dt-bindings: net: bluetooth: qca: Expand
 firmware-name property
Message-ID: <cyupscw22xvovh647dsaukiro5d5oiv5i573awanjkoqdczhb6@spdtixeqtysf>
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
 <20241212150232.3823088-2-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212150232.3823088-2-quic_chejiang@quicinc.com>

On Thu, Dec 12, 2024 at 11:02:29PM +0800, Cheng Jiang wrote:
> Expand the firmware-name property to specify the names of NVM and
> rampatch firmware to load. This update will support loading specific
> firmware (nvm and rampatch) for certain chips, like the QCA6698
> Bluetooth chip, which shares the same IP core as the WCN6855 but has
> different RF components and RAM sizes, requiring new firmware files.
> 
> We might use different connectivity boards on the same platform. For
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
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml           | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


