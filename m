Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B59E32FD41
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 21:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhCFUyC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 15:54:02 -0500
Received: from mail-pg1-f174.google.com ([209.85.215.174]:33284 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhCFUxi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 15:53:38 -0500
Received: by mail-pg1-f174.google.com with SMTP id g4so3764639pgj.0;
        Sat, 06 Mar 2021 12:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JX0pe8MwiiS4/nWwAiNWBVqVb4IpjNnUfNPphj4VFBA=;
        b=fTjL+he4kaNvxhZBGR0ywxox2MSrNFQdCkFe7obc2SIjRNwA9UtTHs2bE+z7EHRjgl
         o6JqWChgCPc/RxiL8J74JM9IaCclWizdKuX5uCs6nARJlBEJuHpkVLDD5dY4ERkpBRtl
         E54+tWhgy9oGSycMbaiJYZfLGcbmbra9WfDofGFAVG25/d4kVUWXONq/iQBgzIlSOJjg
         ApZfQV5E/dTqTDyzRlrQkTTpcUM8KZdlWjvivN+khwXzkj9u5ae+s/N9X0HSzdReFsw8
         hKkOjbiC/NYQAUuk5nu/hodunj3kJQGGizIRkIt++yDjprwxgw9pwMe3qicCOy741Dn+
         Hh1w==
X-Gm-Message-State: AOAM533tSUIdZVpCD3RNUDx7+3Qfvg5v5ph4TAwOUr/Uxao3zxwc2QKJ
        HQi15n1riJMHXs1CC7tnqQ==
X-Google-Smtp-Source: ABdhPJyTb704/0IwvHxpZxtjTxk7xWupPK0vGLkfynQ5p73/T49kRQaXybUw7cu5tsx3kitSRDQijQ==
X-Received: by 2002:a62:7ac3:0:b029:1f1:5d13:5ec6 with SMTP id v186-20020a627ac30000b02901f15d135ec6mr7613697pfc.14.1615064018258;
        Sat, 06 Mar 2021 12:53:38 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
        by smtp.gmail.com with ESMTPSA id d20sm4610747pjv.47.2021.03.06.12.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:53:37 -0800 (PST)
Received: (nullmailer pid 1195695 invoked by uid 1000);
        Sat, 06 Mar 2021 20:53:32 -0000
Date:   Sat, 6 Mar 2021 13:53:32 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 6/9] dt-bindings: soc: qcom: aoss: Add SC7280 compatible
Message-ID: <20210306205332.GA1194278@robh.at.kernel.org>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <8584e915f42405a7a4a799133a09d0d4aa65d2a8.1614244789.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8584e915f42405a7a4a799133a09d0d4aa65d2a8.1614244789.git.saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Feb 2021 15:00:22 +0530, Sai Prakash Ranjan wrote:
> Add SC7280 AOSS QMP compatible to the list of possible bindings.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
