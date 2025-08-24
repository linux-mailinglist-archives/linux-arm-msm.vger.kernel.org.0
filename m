Return-Path: <linux-arm-msm+bounces-70497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE0BB32D1B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D6AC1B604E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F7321D3D4;
	Sun, 24 Aug 2025 02:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+wM0uJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5821CA10;
	Sun, 24 Aug 2025 02:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004168; cv=none; b=i/ui63/afvBwedc4B9YbU6WfPX+rMk2gs33/g1oDKEp9vO1tmoQ7ATpvb4+7ri6ohCJ76HGaVnBGutRPsTYTteVpHmoIW7CotJ7puZbPT97d14JnWR1hgZz30w3OC1qE//w0jc5Li2pkx/BBBsmoDyavzhU8R6iHAky/ItQXfMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004168; c=relaxed/simple;
	bh=vnzHvE+TSKxJnEzTsLG/tA5h2voT+dDH63RfprCUCX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aXAOkW/t5j1zhwusfTtiqPDKVVi57PFGTAa36GOFf36WgZxY91K7PIDjlI4JOp9odqp1QJcaBI0cM6StHoXTW2FJ+iFWAcpXUJqDYHx578pvrB1Vg2hwS9+bJx0WC+vvPERXwSyZ4K1FBGh0S1Fl4COAqeXT+ygrdfB03tmQWOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+wM0uJ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170DDC113CF;
	Sun, 24 Aug 2025 02:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004167;
	bh=vnzHvE+TSKxJnEzTsLG/tA5h2voT+dDH63RfprCUCX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C+wM0uJ6yeRTAb612Tx1ahNprUB1G/Z/z8DSmGeco3XrgNa5BfPplF5Wk6kBDRapr
	 lw7nzh91oOLFZg/vCpheYjjpqQr1124xgctLgG0gzil/GIQ4yBP8hg0iWt3zMrI1Fb
	 JW+m3eklv+E4bwn2LN8wbSh0hY9lbgDiUxHN78/XHGZ89iXc0kSqXr4tEZ8UL+daVG
	 mDg1rnVhIVa8Y+eDFhyn28MUUq51GZfTAIPuiivdnk4aVxtFe/4tX/gUiWSi/PTNbX
	 H8qXdI7vJ9HqVUVuZKcs0eiCgeVbsnSRZef70HZXRH4hG/1TefPexIoqs8lq5RN/zj
	 lIhbyk9rBv+dw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	devi priya <quic_devipriy@quicinc.com>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: use 'pcie' as node name for 'pcie0'
Date: Sat, 23 Aug 2025 21:55:40 -0500
Message-ID: <175600415271.952266.6894191156639900085.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618-ipq9574-pcie0-name-v1-1-f0a8016ea504@gmail.com>
References: <20250618-ipq9574-pcie0-name-v1-1-f0a8016ea504@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Jun 2025 22:14:09 +0200, Gabor Juhos wrote:
> The PCI controller at address 28000000 supports PCIe only, so use 'pcie'
> as node name for that. This ensures that all PCIe controller instance
> nodes are using the same name.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq9574: use 'pcie' as node name for 'pcie0'
      commit: c6fa3429cf3ccd806a4059706ebd0f2221b5b965

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

