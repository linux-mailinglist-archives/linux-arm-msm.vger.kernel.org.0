Return-Path: <linux-arm-msm+bounces-44794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D354A0A41E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 15:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA541637A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 14:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0072340BF2;
	Sat, 11 Jan 2025 14:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="A5pqBkVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF91E492;
	Sat, 11 Jan 2025 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736605319; cv=none; b=sjP3gTszkHPUOkm/wo5jDxvcTqyxJz9fc2lN93DswpoXshB+NcsTeFTX7WaM94blt8G8XZR2nwiDERknOoVslZim7mx/umJPyV2+DzR5QYdMHBCMUdNneF8cilx0ep8dXxLXD+GtX+PpN9OlaShCWGOAKJL4dlE1jDPzI7/bf9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736605319; c=relaxed/simple;
	bh=clD0JYRcF/C1xi3xGggMAmmDiTfzk5reKILZo8Lx1Jk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EO86lQvPvPJgsa6uwsHZZXyGWa4ujdJyjgGNs5LDZCd/VOrwh3uIncu77nkdwJST+d0xziAmYgSI5M98ToyXSJ+KmL0hRzefUNif36yehmZjaogkR7MpPEOTuoHE1NMREci7C7gSuAzX5O81FsOd4WQIA0txBwyVJpKJ7WwbQi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=A5pqBkVs; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YVgh16vjqz9sbF;
	Sat, 11 Jan 2025 15:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1736605314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9N85Y4Z2qowL9rTsrfCGNbRfvRafyq+lZp7gyIycm2Y=;
	b=A5pqBkVsu2yTZLCKZ6G5TbUuy775lMfStvRSvT9rho0HWJHCLdCBslmRTySoVQ7P5IEQ5V
	MPGuIeQg9vt4A2eew/P0Fde+v3LmM6yXx6KUHPWhgwb6vdXp8RyIA+5jTUEjZd8DWC38t2
	unhxNNZZm+3yBDJDq0HkWyGJiMTkfFSWv/R6vuP9eHjT2StDL66530WT8ObshImA10MoRN
	KRHqCz7gefx6kHRAD7E7ASsMZrgb2CzWhEejRLEEShp26toivf9rgD6T2iI3gwkpCgS1C0
	SlfJv6/Jz23ZVgvjUdHg5LK8rSzgUH+K7JV3FU/w0VR++5X/l0dVfwwx5kULmA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
  Chris Lew <quic_clew@quicinc.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,  Johan Hovold
 <johan+linaro@kernel.org>,  Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Konrad Dybcio <konradybcio@kernel.org>,
  Abel Vesa <abel.vesa@linaro.org>,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  regressions@lists.linux.dev,
  stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
In-Reply-To: <Z36Gag6XhOrsIXqK@hovoldconsulting.com> (Johan Hovold's message
	of "Wed, 8 Jan 2025 15:06:34 +0100")
References: <20241010074246.15725-1-johan+linaro@kernel.org>
	<Zwj3jDhc9fRoCCn6@linaro.org> <87wmf7ahc3.fsf@oltmanns.dev>
	<Z3z7sHn6yrUvsc6Y@hovoldconsulting.com>
	<Z36Gag6XhOrsIXqK@hovoldconsulting.com>
Date: Sat, 11 Jan 2025 15:21:35 +0100
Message-ID: <87wmf18m8g.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2025-01-08 at 15:06:34 +0100, Johan Hovold <johan@kernel.org> wrote:
> On Tue, Jan 07, 2025 at 11:02:24AM +0100, Johan Hovold wrote:
>> On Mon, Jan 06, 2025 at 08:10:52PM +0100, Frank Oltmanns wrote:
>
>> > Thank you so much for this idea. I'm currently using this workaround on
>> > my sdm845 device (where the in-kernel pd-mapper is breaking the
>> > out-of-tree call audio functionality).
>>
>> Thanks for letting us know that the audio issue affects sdm845 as well
>> (I don't seem to hit it on sc8280xp and the X13s).
>
> And today I also hit this on the sc8280xp CRD reference design, so as
> expected, there is nothing SoC specific about the audio service
> regression either:
>
> [   11.235564] PDR: avs/audio get domain list txn wait failed: -110
> [   11.241976] PDR: service lookup for avs/audio failed: -110
>
> even if it may be masked by random changes in timing.
>
> These means it affects also machines like the X13s which already have
> audio enabled.

I've blocklisted the in-kernel pd-mapper module for now and have
switched back to the userspace pd-mapper.

I don't know if it's helpful or not, but I don't get these error logs
when using to the in-kernel pd-mapper. It's just that the phone's mic
only works on approximately every third boot (unless I defer loading the
module).

>
>> > Is there any work going on on making the timing of the in-kernel
>> > pd-mapper more reliable?
>>
>> The ECANCELLED regression has now been fixed, but the audio issue
>> remains to be addressed (I think Bjorn has done some preliminary
>> investigation).
>
> Hopefully Bjorn or Chris have some plan on how to address the audio
> regression.

If you come up with a patch, I'd be glad to test it on my
xiaomi-beryllium device.

Thanks again,
  Frank

>
> Johan

