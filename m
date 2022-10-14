Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C135FEBB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Oct 2022 11:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiJNJcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Oct 2022 05:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiJNJcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Oct 2022 05:32:17 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C94B40C9;
        Fri, 14 Oct 2022 02:32:12 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E8ihYI029446;
        Fri, 14 Oct 2022 09:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=spYA4AUb7l9yzOjeKzPYUxViZ5yROYnsu6km4MrTs68=;
 b=FOomr44YzhO5e4K4DTRHYH0d3KewgebQLiySx6npL9jff4hes8uPsSs8vGbVTd33s8N2
 Ktv9zr1k/2wMy/k5y/wyTAcTSndpU8RePOFo/dmrVqufDtjiXaWnVrxeBRNQTlPliZm6
 +lsJzePW+qONkl5UvA5NnQA5zjv1Ya4nuW8abHcoWKHtTwQYunwejmkort5B8X6hbFiS
 GjRPvrPH4u8Poctm7RPeBOQ5doXd1RZAR4JjfMTmK9ChabrU87XHAQecOzbrw8rd1KLY
 VR1ZDJOpUKPhIetFVHkxFpWysvMk19ladcobCkpnnQcTN1W8wTT7Ei5y7ppRYQ/MXXeb Lw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k6qpthg4q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Oct 2022 09:31:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29E9Vwpw006650
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Oct 2022 09:31:58 GMT
Received: from [10.253.11.11] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 14 Oct
 2022 02:31:54 -0700
Message-ID: <11530912-36fd-8c69-4beb-de955eaae529@quicinc.com>
Date:   Fri, 14 Oct 2022 17:31:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH v2 06/17] ufs: core: mcq: Configure resource regions
To:     Eddie Huang <eddie.huang@medaitek.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_richardp@quicinc.com>,
        <linux-scsi@vger.kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>
References: <cover.1665017636.git.quic_asutoshd@quicinc.com>
 <271ed77a0ff46390c90fdcde71890d8cec83b8c9.1665017636.git.quic_asutoshd@quicinc.com>
 <5bd645ba24e1dc17343dd8d7b52fe6ea1eb6333d.camel@medaitek.com>
Content-Language: en-US
From:   Can Guo <quic_cang@quicinc.com>
In-Reply-To: <5bd645ba24e1dc17343dd8d7b52fe6ea1eb6333d.camel@medaitek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9kSwDpF3jSIo3B4xvnJtNcTYOSQn6mkW
X-Proofpoint-GUID: 9kSwDpF3jSIo3B4xvnJtNcTYOSQn6mkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_05,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210140054
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Eddie,

On 10/14/2022 5:08 PM, Eddie Huang wrote:
> Hi Asutosh,
>
> On Wed, 2022-10-05 at 18:06 -0700, Asutosh Das wrote:
>> Define the mcq resources and add support to ioremap
>> the resource regions.
>>
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
>> ---
>>   drivers/ufs/core/ufs-mcq.c | 99
>> ++++++++++++++++++++++++++++++++++++++++++++++
>>   include/ufs/ufshcd.h       | 28 +++++++++++++
>>   2 files changed, 127 insertions(+)
>>
>> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
>> index 659398d..7d0a37a 100644
>> --- a/drivers/ufs/core/ufs-mcq.c
>> +++ b/drivers/ufs/core/ufs-mcq.c
>> @@ -18,6 +18,11 @@
>>   #define UFS_MCQ_NUM_DEV_CMD_QUEUES 1
>>   #define UFS_MCQ_MIN_POLL_QUEUES 0
>>   
>> +#define MCQ_QCFGPTR_MASK	GENMASK(7, 0)
>> +#define MCQ_QCFGPTR_UNIT	0x200
>> +#define MCQ_SQATTR_OFFSET(c) \
>> +	((((c) >> 16) & MCQ_QCFGPTR_MASK) * MCQ_QCFGPTR_UNIT)
>> +#define MCQ_QCFG_SIZE	0x40
>>   
>>   static int rw_queue_count_set(const char *val, const struct
>> kernel_param *kp)
>>   {
>> @@ -67,6 +72,97 @@ module_param_cb(poll_queues,
>> &poll_queue_count_ops, &poll_queues, 0644);
>>   MODULE_PARM_DESC(poll_queues,
>>   		 "Number of poll queues used for r/w. Default value is
>> 1");
>>   
>> +/* Resources */
>> +static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
>> +	{.name = "ufs_mem",},
>> +	{.name = "mcq",},
>> +	/* Submission Queue DAO */
>> +	{.name = "mcq_sqd",},
>> +	/* Submission Queue Interrupt Status */
>> +	{.name = "mcq_sqis",},
>> +	/* Completion Queue DAO */
>> +	{.name = "mcq_cqd",},
>> +	/* Completion Queue Interrupt Status */
>> +	{.name = "mcq_cqis",},
>> +	/* MCQ vendor specific */
>> +	{.name = "mcq_vs",},
>> +};
>> +
>> +static int ufshcd_mcq_config_resource(struct ufs_hba *hba)
>> +{
>> +	struct platform_device *pdev = to_platform_device(hba->dev);
>> +	struct ufshcd_res_info *res;
>> +	struct resource *res_mem, *res_mcq;
>> +	int i, ret = 0;
>> +
>> +	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
>> +
>> +	for (i = 0; i < RES_MAX; i++) {
>> +		res = &hba->res[i];
>> +		res->resource = platform_get_resource_byname(pdev,
>> +							     IORESOURCE
>> _MEM,
>> +							     res-
>>> name);
>> +		if (!res->resource) {
>> +			dev_info(hba->dev, "Resource %s not
>> provided\n", res->name);
>> +			if (i == RES_UFS)
>> +				return -ENOMEM;
>> +			continue;
>> +		} else if (i == RES_UFS) {
>> +			res_mem = res->resource;
>> +			res->base = hba->mmio_base;
>> +			continue;
>> +		}
>> +
>> +		res->base = devm_ioremap_resource(hba->dev, res-
>>> resource);
>> +		if (IS_ERR(res->base)) {
>> +			dev_err(hba->dev, "Failed to map res %s,
>> err=%d\n",
>> +					 res->name, (int)PTR_ERR(res-
>>> base));
>> +			res->base = NULL;
>> +			ret = PTR_ERR(res->base);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	/* MCQ resource provided in DT */
>> +	res = &hba->res[RES_MCQ];
>> +	/* Bail if NCQ resource is provided */
>> +	if (res->base)
>> +		goto out;
>> +
>> +	/* Manually allocate MCQ resource from ufs_mem */
>> +	res_mcq = res->resource;
>> +	res_mcq = devm_kzalloc(hba->dev, sizeof(*res_mcq), GFP_KERNEL);
>> +	if (!res_mcq) {
>> +		dev_err(hba->dev, "Failed to allocate MCQ resource\n");
>> +		return ret;
>> +	}
>> +
>> +	res_mcq->start = res_mem->start +
>> +			 MCQ_SQATTR_OFFSET(hba->mcq_capabilities);
>> +	res_mcq->end = res_mcq->start + hba->nr_hw_queues *
>> MCQ_QCFG_SIZE - 1;
>> +	res_mcq->flags = res_mem->flags;
>> +	res_mcq->name = "mcq";
>> +
>> +	ret = insert_resource(&iomem_resource, res_mcq);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to insert MCQ resource,
>> err=%d\n", ret);
>> +		return ret;
>> +	}
>> +
> Mediatek UFS hardware put MCQ SQ head/tail and SQ IS/IE together (SQ0
> head, SQ0 tail, SQ0 IS, SQ0 IE, CQ0 head, CQ0 tail....), which means
> mcq_sqd register range interleave with mcq_sqis. I suggest let vendor
> customize config mcq resource function to fit vendor's register
> assignment

In your case, which is similar to ours, you can just provide the res of 
SQD in DT, then use the

ufshcd_mcq_vops_op_runtime_config() introduced in Patch #8 to configure 
each operation

and runtime pointers like we are doing in ufs_qcom_op_runtime_config(). 
Please let us know

if it is not enough for your case.


Regards,

Can Guo.


>
> Regards,
> Eddie Huang
>
>
