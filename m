Return-Path: <linux-arm-msm+bounces-36190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDB09B37C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 18:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3789C1F21E80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 17:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CF61DF251;
	Mon, 28 Oct 2024 17:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxYUvxaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E211922FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 17:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730137026; cv=none; b=AkHS0rosNuxRobXF2NjBrO6FehQ86v6MN+v2+4hcNlDXpas1rCmgMEn0gP+w8nJsI0mFljpCBphKF+joNE+jbINZQrTKulFPMmBjE3g/Cxa91aeEJgcS/ukVxxuGfpNzLvFhLGGtf2BVWhe4HHELaTcDjtrUe1PyXlkM6JUS5Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730137026; c=relaxed/simple;
	bh=WhZ8MSqqpL1fOhdN4WCI07mV5UW8J/yJa87MLuIn3Io=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=LfkwMvCMrMfwn7u1bFvpCS9CZ2zoLnmpR9QY8K7Y3Hd7u4N4yFFLYQxboLF4m/gb1QmMwuTwXcIpzstaMdKDoANfna48TfIOnhzBW4x7kkSEzP3zW6TZrWoBqSbRI7nEtxO0GcxbvD4V/j+MKWVgVN8iPNZflmTlxaSqk0VoS3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxYUvxaW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9CDC4CEC3;
	Mon, 28 Oct 2024 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730137025;
	bh=WhZ8MSqqpL1fOhdN4WCI07mV5UW8J/yJa87MLuIn3Io=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=MxYUvxaWCbgBkGN1MONGgBW9Wpe0Jrjby99QI9X5m38naKgrxGFAgwDiRNRnMVZa1
	 AAaDP1H2oEh2517Q4YPYVLxOicTGgyDRC7RihzPLY2+AL/E7atiJtlZOwR33KBIZqK
	 VsPiLxtEZsskDEapH0MMRF+tkuaC3U7TjpR8eS+GQRU8hRPSnYWnf0w4oGZ74HfxLl
	 1WzWYtPNWzCTypMgJhna+0sW/S8UJTUbsNNbROCDriPh5fOQVVmoUC0nY9+ZdkfxMa
	 AJsURge5mH1nLp32ARHj2iPOSmY/esDVpGfc0QgYGzISIX52IbZ2DLgA0FjSBUGg+U
	 1ynLq3bauAp7Q==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Jeff Johnson
 <jjohnson@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Konrad
 Dybcio <konradybcio@kernel.org>,  linux-firmware@kernel.org,
  ath11k@lists.infradead.org,  linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific
 subdir
References: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
	<379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com>
	<87plntnwon.fsf@kernel.org>
	<CAA8EJppAiktoPk9hZnDdj5igZ9-D0229WRfwg08y8CPnwerx-g@mail.gmail.com>
Date: Mon, 28 Oct 2024 19:37:01 +0200
In-Reply-To: <CAA8EJppAiktoPk9hZnDdj5igZ9-D0229WRfwg08y8CPnwerx-g@mail.gmail.com>
	(Dmitry Baryshkov's message of "Mon, 21 Oct 2024 21:34:27 +0300")
Message-ID: <87iktcgmde.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Mon, 21 Oct 2024 at 21:22, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>>
>> >> Dmitry Baryshkov (1):
>> >>       ath11k: move WCN6750 firmware to the device-specific subdir
>> >>
>> >>  WHENCE                                             |  12 ++----------
>> >>  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
>> >>  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
>> >>  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
>> >>  11 files changed, 2 insertions(+), 10 deletions(-)
>> >>  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
>>
>> So this follow basically the same directory hierarchy as you Dmitry
>> implemented for ath10k in commit 5abf259772df ("wifi: ath10k: support
>> board-specific firmware overrides"), right? Just making sure we are on
>> the same page. I think ath10k/ath11k/ath12k drivers should follow the
>> same design as much as possible.
>
> Yes, that was my goal. Having subdirs under the main dir.

Very good.

>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
>> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
>> >
>> > I'm waiting for Kalle to respond, but at a minimum I suspect our internal
>> > firmware tooling would be impacted by this change.
>>
>> Yeah, most likely we need to update our tools. But we would have to do
>> it anyway so I'm not concerned about that.
>
> Ok. If there are no concerns from your side, could you possibly
> respond with Acked-by? Then we can unblock and merge this.

Sure:

Acked-by: Kalle Valo <kvalo@kernel.org>

>> > Kalle, do you have concerns or suggestions on how to handle this issue?
>>
>> Looks good to me.
>>
>> Dmitry, if you have the time please take a look at this:
>>
>> https://patchwork.kernel.org/project/linux-wireless/cover/20241001033053.2084360-1-quic_miaoqing@quicinc.com/
>>
>> Based on a quick look it seems to do things differently and not really a
>> fan of that.
>
> Yes, I'd prefer a subdir rather than this implementation. I'll respond
> either today or tomorrow.

Thanks a lot, I appreciate you helping us.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

