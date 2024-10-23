Return-Path: <linux-arm-msm+bounces-35507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899A9ABCBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C423B1F23BCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB15313B7A1;
	Wed, 23 Oct 2024 04:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rbOQCvev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D514A4E7;
	Wed, 23 Oct 2024 04:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656978; cv=none; b=GLTHjRvtBHairhw8dbaAq0RR5kcbclR4/M+k6jJg8fR3irnSVqEYcmCjsBtnWfjDbxCWl7GTXoi74zV1iNviHlCkIrtIqms7Uz4xWFetErV12Jaf/CptMTFhJStfv9HHHIBru7GZkqU+5s08s8/Cqdo7w3B51BqiKhv5Svlr6mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656978; c=relaxed/simple;
	bh=DMXoqvwVWdBYBgHw2NIvgPDVOnMhKA+dDUEorjB1S4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4pRBneqkKof+o8aoz8j4Ejw/Cu+kJs7WJ+sRzZEJULmLA35leIYc6Y7w/oq4si7q4qBTvso7/ECsaY0icMw5wxe3BsE6tEqm4ihtdKODtiT7Wgg+2Al6qjoTGlUwsj34truKNNwgpMblr+N0RJS3w0FqvwzJQ8Awm0lAPYKrDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rbOQCvev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C401FC4CEE5;
	Wed, 23 Oct 2024 04:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656978;
	bh=DMXoqvwVWdBYBgHw2NIvgPDVOnMhKA+dDUEorjB1S4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rbOQCvev+SSQ0vY8n+iDuGTrl5jpFDdFnvprAq2xQAC6iT1FDFESYdqsUNjEmwQBa
	 l1YOa56vQbSFllR19EbMON4gWpmvFB25KtPuc7nmzvQfG8JuFdxmUqASjELaNo7vp/
	 8nfQCNVKeWJKuWUo2hkklfDTsl/0kywvT8Dzax4a9cWD2pUVybtvD55BIxY57fWuwG
	 tvkkCaPXU5QPBhWXlql3T/TcKYMktEDzhG04hnNVMRRrQvzheZOm3+ESGCfQjgNNya
	 0uIJX7jstEpFik+c2PmL8F7c7E4Sg4HODhc8Unb32Otl5UzEWXnS2HUN1NhPl8c03J
	 Ozaj6N2mMMNoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: qcom: aoss-qmp: Add SM8750
Date: Tue, 22 Oct 2024 23:15:55 -0500
Message-ID: <172965696416.224417.9942167948098638724.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022064214.22868-1-krzysztof.kozlowski@linaro.org>
References: <20241022064214.22868-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Oct 2024 08:42:14 +0200, Krzysztof Kozlowski wrote:
> Document compatible for Qualcomm SM8750 SoC Always-on SubSystem (AOSS),
> compatible with existing generic fallback.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: qcom: aoss-qmp: Add SM8750
      commit: cb0d1c4e9b6b2b362ff41344157d33e2daf6ef7a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

