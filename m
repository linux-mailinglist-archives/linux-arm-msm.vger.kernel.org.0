Return-Path: <linux-arm-msm+bounces-57561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E5DAB2C2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D9853BAC4F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFD02676D5;
	Sun, 11 May 2025 23:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0rqyHio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB48264FA7;
	Sun, 11 May 2025 23:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004532; cv=none; b=cRRcdR+p5yLYl3e50yadQJ3y8r27G2YwL54iHvsrNplbhBk+/w+I90ORKc8GV8W7V4DtMjvRO26B24bee+IOMkOzpbMNVWX5O1liRjdhVRFC16aQlYOIB+ba+jQU0WKOusL8E8MsxRYPfGzNJScR6nLfH9FOvAxYUwEOj2cGejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004532; c=relaxed/simple;
	bh=UFuA45FsGmyDjU8NXAk4BHb7Iv4WUY9E2LHvtTm8Rco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RZgVnjHmgrVqXEKulenHYhWctuI1aSSoCcn558+AKzEOiNkTx5X2ccKtE143UGu9UiKhyE5/8l2p8boNTcP+X4oRDCX5wOlaeVhKwz4XhroM3IpR6d1Ij9YaadHzVUbGaw2V9uVJdupkr/ucBJX4QQavK+u7lSftVO62VVoZFpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0rqyHio; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6097AC4CEF2;
	Sun, 11 May 2025 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747004532;
	bh=UFuA45FsGmyDjU8NXAk4BHb7Iv4WUY9E2LHvtTm8Rco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u0rqyHiov554yDFP4rMI9iGgksMQTYkeobC4fPGv2Ce+KvcYjJurI7LwVsvsfv0TZ
	 tVSVz0Dh+5RB2sg84wuNe51zjOnPDed5s+D5N57RYCrqgfOwGPfVr6sRNUm01oRN2a
	 nT7A2QdwgSrHFTtF/I/GNmVPPiHxgWHPjQ/zCGt24D2pzueUk9axTJE3oW6AaL8Imi
	 HcBogZo1wBZpTlwMkOvVuE+5aKmQGVbFgY6ZVIATQJXxAYCabLcCxaqqo98eyqW3Gu
	 0nsN0eKXrhkQCDzCudxeGHyBBSEdV7Eep7cCG3tXknhjEnKA1d3qiGGzxBCC+LoU9W
	 3VxYuF0nqcJ0A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] Fairphone 5 DisplayPort over USB-C support
Date: Sun, 11 May 2025 18:01:42 -0500
Message-ID: <174700447981.10930.18335388703422311749.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Apr 2025 09:08:11 +0200, Luca Weiss wrote:
> This series adds all the necessary bits to enable DisplayPort-out over
> USB-C on Fairphone 5.
> 
> Devicetree (patch 2-4) patches go via qcom tree
> 
> 

Applied, thanks!

[2/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
      commit: 90485e48b8889deec74cf2ce07df174da84b1ac1
[3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
      commit: 1efa79c7536896b6fcd71760c3d4f0a0d40a9e1c
[4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C
      commit: 6b51f5e1811398dce5c1d67b746dde74c75f6ce7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

