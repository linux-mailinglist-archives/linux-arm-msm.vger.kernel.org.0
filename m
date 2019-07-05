Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D62C860AA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 18:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbfGEQy4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 12:54:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41875 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfGEQy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 12:54:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id m30so4549925pff.8;
        Fri, 05 Jul 2019 09:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=L0b++Cz1DwGWHz8E2aHIDiGlzeh1G15jnzGEGv6N1Ps=;
        b=r8evzbtHvy2h/zqYmnDCCyQvt4RnwSQxMKEapzC+A3hoFUeqAbWZt4hsZqtLoeBxQl
         EVwT7iSyFNtnkWNqWnmn+GvUTetKo8BkVXiYAtEtUUyj5MaPS6F9FCQcpGgyjbXSUaCp
         ILN+BsrEu8QfBHKNV2AsgY8i/SJeqGJk5YTF6n9QPiw/fjmU/QZiRtsvJwLkLrDW1Bxx
         Bmg+AR4rjNJnGNIc6muTjci9aUduBqGvVMJ8CDAJHiv2EwAloA+KdaSEud7MGnoBUIV5
         UsfyezlvYuj+lvLVIeU012tTXnFG83JOTlskReNgxz3nPGImHj7Wo5tFv6ovRfprmvZO
         +jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L0b++Cz1DwGWHz8E2aHIDiGlzeh1G15jnzGEGv6N1Ps=;
        b=EABaCzWw8KlSvE23kG8fsh0ixBx4+nf7DXCvSj7teXN1NVt+R/QAdmNTAyBUuTvDZ+
         BViNhuy6BWJ3T1wA80QIdS7S29rtpj7Df/91IYQWZLNP70bcEeOFyGBkPDrvy1CbdSmy
         nKzhbHRJLcJsV8sGDnS3kqW9b1ECO35T455b40Y4Oe3Nt9x4mx1wVyhFGgUwqrDAjtHK
         Bbh1zGUFTJj5J7CoP519f+ZJH+XuRciXpSGGIs0soawl3rRTVdCWSQZjQSsEgpKspKDa
         tKUC4EbU7+rfOn4UD/twBQ+xLARcl4tbr22D0PKBtKjQRkRh62lraA5Xhx1W6E2kfdpO
         tFgA==
X-Gm-Message-State: APjAAAUgXRaioY6OIXlBOwot9fVdWCEadbrLej8OKRvVyNdxMxpBgDB2
        QuCkgK3O6u3mU3BDILro/24=
X-Google-Smtp-Source: APXvYqyyW8jKS41MUK89FU5reGeNsJZYJND8bEG5SSJ2bU/tlPCV9U3sQ4VgzxjWQuHQfXZRtNcTsw==
X-Received: by 2002:a63:5610:: with SMTP id k16mr6565617pgb.335.1562345695389;
        Fri, 05 Jul 2019 09:54:55 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id b126sm11066744pfa.126.2019.07.05.09.54.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 09:54:54 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/2] Add Sharp panel option for Lenovo Miix 630
Date:   Fri,  5 Jul 2019 09:54:50 -0700
Message-Id: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Lenovo Miix 630 laptop can be found with one of two panels - a BOE
or Sharp option.  This likely provides options during manufacturing.

These panels connect via eDP, however they sit behind a DSI to eDP
bridge on the laptop, so they can easily be handled by the existing
simple panel code.

This series adds support for the Sharp option.

Jeffrey Hugo (2):
  dt-bindings: panel: Add Sharp LD-D5116Z01B
  drm/panel: simple: Add support for Sharp LD-D5116Z01B panel

 .../display/panel/sharp,ld-d5116z01b.txt      | 27 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 26 ++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt

-- 
2.17.1

