Return-Path: <linux-arm-msm+bounces-73824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED9B7DC87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3DE31895EE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 00:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E690A21C9E1;
	Wed, 17 Sep 2025 00:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G56kCRYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB0213C8EA;
	Wed, 17 Sep 2025 00:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758069909; cv=none; b=PuHknSFOfYx38bDpUEKTmHYGT2bVJLFCFDYHzXJ+YopoOODP2mNFPUOdkdgf5TuuJR4kQcEOYoM15EuIhNPWBO7R1R6hSwY8WVxEJdVN0AOuKocD+IKkHBGKFc4NW5QKBqm8wM9tEHt19SwaTdDYIh8CzAFC87sLzO+Su0zkFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758069909; c=relaxed/simple;
	bh=12k2PLfNpOt2AK+uF8kERsEoG/vCMEaA8eMgjIcwHBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U5xQ8aaEoUcuRUMaZXqnUkSjxmgOHf8wTtxVbntJIih3nGf5Ic5fUrN+ky3zoyvWtnN55v0SxsFKEw6Zdx8H4Z8P8jqEfb8yU41m6ZFjVSse6qe0t5GGV0coxwpEeq8BBdJX8UYOpjVjrALXuXcBqF9SsAwxyqN/X2TQHi5v4Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G56kCRYu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F43C4CEFB;
	Wed, 17 Sep 2025 00:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758069909;
	bh=12k2PLfNpOt2AK+uF8kERsEoG/vCMEaA8eMgjIcwHBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G56kCRYuRklEg8M98/BmDnJFirQeJ58LgkpeiawstBvJ1LU0rrv9QbLN69HbUB3k1
	 anmUkCcoTNnmXrsdL+Mvc5lAbaiG8wDLRmzOzyXoopDEWtcdS3tp+Xj21WOXmrFGwN
	 3VcCuhdQPcziIWkUpN+88Tax0THyDPFGli+jeyrV+A8ir98YBR3tTw2riohA2N3WQS
	 14W/pra0LTTb9dx7jdJh4l/4chyuoh96UVEj6lfWXOo6T0A6E2Y5OSBCI65VmxIqiQ
	 QhR1tJMfXy95bZhQMrpdUndi3TDzYvAf1V++GfJ21raWKG26CVXAAKAOkiJ3pyo8oz
	 soblRXJzTT2Og==
From: Bjorn Andersson <andersson@kernel.org>
To: amitk@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	konradybcio@kernel.org,
	Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	quic_manafm@quicinc.com
Subject: Re: (subset) [PATCH v6 0/2] Enable TSENS and thermal zone for QCS615 SoC
Date: Tue, 16 Sep 2025 19:45:04 -0500
Message-ID: <175806990245.4070293.12179949818947068286.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
References: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Jul 2025 13:53:09 +0530, Gaurav Kohli wrote:
> Adding compatible string in TSENS dt-bindings, device node
> for TSENS controller and Thermal zone support.
> 

Applied, thanks!

[2/2] arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC
      commit: 4e26b0f4f1a965e366795c100bd7a8ee1635ed14

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

