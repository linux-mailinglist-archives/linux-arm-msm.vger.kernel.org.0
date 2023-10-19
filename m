Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5667CF57C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 12:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbjJSKkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 06:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjJSKkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 06:40:13 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDD111F
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 03:40:11 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39J7stF4010740;
        Thu, 19 Oct 2023 10:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KbRvDpbeqLOvxS6ZIIq0KVzpkX8j4IaVci2TPTaMHOo=;
 b=Al1OnbnypEHh3ewL/UTPBGt4T3Xr4kgtWbFq5vee5oIzU/HpyEAZzJcmBNsjs0sd3ITF
 7GmGeBq0KiDBQbTbLeDKsi4G/EwBablvw4/UQTAqkeRiOrPqJuU1yrjlyn8ppEuAek3r
 eRKP47wwZVZSqnohA7oY0vUNFxpbBM96eJJ4BWEJqrjqvaW1P7xPolzYTuSRh5pW9kmy
 MbeSyXqkCa8MHyXyNv+D6wWJs4dhV1wkFwGDsEKn28R0vNlPMOYxdR2+/uZLWyw+EuYu
 ERFjHoXkrGC4tECzC1USx5icVYYPBozE6GmKuNeZnimMzhh//UlQIdTYP+kdSOLQ4g1R IQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tth2f2acs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Oct 2023 10:40:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JAe8Po003721
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Oct 2023 10:40:08 GMT
Received: from [10.110.28.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 03:40:06 -0700
Message-ID: <08cbf1e8-89c7-c0cd-2928-589e624710b1@quicinc.com>
Date:   Thu, 19 Oct 2023 03:40:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH igt 1/2] tools/msm_dp_compliance: Small arg parsing
 cleanup
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@chromium.org>
References: <20211208192216.743364-1-robdclark@gmail.com>
 <20211208192216.743364-2-robdclark@gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211208192216.743364-2-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3PppihBqfcmtgDdwtFVko9qJSEhe3GJP
X-Proofpoint-GUID: 3PppihBqfcmtgDdwtFVko9qJSEhe3GJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_08,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190090
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviving this:

On 12/8/2021 11:22 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Nit: shouldnt the patch prefix be "PATCH i-g-t" ?

We will test this out next week and land this.

> ---
>   tools/msm_dp_compliance.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
> index 5e491c89..a15a8dd9 100644
> --- a/tools/msm_dp_compliance.c
> +++ b/tools/msm_dp_compliance.c
> @@ -629,7 +629,9 @@ static const char optstr[] = "hi";
>   static void __attribute__((noreturn)) usage(char *name, char opt)
>   {
>   	igt_info("usage: %s [-hi]\n", name);
> -	igt_info("\t-i\tdump info\n");
> +	igt_info("\t-h, --help           - print this usage message");
> +	igt_info("\t--help-description   - print test description");
> +	igt_info("\t-i, --info           - dump info\n");
>   	igt_info("\tDefault is to respond to Qd980 tests\n");
>   	exit((opt != 'h') ? -1 : 0);
>   }
> @@ -709,6 +711,7 @@ int main(int argc, char **argv)
>   	struct option long_opts[] = {
>   		{"help-description", 0, 0, HELP_DESCRIPTION},
>   		{"help", 0, 0, 'h'},
> +		{"info", 0, 0, 'i'},
>   	};
>   
>   	enter_exec_path(argv);
