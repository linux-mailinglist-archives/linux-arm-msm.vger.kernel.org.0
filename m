Return-Path: <linux-arm-msm+bounces-63960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5CAFC1E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAF4916D9DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 05:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F5B1C5F14;
	Tue,  8 Jul 2025 05:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MavYJLDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB07F13B5AE
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 05:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751951253; cv=none; b=hv0TU38DQxVlafDWiNJauxOhswDAQkMue2rqyPl+DHyThzyXSxgbHPfwtHYBKQnydSU4ay3AXQCm98bqsnigF61RamF4s1gyrNJP99aySB/rzWcE+XYJEC/DfnEQjijBqvHFbcyoLfLBv5PRzg3E7iya3gASCKhkU6TSLyNOecQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751951253; c=relaxed/simple;
	bh=UgFjbcye84s+KDcBxlDJ9AeJpfDrvjuDp/d8vKxVNuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/8oPdeAfpNgynDepAMA565aniJGHqGzWl8jcw7fBOZNj7l8aS0Qk5CMKzzoW2eh9QgR4AaGlJLEcfYC05QRZ2S2A0ivSk1XN4+HmIRf/6i6b8ykUJGQcN2YgUb+scj5r9EU74D8LFWwnUcToYkUlnVtKFAseM7J53tvHmjzslU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MavYJLDw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5683X2pZ013964
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 05:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XONfzPCD67UozhiardL/SFpSzSG3TM0b5mJZo5/Keg=; b=MavYJLDwxR7t1eyE
	T5Vmkizacqxy9rbiEEYz6cqbK5frFVBcOVMhtpS+x/vwktwVzdokJn4XDMM+UpsV
	3rrAu8tV9WGY1WYBOJgwpi6FXF9No3i/b+wTH+FVHwUSLW5plSs6fIxNmVXLeo7Y
	4L1dYtypdETRtqMxUlqPCe1STc6WBEGZGZG7qJBoCfT9uiHPiCacxzDc3QyX3uqX
	E5L2xGe0ybfIYk7nm3wGoBlsctG1fNWrbgicaLdZhs8goHk4hI679jvHft+cJHXX
	eInznVAY2rQkMGL6lK5jAmiVnD+LKRCWh5peSVrhluSGbtCAVSAOEiDkkbJ1hboM
	8Cj+mw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0ra6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:07:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74d12fa4619so1427579b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 22:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751951250; x=1752556050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XONfzPCD67UozhiardL/SFpSzSG3TM0b5mJZo5/Keg=;
        b=cbADb7AW+gRP1ZLEZd0mGzOl1TRbsdADMWlIc+uzVIldAtkjH0BoAManWPTp8erKYz
         P+TKODgQOzr4W0IoavAnRu8s0VPSWnUVdqQYbiG75EnDhW9oo+Gq6qkOh6kVJqfDnM0k
         SHvqBvxq7TZ4zoSoJxwzd9EE5HtVJKAXWtR0uO1SkWo7lNqCGE1KXmwQ18bWecXqonV/
         3+7sSsMOEYc4KMmNGF/Lz1T6y3L56Geo5u/fl9kANY028uhfYJKyDY7iBB+QXtvBTPMD
         vtiAWl7lbxIGIoC1PHp8Ikh698tB+mPduv7cLI0tz2l2XUqEi8cRrGAZ77NxpMgvgrsh
         2jbw==
X-Gm-Message-State: AOJu0YzE+cWXATOrSnfIMXi18bOZC/Z9lvdkoHzZr8J/dbemfI9B5oj1
	iw6KbhDL1JzpehyXHHAxFN/v+wbxLuB2o4G/U41hKec8C5j994iLIG689XVWlXQnG7hcviF1fgu
	NmFXzfpAVxPElh3Q5cI1yEcJExB79EuLWe4jWlpmONjAlivoOCaTCbJkeu/iGbLY8OJIj
X-Gm-Gg: ASbGncsnro3ucqA0/Mxv4AESQNkIkkyZuzD79oVc+QSOpFrUEd1mmZdFxQVolV2O9Nh
	FyP6IX4hsnKY5LFYRt4oZ3ghyviatZKKsrVxr+VhAmu3IxpgClnrU3AY4RJKt+CrZthMEW8/4p7
	4mcwUbchYHstQeu4CF/Dg8tVX/FHoBh5cPdz5JY1jYc1XxrMV1BVdWAguQzrHTynyrCHHwv6gxg
	SoYu3OBAiAVplmgvQLFXA8FMnJ2w3TuoiJkx4l8SLinhRNzeRpEXo11Z3sKIqs5ghqBgguLsRTn
	e4dbgTf/gFBiWffc9Ht05JBctd1EzUkyfcOBxKnIKS+Y/1U=
X-Received: by 2002:a05:6a00:b51:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-74d2440978emr2677181b3a.20.1751951250024;
        Mon, 07 Jul 2025 22:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqHblQbGysxGleH5Wnt20GWtcNUMnVHNG6vTxl/JLNS6asi+Y/ohVURvo0gQGzmU7xlQZehw==
X-Received: by 2002:a05:6a00:b51:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-74d2440978emr2677150b3a.20.1751951249567;
        Mon, 07 Jul 2025 22:07:29 -0700 (PDT)
Received: from [10.217.199.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35d0014sm10576104b3a.67.2025.07.07.22.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 22:07:29 -0700 (PDT)
Message-ID: <10b11ae8-b375-40a6-88d5-3796902299e3@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 10:37:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: rpmh: Add support to read back resource
 settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
 <20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com>
 <c4947591-4d09-4f49-8458-b993b5f95a2a@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <c4947591-4d09-4f49-8458-b993b5f95a2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686ca792 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Xk3zx4k8AspjBMzuXmQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAzOCBTYWx0ZWRfX3bR8DyJvvuWM
 tDfGXr4Gij9qHzw5+GWEhoJW14hxuesTMthS7kAxxMyqP+Q/XLVXhy0iSs7bi5CE+RNYLIAmOgR
 HhrGz+5rYQZAGEKqEtr2eNAx2BVqd2nJkHkf0rZzScZ7Zr/YPHmCUjxtgl9I+VIvu8G0hHxZjh3
 svtFzD/DYjDyOnfpkgStfd5XW3lueKBwb3DRfjuLW/Oer7HS0qEbU9MzaEy3AMAcGd2Y3kNs7ym
 p3Fsl5j5+rHZB+aEKsQ80P8100WpBfzobyfnEWOhrdu/V38apr28r49SEyVEPsWZ8fE0ydzYFV9
 YkakbohL6yxqro/J2Uz6Q7HEfZsh9V32kxPoQjcF2fNYSK4aXv4x2QANjM5c6uuJdufNPZvMhOr
 vvPAuBEGZuC/SC29i3SkOaXyVMlo2WPvKhf7CYpFIOaDZApIY9Qnkq378AibXnvpaMF1w7ow
X-Proofpoint-GUID: DQh4QJyxlcTXmjiWB2bYNSzq_nQeJNq-
X-Proofpoint-ORIG-GUID: DQh4QJyxlcTXmjiWB2bYNSzq_nQeJNq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080038



On 6/24/2025 8:14 PM, Konrad Dybcio wrote:
> On 6/23/25 6:43 PM, Kamal Wadhwa wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> All rpmh_*() APIs so far have supported placing votes for various
>> resource settings but the H/W also have option to read resource
>> settings.
>>
>> This change adds a new rpmh_read() API to allow clients
>> to read back resource setting from H/W. This will be useful for
>> clients like regulators, which currently don't have a way to know
>> the settings applied during bootloader stage.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  	u32 msgid;
>> -	u32 cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
>> +	u32 cmd_msgid = CMD_MSGID_LEN;
>>  	u32 cmd_enable = 0;
>>  	struct tcs_cmd *cmd;
>>  	int i, j;
>>  
>>  	/* Convert all commands to RR when the request has wait_for_compl set */
>>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
>> +	cmd_msgid |= (!msg->is_read) ? CMD_MSGID_WRITE : 0;
> 
> if (!msg->is_read)
> 	cmd_msgid |= CMD_MSGID_WRITE
> 
> looks more human-readable

I will update in v2.

> 
> [...]
> 
>> +/**
>> + * rpmh_read: Read a resource value
>> + *
>> + * @dev: The device making the request
>> + * @state: Must be Active state
>> + * @cmd: The payload having address of resource to read
>> + * @n: The number of elements in @cmd, must be single command
>> + *
>> + * Reads the value for the resource address given in tcs_cmd->addr
>> + * and returns the tcs_cmd->data filled with same.
>> + *
>> + * May sleep. Do not call from atomic contexts.
>> + *
>> + * Return:
>> + * * 0			- Success
>> + * * -Error             - Error code
> 
> This isn't valid kerneldoc

I will update in v2.

> 
>> + */
>> +int rpmh_read(const struct device *dev, enum rpmh_state state, struct tcs_cmd *cmd, u32 n)
>> +{
>> +	int ret;
>> +	DECLARE_COMPLETION_ONSTACK(compl);
>> +	DEFINE_RPMH_MSG_ONSTACK(dev, state, &compl, rpm_msg);
> 
> A reverse-Christmas-tree sorting would be nice here

I will update in v2 per reverse-Christmas-tree sorting.

> 
>> +
>> +	if (n != 1 || state != RPMH_ACTIVE_ONLY_STATE)
> 
> if n must be one, why is it a parameter?

I will Remove n (which is always 1) and also the state (which is also always RPMH_ACTIVE_ONLY_STATE) from the parameters.

Thanks,
Maulik

> 
> Konrad

