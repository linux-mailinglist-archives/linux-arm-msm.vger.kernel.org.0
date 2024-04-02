Return-Path: <linux-arm-msm+bounces-16143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D58895BAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 20:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98E9EB23219
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 18:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A21E15ADA3;
	Tue,  2 Apr 2024 18:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="L1YX9URN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53741159919
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712082320; cv=none; b=AjivoaukKTUpei8uja05AhTkn5X3pJHVgvRAGv1/Dolzjwk4cC9horlFOtf4mRA3VQxZ7ShKBzdYV0hf5p6HO8xwmZZ+b7l56p61w8nZaFDgqSDtdOHeLyW7w6WxOeeE/MyT15pyGZXJ0puIxxQQlj3yner/xB7E685mYYG7/gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712082320; c=relaxed/simple;
	bh=DPTwM8DXlyZSF3sQjcoaN0vDR3bb6difnHz5i8/uPYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRaAcf4P9TLQrgf4+ZQgQIbwhRlAkrfyNPqlLAiZfeT4NSGC0FqVoUp+DdcH9fI00FoKJEt4VgeifWiQ2/hlxSKo71RrUQxA4//WVUNr9TehXhLqFeqwSVzY6hS7spaNgfJw0aoeSZtXrLJWLJYVgOicpT0b+5VHoKbM6t7/kes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=L1YX9URN; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <8ef4f56c-83a3-4b26-877e-f1c7a0307e98@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1712082313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13vOsyn8jFuJJVMC+4Atlj55N5nsRCUlWW0T7qTrNg8=;
	b=L1YX9URNDTPG3WJg1YPeki9iW+icQqF/wO8w6tDN5qRGkXxsVo7KMH/3lxaGVUhsqZKmQ9
	wmPPAeMujqXYSapmG6fxxMT9zMDfzOlPt+MKcwkHFHQGTdh3Wn64YJeUb0Zo/4Fk5HipeA
	UWRH3tOlCKJ2p0bBQ7VYVu2lTefGPc/N8P7UpmDrkyxPlQZiH7T+xUPdp44u1938AOvTJu
	mQuYg5BVd/z/41+OupC/5nmXZWc7hzri/MLpnIXE5tkWzWOWV1pCLzcZcIo2WKso9OqzLA
	Tbaa/vrLutQv9wJG/EoZamdgO0ywhVJlPiPwxvMlSWidZJ34vUeCUnwV1S+SYg==
Date: Tue, 2 Apr 2024 21:25:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 02.04.2024 18:55, Dmitry Baryshkov wrote:
> I'd say, we should take a step back and actually verify how this was
> handled in the vendor kernel.


AFAIK there is no such thing in vendor kernel driver for this, as
this startup procedure is likely handled entirely in userspace in
cnss_daemon.

By the way this workaround is needed also for Wi-Fi in sdm630/660,
so no not only msm8998 suffers from this.

 > This sounds more like a firmware feature, not a hardware feature

 > having this property in DT does not look right

I agree with these 2 points above. This can be handled more nicely
as firmware feature encoded in firmware-5.bin using ath10k-fwencoder
and not involve any new DT compatibles or properties.

-- 
Regards,
Alexey Minnekhanov

