Return-Path: <linux-arm-msm+bounces-78868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F456C0D128
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7EC504E7704
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 11:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEBF2F7AC7;
	Mon, 27 Oct 2025 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SpVB3hnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446EC2E92D6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761563382; cv=none; b=huVIah95o3pHheLW4zLong3iJQWboRZsYC7OHBB1GziFwr0uBRmOUIfsSnNmOaVlOA63tcMPAOb2MuwHJuYNZthuPdTJEj0oKdvaakMv2Hj6QilLY14QOVA8QqymoGB6c3raFoMXbel02U7ELkQqhs5Ry339g2Vodrot2wXTOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761563382; c=relaxed/simple;
	bh=/xUmcq1ujeoPIHjdvxt3xLv676PUcYJOdGzgL+X0leg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BKWhjixvucHnzScPx83ZgAHUi5bDBaH3kodw38gePJv9LfeWIbM7k4j7mi8DLklU2+WVvC8L4xzG0DGMw17Jph1L6kDmiWcVgeS+uaaYYcAq7GY801S/I0WlRzzMcTK7eloPttdOLckSCP1eWlzjbop8sBn6pjPfxY4hSO/h3fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SpVB3hnW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RA5eOB1502729
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OKEOWHV2jDS8HuQ9OUVVQMf5EtunRWIyG+g+gcxrpY=; b=SpVB3hnWbAeoJ9wZ
	tFc7is5UpBTRfm16Nn1oq21eEX04VqEEkDkbTT3Iyf/r80XbsiykH2sAcPctUP27
	VgrmhKqOTxq8rACgwt29XMf3a4W73v/7RYSNzUrS4lThnQDUm0pS6kHXe77Ge7Yq
	OpidUmIXwu/mlLWrbMWHLy0yXiOqEuG20gD7t5K4Z0dvAlE5Aohb7GoyY7UucXPW
	L3y1f3OF49Qn20vfa7tBw4fofqlCgcCf+OMPggbVnQmCDIcyAkDkmlOerjXetucz
	YNjc1waY60MCzdPjLb/480MCIYB4v5hP2hwqARkeB6yg1d22dehJq8G0gxYhYFrV
	EobTmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a20pns8xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:09:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33baf262850so4166442a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 04:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761563379; x=1762168179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1OKEOWHV2jDS8HuQ9OUVVQMf5EtunRWIyG+g+gcxrpY=;
        b=IQgOnZ1rcuJsCI9qsssJFerEszbtwVNp8H73z2agEHlCIrme6ctC9c+pPFaJfUMKlI
         Hg01L88+CdkI7MaNTrXUhLSAQ93DD/RwZ+1mzIKCU8uc1R6AnqELjnOA2kvFaKL7BY35
         aTHuf3lQ8TtpPVvXBSaLVz/HysDjyvIM/1YsTACyciOWFj4jyy043LjAL3LtDh/nzaGA
         VwQ8oOjGm4OYq9gnOZZ8o42eGZR4XtPkvDkKWZ5B9AMJQFjzmTOAGkke9j1jHTxfBi7E
         SZf7ci5jq5bkYoVGOP11LF5oOd9IRfaQGdY+XlIS4GDS5jNI64Sx+K5MGNUH375TTg9g
         QhLA==
X-Gm-Message-State: AOJu0YzTKb6SxbxLyQ8P1O5SaLDqG39Gs8/g+lFFPjD+X7RSZN+12D7y
	HSDIDHTgDGHGuhUlnSlm42zkNAIMmoY2i6sIOoDQ22QsPGxPjwF3SEQnrjzSw276e4vxANLFH06
	8f2WN1rsJ2vFGk9XMyL3eDiW+ldmwMuVMEd06VoNi41ADygdMy42A3HoFVLg3ulyPO9tP
X-Gm-Gg: ASbGncvdPaDusqSskVw4Sc4y/23r9QZPoGgppS1uYY7pWGsJVCCoX5Mgyq9ANBFm4zf
	fEU59pU/OBP986evlExHoQM7Bi+vXiM4elx8BzsTf4wiYSvH321ExiK1Y0jDO2v4o+uh/dLPlVx
	bp4DppO81qrtlS1qI2hWt4OTExAqH5G+/TXKr3aL3fWrVCgRUdocs99oHXAKFW1vXL+tuD6wxpa
	D798pSFYKWmxwvaNtZrvnGZ4Q4B1DOorX4klK1ClFYdnxSJHOM8fIPlLr+U53ikU1GrcIEw3gsZ
	4ze5srtoushJZ79E/novroIQZwJcfB3M3Iae1dk19/DbXku2eKI3fgtNE3drSqkms5SfOQOnDxQ
	9nzMwo+VRm0Rt4ncoFgC0cwl/4GM=
X-Received: by 2002:a17:90b:2686:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-33bcf919f1fmr50010246a91.35.1761563379207;
        Mon, 27 Oct 2025 04:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkUlEj8/wHcKODqSO/BOEax5NmnIZ4PQBlUjqIzNj2WYmI0MzR8y/WOp5byH5DLvoMAjzatw==
X-Received: by 2002:a17:90b:2686:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-33bcf919f1fmr50010210a91.35.1761563378756;
        Mon, 27 Oct 2025 04:09:38 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f3aeesm8092563a91.14.2025.10.27.04.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:09:38 -0700 (PDT)
Message-ID: <1c52e759-15fd-462b-a9fd-ad620da099f5@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 16:39:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: m31-eusb2: Add runtime pm ops
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251027062458.1411096-1-prashanth.k@oss.qualcomm.com>
 <daf0055b-7caf-4ace-8a06-071468273a37@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <daf0055b-7caf-4ace-8a06-071468273a37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BkZOrREiu_wYgDtgkUFVxDB7NJYuj5He
X-Proofpoint-ORIG-GUID: BkZOrREiu_wYgDtgkUFVxDB7NJYuj5He
X-Authority-Analysis: v=2.4 cv=A+xh/qWG c=1 sm=1 tr=0 ts=68ff52f4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1dOfxVL-wUTtPdxvxmkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEwNCBTYWx0ZWRfXxzC2El0FN0vB
 vf81dlzeeJFIoTTyKiATgHTDKER9v0E7KjICCTizdFrpFQsA4Vc3247Wz8FrZ5AwYC8pWSZi0Ju
 mGX29H5bvUuSlJnM15s0ZCF2hsipNxhVK/eFlSJlFWtCTbofZcu9QwwH+UNUh3jl3Daxga/xCmy
 DHzhO54+y7vn9GRmdIOJ6JF/ICZIe2bh6Ggu2WEgbNiQKsHydsOWYKHx0rRLr8MnGONDW+CTMgf
 06NQX6V+nmi/uO8lCu5i6vRiNXRQYqUVJmUCTRO+qAICGU7ouDiRPNzEXd5yelVJ373KxpPxdZP
 tX1sTk8a/kyF3Ti9Vkhd6IxT/xBDly3fjuUIlutZsPptKEcuYaxtn1LRPq/UMDHwdHdWyZyITGC
 awLTot0CzCy494ViChmsLD3+nHDOUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270104



On 10/27/2025 1:55 PM, Konrad Dybcio wrote:
> On 10/27/25 7:24 AM, Prashanth K wrote:
>> Add runtime power management operation callbacks for M31 EUSB2 PHY.
>> Enable/disable the clocks based on the runtime suspend/resume calls.
>>
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  static int m31eusb2_phy_probe(struct platform_device *pdev)
>>  {
>>  	struct phy_provider *phy_provider;
>> @@ -270,6 +298,17 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>>  		return dev_err_probe(dev, PTR_ERR(phy->clk),
>>  				     "failed to get clk\n");
>>  
>> +	dev_set_drvdata(dev, phy);
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
>> +
>> +	/*
>> +	 * Prevent runtime pm from being ON by default. Users can enable
>> +	 * it using power/control in sysfs.
>> +	 */
>> +	pm_runtime_forbid(dev);
> 
> This screams "this patch is broken" or "there are bad issues" which
> you did not describe at all.
> 
> Konrad

Hi Konrad, I was followed the same sequence from other phy drivers
containing pm_ops. I assume the runtime_forbid is added to control
runtime pm from userspace.

Regards,
Prashanth K

