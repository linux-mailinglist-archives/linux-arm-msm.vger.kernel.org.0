Return-Path: <linux-arm-msm+bounces-32328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80512984A30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 19:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DC3AB23B67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 17:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1E51ABED7;
	Tue, 24 Sep 2024 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qdys5jPX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFD33612D;
	Tue, 24 Sep 2024 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727198174; cv=none; b=FbFTahfe06H6zi5tkqcDbKWu4L7AFe6KgWmSGF1wYEN6sV7TSHpPGSK37ypmBp/VxgzCDy5kWq1R5IRonMiurkTiDOEhEijZifljG/D00pboZLuEaUVpG6qiQDcRsoUJcsHZ5SkK4jq3xUtYRe/iywOWYCp8bBKHovRoYbQwxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727198174; c=relaxed/simple;
	bh=aVrYjTE1AeKemCQUeLfIG9BcOy/UUIT0nHD5ul5c9J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iYv9l9lDa3qn9b6xeq4zEMNVQuD7H88PMhLOnEhADi32N59WDQL8ybIK8wmbZPZIWN2dk5QsdmXpO6b16las8oy/JkXVSPIaKtypSHcm+fNRcag+jo52wjFhl+809w7g6ozauuHnlNcZYcYipltxNjvGBDrHIVs/iqxES3cZzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qdys5jPX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374c6187b6eso3239661f8f.0;
        Tue, 24 Sep 2024 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727198170; x=1727802970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/uSghqd96C7l/OunFvy1iybnF5kbktIvJLSUNcyMiQQ=;
        b=Qdys5jPXWSA8caWop5al7JJ/IgRUZuxzPm7i1hoVv7a6Eq6ZnAOaRtyl79sq/Z5OWF
         FDInX7mnof2FRLPJz3dG1DxXIpp8fur0S9ijafkOqFRMGwqlYw9FKMz/cDKwiElhFtY4
         VxMEo+3z0RGbUFvbekGLaa+lDPaEp+0ImUplNrqdJmOY0pS53Mb72P6NtA8OwIKMX/CZ
         dzhRBrgVGNmZHNh74+5WZXkqiGsWp+6eJ6Z5kxg4sjFZ5icmTPJHSMj8J7vZU7XyR9fF
         YiwwJhHVa4Uv/LlrPDIjj/RQABa1XEmoL35GWFpLeAgGAwgrciIRObqr9bZOsnY0/AtC
         GgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727198170; x=1727802970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uSghqd96C7l/OunFvy1iybnF5kbktIvJLSUNcyMiQQ=;
        b=i4XoV6tl7FdxxYAuQ0vhL/E7lGve+2le1NNOJpD533CDVHM7B92mAZ7KcEkuhl0Knz
         0UfS3GhsjnrzKBdB2CYcOkg8w8LWfTw0CBUSyd3daMR5xlsaeDDRNUFQLwsaAOMCUNY+
         uUpXq64iFU9ShKigX8tk5uXoj4RAb1V4D7+ABGQ/aewo5neHGcBAK/6O6LocK+c1FEpk
         HqCjHsx+B06CuWngyjwOYtH26VNNIsuAgH8fspFooom4NOaVVq9hivD/+pmrJYOB6kuP
         he7BNHwuONUN2rA2/VLIRQxKy24dlMP0Lph9BFthN9k7OyFe3yLxpVQaV1LpeyY4+i2e
         bEIw==
X-Forwarded-Encrypted: i=1; AJvYcCWAhEgD1ufbgckxdeASwmGULWGQQwz93MOsxyPktUE+fN/Zn3o6WSBJJy/PfNWsW4p0Na1VYwcx8gxFMzQ7@vger.kernel.org, AJvYcCWxr+ye80YUIHxYiMbxlp5nVXj/2bomvcwfGaCEMVgLmx0M8fAa1X2EGjDFxZWx5rp6jV7FaDLH@vger.kernel.org, AJvYcCXGNBIPb5nBjPCOYkCp6BEBSBUHWwA3FI1rSwtfBVE91a8Z3xfecfYIKEtlkEGexvJ0P+PwuWz+NgWxycEr@vger.kernel.org
X-Gm-Message-State: AOJu0YxejNc+VlHz9ZPhtC3qKDqaB/b0Vso0dA6w9i6Dd4Mrxrqc0n55
	iVPwYymcScd72loTQQxUp7EGVET324WG3/OjIxjYJTKueE5zjJ8n
X-Google-Smtp-Source: AGHT+IGqoUune5iXPKKrE7a8T7Chi+xhSRuKaoqHbtybfaTorDC397J1k7dDnr3YO2XslotYsrsflA==
X-Received: by 2002:a5d:6089:0:b0:374:c03e:22d4 with SMTP id ffacd0b85a97d-37cc245b08emr111181f8f.1.1727198170241;
        Tue, 24 Sep 2024 10:16:10 -0700 (PDT)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8c0esm2114876f8f.5.2024.09.24.10.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 10:16:09 -0700 (PDT)
Message-ID: <95bdde5a-b09d-48ad-98a2-2bdeffc7a567@gmail.com>
Date: Tue, 24 Sep 2024 20:16:27 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: wwan: qcom_bam_dmux: Fix missing
 pm_runtime_disable()
To: Jinjie Ruan <ruanjinjie@huawei.com>, stephan@gerhold.net,
 loic.poulain@linaro.org, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240923115743.3563079-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20240923115743.3563079-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.09.2024 14:57, Jinjie Ruan wrote:
> It's important to undo pm_runtime_use_autosuspend() with
> pm_runtime_dont_use_autosuspend() at driver exit time.
> 
> But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
> is missing in the error path for bam_dmux_probe(). So add it.
> 
> Found by code review. Compile-tested only.
> 
> Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

