Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3713C25697C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 19:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgH2RuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Aug 2020 13:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbgH2RuC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Aug 2020 13:50:02 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FCAC061236;
        Sat, 29 Aug 2020 10:50:01 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 17so2296460pfw.9;
        Sat, 29 Aug 2020 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=KsaJIKVvAHoJAzrvMMfIyLvbZDHvGrzugzw5X7p4pTM=;
        b=iTuty6GIFSuRMA5BcteOTBIT1C9WOPlxcD/frG0pI7W9r7WEENne7mQpiH3p2scm1T
         0L+n0mtJSzbEkwbS7ueauX6kZVSjAAGy8zlHcqL59Khme7bV7i03JNTNhayQDXV+B4vr
         aXD2Uket3FikC3OAJzjlPF/FdPZu/z3SDfXGE2f+78LNW32PSZHfep24Rfze26+M814W
         2iztZfyZ8IzUfS0me555OwPyff0b1GOK+nk4IDrEXyC3KgeaWMD6go1whlSCCzuKnumt
         82ictxdj6rZs6Jiu0buiCiyVpjrWWi80UACHUSwSJCixtgwwrokaKwHb26OQti6Ge9C9
         l47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=KsaJIKVvAHoJAzrvMMfIyLvbZDHvGrzugzw5X7p4pTM=;
        b=UdTYVxr3DbIXEp+aWgl1EtKCKvRsLgHp3q0MbqmBIJ8eIOwp2ZWdosoGd4Yc8LMi3Z
         po5PI8rmHlGmwh7sG6QrL6rRb4vEhIUOB/RnAc/ds6hnESH1hhEuupGMNBZERDzvM+pB
         6RXiVAPgA/ebG2ps91WUu+fVN1ygIk2wtEN/SoXgnNceXZ9oj3zetTz36vOrFHe2Xj5a
         bcjL+kAyA3gqw7ljAp/IKN2XnXI7wPC8312xX6UyYT/vjL9+3/ZWQ1PWLPA3Hb4BYTcF
         XKJ9DdW7nTXgMz9OOXTgoRmh8lpqXQnmxJL1dvgel/+yvOoFeNT74FUPy2RBA+Asns6g
         XG0w==
X-Gm-Message-State: AOAM532VFcst/teaEGg9KU0NoRUg1IQlk4905b2/lmz20jUNnnJn2V2/
        k6SbWcyNwQhkd20/YHr9Rxk=
X-Google-Smtp-Source: ABdhPJzi6i71Y7ODZo2GEWmsmfnzgdhF0NsjNDWS89lf+w+mMy5nDACutdI0J7FOk3LK04XNASaHeg==
X-Received: by 2002:a63:f09:: with SMTP id e9mr3181138pgl.334.1598723401132;
        Sat, 29 Aug 2020 10:50:01 -0700 (PDT)
Received: from Kaladin ([49.207.221.164])
        by smtp.gmail.com with ESMTPSA id q11sm2948848pgj.92.2020.08.29.10.49.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Aug 2020 10:50:00 -0700 (PDT)
Date:   Sat, 29 Aug 2020 23:19:56 +0530
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, Julia.Lawall@lip6.fr,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] bus: qcom-ebi2: Add of_node_put() before return statement
Message-ID: <20200829174956.GA10245@Kaladin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Every iteration of for_each_available_child_of_node() decrements
the reference count of the previous node, however when control is
transferred from the middle of the loop, as in the case of a return
or break or goto, there is no decrement thus ultimately resulting in
a memory leak.

Fix a potential memory leak in qcom-ebi2.c by inserting
of_node_put() before a return statement.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/bus/qcom-ebi2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index 03ddcf426887..0b8f53a688b8 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -353,8 +353,10 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 
 		/* Figure out the chipselect */
 		ret = of_property_read_u32(child, "reg", &csindex);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 
 		if (csindex > 5) {
 			dev_err(dev,
-- 
2.17.1

