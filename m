Return-Path: <linux-arm-msm+bounces-40172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 638529E327C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 04:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1900B281C3F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 03:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D9E15A848;
	Wed,  4 Dec 2024 03:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jR+Iz3lW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004F814A4E9;
	Wed,  4 Dec 2024 03:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733284656; cv=none; b=gWm3ssz2Mg0ZTjWgohY4ywMXC11PfgNy82gy4mCVm3Ba7bnZPhFqPxFQP4q9CIfhq+AEZJbKgZh1SIjpJDenpG0hs/5W0f8kGPKHogEZPtLS0Eq6uyz+e3LxBZDyoPfh+epYsxaqYSzNWc22Kk3XkiK5OxWYWJ196Uryv2BCiXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733284656; c=relaxed/simple;
	bh=50JEYhQd/y8iB3PYyRtnGuomt+kBbb+KKN0iIpAGBhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dx6TgtxXCgyWkxc0g27aQi1DYkDvsYBuZWcLDwZeTrEmJxggm6dEcvtPiuYIHa+shJl+7W5JXkv7E2xhwv1NmiCKVvhRbRalKTBekmYlJOR1RY9yI5/z/+oy+phafRrPgg6HP/RgBW1Gs9G/T+lfz9ZVl8rGzoWzCXT3WWgtwcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jR+Iz3lW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3I3XvI032011;
	Wed, 4 Dec 2024 03:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EQOZybB3xZXVZBZkQs9rYIlof9+/VTrTvUScM8wwlyo=; b=jR+Iz3lWsY6moAm/
	yCh/zLwSkCAQAMLbpiJKnU+aKIH/N5xjGB/Rf4bH0Zr1117lxAmXaVxOx85ChvED
	DGyj+YMJdem4QShvehONHyCrGtNK0e5Zrw0OhIPZwBm7T1uA6T8+k/OhncpkMoo6
	FEcDrCYu0iLBgMapLzuo4FUpkIv2jYpR2Mf350JSOTgs47nHd1iNPfL/uQaib3OQ
	NHyQcjGrcjigmZz/5J3iYwnnZ0VJUa27XXPnFce7en7/gXyQpEFRRN+IjVXfsk+O
	1F4gJOLX4A9JgBgnD+AEFTVob4J2OOuJMY2l+qYuTX60f2o5y3Wuaaz1bifyzQ9F
	wFvoYA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstj54s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 03:57:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B43vQtE017953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 03:57:26 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 19:57:25 -0800
Message-ID: <2193c915-cdda-416d-8e24-209e808c6d10@quicinc.com>
Date: Tue, 3 Dec 2024 19:57:25 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/dp: add a debugfs node for using tpg
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <20241202-tpg-v1-3-0fd6b518b914@quicinc.com>
 <uv2phgi72mmw5c462ijsqlqedeiv4gahrwi26i2luqkhgwmfxc@ycj7jrujdj6w>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <uv2phgi72mmw5c462ijsqlqedeiv4gahrwi26i2luqkhgwmfxc@ycj7jrujdj6w>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OpvUY6EiqIuSqrYWmzPFh9AHKPkrTCnH
X-Proofpoint-GUID: OpvUY6EiqIuSqrYWmzPFh9AHKPkrTCnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040030



On 12/3/2024 3:38 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 12:42:00PM -0800, Abhinav Kumar wrote:
>> DP test pattern generator is a very useful tool to debug issues
>> where monitor is showing incorrect output as it helps to isolate
>> whether the issue is due to rest of DPU pipeline or in the DP
>> controller itself. Expose a debugfs to use the TPG configuration
>> to help debug DP issues.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_debug.c | 61 +++++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
>>   2 files changed, 63 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
>> index 22fd946ee201..843fe77268f8 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
>> @@ -197,6 +197,65 @@ static const struct file_operations test_active_fops = {
>>   	.write = msm_dp_test_active_write
>>   };
>>   
>> +static ssize_t msm_dp_tpg_write(struct file *file, const char __user *ubuf,
>> +				size_t len, loff_t *offp)
>> +{
>> +	const struct msm_dp_debug_private *debug;
>> +	char *input_buffer;
>> +	int val;
>> +	int status = 0;
>> +	struct msm_dp_panel *dp_panel;
>> +
>> +	debug = ((struct seq_file *)file->private_data)->private;
>> +	dp_panel = debug->panel;
>> +
>> +	input_buffer = memdup_user_nul(ubuf, len);
>> +	if (IS_ERR(input_buffer))
>> +		return PTR_ERR(input_buffer);
>> +
>> +	status = kstrtoint(input_buffer, 10, &val);
>> +	if (status < 0) {
>> +		kfree(input_buffer);
>> +		return status;
>> +	}
>> +
>> +	msm_dp_panel_tpg_config(dp_panel, val);
>> +
>> +	dp_panel->tpg_enabled = val;
> 
> Does this need any kind of locking? The driver performs some actions,
> then we write the global state. What if the user in parallel writes
> different values to the file?
> 

Sure, I can add a lock to struct msm_dp_debug_private and use it to 
protect the tpg_write and tpg_reads.

>> +
>> +	kfree(input_buffer);
>> +
>> +	*offp += len;
>> +	return len;
>> +}
>> +
>> +static int msm_dp_tpg_show(struct seq_file *f, void *data)
>> +{
>> +	struct msm_dp_debug_private *debug = f->private;
>> +	struct msm_dp_panel *dp_panel = debug->panel;
>> +
>> +	if (dp_panel->tpg_enabled)
>> +		seq_puts(f, "1");
>> +	else
>> +		seq_puts(f, "0");
>> +
>> +	return 0;
>> +}
>> +
>> +static int msm_dp_tpg_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, msm_dp_tpg_show, inode->i_private);
>> +}
>> +
>> +static const struct file_operations msm_dp_tpg_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = msm_dp_tpg_open,
>> +	.read = seq_read,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +	.write = msm_dp_tpg_write
>> +};
>> +
>>   int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
>>   		  struct msm_dp_link *link,
>>   		  struct drm_connector *connector,
>> @@ -231,6 +290,8 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
>>   		debugfs_create_file("dp_test_type", 0444,
>>   				    root,
>>   				    debug, &msm_dp_test_type_fops);
>> +
>> +		debugfs_create_file("dp_tpg", 0444, root, debug, &msm_dp_tpg_fops);
> 
> I'd say, skip the dp_ part of the name, everything in that dir is
> DP-related.
> 

Ack.

