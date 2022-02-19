Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955964BC831
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 12:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239086AbiBSLe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Feb 2022 06:34:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238581AbiBSLe2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Feb 2022 06:34:28 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12hn2224.outbound.protection.outlook.com [52.100.166.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B7350454
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Feb 2022 03:34:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdLNeT3l4QuzkgnDEIaoKU9LRZRRLcOug/jSBk59JIjTh/IGzM/SesaRtJwkZHbvP5A8Nm8xlBiU8NkIMBHnsuUFi07LejjS1hwWtkLaV069Jw/zIuC4Z0hZYHafW2/NA4XgNSOih7BqB7ywIayNnUNeARzXrNsEOpu4YrjT21nQlhJ91C/5qx7fCvj/t7QI0qQxsKtj8ZhJzLCY+Ft92t8TFPdwtrKmrM5Xx0kW8ZTUzoN5tZTuVDu0t20uhmRgWMRPboOa2/S/e9yjdmZTl8PRBtZnrWMXJ3wiqj8EJWIZmeARDN26OuX4JHVIERd8qja1siGgzII85KY1biskew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+iJiA0J6jviS6/j+q9zQZlf+odb/fFUug6nr0gp3M4=;
 b=lOYLCBYut9b+LGoZZQakBPLpf+92B1QVoT52J8KflI7wAUgSYlLpnBEu2J1j7kR0sQb3NCrjWmynO2sjhsXcaPKpmNp4JDkI/6ij9eK2GGO64tWWcDohO9gTDPmQV24a7k05gxcYecVA7Zd4TlI945igkNrIpMkeITz95M1TclGlu6Dwbc/PYbDTuG012eVi75+3YxAQ7WBggyj3NPIOuPySml+l6J5N816f6Yp2Ueqj0NMg56iJfKXKKVY1GsRlLQn1aUJhy3w//1V6M/RYBk3EyZX5hQ6x9HOFuEmM/pnVF/pfZakGyVDDjH+BRJ24IywDZZtPmbC2rHvL4aDp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 216.169.5.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=u-csd.com;
 dmarc=none action=none header.from=u-csd.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucsd4.onmicrosoft.com;
 s=selector1-ucsd4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+iJiA0J6jviS6/j+q9zQZlf+odb/fFUug6nr0gp3M4=;
 b=BvfDy/OOk2kBRl5r3GFSaYBpBTdGjJ8LG7r6bzCgAxkPmZr/Rkqy8E+NVHiMT5av1nqtsMJLidjagNAMEeHWH+J9hCOqpt3z885HDpCAoG2pHlZlrmUNmfUinFqAqQbZgJ4VNzLnrOtsOZWyHN0D3RLBwwswhRx0J+oUPc5byo4=
Received: from MWHPR2201CA0059.namprd22.prod.outlook.com
 (2603:10b6:301:16::33) by CY4PR06MB2327.namprd06.prod.outlook.com
 (2603:10b6:903:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Sat, 19 Feb
 2022 11:34:00 +0000
Received: from MW2NAM10FT039.eop-nam10.prod.protection.outlook.com
 (2603:10b6:301:16:cafe::1) by MWHPR2201CA0059.outlook.office365.com
 (2603:10b6:301:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Sat, 19 Feb 2022 11:34:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 216.169.5.195)
 smtp.mailfrom=u-csd.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=u-csd.com;
Received-SPF: Fail (protection.outlook.com: domain of u-csd.com does not
 designate 216.169.5.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.169.5.195; helo=UCSDEX1.u-csd.local;
Received: from UCSDEX1.u-csd.local (216.169.5.195) by
 MW2NAM10FT039.mail.protection.outlook.com (10.13.155.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.16 via Frontend Transport; Sat, 19 Feb 2022 11:34:00 +0000
Received: from UCSDEX1.u-csd.local (192.168.16.43) by UCSDEX1.u-csd.local
 (192.168.16.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 19 Feb
 2022 05:25:25 -0600
Received: from [199.231.186.244] (199.231.186.244) by UCSDEX1.u-csd.local
 (192.168.16.43) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Sat, 19 Feb 2022 05:25:25 -0600
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: HI..
To:     <linux-arm-msm@vger.kernel.org>
From:   "Kristina Pia Johansson " <info@u-csd.com>
Date:   Sat, 19 Feb 2022 06:25:25 -0500
Reply-To: <piakjp2022@gmail.com>
Message-ID: <e3502d15-7a0b-4e73-a5ab-c7ee05043bbb@UCSDEX1.u-csd.local>
X-CrossPremisesHeadersFilteredBySendConnector: UCSDEX1.u-csd.local
X-OrganizationHeadersPreserved: UCSDEX1.u-csd.local
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc80dd94-cf30-4c2d-22e3-08d9f39bb978
X-MS-TrafficTypeDiagnostic: CY4PR06MB2327:EE_
X-Microsoft-Antispam-PRVS: <CY4PR06MB2327A1E2D28A4D27E7E13EEC97389@CY4PR06MB2327.namprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:216.169.5.195;CTRY:US;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:UCSDEX1.u-csd.local;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230001)(346002)(39860400002)(376002)(396003)(136003)(40470700004)(36840700001)(46966006)(3480700007)(316002)(40460700003)(82310400004)(81166007)(82740400003)(356005)(86362001)(31696002)(6916009)(6706004)(16576012)(5660300002)(36860700001)(4744005)(8936002)(70586007)(70206006)(2906002)(7116003)(8676002)(47076005)(9686003)(508600001)(40480700001)(2860700004)(956004)(336012)(186003)(26005)(31686004)(16900700008);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sdnBQ3vPx+5XNmlFvFs7++VuV2NA2qwtlQWmHOqhwhMj2eiib+JfC2lKOi?=
 =?iso-8859-1?Q?2Fw5SrJmWHnHdUELMwwLLwhofcHzyRVprpNTksHzIzYFwm2RfzBnAlTWf/?=
 =?iso-8859-1?Q?jSxUFGMfAOlNai35WkCd/IK1aOUdRYlcUg1IS7j/aE7e+J3XRb2hjtA4IU?=
 =?iso-8859-1?Q?vz3edbeWoOPVw03TOkrNVPaC9wUg6XIY3Lzi1qYnOqPMaiCnbxr0sf38V9?=
 =?iso-8859-1?Q?QBZva1eXshW0PmoFlnYwJ4Fvs1BxmbPys96CRX1VeWhAqeX0aIB55LD6H+?=
 =?iso-8859-1?Q?ZFmA5Xwtk0Gqbj8M3NCvlPOhCRF4bifaqqOOxoULa70IlHWRn69bME3dLi?=
 =?iso-8859-1?Q?MDN51ftB1PF6+Y+baTBPjA81QC24jf705wH8PP2lBd69i/Uy+6X1sTWJ2f?=
 =?iso-8859-1?Q?ZJ20MkKGLLikc4+npYI8hq4LIqCcaH6aUB9lPiV7RtOape/SSJpdNarJ5x?=
 =?iso-8859-1?Q?SMEq6Sv1cGSbO5rFwnd/lqd0kM4Xk54QnzXZ6R3Kl7MSSfOo4WfIQLKB5U?=
 =?iso-8859-1?Q?iAozKUweG7iGeEZG0SGpxCrElzxrj82abU/FWr+B7nELEwjHFZdxwhR2qi?=
 =?iso-8859-1?Q?+L0fDSEFulLhifzf+bxurxPm0QYzjy+7SOQJiwg3jRWhI6HCx/NnVIAFSU?=
 =?iso-8859-1?Q?dH4ASmFSFXVABqHJIhkzsVWpHsvtxEuwEHSoT3q46RmGGNv84nIt2O+8u4?=
 =?iso-8859-1?Q?EWjiD4w+Xnkwpd0l9RzziJdJibZubl39tF2tUIIBS76A+wCGqUMy69VKAf?=
 =?iso-8859-1?Q?aA2EFBv91zalgE6JdS5ikPYGJwEhaZiaP1dLszEYQZScszAxSJA+/YIEqL?=
 =?iso-8859-1?Q?WR/IgdNMEc0svD/r2nwYYVDTuVPOp3KUp8iYBoykz/JSQ/J2losSFZs/j2?=
 =?iso-8859-1?Q?UynOq4sDo0xuXY8ypNz4j+flGyrD/tT77/Sv3tBCltE+IlIfE3mVr675CH?=
 =?iso-8859-1?Q?ytMrbmTYbzKBaD1bdR12mpTWDKKBscBI0IWHsZeFzk4ZxcbiOkjm99u9qb?=
 =?iso-8859-1?Q?R+v/epc4HblxTVd1iRXitJWV7PyGSZtWjCvwZII0QdiMOY1uTp3aajNjh0?=
 =?iso-8859-1?Q?Fvxyj5a0fILhKL0NV15FbCQ=3D?=
X-OriginatorOrg: u-csd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2022 11:34:00.5524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc80dd94-cf30-4c2d-22e3-08d9f39bb978
X-MS-Exchange-CrossTenant-Id: 663d4886-a028-4654-8be0-f6e600c88247
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=663d4886-a028-4654-8be0-f6e600c88247;Ip=[216.169.5.195];Helo=[UCSDEX1.u-csd.local]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM10FT039.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR06MB2327
X-Spam-Status: No, score=3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

I hope that you are at your best and doing well. The purpose of this letter=
 is seeking for a pen pal like friendship and I'd love to and be honored to=
 be friends with you if you do not mind.. If the Idea sounds OK with you, j=
ust say yes and we can take it on from there. I look forward to hear hearin=
g from you.. My name is Kristina From Sweden 36 years , this will mean a lo=
t to me to hear back from you.

Warm Regards.

Kristina
