Return-Path: <linux-arm-msm+bounces-79046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AEC11CC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619AD567ED9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FCB341642;
	Mon, 27 Oct 2025 22:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgijlfxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E113340DBB;
	Mon, 27 Oct 2025 22:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604514; cv=none; b=p7MfUqc/ju2nL7OPK4M2EbIpMSV/4Was8BgOgl1Q0L4zruhCnV420CLmvj74VNjMFjrmNCrzVBpZsNfsz3tklneSBgCOg/QtoQ4NctlpBxgDjQmhX19thUeE0WGCwTU9LbSMUbtUUn4bVINMNLr/A8XVfdcBRr65eQUH8NzFK+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604514; c=relaxed/simple;
	bh=4CoWT48o8xcO2DKHyH0DkSPBv29+CJzADxLXTk8Zrp4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tDk0+k9y06KkDpDo20XB90r5EqZWSSzMo5MstgfSQWn4sLvl445flL8COd/Et8oTLSE6QG0xwuULuEqOlmDVUx6uw8RoV3kXUMOudtaKXNR9SUbcwEZkkSsom8kxm6cLFu4eOZvd5TrhoXaS82u6Ai977mEayPdks4cx7aOl/h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgijlfxF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA64BC4CEF1;
	Mon, 27 Oct 2025 22:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604514;
	bh=4CoWT48o8xcO2DKHyH0DkSPBv29+CJzADxLXTk8Zrp4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SgijlfxFsVpQcna8vrV45+4A6vEL/8m9PSZDoVN8yyVIIQwMViaRc7suAKg4negYW
	 5DqyTmWpuy3DcJeHMiqMtW/qXkssoKAIj4MgYRXOgvajPB0mLdyttNgA7UcAAmxtbN
	 LsL0WL2DEaVSVIrkXIWS3PIBSWpDfG18sbhJQv3TPMd4O52zGwFcHQCXLFnF5o6f1H
	 R49GMBcGavpPv7m/44cWwK28ysiN3pvjCxdI8n9r+WlxtjnCEcgHXvXor2zvBzEgo0
	 QnrL3Mz1xLojKDEdUm4L2v1M/wuvWiIwe3TvIJBy7OmY0673VaW0xK6NK08gyqvi4k
	 B5audNJ8M9LiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable two Novatek display panels for MTP8750 and Tianma
Date: Mon, 27 Oct 2025 17:37:07 -0500
Message-ID: <176160465208.73268.10501602715598939768.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009021507.175290-2-krzysztof.kozlowski@linaro.org>
References: <20251009021507.175290-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Oct 2025 11:15:08 +0900, Krzysztof Kozlowski wrote:
> Enable drivers for Novatek NT36672A panel (used on Xiaomi Pocophone F1
> Tianma, Qualcomm SDM845 SoC) and Novatek NT37801 panel (used on Qualcomm
> MTP8750 development board).
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable two Novatek display panels for MTP8750 and Tianma
      commit: 94c3d824c50ef3009c7ac62485cbcd3aac9690a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

