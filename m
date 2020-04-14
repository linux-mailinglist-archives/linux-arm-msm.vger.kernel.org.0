Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E2E1A7249
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 06:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405119AbgDNEJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 00:09:59 -0400
Received: from m17618.mail.qiye.163.com ([59.111.176.18]:11053 "EHLO
        m17618.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405114AbgDNEJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 00:09:58 -0400
Received: from ubuntu.localdomain (unknown [58.251.74.227])
        by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 9C8F94E2131;
        Tue, 14 Apr 2020 12:00:17 +0800 (CST)
From:   Wang Wenhu <wenhu.wang@vivo.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, kernel@vivo.com, agross@kernel.org,
        bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Wang Wenhu <wenhu.wang@vivo.com>
Subject: [PATCH v3,0/3] drivers: rpmon: new driver Remote Processor Monitor
Date:   Mon, 13 Apr 2020 20:59:46 -0700
Message-Id: <20200414035949.107225-1-wenhu.wang@vivo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200412112405.24116-1-wenhu.wang@vivo.com>
References: <20200412112405.24116-1-wenhu.wang@vivo.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZSlVOQ05LS0tLSENKT01CTFlXWShZQU
        hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDo6SBw5PTgxQwoeVjMQPhoa
        TgwaCzdVSlVKTkNNQ0hNQ0lLSktMVTMWGhIXVQweFRMOVQwaFRw7DRINFFUYFBZFWVdZEgtZQVlO
        Q1VJTkpVTE9VSUlMWVdZCAFZQU9LQkw3Bg++
X-HM-Tid: 0a7176d848409376kuws9c8f94e2131
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RPMON is a driver framework. It supports remote processor monitor
from user level. The basic components are a character device
with sysfs interfaces for user space communication and different
kinds of message drivers introduced modularly, which are used to
communicate with remote processors.

As for user space, one can get notifications of different events
of remote processors, like their registrations, through standard
file read operation of the file descriptors related to the exported
character devices. Actions can also be taken into account via
standard write operations to the devices. Besides, the sysfs class
attributes could be accessed conveniently.

Message drivers act as engines to communicate with remote processors.
Currently RPMON_QMI is available which uses QMI infrastructures
on Qualcomm SoC Platforms.

RPMON_QMI implements a kind of communication routine for RPMON to
communicate with remote processors through QMI infrastructure.
RPMON_QMI itself is designed as a modular framework that would
introduce different kind of message sets which are binding to
different services.

RPMON_QMI creates a device of rpmon_device type for each remote
processor endpoint. All the endpoint devices share an unique set
of QMI suite.

RPMON_QMI_MSG_V01 implements a RPMON_QMI message set for connection check.
RPMON_QMI defines its message types modularly. Each rpmon service
binds to a message set and introduced as a module. This version 1.0
message set could be used for connection checking of remote processors.

RPMON_QMI messages depend on QCOM_QMI_HELPERS and should be updated
together with QMI related modules.

Changes since v1:
 - Addressed review comments from Randy
Changes since v2:
 - Added Cc list
 - Commit log typo fixing
 - Use the ARRAY_SIZE instead of calculations of multiple sizeof()
 - Use micros for qmi message tly_type fields

Wang Wenhu (3):
  driver: rpmon: new driver Remote Processor Monitor
  driver: rpmon: qmi message version 01
  driver: rpmon: add rpmon_qmi driver

 drivers/Kconfig                  |   2 +
 drivers/Makefile                 |   1 +
 drivers/rpmon/Kconfig            |  54 ++++
 drivers/rpmon/Makefile           |   3 +
 drivers/rpmon/rpmon.c            | 506 +++++++++++++++++++++++++++++++
 drivers/rpmon/rpmon_qmi.c        | 431 ++++++++++++++++++++++++++
 drivers/rpmon/rpmon_qmi.h        |  76 +++++
 drivers/rpmon/rpmon_qmi_msg_v1.c | 258 ++++++++++++++++
 include/linux/rpmon.h            |  68 +++++
 9 files changed, 1399 insertions(+)
 create mode 100644 drivers/rpmon/Kconfig
 create mode 100644 drivers/rpmon/Makefile
 create mode 100644 drivers/rpmon/rpmon.c
 create mode 100644 drivers/rpmon/rpmon_qmi.c
 create mode 100644 drivers/rpmon/rpmon_qmi.h
 create mode 100644 drivers/rpmon/rpmon_qmi_msg_v1.c
 create mode 100644 include/linux/rpmon.h

-- 
2.17.1

