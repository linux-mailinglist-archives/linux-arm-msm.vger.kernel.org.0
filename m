Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0265777BB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Aug 2023 17:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234863AbjHJPJj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 11:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233295AbjHJPJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 11:09:38 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 727932694
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 08:09:38 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37AC2ndF028765;
        Thu, 10 Aug 2023 15:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=jQflt2SjHrppBEg9jVpU16XW9VL9wr9LrgXwf4kw82Y=;
 b=Uezz6c4VvH771cpLoznwW4iEH1UBsPpCUfjgLqk+Z4J5Iumch5c3PTOzIuxcqy3K86Ea
 nfg4LTJ6xvCfnNwj4cM9R+c1I5TqIpdgdgqIK07hl19u9vWxrOSSIQREg5pmMKSDX8xy
 txhU0APGOA7xvUBYZFcRS/Z7/LlcICmtvakPZjgkP0V+PJibN3gh+KQSBnUwmunf4Nc6
 uwmDXS8NQmchjnQX14xO+q/GareJ52jEnUdvMafvc3/9+JnOTLqx3xQtc5q4S5evn9CT
 NRWZoKJMW/sx/9yn7U/eqd5BwBPAnjiEen9CTXrEM8IpW62GhgQxqQeRsIftwtyXXA3p rg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc5ffbskn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Aug 2023 15:09:28 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37AF9RSr006852
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Aug 2023 15:09:27 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 10 Aug 2023 08:09:26 -0700
Date:   Thu, 10 Aug 2023 08:09:25 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Li Zetao <lizetao1@huawei.com>
CC:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH -next] regulator: qcom_rpm-regulator: Use devm_kmemdup to
 replace devm_kmalloc + memcpy
Message-ID: <20230810150925.GN1428172@hu-bjorande-lv.qualcomm.com>
References: <20230810114858.2103928-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230810114858.2103928-1-lizetao1@huawei.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NuO9HPoqVliKJD_wk1yww5n95F017ZTg
X-Proofpoint-GUID: NuO9HPoqVliKJD_wk1yww5n95F017ZTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_12,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=453
 mlxscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308100129
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 10, 2023 at 07:48:58PM +0800, Li Zetao wrote:
> Use the helper function devm_kmemdup() rather than duplicating its
> implementation, which helps to enhance code readability.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Regards,
Bjorn
