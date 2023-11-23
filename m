Return-Path: <linux-arm-msm+bounces-1670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612027F5C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 11:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1394F280F3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 10:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912EB224E0;
	Thu, 23 Nov 2023 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjVlla1U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7A522EF4;
	Thu, 23 Nov 2023 10:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F56C433C8;
	Thu, 23 Nov 2023 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700735601;
	bh=TNV0MOl+Kv5Rz74vl7zwedVQV2taOHqLyWjOkSFHbWM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BjVlla1UM55SAtrua1lvBQhE9mHUmsjNDz8b//iAYFTi/EbHIQDsjwgjWUi24xkBB
	 7eJT0JlWxwfG2KDo/0srVFcWADZm1Spc++jCEuh6xrSbVsQf8+/a7if9SBOks4zvrP
	 PawUHN2As03Vg+cAC3tkOo5jazp/5gO5MIMEOJSPh7sigL9n100xSjozgAeEwGBPse
	 OOWv8/H7KVjropdbsDEQznxNj9MBlnQHwI+3KEB+k0TwrrIupDSarcnYP4uUce5Ckv
	 upyhJB3Aj4m6O/rYxHCimZgOhb+a/0Z4ve+KDWH9lN+pgK91iVMXXgrxBl5ec91J1u
	 FltIwtlgA0bMA==
From: Lee Jones <lee@kernel.org>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1698253601-11957-1-git-send-email-quic_mojha@quicinc.com>
References: <1698253601-11957-1-git-send-email-quic_mojha@quicinc.com>
Subject: Re: (subset) [PATCH v2 1/4] dt-bindings: mfd: qcom,tcsr: Add
 compatible for sm8250/sm8350
Message-Id: <170073559969.1231386.13642170765193211646.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 10:33:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Wed, 25 Oct 2023 22:36:38 +0530, Mukesh Ojha wrote:
> Document the compatible for both sm8250 and sm8350 SoCs.
> 
> 

Applied, thanks!

[1/4] dt-bindings: mfd: qcom,tcsr: Add compatible for sm8250/sm8350
      commit: a88f80580a1a076e69c4fecdf6d6441fac24e8c1

--
Lee Jones [李琼斯]


