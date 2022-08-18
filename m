Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A44598AE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 20:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239465AbiHRSK3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 14:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345357AbiHRSK1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 14:10:27 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7ABC7414;
        Thu, 18 Aug 2022 11:10:25 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IFtRUT028077;
        Thu, 18 Aug 2022 18:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bzMSKCudT5xQQ+sG3R7xeFj5oBr01hBH/BA7ita4AoA=;
 b=aOBmIQrOxjs/1lQLtehtRTZM9AWDI/yWWp9lhZHVjTO1v11TfbeaKiD2Xt1fz9gvnawX
 4PbwHiMzesjrkHhCCYJYlx20iSpE4H2w5AEjj/3RUzaPQ8b1U3n+24gcu0gNuLQnqJLE
 PoPM15ehzM8i3+WbcDmR6ABxTunbG2gK7fBMIcfYrKEwyXL26AQG6X/KZmKScxPyPY8c
 miBHodcVuygcPWrC34SgacATH3LCehQZ/k0ELy4nPmPW5thLHYGVwOOPNuZhlmD8hoDA
 F0BV/lh3DTX89husqp2XuFL3ZCtG8G41hGLOmD3NquyLD/AIBOichl/1KykFWwg4sYy1 SQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j0w7hpugy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Aug 2022 18:10:10 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27IIA9qn031139
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Aug 2022 18:10:09 GMT
Received: from [10.110.31.143] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 11:10:08 -0700
Message-ID: <6f97be13-e5d3-9f8b-d731-599d9d13671d@quicinc.com>
Date:   Thu, 18 Aug 2022 11:10:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/11] Drivers for gunyah hypervisor
Content-Language: en-US
To:     Jassi Brar <jassisinghbrar@gmail.com>
CC:     Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <50230652-c1ae-4ce2-907c-9bdc6b827f8e@linaro.org>
 <62073cb8-0211-3b49-11cb-aceea6df0845@quicinc.com>
 <a71bea49-130f-61d8-2692-23ab9a8fe939@arm.com>
 <36303c20-5d30-2edd-0863-0cad804e3f8f@quicinc.com>
 <CABb+yY3MESqeZveYg5e18PWTLNcg82r4AtaRYJh-9c==mysw7w@mail.gmail.com>
From:   Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <CABb+yY3MESqeZveYg5e18PWTLNcg82r4AtaRYJh-9c==mysw7w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oK5vP0Ye4islboBcNBNbOLFC3mlofYag
X-Proofpoint-GUID: oK5vP0Ye4islboBcNBNbOLFC3mlofYag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_13,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=550 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180065
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8/9/2022 9:12 PM, Jassi Brar wrote:
> On Tue, Aug 9, 2022 at 7:07 PM Elliot Berman <quic_eberman@quicinc.com> wrote:
> 
> I haven't read the complete history of Gunyah yet, but from a quick
> look it uses the hvc/smc instruction as the "physical link" between
> entities (?).    zynqmp-ipi-mailbox.c is one driver that uses smc in
> such a manner. And I know there are some platforms that don't call
> hvc/smc under mailbox api and I don't blame them.
> 
> Let me educate myself with the background and get back.... unless you
> want to summarize a usecase that you doubt is supported.
> 

Hi Jassi,

Did you have chance to evaluate? I have given a summary in this mail, 
especially the last paragraph:

https://lore.kernel.org/all/36303c20-5d30-2edd-0863-0cad804e3f8f@quicinc.com/


Thanks,
Elliot
