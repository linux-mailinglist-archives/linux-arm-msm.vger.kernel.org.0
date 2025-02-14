Return-Path: <linux-arm-msm+bounces-48084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82795A36894
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6BE91896578
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62D1213259;
	Fri, 14 Feb 2025 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBpgTfYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42E6213243;
	Fri, 14 Feb 2025 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572724; cv=none; b=YbEt5sWewdJP3q7ETocqPzROmWx3Y6gOt2+WdQt9n3ramKZHZp6WZd56MBO0+/1bUifNSDv4mcIe+A4Uw85EA/O7wmFKGHWrCVNn6LLCK0BQwcPUaODXAIDRZ3S74m8JG3qi5wq4GeTPIA6tx28jexYYI/nP23iC4hP1L17pfVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572724; c=relaxed/simple;
	bh=3zCHE9kiJ4y5v1RIFYPhqIB0vRi6c3Ejtg6ggzpqtP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QpfvoAJe636hEi9PlmXpVAZctMmMW+jAU4j0J5EdVQh0KOBJXU3VjRE79f99BPvK9SFEPK25Rnn0ZmTXE3v23Orhyp7ME+kT0ZRZSeAYMCaaZkrGWG7Pa41amNftOkAvkm8yqebUkwUFHaoioaRxB6yekh6BopvqNE3UFQhI8e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBpgTfYj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16461C4CED1;
	Fri, 14 Feb 2025 22:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572724;
	bh=3zCHE9kiJ4y5v1RIFYPhqIB0vRi6c3Ejtg6ggzpqtP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZBpgTfYjttuLUA/3YGxRwEj9kV3zKct1M7wBOBgxLg7oHddzLfQOGRhYGXSlbU8Cm
	 3TF7O+5f10FugcdlNffO3kt8Jtqeyn+4RFONf0ZCRjlhUY9lv5SnZLF26ZneYiD/GD
	 N3IyhHvOonOknE3vJ+wOCX3fzSw0ASNAae8y3tHTZCHtFdpg69U8EYvyO3fS27pykH
	 rrd7JSETXOj0Ar3sA03JvkEjrP+KntDCg9Qy9x1DqmRGRHLNp7pSKj0BX2f0IQdAXF
	 2Og50a9bj21YuCLQAQNc4GOJtcmrDUKqwC8vG4McqHoWgu+YQ+SJB3avrYglXLzySh
	 K2VoBTrkvsucw==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/4] soc: qcom: ice: fix dev reference leaked through of_qcom_ice_get
Date: Fri, 14 Feb 2025 16:38:25 -0600
Message-ID: <173957268932.110887.11876540635940606278.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
References: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Jan 2025 14:18:49 +0000, Tudor Ambarus wrote:
> Recently I've been pointed to this driver for an example on how consumers
> can get a pointer to the supplier's driver data and I noticed a leak.
> 
> Callers of of_qcom_ice_get() leak the device reference taken by
> of_find_device_by_node(). Introduce devm_of_qcom_ice_get().
> Exporting qcom_ice_put() is not done intentionally as the consumers need
> the ICE intance for the entire life of their device. Update the consumers
> to use the devm variant and make of_qcom_ice_get() static afterwards.
> 
> [...]

Applied, thanks!

[1/4] soc: qcom: ice: introduce devm_of_qcom_ice_get
      commit: 1c13d6060d612601a61423f2e8fbf9e48126acca
[2/4] mmc: sdhci-msm: fix dev reference leaked through of_qcom_ice_get
      commit: cbef7442fba510b7eb229dcc9f39d3dde4a159a4
[3/4] scsi: ufs: qcom: fix dev reference leaked through of_qcom_ice_get
      commit: ded40f32b55f7f2f4ed9627dd3c37a1fe89ed8c6
[4/4] soc: qcom: ice: make of_qcom_ice_get() static
      commit: 1e9e40fc6fb06d80fd9d834fab5eb5475f64787a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

