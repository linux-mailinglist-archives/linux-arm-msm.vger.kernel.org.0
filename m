Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C25D117F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 16:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728019AbfJIOlc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 10:41:32 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40454 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729471AbfJIOlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 10:41:32 -0400
Received: by mail-wr1-f67.google.com with SMTP id h4so3347505wrv.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I5d3DNfj3UA6KCjceYDwu/vM6pXPJTm3mAV1n/RYi9A=;
        b=IIW6uXWw5x6h2gZOH1bqnOvRlhorhjV9jCwS2rEyxcthChqC/RTW4YZiDTLs0vUeBP
         oIPFNYSP2BZ6aIxfOOlqNuyb3qJVJzD3j3hhGsIQ9ks9r4F9MOLEAkLWSyJeCmKcxTyj
         73LkoLXYwGIRBhEF8VlApWMxBSK7W28Fnr12pQnplIAjbla6RO50zow77gJdKLzea+oU
         ge8f3HhETu3p9GDeI6cduaG3KIKcF+U9ElMQ75+TeVUGnPzkdDqKHMHZNt4h536jTMmp
         ydhn7xfWECh6los8gITwTucinPO00zgWNYoGu/4lODL0uGbg2ZCxH93G3U/NrhE06/Lh
         0klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I5d3DNfj3UA6KCjceYDwu/vM6pXPJTm3mAV1n/RYi9A=;
        b=BSZ9YLcJiiM5gRUveG9ZgOqzWrNkjt0S98kefP2899FrNYXNGPFoIgvqNfZTR/GHly
         3tZ+n71yI4kpf6XvtLNmjcJ1zh48bNy8uwLByi/RlvkTlLFDBJ4e0xnvDjZuPfh1WKrN
         VnVqlJMsFqidivhfjXpQuj09UomRuqo2Xv3xnBqCwg7TG/7t62gfGR2Bc3S+Fgrw3kj2
         DdEB5b+XtJ1Gn0f5ToZ/JAAWtd+2cN9k68y2tM1v9hrGh10cyPvn5deTaxJC4+Vc+tw0
         Xj6ClTAfkvYjrEtWqLbpBGZKqQUTTCzbLujCQYCoutNWMrWUILmzawkCLn6ycJINJ+xo
         TJCA==
X-Gm-Message-State: APjAAAX3k3xzpqBo8nZX/qHQB45qDcSIaFExuakKjYxYnJIlG7hf8asb
        s8Zz2KdvhWQT2RPUWre33+ReTg==
X-Google-Smtp-Source: APXvYqxlxa+gEM60N5SSZPMVXZ7GuaOPp8KqZKR6xvVmxXDmOaFWjFL2GPgWfjtjdbmt+kwl27BoYA==
X-Received: by 2002:adf:e28f:: with SMTP id v15mr3560520wri.17.1570632089602;
        Wed, 09 Oct 2019 07:41:29 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b7sm3031770wrx.56.2019.10.09.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 07:41:28 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/5] misc: fastrpc: fixes and map/unmap support
Date:   Wed,  9 Oct 2019 15:41:18 +0100
Message-Id: <20191009144123.24583-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

These patches implement a few fixes identified while working on the
QCS404 ML integration plus we now have support for mmap/unmap of
buffers (so the process can be created with less initial memory
requirements).

Thanks,
srini

Jorge Ramirez-Ortiz (4):
  misc: fastrpc: add mmap/unmap support
  misc: fastrpc: do not interrupt kernel calls
  misc: fastrpc: handle interrupted contexts
  misc: fastrpc: revert max init file size back to 2MB

Srinivas Kandagatla (1):
  misc: fastrpc: fix memory leak from miscdev->name

 drivers/misc/fastrpc.c      | 209 ++++++++++++++++++++++++++++++++++--
 include/uapi/misc/fastrpc.h |  15 +++
 2 files changed, 213 insertions(+), 11 deletions(-)

-- 
2.21.0

