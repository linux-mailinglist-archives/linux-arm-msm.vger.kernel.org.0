Return-Path: <linux-arm-msm+bounces-57488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B498AB1D79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 21:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 192D63B7D48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 19:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F1625E814;
	Fri,  9 May 2025 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+Evd/Ii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257F25E455
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820173; cv=none; b=d08p4dObtB1+AOTlvZRs58mpXAfmx+m8Fw4LrF1wHEp0TF4uBmKxI8+vLojxLy/iAfd/Z9J2qpxAUlvgDl40/WAZ70J30oljpFGqTEIDSYxFBFklq8L8sOiZOTMuB5T3xjaGVUra/daiyVLr4PDJXUON+qRYsmi8ntWZH9wJkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820173; c=relaxed/simple;
	bh=ily75yK8xjS4x174faSzLC0rlvGeHE1RtwEY9NZzTgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6VRym8W/EgOXHlZnuHeLZjq78ehNNPEbds/1hsFj6Xs2g52PFmvQcxeBHxJ/SIMGtvmB0UHI1hTMPBtcvYIEmoFSGHmahNoKJkYRiEWjOUv7ZqMTxtqTurykY3vfjYAWA8dDjGmTGQqnnComHx7NzMwBqmknE0RBc5DuR9Ie3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+Evd/Ii; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Aq2jr025122
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 19:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q6twRJ5MGk2ljnr9shqLaEC/
	wfAfOzln6nkhsqQ2b/w=; b=S+Evd/IifCtsqJ/LX9eE6ot8dXL+KPd1RR9NaKc/
	7Z7/yXASz8+kq8SOyfJbw/oEt6glV1Ut74eIjZysFZ9bAYrhwUAF8179xGt/aKRx
	mUep2gQ8Q1DMGZmNEJ+q6wDOdotVr3XHPY4arBIrBEvKCLZPQJZZ9vGkSyE9KV9I
	ZmZGuB5IjNxADd4lRp40rPi94IApFqNw5UPZZ5i3Kk7sBBO4oPoBZ+epB+0i9J3H
	j1WJxXhidV8qjtzZKDZOwwWgEawm+PtzOP4glz87lcqyXBOBMYG1Ld76BxHzcs2e
	xjxFu/2mi1v6ELigc4dF6hjsTBmtV0uJ/EdPksAsqEgtPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp15s1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 19:49:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso408915585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746820164; x=1747424964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6twRJ5MGk2ljnr9shqLaEC/wfAfOzln6nkhsqQ2b/w=;
        b=m+Wamr/EvVsqax1BCa7Wk687babxGfndqbiSyfUHM6HPktwD9d+68nnE5Shze+mosb
         +5QQ+yul1yIFqCw2GYb0SinprgqHXKCTyidubqibGIHSqJApuoy9Zs8PQ2h8334W9moF
         X75p2d01lXCinYS+pjUExomJd+OtbCUJou9wDN42X6JDF/A7iBk45AYAhaO94Q8/FBUN
         GmD/06/89MpnygrD0LwmRPtXfLGkPR6p8Pqr6W4SzdELC7mlAUyNkUxMKrw5deGA5ROI
         oCMraZJxLGTmNlzK+4xsVQEVXbE26fV+IR6d4nOKxAEr2rKcUrJEOd5i+lOf4GvKJPLe
         KdfA==
X-Forwarded-Encrypted: i=1; AJvYcCXrv2k/a+lPd/kqMMpitSWhFnU1s5jjAO3T2qu/msRe5jvOtWJJ4pIjkkmJ1mj3HaluhrVghuDyHfpcsSOT@vger.kernel.org
X-Gm-Message-State: AOJu0YyK/FIIOTRr866MV2R4lpGiPLjkPIcf1af9syU3Yc+Rm3k1f2Gm
	bFAXpVtq9oNhvVhFxRr9fB0Sgy4oMItC2KHDkmVvMkSCMQ4bUzvs3VC1xaCzeu0nBb+OsPSLUUa
	5KyqKBHZRn9QZKe3TnoKZ7ozXpyru5zRpkKuD6uA1Pni+OZC8T5fsvrP60jFUIeFd
X-Gm-Gg: ASbGnctHPg3dqC6pbytlVQCBdezzIxPfvQFP3raoX8+swJZDcEIF8faxQumyGtGEcTT
	JhWN9qg1S60wjHJb5saGNH/she3d+20oBGdgLijW1rBVGoAfofLZYTSTpG9ay0x4v59Siys5t10
	xpcWXTATztIkRve8RgQMpjgKMG82seRox5ni3gHbfaUDOLHNhiH7kysMjMjSiLEYTFnXhqylErO
	NyLovPUOKTP9kv7CPQxQBDOWl3JZtrcQcTcOEpEvYrvgE+EvCXvaCHBLP3q+rRb8WSRGgmp9nh5
	GNNjKpmIampGX+Ap1VH3xZ0JzoFXiHgu7ixSKJZlHIYLVE4yOFFDmT67W3AVtU1sWlGeMk+TLUU
	=
X-Received: by 2002:a05:620a:440c:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7cd01157d9bmr777999385a.44.1746820163798;
        Fri, 09 May 2025 12:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4SbNZ9mAxpct98JyjHGJQGPpYXjkLoNs4MOsUEaF/4x4x9oUNXOaY2cOSWncyzhmRx3b0Mg==
X-Received: by 2002:a05:620a:440c:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7cd01157d9bmr777996085a.44.1746820163421;
        Fri, 09 May 2025 12:49:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c339a241sm3385071fa.18.2025.05.09.12.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 12:49:22 -0700 (PDT)
Date: Fri, 9 May 2025 22:49:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        quic_ekangupt@quicinc.com, krzysztof.kozlowski@linaro.org,
        "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
Message-ID: <pzlsbznxpfsbdsxlzvcbdy7wwba4z5hoya7fyoacwjadtpl7y4@qajecdvs3bho>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE5OCBTYWx0ZWRfX52ssPun2KX5w
 knV3L7OEphKthEoN6CEl9faiBnT7QnVXA8/bhFPGc/cIU87h2x+wyY2EnjUB1RYqv3jY5e81K9v
 iXErk/IaypDGMLyhvvsZXtW9JR54MGvrJvW1HpaHihJCcJU55mtnkEy8qqATFMV9W0dH7zcHokf
 P31kFFo75Y6g5v4K+IfyvCKcXvaV03bR18UO6KIMojJ8i69nDkEJ1h6P9Qo4sopvluGdF5+dCEV
 /bMge6FOjZuROVkfZojo2AsJ0YRLVhLstcQmh94wfuAjca4enrEdlrKwYoPgf/lTZYIuNbUdMpX
 czLurzSF0cbOxnLV4rOzL5xes9pgoz5gG4/JV0rR0iZP0FgvRfgsdHQKEByYkcMaH97sUM7RXC6
 x9r5qae399BT1aZTzKWkJXfKS2yNuuiyEbrCw3k4YU5H0spWkyXXZmIfM5ZUqvFyYpfux/4k
X-Proofpoint-GUID: RuD3hCIo3f3X3iQTVQmZkTqWTCULbFje
X-Proofpoint-ORIG-GUID: RuD3hCIo3f3X3iQTVQmZkTqWTCULbFje
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681e5c45 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=yetcnpw8gU3TWa0XJlAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090198

On Fri, May 09, 2025 at 09:12:30AM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
> > On 5/9/25 12:20 AM, Alexey Klimov wrote:
> >> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
> >>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
> >>>> While at this, also add required memory region for fastrpc.
> >>>>
> >>>> Tested on sm8750-mtp device with adsprpdcd.
> >>>>
> >>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>> Cc: Srinivas Kandagatla <srini@kernel.org>
> >>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
> >>>>  1 file changed, 70 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>> index 149d2ed17641..48ee66125a89 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>> @@ -7,6 +7,7 @@
> >>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> >>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> >>>>  #include <dt-bindings/dma/qcom-gpi.h>
> >>>> +#include <dt-bindings/firmware/qcom,scm.h>
> >>>>  #include <dt-bindings/interconnect/qcom,icc.h>
> >>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> >>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
> >>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
> >>>>  			no-map;
> >>>>  		};
> >>>> +
> >>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> >>>> +			compatible = "shared-dma-pool";
> >>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> >>>> +			alignment = <0x0 0x400000>;
> >>>> +			size = <0x0 0xc00000>;
> >>>> +			reusable;
> >>>> +		};
> >>>>  	};
> >>>>  
> >>>>  	smp2p-adsp {
> >>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
> >>>>  						};
> >>>>  					};
> >>>>  				};
> >>>> +
> >>>> +				fastrpc {
> >>>> +					compatible = "qcom,fastrpc";
> >>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> >>>> +					label = "adsp";
> >>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> >>> IIUC the driver only considers this on the sensor DSP
> >> Memory region is required for audio protection domain + adsprpdcd as far as I know.
> > next-20250508
> >
> > rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> > if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> > 	// ...
> > }
> >
> > maybe some driver changes are still pending?
> 
> Would like to add some more details here:
> 
> Memory region is required for audio PD for dynamic loading and remote heap memory
> requirements. Some initial memory(~2MB) is allocated initially when audio daemon
> is getting attached[1] and this memory is added to audio PD memory pool.

How is being handled for the audio PD case? Could you please point it
out in? Currently, as Konrad pointed out, it is only being used for
Sensors domain (unless I miss some obvious usage handled by the core).

> 
> Additionally, if there is some additional memory requirement from audio PD, the
> PD can request for more memory using remote heap request[2]
> 
> The support for SDSP was added sometime back[3] to support SDSP usecases on some old
> platform as there were no dedicated context banks for SDSP there. On recent platforms,
> context banks are available wherever SDSP is supported. 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a
> 
> //Ekansh
> 
> >
> > Konrad
> >
> 

-- 
With best wishes
Dmitry

