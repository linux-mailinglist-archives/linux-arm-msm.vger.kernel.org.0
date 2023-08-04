Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F89A770232
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 15:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbjHDNtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 09:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbjHDNtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 09:49:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D486D1;
        Fri,  4 Aug 2023 06:49:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B017962034;
        Fri,  4 Aug 2023 13:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A26C433C8;
        Fri,  4 Aug 2023 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691156960;
        bh=c7G+cSSmTcUDFu9aTC30DcjnKRIDYVyLQN36jS76iIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tkt7iJqPdKyEzqngJKRHev6ZDoYgz/9J6ssnKz+lwdIdSHxZaym6ppX+bdKqy4eJ2
         yjOULsdE5OZKmZ9GEfegz2S4NjuVFqa2YCaW4l0MWEfcjGy3/dt/LO/ZoIbf5qmWZw
         SiUi3jOf5PZlN+vYqhcar9gtRAGOGBwyGlwS26cQ=
Date:   Fri, 4 Aug 2023 15:49:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Trilok Soni <quic_tsoni@quicinc.com>
Cc:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Alex Elder <elder@ieee.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH V25 0/3] misc: Add driver support for Data Capture and
 Compare unit(DCC)
Message-ID: <2023080408-zoom-defraud-1ae8@gregkh>
References: <cover.1687945879.git.quic_schowdhu@quicinc.com>
 <f25f8c43-2996-23ff-e6af-9e39b7fced86@quicinc.com>
 <774b688f-0324-9097-6504-58d15a3e6afb@quicinc.com>
 <2023080438-reacquire-obsessed-3e81@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2023080438-reacquire-obsessed-3e81@gregkh>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 04, 2023 at 03:47:26PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 03, 2023 at 07:35:18AM -0700, Trilok Soni wrote:
> > On 8/3/2023 12:06 AM, Souradeep Chowdhury wrote:
> > > 
> > > 
> > > On 6/28/2023 3:53 PM, Souradeep Chowdhury wrote:
> > 
> > ...
> > 
> > > > 
> > > > https://git.codelinaro.org/clo/le/platform/vendor/qcom-opensource/tools/-/tree/opensource-tools.lnx.1.0.r176-rel/dcc_parser
> > > > 
> > > > Changes in v25
> > > > 
> > > > * Updated the documentation of the structure dcc_config_entry as per
> > > > the comments in V23
> > > > * Updated the documentation of the dcc Kconfig definition as per
> > > > comment in V24
> > > > * Used u64 where applicable
> > > > * Removed the mutex locks where it is not needed
> > > > * Removed the use of unlikely keyword
> > > > * Renamed "nr_link_list" to "max_link_list"
> > > > 
> > > > Souradeep Chowdhury (3):
> > > >    dt-bindings: misc: qcom,dcc: Add the dtschema
> > > >    misc: dcc: Add driver support for Data Capture and Compare unit(DCC)
> > > >    MAINTAINERS: Add the entry for DCC(Data Capture and Compare) driver
> > > >      support
> > > > 
> > > >   Documentation/ABI/testing/debugfs-driver-dcc  |   10 +-
> > > >   .../devicetree/bindings/misc/qcom,dcc.yaml    |   44 +
> > > >   MAINTAINERS                                   |    8 +
> > > >   drivers/misc/Kconfig                          |    8 +
> > > >   drivers/misc/Makefile                         |    1 +
> > > >   drivers/misc/qcom-dcc.c                       | 1312 +++++++++++++++++
> > > >   6 files changed, 1378 insertions(+), 5 deletions(-)
> > > >   create mode 100644 Documentation/devicetree/bindings/misc/qcom,dcc.yaml
> > > >   create mode 100644 drivers/misc/qcom-dcc.c
> > > 
> > > Gentle Ping
> > 
> > Thank you for the reminder Souradeep. Greg and others, please see if we need
> > any changes here or it can be picked up?
> 
> It would help if the code would actually build:
> 
> drivers/misc/qcom-dcc.c: In function ‘ready_read’:
> drivers/misc/qcom-dcc.c:853:13: error: unused variable ‘ret’ [-Werror=unused-variable]
>   853 |         int ret = 0;
>       |             ^~~
> 
> {sigh}
> 
> How in the world was this ever tested?

Ok, next time I want to see some QCOM engineers to sign off on this that
it was actually tested and they can back it up that this is ready to be
merged.  When the code doesn't even build, that is a huge red flag that
this whole thing is being rushed as it obviously was never tested in the
form that was submitted for inclusion.

You all know better than this.

greg k-h
