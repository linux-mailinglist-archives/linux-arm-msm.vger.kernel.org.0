Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1F712C04E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2019 04:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfL2Dfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 22:35:34 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33791 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfL2Dfe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 22:35:34 -0500
Received: by mail-pf1-f196.google.com with SMTP id z16so16727215pfk.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Dec 2019 19:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mPy3u4+QpRgdQYQ9Mp1NkaSkxalaThVlLa9KXxTz7Ew=;
        b=QD9ypE87A8v3ue0tIqTrH58ucVhmQHzMSX98LP8WrAkrOFprag+vQmQtsvovWYRHOa
         Z46L9sDfdQTq9Pwwa7DJ+uLxTPQEhohIvBrVoXuJ/xHhx4OEZD/9qea6X3QcIq2Q8rEo
         1UGBgmYBrsXiO7d+Q14Zuyyt13FRsi31CxCSWdm+0hSTz6zBA0btMNBSgQmMjbx1KRCZ
         +gYKUqM4QPVamvcNsTl5Ojm7IIMe8iw5e4DlvfGqbeXQkomZD1/v7+McOUelPf3B9OGd
         qEVL4nWrf+kyMu9wc9W4nx6w3/2w3gUUz/HiYo5ndU+Wmw2nNS6qVAlPoDVqBfpeXwVQ
         kdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mPy3u4+QpRgdQYQ9Mp1NkaSkxalaThVlLa9KXxTz7Ew=;
        b=tNPZNax94orM+2uUDYnadJCbjdAtuqBnc7dxK549nC2ecpBm3G1U/2kvzRfnu7fDHz
         y4nWGty6N1jOttM7eWiJUxPXT116UuwWUdfs+tqaBNXNHILbPAJIqwj/k4T379Zsiw2d
         hkZ6UHL1lGuypM0wpUlNGFj0bsGQoIVYMhKiWgqvzNpr6bYOZ4ct9TSq0LmcfDJxg9oq
         Yan02aCx4ves6quGTfdi+RbLoW6JCg1puT0b4hygcRsT9WbH8wNcNhFRnQBM5puL1QTy
         RfM26eWM07yljyouMAx+4O4/dBSlyWiQkBo6Z6UlNWaSwahFXwyZ90xNyjxlyRzqeA7y
         OoKA==
X-Gm-Message-State: APjAAAV+bziddoUW+8YqhmzJmwtNfaVojEsxFb4XX8L5JMBWXoLtkcsF
        EaxGKalk4DtErFKs++xUM/hE1w==
X-Google-Smtp-Source: APXvYqw3kcXlDAF9TLI0e6b0J3kH+Y2RIgxToCoMfP0JnE5f7DAMHXdqG6gnSuPT9MTpjghI10BToQ==
X-Received: by 2002:a65:5788:: with SMTP id b8mr63501355pgr.324.1577590533167;
        Sat, 28 Dec 2019 19:35:33 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d22sm44458904pfo.187.2019.12.28.19.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2019 19:35:32 -0800 (PST)
Date:   Sat, 28 Dec 2019 19:35:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH V2 2/7] pinctrl: qcom: Add ipq6018 pinctrl driver
Message-ID: <20191229033530.GN3755841@builder>
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
 <1576752109-24497-3-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576752109-24497-3-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Dec 02:41 PST 2019, Sricharan R wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
[..]
> +static const struct msm_function ipq6018_functions[] = {
[..]
> +	FUNCTION(qpic_pad),
> +	FUNCTION(qpic_pad0),
> +	FUNCTION(qpic_pad1),
> +	FUNCTION(qpic_pad2),
> +	FUNCTION(qpic_pad3),
> +	FUNCTION(qpic_pad4),
> +	FUNCTION(qpic_pad5),
> +	FUNCTION(qpic_pad6),
> +	FUNCTION(qpic_pad7),
> +	FUNCTION(qpic_pad8),

Shouldn't the qpic_padN entries be removed now? (Please double check the
rest as well)

[..]
> +
> +static const struct msm_pingroup ipq6018_groups[] = {
> +	PINGROUP(0, qpic_pad, wci20, qdss_traceclk_b, _, burn0, _, _, _, _),
> +	PINGROUP(1, qpic_pad, mac12, qdss_tracectl_b, _, burn1, _, _, _, _),
> +	PINGROUP(2, qpic_pad, wci20, qdss_tracedata_b, _, _, _, _, _, _),
> +	PINGROUP(3, qpic_pad, mac01, qdss_tracedata_b, _, _, _, _, _, _),
> +	PINGROUP(4, qpic_pad, mac01, qdss_tracedata_b, _, _, _, _, _, _),
> +	PINGROUP(5, qpic_pad, mac21, qdss_tracedata_b, _, _, _, _, _, _),
> +	PINGROUP(6, qpic_pad, mac21, qdss_tracedata_b, _, _, _, _, _, _),
> +	PINGROUP(7, qpic_pad, qdss_tracedata_b, _, _, _, _, _, _, _),
> +	PINGROUP(8, qpic_pad, qdss_tracedata_b, _, _, _, _, _, _, _),
> +	PINGROUP(9, qpic_pad, atest_char, cxc0, mac13, dbg_out, qdss_tracedata_b, _, _, _),
> +	PINGROUP(10, qpic_pad, qdss_tracedata_b, _, _, _, _, _, _, _),
> +	PINGROUP(11, qpic_pad, wci22, mac12, qdss_tracedata_b, _, _, _, _, _),
> +	PINGROUP(12, qpic_pad, qdss_tracedata_b, _, _, _, _, _, _, _),
> +	PINGROUP(13, qpic_pad, qdss_tracedata_b, _, _, _, _, _, _, _),
> +	PINGROUP(14, qpic_pad, qdss_tracedata_b, _, _, _, _, _, _, _),
> +	PINGROUP(15, qpic_pad, qdss_tracedata_b, _, _, _, _, _, _, _),
> +	PINGROUP(16, qpic_pad, cxc0, mac13, qdss_tracedata_b, _, _, _, _, _),
> +	PINGROUP(17, qpic_pad, qdss_tracedata_b, wci22, _, _, _, _, _, _),

Regards,
Bjorn
