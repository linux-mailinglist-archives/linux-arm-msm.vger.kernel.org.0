Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A899AF7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 14:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388801AbfHWM3M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 08:29:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:38646 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388553AbfHWM3M (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 08:29:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id AD826AFF2;
        Fri, 23 Aug 2019 12:29:10 +0000 (UTC)
Date:   Fri, 23 Aug 2019 14:29:10 +0200
Message-ID: <s5hsgpsqd49.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Scott Branden <scott.branden@broadcom.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/7] fs: introduce kernel_pread_file* support
In-Reply-To: <20190822192451.5983-2-scott.branden@broadcom.com>
References: <20190822192451.5983-1-scott.branden@broadcom.com>
        <20190822192451.5983-2-scott.branden@broadcom.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 22 Aug 2019 21:24:45 +0200,
Scott Branden wrote:
> 
> Add kernel_pread_file* support to kernel to allow for partial read
> of files with an offset into the file.  Existing kernel_read_file
> functions call new kernel_pread_file functions with offset=0 and
> flags=KERNEL_PREAD_FLAG_WHOLE.

Would this change passes the security check like ima?
I thought security_kernel_post_read_file() checks the whole content
for calculating the hash...


thanks,

Takashi
