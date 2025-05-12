Return-Path: <linux-arm-msm+bounces-57613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFECAB3CC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 17:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D90A3A6D91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 15:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341372417EF;
	Mon, 12 May 2025 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BV07Eak1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB9241685
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065331; cv=none; b=MrFUh7seU18zz3ptRMxCADuAxgM55MYYf05gkyyFGcii6jqjGdFfwNYCY+aeme0Qh0l4Z1NGwsWNMnIISP4RBEji/bP6ZsnRIoCnCjoDgK4iX1MDicYszHuQpVXL7MkSaQNo9oFHb5sDeCFSIAHTOamn2a0eon4lJTv5IJmkpN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065331; c=relaxed/simple;
	bh=QqN8dyPRaK023Egme6+n+rlqY6YYhXeNAHM5JjPTwpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6YuFd1q07FPHPT24g0Xg7le9lPdTIuJWMjkjXUqqtraSXzgQktgvzbtuvUlr7AMky5UPM840TzX2tlZo5dg1ZCYAa7fH6ZPFnMS4fZklvCsb/1uOqQrUyJfr5nETGYb7QwB+R+C6L4T7s8JNOHHByX2vIQ4hHZASx0+no7EQlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BV07Eak1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9NZDN027707
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 15:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6E4Yh0Ad0rKvp7JChvNLu4vv
	yu3En+X5pMaxI0jfjRY=; b=BV07Eak1UZa6AjlGxAYdh9VUeA+ziMNNQGxAIWHH
	OBedcQAM51i2LWG7xBffvEZP5U139gYyisFZh8J4fN3XUuCzb4Z3I987fO1aVsK4
	gvXDdx7SHcy8swXLET/TwZ1m2ngleNqawRn0Ius9TEQhoVDL/tzFQvn1okw2mU0j
	txx8M7SjsCifuKuX9iq3lRVmlE7lhexw5auuCfr3VHl4Sb50kje0l9Qc6m/Ndx7m
	RX+OwYjhmGZ+uyRAMLf4i5XuaDDtUHzyuk4g/EhTa6jy1B5z3h61T47Bvkq30bZg
	zQam/bkptzVaadj53Zj49kN7+8Sfh14yNp92zTlSrYsN1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghd35j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 15:55:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee990721so1047040485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 08:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065327; x=1747670127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6E4Yh0Ad0rKvp7JChvNLu4vvyu3En+X5pMaxI0jfjRY=;
        b=QOcFklVPSA4OUyBTw/w0VYh7n7bf+E87oBkXirsBvWMKySK5e+PKEe0ZL4/rzQmYFd
         12Fa6zF1SdphhBz4qx0/0roPDqECFyArAABxIHRxB9ys0U+13rxTe6u5Klh48bA8NoKy
         uwoCkbbI3B7ST4TQHWD2R1PuL6xgYv2P8Q7zYSRaxSccfrmndVo8jmEwUliyuKeNzjUw
         TpZGObVIvQSP0WYj8x4vYHqXi7yF7yAfSVKAzyJYrt8wvKJWyLE+CDLeaSAYEEc0ZZSh
         Wa96H79i1oQ8nKezUSMOz0+x98Y2EiwrFTid/Ype886LKVVmElg/Hh5IDIuBGBpXQkpx
         xFKw==
X-Forwarded-Encrypted: i=1; AJvYcCVxrivAMKyi1xOklUth33ShmqWjHayOrRBRalBBMzWBGDQffATWx4jf/6jVs7+DBJxuFtgnhRcLT5PjnaAs@vger.kernel.org
X-Gm-Message-State: AOJu0YzEoKZvh0kaBY7q+h/BddOenszbEv4z9NV3Ik2Aw17gqFC3GNby
	8SfrKu8ZfCCGfUIQfxglp55IolUKQ8nF838mJ4QP3dbzx1D8DluYjfoAMPFPwHMpG5GmHVw5pR7
	UF7C3MULsAjvqMwEMIDEQs+NFJQfE+GfMCBcDA/sS3lJrZ/gASpn7Ccd4rkNY0PJ/
X-Gm-Gg: ASbGncuX/Aaltm6xRLFm9hnzpEpA0xz5dsmJooKtxBCZwp7zQS/oejZp9kS3BXlTIcN
	IyVHqOkYrbtLvZlIOE0wLi0TBczoXZI+7YPKL3kFJiFIz4JvrAoiDo9FhsF+1t7ovLjJlx2SDfI
	Go9psxdHx6dPi9ULDr0kTYYA/Fbx40alVAC2mjrjp8vhiZopYlTnJQQn1ngjsdP2MmkE/hfwy8q
	BSyQTP//xubVFOhqX0HTuxvBiDctI3G9Y7a+9JHQUJWp5lsS85ieeD1Yzeqoi4YQ3evlEpTLXLc
	jEMCEEc0KWgot+kceZZ1Wxha4+/Vf0Zr9MgUnaDWyLRLmg8gL4G2tCxOjYiSvQ6W0OWwxLG4RsY
	=
X-Received: by 2002:a05:620a:125a:b0:7cd:147:96c2 with SMTP id af79cd13be357-7cd014797b9mr1707288085a.18.1747065326777;
        Mon, 12 May 2025 08:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/zqsVqnMeEhhIgVNklBj/Xs45Lkrd9IJlDu24IM9uupTWjEpGM+U5jrCoQ+foTJDujaQNzA==
X-Received: by 2002:a05:620a:125a:b0:7cd:147:96c2 with SMTP id af79cd13be357-7cd014797b9mr1707283485a.18.1747065326285;
        Mon, 12 May 2025 08:55:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6a25sm1541551e87.125.2025.05.12.08.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:55:25 -0700 (PDT)
Date: Mon, 12 May 2025 18:55:23 +0300
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
Message-ID: <ziko5cxt2cabyu4aimpqhbzcacudfhf3jtp23psobxtjdgi5vg@xcfeush5xlhm>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
 <pzlsbznxpfsbdsxlzvcbdy7wwba4z5hoya7fyoacwjadtpl7y4@qajecdvs3bho>
 <effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com>
X-Proofpoint-GUID: FkFBX4GmLtsvvMkX1P4bubHaZvn67G2b
X-Proofpoint-ORIG-GUID: FkFBX4GmLtsvvMkX1P4bubHaZvn67G2b
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=682219f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=IwuB_wEVgt66hj201foA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE2NCBTYWx0ZWRfXxEiP+gB1XOm4
 Ih+UW+xvk/V/p0sI/MX5Ddc9aZ9e8P8ZHakfa907VonqwrYKc6MAUu+UiH6ZvjLdV8iaJvc4lqn
 q+ta1Fy6hWwpbcaaI9KMk9xoy0sP3ZjPWE6yzQRqjvfP5Z7qzYP8/GiOLdI9SpO5YhUGdIDxfXj
 LODbtePjXTzMcaTf4+2hemPDyJHg1GggdnjOYHa9ltPVhc5+9AiaQJbma9MH6XiUpgCWM5tU63A
 IXyeANsQ8Aq+TL2JtCAUWU38JeupWOjP1uKmCVuKwGaYG7a2Aq5IUgPrkLxXg3h1YvHAcN2cvsi
 B60MPMiPTIq7bqHReuzQI4Z2l6BYrrvzFJ08sr20tfypnyLpQFUfuJN6togo79QlY+tLDQnboJ9
 WispCQlYS07p8beMppkR/dFxsGeYUA/lvRu3UvPAL2rolP2iw7Etv7MWJMfsF0Bp0Xvy7yKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120164

On Mon, May 12, 2025 at 09:25:13AM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/10/2025 1:19 AM, Dmitry Baryshkov wrote:
> > On Fri, May 09, 2025 at 09:12:30AM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
> >>> On 5/9/25 12:20 AM, Alexey Klimov wrote:
> >>>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
> >>>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
> >>>>>> While at this, also add required memory region for fastrpc.
> >>>>>>
> >>>>>> Tested on sm8750-mtp device with adsprpdcd.
> >>>>>>
> >>>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
> >>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >>>>>> ---
> >>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
> >>>>>>  1 file changed, 70 insertions(+)
> >>>>>>
> >>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>>>> index 149d2ed17641..48ee66125a89 100644
> >>>>>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >>>>>> @@ -7,6 +7,7 @@
> >>>>>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
> >>>>>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> >>>>>>  #include <dt-bindings/dma/qcom-gpi.h>
> >>>>>> +#include <dt-bindings/firmware/qcom,scm.h>
> >>>>>>  #include <dt-bindings/interconnect/qcom,icc.h>
> >>>>>>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> >>>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>>>> @@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
> >>>>>>  			reg = <0x0 0xff800000 0x0 0x800000>;
> >>>>>>  			no-map;
> >>>>>>  		};
> >>>>>> +
> >>>>>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> >>>>>> +			compatible = "shared-dma-pool";
> >>>>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> >>>>>> +			alignment = <0x0 0x400000>;
> >>>>>> +			size = <0x0 0xc00000>;
> >>>>>> +			reusable;
> >>>>>> +		};
> >>>>>>  	};
> >>>>>>  
> >>>>>>  	smp2p-adsp {
> >>>>>> @@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
> >>>>>>  						};
> >>>>>>  					};
> >>>>>>  				};
> >>>>>> +
> >>>>>> +				fastrpc {
> >>>>>> +					compatible = "qcom,fastrpc";
> >>>>>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> >>>>>> +					label = "adsp";
> >>>>>> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> >>>>> IIUC the driver only considers this on the sensor DSP
> >>>> Memory region is required for audio protection domain + adsprpdcd as far as I know.
> >>> next-20250508
> >>>
> >>> rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> >>> if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> >>> 	// ...
> >>> }
> >>>
> >>> maybe some driver changes are still pending?
> >> Would like to add some more details here:
> >>
> >> Memory region is required for audio PD for dynamic loading and remote heap memory
> >> requirements. Some initial memory(~2MB) is allocated initially when audio daemon
> >> is getting attached[1] and this memory is added to audio PD memory pool.
> > How is being handled for the audio PD case? Could you please point it
> > out in? Currently, as Konrad pointed out, it is only being used for
> > Sensors domain (unless I miss some obvious usage handled by the core).
> 
> The reserved-memory support was actually first added for audio PD only[1].

Okay, so it uses an API which I missed, excuse me. But then... How does
it work? of_reserved_mem_device_init_by_idx() requires
rmem->ops->device_init() to be present, which is not set for a
reserved-memory nodes without a compat string. However on all two and a
half platforms where I see the ADSP remote heap, it is declared without
extra compat.

> 
> The usage of reserved-memory is audio PD:
> 
> This memory is used by audio PD for it's dynamic loading and remote heap
> requirements as I had mentioned earlier. I'll give more details here:
> When audio PD starts, it expects some initial memory for it's dynamic
> loading and other allocation requirements. To fulfill this, the audio
> daemon allocates[2] some initial memory(~2MB) and moves the ownership to
> the audio specific VMIDs that are configured in DT[3]. Audio PD then uses
> this memory for it's initial operations. If there is any more memory
> needed, audio PD makes a request to allocate memory from HLOS which is
> again allocated from the same region[4] and then the ownership is moved
> to the configured VMIDs[5].
> 
> The sensors domain that you are pointing was an extension of this and as
> pointed earlier, it was added to support SDSP use cases on some old platform
> where there are no dedicated SDSP context banks.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=1ce91d45ba77a4f6bf9209d142d5c89c42cf877a
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1274
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/sa8775p.dtsi#n5334
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1927
> 
> //Ekansh
> 
> >
> >> Additionally, if there is some additional memory requirement from audio PD, the
> >> PD can request for more memory using remote heap request[2]
> >>
> >> The support for SDSP was added sometime back[3] to support SDSP usecases on some old
> >> platform as there were no dedicated context banks for SDSP there. On recent platforms,
> >> context banks are available wherever SDSP is supported. 
> >>
> >> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
> >> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
> >> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a
> >>
> >> //Ekansh
> >>
> >>> Konrad
> >>>
> 

-- 
With best wishes
Dmitry

