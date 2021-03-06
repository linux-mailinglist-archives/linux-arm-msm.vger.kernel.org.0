Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACAE32FD8B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 22:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhCFViy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 16:38:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhCFViX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 16:38:23 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4723EC06174A;
        Sat,  6 Mar 2021 13:38:23 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id n79so5735469qke.3;
        Sat, 06 Mar 2021 13:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqWBb593TSZlw5a9zDn6tM3Ds+mzfiHH5ylMd3NHCPQ=;
        b=Hh0UOR9uonFK8WcP4GC5nxxv0i0pvobPWCt64va5g2iSvqBVeNY40cNeO+XacW4s8A
         mJ8M+jpvOyJmdSAUhUZHP5BtyUbdXzDeYEyfjlt+0HhVlN5P69MA14jeSXrgmNltTJhO
         DXtXUpsdF+Cw/ycFwUU6p5nprB0M6I43dYruarNSyrLlvtQJYnRlmTH+Xed2MTCiXjgp
         yH73OpG5bWJRFe8dZez4GPyqApjqeUYTWgBkrYL8hfY0bKwH1Wh1VWLPXxcXCXtcOfpt
         0xNJ8YQFyRwZBU8QPrrbCwqK9AL0lX1m9DwDpsxr+f0jw8EOJ/dlx1KaL7IdB7pYAru8
         kmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqWBb593TSZlw5a9zDn6tM3Ds+mzfiHH5ylMd3NHCPQ=;
        b=qogfstgU4M3VZGsKAisQymhkI9DIKIGBmHOjDDO4jC62UTZ5MsAGWNr+9lbEX31U0o
         4iyx9N8LrfagcaMpUIW4OkQaWL9beuZZedIOwjj4CUt5OHpeVBXPqpnbCMrl6ThpFoRG
         OlN2wPMHrAQdDoqaY1OmE5rxitGh/QwFDqo0uheBnQNl3Lr3q0+64Kmo5ltcXF/UR6SV
         oirMILiB1IlIg1xBfMILjCkIuCikkn101KflV8D+j5k4iOJ+qUNLqi8zUyK3UBmJwCMr
         7Ny+MZ6bfc6a51fVU30LFeAyQzbOqyBw3BAe1sv+Ma/iApBuUbRGF72ZoSfR2N5LdMcy
         zdOA==
X-Gm-Message-State: AOAM5328xjKOGYfSXXWZe0mZDWT7Qu75/YO58LhEHyfBmZ6uSbBXBFkP
        UT6SGiPA1PaG5Bm0peMZ2bb/aOBMmObvoG0w
X-Google-Smtp-Source: ABdhPJxbA6blMjZKLr6s1Ip+H0qpzLlo9ruy+rJOUB+GhjcIrMC5eXTbuaYoeOEn+YAWDtyL371iEg==
X-Received: by 2002:a37:6283:: with SMTP id w125mr14959138qkb.447.1615066702534;
        Sat, 06 Mar 2021 13:38:22 -0800 (PST)
Received: from localhost.localdomain ([138.199.13.185])
        by smtp.gmail.com with ESMTPSA id n4sm4451149qta.38.2021.03.06.13.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 13:38:22 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] soc: qcom: Fix typos in the file qmi_encdec.c
Date:   Sun,  7 Mar 2021 03:05:42 +0530
Message-Id: <20210306213542.19413-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Rudimentory spelling fixes throughout the file.

s/descibing/describing/
s/inforation/information/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/soc/qcom/qmi_encdec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 3aaab71d1b2c..328cc8237191 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -451,11 +451,11 @@ static int qmi_decode_basic_elem(void *buf_dst, const void *buf_src,

 /**
  * qmi_decode_struct_elem() - Decodes elements of struct data type
- * @ei_array: Struct info array descibing the struct element.
+ * @ei_array: Struct info array describing the struct element.
  * @buf_dst: Buffer to store the decoded element.
  * @buf_src: Buffer containing the elements in QMI wire format.
  * @elem_len: Number of elements to be decoded.
- * @tlv_len: Total size of the encoded inforation corresponding to
+ * @tlv_len: Total size of the encoded information corresponding to
  *           this struct element.
  * @dec_level: Depth of the nested structure from the main structure.
  *
@@ -499,10 +499,10 @@ static int qmi_decode_struct_elem(struct qmi_elem_info *ei_array,

 /**
  * qmi_decode_string_elem() - Decodes elements of string data type
- * @ei_array: Struct info array descibing the string element.
+ * @ei_array: Struct info array describing the string element.
  * @buf_dst: Buffer to store the decoded element.
  * @buf_src: Buffer containing the elements in QMI wire format.
- * @tlv_len: Total size of the encoded inforation corresponding to
+ * @tlv_len: Total size of the encoded information corresponding to
  *           this string element.
  * @dec_level: Depth of the string element from the main structure.
  *
--
2.26.2

