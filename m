Return-Path: <linux-arm-msm+bounces-124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49D7E4B38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 22:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A521A1C209E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 21:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6172F85A;
	Tue,  7 Nov 2023 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H69agnHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F82F841
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 21:57:29 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFBD10D1
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:57:28 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so87666261fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 13:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699394247; x=1699999047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FK647JTOvb77Maf2VTj+zONIf/6LvdRZnkupw91tgPE=;
        b=H69agnHWvFVT++YuBUxyhVyyDEO0NqyIjlSctOPhX093UG8r+DewbemJW2fcOgqKae
         Ub3gHCKh+3xXsBl53xq7je+C7Rp/MnCU8prJESjSVx68xkySYt1NXEqbI/jlU/86D1p3
         e6J1FQvDq982F3OxydQBsDO8reb9nJVWmPU+uyh4wJaScF/1veMsXVle8/fHf26XpTjb
         jaM52uw8IyMLm3Ft2qolCWY8UjN/Tk39H5Hl81ehrzIvEec9e5VjAqFjazaJYdMsBLTP
         9klhp8EKKp4eb0qgEBiksF0IkOaPltoZcGNH8o70yIZ7oPLn95mZVDgKHWnrUMzfbL7M
         vgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699394247; x=1699999047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FK647JTOvb77Maf2VTj+zONIf/6LvdRZnkupw91tgPE=;
        b=hKO+IWm9RcdCMoLIj7eJcOaL9ujoN262BImpzwwl5qRwtKMyhpVMOPuhxUh7qHwbay
         c1Iverg41YVRHOrbUkcaJJOzvzjIw26ZO1NzAkxKEj71L0FXGUcqQ5gPGxjMl6lYmQLi
         xeyHQ2ly+CN4hC4RyvxwnzPkjvKXJsOmqWj7i52RRUqfOW4j61JHATi82wSLw0+1Ohsa
         OMZnYKLU7Z3Jpeydtb4FDr/jW7INokFePKP631VHzrAnN3z+LXdElL+9pV8GuYZLfZW/
         YFC6PQqrNK4XU6/iVPjfjrZ7qHpDIrvnXfUlg5pCQUr21m/8C+YevAafpGA4BiRGrsJ8
         W3xw==
X-Gm-Message-State: AOJu0YxxdOjohc51MHFVf16vQ8Vj77NLeSWVkAZM98r0ZZz9FKHsO6fa
	RURg+rc3/7ZuZ1Pc8haDwOOepg==
X-Google-Smtp-Source: AGHT+IGYyAg9ZJkuOrbMHatl2BVJxk8o6k2iosy2VGIvJ4FeYqR6CRHdhVaeJZCe9djWbe++GOivMA==
X-Received: by 2002:a05:651c:324:b0:2bc:bf29:18d3 with SMTP id b4-20020a05651c032400b002bcbf2918d3mr192132ljp.31.1699394247074;
        Tue, 07 Nov 2023 13:57:27 -0800 (PST)
Received: from [172.30.205.109] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a18-20020a2e8612000000b002b9bf5b071bsm1611555lji.20.2023.11.07.13.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 13:57:26 -0800 (PST)
Message-ID: <8a12ccba-908d-405a-8fcb-411d50a66ebe@linaro.org>
Date: Tue, 7 Nov 2023 22:57:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] phy: qcom-qmp-pcie: Add support to keep refclk
 always on
Content-Language: en-US
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
 quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
 quic_vpernami@quicinc.com, quic_parass@quicinc.com
References: <20231107-refclk_always_on-v2-0-de23962fc4b3@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231107-refclk_always_on-v2-0-de23962fc4b3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/7/23 13:26, Krishna chaitanya chundru wrote:
> This series adds support to provide refclk to endpoint even in low
> power states.
> 
> Due to some platform specific issues with CLKREQ signal, it is not being
> propagated to the host and as host doesn't know the clkreq signal host is
> not sending refclk. Due to this endpoint is seeing linkdown and going
> to bad state.
> To avoid those ref clk should be provided always to the endpoint. The
> issue is coming only when ep intiates the L1.1 or L1.2 exit and clkreq
> is not being propagated properly to the host.
I'm gonna sound like a broken record, but:

How much power does this consume? Would it matter if we kept this
clock always-on for all platforms with this version of the phy?

Konrad

