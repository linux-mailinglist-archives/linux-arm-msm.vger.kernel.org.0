Return-Path: <linux-arm-msm+bounces-40821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9049E74DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BFEE188585C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E030F1C3C1F;
	Fri,  6 Dec 2024 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzE9VJB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC9146A66;
	Fri,  6 Dec 2024 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733500180; cv=none; b=kB/kD5MxTMuLJ5XLcDnrKBQemYLe7NPJ4XPTYHiS6LGo/PqzjPxJjHXAQwA6GeIKLgHmKVVnf5/ekVprNvbaFm4IhU54VICwANRBZvvrlSLkwersiQYaaFjiv4Zxj/92Kdr2RhYI7hcMD3CQ7qWAaGqg3buW4giOB+U8f12BIwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733500180; c=relaxed/simple;
	bh=KCCzFSRJIW7N26XWNzKmNOTynAPmRVKVA1U1nMv205E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTER1JK3odSUzm3OavX9rrun8Ygyl/IDz5lRRVEa0lZuZ5GPHjyyGryXbMxUPa/wpRm7B5cPFPwxcy+VJBPxu+PvZpDJj1DVV2YQOLbvx4FARCuIZXUwRaWjQchgRK3xfRcZUJLgJA2CiPbdDKnY9AvDtucy3yJyPZSNWn4Gerc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzE9VJB7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3408AC4CEDE;
	Fri,  6 Dec 2024 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733500179;
	bh=KCCzFSRJIW7N26XWNzKmNOTynAPmRVKVA1U1nMv205E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NzE9VJB7tG/93XIDQAek2WvTvDOtR2goO81jVVDCkFhin7OzjN+k/XjCLR0kJwlL0
	 guFCLkUOp2p/NyeSuBE/xJrJgp/xYgQGsza6uZx8tIwq2oAlHbOzadWb1ALXQa8O6E
	 K1fguTg9HVeSmcqXT9kwt0CGMpwqgZB+t36SnOPpE5dm2ewnxwTedsdDiS8qtyIFXv
	 3NMZfNzVqLpCefPYNXToTBKduCnxS8mM5NqoZJwDzj5i3VhthaMdmWWPFIUWnlr7J4
	 wOujU+Y8P7jVBKKGL7fmT7TC4lGn3tXzfGvZERZfBvhj5Rgcm2h9cemCDqSqX59mIX
	 2b+WvznhHkYmQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tJaaK-000000004ob-2r0a;
	Fri, 06 Dec 2024 16:49:40 +0100
Date: Fri, 6 Dec 2024 16:49:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 13/19] arm64: dts: qcom: x1e80100: Fix ADSP memory base
 and length
Message-ID: <Z1MdFLXygNeICNfG@hovoldconsulting.com>
References: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org>
 <20241206-dts-qcom-cdsp-mpss-base-address-v1-13-2f349e4d5a63@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-13-2f349e4d5a63@linaro.org>

On Fri, Dec 06, 2024 at 04:32:37PM +0100, Krzysztof Kozlowski wrote:
> The address space in ADSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB): 0x0680_0000 with length of 0x10000.
> 
> 0x3000_0000, value used so far, is the main region of CDSP.  Downstream
> DTS uses 0x0300_0000, which is oddly similar to 0x3000_0000, yet quite
> different and points to unused area.

This looks like a copy-paste error since there is no downstream DTS for
x1e80100.

And this paragraph is about the CDSP so probably does not belong in the
commit message of the ADSP patches (e.g. sm8650).
 
> Correct the base address and length, which also moves the node to
> different place to keep things sorted by unit address.  The diff looks
> big, but only the unit address and "reg" property were changed.  This
> should have no functional impact on Linux users, because PAS loader does
> not use this address space at all.

Johan

