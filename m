Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D100B43AD81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 09:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbhJZHtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 03:49:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:24597 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230239AbhJZHtY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 03:49:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="227299746"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; 
   d="scan'208";a="227299746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2021 00:46:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; 
   d="scan'208";a="635032871"
Received: from kuha.fi.intel.com ([10.237.72.166])
  by fmsmga001.fm.intel.com with SMTP; 26 Oct 2021 00:46:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 26 Oct 2021 10:46:55 +0300
Date:   Tue, 26 Oct 2021 10:46:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [PATCH 6/6] usb: typec: qcom: Add pm8150b TCPM driver
Message-ID: <YXeyb76jh4bim3lS@kuha.fi.intel.com>
References: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
 <20211025150906.176686-7-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025150906.176686-7-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 25, 2021 at 04:09:06PM +0100, Bryan O'Donoghue wrote:
> The PM8150b contains both a type-c controller and a power-delivery PHY.
> This driver binds both of those blocks together via a virtual TCPM driver.
> 
> qcom-pmic-tcpm.c is responsible for registering with tcpm and wrappers
>                  calls into the type-c and pdphy drivers from tcpm.
>                  Its up to qcom-pmic-tcpm.c to wait for both
>                  qcom-pmic-pdphy.c and qcom-pmic-typec.c to probe before
>                  registering a type-c port
> 
> qcom-pmic-pdphy.c implements a set functions that qcom-pmic-tcpm.c is
>                   responsible for interfacing with the pdphy hardware and
>                   processing power-delivery related calls from tcpm.
> 
> qcom-pmic-typec.c implements a similar interface for the typec hardware
>                   interface and is responsible for notifying and processing
>                   type-c related calls from tcpm.
> 
> In conjunction with appropriate entries in the platform dts we can
> establish a source or sink contract with a PD peer and indeed negotiate SBU
> alternative modes.
> 
> This code provides all of the same functionality as the existing
> qcom typec driver plus power-delivery as well.
> 
> As a result commit 6c8cf3695176 ("usb: typec: Add QCOM PMIC typec detection
> driver") can be deleted entirely.
> 
> References code from Jonathan Marek, Jack Pham, Wesley Cheng, Hemant Kumar,
> Guru Das Srinagesh and Ashay Jaiswal.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  MAINTAINERS                                   |   8 +
>  drivers/usb/typec/Makefile                    |   1 -
>  drivers/usb/typec/qcom-pmic-typec.c           | 262 --------

You removed the file and the Makefile entry, but you left the Kconfig
entry? Please remove that too.

>  drivers/usb/typec/tcpm/Kconfig                |  11 +
>  drivers/usb/typec/tcpm/Makefile               |   1 +
>  .../usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c | 345 ++++++++++
>  .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c    | 577 +++++++++++++++++
>  .../typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h    |  85 +++
>  .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.c    | 593 ++++++++++++++++++
>  .../typec/tcpm/qcom/qcom_pmic_tcpm_typec.h    | 163 +++++
>  10 files changed, 1783 insertions(+), 263 deletions(-)
>  delete mode 100644 drivers/usb/typec/qcom-pmic-typec.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_core.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_pdphy.h
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.c
>  create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_tcpm_typec.h

You don't have a Makefile in that new directory typec/tcpm/qcom?
How do you compile these new drivers?

thanks,

-- 
heikki
