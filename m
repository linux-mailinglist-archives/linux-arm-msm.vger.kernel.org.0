Return-Path: <linux-arm-msm+bounces-23610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E56B9128FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65F1EB214B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ABF36AF8;
	Fri, 21 Jun 2024 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SpOHQkCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1602C6BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982544; cv=none; b=iEgzn5PuIv/YRGCJJPqpGL0fbj+LoQRgxU52ckIa9Q8bv8f/6I8nUmGQyTOE/b5yqY6dbaBwB/gzsVjvsLLYNoavlFwUDUShogkmCBhTureCyrvSQ0KnMMdJj0SCwWcn/Wnj+CAcHLrkzSJm9gy4rw1ECHAOCZ8pGzg8yod/WJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982544; c=relaxed/simple;
	bh=5rAiojQsTigWicXmeRh0G3zeGjSh5M2Z4R9eMuRP03o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onTQLvAhtmmic+lyn5empbFp57o4Qw5f6DgWZMpagCFO/GJUTEOuuk8mppj5qLGDV7sCyAqn4hpb/wf8oENG7pjCoTCZcnyyAQqxY67letYuVJynREQL/ZCyKCnTTqxJmO3X0dvWCAYUQrPslqTnYGzE1iT9uffUzpA88ANXc68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SpOHQkCR; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3627ef1fc07so1667841f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982542; x=1719587342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//HkFPNKhQCDrBklAqKNRQHsY6okQNFrsrBgpNJVhqs=;
        b=SpOHQkCRR6j/MSHjaghFG7HDGcYrS+B4p+kYGw8Rg3BeZkIKbH6j5/bGCmrp0rQUO5
         zdR+VqjpfrmBqKi6jJZuvRsJ5lrXuule5KFSn6rC5XIVdde2sh9cCMO05SwNnFnixOit
         30P1Bn7dfb7rYW6GgH73waanBeQPmSVMqdRaJHK5Kh02vHuXh8g2y6AtCj2FtZocmIyE
         qCfDQi8t/8EjJoxQ8E0vT8yyzLPVre+4ESxijWFBNB5MuODbqtlyGub649o0AxkGmEBN
         UI8lWhXrymPFNXAvG60swIxBUl0HaA1M/yeNRAdZwpAjLBpUHPtI2eEetlpf/6K1S5Gx
         phWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982542; x=1719587342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//HkFPNKhQCDrBklAqKNRQHsY6okQNFrsrBgpNJVhqs=;
        b=xUdqjHwtrQgNL4jWhiMd0Ej6p2Mz1A0nHMjSfT8ADlvhISUYtCe0PwBDk6Ge3tHRxg
         pnEi0qP20n4uMsdLqHOI2zGBrrKrAjnnJGbXkeXtBUhn/oAe3PViPLF9bVkokd9qLIqP
         M87+Lge0j7WF01UuZVhy+fpnHkN+m9P9LrBO7Ya4Erobn9yTra7hBfTRAqjclrlYgcBi
         DfPaGh2CiZGR9VMokhFv9+819rYJMNX3zT8WY+sWTBXtaK5B2oLOAFXz743u191IQLBM
         ynAfhMKqj98OszXFAekyF/HdHWoCwaE4Qo/yv4BzVSB7pP1L49oFw2JqOoBF8z9mT39Z
         pXyA==
X-Forwarded-Encrypted: i=1; AJvYcCWdRXANdC4/gZWz6GzLdNFdEgNobUzaGTf1uVg+f4gP54hsaFaBHCz1IK+VzQuT5jHMr/kW496gU+zETUQnezmyahxJ5625C88Fh0O4lw==
X-Gm-Message-State: AOJu0YzOs1muGqPPvDH6XMpOumH1VQuUlSMJudRVaVOUjZ4oriRmxKIj
	zN+8bK3mVb92STDMkxfS8nuanxyLezEUMbhe2WPbx/TXL0kzPwXYMSHc+B6flWQ=
X-Google-Smtp-Source: AGHT+IEGnNGgEhdZNo+A4PyZkLewBw+hk+J0cWFK1e7wUugiFCIuZNoRwrcESwM31W13TJnjrOc5VA==
X-Received: by 2002:a5d:64c5:0:b0:363:7bbf:efcc with SMTP id ffacd0b85a97d-3637bbff072mr7044215f8f.62.1718982541786;
        Fri, 21 Jun 2024 08:09:01 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f679bsm2001097f8f.81.2024.06.21.08.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:09:01 -0700 (PDT)
Message-ID: <b0785dc2-aa91-4b81-9d5b-f49bb1ab6fb6@linaro.org>
Date: Fri, 21 Jun 2024 16:09:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for
 CSID 170
To: kernel test robot <lkp@intel.com>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 quic_hariramp@quicinc.com
References: <20240522154659.510-7-quic_grosikop@quicinc.com>
 <202405232059.8lLokYw2-lkp@intel.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <202405232059.8lLokYw2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2024 13:59, kernel test robot wrote:
> Hi Gjorgji,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on media-tree/master]
> [also build test WARNING on linus/master next-20240523]
> [cannot apply to v6.9]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:https://github.com/intel-lab-lkp/linux/commits/Gjorgji-Rosikopulos/media-qcom-camss-Add-per-sub-device-type-resources/20240522-235220
> base:   git://linuxtv.org/media_tree.git master
> patch link:https://lore.kernel.org/r/20240522154659.510-7-quic_grosikop%40quicinc.com
> patch subject: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for CSID 170
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240523/202405232059.8lLokYw2-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405232059.8lLokYw2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot<lkp@intel.com>
> | Closes:https://lore.kernel.org/oe-kbuild-all/202405232059.8lLokYw2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/media/platform/qcom/camss/camss-csid-gen2.c: In function '__csid_configure_rdi_stream':
>>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:265:13: warning: variable 'phy_sel' set but not used [-Wunused-but-set-variable]
>       265 |         u32 phy_sel = 0;
>           |             ^~~~~~~

Gjorgji.

This appears to be a dead variable now.

I don't see a need to respin this series but, could you send a 
supplementary patch to fix this up ?

---
bod

