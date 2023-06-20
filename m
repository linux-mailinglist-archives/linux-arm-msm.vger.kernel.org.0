Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61988737545
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 21:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjFTTr1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 15:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjFTTr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 15:47:26 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2082.outbound.protection.outlook.com [40.107.15.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DF310F4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 12:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3X5rY/jDQsRY7rrJjCc2n7t6LaF9hpWs9nkrJCxQW7Q=;
 b=gWMTUBAttDOGQFvjKaf1YKTpipGuxEeOC9tXt/WE/t95RgfJZ2cXmcTY4ZQZPud0RqbWcYz34oGLhuzTLH9L0hBAkkm4SUYHDFnbQvNFpMSKwlHS1tF/jafAbk0O9VU3MJP21UYE+VnFV1V2Bt4uhzS3uV26FkJ+7NCuREvdplY=
Received: from AM5PR0101CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::33) by AS8PR08MB10025.eurprd08.prod.outlook.com
 (2603:10a6:20b:630::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 19:47:21 +0000
Received: from VI1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::36) by AM5PR0101CA0020.outlook.office365.com
 (2603:10a6:206:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 19:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT012.mail.protection.outlook.com (100.127.145.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 19:47:21 +0000
Received: ("Tessian outbound 5154e9d36775:v136"); Tue, 20 Jun 2023 19:47:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa72f2272aa0703e
X-CR-MTA-TID: 64aa7808
Received: from 9e2fbc2a98ab.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id D38702D4-9053-4F3D-B9A6-94CFCB864EB1.1;
        Tue, 20 Jun 2023 19:47:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e2fbc2a98ab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 20 Jun 2023 19:47:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cfi5XttCSJOJ8RaqtXUXE6PqrfzAwRw+UwzD9GiA0xSXZTPbWJTPXr1vdLTUuzy8ICeLBA7HxQ+s9o+UeeXAbO//QNJkdLQ7ll7hrkCYApYeDmQ1sZ+qbXxuwsV0EPcl32fgNdN+q+6iOOkPEiTcfKG8NJQihiDDigPCePYD+0sXRBzC0pQCCj40NOEdKSWHK8je81LIhpwQc/6MvdznI/pGxSzjMWl6tgUlG0arH6IC2ZwC6c/aUb79p6dzT8IfPbptBNkKcwpZBloUR0Vw0esLoTiFPZbuBnuacycJ0+5i1ePERauxzsIqiNw5kR4hANfUKZcMVWZTsFJBN5zOHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3X5rY/jDQsRY7rrJjCc2n7t6LaF9hpWs9nkrJCxQW7Q=;
 b=SfzwOqj3/RUWsNXeg4MobtC4lOwamYq2dmb+8sILdu1IpLCqzTg0hl8g3AhvTxkbWC2G5ZjG2zxx+fb5OMoiCAMdvAil00MLJRek8u/O1qsE+yVOAfYD6DwMGwosjSbCcGjZfGYOOiPpOdqqaEH1KgNpdRFEe+xhbimtlqHcX8GhwKRd9QfIobyPlBUDKwsgKF/Gsk0G2/2mCGo/vyTVtbeVkvEt+KhvUr5C8GvwDsQ9CueWKeo/zJn+EjrV1VMjp1tdfC2mhbhdojty/X/ti4QM45RWpeKGZR/cUdNskKM2p9LE2QXQh4As9DuQKJxuB1ob/95s21apNehQaWLfQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3X5rY/jDQsRY7rrJjCc2n7t6LaF9hpWs9nkrJCxQW7Q=;
 b=gWMTUBAttDOGQFvjKaf1YKTpipGuxEeOC9tXt/WE/t95RgfJZ2cXmcTY4ZQZPud0RqbWcYz34oGLhuzTLH9L0hBAkkm4SUYHDFnbQvNFpMSKwlHS1tF/jafAbk0O9VU3MJP21UYE+VnFV1V2Bt4uhzS3uV26FkJ+7NCuREvdplY=
Received: from AS9PR06CA0673.eurprd06.prod.outlook.com (2603:10a6:20b:49c::17)
 by DU2PR08MB7357.eurprd08.prod.outlook.com (2603:10a6:10:2f0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 19:47:12 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::39) by AS9PR06CA0673.outlook.office365.com
 (2603:10a6:20b:49c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 19:47:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 19:47:11 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 20 Jun
 2023 19:47:10 +0000
Received: from e124191.cambridge.arm.com (10.1.197.45) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 20 Jun 2023 19:47:10 +0000
Date:   Tue, 20 Jun 2023 20:47:08 +0100
From:   Joey Gouly <joey.gouly@arm.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <andersson@kernel.org>, <nd@arm.com>,
        <broonie@kernel.org>, <catalin.marinas@arm.com>,
        <james.morse@arm.com>, <mark.rutland@arm.com>, <maz@kernel.org>,
        <oliver.upton@linux.dev>, <shuah@kernel.org>,
        <suzuki.poulose@arm.com>, <will@kernel.org>,
        <yuzenghui@huawei.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 16/20] arm64: enable Permission Indirection Extension
 (PIE)
Message-ID: <20230620194708.GA585062@e124191.cambridge.arm.com>
References: <20230606145859.697944-1-joey.gouly@arm.com>
 <20230606145859.697944-17-joey.gouly@arm.com>
 <c3598e8e-46a5-c8d6-bf9f-9fb8f6cd346e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c3598e8e-46a5-c8d6-bf9f-9fb8f6cd346e@linaro.org>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AM7EUR03FT008:EE_|DU2PR08MB7357:EE_|VI1EUR03FT012:EE_|AS8PR08MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d83225e-8cf5-4901-c167-08db71c7298c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Qfy9xu5BidToiLQ4SVP9AVaR1ywwLVs2F8w88d7AUPgFA9w1ZDbJkDfkoZ9JdX5Ui2EmIHdIQYL9hll9axxk9XrD0jhhm+f+tW2+MF39vLF4GVa5IXlGQu23ZoTgzPi3tvr2iu6xJZtNxNpqOqzBoKdrZSSoNtasTOBEuGP65m9N9jgzsE++DueoiPy/tYURnd2N+Gn+6dVuinFXw/9dQgZjfGOgVuy8oAONNVx9cqDX9sVZxHl6XfMNkWckwrV0TT2MJQDUn/PcitCM6bIKUxci9wRZ7/PoJtzuU1mdBp2SyA2N/HdChXvahM4fzelFl4J1tFii7/RxaQu8eFrqU+GvIRQcWKETDPLRYMCQ/vp9NlxIGB8/CefSjlwwfmCnzOCSole2ZGhjJ6MTqzySLkeyYC9Q9u3CeNSv4+RZ+EfcEqSMiHm+y06fzgWMYORiO/1rzhlnK02+a8MGPB9N+O4gjxZhCrs9+Xm8oVeYHr+FwZfhX8XBzLRmqC6yYmi9jrkL3/bQPN88YfqN4YyNtcwIm5A1iTYR/9PgahjEBTiV2UnlddNvc6AfKozkCHlgLxFw24+IvUlZSey2T5vri+xF2wYpBEe5zIFpUQx9w/tbWBiUJAexe7JmmuM+PgWmt/I4GKb3ud6UYkiCOl4vZ4QmMpFhm2DXhAZmY5UVuVh3Ro0XmxNob+kKE1+HePod4yt1nP45ND5RJzapkDkft1CzYsOMQlwjenO/Mau3Xeo4R8eZcOp32rGehCA8tav++y76+sOrHDFuEh+jOwAxOw==
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(36840700001)(46966006)(55016003)(36860700001)(2906002)(47076005)(336012)(83380400001)(70206006)(8676002)(7416002)(478600001)(426003)(7696005)(54906003)(70586007)(5660300002)(53546011)(8936002)(44832011)(6916009)(316002)(4326008)(26005)(1076003)(41300700001)(186003)(40480700001)(82740400003)(356005)(81166007)(82310400005)(33656002)(86362001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7357
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VI1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3ae12c21-0c32-4fd4-04b7-08db71c723ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +T83kx0lS9yaizuP5XaXkKedc4RpG3tDJiPATicgxWIiVccWr+cYsplpO+DmnBEoYlhXWTJizVgepGdYK7d5m6L6oFdmDDhV9GwTMwZ/YlSbbu8wbPeBrwOGc5AVeI1gCOwX4WcpXFZkmaxjsekaMvbg/SUy+6ghqv2RpIOfL4/UHg2CHtme1n5dinzGThfa+YG62pEjdzVJuXw8tPHXybRsZQKhObEkuqIn6rVywA2wg5BfUuRJ+fR+LETQBO/T46+nL0cjatLSC3xX80+gWyUCGhe/UVIZwe+v0ceAeAU1EPnm3thBwVDov4DVSRliOnNsrIxySFWPZF6sJlw0DacbXQc+pIHJjzIFZ7AIvZvC1CtrsLGD8s2fd1ofSJstLxGHUM9Wtkjxllp85l2fs2sAEL3ONDV+MqnpxX9Xj8WZs/GEtsz66lzs09jCBDc6Z1V8rJYTuajR0X00HWyicsOibc4VxOszmtwnt2GYKFRyZmiXg7P+hjX/255XO0Zv3DyoCZT546PNC3N1qYvSgQiRV/2TGZm/L6ZwiJJIO3Vf6EhRM06oSE+abMHJ/6zSidCIOOQvBi+tdrw2MzsUVswXjUDDRZWKavRBUlymWwkhE4OJfo+C6UvP3nQLb22QOQSuJIpRMtncNM7iCN8K3+SrIkDpcoI9llHz03BiGUpk5vVL6bdKWhdkGAys0SfAANWtGDPArHnZ+IUJhCFtqt7Dpd/KJ3tvlc3N02eP88RgCgruQF7sDeLFpr2XxuH01pP88puKv1xr3ckz7ftbNg==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(478600001)(186003)(7696005)(86362001)(1076003)(53546011)(26005)(54906003)(426003)(316002)(336012)(82740400003)(83380400001)(70586007)(81166007)(4326008)(70206006)(47076005)(36860700001)(6862004)(8676002)(8936002)(5660300002)(44832011)(2906002)(40460700003)(41300700001)(55016003)(40480700001)(82310400005)(33656002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 19:47:21.1015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d83225e-8cf5-4901-c167-08db71c7298c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10025
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Neil,

On Tue, Jun 20, 2023 at 09:16:05PM +0200, Neil Armstrong wrote:
> Hi Joey,
> 
> On 06/06/2023 16:58, Joey Gouly wrote:
> > Now that the necessary changes have been made, set the Permission Indirection
> > registers and enable the Permission Indirection Extension.
> > 
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> This patch on linux-next causes a great amount of:
> 
> X     xxx.xxxxxx Emulated RAZ for ID register: ISS 0x36002f
> 
> messages printed by the system firmware on the Qualcomm SM8550 SoC,
> and the platform is barely usable.


Not sure what's going on here, and I don't think I have access to that platform.
The new registers are only set a few times, so not sure why it would be RAZ emulating
them a lot. KVM context switches them, but I don't think that platform uses KVM.

Could you try to bisect the actual lines? It would be intersting to know which of the
registers that it's actually causing an issue. It should be taking the .skip_indirection
branch, so only ID_AA64MMFR3_EL1 should be accessed, but it would be good to confirm that
if you can somehow.

Thanks,
Joey
 
> 
> Here is the SoC cpuinfo for reference:
> # cat /proc/cpuinfo
> processor	: 0
> BogoMIPS	: 38.40
> Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
> CPU implementer	: 0x41
> CPU architecture: 8
> CPU variant	: 0x1
> CPU part	: 0xd46
> CPU revision	: 1
> 
> processor	: 1
> BogoMIPS	: 38.40
> Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
> CPU implementer	: 0x41
> CPU architecture: 8
> CPU variant	: 0x1
> CPU part	: 0xd46
> CPU revision	: 1
> 
> processor	: 2
> BogoMIPS	: 38.40
> Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
> CPU implementer	: 0x41
> CPU architecture: 8
> CPU variant	: 0x1
> CPU part	: 0xd46
> CPU revision	: 1
> 
> processor	: 3
> BogoMIPS	: 38.40
> Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
> CPU implementer	: 0x41
> CPU architecture: 8
> CPU variant	: 0x1
> CPU part	: 0xd4d
> CPU revision	: 0
> 
> processor	: 4
> BogoMIPS	: 38.40
> Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
> CPU implementer	: 0x41
> CPU architecture: 8
> CPU variant	: 0x1
> CPU part	: 0xd4d
> CPU revision	: 0
> 
> processor	: 5
> BogoMIPS	: 38.40
> Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
> CPU implementer	: 0x41
> CPU architecture: 8
> CPU variant	: 0x2
> CPU part	: 0xd47
> CPU revision	: 0
> 
> processor	: 6
> BogoMIPS	: 38.40
> Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
> CPU implementer	: 0x41
> CPU architecture: 8
> CPU variant	: 0x2
> CPU part	: 0xd47
> CPU revision	: 0
> 
> processor	: 7
> BogoMIPS	: 38.40
> Features	: fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp asimdhp cpuid asimdrdm jscvt fcma lrcpc dcpop sha3 sm3 sm4 asimddp sha512 asimdfhm dit uscat ilrcpc flagm ssbs sb paca pacg dcpodp flagm2 frint i8mm bti
> CPU implementer	: 0x41
> CPU architecture: 8
> CPU variant	: 0x1
> CPU part	: 0xd4e
> CPU revision	: 0
> 
> The bisect log for reference:
> # bad: [925294c9aa184801cc0a451b69a18dd0fe7d847d] Add linux-next specific files for 20230615
> # good: [858fd168a95c5b9669aac8db6c14a9aeab446375] Linux 6.4-rc6
> git bisect start 'FETCH_HEAD' 'v6.4-rc6'
> # bad: [c20f7e5e521ee3f50b064cdb441f65075ca6eb17] Merge branch 'nand/next' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
> git bisect bad c20f7e5e521ee3f50b064cdb441f65075ca6eb17
> # bad: [9b3c3144b2d3b5022370883e2834887fc7f3d5d3] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
> git bisect bad 9b3c3144b2d3b5022370883e2834887fc7f3d5d3
> # bad: [8a2e6adeea094195f860f1f5dd799c9f0015dd92] Merge branch 'at91-next' of git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
> git bisect bad 8a2e6adeea094195f860f1f5dd799c9f0015dd92
> # good: [4f826d17f9de4d708f2c07bb40a104426a22b384] Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> git bisect good 4f826d17f9de4d708f2c07bb40a104426a22b384
> # good: [62f97a067a7e77fd2016ce7d413fceaaf5882385] Merge branch 'for-next' of git://git.infradead.org/users/hch/dma-mapping.git
> git bisect good 62f97a067a7e77fd2016ce7d413fceaaf5882385
> # good: [e5047345bb6c8ee1e5d319c989dc9e3442f891c7] soc: document merges
> git bisect good e5047345bb6c8ee1e5d319c989dc9e3442f891c7
> # good: [cca5c2136d9ca679a9b0cdb51ce64c79cd7c092c] Merge branches 'for-next/kpti', 'for-next/missing-proto-warn', 'for-next/iss2-decode', 'for-next/kselftest', 'for-next/misc', 'for-next/feat_mops', 'for-next/module-alloc', 'for-next/sysreg', 'for-next/cpucap', 'for-next/acpi', 'for-next/kdump' and 'for-next/acpi-doc' into for-next/core
> git bisect good cca5c2136d9ca679a9b0cdb51ce64c79cd7c092c
> # bad: [b6719d317df3ab47dc86776c499fc1e2009e1b37] Merge branch 'for-next/core' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
> git bisect bad b6719d317df3ab47dc86776c499fc1e2009e1b37
> # bad: [ee053e03b08e1b287d9a43152e4623a04cb24fe6] KVM: selftests: get-reg-list: support ID register features
> git bisect bad ee053e03b08e1b287d9a43152e4623a04cb24fe6
> # good: [86f9de9db1783b32e8812fe21c2c8cf02cf911ff] KVM: arm64: Save/restore PIE registers
> git bisect good 86f9de9db1783b32e8812fe21c2c8cf02cf911ff
> # good: [7df7170965a28c61f80a57b655b0cc10adb88ab9] arm64: disable EL2 traps for PIE
> git bisect good 7df7170965a28c61f80a57b655b0cc10adb88ab9
> # bad: [9e9bb6ede00a84275b65bb8d00812c1e24b5fa7e] arm64: enable Permission Indirection Extension (PIE)
> git bisect bad 9e9bb6ede00a84275b65bb8d00812c1e24b5fa7e
> # good: [eeda243dfeb996fe236c624796630c16237a18d6] arm64: add encodings of PIRx_ELx registers
> git bisect good eeda243dfeb996fe236c624796630c16237a18d6
> # first bad commit: [9e9bb6ede00a84275b65bb8d00812c1e24b5fa7e] arm64: enable Permission Indirection Extension (PIE)
> 
> Thanks,
> Neil
> 
> > ---
> >   arch/arm64/mm/proc.S | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> > index 9513a8d2ce0e..2baeec419f62 100644
> > --- a/arch/arm64/mm/proc.S
> > +++ b/arch/arm64/mm/proc.S
> > @@ -454,6 +454,21 @@ SYM_FUNC_START(__cpu_setup)
> >   #endif	/* CONFIG_ARM64_HW_AFDBM */
> >   	msr	mair_el1, mair
> >   	msr	tcr_el1, tcr
> > +
> > +	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
> > +	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
> > +	cbz	x1, .Lskip_indirection
> > +
> > +	mov_q	x0, PIE_E0
> > +	msr	REG_PIRE0_EL1, x0
> > +	mov_q	x0, PIE_E1
> > +	msr	REG_PIR_EL1, x0
> > +
> > +	mov	x0, TCR2_EL1x_PIE
> > +	msr	REG_TCR2_EL1, x0
> > +
> > +.Lskip_indirection:
> > +
> >   	/*
> >   	 * Prepare SCTLR
> >   	 */
