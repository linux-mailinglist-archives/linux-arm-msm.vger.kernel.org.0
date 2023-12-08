Return-Path: <linux-arm-msm+bounces-3974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F880A601
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC1C0281C06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A49208B5;
	Fri,  8 Dec 2023 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJR1fAyz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D4208B0;
	Fri,  8 Dec 2023 14:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF2AC43395;
	Fri,  8 Dec 2023 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047077;
	bh=Mgz/X19oVnISptS/AZDYfWimbseZ3sluutSJ5YKISHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJR1fAyzkEYD89BQJdajdqxZmhlGLUNRHak6tAzY0+43WhTvRV0/Xrgs/Yt43CVv0
	 +TykY27dVuZfcZesAaxDxxm4bMQIjY17uriyVRKfiN5NVDeEORR5NYQjmpFSQAh/NZ
	 nw94L7qSgQvFLPn4/miLWl1FVhg9E1lHKE8iGojPDimS/LYG0wmndUYHt3W5wA+aFg
	 K59xJEj7Pk+DZdNUSs7omLHj8jxO72YyuEbmhDcTwszm3h+QP9as9cZfgYVB01nOui
	 HcdHG00IoWBXJWqIOoie+TLAjeMsChoZfBRT1Kyo/3XW6/pKE5k9Y1SnIG9QDUGiNV
	 TWwcQZsQKFbHA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] qcom: socinfo: Add SM8650 SoC ID table entry
Date: Fri,  8 Dec 2023 06:55:26 -0800
Message-ID: <170204733615.342318.2308942256537449998.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030-topic-sm8650-upstream-socinfo-v2-0-4751e7391dc9@linaro.org>
References: <20231030-topic-sm8650-upstream-socinfo-v2-0-4751e7391dc9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Oct 2023 10:55:18 +0100, Neil Armstrong wrote:
> For convenience, a regularly refreshed linux-next based git tree containing
> all the SM8650 related work is available at:
> https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstream/integ
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8650
      commit: 216382b1555de2fe11684ffd99d598ac77a92ed8
[2/2] soc: qcom: socinfo: Add SM8650 SoC ID table entry
      commit: f61319e57d89e6e3d1ad16cb916074fdb7289806

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

