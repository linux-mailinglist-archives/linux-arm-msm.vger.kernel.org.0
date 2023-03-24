Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571956C8355
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 18:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjCXR1d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 13:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbjCXR1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 13:27:32 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B352A243;
        Fri, 24 Mar 2023 10:27:30 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32OAtoHu008879;
        Fri, 24 Mar 2023 17:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=tYr/fAYON3j1L+qZm81JSaVOb8rmECPeFVyt8L9REHc=;
 b=KpNdAiYbSTC6O5vBrDq5UZ+n0h9ZVlKaRAWQdXU2gVUNjF6FiFD1NBCCtFXg/Gi64QgL
 UtdTMNBvKrlIQiYFgFSa/xqG1Hh45A2WvCnTFYXkohywgRKdTbZzcd1hkjR2F/M7KvSk
 L2JHww7Zhl0pcFWvGk4zWpYj7sHdfa+IXIIwjM2ggAdg3evRfy61hVDt/LIV8V8398js
 P+209pUPxSBOIO/UxEYVniifBRhOi+pvH7oIkz1OHPsq0vkrKHtLuTDa5PCYQvR9Tm39
 ZnYRQhocLZ+gLRAzfor2mDRV5Jtm27twu8agi38o/evd4ym307P/eiOPG1j9IxY8IZvu 6A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgydujku5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 17:27:00 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32OHQxfM016092
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Mar 2023 17:26:59 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 24 Mar 2023 10:26:58 -0700
Date:   Fri, 24 Mar 2023 10:26:57 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Bjorn Andersson <andersson@kernel.org>, arm <arm@kernel.org>,
        <soc@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>,
        "Olof Johansson" <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
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
        Leo Yan <leo.yan@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        John Garry <john.g.garry@oracle.com>,
        Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.3
Message-ID: <20230324172657.GE309305@hu-bjorande-lv.qualcomm.com>
References: <20230126163008.3676950-1-andersson@kernel.org>
 <cdcff86c-77fe-4c5d-b8e8-58b815b9e969@app.fastmail.com>
 <20230130222412.t2tkkhqfep2orxf2@builder.lan>
 <9b680581-0956-4188-9af9-af06b625c001@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9b680581-0956-4188-9af9-af06b625c001@app.fastmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SVU2vt2vngq3nRcJhmFHV0ZaoMJZ-z3r
X-Proofpoint-GUID: SVU2vt2vngq3nRcJhmFHV0ZaoMJZ-z3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303240137
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 15, 2023 at 04:05:36PM +0100, Arnd Bergmann wrote:
> On Mon, Jan 30, 2023, at 23:24, Bjorn Andersson wrote:
> > On Mon, Jan 30, 2023 at 04:18:45PM +0100, Arnd Bergmann wrote:
> >> On Thu, Jan 26, 2023, at 17:30, Bjorn Andersson wrote:
> >> 
> >> I don't feel comfortable merging the DCC driver through drivers/soc/
> >> at this point: This is the first time I see the driver and it introduces
> >> a complex user space ABI that I have no time to review as part of the
> >> merge process.
> >> 
> >
> > The DCC driver has made 22 versions over the last 23 months, but now
> > that I look back I do agree that the recipients list has been too
> > limited.
> >
> > Further more, due to the complexity of the ABI I steered this towards
> > debugfs, with the explicit mentioning that we will change the interface
> > if needed - in particular since not a lot of review interest has
> > been shown...
> 
> I'm sorry to hear this has already taken so long, I understand it's
> frustrating to come up with a good userspace interface for any of
> this.
> 
> >> I usually try to avoid adding any custom user space interfaces
> >> in drivers/soc, as these tend to be things that end up being
> >> similar to other chips and need a generic interface.
> >> 
> >
> > I have no concern with that, but I'm not able to suggest an existing
> > subsystem where this would fit.
> >
> >> In particular I don't see an explanation about how the new interface
> >> relates to the established drivers/hwtracing/ subsystem and why it
> >> shouldn't be part of that (adding the hwtracing and coresight
> >> maintainers to Cc in case they have looked at this already).
> >> 
> >
> > To my knowledge the hwtracing framework is an interface for
> > enabling/disabling traces and then you get a stream of trace data out of
> > it.
> >
> > With DCC you essentially write a small "program" to be run at the time
> > of an exception (or triggered manually). When the "program" is run it
> > acquire data from mmio interfaces and stores data in sram, which can
> > then be retrieved - possibly after the fatal reset of the system.
> >
> > Perhaps I've misunderstood the hwtracing framework, please help me steer
> > Souradeep towards a subsystem you find suitable for this functionality.
> 
> I'm also not too familiar with tracing infrastructure and was hoping
> that the coresight maintainers (Mathieu, Suzuki, Mike and Leo)
> would have some suggestions here. My initial guess was that in
> both cases, you have hardware support that is abstracted by the
> kernel in order to have a user interface that can be consumed
> by the 'perf' tool. I probably misinterpreted the part about the
> crash based trigger here, as my original (brief) reading was that
> the data snapshot could be triggered by any kind of event in
> the machine, which would make this useful as a more general
> way of tracing the state of devices at runtime. Can you describe
> how the crash trigger works, and if this would be usable with
> other random hardware events aside from an explicit software
> event?
> 
> I've added the perf maintainers to Cc as well now, for reference,
> the now reverted commit is at
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=drivers-for-6.3&id=4cbe60cf5ad62
> and it contains both the implementation and the documentation
> of the debugfs interface.
> 
> One bit I don't see is the user space side. Is there a patch for
> perf as well, or is the idea to use a custom tool for this? How
> does userspace know which MMIO addresses are even valid here?
> 
> If the possible use is purely for saving some state across
> a reboot, as opposed to other events, I wonder if there is
> a good way to integrate it into the fs/pstore/ code, which
> already has a way to multiplex various kinds of input (log
> buffer, ftrace call chain, userspace strings, ...) into
> various kinds of persistent buffers (sram, blockdev, mtd,
> efivars, ...) with the purpose of helping analyze the
> state after a reboot. 
> 

Iiuc pstore provides a place to store system state for analysis after a
reboot, but DCC provides essentially register dumps on demand - with the
system reset being a special case trigger.

So I think it would look neat to expose the DCC data alongside other
pstore data (except for the mentioned issues with ramoops not working on
most Qualcomm devices), but when the reboot happens DCC captures data in
the DCC SRAM, not in the pstore (whatever backing might be used). So
post boot, something would need to get the DCC data into the pstore.

To me this sounds in conflict with the pstore design.


Further more, with the reboot trigger being the special case, we'd need
to amend the pstore state in runtime to capture the case where the user
requested the DCC to capture the state.


One idea that I was looking at was to trigger a devcoredump as a way to
get the data out of the kernel, instead of a new device node. But it
doesn't seem to fit very well with existing use cases, and I haven't
used DCC sufficiently - given that it doesn't exist upstream...

We made significant changes to the control interface through the review
process, I think we have something that looks reasonable now, but I
picked the patches under the premise that it's unstable and in debugfs,
and exposing the tool to users could lead to more interest in
polishing it.

> >> Can you send an updated pull request that leaves out the
> >> DCC driver until we have clarified these points?
> >> 
> >
> > I will send a new pull request, with the driver addition reverted. I
> > don't think there's anything controversial with the DT binding, so let's
> > keep that and the dts nodes (we can move the yaml if a better home is
> > found...)
> 
> Right, this is fine. I merged the first pull request after I saw the
> revert in the second drivers branch, though I did not see a pull request
> from you that replaced the first one with just the revert added as
> I had expected. Also, I see that patchwork never noticed me merging
> the PR, so you did not get the automated email. Maybe you can double
> check the contents of the soc/drivers branch to see if the contents
> are what you expect them to be.
> 

I've promised the ChromeOS team to try really hard to keep the commits
in my branch stable, so I really try to avoid rebasing commits that has
been present in linux-next for a while.

Regards,
Bjorn
