Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFBD5B3956
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbiIINl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbiIINlM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:41:12 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3377BC59F1
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:40:54 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e20so2768289wri.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RvvgLMHlA8hgiNoZmLZU2JRt2mlGnlAJryIJMd3OPZc=;
        b=qphcdroepFhcSrBD4twbvzWxiv2Wjf87RPRcw5l/qauKPkz4j6eJsVpGwRRlRfh8I3
         QYTowvzAkWh6AfWkxKqkdcAZWiDxR4Azn00DojtT3tJHosp4khMGvCRnfqLgIgdiOtgD
         xG7sLWNKKTYQilkKiY03uJpOiApTri58PdS4OmqMIXD1OCk4nGyKf9DtKE18f26j0BNO
         hi/lJWrRDCrV5sB+FVU8ZLGXPFTUoGc5WPL5hMdt0c3W5BdeJ5VAManrsjLmqhPh5tYD
         ABWw0qNWw+LCBnUguLCCOG3cqrxq5Gfgp8gPt364xqaeAH4HlENMVTKfGuPOJ/4MD+6T
         j5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RvvgLMHlA8hgiNoZmLZU2JRt2mlGnlAJryIJMd3OPZc=;
        b=x694uu5g4i66OqngYJdtebYasF22ITnrrEEE+Mu2WkEXWx4HG7F51ELNyQefJw5vIY
         jCMJyIKLildzQ/1tsUgBq/wiBGj4bNQRsyBj7Gxzcduh/L/HMw4caf6DaNbvsOtxfFTG
         OojBcidPr++BQUsGAYMZaJhHXL09FdRXjj7+w945/GdvHIMkWdDfzgzoZLf/OVoBTnvY
         gNTTkTGS0vZQv9qg4evbx3RNh9YJZBn0sWabgOYBfFOCaOrIZ8D140zxqviSXBeb8QLY
         F7cXyTy4pCx/2fmKBEJY19emHy69ORWVk0S25IcPTqqHfEKul8/7pYT7Xd+H5b1ZLLHW
         wTWw==
X-Gm-Message-State: ACgBeo3LFZa1mggRm5dlf5L6m0W4PcBmXdQEn4mM3wMsOAxFkIvgH04t
        9fa6RPj5ItQ5tRxwe6A1LXzjKA==
X-Google-Smtp-Source: AA6agR5f+o/LqrxpyGhcncuLbh8+YWuFeccOaJREsVkyh6ohYs66HcAIIBSeOe2O7ExcEWg5cWq4ew==
X-Received: by 2002:a5d:4285:0:b0:228:6321:c6e with SMTP id k5-20020a5d4285000000b0022863210c6emr8082546wrq.433.1662730852590;
        Fri, 09 Sep 2022 06:40:52 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q20-20020a1cf314000000b003a604a29a34sm660622wmq.35.2022.09.09.06.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 06:40:51 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Himateja Reddy <hmreddy@quicinc.com>,
        Anirudh Raghavendra <araghave@quicinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 09/10] misc: fastrpc: Add mmap request assigning for static PD pool
Date:   Fri,  9 Sep 2022 16:39:37 +0300
Message-Id: <20220909133938.3518520-10-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909133938.3518520-1-abel.vesa@linaro.org>
References: <20220909133938.3518520-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the mmap request is to add pages and thre are VMIDs associated with
that context, do a call to SCM to reassign that memory. Do not do this
for remote heap allocation, that is done on init create static process
only.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index bc1e8f003d7a..b9d9bfad93f6 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1842,8 +1842,9 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES) {
+	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
 		dev_err(dev, "flag not supported 0x%x\n", req.flags);
+
 		return -EINVAL;
 	}
 
@@ -1889,6 +1890,22 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	/* let the client know the address to use */
 	req.vaddrout = rsp_msg.vaddr;
 
+	/* Add memory to static PD pool, protection thru hypervisor */
+	if (req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
+		struct qcom_scm_vmperm perm;
+		int err = 0;
+
+		perm.vmid = QCOM_SCM_VMID_HLOS;
+		perm.perm = QCOM_SCM_PERM_RWX;
+		err = qcom_scm_assign_mem(buf->phys, buf->size,
+			&(fl->cctx->vmperms[0].vmid), &perm, 1);
+		if (err) {
+			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
+					buf->phys, buf->size, err);
+			goto err_assign;
+		}
+	}
+
 	spin_lock(&fl->lock);
 	list_add_tail(&buf->node, &fl->mmaps);
 	spin_unlock(&fl->lock);
-- 
2.34.1

