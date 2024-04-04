Return-Path: <linux-arm-msm+bounces-16422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43218899015
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 23:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73A881C20F65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 21:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7DB13C67D;
	Thu,  4 Apr 2024 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6mZ+SZS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2656713C678;
	Thu,  4 Apr 2024 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712265802; cv=none; b=QE1tbpW4N9/co7iWN3JIgZ5O9yEyPUEL2BCyhe94Ru96fODmNRo6P/wXgWmYT/mG57r5UqCWqCi+wExvERppc/oYvDLDXl/ZMu5K3KzTd1ZGjHVcIyys7gmcIJjAZ8coxjOoIyjgw2hdbA/H0ctPmo5h+G1VfpgCDmJLGhMejKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712265802; c=relaxed/simple;
	bh=0fFKa/EeutqrSgQbuT8Xm2t9GxKRLht1LIjDhCQyP5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hRGBzHA4gcfyhkS5GPjqNnU+o9pEemfu+QH6ClyEUVtOKGDYo6ymNkcrqDzD2YFlUfwWnljfOgJYMxzkz7Uza65BwVOpxakUvZEMVkRP9ZQWnCy/dGVSUHzlToQYNseI2BQkvBvuvTjQeMOCO2nuVdM9lTT57C8Ue4eSPCyM2GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6mZ+SZS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE90AC433C7;
	Thu,  4 Apr 2024 21:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265801;
	bh=0fFKa/EeutqrSgQbuT8Xm2t9GxKRLht1LIjDhCQyP5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L6mZ+SZSP+Ur9bWC4isDcgoy4LVeJ1nQjR+ztH1bVhZWY4Kt9TdtDCsGh2LCxPoLY
	 AyZnwoHKgZhzHCQpznALhsQnH9E7ERbEKCunZ2fbfP5a0NrPRmnREDT2YV7tmX+4oI
	 0NXe8ZCPP/xKILJCSyBJXN7zOiCWfFlsHC0ky3VLu3ybnHtQjdH4pY4iaBM6oNAtek
	 0DAm+PLJRLIag2lFxR2ZsP0AAAnMjA3vxgDYtRJ2hnBDHTTEg6k4X8qPBzNcAGUlzI
	 Gjx+B8+Tyu2SIJKOxyAYVMWW5hrFB8p4kE9N2qCMRy881v773/LtyJE8nDKXy4NV/x
	 0xaZxx0N2C+Pw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: Add interconnects to UFS
Date: Thu,  4 Apr 2024 16:22:50 -0500
Message-ID: <171226578675.615813.59005528612625407.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313-sm8350-ufs-icc-v1-1-73fa2da99779@linaro.org>
References: <20240313-sm8350-ufs-icc-v1-1-73fa2da99779@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 13 Mar 2024 03:32:09 +0200, Dmitry Baryshkov wrote:
> To ensure that UFS doesn't get disconnected from NoC, add interconnect properties
> to the UFS controller.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8350: Add interconnects to UFS
      commit: cb06e2b406279f65890233af103c638d3752d328

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

