Return-Path: <linux-arm-msm+bounces-28675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1510953B9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F5061F26361
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C093D1514CC;
	Thu, 15 Aug 2024 20:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtvzzYXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E31A154423;
	Thu, 15 Aug 2024 20:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754462; cv=none; b=C7nKthbxBsJ7iynI4s/e/ezBVrSerI1rX4y1FkQnugfX46Vd20a78TK8IXmy4Dj/BdJMVsp738rKKWSq8vEy6b5tks/uaZnSQWgyDoPByIjqhE3FNtYiXLnc//HnsRs42KYU1w2psUhdZ3px46lwkWN+8IJeU5jlHp45RQ1IW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754462; c=relaxed/simple;
	bh=F8oflxuYzG6QdmTBIJevLlwno17ji+vnYLGMIEdxVhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g8C4TR+G5h+YaDdPWoIUAUaj5gQw3kEUds6pymuhaKjpZCIO4KUJjPGSA9aPij3KMdVD6fywvpOlOs/5OQ1sCihASzA2TUe+RU28pEly2M121S0sQ+WDB5QiR1Q5lPyTUm7Jwpm6eIvSrb9WxcIKXS9Z47qgVEqiyjYh9Azh3UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtvzzYXl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE30C4AF12;
	Thu, 15 Aug 2024 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754462;
	bh=F8oflxuYzG6QdmTBIJevLlwno17ji+vnYLGMIEdxVhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gtvzzYXljiGysfQNrXF6eT54sgX1myIhBlIamCwyn03R4erw/QpDXKc+zfWSs/cLv
	 F63p7ZYOY2up+KNcxl4Km8/VfHca6SWsXhYM4F9Elzmtp72lllkk933Glq0Ap4NcGg
	 2+LZSkMmsdWBaG02qniyQK+pcBcZcfpXBUcBEn3C/Jc0/zVt9y4z8JsUUu8NgD+8Z4
	 bY61USDIfCpXlUv1ncryT3T9b/9QXahbjSUQYSjtQzBxCI1CWYS0YrzNTqU2VWRzJc
	 /sMqafXWGgGN8v2fl8Kf83dnn6fl519XGOdufYwLxPcx/X58PkVHH2a7IZKYK6C11n
	 KVBD/bz5S8wFg==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 0/6] arm64: qcom: sa8775p: enable remoteprocs - ADSP, CDSP and GPDSP
Date: Thu, 15 Aug 2024 15:40:21 -0500
Message-ID: <172375444827.1011236.6685787299327190589.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Aug 2024 19:08:01 +0200, Bartosz Golaszewski wrote:
> Add DT bindings, relevant DT defines, DTS nodes and driver changes
> required to enable the remoteprocs on sa8775p.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> To: Jassi Brar <jassisinghbrar@gmail.com>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> [...]

Applied, thanks!

[2/6] dt-bindings: mailbox: qcom-ipcc: Add GPDSP0 and GPDSP1 clients
      commit: 89817522b1a58970ac1247f65af009b046344fb0
[5/6] arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes
      commit: df54dcb34ff2eaabc5f74afbdb2fec104e2263e6
[6/6] arm64: dts: qcom: sa8775p-ride: enable remoteprocs
      commit: 2bec6f6a22815c6a5651d2b9aa4f54baf1ae5e73

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

