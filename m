Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3F418366C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 17:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgCLQoe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 12:44:34 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46259 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgCLQoe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 12:44:34 -0400
Received: by mail-qt1-f195.google.com with SMTP id t13so4849941qtn.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2020 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TPpZsYGTKZBLfF6RD/jxlsWhzogKeQ1x8M78zICj+mw=;
        b=lHh7D1bfakOBhGH6SadI25EDS7GDUKMoeWYcfjflB0boeChcYsncL+EpWkqvsiJYN2
         BPlUvNiByfH3lwaLBDk4i06Mos0YJ8zH4PRWVWjLnPWfvy7rRvtr+R58A/KVfpt5blmD
         EKh8PWEKgeYNRrQ706K6W5eq9x6Cf3b8zICua5o8TIhxMttOH/d/d8pbD+sANGY5XwkJ
         1U00shblSJLdkzBVBmr1FKj+ZZNQSW71M2LehyGoeRgWEWFd7KMWxOgVnRx/u1QQarWq
         vcHK1j3x1UZ6KgZpM93q3f7cYm4O0CURL4h3F92obcB8B7GH4Qlhh7HMM4xMMKmPZkds
         HoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TPpZsYGTKZBLfF6RD/jxlsWhzogKeQ1x8M78zICj+mw=;
        b=htWVVKWqmn7x9P0p1ylT8bxWOMMpKy0fB3IUnOzrtrIPw/7IW3vdbxWvLrDDSW0EQv
         32kSpZR8nq4rzUOfFLoX15KSyxoR5Ec9ccCoosx0ZcOWhTzpRGNyEweTMH+yGSOPXca/
         PQ6NA5kIjjxcUFWPH49mwO3+3eitjkyupbDdSjAXiYGfwZLvRE2Cqyls8yw2DBIcxqb4
         q+U1z4rgXHerulpen7N+SplozslcI6c98q8ha0lA3vhaXTzXUe9mwgV4A/YOjH2hZoij
         2l65hd9vspn0Spxa+L57C0K5W97FqNun5X5PawZVi/g5uTFgZ7IjISHlRaKDYbYjIiMT
         XxgA==
X-Gm-Message-State: ANhLgQ2DWF20J6NcD+9ELNefPQ2ChVuP630AXuPhg5Ew2k4WJaDwyzr3
        QlcCJRv2GarSEfVOzoJNHSaQCg==
X-Google-Smtp-Source: ADFU+vtE3JG0NWN6jyn3K+8asK/VcYwtDNTb1ZiL3MvdApqkx+AqIYGQY+eEJgi2kY+L7P2QZ1RSIQ==
X-Received: by 2002:ac8:369d:: with SMTP id a29mr8559874qtc.338.1584031473533;
        Thu, 12 Mar 2020 09:44:33 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id j4sm7244743qtn.78.2020.03.12.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 09:44:32 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     David Miller <davem@davemloft.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] net: fix net-next
Date:   Thu, 12 Mar 2020 11:44:26 -0500
Message-Id: <20200312164428.18132-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

David:	These patches resolve two issues caused by the IPA driver
	being incorporated into net-next.  I hope you will merge
	them as soon as you can.

The IPA driver was merged into net-next last week, but two problems
arise as a result, affecting net-next and linux-next:
  - The patch that defines field_max() was not incorporated into
    net-next, but is required by the IPA code
  - A patch that updates "sdm845.dtsi" *was* incorporated into
    net-next, but other changes to that file in the Qualcomm
    for-next branch lead to errors

Bjorn has agreed to incorporate the DTS file change into the
Qualcomm tree after it is reverted from net-next.

					-Alex

Alex Elder (2):
  bitfield.h: add FIELD_MAX() and field_max()
  Revert "arm64: dts: sdm845: add IPA information"

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 51 ----------------------------
 include/linux/bitfield.h             | 14 ++++++++
 2 files changed, 14 insertions(+), 51 deletions(-)

-- 
2.20.1

