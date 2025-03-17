Return-Path: <linux-arm-msm+bounces-51561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7101AA63C49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76E473ADC44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA9F1A23B5;
	Mon, 17 Mar 2025 02:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STI2wn4f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1788156C63;
	Mon, 17 Mar 2025 02:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180175; cv=none; b=szlFGUgah4f+yejdtrJPp5OkHzvBk1fmDl/MqWWVb5H+BHQDmssKdqRJHyenbPxHkKfSf8qIRdpVwZ8jFZoLVEfJPN2qZZenjBeEfTqmxW2t1VMh2uL7ZAJIZ1aoAJvFVuxFxlZyrqAVAHrGE5229mlocphxIkWfFPuLotxIeLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180175; c=relaxed/simple;
	bh=4Z53PZv7xPIkiPKz3mgCfMKDJhplTGvUWtVQXFxNj64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/UFayYRoe8+M1p3zb1IrMdbh40HE4gLtwq0fA09KwBgyIUZy1esm5N8hAlYBmhzKseln+aKz1PQXaJBCiUX+MpL2mM/uBzBWxAwiwodMsK+6GdfXeegJiWUALw2CEnfQawv/nAOyTom5pSf1zmN7bttFx+g/OzH08fibSqle2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=STI2wn4f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98943C4CEEE;
	Mon, 17 Mar 2025 02:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180175;
	bh=4Z53PZv7xPIkiPKz3mgCfMKDJhplTGvUWtVQXFxNj64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=STI2wn4fsWKZxr6dRIDSCz0SLNz1naxOJ6FVJw3Mm43L6NziNrEdCGuC7j6UPXyhP
	 O5puv84L1i32Y3997MT90NR5gAkFMQ8tOhTuh1lNuA5MPR9IE4RKRfpNeC9exsLGwi
	 IPVuHqVuQUwVlMH0hp9Z0YxtS8HKt8yk1uPY91v2LuBiaOEZd2U4HbBWXsWg98wKnL
	 jj1ksSH3cMJMb85bMvNZbySoVHE4VFkmpu11QDB4BymA98f6JqqZEBntJRbXfopjvN
	 9axyiYu63EriDaWJ+ySgGe9QSgOtLvZBN4P+INdu9s2+AzpWOFzYX+OfJxg1heEWXE
	 k4G1Cle7ZXcrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH v2 0/2] Add support to scale DDR and L3 on SA8775P
Date: Sun, 16 Mar 2025 21:55:55 -0500
Message-ID: <174218015887.1913428.16257360641397675945.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
References: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Nov 2024 18:14:10 +0530, Jagadeesh Kona wrote:
> Add support to scale DDR and L3 frequencies
> based on CPU frequencies on Qualcomm SA8775P
> platform. Also add LMH interrupts in cpufreq_hw
> node to indicate if there is any thermal throttle.
> 
> The changes in this series are dependent on below series changes:
> https://lore.kernel.org/all/20241112075826.28296-1-quic_rlaggysh@quicinc.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sa8775p: Add CPU OPP tables to scale DDR/L3
      (no commit info)
[2/2] arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node
      commit: cc13a858a79d8c5798a99e8cde677ea36272a5a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

