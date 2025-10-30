Return-Path: <linux-arm-msm+bounces-79733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63189C217C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE104611A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8E53678D7;
	Thu, 30 Oct 2025 17:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ekDPxfxb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09837A3C0;
	Thu, 30 Oct 2025 17:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761844981; cv=none; b=FxdRC7l0gKammsm0HAqPGljlKym9rFXrNjbguo/gzLf7m0ePZ5rzMtAS5PKSmdtc6WlSpKAxN7NHWvCjVzUXj6NTrTn8eK83Get0JxlgLkyEq+3ehztQlwWvlUahQQa8ZIVvQr7JG7LAnd9UTTDS1r7Rp7ZFNELBBxlGc/4k2Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761844981; c=relaxed/simple;
	bh=5JXVFNlMTvdINtFW0DXyg4zvly79j27nW9MHNXzH3gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWzjISrXHDM56AXnvNVzWtKBXyhJfQHsEut2sHKztnVRrjeBOm3zn4cAcRl5BoCnvjZJ4AvLP72BgPyoyKFPADBYeSUrF0SDXc8FweIdH1rudLrAij57/hl6HSBC/+8rpokbQhFG65YdVHfzbNfPwo+DTAyaKFgTjKoA7ZAhaJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ekDPxfxb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B953C4CEF1;
	Thu, 30 Oct 2025 17:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761844980;
	bh=5JXVFNlMTvdINtFW0DXyg4zvly79j27nW9MHNXzH3gQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ekDPxfxbY8/F3xn0eGyDZwX+LhpUsp96t2p5jcHv1VOrbWltNqYe1hJrPE46ST+iw
	 Fx5A9ppwTBXR+5mLjA/A4D8WxPeK9U2qQJvY1T0OL/nY1Dgf5v5JX+6GPaQRRqFpKH
	 WXYA/cKfVrQBgsjk2/+ZmfRpm/huKtlIAA/RMvv3d4rcusu5kyJc9OtIf01wvdbDhH
	 kVIoKCdXCHedQdewx9Ywq1phFxb2Tw5gxZ+7xcf2UgDeRPorrTNynn4GqiKnAu3SDS
	 66ba9TAx60jfWo33JecrjVZVxQo9qx8UfPmFkxUHqimhotZKzKD29ootdbv6+v89Tn
	 l0kqj64jsj9AQ==
Date: Thu, 30 Oct 2025 12:22:53 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Bluetooth: dt-bindings: qualcomm: Split binding
Message-ID: <20251030172253.GA4166743-robh@kernel.org>
References: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>

On Wed, Oct 29, 2025 at 08:43:50AM +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Drop in few commits the properties (supplies) from
>   qualcomm-bluetooth.yaml which are not used by devices left there,
>   instead of removing them in final patch (qcom,wcn7850-bt).
> - Fix dt_binding_check error - missing gpio.h header in the example.
> - Drop maintainers update - split into separate patch.
> - Add also Bartosz as maintainer of two bindings because he was working
>   with these in the past.
> - Link to v1: https://patch.msgid.link/20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org
> 
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split qcom,qca6390-bt to separate
> bindings, so device schema will be easier to read/maintain and list only
> relevant properties.
> 
> What's more it messes up old (pre-PMU) and new (post-PMU) description in
> one place adding to the total mess.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (11):
>       dt-bindings: bluetooth: qcom,qca2066-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,qca9377-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,qca6390-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn3950-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn3990-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn6750-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn6750-bt: Deprecate old supplies
>       dt-bindings: bluetooth: qcom,wcn6855-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn6855-bt: Deprecate old supplies
>       dt-bindings: bluetooth: qcom,wcn7850-bt: Split to separate schema
>       dt-bindings: bluetooth: qcom,wcn7850-bt: Deprecate old supplies
> 
>  .../net/bluetooth/qcom,bluetooth-common.yaml       |  25 ++
>  .../bindings/net/bluetooth/qcom,qca2066-bt.yaml    |  49 ++++
>  .../bindings/net/bluetooth/qcom,qca6390-bt.yaml    |  64 +++++
>  .../bindings/net/bluetooth/qcom,qca9377-bt.yaml    |  58 +++++
>  .../bindings/net/bluetooth/qcom,wcn3950-bt.yaml    |  67 ++++++
>  .../bindings/net/bluetooth/qcom,wcn3990-bt.yaml    |  66 ++++++
>  .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    |  91 ++++++++
>  .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |  99 ++++++++
>  .../bindings/net/bluetooth/qcom,wcn7850-bt.yaml    |  94 ++++++++
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 259 ---------------------
>  MAINTAINERS                                        |   1 +
>  11 files changed, 614 insertions(+), 259 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


