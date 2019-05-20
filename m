Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9DB923092
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 11:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730272AbfETJlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 05:41:42 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:45263 "EHLO
        esa3.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfETJlm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 05:41:42 -0400
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none; spf=None smtp.pra=ian.jackson@citrix.com; spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com; spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
  receiver=esa3.hc3370-68.iphmx.com;
  envelope-from="Ian.Jackson@citrix.com";
  x-sender="ian.jackson@citrix.com";
  x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
  Ian.Jackson@citrix.com is inclined to not designate
  23.29.105.83 as permitted sender) identity=mailfrom;
  client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
  envelope-from="Ian.Jackson@citrix.com";
  x-sender="Ian.Jackson@citrix.com";
  x-conformance=sidf_compatible; x-record-type="v=spf1";
  x-record-text="v=spf1 include:spf.citrix.com
  include:spf2.citrix.com include:ironport.citrix.com
  exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
  client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
  envelope-from="Ian.Jackson@citrix.com";
  x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
  x-conformance=sidf_compatible
IronPort-SDR: dnz1Zx+CAoiM3RfLC4Bmi/p8WvU7bajFuyeAs59B/Mn7RamN0mPE6Nb73DFK8O6GY+LUpRZdkC
 WkZDgDWgMV3uWeUdEuiU8nXB5qusrEtfKVkmYfsYNWJ79+eL4AbTv/WRIpdyeR0jluInvolqnT
 ZTqCo6geGsJjvUaizZw4CORi+J4Y3QWBJC246L21RuvgbZzhzOEUHeISQqBqgjWwiWuPmPvYI7
 a4oarXwDsbrPJ9EC2kR+PSXsByW6JXB2oPf7Hc6Fh4PXtlnv2Gx1C4GgWgkbr84k+o4hQTS6b3
 6wY=
X-SBRS: 2.7
X-MesageID: 649610
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="649610"
From:   Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <23778.30265.117488.781364@mariner.uk.xensource.com>
Date:   Mon, 20 May 2019 10:41:13 +0100
To:     Stephen Boyd <swboyd@chromium.org>
CC:     Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Julien Grall <julien.grall@arm.com>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 1/3] firmware: qcom_scm: Use proper types for dma mappings
In-Reply-To: <20190517210923.202131-2-swboyd@chromium.org>
References: <23774.56553.445601.436491@mariner.uk.xensource.com>
        <20190517210923.202131-2-swboyd@chromium.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stephen Boyd writes ("[PATCH 1/3] firmware: qcom_scm: Use proper types for dma mappings"):
> We need to use the proper types and convert between physical addresses
> and dma addresses here to avoid mismatch warnings. This is especially
> important on systems with a different size for dma addresses and
> physical addresses. Otherwise, we get the following warning:

Thanks.  Do you expect this to be a backport candidate and if so how
far back do you think it will go ?  To be honest, I am not really
convinced that backporting this would be a service to users.  The
situation I have, where I changed the compiler but kept the old kernel
code and old configuration, is going to be fairly rare.

I think I should probably therefore disable this driver in the config
on stable branches of Linux, at least.

Thanks,
Ian.
