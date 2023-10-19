Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88AF07CF586
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Oct 2023 12:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbjJSKnZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Oct 2023 06:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjJSKnY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Oct 2023 06:43:24 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEC8186
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 03:43:22 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JA0Smc007344;
        Thu, 19 Oct 2023 10:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Eg9ZZ/rsVLh1EoPQEIAk41ti/ROREWK6ZZuU5mcePlc=;
 b=lVmk0RS99FddifEp6Yjipmjqnbg0l947IE4N57Kv7CE/g/ICnm5cGutXgBRLg0pyeHkA
 d8mVPoWN34Ym5BJMRXadubV2G0SUpUJZAP9uRFtmBZVBVG7TqC7VzHZ4t6zvYVJ44nsh
 saHniseomD37qh67lQKVHj9ppuDN4JFhNWNnuSgTIxSkAjNx8ki4vwWJIF8cHnS/cvI0
 Qfmevz0j1mTQZwIoM8jS00JyKDjmlzMAEHpwFsG7t8aHX7xpj+ItDISKwLiHSsHeDuQL
 qxgHy+v8kr3u4GELZi+NshROPMO/8o9WLHOmh6XzdKVrWbIJtO+ryjaVuBUaFSZZApBA zA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttfeuajmn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Oct 2023 10:43:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JAhIcu019648
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Oct 2023 10:43:18 GMT
Received: from [10.110.28.170] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 03:43:17 -0700
Message-ID: <9edf8d07-ccec-0326-b742-f39392f4c2f2@quicinc.com>
Date:   Thu, 19 Oct 2023 03:43:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH igt 2/2] tools/msm_dp_compliance: Add arg to specify
 connector name
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@chromium.org>
References: <20211208192216.743364-1-robdclark@gmail.com>
 <20211208192216.743364-3-robdclark@gmail.com>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211208192216.743364-3-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bodvqOzqbf2fIqQ3gk56r0mYA5JOSVU8
X-Proofpoint-GUID: bodvqOzqbf2fIqQ3gk56r0mYA5JOSVU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_08,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

<reviving this>

On 12/8/2021 11:22 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> To support multiple DP connectors, the debugfs files will be moving into
> a per-connector subdirectory in debugfs.  So add an arg to specify the
> appropriate connector name.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Nit: shouldnt the patch prefix be "PATCH i-g-t" ?

We will test this out next week and land this.

> ---
>   tools/msm_dp_compliance.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
> index a15a8dd9..bc79a061 100644
> --- a/tools/msm_dp_compliance.c
> +++ b/tools/msm_dp_compliance.c
> @@ -205,10 +205,15 @@ static FILE *fopenat(int dir, const char *name, const char *mode)
>   	return fdopen(fd, mode);
>   }
>   
> -static void setup_debugfs_files(void)
> +static void setup_debugfs_files(const char *connector_name)
>   {
>   	int dir = igt_debugfs_dir(drm_fd);
>   
> +	if (connector_name) {
> +		dir = openat(dir, connector_name, O_RDONLY);
> +		igt_require(dir >= 0);
> +	}
> +
>   	test_type_fp = fopenat(dir, MSM_DP_TEST_TYPE_FILE, "r");
>   	igt_require(test_type_fp);
>   
> @@ -624,11 +629,12 @@ int update_display(int mode, bool is_compliance_test)
>   	return ret;
>   }
>   
> -static const char optstr[] = "hi";
> +static const char optstr[] = "c:hi";
>   
>   static void __attribute__((noreturn)) usage(char *name, char opt)
>   {
> -	igt_info("usage: %s [-hi]\n", name);
> +	igt_info("usage: %s [-hi] [-c NAME]\n", name);
> +	igt_info("\t-c, --connector=NAME - specify connector name");
>   	igt_info("\t-h, --help           - print this usage message");
>   	igt_info("\t--help-description   - print test description");
>   	igt_info("\t-i, --info           - dump info\n");
> @@ -708,7 +714,9 @@ int main(int argc, char **argv)
>   	GIOChannel *stdinchannel, *testactive_channel;
>   	GMainLoop *mainloop;
>   	bool opt_dump_info = false;
> +	char *opt_connector_name = NULL;
>   	struct option long_opts[] = {
> +		{"connector", 1, 0, 'c'},
>   		{"help-description", 0, 0, HELP_DESCRIPTION},
>   		{"help", 0, 0, 'h'},
>   		{"info", 0, 0, 'i'},
> @@ -718,6 +726,9 @@ int main(int argc, char **argv)
>   
>   	while ((c = getopt_long(argc, argv, optstr, long_opts, NULL)) != -1) {
>   		switch (c) {
> +		case 'c':
> +			opt_connector_name = optarg;
> +			break;
>   		case 'i':
>   			opt_dump_info = true;
>   			break;
> @@ -739,7 +750,7 @@ int main(int argc, char **argv)
>   	drm_fd = drm_open_driver(DRIVER_ANY);
>   
>   	kmstest_set_vt_graphics_mode();
> -	setup_debugfs_files();
> +	setup_debugfs_files(opt_connector_name);
>   	cleanup_test();
>   	if (opt_dump_info) {
>   		dump_info();
