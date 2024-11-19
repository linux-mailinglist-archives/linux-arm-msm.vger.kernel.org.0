Return-Path: <linux-arm-msm+bounces-38369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4595C9D2C31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C328281AC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE541D0DE7;
	Tue, 19 Nov 2024 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+Omqzkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914FE25763;
	Tue, 19 Nov 2024 17:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732036398; cv=none; b=kOIgZjjDY1Fim1is78KEpVok1Xgao9YE6IAGOeIApa2oFWhbojZJL5PD33SLucnGvU8yGMc9q6iE9L50tUpjN6kqdzI1+0O05WKMSotioty2LGA+zY3PnRKzg96PNFu8P/CoTf5njF5fF3gKYtAnCKP3jEf5+Q5CK0hmE4Ayysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732036398; c=relaxed/simple;
	bh=ggE7Kv8fbEJQDnLfRqnMQ5FSxw3wmUl+igo2b35kd5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwF9mqgmcXTp1rFvAQ8zqt7nBjwgi9C0Lg6Wt8qRA9QEkKwQNvqRUD19xYArMc8zMXtNp3f5Qun5SIHeewhv/wcdOip3hypRCn2k8PilxbM2ayH2kKxemkWguJbUj5TvcgopkZsrCaWjg4fx/7bdV8OR3PbFc1hA0OlemFWOt2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+Omqzkc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AA7C4CECF;
	Tue, 19 Nov 2024 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732036397;
	bh=ggE7Kv8fbEJQDnLfRqnMQ5FSxw3wmUl+igo2b35kd5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+OmqzkcJCiucFF2UnxpJpQ/xcYpsSxBx4gI5KO1T1OwBMnQKhkkThRuwN3Gzvmqj
	 m2XWQo+7i5YIpBsTfJm7yzOLc2LMILt6nQPlb2EofC2Tpadgp2zhxmIhF2o8r2pq2j
	 M1GwJ5kyKMzq2r1XF/PWMw8tl0EkClBvImKVFdi8n15wS/4vO28MOcQ4Bu4le7ANTO
	 guPpw0F7FRjkN2aKoUgUVmUwr78fyfEVQw07tnz0Dyw8WvIj5SVcwyM7Ps62uTfMSg
	 RM1uSxB7CroCjSelz16lXVMkyCZSAkTVnVMqh9boSPRB7CpIjVt4FbURWJWiB3vYIk
	 Xs9Zy6M2sD15w==
Date: Tue, 19 Nov 2024 11:13:15 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: Make ss_phy_irq optional
 for X1E80100
Message-ID: <20241119171315.GA1805024-robh@kernel.org>
References: <20241116-topic-x1e_usb2_bindings-v1-1-dde2d63f428f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116-topic-x1e_usb2_bindings-v1-1-dde2d63f428f@oss.qualcomm.com>

On Sat, Nov 16, 2024 at 12:17:52PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> X1 has multiple DWC3 hosts, including one that's USB2, which naturally
> means it doesn't have a SuperSpeed interrupt. Make it optional to fix
> warnings such as:
> 
> usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

That's a good start, but what about all the other warnings for usb 
interrupts?:

     13  usb@f92f8800: 'interrupt-names' is a required property
     11  usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
     11  usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
     11  usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
     11  usb@6af8800: interrupt-names:0: 'pwr_event' was expected
     11  usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
      9  usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
      7  usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
      5  usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
      5  usb@8af8800: interrupt-names: ['pwr_event'] is too short
      4  usb@8af8800: interrupts: [[0, 62, 4]] is too short
      4  usb@8af8800: interrupt-names: ['hs_phy_irq'] is too short


> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

