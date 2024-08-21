Return-Path: <linux-arm-msm+bounces-29205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906695A049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAA051C22310
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 14:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47361531E2;
	Wed, 21 Aug 2024 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9QFPefq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3C79B84;
	Wed, 21 Aug 2024 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251610; cv=none; b=WPzMCuI52mCxKXemZglUV5bkYxGWPCfyw+XkEM3ngb7+nmEpDJUIsL/iBjS6zxiBduKOLMwS3OyW3VMtWgLaAe3/yOSefgUl7XG2ND9VwThF4Ryqg9MJ8kkMckD+3WwpRMaqM2eFF8C+BHaNIIqREbCoLCyKMg2PIPa+J9SA/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251610; c=relaxed/simple;
	bh=D1CyKhPSDb+3GkMmc1F5R+gPmvS8mx6cLnaeWXzRAZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXirJe6DOG5FJDq7b4bwV+/L3W/M2z4Rh1Wp6RKoS4AEpGPsa1HvJU12qEq4t8jEciz+gIPBkPd4T7DIIgR4EYGbjuiHvAGXKZI7U62NvwhUIpJiGfZWDSqw5Fi/QxudqsWtGifeZs4AYLvb6sl+FgAlTZDXR8JItxsQMQH4ix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9QFPefq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8795C32781;
	Wed, 21 Aug 2024 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724251609;
	bh=D1CyKhPSDb+3GkMmc1F5R+gPmvS8mx6cLnaeWXzRAZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f9QFPefqDWFtEV19xKfxuojezAXiG0dp4+MXqY8Oy50zoOfefXzsBsAiG/qFo/eOp
	 Y+EDMiV/w1S/HxNv8rG6WNZdpt2qf0wO5VllY9/tO9H4AQvF75w5wWuc20MKxKG0mh
	 xWQNz2ULjgMhcT/fxpvZdru4nMQ9m9/ZtYE6fAbKh4Jf9gVgQu3k6HhmmB2uu+kyl9
	 G94xwDfJiW+KWEsEUOCb81xKyYezqtOHhwshq6ZQvO3Hfmple3j43i4zrLBlBl2LS0
	 OcV2kD4xJHwOMYT5JRoYce0xB/geAnAaiN9L72EHKAzYFt9dgtNE5jY9ty7+Mu0MWi
	 lzs9fUYZ8TJqA==
From: Bjorn Andersson <andersson@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/2] X1E80100 multiport USB controller
Date: Wed, 21 Aug 2024 09:46:41 -0500
Message-ID: <172425160166.1359444.7745038976494752965.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820-topic-h_mp-v2-0-d88518066372@quicinc.com>
References: <20240820-topic-h_mp-v2-0-d88518066372@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 Aug 2024 13:34:21 +0200, Konrad Dybcio wrote:
> This series configures the multiport USB controller on X Elite. No
> driver changes seem necessary, tested on the Surface Laptop 7.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: x1e80100: Add USB Multiport controller
      commit: 5c5edbf46177e6335f2faaa3b68456755bcb9006

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

