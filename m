Return-Path: <linux-arm-msm+bounces-20711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8818D1798
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 399381C21F27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 09:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E283916ABCC;
	Tue, 28 May 2024 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="ruypxRws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A353914E2DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716890083; cv=none; b=LEKMG3dOIHhFDqjjfWLoKn829Oq90Mxs4nuurDtbCIXF4NOh2BVSyxxuNsJgcr3MbUKuuCIKgJ9zw7ekC5pKZ4q7yB6yn6bnFoHtYl4tETgk+x/behOJ9Q34JExHLKuxWZEnMpGJq/6tJnm3KDqq6N2HG1Ivafr+jvx+B7UTOjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716890083; c=relaxed/simple;
	bh=SybdU/r39hJTOGi3oDXSj45HlcUBafnMrek6K0mJ7l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3x+Db2U1xEqNG/FeRLgvNbvUimXDDx1UfYAVREJ+wLsjlfLiLZRLt1zW3/SJNu/B/uArJfAByvACSH0YnKTgh2lR5CG6qBOpGao6yur4Lmzm/Q3gXfKY2GhYtaF9BRzOoZZzBjJVNb8VbcinFmYmB0kodn1FLXi8sMaolgmeh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=ruypxRws; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4202ca70318so4522495e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 02:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716890079; x=1717494879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWYisXjJ7RIo5lhbJSv21znch1qUWj7f8daCXXniaDs=;
        b=ruypxRwsLSWpZ3UIDqPfO+p4bXYgqLXvpJx26Mp/84+fyfOWYOprFVPrhpmt2s9qHD
         ieDfG9AU/gaUF7ds/dcSQI/U/oCHlbsI3+DHYmXcG1pqqaX2NfMOglkO3+eWPH9RO8q0
         WRM/t74J9IlDy4W1xXziA/RXDXMbKOmeI8/y08uIL0jcmzf9Naol/BqBTABTCF7FNfk+
         4H9RFvLUHJB74G81plBjjaF0+zLtFxSu2wWjBFxs3DHst447r70zYbJMBlOuWv5muq3/
         SmrpqjtvlVRzzlmp0BcZu+qVVOTVOIiwTSF9vHuzlrs4jFpmjvBQ2L0p96x6Rw13lQRy
         jADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716890079; x=1717494879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWYisXjJ7RIo5lhbJSv21znch1qUWj7f8daCXXniaDs=;
        b=Z6y4q63RJbG1y1yCxPOKfap1KJFW/5/idJhoqrgrnmgElaVoPqXzWu0ODxMjDAqV4j
         ciDjmHhrFrq+vUy0EssWlkz6S5apFUrMBIGLau0Vg3u/qCN3H+DIKPYWEQglQgRSOSsc
         C+sU8xWqqI7WYlho4tPrywSmWqunYKvxG+z4xxHd2XvWlOp/eHupsUrFbr+ulWwFRCqn
         fwYBCRVBc0rVgLI+wAfFQ6zKe2mIPFOXvlLp0oyFnMC6R/qxFehI+KSg1modCrZy8iHW
         2s+tfNxCNaawnYLuYfZys9WFpA8j1UpvFJHeutqYPNDAU/9Dd1QgivAMWmf4xv6oLqs+
         fcGg==
X-Forwarded-Encrypted: i=1; AJvYcCVUkUXbOxPBdDpE0Tb/XFR7+lCdnuocM74PZs0UbrAa6yM9dl0mrY8KBbE+n/sVv5DuCEALK6LoFFW4HUx6F3A068L84sCPGgsmtrscDg==
X-Gm-Message-State: AOJu0YxXtAVIC1nZHZYKPmwD3yi9Mi7/Tn5RFaDW18LLLs55g92vhX3s
	zUiEtitGRM1cvEfYKGJgTlalPu5tMHGn3b3POivDHum0Y+2nMHkA2DJro9t6kRI=
X-Google-Smtp-Source: AGHT+IGtbEJvc0pZFif8+rjy+/1MtcLrU3cLsbt9CAfpx8NrU6rjdJ01tQfYMRj5877jciysw2vZww==
X-Received: by 2002:a05:600c:54cc:b0:419:f630:57c2 with SMTP id 5b1f17b1804b1-421089f98d1mr89925095e9.37.1716890078820;
        Tue, 28 May 2024 02:54:38 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42108989fdesm136479995e9.25.2024.05.28.02.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 02:54:37 -0700 (PDT)
Message-ID: <3464a980-36a7-4ed2-b2dc-be8fd9091b06@freebox.fr>
Date: Tue, 28 May 2024 11:54:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
 <171560975908.1690511.498631481702370762.kvalo@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <171560975908.1690511.498631481702370762.kvalo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/05/2024 16:16, Kalle Valo wrote:

> Marc Gonzalez wrote:
> 
>> The ath10k driver waits for an "MSA_READY" indicator
>> to complete initialization. If the indicator is not
>> received, then the device remains unusable.
>>
>> cf. ath10k_qmi_driver_event_work()
>>
>> Several msm8998-based devices are affected by this issue.
>> Oddly, it seems safe to NOT wait for the indicator, and
>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>
>> Jeff Johnson wrote:
>>
>>   The feedback I received was "it might be ok to change all ath10k qmi
>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>   (and ath12k) do not wait for it.
>>
>>   However with so many deployed devices, "might be ok" isn't a strong
>>   argument for changing the default behavior.
>>
>> Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
>> work-around in the driver. However, firmware-5.bin is parsed too late.
>> So we are stuck with a DT property.
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> 2 patches applied to ath-next branch of ath.git, thanks.
> 
> 71b6e321e302 dt-bindings: net: wireless: ath10k: add qcom,no-msa-ready-indicator prop
> 6d67d18014a8 wifi: ath10k: do not always wait for MSA_READY indicator

Hello Kalle,
What version of Linux will these be included in?
(I don't see them in v6.10-rc1. Are they considered
a new feature, rather than a fix, and thus 6.11?)

Hello Bjorn,
Will you pick up patch 3 ?

Regards


