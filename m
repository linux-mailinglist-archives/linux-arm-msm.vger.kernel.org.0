Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDDC21A926
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 22:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgGIUik (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 16:38:40 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:34197 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGIUik (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 16:38:40 -0400
Received: by mail-io1-f47.google.com with SMTP id q74so3782811iod.1;
        Thu, 09 Jul 2020 13:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ifuWKsHEKc4eVItwGlNDQiWrJ8Y8Ekt4slSt+PSzbYU=;
        b=c7awSw90uwm/R/OXf1uhvJHmfxvTKJ3cLXHyuOsN0ZlcOXtEIEX/rds+D3LIAzUSjf
         e9s3yz03ck8MtJcN4RU8unWecuaZy/zeKD9CIAG2809Ff/bm9xAHy0Fts+WgC0N7H8t1
         jedrqx+EvWQx3Me0HxYr9ZC+oX1Gi+6bUjZA2FaEext8h7yINv0xmGIJKgXB7Di5PlBW
         iczWpD+y7WBD49WTAw12GO8J1JhvSWUhkVi25Z0gzLccLbdcCpBVlwdtFKF62awbY6Fs
         iLgRa9taqS9OROjs8n3McdPgUcTULfGfAWoBYRo9Ndb4r8mb6dPlV9VS1h73obXOl65V
         1P4Q==
X-Gm-Message-State: AOAM532dxLhCe4z7cVgGRixnLNQkHZicRwtCFgHvouN/7pHIf4hzzgoh
        L0t7OzWhJ/HiYpCYVcY+fQ==
X-Google-Smtp-Source: ABdhPJxqSqxe8SCErlwssNDBuHB9sBW34r9IvjtCU2AySZgYTe+VQHzoxn9WKCPyK+3LRNFV/56xEg==
X-Received: by 2002:a05:6638:14c5:: with SMTP id l5mr73205355jak.134.1594327119278;
        Thu, 09 Jul 2020 13:38:39 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id z20sm2685967iot.15.2020.07.09.13.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:38:38 -0700 (PDT)
Received: (nullmailer pid 848114 invoked by uid 1000);
        Thu, 09 Jul 2020 20:38:37 -0000
Date:   Thu, 9 Jul 2020 14:38:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     sboyd@kernel.org, linux-arm-msm@vger.kernel.org, agross@kernel.org,
        govinds@codeaurora.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-soc@vger.kernel.org, bjorn.andersson@linaro.org,
        sricharan@codeaurora.org
Subject: Re: [v7 2/4] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL
 binding for QCS404
Message-ID: <20200709203837.GA848063@bogus>
References: <20190726092332.25202-1-govinds@codeaurora.org>
 <1593766722-28838-1-git-send-email-gokulsri@codeaurora.org>
 <1593766722-28838-3-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593766722-28838-3-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 03 Jul 2020 14:28:40 +0530, Gokul Sriram Palanisamy wrote:
> From: Govind Singh <govinds@codeaurora.org>
> 
> Add a new modem compatible string for Qualcomm QCS404 SoCs
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> [rebased on top of 5.8-rc3]
> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
