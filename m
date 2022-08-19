Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51C2159A770
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 23:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351760AbiHSVJI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 17:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350874AbiHSVJH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 17:09:07 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 282CCC6EB8
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 14:09:03 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JKZ8IM025553;
        Fri, 19 Aug 2022 21:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Z9T6lIPRRQpvZxFePiE7wTQyCHMkZajXjFOMU5V5KcM=;
 b=mjzFC/3exe2DfVshDTkH5jQJFIr65YhWsoDC4mp0GmSluOEG6ik6roN3QOkio4UUWPjC
 78KCDuBctafw3YdxsQbSJfTNMOSkpJqmo8DNDYXQe/9crhWA6UjlR0W+2bQyMmKw5nNd
 +ue+liiQ/F8DVXWpOwKZP4aPg3cZAYe9dLlgEic3GwSwzA3tynMIuB10ja1gGYCsZCfd
 X/BDTFlN+ZfrXMtA6r6I/yBM3wIb4w411m46iKOYu1coYoiOl49BZJ03dMwgCPV/yLjZ
 h/VClbQhvaa5579ewalCqFxov0ifA3/ZEyPLrTcIrJizb+NfI9sJGyXuxg8o9Iv/d5I6 Kg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1wtcu95n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Aug 2022 21:08:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27JL8t0v026245
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Aug 2022 21:08:55 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 19 Aug
 2022 14:08:54 -0700
Message-ID: <a1ebfbbb-4231-49b2-cf13-8b25a1cd839d@quicinc.com>
Date:   Fri, 19 Aug 2022 15:08:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3] bus: mhi: make mhi_controller_config::event_cfg const
Content-Language: en-US
To:     Jeff Johnson <quic_jjohnson@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>
CC:     <linux-arm-msm@vger.kernel.org>, <mhi@lists.linux.dev>
References: <20220819210230.17773-1-quic_jjohnson@quicinc.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20220819210230.17773-1-quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TjVNFdWxtyl7XA2ebBlhu12x9Gd0-PzF
X-Proofpoint-GUID: TjVNFdWxtyl7XA2ebBlhu12x9Gd0-PzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 malwarescore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190079
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/19/2022 3:02 PM, Jeff Johnson wrote:
> Currently the event_cfg pointer in struct mhi_controller_config is not
> defined as a const pointer. This prevents clients from registering a
> read-only configuration unless they use a typecast. Since the
> event_cfg should not be modified once registered, add the const
> qualifier to event_cfg. This is aligned with the definition of ch_cfg.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---

v3 and no changelog?

>   drivers/bus/mhi/host/pci_generic.c | 14 +++++++-------
>   include/linux/mhi.h                |  2 +-
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 841626727f6b..2470e9f82aeb 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -238,7 +238,7 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
>   };
>   
> -static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> +static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>   	/* first ring is control+data ring */
>   	MHI_EVENT_CONFIG_CTRL(0, 64),
>   	/* DIAG dedicated event ring */
> @@ -305,7 +305,7 @@ static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
>   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>   };
>   
> -static struct mhi_event_config mhi_quectel_em1xx_events[] = {
> +static const struct mhi_event_config mhi_quectel_em1xx_events[] = {
>   	MHI_EVENT_CONFIG_CTRL(0, 128),
>   	MHI_EVENT_CONFIG_DATA(1, 128),
>   	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> @@ -344,7 +344,7 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>   };
>   
> -static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
> +static struct const mhi_event_config mhi_foxconn_sdx55_events[] = {
>   	MHI_EVENT_CONFIG_CTRL(0, 128),
>   	MHI_EVENT_CONFIG_DATA(1, 128),
>   	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> @@ -391,7 +391,7 @@ static const struct mhi_channel_config mhi_mv3x_channels[] = {
>   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
>   };
>   
> -static struct mhi_event_config mhi_mv3x_events[] = {
> +static const struct mhi_event_config mhi_mv3x_events[] = {
>   	MHI_EVENT_CONFIG_CTRL(0, 256),
>   	MHI_EVENT_CONFIG_DATA(1, 256),
>   	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> @@ -438,7 +438,7 @@ static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
>   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 512, 2),
>   };
>   
> -static struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
> +static const struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
>   	/* first ring is control+data and DIAG ring */
>   	MHI_EVENT_CONFIG_CTRL(0, 2048),
>   	/* Hardware channels request dedicated hardware event rings */
> @@ -472,7 +472,7 @@ static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
>   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
>   };
>   
> -static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
> +static const struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
>   	MHI_EVENT_CONFIG_CTRL(0, 128),
>   	MHI_EVENT_CONFIG_HW_DATA(1, 1024, 100),
>   	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
> @@ -511,7 +511,7 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
>   	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>   };
>   
> -static struct mhi_event_config mhi_telit_fn990_events[] = {
> +static const struct mhi_event_config mhi_telit_fn990_events[] = {
>   	MHI_EVENT_CONFIG_CTRL(0, 128),
>   	MHI_EVENT_CONFIG_DATA(1, 128),
>   	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index a5441ad33c74..ada2f18af4d6 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -281,7 +281,7 @@ struct mhi_controller_config {
>   	u32 num_channels;
>   	const struct mhi_channel_config *ch_cfg;
>   	u32 num_events;
> -	struct mhi_event_config *event_cfg;
> +	const struct mhi_event_config *event_cfg;
>   	bool use_bounce_buf;
>   	bool m2_no_db;
>   };

