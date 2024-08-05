Return-Path: <linux-arm-msm+bounces-27899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E84C9475C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 09:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F171C203D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 07:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F691487CD;
	Mon,  5 Aug 2024 07:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWR6pc4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2873C146A67
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841779; cv=none; b=XHdJ8bvA1ApUxv63Xk4MrIquKpXh1fuJDCE/iw0teBIVU/8JrhuMruSIf9k5emuWUhkLI0JmG8/VyyUp+dt8EZ7QM9Hk8wnpw5RTJ73Sydvou19UdC7+Wyk6qhC8plWu8jCH5lfUKFCJMgC8v8pj1oL9iVEuwRk6qXTYxpLQ7AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841779; c=relaxed/simple;
	bh=yVwcVD7Xn+Cm9X+VuSEAjO29KUBpGnrQh6fHfuhfBQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bY8ypdVRBFLgGSXONl5asmZLmgEixsXAd/baD5gkYchBNgmu2AlnG5D7GK5yQ8tJbRja8F1ldyTx2D8EZ67m1Eoxl2NDTM3r/WmKsR7ZY7Em13qUMZglTny054/7sV57nqFQpktldUeMHGNnMu7ja0qRIZc5kRSjKZhIB6b9Qj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWR6pc4W; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef18ca13f2so19843751fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2024 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722841776; x=1723446576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhjgNoYXL6CCBxOF23Z0ViDRqzy0AERmoqKNZ6NN4s0=;
        b=FWR6pc4Wda7LFQ8Ma2VtNJLdcVaIn7p7h0CoMk3J0A2Jiib/nNoOnZVXnsxdqibe0T
         1umO/HhYkVJ315/VD+VMfji06quVEYEp6tRs/aNAfJ3Jm2poD3BKZw9vH8OIjLfkcEF7
         mpzAiMxwHsBCOhBxPqGRPO2/0FLUMY9vZc3/TI4KknbfO/PohSWAlpZLxESOgpOi57XA
         rPIFS8+tkdSTWMJf+98cVE6u2n1vQn8w0z2GX0joUHrwXXoiTouFu9YPN+JcEd3eBQxn
         nmwsDVAzyULOPebH8EngDkkiQjacKJ46AxS/wmveAy/EBvb2eSbvo18U8o3pavEQd/hJ
         iRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722841776; x=1723446576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhjgNoYXL6CCBxOF23Z0ViDRqzy0AERmoqKNZ6NN4s0=;
        b=I+vvRzB4NMOvA8xV000iQKINT1MCMnZ3LAwYr5Bxj3ytwEa8uUH1nj+5nKVq4L28p6
         8ppjVzkJ+qytvyGLwNOeG2tnliZc2bymEN4qq/CdCTyCI0mUIhJwpb1fCFXNW7Qm3kE0
         90+Zdn2WJzsN7SAN+ARoQ6DzU6lRweJW4Gt+B3iHrwFzHBxcJjo7vIJQxHd6/1IVMUYM
         utlYEqoCQZd+0+e9/Ba1F4+EId8YsjRfvyYVo1Pt4FQtAan/WIhBKdMH0KpFdoEEyD3H
         tg1KgetCH2wnPMEKEYTZAV05yySNpg/YyuHuQcyaZxDY/HzO41FW7WOwOMASzR4oK9rg
         DHkg==
X-Gm-Message-State: AOJu0YwBPgoT4+Df4pBB/tJlrS3ir/wfej4wbvRQe3qJfjjXFn4qiox/
	hyY9/vrZLcf8dQebRo/UjpLmbM0m7/TIUuj+PxDJbzH2otjEhfrU2nL/167tWiE=
X-Google-Smtp-Source: AGHT+IFD9+QWaaf3rFR05ekcR9D6RVYzcShU82Qk5i/JTWIVasuFslXHM6RL1NBBFkMkpdGZ8j+uiQ==
X-Received: by 2002:a05:6512:2811:b0:52c:ce28:82bf with SMTP id 2adb3069b0e04-530bb3b0e3dmr3983699e87.5.1722841776156;
        Mon, 05 Aug 2024 00:09:36 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba1102bsm1028530e87.97.2024.08.05.00.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 00:09:35 -0700 (PDT)
Message-ID: <52cd30a1-78f8-4b12-8b33-eb33598b6812@linaro.org>
Date: Mon, 5 Aug 2024 10:09:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sm8150: Fix the camcc probe
Content-Language: en-US
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, kernel test robot <lkp@intel.com>
References: <20240805063049.446091-1-quic_skakitap@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240805063049.446091-1-quic_skakitap@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/24 09:30, Satya Priya Kakitapalli wrote:
> qcom_cc_really_probe() API's arguments are updated to use struct dev.
> Fix this function call in probe by updating the arguments to use dev
> instead of pdev.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408012234.vggzO9in-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202408020044.PEGwUAFE-lkp@intel.com/> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

The problem has been already fixed by Bjorn on clk-for-6.12 branch, see commit
e997b400c846 ("clk: qcom: camcc-sm8150: Correct qcom_cc_really_probe() argument").

--
Best wishes,
Vladimir

