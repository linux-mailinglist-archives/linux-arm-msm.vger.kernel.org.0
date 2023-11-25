Return-Path: <linux-arm-msm+bounces-1933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267D7F88D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 08:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE7B4B21335
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 07:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA8279D4;
	Sat, 25 Nov 2023 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P9s5B+ya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A137476;
	Sat, 25 Nov 2023 07:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A24C433C9;
	Sat, 25 Nov 2023 07:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700897549;
	bh=rwChtd2K3J2OWFVntCNJt5iOvMrw3NNz5tNPNfg9tF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9s5B+yagysmsj8Lq8PJMbAt/SHovHA1hIsdKFXR4FYrUAUNRdqf+5fnaHJfsF9rU
	 5Fv3+2GDoS7GGkpQYjXF097C7QAB84WaRt38i9cs3Fw+3fzXjDufBNLVZxEJWVIU43
	 FQ+9QJtR87oSChuPW/1Vp3Is/D4cjk1fGIEmUCOA=
Date: Sat, 25 Nov 2023 06:53:05 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Luka Panio <lukapanio@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v10 1/2] Add a compatible for Xiaomi Pad 6.
Message-ID: <2023112529-fetch-unwritten-bdbd@gregkh>
References: <20231124212732.731419-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124212732.731419-1-lukapanio@gmail.com>

On Fri, Nov 24, 2023 at 10:27:31PM +0100, Luka Panio wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Luka Panio <lukapanio@gmail.com>
> 
> ---
> v2:
> Update commit message

What commit message?  I know I can't take patches without any changelog
text, maybe other maintainers are more loose?

thanks,

greg k-h

