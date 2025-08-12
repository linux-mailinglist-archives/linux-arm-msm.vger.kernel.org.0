Return-Path: <linux-arm-msm+bounces-68841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6107B23A7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 23:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B6367B1467
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 21:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9F726E15D;
	Tue, 12 Aug 2025 21:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw3MqJJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E162F0698;
	Tue, 12 Aug 2025 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033351; cv=none; b=kYaMxnrdgninzxNcj0aAbCl8uvDaI5z8DpkYgTws0eLFqlszfZP7z1iYfROf9KUQkgvvvCN78hQHf9sxABWeU7n7782WZnm2UxsRDCnuwqi30bzWXxnJ2LxadJwwz+b8JcU806nHdtoFj+D+WHbdaYzI5fGgNzG0apgf2YjGRAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033351; c=relaxed/simple;
	bh=5mNbdpt5q9TT98oGMkwzue+Mu9ER5hM0os1oH28oc/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ckh7zyi5uSJ8eij+w3+6DNVrIT9FJAHD5hPET+esiF2DYwebRqzQtaiJSD1eoYoeIpV73R7FzaIsqjkKveMkEXWoyBVEuMwyWQMcPfqKfqKjHVYOXCr1jQDgCHR7gxrh7Tf9hvs6Q+M+3Sh6ttao7wKkcW+ZyjbCkttqmiQ27Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw3MqJJD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2865CC4CEF5;
	Tue, 12 Aug 2025 21:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033350;
	bh=5mNbdpt5q9TT98oGMkwzue+Mu9ER5hM0os1oH28oc/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nw3MqJJDL6QM31RSIqJfWv86MH9SR/VBi6Xssr6IRHTstRGO7E3wfnmSGAwmsFTR8
	 YILqFFKV4zWkX7Yy3eLAfoR0ZaWxmfhtp0U8D9TQQRpONglsi3jAGU5hahn+c1C8Bm
	 sk0/sKtuViuIgnwcfZhmeuw/ESQBD85i/JRL7x6/iR3M/2w4QRJsvyThkUgMT+hvgv
	 bRm+3cK17i/PU9pifdtnIzbNzaeBHwlK6qCEK/3K5NeX3PCgZ3kTBOhDg4QIokbVzh
	 Fptt3kSm2V+nr9UsLQXaGNX1MUBwE1IK1XZ8KYrJA+VdcCaa6Rda+DN8crUlshigZu
	 veaXWaWzbStoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v4 0/4] Add display support for Fairphone 3 smartphone
Date: Tue, 12 Aug 2025 16:13:46 -0500
Message-ID: <175503322851.231048.5166314447920112542.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Jun 2025 18:33:14 +0200, Luca Weiss wrote:
> Add a driver for the HX83112B-based panel, and enable it on Fairphone 3
> to enable display output, and enable GPU as well.
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable display and GPU
      commit: 4ea55ecb4990aa4142ddae5f713289f4101f046f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

