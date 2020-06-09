Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F991F49D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 00:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbgFIW6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 18:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbgFIW5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 18:57:30 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F279CC008633
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 15:57:22 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id j1so223737pfe.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 15:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sbyKrRW4jzkycRQ+AN5ObGaOSkiAmVbPRVaakkLPnrs=;
        b=RSCYouRTVQme/oye/dD+eYbjykynXM6pZrpoJht84BG8sOQFmmktoX6n+nTmuRfWsZ
         zUTRaFbBUiRvdvZXWXuQhZTJtl5zjNpm2PP0xrn3UprLwSFPDQU+CGecbV73c9aDJC3A
         P+glRcPAT8mNOP3NA8BZjC03fKUSxb7iT5h30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sbyKrRW4jzkycRQ+AN5ObGaOSkiAmVbPRVaakkLPnrs=;
        b=QtVzJDilrcJ4dBc8mW656szulBHWN6Hg2PkiIgJfRDCo6GjjhxzPd/1ASR7N38rSMY
         zSAuyny67KwTjRHZY5nJoUFhgph2LADO/Eac5KCNQn2YFQDHIoxs5MF0SFFX8XXAx4md
         xqOkpjx1YN7Uf6e8nh2mwL+waY+K4JQ1OsN2LI9c6UOnQLP5tJKHhj/8aEZPIsHFiRa2
         hJ8eKTFCrnO+JkYUPDk6XaOjkuLQjJEsF482VjG+94HwmjsE6Zm4ca+fapJiV/qtHerz
         Y67kY9OSzeyqB6wNpi7fDF1zxY52NtD2zpr/Ku1IUYaG3Sp1GOgM2JjfV/OUhw3vys9Z
         2IOQ==
X-Gm-Message-State: AOAM5310S7HPqSDuvCpRujJgXPfZn+nbZjwz/FFU8lvtcZvUdDN4PuKZ
        aSacTc0RvOHcebo7Vtvt9lkMbg==
X-Google-Smtp-Source: ABdhPJyYlpAqo9x0fF+jqv8HBPz2t/v+Q/HNDAEZ3vwcbr1fMgD8krB8CsiCT83vMvibTPSXW8qvqA==
X-Received: by 2002:aa7:93b4:: with SMTP id x20mr97288pff.9.1591743441343;
        Tue, 09 Jun 2020 15:57:21 -0700 (PDT)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id p8sm9104978pgs.29.2020.06.09.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 15:57:20 -0700 (PDT)
From:   Scott Branden <scott.branden@broadcom.com>
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
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
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH v8 4/8] firmware: test partial file reads of request_firmware_into_buf
Date:   Tue,  9 Jun 2020 15:56:52 -0700
Message-Id: <20200609225656.18663-5-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609225656.18663-1-scott.branden@broadcom.com>
References: <20200609225656.18663-1-scott.branden@broadcom.com>
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
index fcc281373b4d..afc2e469ac06 100755
--- a/tools/testing/selftests/firmware/fw_filesystem.sh
+++ b/tools/testing/selftests/firmware/fw_filesystem.sh
@@ -149,6 +149,26 @@ config_unset_into_buf()
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
@@ -207,6 +227,35 @@ read_firmwares()
 	done
 }
 
+read_partial_firmwares()
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
@@ -319,6 +368,21 @@ test_batched_request_firmware_into_buf()
 	echo "OK"
 }
 
+test_batched_request_partial_firmware_into_buf()
+{
+	echo -n "Batched request_partial_firmware_into_buf() $2 off=$3 size=$4 try #$1: "
+	config_reset
+	config_set_name $TEST_FIRMWARE_INTO_BUF_FILENAME
+	config_set_into_buf
+	config_set_partial
+	config_set_buf_size $4
+	config_set_file_offset $3
+	config_trigger_sync
+	read_partial_firmwares $2 $3 $4
+	release_all_firmware
+	echo "OK"
+}
+
 test_batched_request_firmware_direct()
 {
 	echo -n "Batched request_firmware_direct() $2 try #$1: "
@@ -371,6 +435,22 @@ for i in $(seq 1 5); do
 	test_batched_request_firmware_into_buf $i normal
 done
 
+for i in $(seq 1 5); do
+	test_batched_request_partial_firmware_into_buf $i normal 0 10
+done
+
+for i in $(seq 1 5); do
+	test_batched_request_partial_firmware_into_buf $i normal 0 5
+done
+
+for i in $(seq 1 5); do
+	test_batched_request_partial_firmware_into_buf $i normal 1 6
+done
+
+for i in $(seq 1 5); do
+	test_batched_request_partial_firmware_into_buf $i normal 2 10
+done
+
 for i in $(seq 1 5); do
 	test_batched_request_firmware_direct $i normal
 done
-- 
2.17.1

