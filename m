Return-Path: <linux-arm-msm+bounces-88296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C061AD0AC3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 15:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B3A0300A6DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 14:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DF45CDF1;
	Fri,  9 Jan 2026 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="laVuaSkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958933115B0
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767970709; cv=none; b=Boh1VgwfCCsBobjItDqLLcsYMk21dIIdz5Wy7bPKeACRvbSNJZHgIpSOIuTPG/ZxTkKxIMKSlDD8jIhmWBggBkFr4VP1AvHY//siRUaseKygAHHl+5rhWwcUoqFHmNBfWT0UI9Jcem4hEW4xO6ftXm94UOu6D5hiYIlV20bpucs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767970709; c=relaxed/simple;
	bh=beZLShpvCx6q40/gob7SBHTRFvOC3vhNmXrChey/qHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ltOKqY5UD6Bda9KFPrGOtZuD4IrbA3+V+1wWW4e6rxQpu52GLWSVs7JX/NHFDJZCI+1MvduOshPKCm+1XWIoogEOBV1cxnCaVAOuoS1+le4muuWULIVeW3XpwRfDvhlFIA9CI58T5qujDJ027EgRfNdS5n4x3IB8p9Mcyk0q4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=laVuaSkZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so25914775e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 06:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767970706; x=1768575506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3y7l6Oksk3QzETmQ7FC3JjIhgTCh90d664PehqE/z0=;
        b=laVuaSkZYsMQLD5cEQD9OZwcNVWOl7GZmJqd/Q672mvj72aTKPSJPXKeCFhytDYZUY
         MSvEXFuq5+2UhrXu0qSMWFHoZWAuS5cyWcJ+O/7ulkeS1UZAkuacJVkIc0maOtwmNu7u
         8KEOTxBHtiNvyMBR3sxpgPis524XguKbxIYiFsbzbKhTXY16dF/R+iOzCGXe7K3DklkB
         QSALVGzLlEFwoBO3A2sRNo8CG+Ofhl+/pG1BtMO/VzxItDN732vHjBMdhSJN6467r5Ko
         A6wzTf3RN1Da9K7eupWfZVCYvwGygLXzX8WWEpIUOnUXIQ3yg+0RrWfoOSd9oM+R4Rzp
         CmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970706; x=1768575506;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3y7l6Oksk3QzETmQ7FC3JjIhgTCh90d664PehqE/z0=;
        b=b0L3ZT1HSUmxjU2FY0ATUQ4jIvhg3n5La6P35Pxatj8WcOBB+phUc5fCZJsm7lzFpF
         KD1WAkh6KahNm7BjvBndY93YUPZ89GUB3ewT3GufEpocnHBHOg3rGbtddzPw8U1T4lDk
         /fl5BmpseUSVX0iQsB9sK1dfHhutG9LvPBqUoO8EOM0lTht75yYEFlelLVXiW2wiu2FE
         2rLAudqgDhnes+pWQQC6V8mdecxhIfYw5F2kEuAulfSmmNlHCB52oQxG3XduY3yjHtp3
         EK7ey37teTuDNAWF2RNfeHSGtF23/0W+L56PgmMGcN5EM8jvxdYE9j9C0qfueJK0gng/
         Vhzw==
X-Gm-Message-State: AOJu0YxS49eDsi6Vp5P7z50aIrc4WLfJH8A2nxQq4/eQ5XANOugblJfG
	zAiCq4/WfF90qlNfL78HiuMAh6kaTZzaBQ9avW5a8ShL3iS4QHhrI6iYe7M3G/6o02c=
X-Gm-Gg: AY/fxX40nj5Pw3MuNBceX9SZlcgsc/TfPtdxZyUwux4oLhqGzfjO2mwQf6BwQG1pmUG
	uLJpz+xVamZxwNtaUs/Luno5hkDpGlNRGegSXhdMsdL7EWYSUXD+9kqmNLETluAxDQEKruB9Yz1
	9DDPYeNNyyPGFv1pSfQ6T7Oh7drIdHnvQWbOCg6Bs/tgpKO2h9HWYI3u8w+01Jnp1nL52ADASD/
	bDDrtcFunMISqVmJre9ffjbVGbG1O5pYrN1pcUXMqY5ZeA0uJ5cJ99zfRKDMJCfP1BVGC77AtKU
	CbMfskANSCECSXwmrlaQpLPJKfTr0LcBoJtFOXv8b40gvJTiOnTIzI00pdHQYZY0RO+yLwHWqo6
	H6+8H1ByPEpwK8qk30cbO0br47wxaoN8c7OA0YfMBAARPO773LsFiov5S3RVn/GEWffKFIWZHGk
	1dZqITMacWkJaDV6FMLtMJU/nfw8aL5zbkA14sKj94+Ik35Ap+vHd9NPr1ycP+DPI=
X-Google-Smtp-Source: AGHT+IE10qtTTvpifNaH6iGjIokQigTLlrCWVS3rMBPmfZRI782VaqCSwvzKVAeRor6aTRGNE8/Bdw==
X-Received: by 2002:a05:600c:3b28:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-47d84b41bbfmr114581785e9.33.1767970705825;
        Fri, 09 Jan 2026 06:58:25 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8636cb0dsm75966465e9.0.2026.01.09.06.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 06:58:25 -0800 (PST)
Message-ID: <073784d1-d798-43b6-b6e1-baf818a66fb1@linaro.org>
Date: Fri, 9 Jan 2026 14:58:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com>
 <20251211-add-support-for-camss-on-kaanapali-v10-3-39e8874dcd27@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251211-add-support-for-camss-on-kaanapali-v10-3-39e8874dcd27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/12/2025 12:03, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

I'm giving up on this series, please rebase.

╰─$ git apply --3way < /tmp/\[PATCH\ v10\ 3_5\]\ media:\ qcom:\ camss:\ 
csiphy:\ Add\ support\ for\ v2.4.0\ two-phase\ CSIPHY\ -\ Hangxiang\ Ma\ 
\<hangxiang.ma@oss.qualcomm.com\>\ -\ 2025-12-11\ 1203.eml
error: repository lacks the necessary blob to perform 3-way merge.
Falling back to direct application...
error: patch failed: 
drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c:588
error: drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c: patch 
does not apply
error: patch failed: drivers/media/platform/qcom/camss/camss.c:34
Falling back to direct application...
error: patch failed: drivers/media/platform/qcom/camss/camss.c:34
error: drivers/media/platform/qcom/camss/camss.c: patch does not apply

╭─deckard@sagittarius-a 
~/Development/worktree/merges/media-committers-next-qcom ‹knp-test●›
╰─$ git-log-graph 
  
                                     1 ↵
* 84de87a909327 - (HEAD -> knp-test) media: qcom: camss: Add Kaanapali 
compatible camss driver (62 seconds ago)
* d6a22e0ea1d47 - media: dt-bindings: Add CAMSS device for Kaanapali (70 
seconds ago)
* 336367fab9b96 - (media-committers/next, media-committers/HEAD) media: 
chips-media: wave5: Fix Potential Probe Resource Leak (4 days ago)


