Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 904121E3D44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 11:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388423AbgE0JHM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 05:07:12 -0400
Received: from mail-db8eur05on2072.outbound.protection.outlook.com ([40.107.20.72]:34401
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388112AbgE0JHL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 05:07:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBPJdPvbFiwsnaQTW1E7CXPR6BAqmYSTA2G0xLXufSDt2xVZxIQqsQHd9JCdlol5GpUjmbleybiE+OnQzat2G/ehEVO5T+O32mU8I2N6jruH/COFWhn3Di5xTMxPFiYEVQYjeeYs+M6xa+Fs3K+cgmnd1bpgiJxMSZaIrGfHcIood3U+2ZnFh5FObaHiVXdGy8gH9VMrkX6V3hrXTlptP18uUnH+bcMMCc+QawEds58/fVgHAIhDETzVY1ZSK70Y45mlC1xy4wt5ohjvqKg/YQjqz/AUSLE7+hpKomgzrqeEQplnl/ePJPVlgZi7wxOkSGEGjyjQGXKCEa2hY/UK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsMWYnkF0zsSzwaUEJUm9Mm0xl8ixJsagcGv1mF6n7o=;
 b=ksnJLgTgzX2mxuq2wU+9ceNOScYhgrDki17DtAPUUDI9K04C9KVGS7kUr5BpmsvCpQlE3zbov8+cy18TRWKr5XpTQ19Y02jBOWgZoWVVydP2kbFkzjYZm3y7ROmLi4ELrcbKb1JjMzjABctF7EDvSGwpMQDDJwVZ/4G2hA/QwEFYW2NXmTjdF48dO5xpY6EOOn2cxF2yCQlRckjW7RvqN6srrMdeYy4d2golTzECQcDPHqkubBi/xzM8xFbzGuAlp9Hd6WNbiamKLczTi6xFz+6SNzpI+8VGXfEwMWJB+cvLDMLy+Y+NkBQauB/z5F+dkKnf3g3whcIg/Fn1pds33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsMWYnkF0zsSzwaUEJUm9Mm0xl8ixJsagcGv1mF6n7o=;
 b=kT4fPR08VTTKCuV9aM5DcYiQ+tjye9/SGxsVrKjeAvPZMOMZNa4dKP8jXPZyPwQSiC/UjeKRlh8g7VLydYZ5AFTqjVDD7hPGbk4W6usX+ElzbMma49V1Zz3jiCAxTXzqmhPunxUhdIomqicehhGK09lXnyrZruc50B0eoel1IWk=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR0402MB3502.eurprd04.prod.outlook.com (2603:10a6:803:c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Wed, 27 May
 2020 09:07:08 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::b97a:64f0:3ab5:d7fa]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::b97a:64f0:3ab5:d7fa%5]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 09:07:08 +0000
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
To:     John Stultz <john.stultz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra@vger.kernel.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder> <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
From:   Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <f1208f83-d261-74e7-10d0-45ad9bf6c0a0@nxp.com>
Date:   Wed, 27 May 2020 12:06:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0184.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::32) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.107] (86.123.58.2) by VI1PR07CA0184.eurprd07.prod.outlook.com (2603:10a6:802:3e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.9 via Frontend Transport; Wed, 27 May 2020 09:07:08 +0000
X-Originating-IP: [86.123.58.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 84310272-c450-4ac8-8b04-08d8021d557a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3502:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB35020528A771E00460B04966ECB10@VI1PR0402MB3502.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EvxwkUN+KfviIDkMOEc1RsODCW8G1yTj2Dvtu2txLSIEI3UsiAuo7pVbPlFvlQNaSdb1ZN+n/oWnH5dat29Tx06u/87v/HbRftNL19zpwyH+4pTDTe3DAXwLmeQgZA0DIRRdZG6bTXjiaoUunGhr2DUTN86jvMVbi33JfD+oDMsQNC+HKd4d+6Rw5bxXpCbn8gPSSY0+/OWBjUsHEXH0SdiLdaETV9F6TyYaljzmr8ujIJrCsouHvJBtV8UHSVUZhCvdHino9+V8QPctOcxeEtlkeTM1PP3b2m/PHHpt7VL+i9XkP0jNvpGvxbiMjO9HGitzR71IuMiwWvuBL2XGlCfb1DX2Oyyhhdc1NfXPYXoLsbCAaQn8LTFarMOc/S7KFnsbx7w71xz0xvBm7itlYLy8HX7vzzkfGHEnhGxKiI9+CTD/MWWh5yasKOCFOwP7eRfP1IZSTV/zM19vJK+w4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(6486002)(36756003)(966005)(83380400001)(5660300002)(16576012)(26005)(16526019)(186003)(53546011)(66946007)(66556008)(66476007)(8936002)(31686004)(4326008)(8676002)(316002)(110136005)(478600001)(6666004)(54906003)(86362001)(2616005)(956004)(2906002)(44832011)(52116002)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: I/kb9tkTwQAWp7qp7swICUHAX83oN2BRw/6pzbM6bNYdLf9I/ICiXAFHhE2JzmsSykMnKtdj0SD0CCyhMF+s5EHhxvPA+8UWGNKqjzH8lVv382b0L0uY6j/dFuVSOJ1yYePPqbZ3UPohlU6atKg9HPzP98edAm8c7bKrlPTOAOkBL+x8XQct/4LO436ZYfdQfLREG7n5Jw7vDmiE4+FxHay2A2ABFflHvquLgxDfMHCBGkVPKlmaomByFNwSdEwAThLPpleAi8TsmSReO9+xesePip+6ZhJgTuab7y7QZfqk5p/xyXR5gDaUY1qMvztx+KtsxXBTzcL2jnbA7RndNitghtZ9j7ybzzIMxJ96muC6CfckgpgOskd/+LZiGEOE68jvUGQff40qupwUsocxLrnBeiCl0HQglUt1gOHLO36ulDHSgu5TkK3Xvlg/uq/xwpIAl0YfPunP+XDvjxxtT1wcFUMxROWOiRh1RGaNfVE=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84310272-c450-4ac8-8b04-08d8021d557a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 09:07:08.7314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+vQwa1bdTV1Ml4zkcWOUc25pTO/jQG4xP09F5O5bBluVgbSkq2TGoAKzsCbQeuJIBu/wPYvE5PPVx+Q3lg3aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3502
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/26/2020 11:34 PM, John Stultz wrote:
> On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson@linaro.org> wrote:
>>
>> On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
>>
>> Rob, Will, we're reaching the point where upstream has enough
>> functionality that this is becoming a critical issue for us.
>>
>> E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
>> mainline with display, GPU, WiFi and audio working and the story is
>> similar on several devboards.
>>
>> As previously described, the only thing I want is the stream mapping
>> related to the display controller in place, either with the CB with
>> translation disabled or possibly with a way to specify the framebuffer
>> region (although this turns out to mess things up in the display
>> driver...)
>>
>> I did pick this up again recently and concluded that by omitting the
>> streams for the USB controllers causes an instability issue seen on one
>> of the controller to disappear. So I would prefer if we somehow could
>> have a mechanism to only pick the display streams and the context
>> allocation for this.
>>
>>
>> Can you please share some pointers/insights/wishes for how we can
>> conclude on this subject?
> 
> Ping? I just wanted to follow up on this discussion as this small
> series is crucial for booting mainline on the Dragonboard 845c
> devboard. It would be really valuable to be able to get some solution
> upstream so we can test mainline w/o adding additional patches.

+1

There are also some NXP chips that depend on this. Also, I've submitted
a v2 [1] a while back that tries to address the feedback on the initial
implementation.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=164853

---
Best Regards, Laurentiu
