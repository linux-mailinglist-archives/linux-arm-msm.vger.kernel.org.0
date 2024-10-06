Return-Path: <linux-arm-msm+bounces-33204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9CF991BDE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 03:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5B40282CAC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 01:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9200170858;
	Sun,  6 Oct 2024 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hw9LcFcy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEF216F8F5;
	Sun,  6 Oct 2024 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728179746; cv=none; b=qDeV4fqc889OougaoxlodvgJiTjk+3HzY4wy3aacSvMPbEXyDiNR7CfqVtwMmJME3IUu7PrK5ntlzBPkAXHvPvuWDo85MGpXxWlovpcYzzEU4GPZaGqrWKxfN4IEcuy/kN4m5ojVs+cXA/hXMJ54ilY1z+6vfIC30huhbcgK+cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728179746; c=relaxed/simple;
	bh=zw+lYmIsUUtG6llFvvFh8py/ONLluzPaFpK3KvDFun4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EnFUxx5rzceiCeZ0bJJi6DREoBzvtKtxTIU/oXRPWBN/HQx1reY82FW6UorcJnnzaYic08iWms/RrFWiNzL62qlaWRTznm8kyI/TxlqYvBZeE36AshnJwSDHJiLvTtMtoiPG3mrxjzVpJbaJ2Y9J4vHLZ4PalU6ZAbWgVhfdRH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hw9LcFcy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C343C4CED0;
	Sun,  6 Oct 2024 01:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728179746;
	bh=zw+lYmIsUUtG6llFvvFh8py/ONLluzPaFpK3KvDFun4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hw9LcFcybMm292buA4T44wu+f7hEkexz7WQPB/Z09LbIi6f3627c0roxRtPg18NFf
	 ZhOjhHzU1ciCYg53BETGGVAaBseQy6H+21SiPOTTMdpkgVTvmLWYITfCenSj2tiUdm
	 rfmN+bSCjd5iq1zP2rwy85WU2BO7S4YRDllvvcA69/ak56iq26zK+m6a0/4ohy1m4I
	 9a0DSeizNNRRHCZNYSpv5qSb0u5NmdVtUbOs33q+fJOK5PBH2WmjWkpQD33nXYfege
	 ZaSeCbkv+jpiTFBPuaGArlo0N9hXRjoCoNmrsW4sNVPSKy3Amcwzhw2o/fEfc6DCMi
	 aswT94mE23PIg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH RFC v2] soc: qcom: llcc: Use designated initializers for LLC settings
Date: Sat,  5 Oct 2024 20:55:36 -0500
Message-ID: <172817973310.398361.2166607250234825054.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910-topic-llcc_unwrap-v2-1-f0487c983373@quicinc.com>
References: <20240910-topic-llcc_unwrap-v2-1-f0487c983373@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Sep 2024 17:01:39 +0200, Konrad Dybcio wrote:
> The current way of storing the configuration is very much
> unmaintainable. Convert the data to use designated initializers to make
> it easier both to understand and add/update the slice configuration
> data.
> 
> 

Applied, thanks!

[1/1] soc: qcom: llcc: Use designated initializers for LLC settings
      commit: 20a0a05f40faf82f64f1c2ad3e9f5006b80ca0cb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

