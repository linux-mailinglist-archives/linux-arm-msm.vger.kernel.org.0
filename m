Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF49818367A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 17:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgCLQot (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 12:44:49 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33243 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCLQoh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 12:44:37 -0400
Received: by mail-qk1-f195.google.com with SMTP id p62so7338024qkb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2020 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ec7R0bi2nVM+F7rZN313cf7V1mbBY7UX4j8RKAtVudI=;
        b=MrqD06QhTj4HWofBJT7nxxIOwPRtSzDwxbA1IXIAZd+3Ka1QMh5FZbIGfKIWSR8h8X
         RuhrJagdGXsh+9vfSSTWITbjq4YzFxdkSVMCM6j7VKrnWPUc30Gb+4D77DX+SnDJ7Bqz
         Ig1o2b+WMvY/9fPKVhn5DyUTVxV96sih4P5gASQWiwy8cGlg0c0O38W6JEBKQASbDJyo
         P1VInXw4lJxd6FqY/dsvw4FNJUD2ziFu+Kxv2oGesiYBEA5SqBIn2nWZZ+LI9aJVQuFk
         o+HMBW4yav8ghIPKwdGWwcqKKVGPBmOVeUsmujGojgqCtuqZIbtyY2s4YMtl3YfypgpD
         J6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ec7R0bi2nVM+F7rZN313cf7V1mbBY7UX4j8RKAtVudI=;
        b=l+q85aK0DxF6Y34kpxe2HSq5BURaH3DzMZbxfvPhNmS/mRuobfdXaA2D0UbQCi0Hpg
         eisPZympzBiHJb61symSVjRZDbRd4sjDqXeAwZSvS/ncxnYGZeA4M/mro70kdQtd3Mo3
         1NnBiHxhlyCycR2sMo6oFLZP/hwvXkrae3KmGLr9DMI34w9TP/6g8BfyRhVs6ICku5xO
         P70vIag1fwt8QGM3qTr+NiB7TpHRU6GdZp91obhC+CIpJX9eYheOLhqHhxC468lyxm0V
         TC0iua7G0WusBYgP8MEpCMHV/m78AHgO2YRu4TwUl/Xb8RsLd5XFlE3c5yQcFuGwRiUn
         3BhQ==
X-Gm-Message-State: ANhLgQ3+clKsKaoMKNsAecdyrLky9Z3mFXrr+HrmKER6cjcE4mAY0c+5
        BllYhW5prWm7ughN0TVVQtCDqA==
X-Google-Smtp-Source: ADFU+vtioYETrA227Ha7YqY55Gh12iS6/cs2tK2mVB2+BbYDGinlbtWcnlzwX3ec9WHmb3gPZUx3ug==
X-Received: by 2002:a37:987:: with SMTP id 129mr8799401qkj.83.1584031475735;
        Thu, 12 Mar 2020 09:44:35 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id j4sm7244743qtn.78.2020.03.12.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 09:44:35 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     David Miller <davem@davemloft.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org (open list),
        Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 1/2] bitfield.h: add FIELD_MAX() and field_max()
Date:   Thu, 12 Mar 2020 11:44:27 -0500
Message-Id: <20200312164428.18132-2-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312164428.18132-1-elder@linaro.org>
References: <20200312164428.18132-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define FIELD_MAX(), which supplies the maximum value that can be
represented by a field value.  Define field_max() as well, to go
along with the lower-case forms of the field mask functions.

Signed-off-by: Alex Elder <elder@linaro.org>
Acked-by: Jakub Kicinski <kuba@kernel.org>
---
 include/linux/bitfield.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 4bbb5f1c8b5b..48ea093ff04c 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -55,6 +55,19 @@
 					      (1ULL << __bf_shf(_mask))); \
 	})
 
+/**
+ * FIELD_MAX() - produce the maximum value representable by a field
+ * @_mask: shifted mask defining the field's length and position
+ *
+ * FIELD_MAX() returns the maximum value that can be held in the field
+ * specified by @_mask.
+ */
+#define FIELD_MAX(_mask)						\
+	({								\
+		__BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_MAX: ");	\
+		(typeof(_mask))((_mask) >> __bf_shf(_mask));		\
+	})
+
 /**
  * FIELD_FIT() - check if value fits in the field
  * @_mask: shifted mask defining the field's length and position
@@ -110,6 +123,7 @@ static __always_inline u64 field_mask(u64 field)
 {
 	return field / field_multiplier(field);
 }
+#define field_max(field)	((typeof(field))field_mask(field))
 #define ____MAKE_OP(type,base,to,from)					\
 static __always_inline __##type type##_encode_bits(base v, base field)	\
 {									\
-- 
2.20.1

