Return-Path: <linux-arm-msm+bounces-51514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C655A620B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 23:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F10031B63304
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 22:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BEB1C860B;
	Fri, 14 Mar 2025 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K86bMvDD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746BA1547E2
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741992162; cv=none; b=qgRrMgJmT01gthEcC1M0vMQUTF1Ybjqd52tMEq+FvW24VC3Xad1JOp7dFUKAXIlHU+IC8/kvbM0jtdcTKudWDStGn19gqKvjtSqJXcSGf1XFIy57LBSDLT2QBY001h2RkmcMHomnvGa5F36VZoQzceJ9JWJMENhCu74VQG5Ndr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741992162; c=relaxed/simple;
	bh=82coecyezSvgbMXY4DGUcnROgEkGpydTprp+i/sXDLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2lK7OakYN9g4HRxksJzNd3q9M0y6X1nh0L5+e+Ez180BJokcIgoIYkO6PNYNPpmrSmwTf3GfHvt3UAOF5m4MPiQZPtrODOxx55w89pxpqpigK9vT2+viSGVqzZpClQu70GIt65CN1iJO6PMIRSwFkn9MBdZzOrCsv0N2WaPSR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K86bMvDD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ELNUZb027801
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIwDE800oX8SYV9AWJVrX+Iz/rjOe6oMe8ZrMZYcGfc=; b=K86bMvDDz1zXZtfU
	Y1nKZIuYX1m5faULFMakMSkkST3FLllY8Y4nV4vaMG4SWtBQedcbavML+YbgbNH4
	hP3bieS7xbJI3aGFWDUYQS/l+r0NOSU6rBXnOYGlNyeETQWoJ0e6aTJvuHkCgMUH
	qTnMtkbsWAawyAXj8zzW+Qzg6cblYasLc0mzLgmoUVIHsTWZaAcsSHGepzPBApjk
	jCdi8lsCPm1Lc7LySzLwCRCAlASr6+/086ipzmX5twhTOQHEGss/teqfH0AnGPXu
	6DHUM+3DTlg87P0ODM54ceQN33aZeYoH4eAl90rUp8c0I7vwBwC08xY9DOtN1/G3
	JzcDlQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c6733q1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 22:42:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476786e50d9so6695961cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 15:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741992154; x=1742596954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIwDE800oX8SYV9AWJVrX+Iz/rjOe6oMe8ZrMZYcGfc=;
        b=SBiahGloViUoz6vkAi6I/WCATavHNQN1594JSSEGS7FWPxTAjNnK+NjZPR+Vv6m08p
         RKqdye1AmdsnqGMKaxhVr4s+5unt9y2KbzkNF4CHjTTYXpGkECsiyMS7DrqdCQTcdv7X
         LoQ2uxFoA/kkpgkbvsK1DnF5VU4HeQ2clPVky8XmSsXX7eEvzLIgHc5+W9yXYpQjvKO2
         Y4/iYYRZETFvwwk2HNzofo0rXwY3tACLhkCcyYUZrDfpbdiO+w3xUnNFCYd6iQedmVal
         zkZoC3swygVfG/XiXWc5djn53yVzTnwz+2MIVZqgdfGqJaDjYxvMKBsFEbrUw+QvWJzt
         0LFg==
X-Forwarded-Encrypted: i=1; AJvYcCUdRpnF98BJfGV6GNnnUiiiIWB3AymXVGBS2BkV42ahS/nQCgQhU3oobQ7G5xM4vAftAq5Zsug6a0/w4unD@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWL/xT2nT/pU+OZshxM6fiNGHDVQrlUaoE+S0y62/DX6JwOEu
	FRcngaP/gzM45sOHC96DknQ7vBhfmKBA0UdMdLv4h7enwqpDHQTMCNEfye0KXhXj08cAydYeoY6
	ca71TqMsnqhCf0vudXH7b+jlk6Y587XF8v7LlqT+ht0/jzLv88mhm9ed8o5J3fj/r
X-Gm-Gg: ASbGncs041d9C5egrIaKgp0/DoSbg9WhifAuL8AKwbprtS/BCvWWbGT+4e2JsN5jNnY
	2FSqaWTd74DYTGs5kPdRbXEdqRNcGxthXnRVY6JWYfUxe41Ks+zPnCHqf89rewA2Nzz+fudDTyt
	pZbp/wAjTwmH8xyXk0b4iyAu/eiHMjNFYEr5zm8yEXK4KTEeROFXiDnBxpSxTO0mONYeYFFAoyM
	peTGJxbQ5U+n6UxxB9vWNyLsiZmerkWyOzDhJ22bg3Cjwjm5t8gaGA+/QgrI7vXih3KVaFw6t9P
	xq3dcFWc0ckXSXAeKV1+nIeQJDoRqI8I1yb+aqa4mAxzX11K68jyorvLCEYiS9LbunmLdA==
X-Received: by 2002:a05:620a:31a4:b0:7c3:c814:591d with SMTP id af79cd13be357-7c57c795580mr195582085a.1.1741992154030;
        Fri, 14 Mar 2025 15:42:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8g9fIKijnYR1RXDYNW9bZ5XeEGfn0A87clOCpiGK6J3Egz2X0NW4LerMPqQE+/r79PX8g/w==
X-Received: by 2002:a05:620a:31a4:b0:7c3:c814:591d with SMTP id af79cd13be357-7c57c795580mr195580685a.1.1741992153588;
        Fri, 14 Mar 2025 15:42:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a49d33sm284366866b.141.2025.03.14.15.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 15:42:33 -0700 (PDT)
Message-ID: <15ce904b-fd68-447c-aecd-ba7d1d32be0e@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 23:42:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset
 support
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, kishon@kernel.org,
        p.zabel@pengutronix.de, dmitry.baryshkov@linaro.org,
        abel.vesa@linaro.org, quic_qianyu@quicinc.com,
        neil.armstrong@linaro.org, quic_devipriy@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250226103600.1923047-1-quic_wenbyao@quicinc.com>
 <e556e3c9-93ee-494a-be35-9353dc5718e4@quicinc.com> <Z89Ek8Y7TRSgTuMg@vaman>
 <20250314145407.5uuw7ucrdhca4z5i@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314145407.5uuw7ucrdhca4z5i@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d4b0db cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=CgR8CRIgTN9bnSrjgiYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pgHLA_MaRb-gYsA8Yr5tMUfPWJ7n5U-q
X-Proofpoint-ORIG-GUID: pgHLA_MaRb-gYsA8Yr5tMUfPWJ7n5U-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140175

On 3/14/25 3:54 PM, Manivannan Sadhasivam wrote:
> On Tue, Mar 11, 2025 at 01:29:15AM +0530, Vinod Koul wrote:
>> On 10-03-25, 16:58, Wenbin Yao (Consultant) wrote:
>>> On 2/26/2025 6:35 PM, Wenbin Yao wrote:
>>>> The series aims to skip phy register programming and drive PCIe PHY with
>>>> register setting programmed in bootloader by simply toggling no_csr reset,
>>>> which once togglled, PHY hardware will be reset while PHY registers are
>>>> retained.
>>>>
>>>> First, determine whether PHY setting can be skipped by checking
>>>> QPHY_START_CTRL register and the existence of nocsr reset. If it is
>>>> programmed and no_csr reset is supported, do no_csr reset and skip BCR
>>>> reset which will reset entire PHY.
>>>>
>>>> This series also remove has_nocsr_reset flag in qmp_phy_cfg structure and
>>>> decide whether the PHY supports nocsr reset by checking the existence of
>>>> nocsr reset in device tree.
>>>>
>>>> The series are tested on X1E80100-QCP and HDK8550.
>>>>
>>>> The commit messages of this patchset have been modified based on comments
>>>> and suggestions.
>>>>
>>>> Changes in v5:
>>>> - Add a check whether the init sequences are exist if the PHY needs to be
>>>>    initialized to Patch 2/2.
>>>> - Link to v4: https://lore.kernel.org/all/20250220102253.755116-1-quic_wenbyao@quicinc.com/
>>>>
>>>> Changes in v4:
>>>> - Add Philipp's Reviewed-by tag to Patch 1/2.
>>>> - Use PHY instead of phy in comments in Patch 2/2.
>>>> - Use "if (qmp->nocsr_reset)" instead of "if (!qmp->nocsr_reset)" in
>>>>    function qmp_pcie_exit for readability in Patch 2/2.
>>>> - Use goto statements in function qmp_pcie_power_on and qmp_pcie_power_off
>>>>    for readability in Patch 2/2.
>>>> - Refine the comment of why not checking qmp->skip_init when reset PHY in
>>>>    function qmp_pcie_power_off in Patch 2/2.
>>>> - Link to v3: https://lore.kernel.org/all/20250214104539.281846-1-quic_wenbyao@quicinc.com/
>>>>
>>>> Changes in v3:
>>>> - Replace devm_reset_control_get_exclusive with
>>>>    devm_reset_control_get_optional_exclusive when get phy_nocsr reset
>>>>    control in Patch 1/2.
>>>> - Do not ignore -EINVAL when get phy_nocsr reset control in Patch 1/2.
>>>> - Replace phy_initialized with skip_init in struct qmp_pcie in Patch 2/2.
>>>> - Add a comment to why not check qmp->skip_init in function
>>>>    qmp_pcie_power_off in Patch 2/2.
>>>> - Link to v2: https://lore.kernel.org/all/20250211094231.1813558-1-quic_wenbyao@quicinc.com/
>>>>
>>>> Changes in v2:
>>>> - Add Abel's and Manivannan's Reviewed-by tag to Patch 1/2.
>>>> - Refine commit msg of Patch 2/2.
>>>> - Link to v1: https://lore.kernel.org/all/20250121094140.4006801-1-quic_wenbyao@quicinc.com/
>>>>
>>>> Konrad Dybcio (1):
>>>>    phy: qcom: pcie: Determine has_nocsr_reset dynamically
>>>>
>>>> Qiang Yu (1):
>>>>    phy: qcom: qmp-pcie: Add PHY register retention support
>>>>
>>>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 86 +++++++++++++++++-------
>>>>   1 file changed, 63 insertions(+), 23 deletions(-)
>>>>
>>>>
>>>> base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
>>>
>>> Hi, do you have any futher comments?
>>
>> Patches lgtm, It would be great if this was tested by someone as well...
>> Abel, Stephan, Neil can you folks test this and provide T-B
>>
> 
> I tested the previous version and it worked well on X1P40100-CRD. Will give this
> version a go and give my tag.
> 
>> I am also concerned about bootloader assumptions esp if the Qcom boot
>> chain is skipped

If any major part of this boot chain is skipped, much of the platform will
unfortunately not behave as expected by the kernel today, anyway. While I
personally enjoy hacking on such things, holding back hw support because of
theoretical issues is not going to help here, especially since the tables
can be trivially added at a later point, if ever needed, without requiring
DT changes.

> In that case, someone should add the PHY init sequence to the driver. That's why
> I wanted to have the check in place to avoid silently failing PHY
> initialization. Right now, the driver will error out if there is no init
> sequence available.

IIUC we internally settled on not sending the sequences for X1P4, since
the PHYs are initialized as expected.

Konrad

