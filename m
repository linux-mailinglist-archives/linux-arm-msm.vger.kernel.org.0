Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34F649AC71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 12:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391962AbfHWKG6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 06:06:58 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34054 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391906AbfHWKG5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 06:06:57 -0400
Received: by mail-wm1-f65.google.com with SMTP id e8so8966204wme.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 03:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDP4l9GmXvFT0nPE4ABIMzRwVlQ6J6G+H/L55vIWn5Q=;
        b=t8ymL09cZ8+uv29LqNMPgps9oKg+f5Dk16oRQLxybKKsd9c8sUzebs0GqeD58BouST
         cq+SEQb+fMkF3bd3IpeQ8FXOFWRq6KzM3tc6c7nEn4gnCOG9TK4NbOKArI8y7AcCkQ64
         6MsmDh3uVrDVYtGvpQr6ka/6tQhFl0Qhwp9nKNbxQCLjjeeS8Mm9ZzR2z8V7RIQKh9ME
         +cUNefGqhOuRc1PRT7VTbuuPBY++usaKcy/N6hBLL7iF2iBTbYNyqTXriLVYzmLpXLQP
         WwACLQ9SYL+hDWhq0bsUQUJ/PAZpPupDGvfBPWMw9Z0gbZtJ+8vjs6vMH+2mAitTagXF
         ELuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDP4l9GmXvFT0nPE4ABIMzRwVlQ6J6G+H/L55vIWn5Q=;
        b=ZIdwswLAAoWITuIWDjVAQCAHhN8A5YpyDuJY0T98ECGxXKQ4nd+otGjgO/FYPlGg5f
         JWaPfBb+fX783lWWDsUfC2An6ic48y12vC0hQqw0S6jkM45HYHRHMQQUA1wbBH6hGtqc
         OkiUtTesN+7BDo4qszSJL/wLHul49lPmYFEfvpALfAcSe5BuoQhIj4WhWlaPXrpHoKDS
         XRAgf3MJ7WyLTZtuG1EjmZPaZ73OQ8uVEb2m3dj957VSA6JRxHL6u80/n3momC5GC5hb
         ASxJn3HCj1r6pu8Hq2d9f4s4jrAapy0AxPv77Y+BdnqUTJSFB92X7G9dlY+6fsfqqray
         VyTg==
X-Gm-Message-State: APjAAAXMsXHfkjI0cKWrE8N+qFcvrWxvH+iL/n4Bd1Ww4jgaIyngrlxR
        zNFe+t9ZBCzxwhReOWegTeUXpw==
X-Google-Smtp-Source: APXvYqyN2L8xMX3VGeynzX33CKJbYSodQFsHk3uM+77iZOkkpt3ygbqCI0khv5N14Izhi9IKHWfEZg==
X-Received: by 2002:a05:600c:292:: with SMTP id 18mr4295318wmk.51.1566554815196;
        Fri, 23 Aug 2019 03:06:55 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id q124sm2058048wma.33.2019.08.23.03.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 03:06:54 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/5] misc: fastrpc: few fixes
Date:   Fri, 23 Aug 2019 11:06:17 +0100
Message-Id: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

More testing on fastprc revealed few memory leaks in driver
and few corner cases.
These patches are the fixes for those cases.
One patch from Jorge is to remove unsed definition.


Thanks,
srini

Bjorn Andersson (2):
  misc: fastrpc: Reference count channel context
  misc: fastrpc: Don't reference rpmsg_device after remove

Jorge Ramirez-Ortiz (1):
  misc: fastrpc: remove unused definition

Srinivas Kandagatla (2):
  misc: fastrpc: fix double refcounting on dmabuf
  misc: fastrpc: free dma buf scatter list

 drivers/misc/fastrpc.c | 74 ++++++++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 31 deletions(-)

-- 
2.21.0

