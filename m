Return-Path: <linux-arm-msm+bounces-41917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696E9F06ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9B0A16A54A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7981AB6FF;
	Fri, 13 Dec 2024 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSYUNEEy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0D46BFCA;
	Fri, 13 Dec 2024 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734079864; cv=none; b=TwFViQxaGJzBWmPkk6cfGYgHg5/ozFgCaBiTEEDa5myn35Jwvvxmu9JhuuZuvR4C7Zn+u51PbZWBvQyH0bmEIr3aTWRSudLAN4NHYZbeD8QXfVYqiNrRGlQJgfElnnD/BdTVz/EA7E9x+I3pmvt/FQZjRjfK9iYTplIHhIPkiSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734079864; c=relaxed/simple;
	bh=SHfv6Fa2cZK8RSvq+JDLJt6xCCCIJTBGEMQ6uDlKnOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRX5ieDNKPd9EsXSrpIkFGlYTE23VQJsaiwEQmlTn2mh7FAwauNMQNjLEEf8PgTJh4qbFdMZIioLby1pwGTYt6RY9P2psiXmYMXRTuZIiWGcWBCxkYE15nPO9XcXdKGEnppEN8fupJ/pit/kxucfi5rXjzz66FmjsS4eaf7+jAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSYUNEEy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9A9C4CED0;
	Fri, 13 Dec 2024 08:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734079863;
	bh=SHfv6Fa2cZK8RSvq+JDLJt6xCCCIJTBGEMQ6uDlKnOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSYUNEEyUQ9dorfk9LAZPL84EGeG9FutZA83Kw3nXvd4Z7Kt3LMvgOKotEeRzSlFf
	 lcrSc/r2xxCchJ0hgZMbjiJRGI6UV7L4x8y/hooS4PIyJ37e3Ys+KEzCi8rqzngyh8
	 Q4RFvVB+UgwxdwkjiKoGiC41yNGoBfjNW6YP26HBh8Td25AUvxOjNVs4jUN8hEPxXH
	 c/Qfmvw+p5zhNrQUzK6/agFkiRehJKt720LpZZ6MTXUqhdbQ7Nou8AHOGnTwOHkm98
	 t5LUctmPbsd5xR/fkcfbeIYxrSN6tvWrDJxVUhJxk+gqM2m+FVazdajqeNA1oC1E7Z
	 TqB00vdbvh44g==
Date: Fri, 13 Dec 2024 09:51:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com, 
	quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sa8775p-ride: Add firmware-name
 in BT node
Message-ID: <qjfytsieecdiavyosc6u2t2t5uhmkzrhw4ad7oykd7x23o5yp2@5bteod5q7yud>
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
 <20241212150232.3823088-5-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212150232.3823088-5-quic_chejiang@quicinc.com>

On Thu, Dec 12, 2024 at 11:02:32PM +0800, Cheng Jiang wrote:
> The sa8775p-ride platform uses the QCA6698 Bluetooth chip. While the
> QCA6698 shares the same IP core as the WCN6855, it has different RF
> components and RAM sizes, requiring new firmware files. Use the
> firmware-name property to specify the NVM and rampatch firmware to load.
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Just to recap: this patch must not be applied to Bluetooth tree, but it
should go via Qualcomm soc.

Best regards,
Krzysztof


