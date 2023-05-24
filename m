Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7985670FDA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 20:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjEXSSM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 14:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234734AbjEXSSK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 14:18:10 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20659B6
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 11:18:09 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OHPlhE017679
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 18:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : to : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=cAAnr4DuXkRt3AOM8DTOFG/k2jTPorCqiZl7rpcIjNo=;
 b=kS03NOlp2BKleYaEsRQO3PWJ5sRH24KTyOhmd3tgxhNTGlMYYHLhc6GrxY16UyQIsclM
 ovjSsI9FDah/eWy8KLF9wqyFsY5PXLe16wuA55db18sIj5W0+dyUtz5tka2w2I8rBsIn
 vGxj2Tb2vZ+hxxMv8w3jyZujBA4ZxwgIsuASk63ffFcfnMsydkX7e5d+JGpCSnPGLFQY
 6hIIxbghmklxwpOZLHoLgSDYkQekwKHjmXEf8Ejx74pwUVQXlI9U1PjCcp/beBK558W+
 z7mJC4HhYPNo+OPfg1TYdzu9yWWe7q4pqLW0+4T0bTey8GlyXumkf3TsgFu7huOgV/j4 hQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qs9wet1jh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 18:18:08 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OII7ob009629
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 18:18:07 GMT
Received: from [10.110.74.38] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 11:18:06 -0700
Message-ID: <bdf0e3fa-94f1-b3be-f6f5-3050c1019ecc@quicinc.com>
Date:   Wed, 24 May 2023 11:18:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
From:   Trilok Soni <quic_tsoni@quicinc.com>
Subject: EXPORT_SYMBOL_GPL only
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Oc28RZhxx3EMBKD50c3DLrW21DMiLQ5N
X-Proofpoint-GUID: Oc28RZhxx3EMBKD50c3DLrW21DMiLQ5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_11,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=636 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240151
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Bjorn and linux-arm-msm members,

Is it possible to accept the patches which EXPORT_SYMBOL_GPL only for 
patches submitted on this list?

If not, I would like to know the reason(s) why we should accept 
EXPORT_SYMBOL only APIs.

---Trilok Soni
