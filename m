Return-Path: <linux-arm-msm+bounces-4045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345D80ADC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 21:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23DC0B20816
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 20:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038395732A;
	Fri,  8 Dec 2023 20:25:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649CBAC;
	Fri,  8 Dec 2023 12:25:11 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d9e993d94dso681494a34.0;
        Fri, 08 Dec 2023 12:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702067110; x=1702671910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr7zkwOoLBfyCLCg94nAiJAmi03dFdCpOu33YZSALko=;
        b=A0q0PIMIUaVbQ+k9R1FNkAa/zb+guzECDyWZJhopeVHz5ztsJyvZuUR2CbXAUBiWxM
         AM3eq3kzDhbMRCeweQupP6RQybcVNbMhOCwtZpTiqgF3pkaRmpwspxRZwQ7e1FTnzUd5
         Bm7lEUtpLxd3KpO6k/+uSjUZkKeqrgH8OpTLsnzssB8jMjSizZtAOhP14Ey0vD5PbqfY
         vjPah+UMTN7tAixdYva2rMbAkuYhusL4JOqyrgjY5EE9fYsLUcyryHbz5/ixyBziZCvx
         m2Ht6Qiok8QJe79KWbILgd3KoFP2UrENpuFFR5sEURQpBuc8ugY5r2fO0bqvuG1uFPl2
         HBYw==
X-Gm-Message-State: AOJu0YwFy+YOF8OJT9fZ95SoHjk7u3fcftD2/RFHQj/NoN11219B3Sl2
	2V9W6UAOUYnVyhQolHR7QA==
X-Google-Smtp-Source: AGHT+IH0RixrzN+ybNdY6v5BHDJrNsRlLfRmnS5EWbdDjN4Jy1s3zqAP9zg37VcDTJnKQ0TdII77Dg==
X-Received: by 2002:a05:6870:c192:b0:1fb:75a:c414 with SMTP id h18-20020a056870c19200b001fb075ac414mr783695oad.61.1702067110619;
        Fri, 08 Dec 2023 12:25:10 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id iv7-20020a056870b9c700b001fb3240116bsm571502oab.7.2023.12.08.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 12:25:10 -0800 (PST)
Received: (nullmailer pid 2645496 invoked by uid 1000);
	Fri, 08 Dec 2023 20:25:08 -0000
Date: Fri, 8 Dec 2023 14:25:08 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: James Clark <james.clark@arm.com>, Rob Herring <robh+dt@kernel.org>, Mao Jinlong <quic_jinlmao@quicinc.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hao Zhang <quic_hazha@quicinc.com>, Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mike Leach <mike.leach@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom,coresight-tpda: drop
 redundant type from ports
Message-ID: <170206710810.2645438.5895151737393865069.robh@kernel.org>
References: <20231206115332.22712-1-krzysztof.kozlowski@linaro.org>
 <20231206115332.22712-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206115332.22712-2-krzysztof.kozlowski@linaro.org>


On Wed, 06 Dec 2023 12:53:31 +0100, Krzysztof Kozlowski wrote:
> "in-ports" and "out-ports" are defined by graph schema, so defining its
> type is redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


