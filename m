Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340297940C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 17:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242710AbjIFPwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 11:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjIFPwd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 11:52:33 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672161724;
        Wed,  6 Sep 2023 08:52:30 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386FTX98019312;
        Wed, 6 Sep 2023 15:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=Nl74PhkRTAiQB4cjYZX+m7zutlK9FVL/bFNGUldZSWQ=;
 b=JNME+ZZilJqbL4FqYp2ge16vBY3NtOyD5nh62jJXUYYLlQTL+Ti+DR/IOavcNG35eSQ6
 ngZV7U5TbAtTlXslXNK6uFN3ieM8rER4LwF4Jo07D6776AmGwyLLBRK+/Rb2JWeSWeN9
 yAeS6hq7Ayss+rPO1sXEBG19D41FWSvcpJsNlF1HwW/8yhpx2iI1ihBfR4vs/BCIGAzd
 tpV3RrUlufnphBZHLEEYrfkbjGmpyyI7ls/U4CJ0CV2hnfeCfsLf4ApZ4+rOXSsrdNj+
 6t9b6ln0KIsjENVDX9CQlhj/Tjtwk+mC92EfBuKYSMd/Xs0k4RiB5kqRBWyHPdN2dT// 5Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxhjfa11a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 06 Sep 2023 15:52:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 386FqLr9004930
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 6 Sep 2023 15:52:21 GMT
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 6 Sep 2023 08:52:17 -0700
Date:   Wed, 6 Sep 2023 21:22:14 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
CC:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Johan Hovold <johan@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: Disconnect interrupt generation for QC targets when role switch
 is enabled
Message-ID: <cfa39be4-2b33-4900-800c-9884010f5e75@quicinc.com>
References: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
 <20230828172059.GC818859@hu-bjorande-lv.qualcomm.com>
 <325cf945-4d1f-5591-1ef6-b28e803c134b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <325cf945-4d1f-5591-1ef6-b28e803c134b@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XGtOx_M2ACJumWO8KIPFdPR7FgnkiQOE
X-Proofpoint-GUID: XGtOx_M2ACJumWO8KIPFdPR7FgnkiQOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=706
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060138
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 30, 2023 at 09:57:46AM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 8/28/2023 10:50 PM, Bjorn Andersson wrote:
> > > 
> > > I had some idea on how to get the role notification reach qcom glue driver
> > > but wanted your opinion on whether they can be used or not:
> > > 
> > > 1. Register a vendor_hook from glue driver and invoke that during
> > > __dwc3_set_mode.
> > > 
> > > 2. Let the role notification reach dwc3-qcom first and then let qcom driver
> > > invoke role_set of drd. Something similar to what was implemented by Wesley
> > > on [1].
> > > 
> > > But both the options require dwc3_probe to be done in sync with
> > > of_platform_populate or we need to defer qcom probe if dwc3_probe is
> > > deferred. Since we are leaning towards async probe, not sure if the above
> > > two options would be proper.
> > > 
> 
> ...
> 
> > As mentioned, this need has been identified a few times by now, so
> > nothing strange in your request/proposal.
> > 
> > But so far no one has come up with a good way to register glue code
> > callbacks with the core; we can't pass arbitrary data (such as a
> > function pointer to such callback), and we don't know when the core is
> > registered, so we can't call a register operation when that happens.
> > 
> > Regards,
> > Bjorn
> > 
> > > [1]: https://patchwork.kernel.org/project/linux-usb/patch/20201009082843.28503-4-wcheng@codeaurora.org/
> > > [2]: https://patchwork.kernel.org/project/linux-usb/cover/20230325165217.31069-1-manivannan.sadhasivam@linaro.org/
> > > 
> 
> Hi Bjorn,
> 
>  How about we use Component framework to let the glue layer know that the
> child probe is complete. That way we don't need to defer QCOM probe and in
> the bind call back coming to master (in this case, the glue layer), we can
> register the vendor hook or role switch we need and we can pass the role
> notifications from core to glue as needed.
> 

Would device_driver::sync_state() help here? The qcom glue driver
creates a DL_FLAG_SYNC_STATE_ONLY device link with dwc3 core. If it
works, we can avoid component framework related changes in dwc3 core.


Thanks,
Pavan
