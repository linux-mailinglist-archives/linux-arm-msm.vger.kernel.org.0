Return-Path: <linux-arm-msm+bounces-51496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E1A61BC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC563460117
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDE2214A8F;
	Fri, 14 Mar 2025 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4I5x32D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53442205AB7;
	Fri, 14 Mar 2025 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982517; cv=none; b=n7xQD18GMXNbjcA4swEr9NxaStq2s08ajpIJBketpUgGMJwG/TT8SlAHoPwJJiEzPbHsB/Hb2NuFM63BIXROOvXgqtiaAdv8vzFqhgBe04N4AXgFEVZmd0r2vgWEz5oxqL8Q9JrpjCjkQsRY3h9csDhItDlnPj9lgRXLK7jwJVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982517; c=relaxed/simple;
	bh=NLw3Zn0lcvoa9dN3+/Tshr6K0OnuCUML/T3BRrtCbxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQnAfHDaUlG+zAJ3/TyjmFnXhTIkQGnigwxTA7pWYXlnXrAiUHG1JeTssjY7Umzm153KAcZHZx7AMSr5D/Mtp6v7QaBbJ4MOflMX1O9yHQf3IiFlxJnhMTkfPQnL2XwGDjtrZEmRW6k1sMlv82QfONB/rIiG12voTcjTBklmiz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4I5x32D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76238C4CEE9;
	Fri, 14 Mar 2025 20:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982517;
	bh=NLw3Zn0lcvoa9dN3+/Tshr6K0OnuCUML/T3BRrtCbxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H4I5x32DkYfXUoCqlJgVElsbexW8up2dtNe73o6vnLCD8ey0XJibrLcpZq9xd9d+8
	 oCrgSryxBD5Nkxtfcuidwheuz4GcDzvX8xyB8tvh7fMahnRsgFOcbUUHImYCIrM6U4
	 X0QVPDsme5J72/m7R0ZmRNW6lNc7KJMFr2sGiI7yMMP22zJqHLndrUQT/xhdfP4ZHm
	 LLSvO/9Ke/qdqLxUmsuyS0XgzIhu4wPlk/tfwEe+nIA5whilfiWm8FnXGrDHs82/mD
	 zZ5LgIzJ8kX0Nly3/CBEQt5LJDb6jpP4Dk94eflqCbdKOWNxOQIiKy8B2xXLnoNO6+
	 xDof17v19CBYA==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manish Nagar <quic_mnagar@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300-ride: Enable second USB controller on QCS8300 Ride
Date: Fri, 14 Mar 2025 15:01:10 -0500
Message-ID: <174198247897.1604753.4791864107731175321.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310104743.976265-1-quic_mnagar@quicinc.com>
References: <20250310104743.976265-1-quic_mnagar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Mar 2025 16:17:43 +0530, Manish Nagar wrote:
> Enable secondary USB controller on QCS8300 Ride platform. Since it is a
> Type-A port, the dr_mode has been set to "host". The VBUS to connected
> peripherals is provided by TPS2559QWDRCTQ1 regulator connected to the
> port. The regulator has an enable pin controlled by PMM8650. Model it as
> fixed regulator and keep it Always-On at boot, since the regulator is
> GPIO controlled regulator.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300-ride: Enable second USB controller on QCS8300 Ride
      commit: 64f8541e7a2c5e91498f297bce89a88ab9a34fd3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

