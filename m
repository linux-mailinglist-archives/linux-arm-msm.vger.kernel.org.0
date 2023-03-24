Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F9D6C8328
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 18:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjCXRQs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 13:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbjCXRQX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 13:16:23 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D4522A39;
        Fri, 24 Mar 2023 10:15:55 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32OAt1qe019911;
        Fri, 24 Mar 2023 17:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=9pqIb77Fyx9d2H/KmTL4M5/t7Ls7aXhFUrIX3cPs7tk=;
 b=Oy5HL8Fco+OYyVXW/+cXgwcLUxIBfyOvcS9eCPacvMQEttgWt3fZwbVTGwic2KtviZOx
 e0bV5t8ISUrcqPPTjjdN+cysMSY5KpIcdqcvejF3f4xAmVWZHszBCJBlyerR1THJggSa
 4en0xnTVwaNQScP56Px/GU75+SzqLLbgVsfEC+gJo8yXvzsmV43MtKsrOjoSz1zpIPQr
 A3QRM8+L+r9C1PqK7Do082vH3TGCxdGG4AcQdoSZ5cnDwAIu5LswR5Bahu+kEUJPB2cF
 Ippn3/ldmUUnwqG4RyxovrDPDiU+dBiTxJfpj4yUcAXi+J+BNdDrSPai/PgJXipI6fMD OQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgyd3tfqn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 17:14:49 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32OHEgUE011639
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 17:14:42 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 24 Mar 2023 10:14:42 -0700
Date:   Fri, 24 Mar 2023 10:14:41 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Leo Yan <leo.yan@linaro.org>
CC:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>, arm <arm@kernel.org>,
        <soc@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>,
        "Olof Johansson" <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        "Bagas Sanjaya" <bagasdotme@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dawei Li <set_pte_at@outlook.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        "Naman Jain" <quic_namajain@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        <coresight@lists.linaro.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        John Garry <john.g.garry@oracle.com>,
        Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.3
Message-ID: <20230324171441.GD309305@hu-bjorande-lv.qualcomm.com>
References: <20230126163008.3676950-1-andersson@kernel.org>
 <cdcff86c-77fe-4c5d-b8e8-58b815b9e969@app.fastmail.com>
 <20230130222412.t2tkkhqfep2orxf2@builder.lan>
 <9b680581-0956-4188-9af9-af06b625c001@app.fastmail.com>
 <Y/VzRJzxkPm3l0Km@leoy-yangtze.lan>
 <4704856d-eac6-9088-4523-3739e04d3fcd@quicinc.com>
 <Y/YHByya0NvoU+If@leoy-yangtze.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y/YHByya0NvoU+If@leoy-yangtze.lan>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KYKod6h1PjO6IlZwPTNmPrhc0MvHBrud
X-Proofpoint-ORIG-GUID: KYKod6h1PjO6IlZwPTNmPrhc0MvHBrud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_10,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240136
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 22, 2023 at 08:13:59PM +0800, Leo Yan wrote:
> Hi Souradeep,
> 
> On Wed, Feb 22, 2023 at 04:46:07PM +0530, Souradeep Chowdhury wrote:
> > On 2/22/2023 7:13 AM, Leo Yan wrote:
> > > On Wed, Feb 15, 2023 at 04:05:36PM +0100, Arnd Bergmann wrote:
> 
> [...]
> 
> > > > If the possible use is purely for saving some state across
> > > > a reboot, as opposed to other events, I wonder if there is
> > > > a good way to integrate it into the fs/pstore/ code, which
> > > > already has a way to multiplex various kinds of input (log
> > > > buffer, ftrace call chain, userspace strings, ...) into
> > > > various kinds of persistent buffers (sram, blockdev, mtd,
> > > > efivars, ...) with the purpose of helping analyze the
> > > > state after a reboot.
> > > 
> > > Good point!
> > > 
> > > I understand pstore/ramoops is somehow like a sink which routes the
> > > tracing data (software tracing data but not hadware tracing data) to
> > > persistent memory.  This is why we also can route these software
> > > tracing data to STM (hardware sink!).
> > > 
> > > Seems to me, Arnd suggests to connect two sinks between DCC and
> > > pstore (to persistent memory).  But I cannot give an example code in
> > > kernel for doing this way, sorry if I miss something.
> > > 
> > > Essentially, a good user case is to keep a persistent memory for the
> > > tracing data, then after rebooting cycle we can retrieve the tracing
> > > data via user space interface (like sysfs node).
> > 
> > Hi Leo/Arnd,
> > 
> > Just wanted to let you know that the justification of not using PStore was
> > already given in the version 1 of this patch series as below
> > 
> > https://lore.kernel.org/linux-arm-msm/ab30490c016f906fd9bc5d789198530b@codeaurora.org/#r
> > 
> > PStore/Ramoops only persists across warm-reboots which is present for chrome
> > devices but not for android ones.
> 
> Thanks for the info.  Just remind a subtle difference of reboots.
> 
> Besides warm reboot, kernel can reboot system after panic (see kernel
> command line option `panic`) and watchdog can reboot the system as well.
> 
> Even though Android doesn't support warm reboot, system still can reboot
> on panic or by watchdog (in particular after bus lockup), pstore/ramoops
> also can support these cases.
> 

The fact that DDR content isn't maintained across a typical reboot is
certainly causing issues for using pstore.

But afaiu, with pstore we capture various system state into the pstore
and then make that available after reboot. DCC provides a mechanism for
capturing hardware state (by reading register content) and storing that
in DCC-specific SRAM. This can be triggered either by a HW reset, or on
request from the user.

As such it doesn't seem to be a conceptual fit, we perhaps could present
the data as if it was pstore data, but I don't see how the reports
created at runtime would fit into that model.

> > Also the dcc_sram contents can
> > also be collected by going for a software trigger after loading the kernel
> > and the dcc_sram is parsed to get the register values with the
> > opensource parser as below
> > 
> > https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/tools/tree/dcc_parser
> 
> To be clear, current driver is fine for me (TBH, I didn't spend much
> time to read it but it's very neat after quickly went through it), I
> just share some info in case it's helpful for the discussion.
> 

My take is still that /dev/dcc looks to provide a reasonable ABI, and
the control mechanism was pushed to debugfs for the purpose of enabling
users to play with the interface, and improve it as necessary.

Regards,
Bjorn
