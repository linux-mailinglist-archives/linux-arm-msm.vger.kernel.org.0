Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0877966045D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 17:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235492AbjAFQhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 11:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbjAFQhW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 11:37:22 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAFC78A5F
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 08:37:20 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id l26so1421242wme.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 08:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2/wW8oWU2UO8G+hBvXbq+ylbwBDQdJAzgI/Jam/m+c=;
        b=P0csNwpg9MOjalR15dbOZ1LUq6TdUofEE7438rE/cpAX6qEn5+mMoWvJXJC6ZpwDXi
         EARyvmG1YWxE3zP8yqecpslPwHBQqDrVX25OOeNKcNA4wogZKUTF21SDNUxtcohel9tV
         uyrmTwytfXzK01YXqFqnvwRbqTmq1slYryNo/Rr9NvXFfeJfSIv/Vmi2tlxrQ/Vq6vX8
         2FVWVdbganGHT5PwcT5KSp1Z2Bh+9KufRjFHVx4f1iL9FdE9z650VAAIsK053hbFtN38
         WjudDhMIuOe+JqvyoB12nLnQzAfugau3CkZyjmbbxBmEnWdKrqVrcPp3S78J0Vydyz/y
         FWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G2/wW8oWU2UO8G+hBvXbq+ylbwBDQdJAzgI/Jam/m+c=;
        b=ddu6R+ZzHPwnKFW+iqkalwgkfYs3VtfYMIZraGcu6CAu6vAxvfjAPCj07Ur5hDXquy
         AfHG/YOWG9k3LkhPbs97cTKe9lSGAWjk5Kte8Zah1/FrUCcmrSJDewQlwns4PDbcLww6
         7DfULthbXWoTVrQb3Mzt4CUwO/UP4sO7CmfHTol3l5lgA1nMdTkvia4Df+W1+w+XFyAb
         g7WKXLDTg4AKeijBtAXCSs88YaOGujV/yEENmflH8ZYlYZdGk/SHiC3XmotdXvhJkJMD
         lnKOhRYAJF5X42/oD0al9bNnUhz5nc0hb7b+Tf0mAtftmWXXt+bz8PB31tiMhYiuAkXI
         qTPQ==
X-Gm-Message-State: AFqh2kqkGjnp+hb9WSMS+XTYe6xoN21ACAAqcPKl+PPtSdn9DKjoPC/N
        lEi/Y0y60jVovHa/x0yHMQN9xg==
X-Google-Smtp-Source: AMrXdXvPO6YvRPMFNA4tbcS1PTYl42JBHmgSt22BHUKuhzVUtPqixbPCPJIe9ANjVG/6QbqyJYPZYw==
X-Received: by 2002:a05:600c:4d21:b0:3d2:2a72:2573 with SMTP id u33-20020a05600c4d2100b003d22a722573mr40022929wmp.11.1673023039183;
        Fri, 06 Jan 2023 08:37:19 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l7-20020a5d6747000000b002b57bae7174sm1617699wrw.5.2023.01.06.08.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 08:37:18 -0800 (PST)
Message-ID: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
Date:   Fri, 6 Jan 2023 17:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "agross@kernel.org" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Annoying message on the console for the db845c board
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi all,

Does anyone have an idea on how to fix these timeout messages ? They are 
displayed again and again every 5 seconds and that saturates the 
filesystem after awhile.

...
[   24.662181] qcom-q6v5-mss 4080000.remoteproc: start timed out
[   24.768150] qcom-q6v5-mss 4080000.remoteproc: port failed halt
[   24.777618] remoteproc remoteproc0: can't start rproc 
4080000.remoteproc: -110
[   24.785022] remoteproc remoteproc0: Boot failed: -110
[   24.833657] remoteproc remoteproc0: powering up 4080000.remoteproc
[   24.840126] remoteproc remoteproc0: Booting fw image 
qcom/sdm845/mba.mbn, size 238304
[   24.897361] qcom-q6v5-mss 4080000.remoteproc: MBA booted without 
debug policy, loading mpss
[   31.573938] qcom-q6v5-mss 4080000.remoteproc: start timed out
[   31.680229] qcom-q6v5-mss 4080000.remoteproc: port failed halt
[   31.689683] remoteproc remoteproc0: can't start rproc 
4080000.remoteproc: -110
[   31.697070] remoteproc remoteproc0: Boot failed: -110
[   31.765283] remoteproc remoteproc0: powering up 4080000.remoteproc
[   31.771758] remoteproc remoteproc0: Booting fw image 
qcom/sdm845/mba.mbn, size 238304
[   31.820553] qcom-q6v5-mss 4080000.remoteproc: MBA booted without 
debug policy, loading mpss
....

Thanks
   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
