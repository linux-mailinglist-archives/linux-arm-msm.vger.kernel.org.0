Return-Path: <linux-arm-msm+bounces-52921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67BA7746A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 08:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49A6F188ABCC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 06:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B701DB366;
	Tue,  1 Apr 2025 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FO/F0Zz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650C1131E2D
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 06:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743488291; cv=none; b=QATaLzqEmw05ujTqm4sWOZPZ1t6KD8cd6H30rOYXo+zuwDN000yQCfVrTKsx49dZ1QsXiz75fQUTuvWQFkYptvBrsZzdBTqpzuQdSYubbvUcQpMY8cShCzO32vDK51MxDPhplCjS0pWKi/r4XRJMlG/WYs2xuKAFY8Gu44X18t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743488291; c=relaxed/simple;
	bh=wLHUqe+lLthDZDVKjJwtcMvbh9DlqhBa/XfBvqg+rgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BbxNKWa3IOP5wQ1YZ56NB6OR4sYUfc6PnMgKMGT9u0HiDXF0uAfNTMBvNgtiH6viJSno+y2i5M06CR2exvlKnpdzH/qqElRc+mpGXeTbTQpGGnc+FXtFaST3rcFKwiNY3pfpP0aqnNvXwsphB6XO1XyKHhIdIyNNokkSVajyleQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FO/F0Zz9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFDK0t015653;
	Tue, 1 Apr 2025 06:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8YiC5QweXvJ21pjAzfhhnJfEHJmvQ4E9nx2buOewQo=; b=FO/F0Zz947Sq2yLt
	ieo4Spp5AzuhvTozDIItmTFbkFCL3jpRXemcV5QBu3+4FL2rAEVxOhhwWBEQktTg
	lC1btpe3CoCove8xGblftZIi9V42+HEhBxzeujKPewFeIPTAjMG9J02uSy+cPVvQ
	WPiG/G3JGenofPpd5zJA0MjLRa91KkIj5CQRyTCFoYeevZ6qjWDxn4dvbtKfT1gM
	8fbVpVWQ9mYFYfZ6tf7CJ5qmXXYBIWwBUOQsWAiXE9A+qHzSZ6g2fQi/ODnGnRY9
	uCIj4w+E247EhsCrhI8fP5kUSYXTuT5HlsaGkAsRE8d9NVnd3SYkbOKTtxO5N7CF
	nbJXCA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tverds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 06:18:04 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5316I4X4010395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 06:18:04 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 23:18:02 -0700
Message-ID: <bb733204-ad6d-8487-ba17-b38cd9ea1ac0@quicinc.com>
Date: Tue, 1 Apr 2025 11:47:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Venus probe issues on SM6350 SoC
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67eb851c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=o2zKyf5V5CrEkjwisgsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HMUbT7D0Y8RieIl4n7L2RbdmpciaYcGd
X-Proofpoint-GUID: HMUbT7D0Y8RieIl4n7L2RbdmpciaYcGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1011
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010041

Hi Luca,

On 3/28/2025 8:52 PM, Luca Weiss wrote:
> Hi all, and Vikash and Dikshita,
> 
> Konrad Dybcio was suggesting I write an email here, maybe someone has a
> good idea what I can try.
> 
> I've been working on bringup for SM6350/SM7225 ("lagoon") for the
> Fairphone 4 smartphone but have been stuck on getting Venus working for
> a long time (~January 2022). Essentially, whatever I try probe fails
> with the following error:
> 
> [   41.939451] qcom-venus aa00000.video-codec: non legacy binding
> [   42.162105] qcom-venus aa00000.video-codec: wait for cpu and video core idle fail (-110)
> [   42.167037] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -110
> 
> I've double checked the videocc driver against downstream, the videocc
> GDSCs and their flags, compared dts bits, checked basic driver bits but
> I couldn't find anything to get further than this.
> 
> For driver / compatible, it doesn't seem to matter if I use sm8250 or
> sc7280 compatible or actually the struct I created for sm6350.
> 
> I'll attach the log with some extra debug prints below.
> 
> My git branch for reference: https://github.com/z3ntu/linux/commits/sm6350-6.14.y-wip-venus/
> 
> I didn't try the new Iris driver yet, mostly because as far as I can
> tell, VPU_VERSION_IRIS2_1 is not yet supported there, just IRIS2
> (sm8250) and IRIS3 (sm8550). But I'm also happy to try something there.
The good part if IRIS2_1 configuration have firmware support with gen2 HFIs.
Since you are wiling to give a try, let me or Dikshita share the firmware with
you in a short while, and with that, you can directly try SM6350 with IRIS
driver. Given that we have already validated SC7280 with gen2 (downstream
version of IRIS though), i am quite hopeful that SM6350 can be up with iris.
FYI, iris is having just the h264 decoder at this point with RFC patches posted
for VP9 and H265 decoder.

Regards,
Vikash

> 
> Regards
> Luca
> 
> 
> [   56.572306] qcom-venus aa00000.video-codec: non legacy binding
> [   56.573348] venus_hfi_create:1708
> [   56.573990] venus_probe:450
> [   56.573993] venus_probe:453
> [   56.574000] venus_runtime_resume:649
> [   56.574150] venus_probe:464
> [   56.575453] venus_probe:469
> [   56.575458] venus_probe:474
> [   56.609600] qcom-venus aa00000.video-codec: loaded video firmware! qcom/sm7225/fairphone4/venus.mbn size=5242880, phys=2258632704
> [   56.621821] qcom-venus aa00000.video-codec: venus_boot ok
> [   56.621837] venus_probe:479
> [   56.621935] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.622961] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.623979] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.625002] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.626026] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.627035] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.628045] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.629054] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.630062] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.631070] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.632080] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.633088] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.634096] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.635094] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.636374] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.637532] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.638642] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.639683] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.640723] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=0
> [   56.641757] qcom-venus aa00000.video-codec: venus_boot_core:482 ctrl_status=40000001
> [   56.642789] qcom-venus aa00000.video-codec: VenusLow : venus hw version 6.40.0
> [   56.642801] venus_probe:484
> [   56.643008] venus_probe:489
> [   56.643011] qcom-venus aa00000.video-codec: VenusLow : F/W version: 14:VIDEO.VPU.1.2-00043-PROD-1, major 1, minor 2, revision 43
> [   56.643013] venus_probe:494
> [   57.667128] venus_probe:502
> [   57.667177] venus_runtime_suspend:590
> [   57.718537] venus_runtime_suspend:592
> [   57.718573] qcom-venus aa00000.video-codec: venus_suspend_3xx:1574 DBG
> [   57.718588] qcom-venus aa00000.video-codec: venus_suspend_3xx:1581 DBG
> [   57.718603] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.719144] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.720705] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.722262] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.723117] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.724668] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.726237] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.727129] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.728685] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.730245] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.731157] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.732717] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.734271] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.735163] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.736713] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.738260] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.739130] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.743158] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.744729] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.746293] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.747148] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.753709] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.755146] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.759147] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.760747] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.762338] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.763271] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.767142] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.768722] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.773201] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.774780] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.779133] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.780721] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.782285] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.783163] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.787151] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.788715] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.790282] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.791130] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.796389] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.797973] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.800924] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.802489] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.803128] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.808778] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.810356] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.811134] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.812694] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.814246] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.815188] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.816762] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.818334] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.819151] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.820692] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.822242] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.823110] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.824675] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.826248] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.827117] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.828704] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.830334] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.831149] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.832798] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.834389] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.835171] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.836729] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.838272] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.839147] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.840703] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.842284] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.843147] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.844784] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.846427] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.847117] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.848668] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.850239] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.851131] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.852694] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.854249] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.855178] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.856731] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.858286] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.859211] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.860792] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.862382] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.863310] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.864863] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.866408] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.867122] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.868663] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.868683] qcom-venus aa00000.video-codec: venus_cpu_and_video_core_idle:1535 cpu_status=0 (OK 0) ctrl_status=1 (OK 0)
> [   57.868690] qcom-venus aa00000.video-codec: wait for cpu and video core idle fail (-110)
> [   57.868699] venus_probe:505 ret=-110
> [   57.873495] venus_hfi_destroy:1690
> [   57.873519] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -110
> 

