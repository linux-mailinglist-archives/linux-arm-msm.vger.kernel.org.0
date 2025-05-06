Return-Path: <linux-arm-msm+bounces-56882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3FAAB8A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 08:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A63B07B677A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 06:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065282D1647;
	Tue,  6 May 2025 03:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkpX+czY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77756350DE9
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 01:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746493207; cv=none; b=i9luv0QOSReJZlLTy+76PezLxLaNdH28O+bVd+Gbh28H29GlzV7FTbHCSe50L3ux/bzXFQAR7Ib5lOHBluyj9v7RWGb0WEX8dHUJ960d55VqdWW5641gmJlXRITohfTJIFgwusY2euQ4Veb8v3lMdsyciSOwg+IlWt17ymdjV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746493207; c=relaxed/simple;
	bh=mu+Bs8ufgmYPoMWaa3r4Rn+xjkFBtrCiihgK0Hdki7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jVOwKp1UOGtTi0EcGlbhbSvPCoPP64PhanF9yTGPpqsPnue5XcwiV9qlrqeDN3QMUXPy8FGcngeEeWRQHUuqoOH/F8nNpAQFMRz46z0TqyDinLOOoZWyLN/I93r+DpY3YqaBrxROZjsVe5srHztN0QBkTIHHVbGQhWPqYMATDXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkpX+czY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTbVv016338
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 May 2025 01:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xdv764RLRrGf3SUwbhabEY+EiTd1qUAhXP6mTrPrGoA=; b=HkpX+czYmjPE+Ljl
	Yu7zmZ6gdpcFxonh39cOaEq6Z9KbmHcNxGOEZTM2yrmu244MLQ7ccc4BiGRrRJN3
	YThX+WcL1fk5Gq8rKpnc7/QjsYLn+UKHXz+5NJcRRXXp6Jm9YIxeltquaQEBVwLn
	SLPnSl/Dql1Z+baVnO2QSeWRg/OieWVSCa2wSKYoJDt0JHzfbihjXc/14r/0sKUM
	0KehQDWdIuNLtyzW7ENYRIZxVCnvtPgAOzxUKTHXzdEYrs5WT21gFkyxcbAPrrW7
	oGPVEs9bBDqcc5wiwKud8pR4aiGOGLQhHsLRT6HYWZ88g7MN98Iq4+6J3BmSNXe9
	7bqqGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xsv70u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 01:00:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47983a580dbso5391401cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 18:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746493202; x=1747098002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xdv764RLRrGf3SUwbhabEY+EiTd1qUAhXP6mTrPrGoA=;
        b=Pp93waLR1XixYyo/jNrG0LGXA+Eip3FMSf2EQfrMQHo8o6OWr9AWZYW+llOQdAFPCz
         6Qh/3GY+zTUVX4PW0rBxVfYYXCI8gbp5LRROs1By0LSfV/aKqpJ7jlcC5XXPCUM/jA38
         Aw3HppfpYbE4fRXxJgFht+uUeLuh0vVYlY4H0N45psCReGOXwm7jY5lrC0tSTScdMXAS
         TzUntcai+Obwiu8cV6ZtdOAmIRr/g+w/DFfaQwvjTVovL6tP9zvT6BDLK1QvJJXtYN9p
         a/9PpzAT6BRq3dab4MO7og2/lqnDy/GVtu9ThDiXoYoQnMDTDj0qSq8WuS+i1MzBYiLy
         rISg==
X-Gm-Message-State: AOJu0YxH2Pw7sY9h+DC4dVn6BGaH6/a/AzzgZc7tnRGlSetUIASY5xdW
	8LhSSQ3RozXOqdddjvpARqOzFJ4q7F+eo7cYhpRCg3J77zsk4RAw6k1DvNILK0zyd3WGh/NxI7Z
	MLn849ofrSvXSOKZ9CQOInrc/nKlhzdR3FDTLVMtFaomxcKSOAZ5t6VyMEfZvdsQ6
X-Gm-Gg: ASbGncsmXf/ZkqMuq/s+XxtGwJ0ol29Occbs38JP9PO9lfpXTrXKVfXh96VOShYyznR
	STS6RSX87+QL+QIA/18v6I8v7X12xbNUh9k8/A5qc4L6Li81M+S7qLJlHwG6/Qfq/1PSszBAW3S
	trf2d0k8Y8dYsu25jggKM+4adK2hEKb36blMr17MBOqmUhJiThlsIeAvFl+Arzj1GXM+dGRGRwn
	e8pR189j4FpKep2P1zKB6TqQ0BR0qBlBuLVIwgGc5slFlfJkusYVAzvck5W+4PzOVhUFm47CYFf
	uQ3KKW+N60S/rbiL8jrgvl7d3eN7XE6ZyOxgcQhG+znXmPTOHowDf2qNTbKzTCKWBnA=
X-Received: by 2002:ac8:5d0e:0:b0:47a:ecc3:296c with SMTP id d75a77b69052e-48c2e0916e0mr86864351cf.0.1746493201909;
        Mon, 05 May 2025 18:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2SXWHDRs6cCc/ENSCxWEM4J3053zB5ep3H8W4JdHCVxT6N9A6giFp3tQ2bpDMGbTdjClJzQ==
X-Received: by 2002:ac8:5d0e:0:b0:47a:ecc3:296c with SMTP id d75a77b69052e-48c2e0916e0mr86864211cf.0.1746493201577;
        Mon, 05 May 2025 18:00:01 -0700 (PDT)
Received: from [192.168.65.169] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b8fe52sm6532159a12.55.2025.05.05.17.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 18:00:00 -0700 (PDT)
Message-ID: <31008c59-afed-405a-a330-e42d89a62790@oss.qualcomm.com>
Date: Tue, 6 May 2025 02:59:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: ipq5018: mark XO clock as critical
To: George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
 <1435b068-3bb9-4285-8399-81fc278152c4@oss.qualcomm.com>
 <b05d9351-cc79-4e60-a6e0-de2fe698098f@outlook.com>
 <DS7PR19MB8883995CB86AE2784CAFF8AC9D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883995CB86AE2784CAFF8AC9D8F2@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yPQgx4tiizfV6cDXe5kJgSadcCEo9-zH
X-Proofpoint-ORIG-GUID: yPQgx4tiizfV6cDXe5kJgSadcCEo9-zH
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68195f13 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=NYj23yi3rhxQzrYcNZoA:9 a=93bzvrPoB/MOLOjVLaw53YuoC0c=:19 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDAwNyBTYWx0ZWRfX+3ULxfF7T6/e
 9o7+VkwY7B1/xlPcVW++cG/JiKNE4RsM/46aT+STPDxsfiIiNHpxIi4u1ZiWeDIA8O95NZn46Dn
 ML3kfi4i3CcM4Vug5G7j1ByiSx/JpDCEigA0yRnIpfZI2mmKHxOY87LxjcXRLdgasUK+mJJWnL7
 y7eizn19qJ9B6omP2sNrpg7c2soFSVALwv+EquYIWuObuXMPuDuC6A85gljOYOD5BNhcjeBE4N0
 UlbHdqDtwHaCTPatzsvFcRNUxfs7BvNgm5HuIkvwMDlXN2xRGAJMgB2nwMpfe4IUEdRZW4WG5bp
 YxEObgTyPIZn+tRD68+JlSf/akq6qeSYRRgfW7IH1DrT4WnDJy6FS6Dthj2M9IdPkH4PxAkltNE
 IBuvJH34XRr9pbmP/ftxcmx2LPsAdaGahEDJhPs2MAQOaRCoReLjNYI4AgmNyrFSYoDF1yYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_01,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060007

On 5/4/25 8:59 AM, George Moussalem wrote:
> 
> 
> On 5/2/25 16:45, George Moussalem wrote:
>>
>>
>> On 5/2/25 14:29, Konrad Dybcio wrote:
>>> On 5/2/25 12:15 PM, George Moussalem via B4 Relay wrote:
>>>> From: George Moussalem <george.moussalem@outlook.com>
>>>>
>>>> The XO clock must not be disabled, so let's add the CLK_IS_CRITICAL
>>>> flag to avoid the kernel trying to disable the XO clock (when parenting
>>>> it under the CMN PLL reference clock), else the kernel will panic and
>>>> the following message will appear in the kernel logs:
>>>
>>> Remove the struct definition for this clock (and the assignment in
>>> blah_blah_clks[]) and replace it with:
>>>
>>> qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */
>>
>> understood, thanks for the quick turnaround!
> 
> Tested it, but then then the issue is still there. This time fixable by setting the CLK_IS_CRITICAL flag on gcc_xo_clk_src. I was looking at removing the struct for gcc_xo_clk_src too and use qcom_branch_set_clk_en, but there are clocks that refer to the gcc_xo_clk_src as their parent. I'm a bit hesitant to tinker with the GCC driver without access to the datasheet. The downstream driver actually has the CLK_IS_CRITICAL flag set too on gcc_xo_clk as initially proposed in this patch:
> 
> https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.5/drivers/clk/qcom/gcc-ipq5018.c#L1457
> 
> Are you okay with this suggested approach?

Since turning off XO means the CPU (and nothing else on the soc for that
matter) clock will not tick, just unregister the RCG along with it

you can remove the .parent_hws (dont forget .num_parents along with it)
from the affected clocks, this is effectively cosmetic

Konrad

