Return-Path: <linux-arm-msm+bounces-68598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E1B2194F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A56762207B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EF2283FDB;
	Mon, 11 Aug 2025 23:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSUDJo7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E8283CBF;
	Mon, 11 Aug 2025 23:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954854; cv=none; b=CyBl+ILw1g1N/gvKk/vYw67DfI0IbwIfSmO1BJ6yAs50S3KJP8EXl7mc8FT61sbhR8p2zL+6Kwjb80pJCi+TgYjp5eVjgeAMPDQZmrPw9VJN3qEkd0snSshePfu4Bux+jKjdIqJkhAPz+knymc/HUe1wWcuOgjb/JFnpU4L0tlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954854; c=relaxed/simple;
	bh=chIQDZpRnyTsv6ULEvKC5vZHNloJA0QOssDX7HgJMd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ghNLlC+IstpL/a2GV2xHi++SCKdOZmN90bv2KOhlKgiQi/YWhrYSIcbPlKwHXnDlH7Xn483wm8Cziw9CEl5eZlf4exXS1F5oFQBcbHc2x3fDf+FTZ8EkL7uVEtmnrQxMcH/swEKm/V0v3hBYMYM8vH6c9A+WcYQ11BNzXnfK82w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSUDJo7u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD2CC4CEFA;
	Mon, 11 Aug 2025 23:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954854;
	bh=chIQDZpRnyTsv6ULEvKC5vZHNloJA0QOssDX7HgJMd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XSUDJo7udsUbzksDJ/70xCNx42Cvjnk2OtAWfz2daAhs20cHuwi8bf02VOd+xqi4k
	 2Nn2IYfyPe3okxKEizeoMQGhr2QnZkyRsMCjfzDBYg1t9xTabQVEulMj5wcgZZlujt
	 oKCWOZ+n+haVzvFh8fwRkPaoAnMV4Q7SeMIcRdh6k5IMVNnoO/AovrJby/30Kdn/hA
	 sg16HMghh2Vk7VuAXDQesIN12ul0THqtKVRevOLmWbH4iENjHzJGEINP0uCiZvH66z
	 mZ4Kydfje8FDnVxShyhJ3ieM4VCbJgpniUjfNHQ0qaxJFxTDTl6YUACejsDITzKIfg
	 CMco14nCmlYOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] Add video clock controller DT support for sc8180x
Date: Mon, 11 Aug 2025 18:27:06 -0500
Message-ID: <175495482479.157244.11839510617849896155.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
References: <20250710-sc8180x-videocc-dt-v4-0-07a9d9d5e0e6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 10 Jul 2025 18:30:38 +0530, Satya Priya Kakitapalli wrote:
> 


Applied, thanks!

[1/2] dt-bindings: clock: qcom,videocc: Add sc8180x compatible
      commit: f87dea8b362b29ab8a54d1f35a0430017a716ee1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

