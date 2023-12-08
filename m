Return-Path: <linux-arm-msm+bounces-3965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119C80A5ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D654281CB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58AA200D2;
	Fri,  8 Dec 2023 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pp/Xskpp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C375C200C4;
	Fri,  8 Dec 2023 14:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C11C4339A;
	Fri,  8 Dec 2023 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047068;
	bh=G1lWFIjvvTNVG5ctSS0/Zso7kE6RrimNplmGMqRD9yg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pp/Xskpply7Cl19j2tEv9Ed/qZ/uHCCHxo1Pio1bx9KrSQTJuh/iyteDErP3YjTSs
	 rtfDHj+GeckYHIy4qwOxLnBezecY2oFcZye2qvRtsSDWvlQEa7EWE6cSMjAwboIb9J
	 KJv/v6qlky+Vb0N7bRcVHBHCf9tZI0xSYMEI0iVzR9oT7ZwySP476MrtSD5QrnENQ+
	 aG59+77sXztFmUjYUS0yFsGuhJDjUZmQCVGGYLq4F/xGHToFeBOXtjGO8CVHb5twGk
	 JUinO49oQTuixF2EQ0tn8HXYX1PE35qTRH95n0vTkVh7+tljxPiymBzJLZInCC7g7p
	 iYs9fR9jvgxIA==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix port sanity check
Date: Fri,  8 Dec 2023 06:55:18 -0800
Message-ID: <170204733617.342318.9486757967416986550.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109093100.19971-1-johan+linaro@kernel.org>
References: <20231109093100.19971-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Nov 2023 10:31:00 +0100, Johan Hovold wrote:
> The PMIC GLINK altmode driver currently supports at most two ports.
> 
> Fix the incomplete port sanity check on notifications to avoid
> accessing and corrupting memory beyond the port array if we ever get a
> notification for an unsupported port.
> 
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pmic_glink_altmode: fix port sanity check
      commit: c4fb7d2eac9ff9bfc35a2e4d40c7169a332416e0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

