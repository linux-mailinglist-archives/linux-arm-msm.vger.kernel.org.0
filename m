Return-Path: <linux-arm-msm+bounces-2144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BEB7FA770
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 18:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24031C20A39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DB73454F;
	Mon, 27 Nov 2023 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7EB3C16;
	Mon, 27 Nov 2023 09:02:23 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ce2b6b3cb6so2739406a34.3;
        Mon, 27 Nov 2023 09:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701104543; x=1701709343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egdCKcTL5F1nxl2XwDwu8DS/+z9OxCWFUwjLPJGVEYM=;
        b=urHBs7tqGEgjp5TNs8Qa41tId4Fco5Y8T4iJs1dYSx30hJ1duG9k+k28ZrDBi7ofwd
         hsXtTmrHrOfMAgVLegk4/12Y4+R1+XRmYH/rYW9gt6VG1WLqZLoHE2OoXjbKBWyTR8B5
         FCCyFIkn5mgALEuY3MoCmrLSptDKBt0bfbbLs+0aXQ+8wylZbxC29HDy7FBiaiZo5Mhq
         Biuz+MONScMgPud3qt7d7bQGTxvzlDYuPNn8nHRcvJ2988Z7yl9Tm5aUGSv5F/BFTQgu
         5bj08/r+YshEmVYc2nrYqQ6DLaPj12OwH/wSAqmCSXqXzQs/MGWdwOuzstZVVYY8kWN5
         CW0Q==
X-Gm-Message-State: AOJu0YzwORhZKnTfcmW8Cq7mYWKHwsBMdmdk6MasKh3pxtEzNan+9Puo
	ys31yB0jpJEF//3Oi2E7ZrDJBXXMyA==
X-Google-Smtp-Source: AGHT+IGu7+X9A7HDeL5cLIqKrFNpUqAS8XGhG7FU7efpiBVxtKmwRfmvKUAtyTz1NNkDSJZWu0usIA==
X-Received: by 2002:a9d:6944:0:b0:6d8:11f1:de4d with SMTP id p4-20020a9d6944000000b006d811f1de4dmr8299962oto.32.1701104542837;
        Mon, 27 Nov 2023 09:02:22 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i14-20020a4aab0e000000b0057327cecdd8sm1529024oon.10.2023.11.27.09.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 09:02:22 -0800 (PST)
Received: (nullmailer pid 1424446 invoked by uid 1000);
	Mon, 27 Nov 2023 17:02:20 -0000
Date: Mon, 27 Nov 2023 11:02:20 -0600
From: Rob Herring <robh@kernel.org>
To: Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Conor Dooley <conor.dooley@microchip.com>, andersson@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, konrad.dybcio@linaro.org
Subject: Re: [PATCH v5] dt-bindings: interrupt-controller: Add SDX75 PDC
 compatible
Message-ID: <170110453222.1422827.15955753691131343417.robh@kernel.org>
References: <20231117082829.609882-1-quic_rohiagar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117082829.609882-1-quic_rohiagar@quicinc.com>


On Fri, 17 Nov 2023 13:58:29 +0530, Rohit Agarwal wrote:
> Add device tree bindings for PDC on SDX75 SOC.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> 
> Hi,
> 
> Changes in v5:
>  - Rebased on 6.7-rc1
>  - Removed all the applied patches from this series.
>  - Link to v4: https://lore.kernel.org/all/1686311438-24177-1-git-send-email-quic_rohiagar@quicinc.com/
> 
> Changes in v4:
>  - Addressed some of the dt bindings check mentioned by Krzysztof.
> 
> Changes in v3:
>  - Clubbed all the dt node into a single patch as suggested by Krzysztof.
>  - Removed the applied patch.
>  - Addressed some comments from Konrad and Dmitry.
> 
> Changes in v2:
>  - Added the CPUFreq support patch.
>  - Collected the Acked by tags.
>  - Addressed some minor comments from Konrad.
> 
> Thanks,
> Rohit.
> 
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


