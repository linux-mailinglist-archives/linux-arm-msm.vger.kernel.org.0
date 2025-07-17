Return-Path: <linux-arm-msm+bounces-65352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D310B083DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB6797B8CCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CBF217648;
	Thu, 17 Jul 2025 04:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzq0ICaX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED42212B0A;
	Thu, 17 Jul 2025 04:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726685; cv=none; b=JgRRAsOZQVuIBiR4FaDWqn8emzlyWxmewZPfWjR49YT0wMabLzyXbiy6trWtrJ2TlPPYHQuunU1L9eelCHusto0RtkqKPXv5/3hFCR5NniVl1vRhbLwF3vn8a/Oo0OkTgevflj6WjYzeoeaHxZp8w6+L/FZtQMSBaWxDYFoNI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726685; c=relaxed/simple;
	bh=Mf92oqIuwWyoiJCt5lF5140i3Z9UCFfKbQqNQTUEU/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qflc1tku3G9lEw9sUR4sjhdXyKvz6hbEQ0/b0cWfVVkRxIXwxWGLZqAN2bBOMebDw/yr0sfuGaEVewriGCp7v7ktk5ba0SOQkFW8YcFqFuTX8ki88RYHkDMzU06lugy58oQqkHKgeTumHkp8c8d3E1XCx4xJzdDCRmVB+TtwZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzq0ICaX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA94C4CEE3;
	Thu, 17 Jul 2025 04:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726684;
	bh=Mf92oqIuwWyoiJCt5lF5140i3Z9UCFfKbQqNQTUEU/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wzq0ICaXpCUeTbTvcQw0iw5Yz+F34ELaD3kk87F+Qn9R3cqpXN3jebQacd0+x5e0h
	 SzrNTaidhaWs+Ttoha2k1loLUOhz+xdSmFpvhyoybaLOtNpTDWugLgWD8aNaSmGQKs
	 yExgwFjt/UgbylnfkX3NX3F8dNiWUbobhyh+fAhj8uwgIwox5YipGdbyGjmp6fIb7u
	 LeUr5XtP/lMMdolSDOMCzXtcNJRsmnYrGvA4g2rHR+lfy2/n/J+/Qcx0DXiOFAiQ/9
	 mbnuloOzatSxPrdq/S/p8kgumc7JEHSU8wp91XdXthtwHf4vvSCRRMt6it98cZrGrZ
	 zBOaZl/QvUcbQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: fix OF node leak
Date: Wed, 16 Jul 2025 23:30:58 -0500
Message-ID: <175272667131.130869.7564187694499305780.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708085717.15922-1-johan@kernel.org>
References: <20250708085717.15922-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Jul 2025 10:57:17 +0200, Johan Hovold wrote:
> Make sure to drop the OF node reference taken when registering the
> auxiliary devices when the devices are later released.
> 
> 

Applied, thanks!

[1/1] soc: qcom: pmic_glink: fix OF node leak
      commit: 65702c3d293e45d3cac5e4e175296a9c90404326

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

