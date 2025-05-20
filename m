Return-Path: <linux-arm-msm+bounces-58570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BBDABCCFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4DEC8A2D14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F18025A2CD;
	Tue, 20 May 2025 02:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyIRN/qM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0931C5D59;
	Tue, 20 May 2025 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707313; cv=none; b=FqujXJ1JZ1dgkD3rJSdWFuBf/+1/AdzX4LY4zqkcSTzEU++o1WrWP2vt4D5IddNiXRPOLvY0t9k+zEwQWKsfrSP8a2v30wm89QR5UjkIy3fDNPCqyNvYPIKemNYAgCDg4iUK9MRi5SKVENxGHeLdcamlqSCtoeJIDhbL+P0NagE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707313; c=relaxed/simple;
	bh=67kUEnw0vBoU36XgzMu+NnDSI0cxP441EmlFvSQutt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cH0RYb0oqUan3vW9ABZcT3xc18jAobQ0+VJf6pQUQ1ysbWX88tBmnaXyv69/WrYPRna5AK3yVguO/EvX/JMXpX6CNh2cOzOyN1N0/IMwb1HpP5U5wBMELE3AGEXH106D/GNLcTglg/jNQNQbc0lg8Ei2BZvJUqEgUNfrDB5iEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyIRN/qM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A353BC4CEEF;
	Tue, 20 May 2025 02:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707312;
	bh=67kUEnw0vBoU36XgzMu+NnDSI0cxP441EmlFvSQutt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GyIRN/qM8CaFz64SaMx90qHcwbcoslFB9VeBEJwvySx4hhcPIEoozOB2iXGQFzavK
	 maL/vGolgZp2SNO4zM+Ah+fLXre1XiqLG7FUSZ8wD/K2P76YDlXAdgh531jZxnjvxq
	 YwcGdco+9VYdbH8HRa1cAug+TAe7lFz/U+4vbySAbeSeiIcMypEatkZzsp63F5Xpfd
	 CAmP58qIp0pMmyxiJMTH5lHrIwmyeeHjzmw0Z67jvQfzwwrIHt0csQDAprKqJNR4Dc
	 Yzo0Won4WC9YbshSYPforqarcX5/KmyX5JqSpunMQhff6xfymt7GYvAnTSM+vgRCDc
	 X9czeyCx5Ozuw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] SC8280XP SLPI
Date: Mon, 19 May 2025 21:14:42 -0500
Message-ID: <174770727697.36693.11204574710877306623.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 17 May 2025 19:27:49 +0200, Konrad Dybcio wrote:
> SC8280XP features a SLPI, much like its distant relative, SM8350.
> 
> This series adds the bindings and dt node for it (also cleaning up the
> DTSI in meantime)
> 
> 

Applied, thanks!

[2/5] arm64: dts: qcom: sc8280xp: Fix node order
      commit: 9522803addbee74269245259fecbb33d01a4a796
[3/5] arm64: dts: qcom: sc8280xp: Add SLPI
      commit: d6470588beafdfebd84c857b78473db6388832a1
[4/5] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: enable sensors DSP
      commit: f5421c52983865c32eef72c4585234d043dd980c
[5/5] arm64: dts: qcom: sc8280xp-crd: Enable SLPI
      commit: f285543c5a00b4329a321edfd674010c874e3862

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

