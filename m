Return-Path: <linux-arm-msm+bounces-80391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC82C33F73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 06:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 89F6D348668
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 05:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7CD2264B1;
	Wed,  5 Nov 2025 05:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEZiqO6B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R16SCrXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E7518BC3D
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 05:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762319317; cv=none; b=iNr0kN4ptyTlMvPwe3DE4SbWzhrqfPUtvoXD8P+WS0pMX7z5r9CjhS4UcMUM3DJuLI1ZG/eI/0XxpahUlmTRivZ9Aim7Ipnvp4XITWaIqcf4A3QlpGjs5KC/Ud2inX0ejFeX6CLQt1io22onUtfwPNIuNWANzMNBhNUBiLtJlFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762319317; c=relaxed/simple;
	bh=ZLxacbLuQxz/voZj91PU/bqTYS133MHwUUk7V4QIsbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rZjcdCL9gbOEdrGCv3E50XQZcAJUc4Mw0evZl0C11bf+H1OdNeDnCAR3V7lirdNRL0F8gr5ly4VkyaFZ4ykiUaPlr9PapF0HBU5WKh9IIaQisDHHIqOM10+LKR9LHBctB6eBP+2UzWqJEJo6I51ZIF4D7TdNWEFXJpDdfOXdLOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEZiqO6B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R16SCrXe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A53s9pR3913777
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 05:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzLEDQq95zD2/GHSDMakutle0k08PLdJJOX6so/zkoo=; b=IEZiqO6BguiCTMzu
	ZOujd2PNN8do7HXmjmd2v1f2AcGhKUOy7/UaAaBzSMNurZoEmlCdDTV3KFHBjNu4
	y0tqDFpAVZDKAy/sNq/9Ou/En3LxuFDOV9vSurtA9tqACVJEl8cJU9tYTiNpG5Wv
	YOMJz73LvRlg5uPUOfXO/eQ53T7TtJiW3UN1/g4el0/jRxkMcdhEyeaxlBivYe5P
	HtVa++bKrio4Ncv/kb+QM1aAQDjdy2SWYwbTeoD3v0m66fajsBQAP6xPjN2pHsnw
	Xpl5QjaVN3yBr73YECqs6TsBkdf+7U1rCOZk8yryUIIY6I22PZbygbHUzrovr4Vz
	g4GHjg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y3784wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 05:08:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33da1f30fdfso16133287a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 21:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762319314; x=1762924114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzLEDQq95zD2/GHSDMakutle0k08PLdJJOX6so/zkoo=;
        b=R16SCrXex1KBFbDXOc4WINQ9EhuTaQ+CyR2BBDz1bia2X13JqYmZ8rJo2bZT6N4REM
         ghAUXiuszf2VddbgwXufrCgjsMzFbNJ1OKpOmja0dHbNaaoOGuv5fHMUwfbEBqr6ZWjn
         OTZNOBAzE57IVeoaygaWJfZYvEyllS+56RhsShSn8hXBLd3Rug4E1Pxm8orjqQmhmGeV
         QrAejI068rGbuL8Z0/qJXwBTFWgVPb1nVNwXoq2TsZZ0dDSBcSw1xMz5gFVfI8hI5wy3
         yY8VkLYDHSqmQtRlf7iD7e5MGH40gEZCS6gVhKUkuAdSSemqmBnGOmv2KqGp84SP9PHC
         3IMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762319314; x=1762924114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzLEDQq95zD2/GHSDMakutle0k08PLdJJOX6so/zkoo=;
        b=hZDd972x8RscEzVFVMdTVFKUKjntkKH/rvdmnvGPBi6Ya2xa9n8F/hSFBU7KOL7hrf
         fLZeT8i0Uw62QrpvPrbnU49g+8TumvvAvjjQ22CS7G+dTU/D6FjC/qMpuGxoGe13VSLi
         2KQEXtmzhdBGpTFeG+2flL02H+IpXxorttNZfUD7saPfP17wobtU26g08mLb9moTb2Tc
         7s0esbrt34gUmZBMhPacu90pkpEvMvZTV2pBi4KhLPOvXaxu+FumnogVYx918f1ib3Xq
         yEvf+HwzoFRA5vI6UVn+eUBVmDiXNoLf6Aa2R1ITonmJwtl3+m5+WDXAtID6hSp4jlv4
         9T7A==
X-Forwarded-Encrypted: i=1; AJvYcCWehUZB/n6HyhGiyOZqy8LWiXCcBlb4OxIdLilQwnoly16Qn7SeoVWiHQraTUFqRJgX+3HNQeubCFFC3MOk@vger.kernel.org
X-Gm-Message-State: AOJu0YwR43iTUEbHgALAAHF1JmSRjlERCrxd2dvfgdrl0R4AhQ1ebp+L
	SDdwwEw4H9VkJel5iWKd7GqmLJxy4zIZ/IXINhBFiijT3lC9oicAUtZ2D/iXy42JMJp4J6iOOnu
	1UBW6tYyzGpDnTfkusf0MkuoYyKBvzHZV5LkFzbYPJW0+j083m1x7d9XxspOUiFhqJhyn
X-Gm-Gg: ASbGncvqu5b+xcViyH4JPkNeIHa4gvuS1tTRddI8svuNfZAcXyS8V/ArUIZPIF3oV6m
	1bjUhMOyOtDppJBwHznV3TzU0hvxQXuXwPIv/LGfdYfPuE1oEq3z/Gx3CW2nbbgIR6h9L/fH0q+
	fy+vrNAMmZmbntJ4cV9LM3zngFco+yNioFPTkcvsHDBFSFM22BL8nxB4qtx1GseFCpW+yJ1I4zY
	aYpnk1VPxBUUntMrx6zkSOiq+s6wwlw8XZowh2/8Q1uPLObB45AwurWqcqv5EwhwsygbAvmNlmS
	5+W/eFxmQWdOt6IGcVciT2EoeZ6qBoyk3ZOaZvSI2bER6pcA3WtfB2eDLw2Ut3ZroSwpvtwp86u
	xRobDixJbP9VCT1kStcbkQINy8fTYqCY=
X-Received: by 2002:a17:903:2f0d:b0:295:5da6:600c with SMTP id d9443c01a7336-2962ad82c96mr30566185ad.2.1762319314079;
        Tue, 04 Nov 2025 21:08:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlmvWlejzOce9x3PYRY9I6nscXjGyndEIJCdx2Acn0wOKG3S9Y8LppenmzOFA37pWzKim+pg==
X-Received: by 2002:a17:903:2f0d:b0:295:5da6:600c with SMTP id d9443c01a7336-2962ad82c96mr30565765ad.2.1762319313379;
        Tue, 04 Nov 2025 21:08:33 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296019729b5sm45894205ad.10.2025.11.04.21.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 21:08:33 -0800 (PST)
Message-ID: <9164a3fc-5d9c-eeed-2194-68e9b30a3f11@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:38:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: Refine internal buffer reconfiguration logic
 for resolution change
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
References: <fvBCdCb-T9Aph_ehFVcrbBvq0WKOiNeL6BBlMNHABJCm52zzKRfEc5UpSLKfUqgzIYpKyJ1faCTYq111P2LAVg==@protonmail.internalid>
 <20251103-iris-seek-fix-v1-1-6db5f5e17722@oss.qualcomm.com>
 <d6004442-fba0-4896-95e1-04a0c6b1dd7b@kernel.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <d6004442-fba0-4896-95e1-04a0c6b1dd7b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XRZrg6T14Kk-FDjgxeepJW6S0SlstqxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAzNCBTYWx0ZWRfX2l+dkebS4XDM
 x6WL72Dslohd0mxWUsVnBzJ178mjJ043/LrPt92oybt0HiGOhYtX1EUnWVzZhPQGO4KJJ37ez0X
 qCUUD2i+i+a5DNnO04Plft3IPokCLOkrwD5T8Y9yvMoOp5SFywWE3pqahPKJ1Lp7zQsAH3RFFVd
 D4JhXC3mtueO5tyXet5LJh+7R/xj6lBLrphfaKcW5SrfzR5jUnJbWAQkN0vCCZfPgNisavW1+x9
 siKdpU/ruh6pDMGz2eYKa31DdB0mZy+2n4fvowKw4JQTlnJdg/gSdmUwKyqMRCfOFGlgk4VDr7x
 hpnu3TOJjyWMCA0O2d5qwtdN5Ickoq6/M+zIV8DyewM7phM4DdRx/Y9kD9q76b/Escb4xnq6sCd
 T7oBTWYik50e4XPDidoCw5zyruSwBw==
X-Proofpoint-ORIG-GUID: XRZrg6T14Kk-FDjgxeepJW6S0SlstqxP
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690adbd3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=3zkTN5IfQL9Zhd8BRpoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050034



On 11/4/2025 3:47 PM, Bryan O'Donoghue wrote:
> On 03/11/2025 11:05, Dikshita Agarwal wrote:
>> Improve the condition used to determine when input internal buffers need
>> to be reconfigured during streamon on the capture port. Previously, the
>> check relied on the INPUT_PAUSE sub-state, which was also being set
>> during seek operations. This led to input buffers being queued multiple
>> times to the firmware, causing session errors due to duplicate buffer
>> submissions.
>>
>> This change introduces a more accurate check using the FIRST_IPSC and
>> DRC sub-states to ensure that input buffer reconfiguration is triggered
>> only during resolution change scenarios, such as streamoff/on on the
>> capture port. This avoids duplicate buffer queuing during seek
>> operations.
>>
>> Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in
>> dynamic resolution change")
>> Reported-by: Val Packett <val@packett.cool>
>> Closes: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_common.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_common.c
>> b/drivers/media/platform/qcom/iris/iris_common.c
>> index
>> 9fc663bdaf3fc989fe1273b4d4280a87f68de85d..21e176ce49ac2d2d26cf4fc25c1e5bca0abe501f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_common.c
>> @@ -90,13 +90,15 @@ int iris_process_streamon_input(struct iris_inst *inst)
>>
>>   int iris_process_streamon_output(struct iris_inst *inst)
>>   {
>> +    bool drain_active = false, drc_active = false, first_ipsc = false;
>>       const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> -    bool drain_active = false, drc_active = false;
>>       enum iris_inst_sub_state clear_sub_state = 0;
>>       int ret = 0;
>>
>>       iris_scale_power(inst);
>>
>> +    first_ipsc = inst->sub_state & IRIS_INST_SUB_FIRST_IPSC;
>> +
>>       drain_active = inst->sub_state & IRIS_INST_SUB_DRAIN &&
>>           inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
>>
>> @@ -108,7 +110,8 @@ int iris_process_streamon_output(struct iris_inst *inst)
>>       else if (drain_active)
>>           clear_sub_state = IRIS_INST_SUB_DRAIN | IRIS_INST_SUB_DRAIN_LAST;
>>
>> -    if (inst->domain == DECODER && inst->sub_state &
>> IRIS_INST_SUB_INPUT_PAUSE) {
>> +     /* Input internal buffer reconfiguration required incase of
>> resolution change */
>> +    if (first_ipsc || drc_active) {
>>           ret = iris_alloc_and_queue_input_int_bufs(inst);
>>           if (ret)
>>               return ret;
>>
>> ---
>> base-commit: 163917839c0eea3bdfe3620f27f617a55fd76302
>> change-id: 20251103-iris-seek-fix-7a25af22fa52
>>
>> Best regards,
>> -- 
>> Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>
> 
> This is breaking in CI
> 
> https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/commit/3d6c2dff61e37bd36eeb677c061ebcf64945060a

Made a mistake while posting the patch, I will send a v3 with fix.

Thanks,
Dikshita
> 
> ---
> bod

