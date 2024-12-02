Return-Path: <linux-arm-msm+bounces-39917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EDA9E0858
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 17:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C053B16EC72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2762E13A265;
	Mon,  2 Dec 2024 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGDVJ2sp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05EA133987;
	Mon,  2 Dec 2024 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154674; cv=none; b=WWb8HyrF/Humyz6o2TYj+UaeH/UdY5wkuZxxxEaFYCsKDgm7t1aMVRAxTZSgAoUB7Ka6WZiDx8NzLEDATDdieoAfW4DAtqppOymzw/CIWQYWpgGi64p2//1FJYLVBWxKWyxEFNBRdyPxIy/OkWDzzkpooUmDMW//ZPKBTw4087E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154674; c=relaxed/simple;
	bh=gbHV1EoEzQJJvxuJn73SsUNo9/m3Oy47dqOO9nLPSwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tkJX1K0bXbHY7RkCfTzewKy5i8m2cklxt87yQEyPnB3Wl4oI4C7JuyDtcmMH8TjwhlzCZIdZWLfla+/hnXVOtfgta25FTRjvb4i39GGEotZKdwRTRySbhhqdzvFTc48IFyFBOreOnTeQFeNDpOsFIInP15lTHOEPnsj7ro4+fTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGDVJ2sp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8584EC4CEDD;
	Mon,  2 Dec 2024 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154673;
	bh=gbHV1EoEzQJJvxuJn73SsUNo9/m3Oy47dqOO9nLPSwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iGDVJ2spEKU4wxtLTNH2qF/RBG49INUAljtd7/xGFefUVYTjq58yQUuiCr2Qq7yTt
	 NpIS1GMzDxVlWhib6D4W7JoPkblNqhaRPHtW77EFupVIsqmA7VeR0WxTzwZQ87sXV1
	 Df8Ezzf/Gh2W/qpQ8o5kTo6kQiINIL1dbNitynuHtij8CaWkXQUucSNWmnYOn4Qm0M
	 9uM0tR8cL9O6nuBDr4I9YiRXRZU7mUED2hJWZeHFDwVkmYA7oeNOq8nDZMk8qUGth0
	 J36gRGow4N8Jjp2X2Q692o1dHCVX1x52+wINx0SEPLUMiDL2zHAU8AkdqG3VPc8qgc
	 75Vh9fAT5Z4RA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Kyle Deng <quic_chunkaid@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com,
	quic_sudeepgo@quicinc.com,
	quic_taozhan@quicinc.com
Subject: Re: (subset) [PATCH v2 0/3] Add aoss_qmp nodes for qcs615
Date: Mon,  2 Dec 2024 09:51:00 -0600
Message-ID: <173315466528.263019.18336873215209666544.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
References: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 18 Oct 2024 15:34:14 +0800, Kyle Deng wrote:
> Add dts nodes and to enable AOSS_QMP on QCS615. These nodes provide basic
> AOSS side-channel message RAM information and mailbox capacity.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: qcs615: add AOSS_QMP node
      commit: 0775021783b5536e390d1602d054542a29875593

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

