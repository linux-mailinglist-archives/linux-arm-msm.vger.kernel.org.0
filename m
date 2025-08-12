Return-Path: <linux-arm-msm+bounces-68842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD51B23A81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 23:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13116175813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 21:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067382D6E6E;
	Tue, 12 Aug 2025 21:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGLp/IEv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D114326C3A2;
	Tue, 12 Aug 2025 21:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033357; cv=none; b=PwxjPtNx6DfHqzW6PFH6ZWbqi++eoz4JyFbSiCvKg9yhZGbftIMvY9AFvJTGotmBOJZ/YUfjHQ561TuVa4DNpeaGRkR60ojm5LZ7Pu9VaXE3/BKIdTDIQwUhKEKisIqZpO9wSvRlvwXamu9jMMPYW4niV0eC51XiFozEP1bj+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033357; c=relaxed/simple;
	bh=AIVY8GN2ACCBEKa/Ha4Rz92hSOzQszl89xx3U4cHrlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDNbrDlCY/fEu64wqFWcUKh9WD2oEXTBslQrL/w5QIHlQhtJ/dt953HKqAdgEteDGUhQpHKE8geoRuZq+U9e3a8DIQ0dvIynT9GOu5WZFSfE4CsOasMBAJE+rXovWeG+Li1dEolBePu3B71688VTX7Ub6PnFWCdDETR02l/DYsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGLp/IEv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BA9C4CEF0;
	Tue, 12 Aug 2025 21:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033357;
	bh=AIVY8GN2ACCBEKa/Ha4Rz92hSOzQszl89xx3U4cHrlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KGLp/IEvU80wGWgPbxM6CqO0Frjig8HCS59vZHJvHwbrJz0ESSsMCkmN3c7Qe1JEp
	 CG38ofqBqqH27Ivo6gfh99i+hOEaSgJU4iClaQt/hkDF4AOjme9nBWPDqUQmCnIIYK
	 QPXEyR0pzA/XQe15DImXg8ZjNDa8CiJMfwLv3cQsqcyNHCSwZmFFDA4HbuZi47iIbW
	 JOYwyApvY26GgRzAdjn7VwRsLkJ0w39zRkvKF9pbDEMI7I/VR2OpluPN0CNQdNj5lk
	 tuL8vi5hXa/yfINYfwBQ2AfUHENYrBB8L45vJvMYh9Ws74luw3pWACZ6tKCeXn3r98
	 JGDgjF99Oul9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com,
	quic_nayiluri@quicinc.com,
	quic_ramkri@quicinc.com,
	quic_nitegupt@quicinc.com,
	Mrinmay Sarkar <quic_msarkar@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/2] Update PCIe PHY settings for QCS8300 and SA8775P
Date: Tue, 12 Aug 2025 16:13:47 -0500
Message-ID: <175503322856.231048.14752083569105388831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617-update_phy-v5-0-2df83ed6a373@quicinc.com>
References: <20250617-update_phy-v5-0-2df83ed6a373@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Jun 2025 17:08:18 +0530, Mrinmay Sarkar wrote:
> This Series is to update PCIe PHY settings as per latest
> hardware programming guide and remove max link speed dt
> property for SA8775P PCIe EP.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sa8775p: Remove max link speed property for PCIe EP
      commit: d6111177f6504b013d0424657e131ae9a36ab5e2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

