Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC56DBCF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 07:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395435AbfJRFYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 01:24:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37769 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395027AbfJRFYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 01:24:10 -0400
Received: by mail-pl1-f196.google.com with SMTP id u20so2281016plq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 22:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3o3EqRq3PgsgiQtn4AY+sfKyKLaEqB9pO5QeXjYW1YY=;
        b=x9MS2j9SeTU1yjy/80Wvue6xeCHSErdf9EALM3Tjzc+ohSUTFrZ70EJyB/p3y8uCmp
         E6oisSzZ64R/uT5q9VScB/CUyOZ7ZGyvBjpyp+JPl3pGOKo/IXykFV388A0MvXI77cst
         pX5J3+EwmNbRsR9dCClbr9xz+PMxp6zkgcXjXyQuncbUYaCKC4ppDkibNqRVoiKxoeeH
         +oLDcz/9+Kcji/s4z+0T7kT4MnasCEasJtZh74m8B8wBqkjOwDpK8JzeJNlW3UOJuHVG
         pt2vWbvQc3jWMwz2Ms+vvdBzlZUx/NjpKlQsWPs7KiSDmoqv7lUg/7KxWmUlBYxRTjrF
         KBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3o3EqRq3PgsgiQtn4AY+sfKyKLaEqB9pO5QeXjYW1YY=;
        b=Xl2TxOvVQyRvh4sanPVWBxcMmk+oOPdck0Xuru92XIxsu8pp+VOEkdQTksycxO5VKL
         DD5Zs39ioegC/ohHFQN+9YStoEN8BJ8ut/Rly/7OtJ+Uz9nus6GDtKijcBcR37JD7Vzy
         Cv88Rram+iJxnOchnc+c3kGBksliGHzf7m17zIGyuQnM9UTqT9sYxWZm6wkiB3EtylEY
         /ZAwbB14232zmVGdTtbUDCu2gVQC1HbiIUjG+aynoTBmrqJwipOJeGIuslafkQbY3cNW
         3I5NDT1bBpFSiF7QRn3wzkMxdzfoi8kA1QWDxlH9L5fgRnSS9aaNNHaPRJ1TE27ieXTO
         B9AQ==
X-Gm-Message-State: APjAAAV3HIvVmMq6K+5Epqbbz2lMt+6vZv2/zegUIgO/qP5uqvQVJChX
        WQ6U1DLSDydw7A7fdsH5K2NorA==
X-Google-Smtp-Source: APXvYqw19R+uAq8rWGJFrvZRkNKzLLbqBo0up+3BCPqhRIt/ceR4k2HbajPgDlT/k7e+4ftCKy6O+A==
X-Received: by 2002:a17:902:b70b:: with SMTP id d11mr7650535pls.339.1571376248651;
        Thu, 17 Oct 2019 22:24:08 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u11sm2178760pgc.61.2019.10.17.22.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 22:24:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/4] Bluetooth: hci_qca: Regulator usage cleanup
Date:   Thu, 17 Oct 2019 22:24:00 -0700
Message-Id: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clean up the regulator usage in hci_qca and in particular don't
regulator_set_voltage() for fixed voltages. It cleans up the driver, but more
important it makes bluetooth work on my Lenovo Yoga C630, where the regulator
for vddch0 is defined with a voltage range that doesn't overlap the values in
the driver.

Bjorn Andersson (4):
  Bluetooth: hci_qca: Update regulator_set_load() usage
  Bluetooth: hci_qca: Don't vote for specific voltage
  Bluetooth: hci_qca: Use regulator bulk enable/disable
  Bluetooth: hci_qca: Split qca_power_setup()

 drivers/bluetooth/hci_qca.c | 135 +++++++++++++++---------------------
 1 file changed, 55 insertions(+), 80 deletions(-)

-- 
2.23.0

