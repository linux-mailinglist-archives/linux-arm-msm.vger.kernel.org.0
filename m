Return-Path: <linux-arm-msm+bounces-34888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 796879A370B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 208511F21DBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47932187FF4;
	Fri, 18 Oct 2024 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3VUIdVh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3251865EF;
	Fri, 18 Oct 2024 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236191; cv=none; b=LWOT3z4oraQZJppTD9sEmu5RYu1WTi9Mgm8+KY55NXwJTUp88Ww3VI2CY2HXzt2c0BgZHY4BKhTGV32iUwNLIaIuo4CZx+UKu0AhETILfgvDeYiewtH4MXxERbGBu+2k6wUOQNlCJTKWGwbkmM/cAI4h6JoOyddNlr/qyCdm0NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236191; c=relaxed/simple;
	bh=+Xo0pyFcKhc429CNpcBtqw093/sA2hu3h28feNOpAvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqQZj12p82wQ4RbQrCGpJGBxPrld/qW1HvxrH0K8M1IFQAyVTPAlpSDIEQmi4VDm5mvYQwqvtnnlA27dg+rHmf4eX0v0csU0mReY6dc57kl7W4DTZK6dioJW8g/06Jl5jxTdmo+4OlniCh5vdMsYtlKEYNhTH3ryHyNM6MhMubo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3VUIdVh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD316C4CEC3;
	Fri, 18 Oct 2024 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729236190;
	bh=+Xo0pyFcKhc429CNpcBtqw093/sA2hu3h28feNOpAvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3VUIdVh5YM9F6fCvAPC4j6/t4G4QDYCQRLmdTO3NLaL7hxy7uohywdfbMHtS8Ecu
	 2H4x6a6oZQWpkGRpQrSh9H993DO9t1WYlmbunBYnf94QtG5LcjvuEy08hNqfLeUFCd
	 Qdz9nb476o/m2Mh6QcY6qXdYxQZIHsW1iVQcDOeSbKQasYiv177tjIBCzi7XMZfqZh
	 3N1dCstynUX0Et8+zn5YlCzWig7Y0G6TtC5/pUehheoSiSbc5MBhRtHaedA+AwLitd
	 G36/qCpg5lCB6+l17ey+rV0bDbjIewdqiG1EzQSS8kQjE4JEE8m5AYMoXRJ12yXX60
	 QYq5hWk4ph9vg==
Date: Fri, 18 Oct 2024 09:23:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Add SAR2130P compatible
Message-ID: <yrvpuf7ut77rqz6xumimlx6xajpxwynz724gujhmblkha2cru2@n34vvcepx5a6>
References: <20241017-sar2130p-soc-v1-1-7f9c204710c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-soc-v1-1-7f9c204710c3@linaro.org>

On Thu, Oct 17, 2024 at 09:19:47PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the Always-On Subsystem on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


