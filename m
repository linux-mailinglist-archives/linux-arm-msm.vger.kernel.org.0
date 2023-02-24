Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7C846A2260
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 20:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjBXThB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 14:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjBXThA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 14:37:00 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EA16BF74;
        Fri, 24 Feb 2023 11:36:59 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31OI8UdU021536;
        Fri, 24 Feb 2023 19:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=acp1T5j6afCwX9uS+mO6XABK0UgALgiXC0Lx+JN6FQ0=;
 b=l944EgRZWGAJBHH8e5haQQ46oYTkvP357CQ4zbGpVxDbMq/TiX4sPJyN8VlC7K1dRlxR
 YXn5pW96PQl/a4w7+Z5ldeltv8Iqu/nGlkowbKU73zLzVl/dn/dte9IdHQcnEdz3VzuW
 sJThJ8+Gx8Oha+Z7JbM8K3blWwyTLBJT9m0QuidoddfknmarMwZCUHSglTnPkQmyQW9+
 fPymNmKJQjT5rMoYWdK/Rh0pCP+gAridcw4Cnf3qOLtTMk4GPJT2MszhcCveLqfjQBi6
 VGIqlFCwdHPOdYMH2XZrV7T5exJvXX9iYXo1aTJgFQAYkjVyKR6/g9I8fbY2pPE3rzWc UA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwy9a5qj0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 19:36:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OJaruk002102
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 24 Feb 2023 19:36:53 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 11:36:52 -0800
Message-ID: <00914fa9-8618-a3ef-d3c5-2a3bba68fa1f@quicinc.com>
Date:   Fri, 24 Feb 2023 12:36:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/8] accel/qaic: Add datapath
Content-Language: en-US
To:     Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
CC:     <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>,
        <jacek.lawrynowicz@linux.intel.com>, <quic_pkanojiy@quicinc.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-6-git-send-email-quic_jhugo@quicinc.com>
 <20230224152546.GB3547587@linux.intel.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230224152546.GB3547587@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I84sMu4JGSPO-p1Vdmwm2sQTCC6l9vSd
X-Proofpoint-ORIG-GUID: I84sMu4JGSPO-p1Vdmwm2sQTCC6l9vSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240155
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/24/2023 8:25 AM, Stanislaw Gruszka wrote:
> On Mon, Feb 06, 2023 at 08:41:42AM -0700, Jeffrey Hugo wrote:
>> +#define SEM_VAL_MASK	GENMASK_ULL(11, 0)
>> +#define SEM_INDEX_MASK	GENMASK_ULL(4, 0)
>> +#define BULK_XFER	BIT(3)
>> +#define GEN_COMPLETION	BIT(4)
>> +#define INBOUND_XFER	1
>> +#define OUTBOUND_XFER	2
>> +#define REQHP_OFF	0x0 /* we read this */
>> +#define REQTP_OFF	0x4 /* we write this */
>> +#define RSPHP_OFF	0x8 /* we write this */
>> +#define RSPTP_OFF	0xc /* we read this */
>> +
>> +#define ENCODE_SEM(val, index, sync, cmd, flags)			\
>> +			((val) |					\
>> +			(index) << 16 |					\
>> +			(sync) << 22 |					\
>> +			(cmd) << 24 |					\
>> +			((cmd) ? BIT(31) : 0) |				\
>> +			(((flags) & SEM_INSYNCFENCE) ? BIT(30) : 0) |	\
>> +			(((flags) & SEM_OUTSYNCFENCE) ? BIT(29) : 0))
> 
> This could be probably better coded using FIELD_PREP()
> with integrated checks of passed values not exceed
> field width.

Interesting idea.  Will have a look.

> 
>> +struct dbc_req { /* everything must be little endian encoded */
> 
> This comment does not provide much value IMHO ...

With the LE types, this does seem to be redundant now.  Will remove.

> 
>> +inline int get_dbc_req_elem_size(void)
>> +{
>> +	return sizeof(struct dbc_req);
>> +}
>> +
>> +inline int get_dbc_rsp_elem_size(void)
>> +{
>> +	return sizeof(struct dbc_rsp);
>> +}
> 
> .. as those those inliners, instead of using sizeof() directly.
> Up to you to change.

Will review these.

> 
>> +static int reserve_pages(unsigned long start_pfn, unsigned long nr_pages,
>> +			 bool reserve)
>> +{
>> +	unsigned long pfn;
>> +	unsigned long end_pfn = start_pfn + nr_pages;
>> +	struct page *page;
>> +
>> +	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
>> +		if (!pfn_valid(pfn))
>> +			return -EINVAL;
>> +		page =  pfn_to_page(pfn);
>> +		if (reserve)
>> +			SetPageReserved(page);
>> +		else
>> +			ClearPageReserved(page);
> 
> It is needed? Looks like taken from some legacy code.

Required for remap_pfn_range().

>> +static int copy_sgt(struct qaic_device *qdev, struct sg_table **sgt_out,
>> +		    struct sg_table *sgt_in, u64 size, u64 offset)
>> +{
>> +	int total_len, len, nents, offf = 0, offl = 0;
>> +	struct scatterlist *sg, *sgn, *sgf, *sgl;
>> +	struct sg_table *sgt;
>> +	int ret, j;
>> +
>> +	/* find out number of relevant nents needed for this mem */
>> +	total_len = 0;
>> +	sgf = NULL;
>> +	sgl = NULL;
>> +	nents = 0;
>> +
>> +	size = size ? size : PAGE_SIZE;
>> +	for (sg = sgt_in->sgl; sg; sg = sg_next(sg)) {
>> +		len = sg_dma_len(sg);
>> +
>> +		if (!len)
>> +			continue;
>> +		if (offset >= total_len && offset < total_len + len) {
>> +			sgf = sg;
>> +			offf = offset - total_len;
>> +		}
>> +		if (sgf)
>> +			nents++;
>> +		if (offset + size >= total_len &&
>> +		    offset + size <= total_len + len) {
>> +			sgl = sg;
>> +			offl = offset + size - total_len;
>> +			break;
>> +		}
>> +		total_len += len;
>> +	}
>> +
>> +	if (!sgf || !sgl) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>> +	if (!sgt) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
>> +	if (ret)
>> +		goto free_sgt;
>> +
>> +	/* copy relevant sg node and fix page and length */
>> +	sgn = sgf;
>> +	for_each_sgtable_sg(sgt, sg, j) {
>> +		memcpy(sg, sgn, sizeof(*sg));
>> +		if (sgn == sgf) {
>> +			sg_dma_address(sg) += offf;
>> +			sg_dma_len(sg) -= offf;
>> +			sg_set_page(sg, sg_page(sgn),
>> +				    sg_dma_len(sg), offf);
>> +		} else {
>> +			offf = 0;
>> +		}
>> +		if (sgn == sgl) {
>> +			sg_dma_len(sg) = offl - offf;
>> +			sg_set_page(sg, sg_page(sgn),
>> +				    offl - offf, offf);
>> +			sg_mark_end(sg);
>> +			break;
>> +		}
>> +		sgn = sg_next(sgn);
>> +	}
> 
> Why not use sg_copy_table() ? Overall copy_sgt() seems to be something
> that could be replaced by generic helper or at least simplify.

I don't see "sg_copy_table" defined in 6.2.  Are you suggesting renaming 
this function?  I guess I'm not quite understanding your comment here. 
Can you elaborate?
