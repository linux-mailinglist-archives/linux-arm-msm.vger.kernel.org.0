Return-Path: <linux-arm-msm+bounces-3742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96252808BF7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B691F211FE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0748645977;
	Thu,  7 Dec 2023 15:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="skRHYHMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D485844C9D;
	Thu,  7 Dec 2023 15:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DED9C433C8;
	Thu,  7 Dec 2023 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701963322;
	bh=+zfjQi8iFYxQ1XqThCcwk/c3AH2+riGtH+b0LPOSIzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=skRHYHMDxLiFKOLTrHNOHah/wqB2plWPQGFhUuWNm62TGxdR0hKss9PLzeBikvuvA
	 Y7uFRK5sTGBPpeI7roMn3NEnDuiguXMIguuUwOutCMGLjl2RLemzFr+VcIbo02fYG6
	 Bl4NirJSbEOGpRVs5MeAPliIN8Y7dc053KgGKq+mNJxWj8kLEbqEXJ/JF+LPlwZycI
	 bLctMsaSiRS3n/O6D4rPHDy5qq6/5TsfgJG7UhdTYpD3dTOlYNoS/4YrtmV9eAQpBZ
	 udnw6bjtJXvAH/xkCS7JQnGoFgNE5OCiD9vMT46/dfaft3AIKSEIylvXUPhTuXdUNH
	 RnjvXjoF3gBRg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBGQ8-0000rl-2y;
	Thu, 07 Dec 2023 16:36:12 +0100
Date: Thu, 7 Dec 2023 16:36:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: Add missing interrupts for
 qcs404/ipq5332
Message-ID: <ZXHmbCyK35g2_emY@hovoldconsulting.com>
References: <20231204100950.28712-1-quic_kriskura@quicinc.com>
 <20231204100950.28712-7-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204100950.28712-7-quic_kriskura@quicinc.com>

On Mon, Dec 04, 2023 at 03:39:50PM +0530, Krishna Kurapati wrote:
> For qcs404 and ipq5332, certain interrupts are missing in DT.
> Add them to ensure they are in accordance to bindings.

Here too you can say something about the remote wakeup functionality
that this potentially enables (at least on ipq5332 with the current
Linux implementation).

Johan

