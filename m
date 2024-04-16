Return-Path: <linux-arm-msm+bounces-17593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 616658A6E4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 16:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 862D81C22743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 14:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9882212E1E4;
	Tue, 16 Apr 2024 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKDDK3Gr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6493B78D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713277944; cv=none; b=hNuyfRc8mCKRWvZuDrpVV9ftBb8lN45avX+aQuaPgZQAhdSbNZWtjprQmDCKRuQdUdKrtFhLAp3B9vuI98Vd1SWcmfECFWaLJV3FWzi8qYI4fAD8h4p9cZV6bC05UelG7bWajHA6mVr8rZ57/GyF5Ji7H+iq1MR3fqBsMLZ67wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713277944; c=relaxed/simple;
	bh=TrhX1jGQhTu2KIAciBeO1h+2JzMMjX7NZgRCla9EyWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpB2sriKVP9FgS68nRdoaHZmzkuo4PmUFvk0mPdBsjrEo9efMb6SSzI57VQ19TFM3VuqdlG3NzFUb3EYi4Xd8cSTL2DbxYZiL7EsJTLG1kpHUpJJXK1ui4UL2Mgd3mMvmnBjeBrQUyYQW7Hmum2ZJsP2hN8REwhIiJ+mzSuUIDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKDDK3Gr; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518c9ff3e29so3004103e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713277940; x=1713882740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q5Zyzq1jaXk2PTeBnsS/HFR/E4JVz+BBU5ff7XaF+Dw=;
        b=bKDDK3GrYf4UfsxAMK8VpGZ2ZKJeaYNnJkBzL+ZmgIyU5hfp3QZzb1ZmkWE2xz1r21
         f1L4WiVR0vlml863tNPD0zHCKbylnSKnUdMZdlr479PWBmFs5mDVt47FZatTyHH8ex+A
         6yhlNlvutupCwqauiHVRYzWWrGw5/faAzTRSeCsNx/KWn109+aIMbqFsxqiRd/qB+PtC
         FwNvl75qDSwcgdXwsTSEVO4FheHP4yvGeDzuvkydO+BOqqNYhFUS4G0mH4M9KCsbJVVh
         b+8NVj5P+7bRi/lE8jzoK8uoiQ5BLz/z+LhBAEflD18fy0yJ+RMJHpCeXdeK+HMqS53T
         Xekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713277940; x=1713882740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5Zyzq1jaXk2PTeBnsS/HFR/E4JVz+BBU5ff7XaF+Dw=;
        b=BhuXKHSlJ/EOhXwQJL/Q90f9iShr0g/bx5bAd5uBzzX2amsJmYOM/786S5qjyd57OT
         nB5uHNq7UKFs/+sEYkKgRiY1MgnLcB4/BsA9ioCE1TEVHoiclvhfnXcyEu8r5RdxErC4
         z6afvl8wS+734WVcyVZNiwUmpj25md5hNPgZn5xvK3GTzEz+TIsPBW6SP6Fc5Ee9pDT2
         XAfFpu3KMuvxlDwTMpCM04gkeAo+8FiOOEi0X0m/Di5d9Nun2fw3jfjeDKbpy6/o441h
         0lPezziwLCfkAVF0ynNL2tq3h6q9+Of6gedL+nnG3ky1rv/DE015jkRVOx0tp6aafSbX
         JV4A==
X-Forwarded-Encrypted: i=1; AJvYcCWRsnfnPP/nXIQ/6RrYdz6nM6Myl4ACoaLldrzQ2DTcJz6h1GSvouGANHlyi8b84Nv8bJ+90wdi2c/kMyVW7S0nzi9FR0jpQYVswhedDA==
X-Gm-Message-State: AOJu0YzIV9svqyEsj1/7AkmwzMsWfNw8+jX3aYz7u4VbohpuTWmyJ6sp
	Bjl9lLVadChE/GRTPw3Kzlv6mLe1i2NzjTXcDwlvLZ5Wz/s+UmrAUJRT933+TiY=
X-Google-Smtp-Source: AGHT+IHgRG8rLgID4Qny4NHJoC2rlBQsPSp4jOqaP3Q5e3/gt0VA66TrCMy+WlpbvQARubScC1KY0Q==
X-Received: by 2002:a05:6512:3e0a:b0:519:2a88:add6 with SMTP id i10-20020a0565123e0a00b005192a88add6mr1250650lfv.55.1713277940250;
        Tue, 16 Apr 2024 07:32:20 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u9-20020ac248a9000000b00516cbd3e982sm1603141lfg.178.2024.04.16.07.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:32:19 -0700 (PDT)
Message-ID: <c129b349-dfaa-4b10-9b8c-6098d04b9373@linaro.org>
Date: Tue, 16 Apr 2024 16:32:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] usb: typec: altmode: add low level altmode
 configuration helper
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-2-890db00877ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-2-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 04:20, Dmitry Baryshkov wrote:
> In some obscure cases (Qualcomm PMIC Glink) altmode is completely
> handled by the firmware. Linux does not get proper partner altmode info.
> Instead we get the notification once the altmode is negotiated and
> entered (or left). However even in such a case the driver has to switch
> board components (muxes, switches and retimers) according to the altmode
> selected by the hardware.
> 
> We can not use existing typec_altmode_enter() / typec_altmode_exit() /
> typec_altmode_notify() functions in such a case, since there is no
> corresponding partner's altmode instance.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Should this now be called from e.g. typec_almode_notify to limit
duplication?

Konrad

