Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001C6326AC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Feb 2021 01:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhB0A1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 19:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhB0A1S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 19:27:18 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79492C06178A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 16:26:28 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id w18so6141246plc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 16:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d6xwfju9BuFcpoWFF+EpsUXmn1rhhTh/1d4BevylldU=;
        b=U9XrEzTZEa6ZtFSOnGv0xX009LgynEPCNjHI5nkM5UPGFqmhMonONwq+UcvaIMxcdE
         n8d+N2kjGAyaAl0MFwyJcXI1yE5vZGrRo1671A9HgEzLTfOxt4hgDVWMIDSw67gF4YrH
         03AcM0vfSMulmin+9lx9fMr9KQeJu7kHMRBF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d6xwfju9BuFcpoWFF+EpsUXmn1rhhTh/1d4BevylldU=;
        b=MoAdp599rvq7ogErZ42J9LRWOkz4vQ76RS018WbQJnxGNCVJ9YYQIoWgUmKoWb/The
         SR8uZohD9M/xMDsa8gCaxYXyg/8BiesanbSuWyBwuwsoT1mGjoGiVgdo4rVcSEZDQwRj
         HQfMSU6rbUTehW7s1aDcqv112vNwuya80aVDJ0PyJwF/YkSbo4lTc1ECsNmJwEDRvcA9
         evtCCrrRAof3vb8fZQ3nxUA4zpmrO+Wx9ZOGh7a06P6lGewB2JX8uYSOMDpNgSbP4eKz
         VsZIw7scrU7G4v7Lje7P+yRnEjzhj13p8mvSnFCpYdAyn3E9nTxSV5LPL2Z/WXGRxgFf
         QX8w==
X-Gm-Message-State: AOAM532EFcEcS6bXgqfkCZwfb1m/hFBytHtO07njLZSjIi93gMBgUnSS
        ETOvRGX/kKtq1PrqimcZaaFKow==
X-Google-Smtp-Source: ABdhPJxqsTpIpJOgV+oMX+GrdwRyY7sg/lnD0/dnqpwJHzAxL9+L6hynLWWhyh7RMCenYlHxWR1ZPA==
X-Received: by 2002:a17:90a:4301:: with SMTP id q1mr5757456pjg.57.1614385588022;
        Fri, 26 Feb 2021 16:26:28 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:7525:b50:4b48:1a6d])
        by smtp.gmail.com with ESMTPSA id t6sm9793744pgp.57.2021.02.26.16.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 16:26:27 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Niklas Cassel <niklas.cassel@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] nvmem: core: Allow nvmem_cell_read_u16/32/64 to read smaller cells
Date:   Fri, 26 Feb 2021 16:26:02 -0800
Message-Id: <20210226162521.2.I7c9190630cf9131b42d521aa1c5b97135012a734@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210227002603.3260599-1-dianders@chromium.org>
References: <20210227002603.3260599-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current way that cell "length" is specified for nvmem cells is a
little fuzzy. For instance, let's look at the gpu speed bin currently
in sc7180.dtsi:

  gpu_speed_bin: gpu_speed_bin@1d2 {
    reg = <0x1d2 0x2>;
    bits = <5 8>;
  };

This is an 8-bit value (as specified by the "bits" field). However,
it has a "length" of 2 (bytes), presumably because the value spans
across two bytes.

When querying this value right now, it's hard for a client to know if
they should be calling nvmem_cell_read_u16() or nvmem_cell_read_u8().
Today they must call nvmem_cell_read_u16() because the "length" of the
cell was 2 (bytes). However, if a later SoC ever came around and
didn't span across 2 bytes it would be unclear.  If a later Soc
specified, for instance:

  gpu_speed_bin: gpu_speed_bin@100 {
    reg = <0x100 0x1>;
    bits = <0 8>;
  };

...then the caller would need to change to try calling
nvmem_cell_read_u8() because the u16 version would fail.

Let's solve this by allowing clients to read a "larger" value. We'll
just fill it in with 0. If a client truly wants to know exactly how
big the cell was they can fall back to calling nvmem_cell_read()
directly.

NOTE: current implementation assumes that cells are little endian when
up-casting the size, but that's already pretty implicit in the way
nvmem works now anyway. See nvmem_shift_read_buffer_in_place(). Let's
document this but not do any auto-conversions just in case there was
an instance where someone was using this API to read big endian data
on a big endian machine and it happened to be working because there
was no bit offset.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I will freely admit that I always end up thinking in circles and
getting dizzy when I think too much about endian considerations. If
anyone has better intuition than I do and see that I've goofed this up
then please yell.

 drivers/nvmem/core.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index a5ab1e0c74cf..8602390bb124 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1534,12 +1534,14 @@ static int nvmem_cell_read_common(struct device *dev, const char *cell_id,
 		nvmem_cell_put(cell);
 		return PTR_ERR(buf);
 	}
-	if (len != count) {
+	if (len > count) {
 		kfree(buf);
 		nvmem_cell_put(cell);
 		return -EINVAL;
+	} else if (len != count) {
+		memset(val + len, 0, count - len);
 	}
-	memcpy(val, buf, count);
+	memcpy(val, buf, len);
 	kfree(buf);
 	nvmem_cell_put(cell);
 
@@ -1564,6 +1566,11 @@ EXPORT_SYMBOL_GPL(nvmem_cell_read_u8);
 /**
  * nvmem_cell_read_u16() - Read a cell value as a u16
  *
+ * This function can be used to read any cell value 16-bits or less.  If
+ * this function needs to upcast (or if the cell was stored in nvmem with
+ * a bit offset) it will assume that the cell is little endian.  Clients
+ * should generally call le16_to_cpu() on the returned value.
+ *
  * @dev: Device that requests the nvmem cell.
  * @cell_id: Name of nvmem cell to read.
  * @val: pointer to output value.
@@ -1579,6 +1586,11 @@ EXPORT_SYMBOL_GPL(nvmem_cell_read_u16);
 /**
  * nvmem_cell_read_u32() - Read a cell value as a u32
  *
+ * This function can be used to read any cell value 32-bits or less.  If
+ * this function needs to upcast (or if the cell was stored in nvmem with
+ * a bit offset) it will assume that the cell is little endian.  Clients
+ * should generally call le32_to_cpu() on the returned value.
+ *
  * @dev: Device that requests the nvmem cell.
  * @cell_id: Name of nvmem cell to read.
  * @val: pointer to output value.
@@ -1594,6 +1606,11 @@ EXPORT_SYMBOL_GPL(nvmem_cell_read_u32);
 /**
  * nvmem_cell_read_u64() - Read a cell value as a u64
  *
+ * This function can be used to read any cell value 64-bits or less.  If
+ * this function needs to upcast (or if the cell was stored in nvmem with
+ * a bit offset) it will assume that the cell is little endian.  Clients
+ * should generally call le64_to_cpu() on the returned value.
+ *
  * @dev: Device that requests the nvmem cell.
  * @cell_id: Name of nvmem cell to read.
  * @val: pointer to output value.
-- 
2.30.1.766.gb4fecdf3b7-goog

