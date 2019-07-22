Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790BA70D48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 01:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbfGVXXN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 19:23:13 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40958 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfGVXXN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 19:23:13 -0400
Received: by mail-pf1-f193.google.com with SMTP id p184so18095047pfp.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SkLiXHjoGqjfEw9X0EGifhhb+KhqQv8+F1IP2BsxfY4=;
        b=bswQh2zaokNmjpMmcJtfAxGTLcPm2xs57WvQHrvl2dvTqk/eF02SJ1mHs7QWhn0fke
         dr7I6tQjr3Vfs5qt4hzMnj6xeCmH6bMThGiGVABRnHE4yf6OQHVH+gvafrTOJQLAFoy+
         I2s+TAqGDPU1/O2wF9PGE02QrzkZR+xvPem/BoaSeDSOx17wBfqxACVvIgoZ/5r44JVr
         ArjqocEAVUyOJGBFvCo30qwEHZsIZsIH7J/UPDOFqnMCOsOHzCxGIbZ9qF91PUEe4id5
         amkhIjwFWrtA2aeLC7h0gxbU4ODm82YazVyb9HHinhsmHjrwj2vzFUxPPRJqQpuUg281
         1+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SkLiXHjoGqjfEw9X0EGifhhb+KhqQv8+F1IP2BsxfY4=;
        b=PzCXezAbFqBySJZIn39tE3qqTSanl2YIOVztoE5Mg3A2NgfZ2yeyq2pvn4mzr4Qowh
         oX1pHqjw7mC+cYbl04eYvXWlDv+NFJdCIe/RoxL3pJ7BKHpRzMmjL30H9LtUFdnW2ArN
         FsHC/QRQ8/cea91yhHGFCvV84gsM6/A4UEh7C9GN7jOjOTg+CIpfAki23D0pBMQru0JK
         D9yuULpHd/TuQ+iHTwg1vJB1Aw4T+RPdguITOVduv8WCBNu0KtkefiyxF5f7szK2B43g
         WnQny9Bo6lymBQnrXFPu3uMRTJ2HD5nmZtWBomXojtoGK4vkQfL01oH6v9gTJck3Hawu
         +6ig==
X-Gm-Message-State: APjAAAViCt9GglVUUhzpYGrr44qIV6SgtFg09GudU6Dwq2Vj2+NSdLoz
        bOVqHFzt3iJQE9e0QncYKSaklw==
X-Google-Smtp-Source: APXvYqxLurlZ+S3BELfmTb9cU6XqzknjzCTO2ipHWJ6uIUQiIvoYlcDJ/CvO5PFtBYIdX4wDFmwltQ==
X-Received: by 2002:a63:4185:: with SMTP id o127mr34695446pga.82.1563837792374;
        Mon, 22 Jul 2019 16:23:12 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r13sm51029776pfr.25.2019.07.22.16.23.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 16:23:11 -0700 (PDT)
Date:   Mon, 22 Jul 2019 16:23:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vaishali Thakkar <vaishali.thakkar@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rafael@kernel.org, vkoul@kernel.org
Subject: Re: [PATCH v5 0/5] soc: qcom: Add SoC info driver
Message-ID: <20190722232309.GS30636@minitux>
References: <20190711213911.23180-1-vaishali.thakkar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711213911.23180-1-vaishali.thakkar@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Jul 14:39 PDT 2019, Vaishali Thakkar wrote:

> This patchset adds SoC info driver which can provide information
> such as Chip ID, Chip family and serial number about Qualcomm SoCs
> to user space via sysfs. Furthermore, it allows userspace to get
> information about custom attributes and various image version
> information via debugfs.
> 
> The patchset cleanly applies on top of v5.2-rc7.

Hi Vaishali,

There's no context in the patches so they do not apply properly. Please
resubmit them with appropriate context.

Regards,
Bjorn

> 
> Changes since v1:
>         - Align ifdefs to left, remove unnecessary debugfs dir
>           creation check and fix function signatures in patch 3
>         - Fix comment for teh case when serial number is not
>           available in patch 1
> 
> Changes since v2:
>         - Reorder patches [patch five -> patch two]
> 
> Changes since v3:
>         - Add reviewed-bys from Greg
>         - Fix build warning when debugfs is disabled
>         - Remove extra checks for dir creations in patch 5
> 
> Changes since v4:
> 	- Added Reviewed-bys in multiple patches
> 	- Bunch of nitpick fixes in patch 3
> 	- Major refactoring for using core debugfs functions and
> 	  eliminating duplicate code in patch 4 and 5 [detailed info
> 	  can be found under --- in each patch]
> 
> Vaishali Thakkar (5):
>   base: soc: Add serial_number attribute to soc
>   base: soc: Export soc_device_register/unregister APIs
>   soc: qcom: Add socinfo driver
>   soc: qcom: socinfo: Expose custom attributes
>   soc: qcom: socinfo: Expose image information
> 
>  Documentation/ABI/testing/sysfs-devices-soc |   7 +
>  drivers/base/soc.c                          |   9 +
>  drivers/soc/qcom/Kconfig                    |   8 +
>  drivers/soc/qcom/Makefile                   |   1 +
>  drivers/soc/qcom/smem.c                     |   9 +
>  drivers/soc/qcom/socinfo.c                  | 468 ++++++++++++++++++++
>  include/linux/sys_soc.h                     |   1 +
>  7 files changed, 503 insertions(+)
>  create mode 100644 drivers/soc/qcom/socinfo.c
> 
> -- 
> 2.17.1
> 
