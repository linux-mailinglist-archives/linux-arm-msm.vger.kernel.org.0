Return-Path: <linux-arm-msm+bounces-8266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D648883C3B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D1AD1F26918
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE0858215;
	Thu, 25 Jan 2024 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFpAGx/z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471E5820F;
	Thu, 25 Jan 2024 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189554; cv=none; b=X77jc0EPVV4Cqj36XuDzr1YxKjosBmkjFc0H99zRW2gMw6VAOb8tgorlMjZcwIQq44rSk1ozArQPXoTj0F6BF3bb+8WyU6v88MWla5cLBIq5lcxhLzQmli1ZxP1xYxCLmEbJH/QYZVdlEgvSnBK0CbjeRIO/7RwZR87I5LlRh4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189554; c=relaxed/simple;
	bh=KxLZlbCo3u1vof5nxjef2s7Hno6q6TkxdPQGhqT/7a4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zaa/Mfovj4FHjTqCIlebQOFzpD9ngAjiZd/FFXFyFkPY2DzTnwRaCjGgFrssnnPXOvHXFnAmLjbAkBNK9/P2a5Bj/aUSzHddGdIC/zehrxv+i6XaQoL0FqUVPhRCer1VRmS6O1VOREFA8eAl38qjxtUcPdTn/zTIsHFGh8Va0LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFpAGx/z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED323C43390;
	Thu, 25 Jan 2024 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706189554;
	bh=KxLZlbCo3u1vof5nxjef2s7Hno6q6TkxdPQGhqT/7a4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EFpAGx/z7gIAqn0gkdd/exC+5TMy9ncA9amTLW/b6wd/iw1OLhLajYpiIIb2BHgDR
	 RnpKO5X3UO+ejyKlC+LhcotXtpvHWJUSZixm3U7GI05HMyYpWGiRpGEMynYsL+4VLE
	 xF37fiN47+NQLj0mjEQiVGqOm2QzRwnqOdGyWz+ekOMxdWKfS79My8glaEZ99JO9Od
	 /fOaYaoqoGzL/txcXDPVQkpmhUy/JFTIgPvXnklUzGE6aInGsK9d1o3jNgA6UWuMZT
	 nobuHUOGIo0PimuUWmjQH/bBsqZdJDFx1OvhTJe/gGBDxNFWxYjlKL5A+nNjOAzMkL
	 vY9lMZLfKg/Ag==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20240116-usbc-phy-vls-clamp-v1-1-73b2da7691c5@linaro.org>
References: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
 <20240116-usbc-phy-vls-clamp-v1-1-73b2da7691c5@linaro.org>
Subject: Re: (subset) [PATCH 1/6] dt-bindings: mfd: qcom,tcsr: Add
 compatibles for QCM2290 and SM6115
Message-Id: <170618955168.1465157.430419163826466989.b4-ty@kernel.org>
Date: Thu, 25 Jan 2024 13:32:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Tue, 16 Jan 2024 03:08:27 +0200, Dmitry Baryshkov wrote:
> Add qcom,qcm2290-tcsr and qcom,sm6115-tcsr, compatibles for TCSR blocks
> on the corresponding platforms.
> 
> 

Applied, thanks!

[1/6] dt-bindings: mfd: qcom,tcsr: Add compatibles for QCM2290 and SM6115
      commit: cd84e6bd331fd556116ec4889dc282b07c392e42

--
Lee Jones [李琼斯]


