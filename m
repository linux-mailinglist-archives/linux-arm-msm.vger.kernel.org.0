Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED12A193D0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 11:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbgCZKjk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 06:39:40 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37785 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgCZKjk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 06:39:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id r24so5859043ljd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 03:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nm7daEZmRCQGmg/oeW9vSEkTDhWhC4wvKQ8H8nvYJtM=;
        b=uLZoHBJEdtCKbN/cWMQfWVW6g7VVQmFbA9BxpfTJC7cp+MOqzvZrVFfgDeyxQk+57Y
         4WbA08qgC5ei/09QJVDsr4EZguqAkujA6xwZ8S9wOb8KNWCFtRIllODAqTj4DWEiiTsX
         qDydMS8vylDi8g/R3tfS1llR+urMeF4kKg/9i0UnxeqMfJBOdf7GZ+zEWOBzNFr4wfeO
         O4DcQdustyzR8jZ1MeHZKOfDKn0y46nufGHK1V/lertkMrPKavB7nuZiLbesId/A3UGO
         S1alPWvAOgFgldImIijjrtmS/IDo3h8V+OwyBWBk4YzB/WyDfeJc4aVeK1FkOMJrH+Sg
         pn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nm7daEZmRCQGmg/oeW9vSEkTDhWhC4wvKQ8H8nvYJtM=;
        b=q8KahD5kPWff/1MHZq5t9jSno+IADFJuQPiA5eqmnSePiKVZE5ncUwNcak3AQfCqlY
         HOeybz/iUwJ+pdC4iN/suu25HxCz3Dxd8lFprhhJ2tWrkAop5caODqNrE8H0FLGFa8va
         8MipcAMHi86YYWgPmgYiScRsHtvAfaJkJYTtit0wssLhHpX6XX241Uux3QZAvgzls7oI
         hoIHuTJdNaYYLZLgQNHDvEj0quvFBeVHCKWLxFtPeXwzjIG8AjvxQKRIaUsEx2NwcX1D
         g25i0gCE0M2SFnz7v9Okyo2akrjQUF+swTvsWD6Vo4q5jfoEZtZOIggGzYERk0Wy1k1t
         aLBw==
X-Gm-Message-State: AGi0PuZbdkREUN3i20WUIR8xt4XGW0WwCX1UHxcewHowA6nwVFIVge3z
        9hYNUPntBZousst/R6UrOtAXKQ==
X-Google-Smtp-Source: APiQypIGUavt2IrOB7A4U98tlaEHV4jg99sIklKUxPb5m6wVRKOPaVtVY3T6r1VJhKDcNeEFtQH5Ww==
X-Received: by 2002:a2e:8109:: with SMTP id d9mr4398900ljg.31.1585219177107;
        Thu, 26 Mar 2020 03:39:37 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id h3sm1304008lfk.30.2020.03.26.03.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 03:39:36 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: msm8916: Conform to updated PSCI bindings
Date:   Thu, 26 Mar 2020 11:39:30 +0100
Message-Id: <20200326103932.5809-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PSCI DT binding was recently updated to fix some errors and so was also the
related domain-idle-state DT binding. Therefore, this series updates the
msm8916 to conform to these updates.

Ulf Hansson (2):
  arm64: dts: msm8916: Conform to the domain-idle-state binding
  arm64: dts: msm8916: Conform to the nodename pattern PSCI subnodes

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.20.1

