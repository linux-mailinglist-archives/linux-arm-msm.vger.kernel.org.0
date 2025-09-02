Return-Path: <linux-arm-msm+bounces-71592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4208B40084
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A82FB5E7865
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4671C2874E9;
	Tue,  2 Sep 2025 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7kUuleN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1589285C88
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815769; cv=none; b=kRubYDpCz/TdlmbCgB/Sr4LGkFKYnDeSCFA2ZGzFfvM8OTv+hk/y+6Hjw7ltZ9SBS7Q1ggabqYBdKTqN8WQWO6MtVd02vzQEmD0SENKdDSrr9Bkg8lkLHiJUrxDO5vWCTcNm3MNTbB/g2imM1vNxp47Mr/N5oqQpg7JA0g+bB7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815769; c=relaxed/simple;
	bh=F/DRPIY1JzJfASVH0+5DxM8yvCWWP9vValqVHMMfJH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kf/vCMB5NDN8SsaQgNF23vV636D9vMwby1pEU7fpInx/JvDo8u6DKL60muocr/7ZhHQFlOVpwSbdhC2dZAaK9Lw6kVrlD5GjueVDxYN9h7D8tv70r6CrAYI1w0vc8mtxt8Q/FGxMfBXBYi+/IxZ2TrsV0FpyxdIN/GcXfuEN9yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7kUuleN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BBvYc032344
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyYC2IjjKnN8kVstgOeFh0U7UpsX/qMCfNZKVjJEVk0=; b=B7kUuleNTjCbambg
	E6+nJnpWkiq6RCKODUO9LoHekh6orQI0Ewip79L+QK1sniuw55Lx7NJ6Hk53Y3nJ
	j5nNfwX++wWRIC3io5BIriM23tjh9o4j1Fa6iJcgZZoGC4gkKIPeyJu0L7eJzFTF
	9V6E/6jLyHatrmSQa6sTI2QhYiFiiP2hYqBgbnVXuH3ZQc0PihSSFSuJW6oYOpHI
	7NsQdD9r768db/QbaEuCK7u76sIgHhAyljt09LcTO0t1UyuhIIVsSZjCzZTyOfzc
	YQsZPsKa+iGjCVWmmlirsYjN+OU8hQvgYhR/RP+7VT1ugWCk4Pa46LxL0kAXE9lN
	7a3RUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8qq7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:22:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3349c2c5dso24613701cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815766; x=1757420566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyYC2IjjKnN8kVstgOeFh0U7UpsX/qMCfNZKVjJEVk0=;
        b=JBMkrRZkvkax50msLrQb/2fqoK0WMfybfNBCM3dH6bHmlJpTirDy9ErQ7v1zNyjri5
         Cnz2ftL1qijiyyf4wHYtijL6yR3kaJad+exbVw/luHpzKV5JKUWVCObh5XMdoIpo3FUu
         O1iicuo7ZcEIVFbGAPPkgecOlHEvhKyS/441II0t1d5SHSXeluTR6shBbMxze/flXkIs
         H45iUwl1yM6PF88g2wKxHu4IspYXYjIICdgMnTavms9dY+2Ro5R40kspkCggzUoKzpCS
         BA8XhriblAUeh1MPjtwNnWzWl1WzP2eHOJ63Nb0d2u5TkoaxfZARWYeYlPmo4ziC/1No
         /oOw==
X-Forwarded-Encrypted: i=1; AJvYcCXAqobY7sR/EE92tG+3Avy6jGwZ8bSpGhPsqkl9QHoovYK1tpBYEhhkc5amOswS+E2+vjwX44teK9JPxO/y@vger.kernel.org
X-Gm-Message-State: AOJu0YxcyWr9i82DRE7tSuOvVdtd6IZFCITAmzsIHiYP68NAE0+4E3V0
	6MXAa3/zVr0ihguF0rr45XA9NNyQPIvc7tt0sKgXw8cGbSSxjvbPeSgwl/QSUvgSI4rhy08mcaV
	g81RL8VErsm9WWnxT7ryl35Uh4/vkCnVg2oRyFIueKE9+xhiv0OieG5U2ggmLNM147rrD
X-Gm-Gg: ASbGncsHBCF2BYG5pVyPb1+NfZckg0ggBcdQCOKpCalLAnggoEoF3k5mRij7kIKVjCB
	fDEbtjPhldLJmyii2IxjgmgJlCoJhFBmoWLtPbkFRpMISm806cniYqARjv/xW8pgEoEeSW03dEO
	17lri1aJb0BAZe9VXHhB2wUeDCIGwpdy4YO6y0xKsojqxzUSGykHJ+oZIvCO1RH0k+W8HAjguJu
	AURLyLhahzNOMEMCA2Yn8MNnJbuXUgMe8K5EUxLbMmRv+tONE23QFuDdxcBKnf43Zyn4E3WGhBk
	e4dfTdyjjy5FPPVuQjgWQ8Zk50EaWB1lb7UOonGPwxwI/YI1NJ3vX5GBlIZGnMBo44E=
X-Received: by 2002:ac8:584b:0:b0:4b3:e5b:cdd0 with SMTP id d75a77b69052e-4b31dd84920mr117886101cf.79.1756815765356;
        Tue, 02 Sep 2025 05:22:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAh8031gbB5vrQHflTsJQ50ZJLtuJxT6ch2hi1H6NNi5Ygg7c2bWKWQ1gJUJqXwKchmELMmA==
X-Received: by 2002:ac8:584b:0:b0:4b3:e5b:cdd0 with SMTP id d75a77b69052e-4b31dd84920mr117885681cf.79.1756815764723;
        Tue, 02 Sep 2025 05:22:44 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e7efb79sm197449345e9.9.2025.09.02.05.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:22:44 -0700 (PDT)
Message-ID: <5bd88696-476e-4a80-ae89-35580203d13f@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 13:22:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soundwire: qcom: remove unused rd_fifo_depth
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250901195037.47156-3-srinivas.kandagatla@oss.qualcomm.com>
 <bd11cb82-d8ad-40bf-8bed-82f9e8710117@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <bd11cb82-d8ad-40bf-8bed-82f9e8710117@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: En6T3ABbQC9CDUhRj8ySGlPOB83N1PdL
X-Proofpoint-GUID: En6T3ABbQC9CDUhRj8ySGlPOB83N1PdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX2KAiMBWDVvXg
 PlkVDRtV89veqKYenGjAixwLbXn4RMbHkyshzBv4k3XoiFnjX4yaCkPmxAor51GxHc6Pz3YXyuy
 ag7tYsa3e3rAmK1W5N9KDTc0kCTAxMkMITtLsnzQQyj1lLr4wHMyjshjf6cwfJdSPblwVebOwzZ
 3Vd0c2/qGBfXKOOLVHuAVB13rjGmUvHWvnf1opu4okcs+cDoIzhJ0Rnfnt7ybCFJ86pbBqW0ij/
 xyGv8r2rOJqywZE7JW2YHG55PTH0dMv7jfEWI9pZMbBTlbkUAcr+BXKaV08mNHrpB+vxTy1G1CN
 MmyJJ9VPqdS6CHBhWMpl6oPNwwM/5s1VkYX7kUCUPc6bn5sogyM72upY9JQdbxHfFiqydLcF4sF
 AbWABS/P
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6e196 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1ucdiQ-pe5FtM2g45dAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 9/2/25 11:01 AM, Konrad Dybcio wrote:
> On 9/1/25 9:50 PM, Srinivas Kandagatla wrote:
>> remove read fifo depth field parsing logic, as rd_fifo_depth is never
>> used in the driver, cleaning this up would benefit when adding new
>> version support.
> 
> The last sentence is mildly confusing> 
Will update this.
--srini
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/soundwire/qcom.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index bd2b293b44f2..7f19ebba6137 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -209,7 +209,6 @@ struct qcom_swrm_ctrl {
>>  	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
>>  	u32 slave_status;
>>  	u32 wr_fifo_depth;
>> -	u32 rd_fifo_depth;
>>  	bool clock_stop_not_supported;
>>  };
>>  
>> @@ -898,7 +897,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>  	swrm_wait_for_frame_gen_enabled(ctrl);
>>  	ctrl->slave_status = 0;
>>  	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
>> -	ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
>> +
> 
> But my grep confirms this remains unused
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


