Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 404E46C5AA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 00:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjCVXkb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 19:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjCVXkR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 19:40:17 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289381BEC
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 16:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679528391; x=1711064391;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OGHCWQte3YjhGFJqMvAzpeC0UB5PdXMpxYWRoLzMsDk=;
  b=lzq9BtKjXsyrELeTnz5mMjRIwd/bPGShaDf3cD694LBsbjSmt2jzmS7q
   U5t9KrhldNNoLgg+GDrGmMy0/abs+JMk29X6lv3mhU6FkdFq07e3LZf2i
   2zda6BhM4DLtcT3BfKRO8Uvs4mbR2a9W3fnUl3gBY+2AbOwgVRyJAM5SW
   CXrlroPRvt6WsTZ8mzIR4NGziy1rFt8+gDIe0+tT12IDvZ1g3UrtGW7kG
   7pIyPxqEsNMbg+uAfQfLqmZu3485JgAl6wfYShYLNF905xpj6myv7DCoU
   c/cJFESk0CIiOEOsNrqYoE2L/6cAYwAyx1POR4ATIVrcA7KIElPJwGEVp
   A==;
X-IronPort-AV: E=Sophos;i="5.98,283,1673884800"; 
   d="scan'208";a="338331052"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2023 07:39:06 +0800
IronPort-SDR: VUKGiq8Q+dTliWuUOK7wJ6cYIeksNqoeEVCWjPnx2j5mp4O1fynoTSRy/mVPuDKfNc+6B5HSdN
 8/dSn4j+1IEiUPueFmw3ZQWrg1Ei2M7jvzWJCBsWBr30NFiyV4Y+nOigjFwddzqdE2vYyFR/ue
 IutI7ujTLwgbaRQ9nBTrjcVyYLd5qMvlJfLNWL+v/MdCcebKPlqhkBR97rH3VbStgiqgbrA5HU
 CPvGLzxGp561eLpimLSYAl3l3176YmFmFrCq2tGM7wzllvV4fIw+QkMK+/HPVZSlsaAbapGdcR
 6BU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 15:49:42 -0700
IronPort-SDR: Q0O0ngLwiRIL1ZrsHaEtujiV/RnvsFdoKO2ormxl138Mc6DWmop4+imVmmQTQn4aJ9ADFLRdSZ
 hMVt5+fEdQl6ddPjXjybGrHTVW3egSpDFTAaQ1QNRg69dtNHG4PnvCwxesu+FIWMx5KYzjmlbu
 WxjsHhoXbvdvMVOBZ/U/hEbW/nOXGG4eTFHvGjixANtoSAb/ytqaTBEWenbzxaI6SdDqfSP6ID
 cxoXYGJaepZ5LnTm3fnFDaiy//XeDmdWmCuRudWUBap/RjOxfY2gC0ymMOXQNtJJs9d/S99lUK
 FGE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Mar 2023 16:39:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PhlL20rtwz1RtW0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 16:39:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1679528345; x=1682120346; bh=OGHCWQte3YjhGFJqMvAzpeC0UB5PdXMpxYW
        RoLzMsDk=; b=h9QS/6X7fJDm4CcTVHlExM/CvxKaQSHcJ3sMvlNeQIXATYROTa4
        ZSV+nLM79WCXq1AXsi8715n3y057dj2zZBTZOrGPgj9jkm1supLwusYWL+/prSZI
        mKf+YP1brVHXyAphtOar6qqhijH9KBR8i//9QjNisAvDcoaP8ZHx8+MfDD9yRlIq
        7KpzNJXuedKjhXsnAneHlHuEBq9aiR4Sv2avbjMPEZ/pxQHfL1Fnjv8S9jzQgYjO
        SRyztT4rEec+ORnjWXzFsMgcTgY8DXePtzO0bcTkiIX3hTkZboWSqZmd94itO88t
        SY88AkV3V1JB+53ucoVW86pRXi57DYvMVbQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id DlbZaU1swbBV for <linux-arm-msm@vger.kernel.org>;
        Wed, 22 Mar 2023 16:39:05 -0700 (PDT)
Received: from [10.225.163.96] (unknown [10.225.163.96])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PhlKy5gVBz1RtVm;
        Wed, 22 Mar 2023 16:39:02 -0700 (PDT)
Message-ID: <1f963db6-5404-e483-69ac-fe8eaf5bb478@opensource.wdc.com>
Date:   Thu, 23 Mar 2023 08:39:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: mfd: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
References: <20230322173519.3971434-1-robh@kernel.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230322173519.3971434-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/23/23 02:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

