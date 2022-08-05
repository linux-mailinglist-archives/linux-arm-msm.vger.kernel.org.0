Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D51558AAF8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 14:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240382AbiHEMn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 08:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbiHEMn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 08:43:56 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4381AD98
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 05:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1659703434; i=@lenovo.com;
        bh=Qn3Gn/aPuK5QEqYRBbzdYRfC122sOWYeheka5XCOCrQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=s12+6RBIlL2OUwwTvF2kKbyoVCtQKtihgX94ZRAVR/KaKlynB+sT/ZM4n4GYbsdIE
         S77hYorAvS2WMMFC61TrcOSeE/ClN3t8kQZFQhLYW1qBq+ZL9h0uDM+LiYKOM4C/W/
         jxZ8KeRGfoCFCD67P6QmK8nIVF/Gvc0JCoPGD12xDNLXA1EQI8zTGauMAfrOLQTqLE
         /wPUm+B565ZQwCBdyET+I199+GnWc0ddFmToPusPV0gNQCUgC53Y/QgcgVp+O/4+2U
         KUZmr3N2a1DyIAraGUDtZf/t0tvcAmGTCELogvgxdWqID+w4UcPmAyXyzDwSg7atPh
         Crhc/L9ibEruw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLJsWRWlGSWpSXmKPExsWSoS+Vo9sp8Db
  J4NYaOYvT+9+xWEw8/5PNYuL+s+wWB5bbOLB4bFrVyeZx59oeNo/Pm+QCmKNYM/OS8isSWDNO
  PTzHUrBNquLix8lMDYy7xboYuTgYBZYyS/TdPsAC4SxilVi+YwOU08kk0ffhBDOIIyQwh0liy
  rfJbBDOASaJHWsXs3cxcnJICBxnlOhe5Q6R6GSU2L31B1TVRCaJQ4vnMEI4jxklVhxbyAbSIi
  TwkFFi9fMkEJtXwFaibfokFhCbRUBFYnfzI1aIuKDEyZlPwOKiAhESDx9B1AgLuEs833WJCcR
  mFhCXuPVkPpgtIlAvseTiSaD5HEBxBYnnP2MhVhVIXL73jBHEZhPQltiy5RdYCaeAncS556oQ
  UzQlWrf/Zoew5SWat85mhmhVlvjVf54Z4kkFiVW/vjNC2AkSzVOOQtmSEtduXoAGhKzE0bNzW
  EDGSwj4ShyeGAER1pXYdHM5C4QtJ3Gq9xwThC0vsXPjbZYJjDqzkPw7C8lfs5BcNwvJdQsYWV
  YxWiYVZaZnlOQmZuboGhoY6Boamuia6JqZ6iVW6SbqlRbrpiYWl+ga6iWWF+ulFhfrFVfmJue
  k6OWllmxiBKajlCIWxx2MS3p+6h1ilORgUhLl3cP/NkmILyk/pTIjsTgjvqg0J7X4EKMMB4eS
  BO96TqCcYFFqempFWmYOMDXCpCU4eJREeLX4gNK8xQWJucWZ6RCpU4z2HFe27d3LzPHgxEkge
  fXKFSB5bf2CfcxCLHn5ealS4rzzQTYKgLRllObBDYWl8kuMslLCvIwMDAxCPAWpRbmZJajyrx
  jFORiVhHlX8QJN4cnMK4Hb/QroLCags7j+vwY5qyQRISXVwMS/Odxs435vFpat389bXnMOviN
  y97CuOGNKv55AzvTe8zI12avXdbDLvvqR9lwl+Y3C5ZLX5ycJTy25sy9lQsS6l3c8t7KHt07f
  84zjpn/mlp6C/EPRvVI+XvNuLTDba7U/h2sKe/hSXXfD5kvKh1177Gdc3HjvRq/PhJ3tq5n/f
  D7eIpaub+O6/PuiLNVZdbwsTxS3um52L/vAtJp3Q8CdHx/+ONdnxkfJr7XxVlUV6CqMipyw4u
  ELv73s0hq5zXzTe/lfrPnFY522qePaC75T+896pQRuOSC+4t2r7cctLJf5u7mZfH8oZxKyNF1
  Akb1jqom3lvEfT3mGOHGrg5U+azZqmjxcGe1xeu3xD0osxRmJhlrMRcWJAJFjef5gBAAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-706.messagelabs.com!1659703431!54009!1
X-Originating-IP: [104.47.26.108]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12406 invoked from network); 5 Aug 2022 12:43:53 -0000
Received: from mail-sgaapc01lp2108.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.108)
  by server-15.tower-706.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2022 12:43:53 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFfa/UCMFdKr9/JA8mbKq50nhV+EpsI3nqwHinuIRY+x1TummqYKNcCm4k09gYvwG6qo8AxqGz5STxQGdj0XL993RtTUMuU4CzMhJs+/1M9Q8zYUtw+ievM/BdloKDoMO31Wk61jIZhbR00Pp0/Q9hxbd8sqQbhVg03xuL/90zqHwXqDDTKQXCmm7aTsUjSYq/NP/PmeSJ4Dba4/nfqfq6kDKzZGaydUTlAN1c4hDB24nDULuOgw7q7C2Q3kuEVyXdtE8XK4REh39ZrkIdovsPinnVIvtEv8v1uVH6osikeUoCL9fuwdhavIiZcrwHeUfjnao+yRDFwlvmjvPlkeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn3Gn/aPuK5QEqYRBbzdYRfC122sOWYeheka5XCOCrQ=;
 b=V9gKtJeNE2ohrLfLQvQozJHZSrh0pm9XWyHss6fgm6JzlMF9tF7W2GAF77K8oVT3vZ7wUANSTtDEV8caRVo/eYRKrilPb/T9fbowuvlWe8l5b6yJnzRlo5HMj0JnXXGqVvrsuvQ5N421LRaEgizEMrqnc3Z+36uZoeeFOF7ZNdP9a3y7BvCiBQDzUMR7rbiA9HuNDQPXgqCigVLcGQu/RfUMhGo849qMCONjd8Rb+jleFUTsSkzfEE82Mk0IgEyNccyWZj2HmpnDOGrEXLRviEbEb5qSHsY/pMhVbcotnWB8+w6AiEmYOKnMBka9wFjqYCwoTbbrHyYAgCaJNDMwyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=linaro.org smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from TYCPR01CA0094.jpnprd01.prod.outlook.com (2603:1096:405:3::34)
 by PSAPR03MB5413.apcprd03.prod.outlook.com (2603:1096:301:22::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.12; Fri, 5 Aug
 2022 12:43:50 +0000
Received: from TYZAPC01FT032.eop-APC01.prod.protection.outlook.com
 (2603:1096:405:3:cafe::b6) by TYCPR01CA0094.outlook.office365.com
 (2603:1096:405:3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Fri, 5 Aug 2022 12:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 TYZAPC01FT032.mail.protection.outlook.com (10.118.152.128) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14 via Frontend Transport; Fri, 5 Aug 2022 12:43:50 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.28; Fri, 5 Aug
 2022 08:43:48 -0400
Received: from [10.46.215.48] (10.46.215.48) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.28; Fri, 5 Aug
 2022 08:43:48 -0400
Message-ID: <c5b97755-608f-48e6-40ae-22095866a110@lenovo.com>
Date:   Fri, 5 Aug 2022 08:43:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [External] Re: qcom: Add firmware for Lenovo ThinkPad X13s
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-firmware@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
CC:     <bjorn.andersson@linaro.org>
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
 <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.46.215.48]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fcaa5e4-1ca4-4acc-9790-08da76e025ce
X-MS-TrafficTypeDiagnostic: PSAPR03MB5413:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkS6CPi4Dy+Qq+6UWY+WF+kDBgCM2/9VFh1KJqLfiTlXcq1fqeRWii6qM5vrJi8UBAZsdEX5Jahq/GWP3FX3OhTJXUA5UtATJ6+TWQeyIVQvS431F0P0sbo0Z3WXANDwrt3kv88nTvWm6VsIUdOF9/ZY82H7Dkydz6T2eneHjpq43ZT7FHxqh1dc4rJcEH6IdJqdSFiY2FPQw3U2AfXst1W4SQSbZzoxbfLSSt9iz1bFc7ylpyLCtVt3JKFT9bTFzNVK0zk74rFZTimLditzXwe40JZ0yvnGchZu1vWLTrOdbAHqVMkjA+30nsqqbjv3ig/l82pXCWpMEGZZTWUfNrFl5kaQhJxd8DdQZoPF5G0Mc8MaOmwOwYpurLXWISm3TjzSg2hWrBTktK71l5aAkwrg3o9cdrZ+ny/ztFHEAWMFIgwI6ZP++hcPknjHSa+VtJlqjpEsYHbzQUSJtnOw73LRND30ohFfBJeYSQvtLw38wUEN4h+glGFnf+zsZkWJxSPs0NNTyLpy5GIBAImcL07UFY8YxF+JkksV829JT9XBJAy/FDn5R6qJ+emmnXoytnfY1111ePARGUjKcZ4WoKc7WEqlQBe/ElPb6J2RmwM3sYGYBo+uichR138q5XllUPCT2+b8s00nryQxpFVbYWrQ8b+znIH+krq/Dn29BF4+RaHazR+KLSF+xYlqwD0x2eEMVzWolX6j8iXJ4jrENSLhqoBPatHSCn4K365MQyhU18nXJnMidaLffskxRAgiCNysuGc+m4CuyyaodAhN+b7KEh2sJMEgbpTKb2RdAdeBEXxdM9Epu2UabP8YTnDUvU4maHDFQGBHe0xaEQdtpKcvXo6DvMqK5TtNNAi5QSiSldRzgb3y2KwWF6IJAas5YZRxzCDwgN+hU+54r8dvKvWNLUgWCbNZ4iWYZ7YL30s=
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(40470700004)(36840700001)(46966006)(86362001)(82960400001)(53546011)(41300700001)(31686004)(36756003)(47076005)(336012)(81166007)(19627235002)(82740400003)(2906002)(26005)(426003)(356005)(2616005)(70206006)(83380400001)(966005)(316002)(4326008)(110136005)(82310400005)(8676002)(40460700003)(36860700001)(478600001)(5660300002)(36906005)(186003)(40480700001)(16576012)(31696002)(16526019)(70586007)(8936002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 12:43:50.1489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcaa5e4-1ca4-4acc-9790-08da76e025ce
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT032.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5413
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On 8/5/22 05:36, Dmitry Baryshkov wrote:
> On 03/08/2022 23:37, Mark Pearson wrote:
>> The following changes since commit
>> 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>>
>>    amdgpu partially revert "amdgpu: update beige goby to release 22.20"
>> (2022-07-25 14:16:04 -0400)
>>
>> are available in the Git repository at:
>>
>>   
>> https://github.com/mrhpearson/linux-firmware>>> lenovo-thinkpad-x13s
>>
>> for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
>>
>>    qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07
>> -0400)
> 
> Mark, it's so great to see firmware packages for Lenovo laptops being
> submitted!
> 
>>
>> ----------------------------------------------------------------
>> Mark Pearson (1):
>>        qcom: Add firmware for Lenovo ThinkPad X13s
>>
>>   WHENCE                             |   8 ++++++++
>>   qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
>>   qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
>>   qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
>>   qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
>>   qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
>>   qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
>>   qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
>>   qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
>>   9 files changed, 109 insertions(+)
>>   create mode 100644 qcom/LENOVO/21BX/adspr.jsn
>>   create mode 100644 qcom/LENOVO/21BX/adspua.jsn
>>   create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
>>   create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
>>   create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
>>   create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
>>   create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
>>   create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn
> 
> I think it's the time to settle onto firmware paths for the
> Qualcomm-based devices. At some point it was proposed to use
> qcom/<SoC>/device/*mbn.
> 
> So, in your case it could be qcom/sc8280xp/Lenovo_21BX/
> 
> Bjorn, WDYT?
> 
For this I completely defer to Bjorn as he's been helping me with this
exercise :)
If it needs updating I can do that no problem - just let me know

(One minor note - I'm on vacation and offline next week...so there will
be a pause in responses after tomorrow)

> 
> P.S. Can we hope to get firmware for older laptops to be published too?
> It would be really great if it would be possible to provide full support
> for Yoga C630 or Flex5G using redistributable firmware from linux-firmware.
> 
I looked into this previously for the C630 and was nacked I'm afraid.

Going back to the older platforms is a harder ask unfortunately because
along with the FW you really need changes in the boot loader and I know
I won't win that argument.

I'll try again once we get a bit further along with this platform but
realistically, the chances of it happening are small. I'm (quite openly)
using this PoC project to prove that we can do Linux on one of our ARM
laptops and then hope to use our experiences to drive future platforms
and get it included fully in the Linux cert program. Right now the X13s
is a trial/test project to see how far we can push it.
