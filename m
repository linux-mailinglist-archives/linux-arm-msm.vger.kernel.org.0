Return-Path: <linux-arm-msm+bounces-43416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DBE9FCD12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0BC1188418B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1D71E009D;
	Thu, 26 Dec 2024 18:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WejQS2Mo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0552A1E0090;
	Thu, 26 Dec 2024 18:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237676; cv=none; b=GaHWNxprTmqgWU61WuevCNe8fDXpLbmnQf8nofj25tGMaFnBYp44pg7U+gvTX7osFczPP81Y5LTToZhP1y/8MQILV3Dk4szrp+GVDcqwKJQu8eNGIbVNWz+/aA5O/n7A454NVHwSuhcEHc8/AnX4GWwO1gtCr0/kM7D2vrGkQ1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237676; c=relaxed/simple;
	bh=1mldD9HuVuQo5DXQlX+5HwE4kb8+ynDCKZl9yT+WgjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZSwV+njONhBwEpir5gd7z+HbDwDSmMWyFP5GwdY6s6538pqk1wrm5FGp/XeW3uIf024QCMLl3dqcqJZziz5+C07KyCA/Sp4R3+XFLSGpdSnFYXeCpzqBv7mQmzYoB84Kq9/8vmWDwR7iRgCS6YkZZkrAdZ/KZFmV3jWXk3ij80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WejQS2Mo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2856C4CED7;
	Thu, 26 Dec 2024 18:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237675;
	bh=1mldD9HuVuQo5DXQlX+5HwE4kb8+ynDCKZl9yT+WgjU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WejQS2MoQC4sh/eOuR+lnYofPWL9EdvWtav2nzPzQfHt5Ufa/DpBAwp2xl+dnFHJu
	 bNmuW4cfF13x1aGZ+7hIbnOpFz5xwUb2JVjD6sd8oBdyO6hiJ9aMFj/SZk8p7VNAPj
	 rnUp1r8gg1X7OSQHHhWAeRA7fq/PqFbunYnpUmPM0pnt9tDI0w2fXokFpmbi/J0ah6
	 O1RYXH7iweu56tXrnZDSqYR+lSp5hAHiXUTzXde5wXo+SVbbpI/iF69u/coBxgbEaN
	 irylhX8cXSiuysnKLEeL0EYMiYntOIMUq4Rs146O+In2GgDkihj/8oAEMQQxNEUpac
	 wNezbgXPFVfFg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs8300: add QCrypto nodes
Date: Thu, 26 Dec 2024 12:27:09 -0600
Message-ID: <173523761373.1412574.14762332677520975903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241223110936.3428125-1-quic_yrangana@quicinc.com>
References: <20241223110936.3428125-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 23 Dec 2024 16:39:36 +0530, Yuvaraj Ranganathan wrote:
> Add the QCE and Crypto BAM DMA nodes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: add QCrypto nodes
      commit: a86d844099474acf59cfb45f4590800ae4d9365e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

