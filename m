Return-Path: <linux-arm-msm+bounces-44035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E1A03072
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 979E5164AB6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 19:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837671DF99B;
	Mon,  6 Jan 2025 19:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="EvFfMhRK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A684D8DA;
	Mon,  6 Jan 2025 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736191267; cv=none; b=sQp2msD8f9b8cf0GsOzcf0jl+5WUcijFPb2Qb7Egzkoah8v9WTO8xQRpUr8AiwJunL5zj+dSNpsTYRW516sG1WGkC6ZJCCU3dFvwwnbkrRt+xmbGkzqrKU+SnMoNy679NuF0+Vo+7OuUuDkhNSgKVHbpr4nP1UXbzhL9ax0a9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736191267; c=relaxed/simple;
	bh=4ySUSAJ0vB6Fw+bFb5+oI1l044QaOGC+UqVjSNduFgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kSbZAEuAIhYvxmWUh7Rikn/krKm0HFSNx9SRL9+PPxnOJ5h9S/CaVWTuZrgbj15lA2i0SD4OqFsu9UlEghqbEQhfM7GBbQvw9t/B5VrHCEdcrsPVJy+6XdBeyv4XLOOHTYXnmvRAmj4ATNBAq1YwEntv9MRYBXkB+b8BSPf3dZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=EvFfMhRK; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YRkKy25yPz9sTm;
	Mon,  6 Jan 2025 20:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1736190662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NRmWwyUBRYp+VaPBjk2Ubbo32d54ltoCUzwiU82RV3g=;
	b=EvFfMhRKeTxgExEJ1eMmKhIE919wSuoQI99WzFqXxrwL39ZsmdzIoKQ4un8DHG+Gexea61
	NWSS0fYr2vxjJOxQEW8f5JDQdSp1E3xDFFiWNnIAV9xAUYzeIzKbJVxIQ0fjk2DiVJb/Lk
	tTx8E6GAiJOByTUW6w6lSQQQ7qfJ75j2iiyomBN7FdOL1iRqmmFUz4bSOJcONWR4JtdTsy
	JR9r+KJjs6mTV7xtTRVggGIMUn8lfVtKMea/X0HeL23D/aLNN2Nj7XaBw3FxzxFQ4t5GUb
	ONqrX+FcCZzVyWsU0tv+hDcG4fuXANu+rysNT8BRS3I3sII31foPc8vc5XIBhg==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,  Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Bjorn Andersson <andersson@kernel.org>,
  Konrad Dybcio <konradybcio@kernel.org>,  Chris Lew
 <quic_clew@quicinc.com>,  Abel Vesa <abel.vesa@linaro.org>,
  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,
  regressions@lists.linux.dev,  stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
In-Reply-To: <Zwj3jDhc9fRoCCn6@linaro.org> (Stephan Gerhold's message of "Fri,
	11 Oct 2024 12:01:48 +0200")
References: <20241010074246.15725-1-johan+linaro@kernel.org>
	<Zwj3jDhc9fRoCCn6@linaro.org>
Date: Mon, 06 Jan 2025 20:10:52 +0100
Message-ID: <87wmf7ahc3.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4YRkKy25yPz9sTm

On 2024-10-11 at 12:01:48 +0200, Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> On Thu, Oct 10, 2024 at 09:42:46AM +0200, Johan Hovold wrote:
>> When using the in-kernel pd-mapper on x1e80100, client drivers often
>> fail to communicate with the firmware during boot, which specifically
>> breaks battery and USB-C altmode notifications. This has been observed
>> to happen on almost every second boot (41%) but likely depends on probe
>> order:
>>
>>     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
>>     pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
>>
>>     ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
>>
>>     qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
>>
>> In the same setup audio also fails to probe albeit much more rarely:
>>
>>     PDR: avs/audio get domain list txn wait failed: -110
>>     PDR: service lookup for avs/audio failed: -110
>>
>> Chris Lew has provided an analysis and is working on a fix for the
>> ECANCELED (125) errors, but it is not yet clear whether this will also
>> address the audio regression.
>>
>> Even if this was first observed on x1e80100 there is currently no reason
>> to believe that these issues are specific to that platform.
>>
>> Disable the in-kernel pd-mapper for now, and make sure to backport this
>> to stable to prevent users and distros from migrating away from the
>> user-space service.
>>
>> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
>> Cc: stable@vger.kernel.org	# 6.11
>> Link: https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
>>
>> It's now been over two months since I reported this regression, and even
>> if we seem to be making some progress on at least some of these issues I
>> think we need disable the pd-mapper temporarily until the fixes are in
>> place (e.g. to prevent distros from dropping the user-space service).
>>
>
> This is just a random thought, but I wonder if we could insert a delay
> somewhere as temporary workaround to make the in-kernel pd-mapper more
> reliable. I just tried replicating the userspace pd-mapper timing on
> X1E80100 CRD by:
>
>  1. Disabling auto-loading of qcom_pd_mapper
>     (modprobe.blacklist=qcom_pd_mapper)
>  2. Adding a systemd service that does nothing except running
>     "modprobe qcom_pd_mapper" at the same point in time where the
>     userspace pd-mapper would usually be started.

Thank you so much for this idea. I'm currently using this workaround on
my sdm845 device (where the in-kernel pd-mapper is breaking the
out-of-tree call audio functionality).

Is there any work going on on making the timing of the in-kernel
pd-mapper more reliable?

Cheers,
  Frank

> This seems to work quite well for me, I haven't seen any of the
> mentioned errors anymore in a couple of boot tests. Clearly, there is no
> actual bug in the in-kernel pd-mapper, only worse timing.
>
> Thanks,
> Stephan

