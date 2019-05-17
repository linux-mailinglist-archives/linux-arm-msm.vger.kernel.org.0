Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0135A21B6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 18:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbfEQQR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 12:17:56 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:14361 "EHLO
        esa3.hc3370-68.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729164AbfEQQR4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 12:17:56 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 May 2019 12:17:56 EDT
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none; spf=None smtp.pra=ian.jackson@citrix.com; spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com; spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
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
  postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
  client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
  envelope-from="Ian.Jackson@citrix.com";
  x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
  x-conformance=sidf_compatible
IronPort-SDR: famv8vIoPsnOKwXmdlWDIEhBOt4cUXzX4+f54NPc23fAuwffW2raCf5zapUcOXvZCrUq5Z+WxL
 OvnxVL++brFYBNdFnSsQh9HX+6uL5RC1nnLFsA38pvuZFjAhjYmYO80gGJhP49umuplXBqyFpI
 9BJqsXEehd3N/AgHDdYiqJtajO4zHiyWMcaVLRXJUrDr4EFj53LdCD1OIdZwWLMiAWTo6ucC4Q
 pmljpkuuEHr0A0LTbPFkPpH92+R3Q+5aDDcpUU6mGyPpbOpwfRscsAuoBi3ewhp7+XkWW2y+a8
 OpY=
X-SBRS: 2.7
X-MesageID: 589638
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,480,1549947600"; 
   d="scan'208";a="589638"
From:   Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <23774.56553.445601.436491@mariner.uk.xensource.com>
Date:   Fri, 17 May 2019 17:10:17 +0100
To:     Julien Grall <julien.grall@arm.com>
CC:     Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "andy.gross@linaro.org" <andy.gross@linaro.org>,
        "david.brown@linaro.org" <david.brown@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: qcom_scm: Incompatible pointer type build failure
In-Reply-To: <87d9fbc1-5956-2b7b-0b9a-6368e378d0f6@arm.com>
References: <osstest-135420-mainreport@xen.org>
        <23752.17186.527512.614163@mariner.uk.xensource.com>
        <87d9fbc1-5956-2b7b-0b9a-6368e378d0f6@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Julien Grall writes ("qcom_scm: Incompatible pointer type build failure"):
> Thank you for the report.
...> 
> On 30/04/2019 13:44, Ian Jackson wrote:
> > osstest service owner writes ("[linux-4.19 test] 135420: regressions - FAIL"):
> >    drivers/firmware/qcom_scm.c: In function â€˜qcom_scm_assign_memâ€™:
> >    drivers/firmware/qcom_scm.c:469:47: error: passing argument 3 of â€˜dma_alloc_coherentâ€™ from incompatible pointer type [-Werror=incompatible-pointer-types]
...
> > I think this build failure is probably a regression; rather it is due
> > to the stretch update which brings in a new compiler.
> 
> The bug has always been present (and still present in master), it is possible 
> the compiler became smarter with the upgrade to stretch.
> 
> The problem is similar to [1] and happen when the size of phys_addr_t is 
> different to dma_addr_t.
> 
> I have CCed the maintainers of this file.

That was several weeks ago and osstest is still blocked on this.
Can you please advise what CONFIG_* to disable to work around this ?

Ian.
