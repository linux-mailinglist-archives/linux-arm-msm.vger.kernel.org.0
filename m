Return-Path: <linux-arm-msm+bounces-45549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59044A16768
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 08:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76C303A79A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 07:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D90118FDD0;
	Mon, 20 Jan 2025 07:37:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351E481CD;
	Mon, 20 Jan 2025 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737358624; cv=none; b=IKMow12uaj2N7jLZiydOF8GDFdTrOqrV8K4LZoSM8wd8QuVIu4Q0J7Tp9Ob1JP/cV4WQVyI2SOL926x9T/pb3NLn9Jx3hIXO3AX033AD1RNy6xrpU60TNTHFstgHO826S52GKmlDlx3KeQT4uORw//BMhVEnI8xmQaoCacXFX7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737358624; c=relaxed/simple;
	bh=gYhUzyz8zAQ6BxXBkdFPV2xAx8nj/FfFfr3eRiwaoSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZ9Imf7KKuCpP0J9QbFYkbk0+H9yrGX40b2JZ7TR/ndWYFVNLncZTu9L8PvQ4pFDEc5MvzT+4J1x+XJl3Kdhs4+mIEg2PeY8zo8g3RwlC90NwNxeFAGOfTpHLtm1wOlHPVEBKWuvUFhxVE/69kTGA3eyCBUkl6wOzYHc0KOHAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB87BC4CEDD;
	Mon, 20 Jan 2025 07:37:02 +0000 (UTC)
Date: Mon, 20 Jan 2025 08:37:00 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: net: qcom,ethqos: Correct fallback
 compatible for qcom,qcs615-ethqos
Message-ID: <20250120-melodic-unselfish-toucanet-a556df@krzk-bin>
References: <20250120-schema_qcs615-v4-1-d9d122f89e64@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120-schema_qcs615-v4-1-d9d122f89e64@quicinc.com>

On Mon, Jan 20, 2025 at 03:08:28PM +0800, Yijie Yang wrote:
> The qcs615-ride utilizes the same EMAC as the qcs404, rather than the
> sm8150. The current incorrect fallback could result in packet loss.
> The Ethernet on qcs615-ride is currently not utilized by anyone. Therefore,
> there is no need to worry about any ABI impact.
> 
> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


