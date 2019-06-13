Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A9744D1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 22:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbfFMUNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 16:13:16 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:44428 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbfFMUNQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 16:13:16 -0400
Received: by mail-qt1-f176.google.com with SMTP id x47so24059665qtk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 13:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=wvS6rY6fiOclRJfIV/D2hBg/6UXfJIIPm4B4bACKZz8=;
        b=HYg9YO4tNI0fAvnYBqGA4GHJTrCc+LilCgHH9hKNNNHCrPFgKufk5stqe+dbMkNVqr
         HqerBE0ZU1S9XNvUlRzSNM2WVfb2xR/bOlOfyodDJ4rOQ6cuoFu9mjF0jIs9YfSSrNsZ
         yiYSGIAs1Q2l35lfEnbUESGmL4kEUxqLPcRnrXfi/sUCae4UDijczQOtXXl0ooIXVmir
         tqIrBRxS9WHRSWV1q+R2sX9hRJ1aua7zkTpBanPHAR3BJpvZ2+aI+uUalMJGZWoCGDiN
         +3FBbwVNVFJ4zzxiidZrklYOyVcH1E+ivsDndTFaNYnLVHR535KTDmdvYbZ1Rvcjvo5e
         i9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=wvS6rY6fiOclRJfIV/D2hBg/6UXfJIIPm4B4bACKZz8=;
        b=Px5B7+vBhWU2vTnERqoUVcWRBTuxBoHLi3SOJeBEqCDcr/LMYJ2LHgnjNdu+ho4fdL
         YZoDDrnP6dkqJFuZCsZJ2UaFBSZZr12wzQZNwLW6thwfinA7+o19jiDTewtiwxQmxWt0
         +Q2EVUCnI0JYIRbboMM6Tbh21+SoOqG2erKUth6CgpHRZUAczdHwEQ/f2KSM/nsxli9p
         4VhsU0iAhDuSQF9KbwznRfLdWAxndl7ozLFyXdfcNUVT0CVrHHukbrDwDc1VrsViMQei
         4QZghmN30X0cexDwPKSQyTWGaGz6bH9KWCt2A0IYkKw3cqja/POCLWN++MkjUPJ8yfda
         aIJQ==
X-Gm-Message-State: APjAAAWMlaFu6kMbazdfXkec0k3HFtonQI6EWJLz/ZrKKtk4hK766Bxb
        7rBfa3/YhXJWvnN/wHFFiPgHf36CJManPcZnj+duNA==
X-Google-Smtp-Source: APXvYqxWyFG99Ct6+QLgIzYtC2nFrJPWli73Mpub+sqBtV6mrY7PVaaQNI1DAnxScJGvgATRbOeFqOwsixGDdCryNzE=
X-Received: by 2002:a0c:add8:: with SMTP id x24mr5123019qvc.167.1560456795436;
 Thu, 13 Jun 2019 13:13:15 -0700 (PDT)
MIME-Version: 1.0
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Thu, 13 Jun 2019 13:13:04 -0700
Message-ID: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
Subject: Cleanup of -Wunused-const-variable in drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To:     jsanka@codeaurora.org, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey all,

I'm looking into cleaning up ignored warnings in the kernel so we can
remove compiler flags to ignore warnings.

There are several unused variables in dpu_formats.c
('dpu_format_map_tile', 'dpu_format_map_p010',
'dpu_format_map_p010_ubwc', 'dpu_format_map_tp10_ubwc').
They look like modifiers that were never implemented. I'd like to
remove these variables if there are no plans moving forward to
implement them. Otherwise I'll just leave them.

https://github.com/ClangBuiltLinux/linux/issues/528

Thanks,
Nathan Huckleberry
