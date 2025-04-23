Return-Path: <linux-arm-msm+bounces-55068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDA9A98007
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33E3D189EECC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 07:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F3F1E1E1E;
	Wed, 23 Apr 2025 07:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HPpFHJbs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F59428F1;
	Wed, 23 Apr 2025 07:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745391909; cv=none; b=lFdpkStHvd96mFkP29i+65T+E3NRacJWgVWSkoc2gGn7XtFf8j1WH6Pb8SIriIuHAsnln7cw+YJrkGgqCJ9UMNSz+tpNDxi/U6zcoiXtd0QsP6wwF6pdyFzLip/7nG6IgUViS8786bzheqt7m/vtLjBW3vzarpNAZggTL2lPeA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745391909; c=relaxed/simple;
	bh=D+P7ur/vwKX0dY6+j01f0h5JOwkYmjANaOOZHqX3JiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pjZwCUHwe27U6UrleDrRSGLU7OFDWpMGK5DkFkz+vquQI+XjW/N1Z+j1zTxb44xpkVToq9aaEpPCVXcIcSjw3FdbDgZlQV0onmwP9c5vTjzVovqXFRqPtnbFYMXF382XPWfdoyif9fE66GS1tDKb5m8vQG5EgS/F6LM9wQarEAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HPpFHJbs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iLmg022331;
	Wed, 23 Apr 2025 07:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DXs+2X22CNIfmNCVhg97ldAwTjAoi/RHfs7pocm68rY=; b=HPpFHJbssP7T5kYH
	BNxsx8ElUHeCg7E62rJt1P52xqRL1fOs1txhXZGRK3K9voYk5BZnkJBCpafq7F/9
	8LB/aIhFnATHzf3AUjEWwqdrO4WtAD2bh7OEkCS1yQju2REvk1s+oo0x/pUQPaNy
	QFk6hK1NEVWslrzOMrN5kdBK7BEvhR+KVq7SrFc4LonLqkqKB3vga5AOCJGra+ya
	evLm+J6hRnBvmrgt9AsKQ2uEJnaL9CgVi1Eb1P37KV+FgX10lqVsMs5mYKBc+1vN
	o5HJhUo4iokMBDSEvBGHu9sRChKo1A2brmEXUdyms17PbA7zKLl4rWOMmQ/SPN+f
	mm07CA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1164v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 07:04:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N74cSZ016287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 07:04:38 GMT
Received: from [10.110.52.190] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 00:04:37 -0700
Message-ID: <c75d2cc2-e7f7-4de4-8d3d-81c3cf8ff973@quicinc.com>
Date: Wed, 23 Apr 2025 00:04:36 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/14] introduce kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>
CC: <linux-doc@vger.kernel.org>, <corbet@lwn.net>, <tglx@linutronix.de>,
        <mingo@redhat.com>, <rostedt@goodmis.org>, <john.ogness@linutronix.de>,
        <senozhatsky@chromium.org>, <pmladek@suse.com>, <peterz@infradead.org>,
        <mojha@qti.qualcomm.com>, <linux-arm-kernel@lists.infradead.org>,
        <vincent.guittot@linaro.org>, <konradybcio@kernel.org>,
        <dietmar.eggemann@arm.com>, <juri.lelli@redhat.com>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Content-Language: en-US
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WG7qYevMhuvSAnvTpD6mvm3ky2sWWyNl
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68089107 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=oZ8wWTcPSBrqPQfBPqMA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WG7qYevMhuvSAnvTpD6mvm3ky2sWWyNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0NiBTYWx0ZWRfX0TwZpL0SAicz oF4+evXSmwb+4LqxonlhNM/2Pc0LZLhrfKbOUZFe88P71mC4iyFnITKZSulYzUwJEld+jDIUeUJ THtFecDN/No+OXk5RiG7AMgR7aNDRbupscYOxnQFxR+pyrX78qy5u/XmRy9s91zgoZT2TDYQdBF
 cZliSTsNqg4xWCq4u1o8jwcLDjR4mSpVn5PP5AP5R1UN/28ARiNsdBIAsyrPddyzH/ExDx2ZUNZ 5BN3OMmJGm6jyzFJHngqIl47sD8q67ovCjvzvqCGDKxwd8m+tUeHBOeSh+vzh44JrwaorO7Kc4z /t4jFPSm0x1f7Ag98UOGqE/8Nnli8QfvFmjxTgYQGSH6pKORYcFnNFLcrKPK7o5rZZ2MTdw3YQl
 +lXeRaEf2NtKnxdn5XNByYsixOSYMx+r8rtcqhxFn45H5ewVVMm1lu0RtzO6BPpvPf221yJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=797 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230046

On 4/22/2025 4:31 AM, Eugen Hristev wrote:
> kmemdump is a mechanism which allows the kernel to mark specific memory
> areas for dumping or specific backend usage.
> Once regions are marked, kmemdump keeps an internal list with the regions
> and registers them in the backend.
> Further, depending on the backend driver, these regions can be dumped using
> firmware or different hardware block.
> Regions being marked beforehand, when the system is up and running, there
> is no need nor dependency on a panic handler, or a working kernel that can
> dump the debug information.
> The kmemdump approach works when pstore, kdump, or another mechanism do not.
> Pstore relies on persistent storage, a dedicated RAM area or flash, which
> has the disadvantage of having the memory reserved all the time, or another
> specific non volatile memory. Some devices cannot keep the RAM contents on
> reboot so ramoops does not work. Some devices do not allow kexec to run
> another kernel to debug the crashed one.
> For such devices, that have another mechanism to help debugging, like
> firmware, kmemdump is a viable solution.
> 
> kmemdump can create a core image, similar with /proc/vmcore, with only
> the registered regions included. This can be loaded into crash tool/gdb and
> analyzed.
> To have this working, specific information from the kernel is registered,
> and this is done at kmemdump init time, no need for the kmemdump user to
> do anything.
> 
> The implementation is based on the initial Pstore/directly mapped zones
> published as an RFC here:
> https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/
> 
> The back-end implementation for qcom_smem is based on the minidump
> patch series and driver written by Mukesh Ojha, thanks:
> https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/
> 
> I appreciate the feedback on this series, I know it is a longshot, and there
> is a lot to improve, but I hope I am on the right track.


Is there any way to demonstrate this framework on non-Qualcomm device? Like any
other ARM device from TI, NXP etc; x86/RISC-V based device is also fine.

-- 
---Trilok Soni

