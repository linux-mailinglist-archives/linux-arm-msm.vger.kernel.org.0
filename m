Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA217601AE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 23:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiJQVDn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 17:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiJQVD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 17:03:27 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC8A1DA73;
        Mon, 17 Oct 2022 14:03:27 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HG3dOX032147;
        Mon, 17 Oct 2022 21:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=qcppdkim1;
 bh=yT6MYHOo7+ion5T0YeyzHCUULtCOAbAyVqB4Z6gIP58=;
 b=RX4jPADzrOd4ruK2WviNE+vI9TT/6sevD+YnC0KLY/f/3nh/nPUPzfds8MV9fCEcWsKC
 8bg+0HHKhkGduasdK5P5/36vRtJkgEDMEYQO5EbBbi/pq7NqeJmNRvwKAU8c+8jtc3Fr
 u8YiVc7AwjkrafjGG/A16ZUYfPqiG7mv4wrjDq20lXamwzd3yj79YI0sywcxHfabK+Z0
 NFp63f91Ud3SqmD94kaLABcyZFLO1s5z89b9Gn03/2PTDRN30PVsU/jefonwenIVnaKP
 T/iG6Zq7wlDr4knpzhzg33dG/lqXqyubALTcbtg2NMjHW2oi8q3QC7KUS2H8W/c9ibUr gw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7n8dvx12-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 21:03:14 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29HL3Dt2016522
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 21:03:13 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 17 Oct 2022 14:03:12 -0700
Date:   Mon, 17 Oct 2022 14:03:12 -0700
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
Subject: Re: (2) [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
Message-ID: <20221017210312.GB10252@asutoshd-linux1.qualcomm.com>
References: <20221007024138epcms2p729595abf03da8402618c4803b20a4d13@epcms2p7>
 <271ed77a0ff46390c90fdcde71890d8cec83b8c9.1665017636.git.quic_asutoshd@quicinc.com>
 <cover.1665017636.git.quic_asutoshd@quicinc.com>
 <CGME20221006010745epcas2p38b37890b7e1fefb45b8fbb0e14ab0a82@epcms2p8>
 <20221007034419epcms2p84f51fef929459cef230c34c1dbfbff1d@epcms2p8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221007034419epcms2p84f51fef929459cef230c34c1dbfbff1d@epcms2p8>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: njWNTaveACBOm3l8ri6gUqxVIGsct9jz
X-Proofpoint-GUID: njWNTaveACBOm3l8ri6gUqxVIGsct9jz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170120
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 07 2022 at 20:44 -0700, Daejun Park wrote:
>Hi Asutosh Das,
>
[...]
>>+        res = &hba->res[RES_MCQ];
>>+        /* Bail if NCQ resource is provided */
>Maybe MCQ?
Thanks, will fix it.

>
>>+        if (res->base)
>>+                goto out;
>>+
>>+        /* Manually allocate MCQ resource from ufs_mem */
>>+        res_mcq = res->resource;
>Why we assign the value to res_mcq?
>
Hmm, good point, will fix it.

>>+        res_mcq = devm_kzalloc(hba->dev, sizeof(*res_mcq), GFP_KERNEL);
>>+        if (!res_mcq) {
>>+                dev_err(hba->dev, "Failed to allocate MCQ resource\n");
>>+                return ret;
>>+        }
>>+
>>+        res_mcq->start = res_mem->start +
>>+                         MCQ_SQATTR_OFFSET(hba->mcq_capabilities);
>>+        res_mcq->end = res_mcq->start + hba->nr_hw_queues * MCQ_QCFG_SIZE - 1;
>>+        res_mcq->flags = res_mem->flags;
>>+        res_mcq->name = "mcq";
>>+
>>+        ret = insert_resource(&iomem_resource, res_mcq);
>>+        if (ret) {
>>+                dev_err(hba->dev, "Failed to insert MCQ resource, err=%d\n", ret);
>Should we free the res_mcq?
>
yes, will add it. Thanks.

>>+                return ret;
>>+        }
>>+
>>+        res->base = devm_ioremap_resource(hba->dev, res_mcq);
>>+        if (IS_ERR(res->base)) {
>>+                dev_err(hba->dev, "MCQ registers mapping failed, err=%d\n",
>>+                        (int)PTR_ERR(res->base));
>Should we call remove_resource and free the res_mcq?
>
I'll add the cleanup here.
>Thanks,
>Daejun
