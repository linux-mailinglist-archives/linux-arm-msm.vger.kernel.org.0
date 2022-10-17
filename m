Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF4F4601AE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 23:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiJQVEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 17:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiJQVEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 17:04:01 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2BC1DA73;
        Mon, 17 Oct 2022 14:04:00 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HIMWfd026841;
        Mon, 17 Oct 2022 21:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=qcppdkim1;
 bh=4fDuTy7YIX14S7FuWt7UDi/41fVxZ3I88Pazd3o+0n4=;
 b=iErUhQfqEsetuksM0jhaRabGaJU680szvJWpINwBK3neunpHnh1QWcL7y8dK59W2XEaH
 ySQRVMmSIZsI8Y9gX4dTQqJukZ0LE9XK/l4stxoOn4pzivcH2+c2MFoaKuLivI4k5PJ2
 oQqL9Ra5kwznAfW9BhgMqzu56e3IYzYnfPW38mpp6BMN0As/3mUbJYg6x91m6EVo595F
 GqodVrGmymWy2Vn8Q1JrRHBWC/dAtvcUlIPZ9/wZP0U6aQFiEqjGB8gar+KIajAPmDgA
 MHYmUp5WR7ItfPIi/sFGVJn0nu63hAPze8sRrpdwqqCYd+DtABlBPuAMuJ2DGhNAh/Z+ XA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k7p1sxtq1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 21:03:54 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29HL3rrk004722
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 17 Oct 2022 21:03:53 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 17 Oct 2022 14:03:53 -0700
Date:   Mon, 17 Oct 2022 14:03:53 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     Daejun Park <daejun7.park@samsung.com>
CC:     "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
        "quic_bhaskarv@quicinc.com" <quic_bhaskarv@quicinc.com>,
        "quic_richardp@quicinc.com" <quic_richardp@quicinc.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        cpgsproxy3 <cpgsproxy3@samsung.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_xiaosenh@quicinc.com" <quic_xiaosenh@quicinc.com>,
        "bvanassche@acm.org" <bvanassche@acm.org>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: [PATCH v2 01/17] ufs: core: Probe for ext_iid support
Message-ID: <20221017210353.GC10252@asutoshd-linux1.qualcomm.com>
References: <1d21e634e86f26e3a22be3c380a85bd4dd17f1ae.1665017636.git.quic_asutoshd@quicinc.com>
 <cover.1665017636.git.quic_asutoshd@quicinc.com>
 <CGME20221006010736epcas2p20777225a537d4f2124e9a7264b2fffcf@epcms2p3>
 <20221006035037epcms2p3053f17ec4b42f48657803b98345d843a@epcms2p3>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006035037epcms2p3053f17ec4b42f48657803b98345d843a@epcms2p3>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3qqA3ZOhYHQUcvTLHPsl9XdiXerRTo7o
X-Proofpoint-GUID: 3qqA3ZOhYHQUcvTLHPsl9XdiXerRTo7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210170120
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 06 2022 at 20:50 -0700, Daejun Park wrote:
>Hi Asutosh Das,
>
>>diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
>>index 7fe1a92..da1eb8a 100644
>>--- a/include/ufs/ufshcd.h
>>+++ b/include/ufs/ufshcd.h
>>@@ -737,6 +737,7 @@ struct ufs_hba_monitor {
>>  * @outstanding_lock: Protects @outstanding_reqs.
>>  * @outstanding_reqs: Bits representing outstanding transfer requests
>>  * @capabilities: UFS Controller Capabilities
>>+ * @mcq_capabilities: UFS Multi Command Queue capabilities
>
>Maybe UFS Multi Circular Queue?
>
Will change it. Thanks.
>Thanks,
>Daejun
>
