Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF42041A3AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 01:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238196AbhI0XPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 19:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238194AbhI0XPh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 19:15:37 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7AFC061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 16:13:59 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso26585453ota.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 16:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KVuMZMqVV04eQ3Tb7rVw7n5uLN5vqLDGlsaVhkH6vzk=;
        b=oVP0g4qMd5qWo3M3F1aW6UU+Ws0NL+zn9GuNUtkm6RsR4uqiTMi3g3YqRTqyptXGQC
         vAITBe77HANeeI+WXUGpLn8e5rMaxWhiWaKHudhs27TGC2+x/U62jU1zzX79Qo2ngNTN
         Ht1555PUyM6wUfdasdj4CFh/JvAkbVKg7wEYwlD2LNHN3MnPdKvF1cFJwsIItnIS583L
         /Lir38FwWD6RWFZ9c6NEec8fwYR3/0fuS3uHDTgr7DtR14esDfjiBKvr5UKkDbmyDQPh
         t4ZOBFZBvIAYO7YsfA7ObZUCNAPj26+6LoqvyO43V0HD1MD06PKkGAHJgI9tzF84EztC
         BibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KVuMZMqVV04eQ3Tb7rVw7n5uLN5vqLDGlsaVhkH6vzk=;
        b=JYKr9RIpHZcdqIhHCLJgb7vN5zK4fKShXG4yU1sh55ymi6tkt9M/uA7g84kfQFvBSN
         D/Jk0JBrK233DTL8tLzjxRH6rBMd8dOgJEQIpIPrlZvxDYJZSbEtMJ/dpMpc5SodvpJz
         MoGJjgnS7USsWakJ7kRmY0796UGZKKcq3ogCESQ04AK+C/UmHJmCOoG/BHaYll5co4Bm
         4RaE566BmBEgt7JRZWNLPySZwT0/dC4NvRolJicwVwuEUvO7qdqu9QcRG9r55Fm81UAO
         xiNakM93uw22kMR9xu+3Aql1RcHzPBN3gduLn8Hybwkr8sDiSzed/4FqoAEDtsisV+b+
         CQSQ==
X-Gm-Message-State: AOAM533eMC6JFQV0iqShzv28NnmE+7OO5BCHhgdiLoSBaxJl9W3fTxQm
        JzOqbt+DfCPTo/u9yUHuGAQ9Ew==
X-Google-Smtp-Source: ABdhPJzaEwRSbrKNt2Ihwn79FZaMrmiL6jA1t5+oKfxg1X5E05wzeb3V31yxVtzsdzgCZAQLTBqEkQ==
X-Received: by 2002:a05:6830:12cf:: with SMTP id a15mr2283847otq.296.1632784438533;
        Mon, 27 Sep 2021 16:13:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p21sm4162268oip.28.2021.09.27.16.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 16:13:58 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: (subset) [PATCH v2 2/5] remoteproc: qcom: pas: Use the same init resources for MSM8996 and MSM8998
Date:   Mon, 27 Sep 2021 18:13:53 -0500
Message-Id: <163278440375.1524647.6708298654473355392.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926190555.278589-3-y.oudjana@protonmail.com>
References: <20210926190555.278589-1-y.oudjana@protonmail.com> <20210926190555.278589-3-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Sep 2021 19:06:22 +0000, Yassine Oudjana wrote:
> The resources for MSM8996 are missing power domains, and adding them
> makes the resources identical to the MSM8998 ones.
> Rename msm8998_adsp_resource to msm8996_adsp_resource then use it
> for both chips. Also add power domains to slpi_resource_init and use
> it for both chips.
> 
> 
> [...]

Applied, thanks!

[2/5] remoteproc: qcom: pas: Use the same init resources for MSM8996 and MSM8998
      commit: 0e235460be2e8c9b08e567c839641395a8ca68d9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
