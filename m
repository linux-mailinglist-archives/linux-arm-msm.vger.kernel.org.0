Return-Path: <linux-arm-msm+bounces-58574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 806AFABCD04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D3F4A4422
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1915D25C839;
	Tue, 20 May 2025 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rz+pECU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C8A25C833;
	Tue, 20 May 2025 02:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707319; cv=none; b=qC+BImlIoCclSAHgJ25pyL54lb43LeQNcRGRaE2dGYwmqyGEsgkoeG42pgWRnqJZ9UUlvqfC7LoI/79VIIpWc2oZvGIUalbG4wyG18bE8L0pRx3oBW5gHElHj6Ng31Ry+HRt6F/DwIsG+Un4d1HUKRKqohDt0ZhzjAMJRZRKM40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707319; c=relaxed/simple;
	bh=643zK5XKfnxYiPb06oCbJ48dI1D6aaqm47i0Quyql04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3s/ragurkZ9+D+s+0HhESMeoG0rEP16DJ8duQ+EVtuYaaBBh8z6+O1t90tA+NL4dWR/bLOKC0DTg7rmrQgWH/Io5g2Bq4ShUTHsBxD+RHAWJ/KHCaDjRVpiN8LaCdGZI7+BMisRL2swaFM/BDKBj0zPZjo/RdnevLo1yArba+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rz+pECU9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DACC4CEEF;
	Tue, 20 May 2025 02:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707318;
	bh=643zK5XKfnxYiPb06oCbJ48dI1D6aaqm47i0Quyql04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rz+pECU9IbuoTPqQyXcpm18KEo2P/OULou3VHes0OG03TxGg8dqOhros++laKHwc7
	 RU2hnQumHeWu5NnYciuAK6bnDHKrukf5kxw9Vfg3QyYhDThTZf9MZjzkVIjHiySeYA
	 ng1eXVwsu/kex8tpfKbb0nLdHBuSuH3VQHMvPsy5qqmd2/S7mlNW+McIwWlWKP4bTK
	 X43sWWanqYQQVjBCy9PjPjWrixpp4j7dZizDH+z96CCgxNXisa/UfqUztyymCwKGBD
	 Rs3F7xwLFDfKQ7AelxZRhxAUICHa3SD0vxdrHicbPoYUVlfxeKzGrja/IdDZBjLosH
	 3IqcZkzUy8zfA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Maud Spierings <maud_spierings@hotmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth
Date: Mon, 19 May 2025 21:14:46 -0500
Message-ID: <174770727723.36693.13352978360096773573.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328-asus_qcom_display-v7-1-322d2bff937d@hotmail.com>
References: <20250328-asus_qcom_display-v7-1-322d2bff937d@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Mar 2025 19:46:45 +0100, Maud Spierings wrote:
> Add bluetooth for the asus vivobook s15
> Describe wlan configuration
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth
      commit: fff7f1c8442b2b2be565892b0d42bb9ef9723fb3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

