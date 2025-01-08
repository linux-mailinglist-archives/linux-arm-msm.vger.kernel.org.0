Return-Path: <linux-arm-msm+bounces-44305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C5A05266
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18A077A297B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D2C19CC28;
	Wed,  8 Jan 2025 04:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9vlJnGY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA1E12CD88;
	Wed,  8 Jan 2025 04:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736312060; cv=none; b=oWZMQQsoekJ+k8GHfH8/JpEhQZJr8mGHj/t6sdIaRP+Iu3n6qc8o5Km22rk4LzS1S1nyhpafmnnB7WFWkYw7ELDEVlaaGyFh4+YL3NKGGGJlgkAhlzRo1nAYmPurMWG0eE9T6nb/HynR53JXFEmjq8P5/2G+nLqmxTny/hnV1k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736312060; c=relaxed/simple;
	bh=Nhhf0txthHdTrOg7Wvf/SNnBmBiXEtINz2CaZl2J0PY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5iPt7ZMDVBaV5h8dBNd8yzP2fzCBOrjVrD1vnUfNk7LNsHwXmujobFeigHDHNJyKJhAMRUeOmAiqcFVzOe3QAzxRQ+C9ubdhEyDFwjqCPG5NHetamJsADvdEbEpBrm3zoVsHvZYKma7HrmNzSQV6K3Px917RnpbskY0gDgprOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9vlJnGY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7828C4CED0;
	Wed,  8 Jan 2025 04:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736312058;
	bh=Nhhf0txthHdTrOg7Wvf/SNnBmBiXEtINz2CaZl2J0PY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P9vlJnGY37+FynCjvGGCQuZ3sEIwLpTaVSgqbrjWMl3d/s+NREAe02q7Vfn2C+sWC
	 VSpAXxOmke/m8fxQj56WGYQAQAQ5jdTuq14/Z1rRTJ99LAiRaFUCH0H3tHNlyyyRM+
	 /nVGnl3O2dNMIzR4Q4ZA0EtvQyx2olryS5gJo5lZGbctj/qr9ClNL2qsNNFeoG1Ezk
	 DVD+0ioi3XOxyl+ptNrU4iqGA2WMbKmH4tklZ4+nKvY5ZokX78IuO5iGZdTncKISFW
	 DaXU2zFCqAeDZytSWvdgv3DDA1hM+2rFRdm3fzWItc0ltqY9a08J4Uwa+/CbAoPtB3
	 TiPMX6JuMVQEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Imran Shaik <quic_imrashai@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: Add support for clock controllers
Date: Tue,  7 Jan 2025 22:54:13 -0600
Message-ID: <173631205044.113795.272368168541784140.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
References: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Nov 2024 16:35:55 +0530, Imran Shaik wrote:
> Add support for GPU, Video, Camera and Display clock controllers on
> Qualcomm QCS8300 platform.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: Add support for clock controllers
      commit: 795255cb4cd4388cac930e3bb3524e1ca84dd0bf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

