Return-Path: <linux-arm-msm+bounces-48077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C27CDA36867
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4490E7A351D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27231FF1CF;
	Fri, 14 Feb 2025 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDspzlDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFCE1FF1B3;
	Fri, 14 Feb 2025 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572715; cv=none; b=S/bj/CbM3B4flRNQ9FbXRHtLFe1iCqh5vuZBLXjafhvqDUaoP77XYS+WtMxU3g9UJtLkpjmEkpNtNMiEK+4s1kTvYGBBJ5fAXbnfSOaQzwnTh7OTvB8l6zpfgohkN5ZePftCtVRPJ9P+c5adntnrqAtLPgwQesl5PbqySZdQisI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572715; c=relaxed/simple;
	bh=DMvWbkbRX2KAytqJcZXY0Mv6zTSd1obNyM6OkGWLHEQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ViykM/2e+MwhUTpaOBYhG+3kEOYKv2fM8M7VHiB+KvtUuGNgdfSpbalp46LBZDMz1LDD99x9o6VHfX/PD2qFadrYkqBbV7myZPkYttkvnwvr/vg7noTnvsKDYqhb8vGTfiT1Nxo9/MGkk60o9Y9HPPCoL//gXl4wMV+SNRdrOhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDspzlDv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457C3C4CEE6;
	Fri, 14 Feb 2025 22:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572715;
	bh=DMvWbkbRX2KAytqJcZXY0Mv6zTSd1obNyM6OkGWLHEQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sDspzlDvEhtV/GMQFbOITQGo8YyWCX8EtJklmI0ekxTgYja/+pcsnqGx4pul0J1+a
	 fqX3ELFsQea2U/DCN0T5GXIDTK11ZIqUgwLhBdwtHDvFE1ZVasFVypD6e0Lb+/hvaH
	 i5DEhLGhXH64uqQ3cLOrE2+468950fcy0p0NvQ4z6BpDuF/BxEvqRMyPa8bsHRvWLx
	 8uT0NMaevTel6BeBUVHE/ALBID4009ebGWHaM9FXeGF+7iouYBsHvB2mrmbDSV3kB0
	 2iZUAnYLx87xWvguMhrv9hOR7uZUoi8/X32bNIrXYgDqPLI5n/6Uamn3MYuISBW7Gm
	 zN0kpmVEZ29aQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soc: qcom: Do not expose internal servreg_location_entry_ei array
Date: Fri, 14 Feb 2025 16:38:18 -0600
Message-ID: <173957268933.110887.1406745109313463970.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121102817.68577-1-krzysztof.kozlowski@linaro.org>
References: <20250121102817.68577-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jan 2025 11:28:17 +0100, Krzysztof Kozlowski wrote:
> 'struct qmi_elem_info servreg_location_entry_ei' is used only internally
> in qcom_pdr_msg.c, so drop the extern declaration to make headers
> smaller and code more obvious about intention.
> 
> 

Applied, thanks!

[1/1] soc: qcom: Do not expose internal servreg_location_entry_ei array
      commit: 2e14c17a2e3d697bef6b5bf49b253d6e52f3d186

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

