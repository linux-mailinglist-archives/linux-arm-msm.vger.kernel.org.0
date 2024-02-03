Return-Path: <linux-arm-msm+bounces-9717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097778487D5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 18:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C4561C22957
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 17:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BA160DDD;
	Sat,  3 Feb 2024 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3WlRqmO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE1A60DC5;
	Sat,  3 Feb 2024 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706979991; cv=none; b=eROujc5JNGPoBW1/gWqZb5wjPQ65Ca0jv9bYVGjPQNcEYX4zLStymhdWbpHkpMkBYmQwa0coEnhDc41UCM1SU/RuMqtEpilvtA/jd/qzgfaVBF33vFdU1ktcr1B6SrgDgVlya6vTT2pdATeZMKD11bo1mo8n6blwDuURRDitpms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706979991; c=relaxed/simple;
	bh=cYeOUvccqJV3/wsKIwMzmFFKBx+VtdlemVj8A0eNQ4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kcWdxmRbh67D7eWKnhWohM2p0sIpWKmAEsNs8LvVW34+YYsiP0tXWc1e9w3tPypb/BXThBi38EvLi4w5KpyeVq1x9dp9x2AtSPviMwgp9ZcSIM9Hf6p+ROP9EIOPnf26lSXe1OfEhoJQVsAKq832UoT8gEKXv5+KypXe/sO928E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3WlRqmO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FEDC43399;
	Sat,  3 Feb 2024 17:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706979991;
	bh=cYeOUvccqJV3/wsKIwMzmFFKBx+VtdlemVj8A0eNQ4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M3WlRqmOcVMzHoL6C9ChcbzJaTseR6Tdg2qMA03aa2AqsYXk1v0tjQcWBgGQce7DY
	 Y2IiYbAz2xAqGcFrgbKXWhMS02UYjSUCk+fGxlwL9qokYxeKNDzOJp92eNtyPyhpRS
	 1A2GLUjWGjZlfb231Q7b1jGAIABtHlTIjA7YHw9Zr7Ynsfph+nyy0JWZk10SsuJkm8
	 JvS7Bb8QEqpmobAsLelyrvt7+U/cvuBMDpX0S92Fc3XPsR3B5ZualTaC5DXd4mAvb7
	 pU83UKMzWnLPocjdKgYKdMdLYCUuT3zTwZClqWP3VEQ3IrDItXDliLr850Oq5Ufr6D
	 Px7F6ytON7PHg==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Umang Chheda <quic_uchheda@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_kamalw@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm6490-idp: Include PM7250B
Date: Sat,  3 Feb 2024 11:06:22 -0600
Message-ID: <170697997764.332807.18017045667072676673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125115300.3496783-1-quic_uchheda@quicinc.com>
References: <20240125115300.3496783-1-quic_uchheda@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Jan 2024 17:23:00 +0530, Umang Chheda wrote:
> Include PM7250B PMIC for qcm6490-idp.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-idp: Include PM7250B
      commit: d967cc9cf37ea2a6c7cdb9779113f10d2910bb4c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

