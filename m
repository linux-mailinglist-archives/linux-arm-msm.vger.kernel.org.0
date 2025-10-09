Return-Path: <linux-arm-msm+bounces-76533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3CBC766C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 07:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 406141898C60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 05:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6080922576E;
	Thu,  9 Oct 2025 05:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9xw5nlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D887E23816C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 05:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759986743; cv=none; b=U7K9XTV6paxobzsgNBo4OTIrUmVvjikXT44aOHgTa4xzlZ/B7kPodgyXP9kUEKFPbxvBJvRdGUuUEGhqgG3D9v4aGQqLTkgFG+eDhRjX1j0du1kvjRfOWylAhV52ehNLTJnqTwWrFg6Z3CoUaxHnH2t4WbSok8Ls2PotPDHUv3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759986743; c=relaxed/simple;
	bh=k41Lfe5Dcn96f8gUJJ8sMLMPw6rwlMYlfzmlMxfn/64=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=P8fXH9GrmbJsUQ7xv3LjVMra/MXyxRuVeZWs3Ers40j3YB0GPo97fCUTCNVEkTUD80qZBkduMIMnoPmAJaegbTY95VnIZQYXcgRHADQbhZzS6E3lPwyh/nB65Wp1X8jbs3xiYz995bngfq0SCW5wwF4pXRtH6YVhHmY05aFqcrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9xw5nlr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5dAJ020913
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 05:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SpRCq5hxTIkMivPd9aj2d6SWJ/aa5OSoLIzqlFyOuX0=; b=j9xw5nlrS7w7Peha
	Yjcm2jg037QSz9Cdz0NkxcMdurxV8l15WkI2DLoINmJGBMqrJjuq1YeoZ8O1P8QC
	0YRkAQpo952xXGUVxcObNzFZOjcAnegJGWKaKD5NhGD+nR2wOiEXPvgSFxURvsn/
	dvnxrqAa6CnaOpzDy3lXVbEvxxRTDxVTnfUqCqYbVRr3o5F+/lpmQgpBd6yS93N4
	gOm/EDRRgXYZ4H6K15GO/1xbdjxQkyQfQDt1yxM7xHaDxq7anvIjs6LC/ZKXG7t9
	w3AEiDEeNa7emQrQTo32KO4DL9cN/iQVSX87scf/cALw1E+SImvvRAijYLHml9Oj
	Za5rmw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4khhxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 05:12:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269af520712so10168165ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 22:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759986740; x=1760591540;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SpRCq5hxTIkMivPd9aj2d6SWJ/aa5OSoLIzqlFyOuX0=;
        b=i10xLAaKwt11+NXZah0Z4a3uVOidkmsL2Wk6j11uWq7Fsxo0l0/eBkRRhW/rcj7AR+
         DXdHXHotzSBJn1x1TcSeWBgq87H+nx6TGTSro9JzfJxF1aiF5aZvsUT1umKnyFv5FM9E
         9prvsrL5Veu5no3Q1E12vPgKp6hPN9rhvz6a7WaL2udUEvXbZeLnd/0vv+0+fOPATH0B
         Sbg/OAGWggxstuVyDHFpf4zkRmkcmxxh2SYkz3E1+5clf070Dh8MqLSDFVgvia2bpzJu
         WZxPnVAu+5co54ju2T7FRXhMYlXqRIQi9kfDnTiqmYH+B4KpMxfSiv4uH31d2M3rLdGA
         MLvA==
X-Gm-Message-State: AOJu0YzPafPQ9iydONjfpVL/te8r5W0+lwoOBUScdzP3YvrSh6xcuRuP
	tRbHsCJX1/12Gr9dFVY5ZA9r5c55/A+p3HiRAYSKfBX2zB/VXq0PlM22CVrWeBWvGVHZdEneJVv
	2qjro+QvE+HZwu+NnmHm/Mp0+R1C7xEN4WLkhKE/OGDKUVnVEjH/pDjrTjLczu/Xi0obM
X-Gm-Gg: ASbGncthN4pf7+mJ2WCLzpL+LcmiGHPDW/7HFMj/DH3awrxhbrqARRt7Dkz3FU58ast
	zdrgViB35Zx9mYXLIzzrmvt/1US1MInG3jMUEcJDGzXq77+99xjBaQkhJuXRjMpkDmpvon3OwuZ
	9wx2zjcirS/KDCsw3rELW3sIFH/i7nURu6GihEutnKX96U95bwCgMqKKulwgDHVQBvWxwHzdc5k
	P2A0DJjyuqK60XnoWHGP6n34yEdzKEgOgIcdEKlO0VpL67HQ0YWVYFiirDItscy2gHJvOxdKbmT
	P5OF7AC0Zrttk4UX19E7YUiOK2PdzcDrBkEVcgF+hSBQxMM6K0vhH7n4tB+lnTDXJTyuqOz44Q=
	=
X-Received: by 2002:a17:902:e952:b0:262:4878:9dff with SMTP id d9443c01a7336-290273567a8mr83058975ad.12.1759986739928;
        Wed, 08 Oct 2025 22:12:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHoy6wYSRGBBV1JSmS3QPASPTJ1tUJOiLp062epi1A7qQiWfVzluYaEiSDgNYaPZafLI0kcg==
X-Received: by 2002:a17:902:e952:b0:262:4878:9dff with SMTP id d9443c01a7336-290273567a8mr83058595ad.12.1759986739410;
        Wed, 08 Oct 2025 22:12:19 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6c7bsm14950135ad.3.2025.10.08.22.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 22:12:19 -0700 (PDT)
Message-ID: <8465759d-8d50-48c6-b5e9-26e08045304c@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 10:42:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/24] arm64: dts: qcom: glymur: Add display clock
 controller device
From: Taniya Das <taniya.das@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-22-24b601bbecc0@oss.qualcomm.com>
 <3c886104-937f-4d2e-ade0-fd525d56dabc@oss.qualcomm.com>
 <a0a70337-6474-4568-9006-dda66371fe7e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a0a70337-6474-4568-9006-dda66371fe7e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e74435 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Rl_jRUjo-d1ZQ1p_6G4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: eQOv_EvLb_uyrTR3uq9Dnqy_ATezLCml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX8oTYEpTnIziY
 Lk+lBCYTqWEj2GDKW/LjnCHtQtzk0QmkkffnieZKJzuAEaK0FIajK9b/Kh62xDIWQPUSRUGIZ9O
 Yzxm1VZhz+fbOaWoDrNkrkMn653oAboQ2+7w2BDekYiXohgOn1HfQ/vjP2j9ynk9mTNU5hCUxW5
 K6mVEkbXDDZFaVwE6MYbZMFLoaCUboaybWKcXfhAQThEsqMN1PX29jgaq1DZfFvn/DiIvXVpjLG
 cDl6TnASMgl7sGT2/ByDN29cfZrB/8OM2MkLQJzndoK4F0ubZ3E/uLDdAtUIOJzDiBJ8b8yjXB0
 SLU8tbjqyROdZf6mJggt/KGnYff8KXvJt8q9SwouhL9HOVQW+Dic6AGM93dmxIQ6yC+URRNKwte
 Jt1r23ah5MqRehrds1LPd8ZfIcfXpw==
X-Proofpoint-ORIG-GUID: eQOv_EvLb_uyrTR3uq9Dnqy_ATezLCml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121



On 9/29/2025 9:24 AM, Taniya Das wrote:
> 
> 
> On 9/25/2025 4:03 PM, Konrad Dybcio wrote:
>> On 9/25/25 8:32 AM, Pankaj Patil wrote:
>>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>>
>>> Support the display clock controller for GLYMUR SoC.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +		dispcc: clock-controller@af00000 {
>>> +			compatible = "qcom,glymur-dispcc";
>>> +			reg = <0 0x0af00000 0 0x20000>;
>>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <&sleep_clk>,
>>> +				 <0>, /* dp0 */
>>> +				 <0>,
>>> +				 <0>, /* dp1 */
>>> +				 <0>,
>>> +				 <0>, /* dp2 */
>>> +				 <0>,
>>> +				 <0>, /* dp3 */
>>> +				 <0>,
>>> +				 <0>, /* dsi0 */
>>> +				 <0>,
>>> +				 <0>, /* dsi1 */
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>;
>>> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>> +			required-opps = <&rpmhpd_opp_turbo>;
> 
> The SVS level didn't work when Abel tried out. I will check with Abel again.
> 

Abel offline confirmed LOW SVS level worked for him and I will update
the level to use "rpmhpd_opp_low_svs".

>>
>> Really odd!
>>
>> Konrad
> 

-- 
Thanks,
Taniya Das


