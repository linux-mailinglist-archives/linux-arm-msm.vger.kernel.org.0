Return-Path: <linux-arm-msm+bounces-70547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED27B335D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 07:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06C0178E8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 05:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8AD279DA1;
	Mon, 25 Aug 2025 05:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXdeTOYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C1C274B54
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 05:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756100439; cv=none; b=JYiIkl0yyzfn6Wr/piVX2kqp6y7aPkuIn9UOGkvmI/gei9YRu05vD77x9rl/jP3g2kqBUYZzUxFPYD/vk1H6DOuEb2E8Y+t6nLsEt1vQvkKaU42OO6M+ts8taj/Tun7Z54pB4mDdYTuTR9E+1Ex+IUYzIfCGfxmJDuyki6hJ8Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756100439; c=relaxed/simple;
	bh=GWJkno7UH1EmP0ghaeExjRxfS6IMqGgi2ZFXNxROOgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p931mQ870QM3GVoMuXsnxAwWA6BhtoPDnLzIN3LqmIkO59Opvt3FlDOI+ACWAFmQCtLVWWUKeUP2mS07rwgRwydxb6hu3d+VvrnU9RKimCujnHRRuO2WUcBWKA6aZJ46V56meFAObH+YrEISWxwTO65ouK8hPCrPjCCWr4BH9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXdeTOYP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OJt2hb004446
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 05:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8a+TtvwZG10ZUAyJp5QPl4t7/OgCTRNElkzgAj0FVsA=; b=WXdeTOYPq2nMdvno
	pdMQ/ShNbNshVifZRInAm5XNVFrRXvdc43NXspfjU5/MKx964zbcXs9zq4Ajx/wT
	F0xUXNt5rRoEO1Q9Ip7NGJo9YWCWqf0mnUkOUXmsYf0NHVCFVfZK/06hkp8Agmp5
	LUX8QUgGatpmyUxfijXwZkbP853pdP3u1v4qp0Y39u/aM3lUunum8uRctjHYg+Nr
	CNhvgzQIXYT8B7t2q7zQMHZfMEddQpgFFffYxNHiF5TD+aF6lb3WLN8Wuz3rnOLI
	GR3mojXR0V6hZqx8Ll7yC5+n9wUvT+CT5x6YDm7lHRYRq2dlK4L6/46DY1XOnbz6
	wSuO/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdutfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 05:40:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32515e8e4b3so2746049a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 22:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756100434; x=1756705234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8a+TtvwZG10ZUAyJp5QPl4t7/OgCTRNElkzgAj0FVsA=;
        b=dGzmARrdTHN/2kPe+CbWzky4nhl9udN/dsSefSSyI/M5gkfhbubkEAR98T6m9fJIjt
         7EafipuhMpOlnBCMXufC5B8wPeVkBITDfPPdpA01KCeuJUHDlsk3zX2ktBlTD4Vx7x8P
         wrhxqM2B38eHLV5XfSu5XGPn0SkFpDht+PhyCqU98BNJ3mKyV3OKWIelP+uVW1ZGxhHx
         ddrvUqejfXtjLxU3so85hkhi2EyyrKahCscTinSnvLuyrQo+VpylYbqpk0VRnf8c+fGq
         EZPDbzc0uHycHCCYWz11vrjojq6zqLPLNUI2AWHMQf8cqf93VEqaaGqgN5nSwrguWPgd
         Qc7Q==
X-Gm-Message-State: AOJu0Yzv3MXr+fWL9uC0WHMNECO9QBQMGv2JQhdmYSNOP0m4RId05N6X
	ZeUo084GMviwbPU2Z9jvywQTFD3yLMtAuyC+qow7ratHY46v+DdpVx0rfm3djStyRxADSRSLNcO
	qgOVJNfTbUrrej+cqwhm1x8XELp9umlqJmiEqJZ14YAZORWu+Dm98wxMEI7KbuTcj33TV
X-Gm-Gg: ASbGncuxfmr0swFMizGRcvVQBvgBKQQk5b2vLzo2ZDs9KKLTWaa/CHG29hQ9cx02t7I
	3HSLOC8m33JfEQRAf/p4KBjTwkJ0aWuS/xAvu3avM+qHLQuhSd0nlHhft+rKuiNpzeDCRLd72XB
	tngjPb30GKKkvDNZkfyxgWvzymPzUScUgdkmKcZb0lTUFk8w2Co9IC/D/pmVD/6p2P6rlOs3mKd
	KTeYF+AEoxRJtwEQ8H8MBn9YYmrx2rW4K75qSr1Iy9IJk5timODjJ0H1uvg6V9jC7zyCltF5p/l
	IUYnKqix76LMS1qZui3fQaqkPY9Xu5xxZyaUP5yEGyHHDTAM63lSmFJ65BwCSWPQ1rjrtgkWhw=
	=
X-Received: by 2002:a17:90b:1b4c:b0:324:e6d7:6daa with SMTP id 98e67ed59e1d1-32515e0ed9bmr14080784a91.0.1756100433693;
        Sun, 24 Aug 2025 22:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhgaMin5seYJHkfrlytGzFCnZxybYHYMcFaVpDKc9LsysyD3YbO70n6HcNcaQfiZnvmdMbVw==
X-Received: by 2002:a17:90b:1b4c:b0:324:e6d7:6daa with SMTP id 98e67ed59e1d1-32515e0ed9bmr14080743a91.0.1756100433067;
        Sun, 24 Aug 2025 22:40:33 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa6e27esm5847724a91.25.2025.08.24.22.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 22:40:32 -0700 (PDT)
Message-ID: <d121952e-4662-4651-9398-3a5446a2281c@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:10:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] usb: xhci: plat: Facilitate using autosuspend for
 xhci plat devices
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250812055542.1588528-4-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qZuVbbTFHSrFC3wQqnNptdvy56PN6zXZ
X-Proofpoint-ORIG-GUID: qZuVbbTFHSrFC3wQqnNptdvy56PN6zXZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwQH7TtupV3Xq
 puni7z6QjtmyrNyahGiJ41txF8m5aYsQu3BDQExyFcp6J+ruFytmhHCm6yFFNXn4HU34/8ZaDhH
 cxhYPeVvgMik1U2rXymIOS4Il4BGLzZ86AI3bhldmZk3qbKfgqHs8eMJYWUnbqDIyGgt8m4ePkg
 hA12PrmshE0qG3N4fYB0+/1tZ1Dgh/Xh3kFbjORuKV+O/GDLyA8rJ8qSIXNTCk/Djyb64Zp254g
 9yxZvSXgYklRK/hS5mxIwW2ecqD9EfgPPvaZWWAx7YCVUTtFqAvvJ6SF8Vb7rF2l6avPvDVrXN7
 632Gj2jUwSPLBu02thydkPDXMhFBtUPfQVpdu5IZ86/5xZ2j+ef/JNcatk46BXsjnAG0Rtrh2ze
 aJMiYvvm
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68abf753 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=nnkCm9v0YjVGcTDIYNYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033



On 8/12/2025 11:25 AM, Krishna Kurapati wrote:
> Allow autosuspend to be used by xhci plat device. For Qualcomm SoCs,
> when in host mode, it is intended that the controller goes to suspend
> state to save power and wait for interrupts from connected peripheral
> to wake it up. This is particularly used in cases where a HID or Audio
> device is connected. In such scenarios, the usb controller can enter
> auto suspend and resume action after getting interrupts from the
> connected device.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>   drivers/usb/host/xhci-plat.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 5eb51797de32..dd57ffedcaa2 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -171,6 +171,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>   		return ret;
>   
>   	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_use_autosuspend(&pdev->dev);
>   	pm_runtime_enable(&pdev->dev);
>   	pm_runtime_get_noresume(&pdev->dev);
>   

Hi Mathias,

  Can you help provide your review on this patch.

Regards,
Krishna,

