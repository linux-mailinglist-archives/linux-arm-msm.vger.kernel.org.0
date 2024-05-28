Return-Path: <linux-arm-msm+bounces-20768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282A8D1CE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0871F1F24F88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC0C16E894;
	Tue, 28 May 2024 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVduIjSN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C60E1DFDE;
	Tue, 28 May 2024 13:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716902837; cv=none; b=T5jjuLptwgCazZbR4ZjvLk6/1Sj1LhIv4dD3WDMwEbal8y5hOZTin1r/GFLDhVDgbz2xUIFt8RS4LXLkzeIveGjb7BD+t64SDp+hPadLCYL77z2NEDk1Vsof+pjGWoi5ru95wbK9+aFSEKYiif5ew/loMQ3nl/r5QM/qK+vjBP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716902837; c=relaxed/simple;
	bh=619v0KKVAgpbSe51y1nEnqE18vmDCAl7j7wv482S4vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YPZkjNO4/+cfEo8NuajaGLGcolzUmmhVlgBVO93rku7WC0mufTpB2lmmOHncAywdhW1/0V7qG7QUXhGlspDnraIzhyXCGXJ3GYpJeqna3Q9OvSnrc75uK3S+jaYYO784ftCVNROPCUHtqUsaTx+vAZ7lQSzPK9AFO0ZzSQ1OMj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVduIjSN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF04C3277B;
	Tue, 28 May 2024 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716902836;
	bh=619v0KKVAgpbSe51y1nEnqE18vmDCAl7j7wv482S4vw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gVduIjSNToBd5Yf+innPoI9zUXLWJZv6AbuDsxX+uAG0QxvBwwPvsg6i5h/q2Y/ME
	 P5Ek+GAdixLPzSiKt/rw6orn4Rz+i5ktD+D+ir+bng5uo9A5+k6XeB6nFsY18QGxSL
	 AHUi0Y4CBcsUuDV+TTsf7HuD/qtwoP1y3xigQXsEDnJwWBgqPXKA/jzy/QgXEQszZ8
	 ETCB1jZRbd1t2qFyOw/vXKzOtt/o2hz2hdqqi9T7xxBMQPscO5czd1NTjLAzNlxOdR
	 OIS484XOdrSBg9eCcaVu3F/YmnEEDWQyyuYsKMRLQUyIFtNJ0uhkhAVn8ZlfIZJ5im
	 WI8P9IEIA78Gw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] arm64: dts: qcom: msm8996: enable fastrpc and glink-edge
Date: Tue, 28 May 2024 08:27:12 -0500
Message-ID: <171690283118.533694.14995712306393401883.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240418-msm8996-remoteproc-v2-0-b9ae852bf6bc@linaro.org>
References: <20240418-msm8996-remoteproc-v2-0-b9ae852bf6bc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Apr 2024 09:44:19 +0300, Dmitry Baryshkov wrote:
> Enable the FastRPC and glink-edge nodes on MSM8996 platform. Tested on
> APQ8096 Dragonboard820c.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: msm8996: add glink-edge nodes
      commit: 56ae780a4387d71dd709895acd95112d01f37fb4
[3/3] arm64: dts: msm8996: add fastrpc nodes
      commit: 1b80b83f893dd69efe3c3bf84cd9f661218ccfc0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

