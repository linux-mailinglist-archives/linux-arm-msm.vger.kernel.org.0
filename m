Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B51C1602092
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 03:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbiJRBsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 21:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiJRBsF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 21:48:05 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178C276449;
        Mon, 17 Oct 2022 18:48:05 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29I0Tv5u016894;
        Tue, 18 Oct 2022 01:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=2h+gz1hxNAKM5nra+wV+qlaIUNxk2/E+8vNNFtGBFj8=;
 b=jH5rK6oKKe4fShbDyrxAeSo004faC7EUDuAcnLh9lYJUOY7Gx6/BXG3qIfq1O1ld2Pi6
 6azcbIKjdKAKfHqwA4BoQvACIAq/YVXWBKkha6wds6Qce+9IME67bi/o9mbyAfVE7gG3
 yh8wq0DJOk1MHz+hpMV+51lB8z3W9smjb22hqjby3rV1JbVGK0EP7C3yL7U/Xz1+dCM7
 FmEFsQ7N7vAyjOyTJoMNjK9ynuWz4JV3MusMrJVjjfhy+lpUSrCBOU1BcmbcnuZb801B
 s1M/E41jjtrOSgefxBbUEHxFWZs2Y3d1z51XFtzcBtpwVuYBuSxnurWYwt5yzYfJ6GMZ 0g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k9hnb04xk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Oct 2022 01:47:55 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29I1ltNE013368
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Oct 2022 01:47:55 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 17 Oct 2022 18:47:54 -0700
Date:   Mon, 17 Oct 2022 18:47:54 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     Eddie Huang <eddie.huang@mediatek.com>
CC:     Can Guo <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>,
        <stanley.chu@mediatek.com>, <liang-yen.wang@mediatek.com>
Subject: Re: Fwd: [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
Message-ID: <20221018014754.GE10252@asutoshd-linux1.qualcomm.com>
References: <11530912-36fd-8c69-4beb-de955eaae529@quicinc.com>
 <6592c7fe-0828-6bb3-17a8-9db53aac1873@quicinc.com>
 <83fe64628b6d44f28637a6a8ba6b21eb0848caaa.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <83fe64628b6d44f28637a6a8ba6b21eb0848caaa.camel@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QGjBlXB8knwMUFwSmWOYwEbt0W3zdvrO
X-Proofpoint-GUID: QGjBlXB8knwMUFwSmWOYwEbt0W3zdvrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=991 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180008
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 17 2022 at 02:27 -0700, Eddie Huang wrote:
>Hi Can,
>
[...]

>Let me explain more detail about Mediatek UFS register assignment:
>a. 0x0 ~ 0x5FF: UFS common register
>b. 0x1600 ~   : MCQ register
>c. 0x2200: UFS common vendor specific register
>d. 0x2800: SQ/CQ head/tail pointer and interrupt status/enable register
>     0x2800 SQ0_head
>     0x2814 SQ0_IS
>     0x281C CQ0_head
>     0x2824 CQ0_IS
>
>The register location meet UFSHCI4.0 spec definition
>
>In legacy doorbell mode, need region a, c registers
>In MCQ mode, need region a, b, c, d registers
>
>As you can see, region b in the middle of region a and c. If I declare
>"mcq" in device tree, i.e.
>reg = <0, 0x11270000, 0, 0x2300>,
>      <0, 0x11271600, 0, 0x1400>;
>reg-names = "ufs_mem", "mcq";
>
>Linux kernel boot fail due to register region overlapped and
>devm_ioremap_resource() return error.
>
>If I don't declare "mcq" region in device tree, Linux kernel still boot
>fail due to ufshcd_mcq_config_resource() call devm_ioreamap_resource()
>using calculated res_mcq which is overlapped with ufs_mem.
>
>We treat UFS as a single IP, so we suggest:
>1. Map whole UFS register (include MCQ) in ufshcd_pltfrm_init()
>2. In ufshcd_mcq_config_resource() assign mcq_base address directly,
>ie,
>     hba->mcq_base = hba->mmio_base + MCQ_SQATTR_OFFSET(hba-
>>mcq_capabilities)
>3. In ufshcd_mcq_vops_op_runtime_config(), assign SQD, SQIS, CQD, CQIS
>base, offset and stride
>
>This is why I propose ufshcd_mcq_config_resource() to be customized,
>not in common code
How about we add a vops to ufshcd_mcq_config_resource().
SoC vendors should make sure that the vops populates the mcq_base.

>Regards,
>Eddie Huang
>
>
