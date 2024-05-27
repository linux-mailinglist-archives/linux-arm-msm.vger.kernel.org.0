Return-Path: <linux-arm-msm+bounces-20514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E20378CF7D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E0EF1F21628
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0578713B5B8;
	Mon, 27 May 2024 03:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtGXlrER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02D613B5A4;
	Mon, 27 May 2024 03:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778875; cv=none; b=rvCGpdTkd9v4iQjHYTlTMYQhYKHXJvaGv/smZ++SJBIGrSVrxyu8vggt4ww+P86n5fto7ruB8mL0LNi8El+XTQieJZaQAwpwxhx4m+oGSc+wmJltOZejrENFoQd/ZFrJ8LLUv1GKGy2Df5hQpsohbboaN0vDaHjTR1FjlLasXjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778875; c=relaxed/simple;
	bh=CHxjJQrtopW8dBxAgc3FEx+CTreovx0GR7Lh4NEkX1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7WkI027VCGBAodfDezO7U8/Zm/sj9uXITp1bp+kc/eCLiyLdjGUr8B7ablImyQdkkPbcRt1lAI4PM24SVTaWdZ7raruBhYYauUqB4J3qzfwpMcv+1TOXGxZs2zNQKzszPoxEA4xAtBOh5R43wXg0jtecRZLbnJ8bPGdQAyrHCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtGXlrER; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0557C4AF0B;
	Mon, 27 May 2024 03:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778875;
	bh=CHxjJQrtopW8dBxAgc3FEx+CTreovx0GR7Lh4NEkX1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OtGXlrERAySkOdUM7VGQ6seqKyl8hl1hfimM2s5z2theSbUWf6qYLuoZrwUc7Zrd0
	 090OTTDI4yehMt3iyKgaKocy19r5u8vTkbWti5NY/InV3Azb9F/F44C8p/dUdeKZo0
	 /pe0ZRhMvVVoRHcQiITkatUjMi6Y+SoaP7NFzrIV7dsJnGi0aqOHm1BDS24KlNDvxO
	 kPnYBGSOkkGw/K3V9vntg7pjklX3nqZoWaYPtIzuyqZ4hq0Sye2NF/0fnyIYBLWAtP
	 TJhzWRiQLpFQxNEqQs7QE4pfO9j16o620pNyr8uPei07aPoSGsE9/rLJF34aWc7DVw
	 Zb7yCR82m9KIw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Umang Chheda <quic_uchheda@quicinc.com>
Cc: quic_kamalw@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable PMK8350 RTC module
Date: Sun, 26 May 2024 22:00:40 -0500
Message-ID: <171677884191.490947.8943620748021230422.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240523131528.3454431-1-quic_uchheda@quicinc.com>
References: <20240523131528.3454431-1-quic_uchheda@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 May 2024 18:45:28 +0530, Umang Chheda wrote:
> Enable PMK8350 RTC module that is found on qcs6490-rb3gen2.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Enable PMK8350 RTC module
      commit: a55361454c210ae4fd840cde3913f320663c405a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

