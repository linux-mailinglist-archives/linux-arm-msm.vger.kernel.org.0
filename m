Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65946050BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 21:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiJSTvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 15:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiJSTvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 15:51:13 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FAE191D73;
        Wed, 19 Oct 2022 12:51:10 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JFBBNx017232;
        Wed, 19 Oct 2022 19:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=fFr0GShiMig/xf6dk+t3jNtTP04VZwguanfX8yv7+YM=;
 b=OaXLhJrKaX8/p0vT0rEdghn1E7jH0GzbsoXLDBc/UgEmFHeRDF1q/II5DUTIaZV+3azX
 ngFXYAyR5xGW8S3HOw2NyKOIoLPDMgI6rt8rmxg0m+u+qxU6hu1/OGJr38tFMgwmYQrg
 lJ7FHwxFWso460xHryrzHlkfFQ7VwSzO9vBFCh5t7aKx9GqS4mX14+skyjkf5KaHhYCE
 O7jhc/L0jwo7ejVV2xH+LJEp8rIbGiUIFbP6+pngO+rAF5Yyf65ci2+ES1mO/sFlPWNr
 LNdNIaLdc5Dpp83SVsMZqbQn4jDnq8kx5qJLScumGuAGVe59IVomGFy26gdFcwdJ41Eh +w== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kaknjgxpa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Oct 2022 19:50:48 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29JJolj7011858
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Oct 2022 19:50:47 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 19 Oct 2022 12:50:47 -0700
Date:   Wed, 19 Oct 2022 12:50:40 -0700
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
Message-ID: <20221019195040.GA18511@asutoshd-linux1.qualcomm.com>
References: <11530912-36fd-8c69-4beb-de955eaae529@quicinc.com>
 <6592c7fe-0828-6bb3-17a8-9db53aac1873@quicinc.com>
 <83fe64628b6d44f28637a6a8ba6b21eb0848caaa.camel@mediatek.com>
 <20221018014754.GE10252@asutoshd-linux1.qualcomm.com>
 <12ab65aed221dec23451e9b60c0e00a4d9ef0df2.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <12ab65aed221dec23451e9b60c0e00a4d9ef0df2.camel@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NPcinRf2BL_8H8mR1Kx-fmJ9571d1o1f
X-Proofpoint-ORIG-GUID: NPcinRf2BL_8H8mR1Kx-fmJ9571d1o1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_11,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190111
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 18 2022 at 19:57 -0700, Eddie Huang wrote:
>Hi Asutosh,
>
[...]
>>
>> How about we add a vops to ufshcd_mcq_config_resource().
>> SoC vendors should make sure that the vops populates the mcq_base.
>>
>
>It is good to add vops to ufshcd_mcq_config_resource() let SoC vendors
>populate mcq_base
>
While adding the vops it occurred to me that it'd remain empty because ufs-qcom
doesn't need it. And I'm not sure how MTK register space is laid out.
So please can you help add a vops in the next version?
I can address the other comment and push the series.

Please let me know.
>
>Thanks,
>Eddie Huang
>
-asd
>
