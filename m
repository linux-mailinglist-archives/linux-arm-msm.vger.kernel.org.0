Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D88E1ADECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 15:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730731AbgDQN43 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 09:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730662AbgDQN42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 09:56:28 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C438C061A0C;
        Fri, 17 Apr 2020 06:56:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t4so983169plq.12;
        Fri, 17 Apr 2020 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g4jx0JyIvsZpRaLj6xflTQ1x/9w2AY54wdVX17gtEWg=;
        b=jTlDTIi10dLJ/iLQpaRPwBxHl3JsPC9OTDxFGIIVcV+MNukTgz6qW2ad3SdjYBXL5F
         vj7UQKNuUbwG57v5d21FRcA8BOvR46AvD0fTc1YYN7Je15e+823sm/u9UQsDs4lLMfN0
         szQMnDfkW7wbv2NISFjz61oP31f2Wcl3aDNHiDWEjOBCKS5MwBVYWTV9M61YIs/w5vVw
         M0dwQndKp00iW7GU0Pbd+BN+5FgW04quLOF3+JGvDFWQZRMP/BJpsfaJ5XsNqKYbd9oA
         wKcT60pPDw9u2u/UFADqhGgT3h0kYohpzec949qqWWJSIBzhZUDaR9fd8GiUxfMH4/Bn
         t1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=g4jx0JyIvsZpRaLj6xflTQ1x/9w2AY54wdVX17gtEWg=;
        b=hn2cO6kwhMrAebrM4Bc6IRD0zxllmIYUNGACm273K0TVdgO/M5c5SsQIT/imODVbHj
         ylIcKtxkiiQ339lFLYHFqk/KEb6mo61r3fjsEOuUglW/C7+m1Lct7Xfo9V9Ook7gHnvF
         K0aVTlFdApF+5vGXH76iuvxqYuS+r3HxnsZ7qmLTt/iPc4p3jvgZ7qx3wVkmAuh76WXA
         NiMUySkH0taVt139Mq/Mp9VsWIlep/D0+CCleg3uBunfCt3YGI6WBFPr6IqQ1J9tizjS
         HpTqicqtcMKMOwhX9WD8+XwaxTM+O6D4MMpf3UoPGEZMUnZ1AiuHou6u7T7epKIsQrPW
         vLUA==
X-Gm-Message-State: AGi0PuY0iPxjmhYh0GrVHQ2L9ijxiFmymXEb3lZwEwHYZ/6ecuAFTWk0
        fhPBlqDrldP2Y+dlW/PIk0M=
X-Google-Smtp-Source: APiQypKPCu2CGOdGGMayqQ3j0fvsq+IBwZZ826QO7EC/ponw071fYH3jn64BSHMHgc6sfPnO1Mzmig==
X-Received: by 2002:a17:902:8d91:: with SMTP id v17mr3408069plo.53.1587131786805;
        Fri, 17 Apr 2020 06:56:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d21sm5670475pjs.3.2020.04.17.06.56.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 06:56:26 -0700 (PDT)
Date:   Fri, 17 Apr 2020 06:56:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] soc: qcom: cmd-db: Cast sizeof() to int to silence field
 width warning
Message-ID: <20200417135624.GA88652@roeck-us.net>
References: <20200415062033.66406-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415062033.66406-1-swboyd@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 14, 2020 at 11:20:33PM -0700, Stephen Boyd wrote:
> We pass the result of sizeof() here to tell the printk format specifier
> how many bytes to print. That expects an int though and sizeof() isn't
> that type. Cast to int to silence this warning:
> 
> drivers/soc/qcom/cmd-db.c: In function 'cmd_db_debugfs_dump':
> drivers/soc/qcom/cmd-db.c:281:30: warning: field width specifier '*' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/soc/qcom/cmd-db.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index 6c308f92a13c..6b5c440c9dc3 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -280,7 +280,7 @@ static int cmd_db_debugfs_dump(struct seq_file *seq, void *p)
>  		ent = rsc_to_entry_header(rsc);
>  		for (j = 0; j < le16_to_cpu(rsc->cnt); j++, ent++) {
>  			seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
> -				   sizeof(ent->id), ent->id);
> +				   (int)sizeof(ent->id), ent->id);
>  
>  			len = le16_to_cpu(ent->len);
>  			if (len) {
