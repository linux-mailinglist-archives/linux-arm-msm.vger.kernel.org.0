Return-Path: <linux-arm-msm+bounces-1770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A2C7F67E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 20:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D534B281938
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 19:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE4D4D11D;
	Thu, 23 Nov 2023 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="K5euXy2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBF79A;
	Thu, 23 Nov 2023 11:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=s4TiSliP4FrmhVEWHIqx682/BEBEcotd5kanD+uZ5mw=; b=K5euXy2+Cdnhc4/vFJ9CJnPdQn
	pAnaS5wY7Fw0DZmPiwAdtaiQ80/xryznYo7PGWIrTEFjXHyA05lMZKSRh57IhQxZR19dg791TJjcE
	isUtUd65cIBAEw6de7gT9QT52LI0USFibXRgU6iEtJJ5LAe333jVJwDFpNmA7OlCdqBc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6Fms-0011u7-N1; Thu, 23 Nov 2023 20:54:58 +0100
Date: Thu, 23 Nov 2023 20:54:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>, kernel@quicinc.com
Subject: Re: [PATCH net-next v3 0/3] Ethernet DWMAC5 fault IRQ support
Message-ID: <84560bb2-045f-4d7d-99ea-1f1c200b219f@lunn.ch>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700737841.git.quic_jsuraj@quicinc.com>

On Thu, Nov 23, 2023 at 05:08:12PM +0530, Suraj Jaiswal wrote:
> Suraj Jaiswal (3):
>   dt-bindings: net: qcom,ethqos: add binding doc for fault IRQ for
>     sa8775p
>   arm64: dts: qcom: sa8775p: enable Fault IRQ
>   net: stmmac: Add driver support for DWMAC5 fault IRQ Support

The purpose of 0/X patch is to explain the big picture. What does this
patch series do?

Please add some text here.

      Andrew

