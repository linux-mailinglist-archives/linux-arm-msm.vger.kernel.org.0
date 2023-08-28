Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E09FD78B64E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 19:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjH1RVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 13:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbjH1RVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 13:21:13 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5884DE1;
        Mon, 28 Aug 2023 10:21:10 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37SEHFqi002313;
        Mon, 28 Aug 2023 17:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=I0DTISILOn+O9DXCR29s3guG7mCG2+3VukUCjYlcKv4=;
 b=Fw7KxbzXkrEvX4wzzS94cmtOnCx1RwBCyTkR28pkAj0kWxngEjq2R5PaW6+9nHz1MNHu
 tp39wbN2+irmsIHkx1knsdxSSWOjidScnV9JJM9ChYbIfDMCiiu2avIN4aD8lnA1lL8W
 iaSJXN0+S2XvW+nALrgm0ctWDJUrCmQAYrF2b/qnygb3RGQWBXe4TpojD5zuBxrcpbi4
 X9n1/gvSLXpcQhA/VGcNGIQ96CJl5VU9TZpxurbYvHkdi63QHqL6qiqlg1FpUm+HZYkC
 tGxqc/96MjLOb+yj7aSOS2p06bIc2xtXkVa7g+GNkLg1Yq7eJyGdNutG4afAefC+odI+ Kg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sq8qrv13g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 17:21:02 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37SHL1LC000656
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Aug 2023 17:21:01 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 28 Aug 2023 10:21:00 -0700
Date:   Mon, 28 Aug 2023 10:20:59 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: Disconnect interrupt generation for QC targets when role switch
 is enabled
Message-ID: <20230828172059.GC818859@hu-bjorande-lv.qualcomm.com>
References: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BUiydJTMxZ3cpzlI387FWnzhb3fiOCe3
X-Proofpoint-GUID: BUiydJTMxZ3cpzlI387FWnzhb3fiOCe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_14,2023-08-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308280152
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 11, 2023 at 05:21:03PM +0530, Krishna Kurapati PSSNV wrote:
> Hi Thinh, Johan, Bjorn, Konrad,
> 
>   On QC targets today, the disconnect event in device mode is generated by
> controller when software writes to QSCRATCH registers in qcom glue layer
> rather than the vbus line being routed to dwc3 core IP for it to recognize
> and generate conndone/disconnect events.
> 
> We need to write '1' to  UTMI_OTG_VBUS_VALID bit of QSCRATCH_HS_PHY_CTRL
> register to generate a connection done event and "0" if we need to generate
> a disconnect event during cable removal or mode switch. Exactly what is done
> by "dwc3_qcom_vbus_override_enable" call in dwc3-qcom. In case the user
> wants to enable runtime suspend for dwc3 and we don't generate a disconnect
> event, the dwc->connected flag will be "true" and it would block suspend
> entry.
> 
> Today, in dwc3-qcom, this qscratch modification is being done only for
> vbus/host notifiers where I assume dwc3-qcom would be receiving these
> notifications from charger driver regarding cable connect and removal and
> since we are receiving a copy of the information in dwc3-qcom as well, we
> would be knowing when to set/clear the VBUS_VALID bit.
> 
> But, when we have role switch in play, the role_set callback goes to DRD and
> Qcom driver is agnostic of what is actually happening. While this doesn't
> hinder mode switch, the role change notification never really reaches
> dwc3-qcom and we would never set this bit to "0" and disconnect event is not
> generated upon cable plug-out. Is there a way we can properly provide this
> notification to qcom glue driver ?
> 
> I had some idea on how to get the role notification reach qcom glue driver
> but wanted your opinion on whether they can be used or not:
> 
> 1. Register a vendor_hook from glue driver and invoke that during
> __dwc3_set_mode.
> 
> 2. Let the role notification reach dwc3-qcom first and then let qcom driver
> invoke role_set of drd. Something similar to what was implemented by Wesley
> on [1].
> 
> But both the options require dwc3_probe to be done in sync with
> of_platform_populate or we need to defer qcom probe if dwc3_probe is
> deferred. Since we are leaning towards async probe, not sure if the above
> two options would be proper.
> 
> Couple of more reasons to ask for the above two options:
> 
> 1. We would know when we are in device/host mode and we can avoid having any
> layering violations in dwc3-qcom.
> 
> 2. When it comes to runtime pm implementation for dwc3-qcom, an effort was
> done by Manivannan Sadhasivam previously [2], we can avoid modifying
> xhci-plat.c to set autosuspend delay to any specific value. We would be able
> to enable runtime/autosuspend for dwc->xhci->dev from dwc3-qcom itself upon
> entering host mode.
> 
> Can you help let know your thoughts on the above two options or if there is
> any way we can implement the role change / cable plug in(out) callback.
> 

As mentioned, this need has been identified a few times by now, so
nothing strange in your request/proposal.

But so far no one has come up with a good way to register glue code
callbacks with the core; we can't pass arbitrary data (such as a
function pointer to such callback), and we don't know when the core is
registered, so we can't call a register operation when that happens.

Regards,
Bjorn

> [1]: https://patchwork.kernel.org/project/linux-usb/patch/20201009082843.28503-4-wcheng@codeaurora.org/
> [2]: https://patchwork.kernel.org/project/linux-usb/cover/20230325165217.31069-1-manivannan.sadhasivam@linaro.org/
> 
> Regards,
> Krishna,
