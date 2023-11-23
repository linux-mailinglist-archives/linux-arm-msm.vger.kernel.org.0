Return-Path: <linux-arm-msm+bounces-1743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 991DD7F651B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 18:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C80C71C20F7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 17:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D903FE50;
	Thu, 23 Nov 2023 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRGFbDOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F493FE28;
	Thu, 23 Nov 2023 17:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3B2C433C7;
	Thu, 23 Nov 2023 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700759916;
	bh=VfLbIw4uft5SCXKloHizPrPXh+pbMziShDpa3FrSeo4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gRGFbDODAHk+10czz+dGtRvfja+tbJwqvf7hVnCBZy9cLg1Lb2WREsxyLk6BsvGxk
	 bcMo1D6CXY1tgd8nfb12lQyfgq4a/owNyRBHck8u4SWDkpmbLzzew69JQvIwAAiEEA
	 jfCldkI8VsBDEQOOf8e3KD91eRZbaACwwTbE6uKRJudd1AS9Siv3DO3qMN3Abf1mrE
	 inU8e8sbJ7w5tsib61s12NXwHAXeg+HSk5e5JUpwajhL35KItZM6FrkqAW86c4UoNe
	 IQYEHEM+X0YdeLMIOXBYbe/a/gQMb/u4dE+2Hhbt4daFXjEFog17CeMzMd78NwL4uH
	 yCKl9ytKEmBow==
From: Lee Jones <lee@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Nikita Travkin <nikita@trvn.ru>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231120-pm8916-dtsi-bms-lbc-v4-1-4f91056c8252@trvn.ru>
References: <20231120-pm8916-dtsi-bms-lbc-v4-0-4f91056c8252@trvn.ru>
 <20231120-pm8916-dtsi-bms-lbc-v4-1-4f91056c8252@trvn.ru>
Subject: Re: (subset) [PATCH v4 1/3] dt-bindings: mfd: qcom,spmi-pmic: Add
 pm8916 vm-bms and lbc
Message-Id: <170075991369.1460551.2059005870143755036.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:18:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Mon, 20 Nov 2023 19:03:03 +0500, Nikita Travkin wrote:
> PM8916 (and probably some other similar pmics) have hardware blocks for
> battery monitoring and charging. Add patterns for respecive nodes so the
> devicetree for those blocks can be validated properly.
> 
> 

Applied, thanks!

[1/3] dt-bindings: mfd: qcom,spmi-pmic: Add pm8916 vm-bms and lbc
      commit: 95f44ef666a6504a7c75def89fffacb0ae4bf52c

--
Lee Jones [李琼斯]


