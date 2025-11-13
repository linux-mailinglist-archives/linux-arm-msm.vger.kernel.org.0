Return-Path: <linux-arm-msm+bounces-81568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3D8C56A3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED06B34C2D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1492D7DC4;
	Thu, 13 Nov 2025 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhbrFdG+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD72D5C6C;
	Thu, 13 Nov 2025 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763026643; cv=none; b=eCsucY51Tu0CKqAt7QoIMnb/4bI8XJfJbH0tqAObcfbu0lhCwmteIsDiDP+9tEwfbqmcc6RkoOZ0g1sY8A10BTnpPOcNaDgmjx7xGB1m/sgnauTLaj+lvdWtD5EJC0+tnXB83Ul41sWVVhyMuwUb8LTECxDM+8pjCYWgPI2nHBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763026643; c=relaxed/simple;
	bh=W+Occ+lPWQ5GksQNwGHSfjb/mZ5LU2KL0XKNFsf7F5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rO7MfttbgltaBN3Kvc4rVxQggMPt1hRvNl6//uZIwk+JunMUITFpecoNgIe3ld5UhpAsnea7xufo1rThcmOmmXlU0COw5IJOGPhvdIx2s68/VozlQvQpMXiyKD7A9wQ5b1kIIOvJWErOhZBpI1fh5c8mAPAigtn80rMbak4jmkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhbrFdG+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AF7C4CEF1;
	Thu, 13 Nov 2025 09:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763026641;
	bh=W+Occ+lPWQ5GksQNwGHSfjb/mZ5LU2KL0XKNFsf7F5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OhbrFdG+KnN2X63zoTMJ+fW5N4UGnRsP9yMgDhhl7FeDYwgNq4Ac0TrRFsI5jyIkc
	 vWfMuI8AgWgtCdxjZi0ng6IYAQ2+eBj7W8zTM0QYlmkgs94kFSH6ny/iISX0icjeJf
	 YXGEhqITjvYgviszXZ9JVHa5L1ggc0iYlkzg4TX8DzSt1H6VoYVO44AxwSyh9r1dTO
	 ca2CG/AGDgiDpg6/i1wBIdXOOknJgaKsAK0NdGOgRB3ktMhuj1sLfOBR4c+MoaR7u3
	 FhMKTpQsQxHyASsp+BJgZMgdZU9of6jFXfG9/i8aAxhMfm06k+CTnwGvndosEhrIf0
	 IPQzJy1gDrPIA==
Message-ID: <72850fb4-a808-4cb7-98dd-b7d280f575ad@kernel.org>
Date: Thu, 13 Nov 2025 09:37:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] media: qcom: iris: Improve crop_offset handling
 for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 quic_qiweil@quicinc.com, quic_renjiang@quicinc.com
References: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
 <NjNnj7HS_VfMp-8fvYYx__VlM1bXwiS6QZO3i5fEU3Sx2C3dQL0CEbGkY0j5PGP2RtpOBvCaM9dDqAjKXzuxeQ==@protonmail.internalid>
 <20251110-iris_encoder_enhancements-v5-2-1dbb19968bd5@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251110-iris_encoder_enhancements-v5-2-1dbb19968bd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2025 10:23, Wangao Wang wrote:
> The setting of HFI_PROP_CROP_OFFSETS for the OUTPUT port is correct,
> but on the CAPTURE port it is used to inform the firmware about the
> ROI, so crop_offset needs to be handled accordingly.

What is ROI ?

Please define this term in your commit log.

---
bod

