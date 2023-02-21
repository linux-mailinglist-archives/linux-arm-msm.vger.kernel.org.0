Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D497169E3DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 16:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234631AbjBUPpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 10:45:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbjBUPpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 10:45:39 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5076D29163;
        Tue, 21 Feb 2023 07:45:25 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LDr2u4009752;
        Tue, 21 Feb 2023 15:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=yqEvGPIm/0nGrbcOYqE1m8JZqDKJjNolmthwUdnGJ+Y=;
 b=i3BkjeotpB61mUvhxRzzjsZzPiBDyiby33qU7bn2Q/Pu7Un1cE9Yshv1egoBKJOjhrlF
 tt3hsgMe9dgJ+Yn7ar1fwVt+C3joDHgrwk1QucveEndcxUe3EqG6I89uYjlH1jfsAUgJ
 K8fgpSSX1Ulo6KCkzQtdjeoEDcnCCjmGY/M+uHONxgyMdotWBUMgkE1HQDrkqJrtpAV6
 PBqEWk2/0qWlvIsUPa1mLxWF8jP5bLTVh3JhDHfHsv5Xd3wi2Fv+gv6xgNGwidVOl5Qm
 TT4VLGAjhCTnnLg50XzTt7uw9Da8m7E3blWYWzogXRd732w9mAgvf+DYneGKKFRAThEk CQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nvp211h21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 15:44:54 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31LFirGG006064
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 15:44:53 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 21 Feb 2023 07:44:52 -0800
Date:   Tue, 21 Feb 2023 07:44:51 -0800
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Kathiravan T <quic_kathirav@quicinc.com>
CC:     Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Arnd Bergmann" <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Sricharan R <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
Message-ID: <20230221154451.GA1092194@hu-bjorande-lv.qualcomm.com>
References: <20230219045318.564342-1-andersson@kernel.org>
 <6d5eb527-7e1c-29bb-e13c-e48c989bf8cd@quicinc.com>
 <20230220153544.cda5uqnjnir6jrdx@ripper>
 <a25a0ed5-ba9c-c669-def3-865dcb5072fc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a25a0ed5-ba9c-c669-def3-865dcb5072fc@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: udJWEu_0v-oAT4koxnB8MUMj41L6BxBu
X-Proofpoint-GUID: udJWEu_0v-oAT4koxnB8MUMj41L6BxBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_08,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210130
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 20, 2023 at 10:10:07PM +0530, Kathiravan T wrote:
> 
> On 2/20/2023 9:05 PM, Bjorn Andersson wrote:
> > On Mon, Feb 20, 2023 at 05:17:39PM +0530, Kathiravan T wrote:
> > > On 2/19/2023 10:23 AM, Bjorn Andersson wrote:
> > > > The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> > > > 
> > > >     Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >     https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.3
> > > > 
> > > > for you to fetch changes up to 7935b534d32a1823a7d5db449d340f56c201f284:
> > > > 
> > > >     dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml (2023-02-08 19:29:25 -0800)
> > > > 
> > > > ----------------------------------------------------------------
> > > > Qualcomm clock driver updates for v6.3
> > > > 
> > > > Support for requesting the next power_off operation for a genpd to be
> > > > synchronous is introduced, and implemented in the GDSC driver. To allow
> > > > the GPU driver to request power_off to wait for the GDSC to actually
> > > > collapse.
> > > > 
> > > > clk_disable_unused() is altered, to not consider clocks which comes from
> > > > a provider with sync_state defined. This makes it possible for
> > > > individual clock drivers to invoke this process once all clients has
> > > > been probed, avoiding the need for booting many systems with
> > > > clk_ignore_unused.
> > > > This is then enabled for SDM845 and SC8280XP clock controllers.
> > > > 
> > > > Support for QDU1000/QRU1000 Global clock controller, SA8775P Global
> > > > clock controller, SM8550 TCSR and display clock controller, SM6350 clock
> > > > controller, nd MSM8996 CBF and APCS clock controllers is introduced..
> > > > 
> > > > Parent references are updated across a large number of clock drivers, to
> > > > align with the design changes since those drivers where introduced.
> > > > Similarly, test clocks has been dropped from a range of drivers.
> > > > 
> > > > A range of fixes for the MSM8996 CPU clock controller is introduced.
> > > > 
> > > > MSM8974 GCC is transitioned off the externally defined sleep_clk.
> > > > 
> > > > GDSC in the global clock controller for QCS404 is added, and various
> > > > parent definitions are cleaned up.
> > > > 
> > > > The SDCC core clocks on SM6115 are moved for floor_ops.
> > > > 
> > > > Programming of clk_dis_wait for GPU CX GDSC on SC7180 and SDM845 are
> > > > moved to use the recently introduced properties in the GDSC struct.
> > > > 
> > > > The RPMh clock driver gains SM8550 and SA8775P clocks, and the IPA clock
> > > > is added on a variety of platforms.
> > > > 
> > > > The SMD RPM driver receives a big cleanup, in particular a move away
> > > > from duplicating declaration of identical clocks between multiple
> > > > platforms.
> > > > A few missing clocks across msm8998, msm8992, msm8916, qcs404 are added
> > > > as well.
> > > > 
> > > > Using devm_pm_runtime_enable() to clean up some duplication is done
> > > > across SM8250 display and video clock controllers, SM8450 display clock
> > > > controller and SC7280 LPASS clock controller.
> > > > 
> > > > Devicetree binding changes for above mentioned additions and changes are
> > > > introduced.
> > > > 
> > > > Lastly, a change to pad a few registers in the SM8250 DTS to 8 digits
> > > > was picked up in the wrong tree and kept here, to avoid rebasing.
> > > > 
> > > > ----------------------------------------------------------------
> > > <snip>
> > > 
> > > Bjorn,
> > > 
> > Hi Kathiravan,
> > 
> > > I don't see the change got picked up v6.3 https://lore.kernel.org/linux-arm-msm/20230120082631.22053-1-quic_kathirav@quicinc.com/.
> > > Please help to understand what is missing to get it picked up?
> > > 
> > Afaict, this patch introduces support that doesn't have a user today,
> > and as such should be merged together with:
> > https://lore.kernel.org/linux-arm-msm/20230217083308.12017-4-quic_kathirav@quicinc.com/
> 
> 
> Thanks Bjorn. I got the point. This patch also needed for IPQ5332 Baseport
> patches https://lore.kernel.org/linux-gpio/20230217075835.460-1-quic_kathirav@quicinc.com/
> 
> 
> > Which hasn't yet been picked up...
> > 
> > But please send such patches together in the future, to make it easier
> > for people to review and me to merge them.
> 
> 
> If I re-spin the IPQ5332 base port patches, shall I add this patch to the
> IPQ5332 series itself and send it or you are okay to pick it up as it is?
> 

Doesn't:
https://lore.kernel.org/linux-gpio/20230217075835.460-1-quic_kathirav@quicinc.com/
depend on:
https://lore.kernel.org/linux-arm-msm/20230217083308.12017-4-quic_kathirav@quicinc.com/
being merged first?

If you are going to resubmit the IPQ5332 baseport, please consider
sending one series with all the clock patches together.

You may send the dts separately, mentioning the dependency on the clock
series - or any other independent driver series that you sent out. That
way you make it easy for each maintainer to pick the patches destined
for their tree.

Regards,
Bjorn
