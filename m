Return-Path: <linux-arm-msm+bounces-33889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F333D9989DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ED481C237AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053EC1F12E1;
	Thu, 10 Oct 2024 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWrGyncy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F61EF957;
	Thu, 10 Oct 2024 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728570607; cv=none; b=fLFu+it6S2PAxm2plvET6yQekijVJymxwBvsWFQQesMT4V7AdXavstPL+c9tJ0e1CeFPugnOoRbJ9ZhM5m4ylxE3KFxcR/a1HEU8MlDxmNsCsom8QytezDqXyC9wcfvKpIfSnfu+P+rj9szCjj3STUQ+Vv4wxnAULQzGNxelh3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728570607; c=relaxed/simple;
	bh=hzffNFSJuXpCg0+rCFDxjeblHFqpEm09cVrwjs6DecA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=K7tkq2Kd4Yu3+E6ZuzYhcrfeyGM1dUzMTWXPoJl7h7jnshaduyzMPCqqLjElMH8AGcyNFRofjXCv1EMre2FXymS67wXhlC6jC+aQb7hePae3T3NnxkalmyACvj8A4wdc1GkLii3kJQP5KEYadlLaWRK1o+2QgMYN1Ok0L/31/8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWrGyncy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E02C4CEC5;
	Thu, 10 Oct 2024 14:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728570607;
	bh=hzffNFSJuXpCg0+rCFDxjeblHFqpEm09cVrwjs6DecA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=tWrGyncyRfy96refBmjX4q8ObNGS4G/ilLeFopviN7ElJoy6WTk6av2Esyadx5Gma
	 6UHTdLmhLmf+hF4bWylfiP8mCkyka6o9K1c7RJ13fZ9aY108gT2/S765QLU+0J5tpq
	 LnEpveDzJsFOD2FCDzEg3fIxGrTxEFdM/PHaB4cskGKtzLpJAT8+Fay0RINOG50eoy
	 lR+W7c8DDcfyNfcfUPtbULG3qpXMQk99znTi7uLakO3E2yZlq4xlUcXOSZEriik755
	 n4E32qm7vn4sAT+90ph0su6zj8a+ZuOT39VN9OkFJAaMg0I4y3HYfKmQ8Kgcrv6fzt
	 2vBkezFWQJoXQ==
Date: Thu, 10 Oct 2024 09:30:06 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 quic_hbandi@quicinc.com, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, quic_mohamull@quicinc.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20241010110456.829-1-quic_janathot@quicinc.com>
References: <20241010110456.829-1-quic_janathot@quicinc.com>
Message-Id: <172857035975.1533208.11708655229107981854.robh@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: qcm6490-idp: enable Bluetooth


On Thu, 10 Oct 2024 16:34:56 +0530, Janaki Ramaiah Thota wrote:
> Add Bluetooth and UART7 support for qcm6490-idp.
> 
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 123 ++++++++++++++++++++++-
>  1 file changed, 122 insertions(+), 1 deletion(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/qcm6490-idp.dtb' for 20241010110456.829-1-quic_janathot@quicinc.com:

arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: bluetooth: 'vddio-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#






