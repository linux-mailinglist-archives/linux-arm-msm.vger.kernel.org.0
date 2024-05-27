Return-Path: <linux-arm-msm+bounces-20498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0A98CF793
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4694C280FE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7708F9F0;
	Mon, 27 May 2024 03:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TE4e+nti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAF1DF60;
	Mon, 27 May 2024 03:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778855; cv=none; b=egXH+KN8GO67orNj3PZ9KU6f4Z2uY1lDbc3RPBag7jwt/emQ44ZufOyg2OzF1dkI5BUN8cuhQVG5FZdepWHPl77L5SmfjdTAYGGdwbpV6BpJdGl+LdDpyzVtDcfEP3t/M9Gaiifnu5Vii3sftmOvYPpJ8/RVSCQPO6RYk+IuSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778855; c=relaxed/simple;
	bh=J7PtW/zIXeoXSAUPbwivsvuwKj4u7aHQfsz0L1qi6Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpavoxoq1AKcsG2kvFAevEbROr5vY9JjFkljyoq1CglrDD9tp05uF/do/juD2BjBN9RVhb6KaQw5TUZBABnqXOZU2stmJh0qvvBToY/if7j+BfwOMGRpRMGq7F7mhDenvzUo8LG5uL13sJKADAfFoHhTWZZcfY9GHqEAQqBPEcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TE4e+nti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F7BC4AF0F;
	Mon, 27 May 2024 03:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778855;
	bh=J7PtW/zIXeoXSAUPbwivsvuwKj4u7aHQfsz0L1qi6Uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TE4e+ntiwqbPc02KBkq2OmgqeRFlNqpVZoH7nqn3T5suQFDHjyUqKeg0+/7G1zqOF
	 w1WNoJHG8SaGURuic9UqxONdZnU73eUrBUmWQjGqkHTLe9xjx7BUTKSnoKI0TW+g4u
	 68YnyGzcUvhOIFCnROFxg2pFl/4mz17WwtqNG03R//aDNhhiw++TiS4Q7jKTifwTF5
	 W8nqsb7y9E2But6QEDUfeUk0Y12LT7rPEkpEUlmOxZ1CuJjV7aYYSy7+JOj6T0Bc1l
	 R4Q9IQhXSukQXuKt3Qo8mVXtUqOmd/ROFJ4wYYeYwWPSTJnt9R0nRxFeO4+Z8EURg0
	 BWSZdMaKpr1Xg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] firmware: qcom: uefisecapp: Allow on X1E devices
Date: Sun, 26 May 2024 22:00:24 -0500
Message-ID: <171677884188.490947.17068303422915690993.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240523-x1e-efivarfs-v1-1-5d986265b8e4@quicinc.com>
References: <20240523-x1e-efivarfs-v1-1-5d986265b8e4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 May 2024 20:28:41 -0700, Bjorn Andersson wrote:
> As with previous platforms, qseecom and the uefisecapp provides access
> to EFI variables. Add X1E CRD and QCP devices to the allowlist.
> 
> 

Applied, thanks!

[1/1] firmware: qcom: uefisecapp: Allow on X1E devices
      commit: 9e7b5b4f5ec4e8f677ea17f72355ca1f1fd4e5a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

