Return-Path: <linux-arm-msm+bounces-50841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E397A59519
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B08153B081B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54612227E82;
	Mon, 10 Mar 2025 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX2LXMqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F6C226D1B;
	Mon, 10 Mar 2025 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611027; cv=none; b=VP1mlKH7JTGLm42v6i+s0USt1EY9rY2jnKj++WeHA1j5i1hf8RZ8kykTbHB1Bl1Wvkq9dcQZDP9blJaWAkagyoyLjIjvbBKEgQthuPz5Ta6ue8+WfGTWfymUhS+gFYeqtk7QUAjQsWxxKFDshFsLi8my2dlS/3rqCi+Zz0UFb2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611027; c=relaxed/simple;
	bh=cwRxbSYGPKZURVn4Ulz5UQrnvelO0Eq/qUFVt1xOCi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HibQ5hn6b8CzJ4Kv9VHdQkUS4PxUJ92WhBFm0UzKedbHMnAX5e9b603Jn7stlhsx04UZvYo4sgVMy6kp7L+MXCCQPV7VIZEPf50duYUGEyJcMw463ZqoUj6KrDDuyKOAIUjuNKXSp6RIVJHSYFxKZBZV3rzw7OWO7NUngfd2GVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX2LXMqE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C40CC4CEE5;
	Mon, 10 Mar 2025 12:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741611026;
	bh=cwRxbSYGPKZURVn4Ulz5UQrnvelO0Eq/qUFVt1xOCi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nX2LXMqEKvvhandPRi5CCpzEZSMwiY3SyDANr1bp1xCcCzJI+qpr37uJZGupLOBW/
	 9lihcf6CYjnHHGicwkahaA1zmO4+JXuoPjRCRgoYyXFw+myxw7D0HTc+u+hnu9f32x
	 Szxx2IITjFpbY96qm+/YpmdpwqDFVCR6JFvQi9U2R3wrB5fSu5QD7J9H9mecgONG/5
	 /emb+uicouqoGUWc5ZY0LL4X7hPTvGhPuEwXlME9fHMXvKsRpQ664dal7RS3e4ybPk
	 K6LL/ZvQaYpxXhp89VdWJjS4XdDbScvNMWXQ9UoFCQ55gaXQDi3sd4qEXJarVufhJB
	 kQ7MFckkj9NBg==
Date: Mon, 10 Mar 2025 07:50:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,dwc3: Synchronize minItems for
 interrupts and -names
Message-ID: <174161102447.3880921.7318967910714477223.robh@kernel.org>
References: <20250308-topic-dt_bindings_fixes_usb-v2-1-3169a3394d5b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-topic-dt_bindings_fixes_usb-v2-1-3169a3394d5b@oss.qualcomm.com>


On Sat, 08 Mar 2025 17:24:15 +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It makes sense that ARRAY_SIZE(prop) should == ARRAY_SIZE(prop-names),
> so allow that to happen with interrupts.
> 
> Fixes bogus warnings such as:
> usb@c2f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
> 
> Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> - Use a better reference in the Fixes tag
> - Link to v1: https://lore.kernel.org/r/20250306-topic-dt_bindings_fixes_usb-v1-1-e1e6a5bde871@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


