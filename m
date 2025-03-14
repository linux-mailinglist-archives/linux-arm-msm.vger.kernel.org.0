Return-Path: <linux-arm-msm+bounces-51491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774CA61BAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D46F19C17EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2661213E79;
	Fri, 14 Mar 2025 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="skk8LO4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B5620551F;
	Fri, 14 Mar 2025 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982512; cv=none; b=dz70NsHWisZOTfnGlRiip/n514NUU68qp9xF2UN+DY+Cei+pB6Tg0rrnlmGT1GovXoQpDiks/BQH1xCVHN/VA3cquIHb15wyfED2N9EylJ57YXUhkuoWt0wT9D+UwdI926hjA1XUsSWlV32l8y35ip0l006WetJL1MX8TdkXbE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982512; c=relaxed/simple;
	bh=tYfeu6BaBWVy6Bh9An7QNHVVS7yRIk/JJ6FfpR7eWJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DRrwtDXLQsO9++YZ0SDSRdxcndbnV/yh551nqASmgzxoPRPnHXH78cIL8Edspg+bq+N6uhxcJKIBRzij91dVvy3gUN6BrIjVHDMpukt+SRvt+WepTXgJmr43tje93ro4NuC9lLlgEYa9GJMNh4q9TbK8HYBez7FcRX80TKTv8K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=skk8LO4q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5F1C4CEF0;
	Fri, 14 Mar 2025 20:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982512;
	bh=tYfeu6BaBWVy6Bh9An7QNHVVS7yRIk/JJ6FfpR7eWJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=skk8LO4qfjpsNbXwyzSC0J3xhKm/LepZux6CkR4oINumzQ6tP3ZDjUoWctXZMBc90
	 WllXxXGb1wAkkL93XpmZ57B4Nw76iqoOKKOye2EIMkTHmdEujnC/VZD6DrYMy1gOkY
	 sWbFfYAQyRoqu9pMqQZ9Qni/rxUwVnDq3E9wX2xgW6+Gwvn4a3vHn7OPmtaiycijgG
	 cEEOH65AMpMhQCxP/2UYAZa2UBtotlDSuEIWVXgJgcLZo5hRT9+eKbDFOuOE+o1Gur
	 IQi78G+c0dPiANj2/yN3TdSv0OX77PIv2KR7WELi6Z0eShVPsZPP+GACB1UTaQ6R4V
	 RWd8s1awP5Swg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8750: Correct clocks property for uart14 node
Date: Fri, 14 Mar 2025 15:01:05 -0500
Message-ID: <174198247900.1604753.100078703878844249.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312104358.2558-1-quic_jseerapu@quicinc.com>
References: <20250312104358.2558-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Mar 2025 16:13:58 +0530, Jyothi Kumar Seerapu wrote:
> Correct the clocks property for the uart14 node to fix UART functionality
> on QUP2_SE6. The current failure is due to an incorrect clocks assignment.
> 
> Change the clocks property to GCC_QUPV3_WRAP2_S6_CLK to resolve the issue.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Correct clocks property for uart14 node
      commit: 515551e65635b988f2afa9e8683a6b57d6cfba36

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

