Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 040001653D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 01:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgBTAsw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 19:48:52 -0500
Received: from mail-pf1-f171.google.com ([209.85.210.171]:36412 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbgBTAsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 19:48:51 -0500
Received: by mail-pf1-f171.google.com with SMTP id 185so996871pfv.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 16:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FyfNbWZdKxFWvrYaFX6247ohGc1n6i2IlhYtU0R4MSc=;
        b=TKzkpIoyO6Ud+jx6k7yjvn9BnhBvU7p4rb3Z6rWbmD41Jkbg7oX2L4OHt6xC0WwyyV
         YizdQYav+qJuztIxOwg/XRFjv90VcOsGMLPoNNqxTOCR9r1wJMhLWJUjtM9oUjlPbnTy
         7gIaxiBeBviHKuamYTR+XuTcJV8rE5A+BC3Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FyfNbWZdKxFWvrYaFX6247ohGc1n6i2IlhYtU0R4MSc=;
        b=c2Aaedh9+zr+mpk4zp0mgo/xzMXFzgJT2dZUdCcnEi8wB/q4RKjCpGcpv2nmX5uJib
         XSMXgKflLJZL6kAO/rKUmjihEDQWwIjHXCRKzIs5thB8rOcJ9nI/sZEg1RJWHTJMZ2sz
         DtvciUoVYGeLxEkg6hOPb1JxLxRl4tpKtjCQswuRUHUyy79VA+9xIdJkiRbAYIQsATAX
         JGbqgjnRYl4ZSl1JxeMms+SaFjHZBjHBxhyZnwNjfsi9bJiMq/Y4Ms2qqmsRQrq79ucy
         p6jaG19QAeXLoRrpp575aU57deOIrg0zLpDbF0uJ5sF4qKVUcXqk8TJnyccUu9XGe0+b
         kJbA==
X-Gm-Message-State: APjAAAVQn+osVMxoTGMntSQvb+RtHwds/72NLFjLkJK6aS/Ko511k+GY
        0/0NToeoz7cCQ1js2EhJphEUPA==
X-Google-Smtp-Source: APXvYqwyAa/sHxlQcNiDnIb8oQK3EcBTrdcT47I160SBbxG2YWGq4/oM2Nk0hkIXgfBkbUN29+WrQw==
X-Received: by 2002:a63:6383:: with SMTP id x125mr27759449pgb.409.1582159730320;
        Wed, 19 Feb 2020 16:48:50 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id 64sm816323pfd.48.2020.02.19.16.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 16:48:49 -0800 (PST)
From:   Scott Branden <scott.branden@broadcom.com>
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Kees Cook <keescook@chromium.org>,
        Takashi Iwai <tiwai@suse.de>, linux-kselftest@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH v2 4/7] firmware: test partial file reads of request_firmware_into_buf
Date:   Wed, 19 Feb 2020 16:48:22 -0800
Message-Id: <20200220004825.23372-5-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220004825.23372-1-scott.branden@broadcom.com>
References: <20200220004825.23372-1-scott.branden@broadcom.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add firmware tests for partial file reads of request_firmware_into_buf.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 .../selftests/firmware/fw_filesystem.sh       | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tools/testing/selftests/firmware/fw_filesystem.sh b/tools/testing/selftests/firmware/fw_filesystem.sh
index 56894477c8bd..e973c658fe1a 100755
--- a/tools/testing/selftests/firmware/fw_filesystem.sh
+++ b/tools/testing/selftests/firmware/fw_filesystem.sh
@@ -126,6 +126,26 @@ config_unset_into_buf()
 	echo 0 >  $DIR/config_into_buf
 }
 
+config_set_buf_size()
+{
+	echo $1 >  $DIR/config_buf_size
+}
+
+config_set_file_offset()
+{
+	echo $1 >  $DIR/config_file_offset
+}
+
+config_set_partial()
+{
+	echo 1 >  $DIR/config_partial
+}
+
+config_unset_partial()
+{
+	echo 0 >  $DIR/config_partial
+}
+
 config_set_sync_direct()
 {
 	echo 1 >  $DIR/config_sync_direct
@@ -184,6 +204,35 @@ read_firmwares()
 	done
 }
 
+read_firmwares_partial()
+{
+	if [ "$(cat $DIR/config_into_buf)" == "1" ]; then
+		fwfile="${FW_INTO_BUF}"
+	else
+		fwfile="${FW}"
+	fi
+
+	if [ "$1" = "xzonly" ]; then
+		fwfile="${fwfile}-orig"
+	fi
+
+	# Strip fwfile down to match partial offset and length
+	partial_data="$(cat $fwfile)"
+	partial_data="${partial_data:$2:$3}"
+
+	for i in $(seq 0 3); do
+		config_set_read_fw_idx $i
+
+		read_firmware="$(cat $DIR/read_firmware)"
+
+		# Verify the contents are what we expect.
+		if [ $read_firmware != $partial_data ]; then
+			echo "request #$i: partial firmware was not loaded" >&2
+			exit 1
+		fi
+	done
+}
+
 read_firmwares_expect_nofile()
 {
 	for i in $(seq 0 3); do
@@ -296,6 +345,21 @@ test_batched_request_firmware_into_buf()
 	echo "OK"
 }
 
+test_batched_request_firmware_into_buf_partial()
+{
+	echo -n "Batched request_firmware_into_buf_partial() $2 off=$3 size=$4 try #$1: "
+	config_reset
+	config_set_name $TEST_FIRMWARE_INTO_BUF_FILENAME
+	config_set_into_buf
+	config_set_partial
+	config_set_buf_size $4
+	config_set_file_offset $3
+	config_trigger_sync
+	read_firmwares_partial $2 $3 $4
+	release_all_firmware
+	echo "OK"
+}
+
 test_batched_request_firmware_direct()
 {
 	echo -n "Batched request_firmware_direct() $2 try #$1: "
@@ -348,6 +412,22 @@ for i in $(seq 1 5); do
 	test_batched_request_firmware_into_buf $i normal
 done
 
+for i in $(seq 1 5); do
+	test_batched_request_firmware_into_buf_partial $i normal 0 10
+done
+
+for i in $(seq 1 5); do
+	test_batched_request_firmware_into_buf_partial $i normal 0 5
+done
+
+for i in $(seq 1 5); do
+	test_batched_request_firmware_into_buf_partial $i normal 1 6
+done
+
+for i in $(seq 1 5); do
+	test_batched_request_firmware_into_buf_partial $i normal 2 10
+done
+
 for i in $(seq 1 5); do
 	test_batched_request_firmware_direct $i normal
 done
-- 
2.17.1

