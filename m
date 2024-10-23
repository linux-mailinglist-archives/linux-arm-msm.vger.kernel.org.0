Return-Path: <linux-arm-msm+bounces-35502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DF29ABCAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13F621C2203F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB8A144304;
	Wed, 23 Oct 2024 04:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaLBoEpC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3E142903;
	Wed, 23 Oct 2024 04:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656974; cv=none; b=k+dLmGZBis9rx3Zttu0np+nwQwruyI5eIgSFx+23ZTxbg28BWyFMUeG+5byRKTpESBZXHKU892UftOHMrSiuQ13XtmjVMHq73xV/+Em3LbM6iXEvoY7snZ4xNumn5PgMih5znbMUn7Gtou+jgABXcjg4Q4Z3VW8NNlUBoHl76oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656974; c=relaxed/simple;
	bh=PxEAhgmdi4Mfhh6vbudKFrFXR+B3HZJ3aWukHD/bNHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KNI9cFkUVspYpm3OOWFn52s4SddbAOAVMJE5ZmbjhQ3He6B2/AQuQD5BPrsTN97mysCTtkdc59vgulfkFWLXTEgk+alV3bqVqQCncU6s/r+ZdsAsCL56LXfrKITg90OVwLod/64kxKHlIzQTXt+sEXARJcUEYOuVlbTrMeH14yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaLBoEpC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C50C4CEF2;
	Wed, 23 Oct 2024 04:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656973;
	bh=PxEAhgmdi4Mfhh6vbudKFrFXR+B3HZJ3aWukHD/bNHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BaLBoEpCGVpT36RRtk6KLQy6qJpn956kVMFSLMXJAMfSkOAnbnBj8Byk8ua61aGUE
	 ejZvw6rZktjvOxjHxXoGG+9oQ49zOsVGNE5ICAlIEJpKO/7q3Dm+uqJ/4z77sRyY5g
	 pB0HfVNYw7hINPHHSweuR1JTO5nVheBzCqa2droxvOwpL0Rz+/aFASd9jZRuYdTz3K
	 t0cWBEtDC6h5Qkesahhh0ouW4Jp6WY/oIrhCpdtvHTB6RQ3F5FRt/JUCzT7XpfTlUG
	 HgUDfkoroA28uLjY2gz/iKPW+6onB/az/G/rgsxzSAE+DsPGnOt/ofN+2c2/3WH7Mr
	 QheN8M41PHuiA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Add SAR2130P compatible
Date: Tue, 22 Oct 2024 23:15:50 -0500
Message-ID: <172965696419.224417.15060996858186081009.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017-sar2130p-scm-v1-1-cc74a6b75c94@linaro.org>
References: <20241017-sar2130p-scm-v1-1-cc74a6b75c94@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Oct 2024 21:20:16 +0300, Dmitry Baryshkov wrote:
> Document compatible for the SCM firmware interface on SAR2130P platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: qcom,scm: Add SAR2130P compatible
      commit: e19bc8b2249b13a34bb2db82755cee5a1dad0ef2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

