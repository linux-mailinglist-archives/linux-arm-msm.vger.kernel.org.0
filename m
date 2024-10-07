Return-Path: <linux-arm-msm+bounces-33400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 522ED992F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17444283B61
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F7A1DBB2F;
	Mon,  7 Oct 2024 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUU0OpdZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73251DBB23;
	Mon,  7 Oct 2024 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311191; cv=none; b=mjgztbEDEHDua7lCBsIla/NNOpKddDQb+ABzBNaD6txAf8RQBOqcVAxNA0SJA3nHV/kocAndgEbA0HlGmR72nlOYARAtpbbpbcpJT+kebUch1tVcTsKdqQpc7fudF95mC7yA0pWsuAAoOGI0lQOr/LzY/lQ0LGbhZBe8XWh2bLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311191; c=relaxed/simple;
	bh=JiyJNJ6z6VV1zDgaDb7xw9UjcuLirOtPlIUa8P4j1r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nyiq46ryvGuxsF/1LYyG1Dgzk+ZnyAxEhvLzVh4YfsRajrMnXhj7xjwk/ssKIphuEtSRsV3u/8vGaeCUM7iqhnqVxydZawcTywFBE6zEwfc5pRJqiROASmxDXjEGjrx0s87xsBemYzUlnbBbdTxyxiFHZeHAmVsH1w7Q4xoeiPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUU0OpdZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E798BC4CECC;
	Mon,  7 Oct 2024 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311190;
	bh=JiyJNJ6z6VV1zDgaDb7xw9UjcuLirOtPlIUa8P4j1r8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUU0OpdZNXhaJUOXW7vnMfL7B2SvqKIGjvKIVK9pukj1X82PJTKoCX7FddTHXRIOQ
	 YuUk2O2BZ7bMJivhzHdTqi3lPVC3Mj0RiZlKXUjhmTfQFcH1RUq9+wAFYJ+cHFHjNG
	 N/JGbh0yDemsnaTdV1wRKxol/RTgY4nM+U5GMWMY0sKc48oHYrw+ljbf+iSUPFYWb9
	 AU6luHqfMkvoqAKRaqoqk19m+CZ7cAjDAXCTnNKciusUQ1w5YXJbdXyiDjkN+4OSzF
	 0t6C94He/ERXcscHjmdeWv4jTOmPXQ1DmuTyjff+/t8nGKoeA+39U3L0Xi0jNlOQvG
	 AHHiu7dGlrhUw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add debug uart to Lenovo Yoga Slim 7x
Date: Mon,  7 Oct 2024 09:26:03 -0500
Message-ID: <172831116168.468342.6154439833410297797.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004192436.16195-2-maccraft123mc@gmail.com>
References: <20241004192436.16195-2-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 04 Oct 2024 21:24:36 +0200, Maya Matuszczyk wrote:
> This commit enables the debug UART found on the motherboard under the SSD
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Add debug uart to Lenovo Yoga Slim 7x
      commit: 4c3d9c134892c4158867075c840b81a5ed28af1f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

