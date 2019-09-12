Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A3DB114B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 16:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732702AbfILOli (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 10:41:38 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42132 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732512AbfILOli (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 10:41:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id w22so16146219pfi.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2019 07:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r10XxYo64h7WhrgLMhjzdHqV1PkZ/x1I9tqJZeKTMc4=;
        b=Mwj32CQaEx1C6jSYjkvSBFB9XLBwRzlQNF4YPTVHp/4BLY45eXByAwlwqQeUVzEl4e
         xIDDW/JwGQvwGUONObe9X1YPZlxxNi3e5MGidT4kWtbuxGYF+F1vKflxYaeJ2fSUGI+d
         S6Ak3qU4hF1Ah3k9lQAC1JwQgyXRUFLPGmUU/GoLmUZfGAovKhRELGPQkDxuVuvJMRtl
         D7rU4n1yjuXXaJxUCL0fkKrPF+aV6IanCL+h76GlY7BcK5RiPHJMrEb6YCPPF9U/eFqZ
         X6ww+U0H0hn85vYUOmwR9Mqh/k3GiFdBkgDe/lCGvnSmn/1WKifFLr66NEy0Vm4An0+w
         hrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r10XxYo64h7WhrgLMhjzdHqV1PkZ/x1I9tqJZeKTMc4=;
        b=qakWFCJon9YLbxyZiNHrt6BeeF+1eB4FMNC64zuDWIRnPj1iGC3/FKXzCx5UNiPXVT
         LcuE8z2DUGg4b1w+JZGzFUlK02dYuKewOJer7FFVRRQYiQFByrI/hqVgl4SAVrLWvgm5
         K127BRD2Akpg4RFNvyHm5Bp6x5dHedPMT5aLdSdUWEWlFfW+7hTQTlTDDRcwIQQBzWuf
         szHXEF3EqaHZCTBwfhp/QJKcF7C4Hx0n5t6Hp4gYtf+34obIcjQuz+7onTNLz3H45rFq
         6DIdQ9RHd607EQjJCpQUObRf3u9b4TyPKNGexQZAPuFCil4FRkmKkYSBm7DGFiABWRVF
         a2Ig==
X-Gm-Message-State: APjAAAWEh6OOWaItKZpR8MdHnIHHKEQE5TPqqXT6fikzTPEyF8SBtUiW
        3ZrwpGvnZqTlas+fzUug/LWi8A==
X-Google-Smtp-Source: APXvYqwequlIpbX+PrCQEr/G2Xun6w8GjZ/REjd2nI410kBksQEDDgQ9WIHogZAWQxThN3ALcVXt7Q==
X-Received: by 2002:a17:90a:b63:: with SMTP id 90mr440396pjq.96.1568299297139;
        Thu, 12 Sep 2019 07:41:37 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w26sm27201591pfi.140.2019.09.12.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 07:41:36 -0700 (PDT)
Date:   Thu, 12 Sep 2019 07:41:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     andy.gross@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: add sdm845 and sda845 soc ids
Message-ID: <20190912144134.GA7468@tuxbook-pro>
References: <20190912091056.5385-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912091056.5385-1-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 12 Sep 02:10 PDT 2019, Srinivas Kandagatla wrote:

> This patch adds missing soc ids for sdm845 and sda845
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 855353bed19e..8dc86a74559b 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -198,6 +198,8 @@ static const struct soc_id soc_id[] = {
>  	{ 310, "MSM8996AU" },
>  	{ 311, "APQ8096AU" },
>  	{ 312, "APQ8096SG" },
> +	{ 321, "SDM845"},
> +	{ 341, "SDA845"},
>  };

Added a space before the '}' and picked this up.

Thanks,
Bjorn

>  
>  static const char *socinfo_machine(struct device *dev, unsigned int id)
> -- 
> 2.21.0
> 
