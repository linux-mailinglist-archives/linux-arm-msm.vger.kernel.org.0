Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 067168DC4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbfHNRuf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:50:35 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46800 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbfHNRua (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:50:30 -0400
Received: by mail-pg1-f193.google.com with SMTP id w3so16248017pgt.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2019 10:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nUsVR6lWkK8D+bl3sEyhgxQA+2S1H8pmiICLTa+fmlg=;
        b=xq7REaPK7/+Xr9c6lpbhZg9wbqCJIYOfBfadey4k1GG0+tik4uwsNMd7WcZgmkLtw/
         GIOPjNR8lkAdorpI1CU5ZaPo5Fiaht4fezl2xa2JHwdrCK1MqFDc10r2NOdS2R3htZZQ
         02B0dRtVBqWTsZlFEcDP5xJb9l1g2pu0c5AdrcIrxZx2IslCjSqu++hri+HjE5Hb4qc9
         Y5a6izbadvmjCwmjjqSVHSFEix+wrsIU/bSF5C3NVCIXfrwGhiU0fulX5xZjnlJY17xy
         a71g2BaaLnWCL6E4Gm6avjgxOdM/pykEBEYIfsYV4KKHCYebhKrheA/Yq9DRR+FBCKV7
         HM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nUsVR6lWkK8D+bl3sEyhgxQA+2S1H8pmiICLTa+fmlg=;
        b=PquARnaEu0TGFzuwZNWqjeho9vMxKkHU5/blOeybf51fMCOlvSpUsVwnJqmdWLgq93
         lfT5behDSRp8AU+qfYHEK+lB3EWd00As+ITZou3NDNcZuga7QYnq3P/li9waUjI626w3
         qLb5XNuRBs8EW5QSTWdGdocyzHXkBKEy/FL05gBdmkLbdSgJeAltNRSGtk6uWMn19sys
         7jRPg5c6Ldz0DKAojHTvTqsjRKBzU7hWaMGywdYgOjz1h+Y0boEPZ/tSkGT82jegz+ZF
         ijAEP2PNapXoRcxGDn0iUGqq+lYC3OYAREnkoX+h/AztqYGY8K++7LQrSVRItoOaR7tz
         59jw==
X-Gm-Message-State: APjAAAUaMkWOcZAKD15mCBLTfGJ7lEL3IaFcCyu3YL3clOlQl2kMuUMb
        G1RXOX/hcmszg97PcxVL8ofKsA==
X-Google-Smtp-Source: APXvYqxouE+yysMKjuTjnYQJSlYzLLD0MDoD7PNbG/KIijDZ8VUbFUVfQ5G8q7fpTAn0sDGCRX/ucQ==
X-Received: by 2002:a17:90a:9604:: with SMTP id v4mr875936pjo.66.1565805029771;
        Wed, 14 Aug 2019 10:50:29 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q7sm453537pff.2.2019.08.14.10.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 10:50:29 -0700 (PDT)
Date:   Wed, 14 Aug 2019 10:50:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/22] arm64: dts: qcom: sm8150: add base dts file
Message-ID: <20190814175026.GF6167@minitux>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814125012.8700-2-vkoul@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 14 Aug 05:49 PDT 2019, Vinod Koul wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
[..]
> +	soc: soc@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;

I'm expecting that we'll run into the same problems as we saw on 845
when bringing in the smmu nodes, so please make the cells 2 - and ranges
should likely be the same 36 bits.

Regards,
Bjorn
