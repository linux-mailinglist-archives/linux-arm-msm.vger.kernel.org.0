Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBA53BA02B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Sep 2019 03:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfIVByp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 21:54:45 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44198 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfIVByp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 21:54:45 -0400
Received: by mail-pl1-f196.google.com with SMTP id q15so4899973pll.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 18:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=rYCMTzf5XfwKOsEzh41FsTMKmDMxiUBIaULFJietvkw=;
        b=K1naXdvogaEe5TxFqSMSp7rDFEAdpuCR6rMwFHF6+4xLaFXeYhBbRiO6hk5gh3YqpU
         jwwB0ltth8D95PruCSjAOPsUo2eoTxBTaercBm/obwPCKjWSD2kA0vOA/uMTFROdRV/F
         VPI/omVqHyoG24hazhflJa03GRTeRHxfTeka+u2+Wo2d+iu88ol6oTI27m0bHtGiv/J5
         oqz8TurWzaQJkX7Z6xKq1VryuuitQQqc2DBqyRA9qh/BMMy5/9fF8tJbRbV0O4T1dA02
         r5P6UMjdsvoJvR0FoZVOb1yXgikZsx3cwdIISP9CjO6Ya+mV0oL9HYnGDubUBjTmRVjU
         EkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=rYCMTzf5XfwKOsEzh41FsTMKmDMxiUBIaULFJietvkw=;
        b=EaJiHIHmXj7szk88jZpNuEy/HqLU4iqoVgdo51O9odUQla7/azTZAuYszkz+30TUwE
         WJ7DC142GbH7+jrLK+swNwhMgrb4a/Ot0iKaIWhz9Y0ggab8217Yyd4cka8cTe4mnZrj
         3rWdEJ+I8VVsYmRFUyDUv9ZIaPLlNm8aQOQOJD/xfz9cI+rp09P3qzHvTV2J9mlkvsuG
         cdsFwYfaMU3iVvUoeL5wO8HBz9uq2T52pzZsTqEJgEE/TSz/U9KkSBKNgRo4XtALngjW
         SUQKM0SPoxpsn+uLof9ywO0lumDt3O1i/bOkfsVZpGQfmzDkEdDawlYPFSMjNzvI3S8J
         eJAA==
X-Gm-Message-State: APjAAAXCyKpvesnRCHtRmUMBsjLWZwwNvjn3n5ezG5lz4S1r2nN7VnMF
        3QM7vJrL7eivCj8MRZwz6cLbzw==
X-Google-Smtp-Source: APXvYqxYgsXnRkO1NtPedKypWdAMA42UdD6RehIiW7hqLUVf5E2h9si/0m974x4xEY25hFo7Ku9ezA==
X-Received: by 2002:a17:902:9a43:: with SMTP id x3mr25633936plv.145.1569117284881;
        Sat, 21 Sep 2019 18:54:44 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id f6sm8097858pfq.169.2019.09.21.18.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2019 18:54:44 -0700 (PDT)
Date:   Sat, 21 Sep 2019 18:54:41 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        stable@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: Stop rx_worker before freeing node
Message-ID: <20190921185441.0350ce9e@cakuba.netronome.com>
In-Reply-To: <20190918172117.4116-1-bjorn.andersson@linaro.org>
References: <20190918172117.4116-1-bjorn.andersson@linaro.org>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Sep 2019 10:21:17 -0700, Bjorn Andersson wrote:
> As the endpoint is unregistered there might still be work pending to
> handle incoming messages, which will result in a use after free
> scenario. The plan is to remove the rx_worker, but until then (and for
> stable@) ensure that the work is stopped before the node is freed.
> 
> Fixes: bdabad3e363d ("net: Add Qualcomm IPC router")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks! Applied, and queued for 4.9+.

FWIW Dave handles the stable submission himself, so no need to CC
stable on networking patches:
https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html#q-i-see-a-network-patch-and-i-think-it-should-be-backported-to-stable
