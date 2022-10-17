Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB2B601AAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbiJQUz2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbiJQUzY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:55:24 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77FBD72940;
        Mon, 17 Oct 2022 13:55:14 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HK5FdQ026454;
        Mon, 17 Oct 2022 20:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=qcppdkim1;
 bh=G9Sw2snGEpwIvD9/Bkivii9ny0RJb8M4QZFcazBSPUM=;
 b=QjwiAhdY0+qC1U83HeHxFoApAsPTAkDSHuebEyAqDkdTBcveKJIsNzlT0qNrIxHrxL1m
 MmUB1r9QzHL+dtGO0s45GLzPBB1NFdxn7SAfnlHVPLneh5Bo7kHy9cPo6u2xDx9P+Drm
 EEgLJ6+pnHZYYAUu3HCgaDDhZkZi5W6r1hlLs641utcyERWDdi+3Y2YEEHQa9qEA+qZP
 80rI+ffTKN1tqh7iDzlq8WWae6sBbUy1O0OTNc0oBzBOuZb8HOcWZ5qLA9edf6iXXx7e
 GkB1EH1g+z0tUoahTNd6+8HsA8M1eiRyixV++5Y34lBpK36KW1ITgFJGFGSvXGaeOine kg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7n8dvwm3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 20:54:55 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29HKsss4024903
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 20:54:54 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 17 Oct 2022 13:54:54 -0700
Date:   Mon, 17 Oct 2022 13:54:45 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     Daejun Park <daejun7.park@samsung.com>
CC:     "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
        "quic_bhaskarv@quicinc.com" <quic_bhaskarv@quicinc.com>,
        "quic_richardp@quicinc.com" <quic_richardp@quicinc.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_xiaosenh@quicinc.com" <quic_xiaosenh@quicinc.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
Message-ID: <20221017205445.GA10252@asutoshd-linux1.qualcomm.com>
References: <271ed77a0ff46390c90fdcde71890d8cec83b8c9.1665017636.git.quic_asutoshd@quicinc.com>
 <cover.1665017636.git.quic_asutoshd@quicinc.com>
 <CGME20221006010745epcas2p38b37890b7e1fefb45b8fbb0e14ab0a82@epcms2p7>
 <20221007024138epcms2p729595abf03da8402618c4803b20a4d13@epcms2p7>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221007024138epcms2p729595abf03da8402618c4803b20a4d13@epcms2p7>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3mBvWk4Qj1xGknSVC7_ZITYX63dE-5TQ
X-Proofpoint-GUID: 3mBvWk4Qj1xGknSVC7_ZITYX63dE-5TQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=720 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170119
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 07 2022 at 19:41 -0700, Daejun Park wrote:
>Hi Asutosh Das,
>
>>Define the mcq resources and add support to ioremap
[...]

>>+                res->base = devm_ioremap_resource(hba->dev, res->resource);
>>+                if (IS_ERR(res->base)) {
>>+                        dev_err(hba->dev, "Failed to map res %s, err=%d\n",
>>+                                         res->name, (int)PTR_ERR(res->base));
>>+                        res->base = NULL;
>>+                        ret = PTR_ERR(res->base);
>I think res->base has already NULL value.
>
Thanks, I will fix it.

>Thanks,
>Daejun
