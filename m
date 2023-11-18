Return-Path: <linux-arm-msm+bounces-1037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B62727EFCE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 02:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E80EC1C20914
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 01:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A61C10F8;
	Sat, 18 Nov 2023 01:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXIx+jGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771DD85
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 17:12:01 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9df8d0c2505so490996466b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 17:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700269920; x=1700874720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kznQGdnKp7IkQ8MKOzkfhU/0N5qZreYJJbTGlRYKUQI=;
        b=iXIx+jGMIYneeDk49eVZKdDH4no1TUnprGpktK/CDtwyZrf17oIL91K4jiAVLyxYZL
         D6pF+Sa2aHI+VJ/nwz7ClLP6A99heICjAjG7dxjc4AnBFaXR4Br/6PtqQk+V4WJ95Gl8
         1jdHh46UZGNx+DxUhOJJ6xPw76cGc+0nLgt3bmYXVGjM8xerb3M1A0OXcrfJbxVW3Kus
         DSdKxDu411K3kzwFBDUBuMH7WYL0pxyx0B8dWsfUcAscm4blfChi5KtKT96V+xdKq+K9
         VEQrg+zZnwL1ezPo+cSCkcpzdp76QUA1MGjqdqa2/eOxwRKqczrJ0fmuHhsrS+RjPdxO
         NVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700269920; x=1700874720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kznQGdnKp7IkQ8MKOzkfhU/0N5qZreYJJbTGlRYKUQI=;
        b=n6VtivfnnDNTku9HPmeGRSJG5kZ4OA6SIoRvf8/CJh5FSDZPgHYb7CMEXhOsl4e5mg
         Ny3wm48F6gbIG7F31R7bkhesDD71OKfbcRwezpr/RDQ/F9c39zMCxFQGEWDbfCS3fg2F
         /nKiv2sjAFrG/tVMSCgp7+5LPaJ6+AmKanC/FeE01B4SyAGZMmcIKra38/lBoHFnQ8Kc
         VuufoRiYYh2iqrkFxgmelVhOT5WpIkL1zLt+umhjLo5jNLGzqO5e5i+SiN1PZItCVhqE
         IHqkWTPPq38NmOVeco0HlI+j2i3O4dv8vpxGRIn6UaEE1oNzLM6fdUnYXYj5Nlj4YkIX
         XNVw==
X-Gm-Message-State: AOJu0Yzwlf/oNLke+UDsE2WYjUzGT+1kgkXJ6XBL/BNgHDjrWNXEtQnm
	NCQ3lcDW3VJb7MvjZl54qT9JQQ==
X-Google-Smtp-Source: AGHT+IGUoSVDnk5HoyAi1k9WsQ4XSWw6+gRpaUWTU+8itDXK5E2kpT7IlrP5Kz6pLvuK/IM6lbbkWQ==
X-Received: by 2002:a17:906:196:b0:9b2:be2f:e31a with SMTP id 22-20020a170906019600b009b2be2fe31amr772091ejb.31.1700269920001;
        Fri, 17 Nov 2023 17:12:00 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id f12-20020a1709062c4c00b009ddcfbac9e7sm1344347ejh.84.2023.11.17.17.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 17:11:59 -0800 (PST)
Message-ID: <75d5a65f-4ab2-4bc8-a177-688b590f3bb8@linaro.org>
Date: Sat, 18 Nov 2023 02:11:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add base qcs6490-rb3gen2 board
 dts
Content-Language: en-US
To: Komal Bajaj <quic_kbajaj@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Naina Mehta <quic_nainmeht@quicinc.com>
References: <20231117125056.32503-1-quic_kbajaj@quicinc.com>
 <20231117125056.32503-4-quic_kbajaj@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231117125056.32503-4-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2023 13:50, Komal Bajaj wrote:
> Add DTS for Qualcomm qcs6490-rb3gen2 board which uses
> QCS6490 SoC. This adds debug uart and usb support along
> with regulators found on this board.
> 
> Co-developed-by: Naina Mehta <quic_nainmeht@quicinc.com>
> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
same comment as p2

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

