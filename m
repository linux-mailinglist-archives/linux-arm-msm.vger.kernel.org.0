Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE5A1D3255
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgENOL7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:11:59 -0400
Received: from mga11.intel.com ([192.55.52.93]:32433 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgENOL7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:11:59 -0400
IronPort-SDR: I+BQK+T2Ximn6NB8vzXJGBDshlXEr0XKMBttE4kl0imBfzY2Ss2dfEJ0GU0Pgx3kkIscXJU6Bc
 bqlbJIsomzyw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 07:11:44 -0700
IronPort-SDR: fZyp5vUT6UTSh3iJO3CNXFXOD3m0LnDKD8f9V3TvjC0gJjuorX/7ldrH3BvB6jRXcP+fymjJoo
 BlRSRLanDT3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; 
   d="scan'208";a="298722237"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 14 May 2020 07:11:40 -0700
Subject: Re: [PATCH REPOST v13 0/4] usb: xhci: Add support for Renesas USB
 controllers
To:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?Q?Andreas_B=c3=b6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org
References: <20200514122039.300417-1-vkoul@kernel.org>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 mQINBFMB0ccBEADd+nZnZrFDsIjQtclVz6OsqFOQ6k0nQdveiDNeBuwyFYykkBpaGekoHZ6f
 lH4ogPZzQ+pzoJEMlRGXc881BIggKMCMH86fYJGfZKWdfpg9O6mqSxyEuvBHKe9eZCBKPvoC
 L2iwygtO8TcXXSCynvXSeZrOwqAlwnxWNRm4J2ikDck5S5R+Qie0ZLJIfaId1hELofWfuhy+
 tOK0plFR0HgVVp8O7zWYT2ewNcgAzQrRbzidA3LNRfkL7jrzyAxDapuejuK8TMrFQT/wW53e
 uegnXcRJaibJD84RUJt+mJrn5BvZ0MYfyDSc1yHVO+aZcpNr+71yZBQVgVEI/AuEQ0+p9wpt
 O9Wt4zO2KT/R5lq2lSz1MYMJrtfFRKkqC6PsDSB4lGSgl91XbibK5poxrIouVO2g9Jabg04T
 MIPpVUlPme3mkYHLZUsboemRQp5/pxV4HTFR0xNBCmsidBICHOYAepCzNmfLhfo1EW2Uf+t4
 L8IowAaoURKdgcR2ydUXjhACVEA/Ldtp3ftF4hTQ46Qhba/p4MUFtDAQ5yeA5vQVuspiwsqB
 BoL/298+V119JzM998d70Z1clqTc8fiGMXyVnFv92QKShDKyXpiisQn2rrJVWeXEIVoldh6+
 J8M3vTwzetnvIKpoQdSFJ2qxOdQ8iYRtz36WYl7hhT3/hwkHuQARAQABtCdNYXRoaWFzIE55
 bWFuIDxtYXRoaWFzLm55bWFuQGdtYWlsLmNvbT6JAjsEEwECACUCGwMGCwkIBwMCBhUIAgkK
 CwQWAgMBAh4BAheABQJTAeo1AhkBAAoJEFiDn/uYk8VJOdIP/jhA+RpIZ7rdUHFIYkHEKzHw
 tkwrJczGA5TyLgQaI8YTCTPSvdNHU9Rj19mkjhUO/9MKvwfoT2RFYqhkrtk0K92STDaBNXTL
 JIi4IHBqjXOyJ/dPADU0xiRVtCHWkBgjEgR7Wihr7McSdVpgupsaXhbZjXXgtR/N7PE0Wltz
 hAL2GAnMuIeJyXhIdIMLb+uyoydPCzKdH6znfu6Ox76XfGWBCqLBbvqPXvk4oH03jcdt+8UG
 2nfSeti/To9ANRZIlSKGjddCGMa3xzjtTx9ryf1Xr0MnY5PeyNLexpgHp93sc1BKxKKtYaT0
 lR6p0QEKeaZ70623oB7Sa2Ts4IytqUVxkQKRkJVWeQiPJ/dZYTK5uo15GaVwufuF8VTwnMkC
 4l5X+NUYNAH1U1bpRtlT40aoLEUhWKAyVdowxW4yGCP3nL5E69tZQQgsag+OnxBa6f88j63u
 wxmOJGNXcwCerkCb+wUPwJzChSifFYmuV5l89LKHgSbv0WHSN9OLkuhJO+I9fsCNvro1Y7dT
 U/yq4aSVzjaqPT3yrnQkzVDxrYT54FLWO1ssFKAOlcfeWzqrT9QNcHIzHMQYf5c03Kyq3yMI
 Xi91hkw2uc/GuA2CZ8dUD3BZhUT1dm0igE9NViE1M7F5lHQONEr7MOCg1hcrkngY62V6vh0f
 RcDeV0ISwlZWuQINBFMB0ccBEACXKmWvojkaG+kh/yipMmqZTrCozsLeGitxJzo5hq9ev31N
 2XpPGx4AGhpccbco63SygpVN2bOd0W62fJJoxGohtf/g0uVtRSuK43OTstoBPqyY/35+VnAV
 oA5cnfvtdx5kQPIL6LRcxmYKgN4/3+A7ejIxbOrjWFmbWCC+SgX6mzHHBrV0OMki8R+NnrNa
 NkUmMmosi7jBSKdoi9VqDqgQTJF/GftvmaZHqgmVJDWNrCv7UiorhesfIWPt1O/AIk9luxlE
 dHwkx5zkWa9CGYvV6LfP9BznendEoO3qYZ9IcUlW727Le80Q1oh69QnHoI8pODDBBTJvEq1h
 bOWcPm/DsNmDD8Rwr/msRmRyIoxjasFi5WkM/K/pzujICKeUcNGNsDsEDJC5TCmRO/TlvCvm
 0X+vdfEJRZV6Z+QFBflK1asUz9QHFre5csG8MyVZkwTR9yUiKi3KiqQdaEu+LuDD2CGF5t68
 xEl66Y6mwfyiISkkm3ETA4E8rVZP1rZQBBm83c5kJEDvs0A4zrhKIPTcI1smK+TWbyVyrZ/a
 mGYDrZzpF2N8DfuNSqOQkLHIOL3vuOyx3HPzS05lY3p+IIVmnPOEdZhMsNDIGmVorFyRWa4K
 uYjBP/W3E5p9e6TvDSDzqhLoY1RHfAIadM3I8kEx5wqco67VIgbIHHB9DbRcxQARAQABiQIf
 BBgBAgAJBQJTAdHHAhsMAAoJEFiDn/uYk8VJb7AQAK56tgX8V1Wa6RmZDmZ8dmBC7W8nsMRz
 PcKWiDSMIvTJT5bygMy1lf7gbHXm7fqezRtSfXAXr/OJqSA8LB2LWfThLyuuCvrdNsQNrI+3
 D+hjHJjhW/4185y3EdmwwHcelixPg0X9EF+lHCltV/w29Pv3PiGDkoKxJrnOpnU6jrwiBebz
 eAYBfpSEvrCm4CR4hf+T6MdCs64UzZnNt0nxL8mLCCAGmq1iks9M4bZk+LG36QjCKGh8PDXz
 9OsnJmCggptClgjTa7pO6040OW76pcVrP2rZrkjo/Ld/gvSc7yMO/m9sIYxLIsR2NDxMNpmE
 q/H7WO+2bRG0vMmsndxpEYS4WnuhKutoTA/goBEhtHu1fg5KC+WYXp9wZyTfeNPrL0L8F3N1
 BCEYefp2JSZ/a355X6r2ROGSRgIIeYjAiSMgGAZMPEVsdvKsYw6BH17hDRzltNyIj5S0dIhb
 Gjynb3sXforM/GVbr4mnuxTdLXQYlj2EJ4O4f0tkLlADT7podzKSlSuZsLi2D+ohKxtP3U/r
 42i8PBnX2oAV0UIkYk7Oel/3hr0+BP666SnTls9RJuoXc7R5XQVsomqXID6GmjwFQR5Wh/RE
 IJtkiDAsk37cfZ9d1kZ2gCQryTV9lmflSOB6AFZkOLuEVSC5qW8M/s6IGDfYXN12YJaZPptJ fiD/
Message-ID: <4ff01657-c844-d52a-0b42-81a50327a5f8@linux.intel.com>
Date:   Thu, 14 May 2020 17:14:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200514122039.300417-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14.5.2020 15.20, Vinod Koul wrote:
> This series add support for Renesas USB controllers uPD720201 and uPD720202.
> These require firmware to be loaded and in case devices have ROM those can
> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> 
> This includes patches from Christian which supported these controllers w/o
> ROM and later my patches for ROM support and debugfs hook for rom erase and
> export of xhci-pci functions.
> 
> Changes in v13-repost:
>  - drop debugfs patch 5 and repost
> 
> Changes in v13:
>  - Make rensesas as independent module invoke by xhci-pci which can be
>    selected by users of such hardware
> 
> Changes in v12:
>   - Restore back module name for xhci-pci, so now renesas is a separate
>     module, export init/exit routines from renesas modules
>   - Update changelog on patch2
> 
> Changes in v11:
>   - update xhci->quirks and use that in remove function
>   - remove error return renesas_verify_fw_version()
>   - remove renesas_download_rom() and modify renesas_fw_download_image() for
>   reuse
> Changes in v10:
>   remove renesas_xhci_pci_probe and call renesas_xhci_check_request_fw and
>   also cleanup exit code along with it.
> 
> Changes in v9:
>  Make fw load a sync call and have single instance of probe execute,
>    elimating probe/remove races
>  Add quirk for renesas and use that for loading
> 
> Changes in v8:
>  Fix compile error reported by Kbuild-bot by making usb_hcd_pci_probe() take
>  const struct hc_driver * as argument
> 
> Changes in v7:
>  Make a single module which removes issues with module loading
>  Keep the renesas code in renesas file
>  Add hc_driver as argument for usb_hcd_pci_probe and modify hdc drivers to
>    pass this and not use driver_data
>  Use driver data for fw name
>  Remove code to check if we need to load firmware or not
>  remove multiple fw version support, we can do that with symlink in
>    userspace
> 
> Changes in v6:
>  Move the renesas code into a separate driver which invokes xhci-pci functions.
> 
> Changes in v5:
>  Added a debugfs rom erase patch, helps in debugging
>  Squashed patch 1 & 2 as requested by Mathias
> 
> Changes in v4:
>  Rollback the delay values as we got device failures
> 
> Changes in v3:
>   Dropped patch 2 as discussed with Christian
>   Removed aligned 8 bytes check
>   Change order for firmware search from highest version to lowest
>   Added entry for new firmware for device 0x14 as well
>   Add tested by Christian
> 
> Changes in v2:
>   used macros for timeout count and delay
>   removed renesas_fw_alive_check
>   cleaned renesas_fw_callback
>   removed recurion for renesas_fw_download
>   added MODULE_FIRMWARE
>   added comment for multip
> 
> Christian Lamparter (1):
>   usb: renesas-xhci: Add the renesas xhci driver
> 
> Vinod Koul (3):
>   usb: hci: add hc_driver as argument for usb_hcd_pci_probe
>   usb: xhci: Add support for Renesas controller with memory
>   usb: renesas-xhci: Add ROM loader for uPD720201
> 
>  drivers/usb/core/hcd-pci.c          |   7 +-
>  drivers/usb/host/Kconfig            |   9 +
>  drivers/usb/host/Makefile           |   1 +
>  drivers/usb/host/ehci-pci.c         |   6 +-
>  drivers/usb/host/ohci-pci.c         |   9 +-
>  drivers/usb/host/uhci-pci.c         |   8 +-
>  drivers/usb/host/xhci-pci-renesas.c | 645 ++++++++++++++++++++++++++++
>  drivers/usb/host/xhci-pci.c         |  47 +-
>  drivers/usb/host/xhci-pci.h         |  28 ++
>  drivers/usb/host/xhci.h             |   1 +
>  include/linux/usb/hcd.h             |   3 +-
>  11 files changed, 742 insertions(+), 22 deletions(-)
>  create mode 100644 drivers/usb/host/xhci-pci-renesas.c
>  create mode 100644 drivers/usb/host/xhci-pci.h
> 

For all 4 patches:
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

