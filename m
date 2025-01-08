Return-Path: <linux-arm-msm+bounces-44287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C417A05135
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CA2016199A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCFD1A01C6;
	Wed,  8 Jan 2025 02:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hd99sZqU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E119FA8D;
	Wed,  8 Jan 2025 02:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736304780; cv=none; b=rwtGlxLrYDT8E4qE3QERnyy2n2dyLt7WLVLGZDWe1HTaqLiQB0MVfdKyYg3PfCbGLDStMDgHx/6N4UNcDpV0+VgK2LpCmRA8m5hgObyRp7cDuZyEFKlfEmmk7FXzgATQ+2azCIFPpoHDzwAPMd4aNCmq5ghEmm5MgUL5R/3qORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736304780; c=relaxed/simple;
	bh=SekKLlFkqC0rHmB1SIKl2TMbgiPzX0RkABowbn64Ikk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LHqxjRy6Qjk6FyDhl7BpY7J/mgVGl+Vf18aWL6AIzkVlcDFqdkPMoHVqwObGIW8rVMVL6OgiB3pvCzK4CAu18JA3lZH38CzPRHz/BVMg95kxGyuetZ0oD78LURW83YkvbIW0eodVOEe5QQvnrfDZatSIRo8YVIpDM4cyxSrCnOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hd99sZqU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466FBC4CEDF;
	Wed,  8 Jan 2025 02:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736304780;
	bh=SekKLlFkqC0rHmB1SIKl2TMbgiPzX0RkABowbn64Ikk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Hd99sZqU+MTdQJGhwjnlrOdbXX7+tCy4lY3f/lJ7GozaTKkIAvWT0QbwoNN8aQVMX
	 N7TV7C+1RdzGJxA4n9iHU8AVEdROj2VBzOy0P0VBPg7H10TG6eOl3SzDlM/Fkcj5rB
	 rXb65Cg8S+LubtE1NX7eGxoZaJM9nh9EyiJ1do/uB0myNPBH2OsyCqjZY4/l+8GR4w
	 DofTmVXAoWPWWrm3BOSaZBZG10zK9RuckyiKY/Wps/Kf+k9lj0mxn+zqGvH8bw7Rse
	 uhOGDjFuO25yBNoPIj1Ax6AdU3jwUxI1DpHdyZK38Q7qbtwc1rO/uPJtx4ubBvQezz
	 1qhI/FCTo/zIA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: Re: (subset) [PATCH v4 0/3] qcom: ipq5424: Add LLCC/system-cache-controller
Date: Tue,  7 Jan 2025 20:52:49 -0600
Message-ID: <173630476476.101108.1618567388433556443.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241121051935.1055222-1-quic_varada@quicinc.com>
References: <20241121051935.1055222-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 Nov 2024 10:49:32 +0530, Varadarajan Narayanan wrote:
> Unlike other Qcom SoCs, IPQ5424 doesn't have multiple instances
> of LLCC IP and hence doesn't have a LLCC_BROADCAST register
> space, and the LLCC & LLCC_BROADCAST point to the same register
> space.
> 
> Alter the driver accordingly and add the relevant entries for
> enabling LLCC/system-cache-controller on the Qcom IPQ5424 SoC.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
      commit: f35a4397bec51509aa08c109041428958621d5f5
[2/3] soc: qcom: llcc: Update configuration data for IPQ5424
      commit: c88c323b610a6048b87c5d9fff69659678f69924

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

