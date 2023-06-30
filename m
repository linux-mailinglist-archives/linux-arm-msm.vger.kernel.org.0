Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843C87443B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjF3U7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjF3U7a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:59:30 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450623C24;
        Fri, 30 Jun 2023 13:59:29 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UKRSrw019393;
        Fri, 30 Jun 2023 20:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=F9lRUxOe9JMn9BKK/exByYdWkb10qhfIkBvZyU3vKk8=;
 b=ou65/KqlCOQ5TrtDZx12toOl5aJ5HTWgwbBk4Jt8rFDFVMk2LdPkA594jKB7NALqvx9y
 yYy/8XBAqAoUYJgQaRg0zdKYVPyGTy9WwGuEH1kAozP/+cRfIsy8SzaSU8HsUcoHrZ/U
 LKyuC/fixcGvJ3ackhpN0LcpxzNom8wxDr7VVbgGxcqaK3UrQU8jZkCSQEg/nXA62IqH
 4ZzSnDtvZ+7ETPDecwAGAHdTEMQUU67LYC2o6SCHwcnaUQgM8KrztwKVvs0oiESjc8DB
 MtftHcpOpCmWHXSQ7aF5MMRtcCSZ25k7QGbGcJgMsd90vOY8rOGDY9wGpz+EnbGV1qEf dw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rhwuts81n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 20:59:24 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35UKxMIA002876
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 20:59:22 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.7; Fri, 30 Jun 2023 13:59:22 -0700
Date:   Fri, 30 Jun 2023 13:59:20 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8450-hdk: add ADC-TM thermal
 zones
Message-ID: <20230630205920.GE1059662@hu-bjorande-lv.qualcomm.com>
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-8-dmitry.baryshkov@linaro.org>
 <c59d002b-9d06-d744-d90b-22da4186522a@linaro.org>
 <CAA8EJpp+b1KVaMK82j7T=iGovXVAu3jq51rTHu6yqPcnkwXoeg@mail.gmail.com>
 <65d9025b-134d-eb8c-98d8-ab7103a5dc44@linaro.org>
 <CAA8EJpopHRNTyuzi2V=1t7o5xbXaCjxjP=yQUigCYDJMULxb=Q@mail.gmail.com>
 <e2c6abdc-f586-be9c-b400-7bf57021d5fa@linaro.org>
 <CAA8EJpoN0nVJdBwYfRkS305fWjbHL6BUxcgo1CmS8jmn6gp2jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpoN0nVJdBwYfRkS305fWjbHL6BUxcgo1CmS8jmn6gp2jg@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UpmLgQFU536DAL2dUYTDxtiY2BrGF5bI
X-Proofpoint-GUID: UpmLgQFU536DAL2dUYTDxtiY2BrGF5bI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_12,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 bulkscore=0 mlxlogscore=686 lowpriorityscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306300184
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 30, 2023 at 08:42:23PM +0300, Dmitry Baryshkov wrote:
> On Fri, 30 Jun 2023 at 19:15, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >
> > On 30.06.2023 14:57, Dmitry Baryshkov wrote:
> > > On Fri, 30 Jun 2023 at 14:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > >>
> > >> On 30.06.2023 12:07, Dmitry Baryshkov wrote:
> > >>> On Fri, 30 Jun 2023 at 11:19, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > >>>>
> > >>>> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> > >>>>> Add thermal zones controlled through the ADC-TM (ADC thermal monitoring)
> > >>>>> PMIC interface. This includes several onboard sensors and the XO thermal
> > >>>>> sensor.
> > >>>>>
> > >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>>>> ---
> > >>>> [...]
> > >>>>>
> > >>>>> +     channel@144 {
> > >>>>> +             reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
> > >>>> This define should be cleaned up.. Since it takes a sid argument,
> > >>>> it really is ADC7_AMUX_THM1_100K_PU(sid)
> > >>>
> > >>> I don't think I understood your comment. The define itself is specific
> > >>> to PM8350, other PMICs might have different channel assignments.
> > >>
> > >> include/dt-bindings/iio/qcom,spmi-vadc.h
> > >> 263:#define ADC7_AMUX_THM1_100K_PU                      0x44
> > >
> > > Do you want to define PM8350_ADC7_AMUX_THM1_100K_PU(sid) using
> > > ADC7_AMUX_THM1_100K_PU ?
> > > Or to make all users use ADC7_AMUX_THM1_100K_PU?
> >
> >
> > >Or add the SID
> > > argument to ADC7_AMUX_THM1_100K_PU and switch to it?
> > This.
> >
> > Since we have a generic binding for it (not sure what sort of ABI-ish rules
> > apply here, probably not very many since it's just a dumb preprocessor define),
> > we should not redefine it for each PMIC, especially since the SIDs are variable
> > nowadays :/
> 
> I think it would be worth to have per-PMIC headers (which define which
> channels are available on this PMIC), but to use values from the
> qcom,spmi-vadc.h  header to define those per-PMIC values.
> 
> WDYT?
> 

Note that the channel relates to this PMIC, but the sid is of the
measured PMIC. So I'm not sure which PMIC you're thinking of when you
say per-PMIC...

Regards,
Bjorn
