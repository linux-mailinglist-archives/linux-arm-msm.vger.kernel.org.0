Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D78D267E8E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 16:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbjA0PFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 10:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjA0PFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 10:05:03 -0500
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2042.outbound.protection.outlook.com [40.107.241.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E607BE69
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 07:05:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f07ELYm9KUMDAyVdhgccdZzt4yvGrahkztgwypNvTWUh2yu9725odVv6T5htrlQiWWtwKUvNYAtWOT2Vm16/mKzChiDOZ2v0nPkjegt3i4i645CCQPCKKg6SmDGzPtY49kyN0R3ztxIZAIxP5EQNMU+fgnd2se4gizTRcDIOO2GHc8mMUMD4QZD0JFc9vUAsgrDBWCw6gqvZRkyDe8Vaocs8eG71PSBRI+Ii/2tZg1uZef6qoRANWJ/kW14HX4I+AiITWXtvvk4IhHJyotaWGNdq5HYnuO6BJDxw5PU0x2UxPy1CWAyai+SyZ5wVn3pgEaV3Bv8MzDkAGDxHq2XX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijfM9OiFW2Rj3hNbr6sBRz7UGqHiPCnhqHWHV+WhPFo=;
 b=Rzw+jMs5sp9zaxNhO2pDweQjoHBuXFw81aE/EvveKACnAA4NQUsmYtXljQjOAz7V29ZlmT+XklHchH1maikgOM4fly/w8Ug6BlK9BvIz48QnWgm0w3CWbJc9SX4Sm94Zi+tj1xskkrVKSy8m+PEu1QTRV379UFIXRLfAZqgRuNRKyeqYKBj9Ucm80HjaIdTE3kpJhvBwi1HT05Acx3IyS2VwaO+NDza+jy+5ToeDWxSXdIo7lO9lMECElvBEJEICtL8NKasXbJt5TUR0S6RbVmRAeXNNczfFX2+1STZu962TtebJoQMYS+7zi+RWp+pII+VVbtYttPRrmt1faBLEGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijfM9OiFW2Rj3hNbr6sBRz7UGqHiPCnhqHWHV+WhPFo=;
 b=jLt8rIA2wpXgtz8n89NRWa0CSnTUCXF68WAdUKRXqYtZwQ3WccRppflXBIeyqLJlAI5wukIAUxo3zbUUmcQ2hPtAcdl8Afk4JEwn3zHya8VHsjoz+mld0pIrYMHD2z1yIj2bzD8k0drCe1ZycrA3SxuOj6qcyoJVS2P+2VAtwr9FK/hl5eH9s41l3lltrtnhS/Bm/dAH4KcMFDsFnwPuAQUMt4gJZC86cB7ADztDqgE1h7IhXiW638Yko8uHyq1ARR5fa0mQbl84KJGZyF9kGJan77cI/mhet1gXl42B1E6iwOt8L5i7eDsxgBK1o7EQnI/NmBmCJWQFsrkjZaLdOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8135.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 15:04:59 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::24d3:14a5:eeda:6cdd%6]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 15:04:58 +0000
Message-ID: <275ba038-1824-1ec1-1d45-1584c3d2ca0e@theobroma-systems.com>
Date:   Fri, 27 Jan 2023 16:04:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [GIT PULL] Qualcomm ARM64 Devicetree updates for v6.3
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>, arm@kernel.org,
        soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Brian Masney <bmasney@redhat.com>,
        Robert Marko <robimarko@gmail.com>,
        Lin@mx08-00349d01.pphosted.com,
        Meng-Bo <linmengbo0689@protonmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Chanudet <echanude@redhat.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Martin Botka <martin.botka@somainline.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alex Elder <elder@linaro.org>, Luca Weiss <luca@z3ntu.xyz>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Petr Vorel <petr.vorel@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Adam Skladowski <a39.skl@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Danila Tikhonov <JIaxyga@protonmail.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gabriela David <ultracoolguy@disroot.org>,
        Jasper Korten <jja2000@gmail.com>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Julian Braha <julianbraha@gmail.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Markuss Broks <markuss.broks@gmail.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        Owen Yang <ecs.taipeikernel@gmail.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Pierre Gondois <pierre.gondois@arm.com>,
        Rob Herring <robh@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Siddharth Manthan <siddharth.manthan@gmail.com>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        Youghandhar Chintala <quic_youghand@quicinc.com>,
        Yunlong Jia <ecs.beijing2022@gmail.com>
References: <20230126202528.3691539-1-andersson@kernel.org>
From:   Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230126202528.3691539-1-andersson@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0092.eurprd04.prod.outlook.com
 (2603:10a6:803:64::27) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ef5ed8-91e1-4056-e948-08db0077db64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: STWjKNIP8KLC2r7kRkjbNuouKGDIr4EciVTpI6rAKFxteBGA1uRrGJ1MWRt//LIrICnyXxpaIhA4DJFBIXhR1CRd8LLOfnS8bW386i0KJUaP8FBWIuUX3e6p1hVeDJzb+0sa+tCm3WhP4jcT7DMJxg/Oi3BRZM4NJAQoI0oPXhj+/Jmnm3ANf9kt3QtL2zMPVizjq0Q7PRF2l3MJANC6rApjsOjmrW3LdPfqpfQTJh5L6U28/Q2lpjBEKJjqNcP9dv900DgdDjfT1lURuZY8PcaDc8fuIzZFpzwdFlsdq/1/lT7iVipOZukMrgqY32OeYsKuqefjoGtoX/XH4fS9ZsW3jqQgTbf5B6kRUvNZ1T4nOUdA/5RJD/jEAcE8kli5e7it1fglfGhgQNiw9FBJi+Rl41y5umlmybbDN2uh5ovVqzC3fIYkUvMmUcpQbSvYKdy9Pv1VcoMq1ZmQECidMbrjIQ8uLsGO8rn2SB1TC2TkqrEZbYB/dwIv/Al3ZEfuzV3pnyqNh21V5M/J8MOWnaIbfdSiaWdDvc32u4zOhTXoIoxLQjbyJNy75ndhsFDS0BAnjH+FBRyuZAeM5GN8amKkEIixSqEV3eRBHuhcZJkqgV4hPSE5rj3Xv7t6Mz4Dt2KQxiqTD0Rm1ZPRf+xZAx1z3QStwE4fofsRCHQhiXnQyONfFKk0IPF3EwKy5oJf4qOeep4r3UaInqfKPXrd9TnTdC1a5EK72KILc2KENz2lP9aDlZjuGLlamyJTeVLlErextWDRj6tWeyIoH+EHEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39840400004)(396003)(366004)(376002)(451199018)(41300700001)(8936002)(7366002)(7406005)(7416002)(6506007)(5660300002)(38100700002)(83380400001)(86362001)(316002)(36756003)(31696002)(54906003)(66946007)(66556008)(66476007)(26005)(186003)(6512007)(6666004)(966005)(4326008)(6486002)(8676002)(478600001)(2616005)(31686004)(53546011)(15650500001)(44832011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEV1aGhISmcxWW9KYmFkektsQ3pwWkNTRFBMeXZMdys1NFZIb2VKOENLR2pa?=
 =?utf-8?B?Zjl0NDB0STlucXNtd1NNMXQrdjROWXI2Rm54Tm9uMkZ3YkxPZTlJM3cydXhD?=
 =?utf-8?B?SEFvNDhrZkZSOS84d3M1L0M4a2ZIbDdnRVBuVk9UVHRzcDZWSVA4UnZxRDFR?=
 =?utf-8?B?bXdEQVJlaktiZDVTWHA0ZkNKSGplRnFFaUduV2MxUkRwWlkzZW1JdlV4UmtB?=
 =?utf-8?B?aVNhSDdmSERzM3hLUGlFSW50U3J4ckRxWUt6S3ZhS0RZWURPYVg2Q2h2M3k4?=
 =?utf-8?B?eGM5ZXcwc3lwOFBTbFdhV3Y2WjVmTVpZQXY3WGt4aTc5Uk9peUJHUW0vcnhD?=
 =?utf-8?B?bkNBWml2SHUrQXkxR0RQeG5JOU1DWHRPQXBKRVBuclRReHIzbHIwdEtrL1U3?=
 =?utf-8?B?UjYrR2VjeVEzMkFCTEtJQitkajE0MmRNdjYvZjEvRVJtaDhOR28yZzU2VUo5?=
 =?utf-8?B?NldLU0lPTWhjemVMTFJ3S3hhR29LbUFncnNoV2VzVkpGdmtRcnpvRnlseDlQ?=
 =?utf-8?B?SjB5R3VKdjVmV3NNWW5VZnI3Um1QUVJyV29uOGp2UytQQnFqME9OUE82WWpo?=
 =?utf-8?B?enNGME5pS2NBTC9pU2lsRVFNTS9udEwwdHNoNkVnNWJUMmxpMnJnTjM3bUM2?=
 =?utf-8?B?b2YvWVVZQW9CR1VTdFVEc2RuVVdETkZmZjYxNG9LaEVzYnF5ek9EdzZiUlYz?=
 =?utf-8?B?SWJUU2VURngwMDN1cm9zd1JiTUdSMzZLZ1AwelJBZ0svTUNZeFAyRWZOOVow?=
 =?utf-8?B?QzBiZ2FOR2xmNkRtdTVTcHVzMk5LMXBLSXFDRzdSdU1sdEt2ZmJzdmhqYzFR?=
 =?utf-8?B?OWZmVytnbnp4ZFpFYzlWelhZb2xDNXdCZUV2UFlXQkNsR0JkSDlzZnRVK2NL?=
 =?utf-8?B?aWN0RlFOWGhZSDI2alJwK0p2N3d1WTVaSzdqN1ZCbUw1blRuZC9PeXpqd2xR?=
 =?utf-8?B?aEd1VDVaQkFkYk5zYytNeE5YOXh3a1NhN0xKRHZ1TWc0aTFzYlNlSWo0eTRJ?=
 =?utf-8?B?eUlxREZqaUVwRGx0dWFWR1JwbDYrcHlzaklvNWlEUDJuc1BRRy94QzB0eFRv?=
 =?utf-8?B?N0ZueUY4U1JwSGRuOW9TZHA4VlpOWnVsa3RjTk1DN3BiZzM4TkdzOFNDMzRD?=
 =?utf-8?B?NUgzeE1paGJqYU1kM3piZmJoczdVZ250anZGdnQvZWtvZ1ZZWkF0NzViVGFz?=
 =?utf-8?B?QnpPaWV5Tlg1Z1R1azVoV3laZlkwSFo2ZTFxWXJZcmE3Myt3REhBNjloeks0?=
 =?utf-8?B?OHdhM2NHdldwUjN3MnpvSjh5cXlGRnlmTjFwUVAvQzZVY2ZHMnFTNlVPb3d2?=
 =?utf-8?B?RWNtL0JhUW1UMFlCemJlVnVUVWs1TzhhVlFuRHpEQjkwcHpJdGhZMXdmZWVH?=
 =?utf-8?B?cjl0cFVneTdFakIvdE1wN0JiWkFNYzk0YlZiRXVIV0xUdkErK2dsdlBtcm5P?=
 =?utf-8?B?Z1VHWjdldE9JRFg2cEpmVnFxZDVqSGV1TTA0VjE3YnhIVXVoN3hTaXlVangw?=
 =?utf-8?B?a0pOMU1zcEF2V3NlbTBsdW1nZ2ZseWwySG9jTGFYUVJpclBPTnFnd1MyVU1n?=
 =?utf-8?B?N0F5UkZ1S1p5Z05JeXM0OUp1K2FieFlNbzA1TU1DeVMzWU9mR3VLYWRwZmF6?=
 =?utf-8?B?YUlTMFBMcWdVY1JoU1gvQ3hFSCsza3Q5bEtnd3o1aVA2dE5MWnFJcGlWNEhr?=
 =?utf-8?B?RlNEem1oZEdMMENOa3FhZFpqSEF1TjFoV1RjVnlFRVA0TGVRSkhGVDd6algz?=
 =?utf-8?B?M0xhMkFYdHlNMnJ4VXloUmRGZE5GYXZBK1NseTNVM0RwWHFnQ0JBcHlXQTh6?=
 =?utf-8?B?K290aFU4eEtqcWxWNkI0QnNUS3kzRkhGVTN2ZHVoQzJYTUFTM3NTdGhpeXdp?=
 =?utf-8?B?YUhTUzFibTBtTGJRckpvb2xCYjFua2cwOWFMMTVhQzlVOE1LMnVSTHNLd2F5?=
 =?utf-8?B?eWxaTURlMDkwQW1nc3BGU3pKb1BIeUF0N3I1NHlubzF6ZjJrcFhIbm9rbFNu?=
 =?utf-8?B?aEg2dFdTWWtCazJUM1EzWWU4OFpmZ2ViQ0dCMUs1N1RLaVNtNUIycEhuSXVD?=
 =?utf-8?B?czAxMm5XQ1hLcmpKUjdYTVBTQzk2NlRLOEhCZUl6N2NPVkNUT05jWVB4Q2tI?=
 =?utf-8?B?b0ZnRC9lS1lRUG5nL0lPbHpKdkpxNjRybEw5bVRiMmdyR2YzYnBaN0djNzhW?=
 =?utf-8?Q?6E0DtrIgeQqutHqtdzmZ36HmM8opeLNS7YAix9tS55nT?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ef5ed8-91e1-4056-e948-08db0077db64
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:04:58.7332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMpCsWgbOLfjYxXhuCr5TC6VtC0UV2SmY48KTqZ+zg+Bab6tJ/iCuGwcQMZvOfvaaoCW9OGRFd0thQWYsT9r7Mc2Z6pqrNa62X7APfbKFq6lBqZNxpXeY6pV9QeDPDp/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8135
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 1/26/23 21:25, Bjorn Andersson wrote:
> The following changes since commit 69876bc6fd4de3ad2dc7826fe269e91fa2c1807f:
> 
>    arm64: dts: qcom: msm8992-libra: Fix the memory map (2023-01-10 09:49:03 -0600)
> 
> are available in the Git repository at:
> 
>    https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git__;!!OOPJP91ZZw!gSqxckuJQ24o_zqdjnwdYLdWlnU6s495rnqf9eWlCR97TlUH_0cJjwsofmXM4xftzvUYP7s8ETYsyA7F2R-VBvlNU6jWX2hwvA$  qcom-arm64-for-6.3
> 
> for you to fetch changes up to a63a420d050d47a6afb5e2198181dadd08e71f97:
> 
>    arm64: dts: qcom: sc7280: Add a carveout for modem metadata (2023-01-18 21:35:25 -0600)
> 
> ----------------------------------------------------------------
> Qualcomm ARM64 Devicetree updates for v6.3
> 
> This introduces support for the new Snapdragon 8 Gen 2 (SM8550)
> platform.  In addition to the adding support for the MTP on this
> platform, support the following devices is introduced:
>   - GPLUS FL8005A
>   - Google Zombie with LTE and NVMe
>   - Google Zombie with NVMe
>   - Lenovo Tab P11
>   - Motorola G5 Plus
>   - Motorola G7 Power
>   - Motorola Moto G6
>   - Samsung Galaxy J5 (2016)
>   - Samsung Galaxy Tab A 8.0
>   - Samsung Galaxy Tab A 9.7
>   - Xiaomi Mi A1
>   - Xiaomi Mi A2 Lite
>   - Xiaomi Redmi 5 Plus
>   - Xiaomi Redmi Note 4X
> 
> On IPQ8074 the PCIe PHY register regions and PHY clock names are
> corrected.
> 
> On MSM8916 DMA for the I2C controllers are introduced and blsp_dma is
> unconditionally enabled. Per-sensor calibration data is provided for the
> thermal sensor (tsens) block. The GPLUS FL8005A device is introduced and
> gains support for touchscreen and flash LED. An additional Samsung
> Galaxy J5 variant is added, and support is added for hall sensor and
> MUIC.
> 
> Per-sensor calibration information is introduced for the thermal sensor
> on MSM8956 as well.
> 
> On MSM8996, GPLL0 is added as a possible Kryo clock controller input, a
> carveout is added to get modem metadata out of System RAM. Missing bus
> clocks are added for agnoc2.
> SDHCI1 is enabled on the Sony Xperia Tone platform and USB is limited to
> high-speed, to make USB work.
> 
> MSM8998 gains the same modem carveout as other platforms, and the
> description of the clock hierarchy is improved.
> 
> On QCS404 the clock hierarchy description is improved, the CDSP PAS node
> is adjusted to match the binding and the thermal sensor (tsens) gains
> per-sensor calibration information.
> 
> On SC7180 the Data Capture and Compare block is intorduced, and a
> carveout for the modem metadata is introduced, to get this out of System
> RAM. Pazquel360 gains touchscreen support, the regulator off-on-time is
> adjusted for the Trogdor eDP and touchscreen.
> Data lane and frequency properties are introduced for the DisplayPort
> links.
> 
> SC7280 also gets Data Capture and Compare support, as well as the
> dedicated modem metadata region. Herobrine gains DP audio support.
> IPA description is updated so that it's only active on boards with a
> modem.
> 
> On SC8280XP the display subsystem is introduced, currently with support
> for most of the DisplayPort controllers. GPR, SoundWire and LPASS is
> introduced, for audio support. Missing I2C and SPI controllers are
> introduced.
> Support for EDP is introduced for the CRD, the Lenovo ThinkPad X13s and
> the SA8295P ADP automotive board. The SA8540P Ride platform enables one
> i2c and pcie controllers.
> A CMA region is defined for the CRD and X13s, to avoid allocation issues
> from the NVMe support.
> 
> Fairphone FP3 gains NFC support and the Sony Xperia Nile platform gains
> a description of simplefb.
> SDM670 gains QFPROM definition.
> 
> SDM845 gains a carveout for the modem metadata and support for the Data
> Capture and Compare block is introduced.  Lenovo Yoga C630 firmware
> paths are aligned with all other Qualcomm platforms.
> 
> On SM6125 apss SMMU is introduced and streams are defined for USB and
> SDHCI controllers. GPI DMA description is introduced, as well as missing
> SPI and I2C serial engines.
> On Sony Xperia 10 IIa regulator definitions are improved, SDHCI2 is
> introduced, and I2C and related GPI DMA blocks are enabled.
> 
> On SM6350 IPA is introduced. DDR and L3 scaling is introduced based on
> CPUfreq.
> 
> Fairphone FP4, on SM7225 also has IPA enabled, and the Flash LED is
> enabled as well.
> 
> On SM8150 the display subsystem is introduced, with clock controller,
> DPU and two DSI controllers. The Data Capture and Compare block is
> introduced.
> For the Sony Xperia Kumano platform, GPIO keys and NFC support is
> introduced.
> 
> For SM8350 PCIe is introduced, as is the display subsystem with display
> clock controller, DPU and two DSI controllers. #interconnect-cells is
> changed to 2, to align with other platforms and allow for active-only
> votes. The display is enabled and the LT9611uxc found on the SM8350
> Hardware Development Kit board is described, to provide HDMI output.
> 
> On SM8450 the display subsystem is introduced, with DPU and two DSI
> controllers.  GIC-ITS support is introduced for both PCIe0 and PCIe1.
> SPMI bus support is introduced and pmics are wired up across the various
> devices.
> The display subsystem is enabled and the LT9611uxc is described to
> provide HDMI output on the SM8450 Hardware Development Kit.
> On Sony Xperia Nagara platform, GPIO keys and GPIO line names are
> introduced. As is the SLG51000 PMIC and camera regulators are defined.
> 
> Support for SM8550 is introduced, with support for storage, USB,
> remoteprocs, PCIe, low-speed buses, crypto and display subsystem. These
> blocks are enabled on the MTP.
> 
> Lastly, the work continue to align Devicetree source with bindings
> across all platforms.
> 
> ----------------------------------------------------------------
[...]
> 
> Quentin Schulz (1):
>        arm64: dts: qcom: msm8998-fxtec: fix touchscreen reset GPIO polarity
> 

This is going to introduce a regression. See:
https://lore.kernel.org/lkml/f6a8a8f1-0eec-2716-d4f1-9115c9d156b6@theobroma-systems.com/

I concede the commit title is confusing. It requires a change in the 
touchscreen driver too and it hasn't been merged yet.

I see I'm late and it's already in linux-next though... So either we 
revert it or we need the rest of the patch series to be merged.

Cheers,
Quentin
