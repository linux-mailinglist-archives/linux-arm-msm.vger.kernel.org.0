Return-Path: <linux-arm-msm+bounces-31517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4B59755C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 16:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A9571C22C03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 14:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2433C1A305C;
	Wed, 11 Sep 2024 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfRI8rZk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EAC19FA86;
	Wed, 11 Sep 2024 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065557; cv=none; b=DwA/yAFTH0MuyzNs2OyaBeZKLm5wefwWbJ4Exdq9mQ6MkzoYlm2SR3a7144EpUXJshGQOteKvkFb07KvZ4VYciAG8RNKIM/WhU5b9aq5tgPH/tLRH5OLeM4zym1B6g7NG9xKpLiZm3w7awAnwR9FkXc7T/lD2HznYjMsR45KJ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065557; c=relaxed/simple;
	bh=RIl2vqs1rYnlBT7Pma3eLUwMyWxA2WhBMmHCl3yi23w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qa56kvUYDTk5tFtGkUJ2FZ6eLCRbdt/MaopCB8rxglh6EYrUloTelPpzdzkXwMbwNjriAkxTvOn3wZ/jpkUvcd9TZp0N8GgwpZJW6OHFDfoOXEemStgb5LEXbfaM3u5XByPjxY7gDbhG7z4lXLiUUOsGYRmGLvXl43hS3F8hnXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfRI8rZk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAF5C4CEC0;
	Wed, 11 Sep 2024 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726065556;
	bh=RIl2vqs1rYnlBT7Pma3eLUwMyWxA2WhBMmHCl3yi23w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pfRI8rZkJxendEAuv296Bmdk4n5+LS0TrKnAdyRfGNFbRry3Cc8V9v5w+OCkGJquL
	 Hb546cSEeEqrKuwYHwWehHT2yTVW98jjqaDMA2oxWTAzXZj2dTJQ4VNRLRWKlGd/IR
	 OWAaxEZubpLkhCWdAa+cNhOrTYIRCu9bKeg6dZHw059FTJ/DSq5YRTPASqFenV9eeM
	 4S9PsqZCziq4X2OTpXMXrT/JP4OJmtNUPuIhfExVz26KcvEUBsLz7VU7QleKH9r7jZ
	 RNEj2iKswTHfK4auCiezX/d9k3TPpLeStgf4y139By85RbAPGzkLlstoIn7TI6aFLL
	 QQM3q9B00ajcw==
Date: Wed, 11 Sep 2024 09:39:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
	linux-arm-kernel@lists.infradead.org,
	Tao Zhang <quic_taozha@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Song Chai <quic_songchai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>, coresight@lists.linaro.org,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v5 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
Message-ID: <172606555436.153197.17103030569267503329.robh@kernel.org>
References: <20240909033458.3118238-1-quic_jiegan@quicinc.com>
 <20240909033458.3118238-4-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909033458.3118238-4-quic_jiegan@quicinc.com>


On Mon, 09 Sep 2024 11:34:56 +0800, Jie Gan wrote:
> Add binding file to specify how to define a Coresight TMC
> Control Unit device in device tree.
> 
> It is responsible for controlling the data filter function
> based on the source device's Trace ID for TMC ETR device.
> The trace data with that Trace id can get into ETR's buffer
> while other trace data gets ignored.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-ctcu.yaml     | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


