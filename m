Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3616052D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 00:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiJSWMM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 18:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiJSWML (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 18:12:11 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B366E32BA8;
        Wed, 19 Oct 2022 15:12:10 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JJrUZo023772;
        Wed, 19 Oct 2022 22:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=vfFOyh6SWBoMvFWibj/u0p8XDRFkB+MXC92oQyZFXS8=;
 b=LnP2nP2npGwPE0rUvd/rNps3Y7bb3wac7717hC168LFp9WOrdGMwZmaQZ313MWJE29Kj
 l5r8aGW/gzLWy/PFaWuSdZSCE6MeOJFwdW3+1G/thEVpERrbMtXcZdncQmlLUi0uM3kn
 XR9JYURttsD15WZGG4CsbNqAPBRcYoyxSk3OlLszKzDftjY8hcueKlpTTT13ouXrYYcK
 zNgPr+vUxDeVoOyf1Z2m94e89EwzXS/MYAt8dT8J2CGkFcAIi+ALgoDt9beuEErrYN9N
 wuf9qK82i/JOyfXca47cg1XRF7SZOeX3UQ9pyftz1qLTQReKZT8WFdtbDX+Jqrg54KKP lg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9w0646eu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Oct 2022 22:11:54 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29JMBr1f023030
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Oct 2022 22:11:53 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 19 Oct 2022 15:11:52 -0700
Date:   Wed, 19 Oct 2022 15:11:52 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     Bart Van Assche <bvanassche@acm.org>
CC:     Eddie Huang <eddie.huang@mediatek.com>,
        Can Guo <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <avri.altman@wdc.com>,
        <mani@kernel.org>, <beanhuo@micron.com>,
        <stanley.chu@mediatek.com>, <liang-yen.wang@mediatek.com>
Subject: Re: Fwd: [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
Message-ID: <20221019221152.GB18511@asutoshd-linux1.qualcomm.com>
References: <11530912-36fd-8c69-4beb-de955eaae529@quicinc.com>
 <6592c7fe-0828-6bb3-17a8-9db53aac1873@quicinc.com>
 <83fe64628b6d44f28637a6a8ba6b21eb0848caaa.camel@mediatek.com>
 <20221018014754.GE10252@asutoshd-linux1.qualcomm.com>
 <12ab65aed221dec23451e9b60c0e00a4d9ef0df2.camel@mediatek.com>
 <20221019195040.GA18511@asutoshd-linux1.qualcomm.com>
 <b11cb7b4-2f4a-c6a2-82a5-c4372ff23610@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b11cb7b4-2f4a-c6a2-82a5-c4372ff23610@acm.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g_dYzOZ_h5uJI3YlK3lYlLDHepRwVBnW
X-Proofpoint-ORIG-GUID: g_dYzOZ_h5uJI3YlK3lYlLDHepRwVBnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_12,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=804 priorityscore=1501
 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210190123
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 19 2022 at 14:07 -0700, Bart Van Assche wrote:
>On 10/19/22 12:50, Asutosh Das wrote:
>>While adding the vops it occurred to me that it'd remain empty 
>>because ufs-qcom
>>doesn't need it. And I'm not sure how MTK register space is laid out.
>>So please can you help add a vops in the next version?
>>I can address the other comment and push the series.
>
>Please do not introduce new vops without adding at least one 
>implementation of the vop in the same patch series. How about letting 
>MediaTek add more vops as necessary in a separate patch series and 
>focusing in this patch series on UFSHCI 4.0 compliance?
>
Yep, I agree, I'll push the version shortly without the vops.

-asd

>Thanks,
>
>Bart.
