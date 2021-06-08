Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E6F39F562
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 13:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbhFHLpf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 07:45:35 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:42579 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbhFHLpe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 07:45:34 -0400
Received: by mail-ed1-f50.google.com with SMTP id i13so24151286edb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 04:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=65A8swxG6F/ylZkbgWYzbxA0ZkKEGw9/dd1+oL9pTwE=;
        b=kcgHRx7Fut0ZIyND9s9iBNEwwWtFn1Ujj0GtMhNPnfIFh8cO6bu+xyZs+dUeG35X0E
         wAuK6peHjb/7oXjVSRtajwSpkNEWHcuT5E8XHfaW67jAwKQfbKLbqM38gUocQLotVLQ+
         IrtM4g8eWVmSxfQintTUpcTFGLa2AyyVZGY6s5s7gb/J0Rv8UI5VkcPoXR+HDlaODv4X
         qyI5HGyX+PNcH/vDex5ImOWEewbLkX5kh7MjudnX2pNu7FuFDcMqI+SdEIzIgoBzEsPH
         Sahl6REdq9wzYfjWWvKQ7KD0MiIudWhRlhyvHAv0dckZ+Msq9Q3wNZY3zhOJc2V3ttIV
         VovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=65A8swxG6F/ylZkbgWYzbxA0ZkKEGw9/dd1+oL9pTwE=;
        b=snozJGoZxwzJ9lfeRaYWF0DvRnQi8FclmFZ5MRuq5z3lb1rMPp/WtWMqXwbQETAxcd
         MCCAEbJOqNYazvUJvs2n499Rwb3YN7N5DUqzT01YBx3+Q1owP/hjP5l4KTgXYEBzRaAn
         eEf2Nr7+SdQMJrshH3WONkABqsQnuYNKJvEAiwuujauCZC4rkZ//dxx6Hlw4fIVy4jpU
         5VMuc7Z3yDDS2nBJImhEGRGM4vaHj6Ej0cEhHyiIGIfRPT+rAEHArvnHTmhwz9HWEj3h
         H8h48qb47CFc9uag7FmVSFrR1TqqNcf/m/j4sFNMymnx3nVXTIW+IAk4AHcgiOeYDbCE
         vdaQ==
X-Gm-Message-State: AOAM530O9Dtiv22HCPVJtAyYXtfZByxiqXhCdxhL+2dRYCuUktJwt/Hl
        bMmXbX2DcxA0gezlaiwKoLwP9w==
X-Google-Smtp-Source: ABdhPJwGWZ8jOAdwtABw7tBzCTlHxQlQSIzH1R8MjGRJMsaIzJi7acSzOtAPhe6jqNDcBIf/ENMwYQ==
X-Received: by 2002:aa7:db93:: with SMTP id u19mr24987185edt.227.1623152548257;
        Tue, 08 Jun 2021 04:42:28 -0700 (PDT)
Received: from localhost.localdomain (hst-221-104.medicom.bg. [84.238.221.104])
        by smtp.gmail.com with ESMTPSA id x4sm8754740edq.23.2021.06.08.04.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:42:27 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/5] Venus fatal error handling
Date:   Tue,  8 Jun 2021 14:41:51 +0300
Message-Id: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
  * replace pm_runtime_get_sync with pm_runtime_resume_and_get in 1/5.

regards,
Stan

Stanimir Varbanov (5):
  venus: venc: Use pmruntime autosuspend
  venus: Make sys_error flag an atomic bitops
  venus: hfi: Check for sys error on session hfi functions
  venus: helpers: Add helper to mark fatal vb2 error
  venus: Handle fatal errors during encoding and decoding

 drivers/media/platform/qcom/venus/core.c    |  13 ++-
 drivers/media/platform/qcom/venus/core.h    |   6 +-
 drivers/media/platform/qcom/venus/helpers.c |  16 ++-
 drivers/media/platform/qcom/venus/helpers.h |   1 +
 drivers/media/platform/qcom/venus/hfi.c     |  48 +++++++-
 drivers/media/platform/qcom/venus/vdec.c    |  18 ++-
 drivers/media/platform/qcom/venus/venc.c    | 116 ++++++++++++++++++--
 7 files changed, 201 insertions(+), 17 deletions(-)

-- 
2.25.1

