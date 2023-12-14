Return-Path: <linux-arm-msm+bounces-4800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E04F081385B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 18:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D906283173
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 17:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D558065EC2;
	Thu, 14 Dec 2023 17:20:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68675B2;
	Thu, 14 Dec 2023 09:20:54 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b9e2d50e61so5879696b6e.2;
        Thu, 14 Dec 2023 09:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574453; x=1703179253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bRpMT8adyLjuk8v3m+Q7iMZxQW0r3mgWAJ3z5hKZNg=;
        b=mdeiyd4ZDe2FlWjP/JQ6cadgInN4sJEUifOxPSTf43IT2GElxyu/KO8nYwLxHvHACz
         PrusoF3mplullW7N32VHhw9+zlnRrcG955NRnGKhZCa9c7mLpseNDGGA9CeWuuUHPHdV
         pgWvMW5V/i+uAiuz99Ti0SimMuIo0md4QI71enyl9hhTFhKpobLOMzKqa5LkebNRmvVS
         fiDQbbQzZN7a7KluoTdIFslS+uvUAlqzUW4zh6lPcDeCy9FpcuqUbRB2xAp8AUBGz2Gu
         Oq6S6mLWKlVIJyT4vPDz3QCtBPSec0DrUtOh8ZKp2Psz51Z7dFIdmgBSAM5zUuHAclbN
         /QiA==
X-Gm-Message-State: AOJu0YymwRzFgNoSZsAc11dgnMxZYglnvLTUqAhLIZasteL5LWK50b5t
	JqW18Tl+lyGndJOMy/eTggU1Q+73+g==
X-Google-Smtp-Source: AGHT+IFG1H7d5qx/OPE9NFJC6FAAQwsK89rA2Zqb4ztseS1evSpGKvGvToAZ/lZKGdOpICFILPvMYg==
X-Received: by 2002:a05:6870:4209:b0:203:56f5:5a29 with SMTP id u9-20020a056870420900b0020356f55a29mr895478oac.16.1702574453615;
        Thu, 14 Dec 2023 09:20:53 -0800 (PST)
Received: from herring.priv ([2607:fb91:e6c7:a40:1c2d:b875:912d:c28])
        by smtp.gmail.com with ESMTPSA id so10-20020a056871818a00b001fb1f2c424fsm4597941oab.45.2023.12.14.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:20:53 -0800 (PST)
Received: (nullmailer pid 614807 invoked by uid 1000);
	Thu, 14 Dec 2023 17:20:51 -0000
Date: Thu, 14 Dec 2023 11:20:51 -0600
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org, sboyd@kernel.org, mturquette@baylibre.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/16] dt-bindings: phy: qmp-ufs: Fix PHY clocks
Message-ID: <20231214172051.GA611674-robh@kernel.org>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
 <20231214091101.45713-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214091101.45713-2-manivannan.sadhasivam@linaro.org>

On Thu, Dec 14, 2023 at 02:40:46PM +0530, Manivannan Sadhasivam wrote:
> All QMP UFS PHYs except MSM8996 require 3 clocks:
> 
> * ref - 19.2MHz reference clock from RPMh
> * ref_aux - Auxiliary reference clock from GCC
> * qref - QREF clock from GCC or TCSR (since SM8550)
> 
> MSM8996 only requires 'ref' and 'qref' clocks. Hence, fix the binding to
> reflect the actual clock topology.

Breaking the ABI is okay because...? Please explain in the commit msg.

Rob


