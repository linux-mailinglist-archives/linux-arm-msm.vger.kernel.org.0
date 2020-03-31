Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA25199D20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 19:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgCaRmk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 13:42:40 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:41697 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgCaRmj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 13:42:39 -0400
Received: by mail-io1-f68.google.com with SMTP id b12so6427737ion.8;
        Tue, 31 Mar 2020 10:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FTAqD+OnWKqPUS7vCWWL8ACHVlN3bM/iXdorWRR9HJA=;
        b=m4amlG+dG+XITfbL0jZdKgd5wAS2AgyDDHpuEyV318YCBb+EIWdQY74Fp8phtRH9ZQ
         TViNHhQ7eEi3vxeLrsxVAp+4a8GxgnYHNsF3mwf4R2O+44Zw3tKhKp9V3zoAUhgykJx8
         WTDEQPp4w332p3uB89F6mHKfC1BiuUanZlji9LmDLOR1wU917lt8Aj70w5pXZoAXwZvv
         7UnwPIeg8JqEOK2TQUxE5UiXPBtvdheGezloZ0aNjvx7MknboAdW9M6UhPN8Y2MRwFV2
         iL7iRfOEuevhZrX3H6WaKFxVSu6MRAaFJ115eScmA8zFl0d+YaUyfJvkW15wiolMOFHZ
         7PMg==
X-Gm-Message-State: ANhLgQ3W2OqAiugHDQVk7PSuZUU5asMcnayAzaLgXlhVRxHm9ScQqwEx
        2HkSMh+o3pOIn4awGiX3dnn/rQY=
X-Google-Smtp-Source: ADFU+vsofZqcujz0YBlQeUxmcFaoWgeTxj5Kf5VemH202p86jO/BnjYgn6HMw3nAtP7k4B1E9T339Q==
X-Received: by 2002:a02:2b02:: with SMTP id h2mr16570919jaa.81.1585676558974;
        Tue, 31 Mar 2020 10:42:38 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id w88sm6083471ila.24.2020.03.31.10.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 10:42:38 -0700 (PDT)
Received: (nullmailer pid 9628 invoked by uid 1000);
        Tue, 31 Mar 2020 17:42:37 -0000
Date:   Tue, 31 Mar 2020 11:42:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: dt: qcom,dwc3.txt: fix cross-reference for a
 converted file
Message-ID: <20200331174237.GA9527@bogus>
References: <66b8da28bbf0af6d8bd23953936e7feb6a7ed0c2.1584966325.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66b8da28bbf0af6d8bd23953936e7feb6a7ed0c2.1584966325.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 Mar 2020 13:25:27 +0100, Mauro Carvalho Chehab wrote:
> The qcom-qusb2-phy.txt file was converted and renamed to yaml.
> Update cross-reference accordingly.
> 
> Fixes: 8ce65d8d38df ("dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
