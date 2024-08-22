Return-Path: <linux-arm-msm+bounces-29249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F43795AFC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 09:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A44E1F231D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 07:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2C416DEB2;
	Thu, 22 Aug 2024 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8+yh6yP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB87E16DC15;
	Thu, 22 Aug 2024 07:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724313577; cv=none; b=P3j2WlL6wWybFjtiiM/wfq39yk84bCIm1VUMH42vYIve0Rqn7XexT7VHRuiJESjX3KCpVU4GeCb4KinYi1N5LxJyK6F8XARdfW0QKkpU8kzF4YLAHN5ly3bk3Wxa5y8jr4Mevfe0ttZPAA9wtQuH2DtVYeFN7TZZqWWFtAsJ5J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724313577; c=relaxed/simple;
	bh=RYUJXFHMwWOGiIu4bdUc7sNiib6veLbjl54CFkPTusM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VX3swm3ze3Sc4emUMbsMfnYUKxz5Jb/ZiwnJ7eO8SX/KYt6/WBxiJSUNhZAnKIPBEuM8tjEVh/YSJcakYu31FS6+va1RfDbgR7xrcoYy51SuIYyB1fF8J8chv+o24MkihhV3AvlVAsRIaaU/JEXNAL+KWXd9KiMvF7snrOwABvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8+yh6yP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF079C4AF09;
	Thu, 22 Aug 2024 07:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724313577;
	bh=RYUJXFHMwWOGiIu4bdUc7sNiib6veLbjl54CFkPTusM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8+yh6yPts3jDToMQfi0amHJEvv5QhVfDFuNPKk9eUBKSxrfdS3c4SPT+KkTDKtaD
	 Wgt3TdL0Ft/my0XdKjXWeW2ckqUDzSLAVgnnCpdNqxu14M8q+AgvFtFQngQC8p6C2S
	 zkbh5x/7Z9srUKZOEBRUUt6h8jaWtkQZVPOwdD6qLcn9wRjTJKqHp/AH6NjxC4UDpe
	 NZLHQ9PeNKERVK51absSTQCJcRZbE36uZaOOkE5FoD9ZwA2C2xVlJ0mwcCdj6zc6UQ
	 ijrtzIgEs2ZHaVgsp3ow4a4vIwrRazUmB6bV6ACOJu9aCoQpPgfC/lvD3uiKhbdQBg
	 IVxQooqgbl5gA==
Date: Thu, 22 Aug 2024 09:59:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
Message-ID: <gnf37fpnqihv4z3qq3jkrqaokapj5lgtgoonnhagjlua4js5kl@pn7y53pqmddf>
References: <20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com>
 <20240820-qcom_ipq_cmnpll-v2-1-b000dd335280@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820-qcom_ipq_cmnpll-v2-1-b000dd335280@quicinc.com>

On Tue, Aug 20, 2024 at 10:02:42PM +0800, Luo Jie wrote:
> The CMN PLL controller provides clocks to networking hardware blocks
> on Qualcomm IPQ9574 SoC. It receives input clock from the on-chip Wi-Fi,
> and produces output clocks at fixed rates. These output rates are
> predetermined, and are unrelated to the input clock rate. The output
> clocks are supplied to the Ethernet hardware such as PPE (packet
> process engine) and the externally connected switch or PHY device.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 70 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 15 +++++
>  2 files changed, 85 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


