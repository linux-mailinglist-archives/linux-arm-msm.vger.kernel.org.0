Return-Path: <linux-arm-msm+bounces-86878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A06BCE81E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E10C3018D50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159092459CF;
	Mon, 29 Dec 2025 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRwYQYc6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ByFV6TeC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBAE261B9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767039611; cv=none; b=raqBfHnjDTCuRRA92DahVjx1QB+9/GLjNcg5BjDvyLV11gu2N47cnM2/+/68VKcVA/XR3EzQb7fjsjBiKH8fq5oIgl8xNjFuVJBJ2Q2WAcrsSVUAnd/RpCJZgNHaBBqJRYR/8D37dyxnnIIF053VdS2lUiwzmU4xGrDPLu2lxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767039611; c=relaxed/simple;
	bh=BwsOeiT9u3rzrRz11E8mkHEqiVBgJs18hfyrJTOTuh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ED4cbs6uPDzvLOHv6RjsBsfBdetps+KAFira60oqEqinPJTbKZ/v/cW+1G16DIqC7+a4s1elgnbzSDN2XLpjNS7djJvb182j5z2uHWPuIPm4waFUaildH8RRIfkCSoCCdsSxsqzKlGF3VS3/oBL/jTdOvmV446QMVMPcjTX9goM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRwYQYc6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ByFV6TeC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTAJZEm3328419
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=; b=DRwYQYc6xXrnDYfr
	4zRQWdR3gjE1qZXQA0FLzBPH7KkA61L1rU+1UwsFW2KeVAg4ylPLhHzsLwcVreoX
	RBdj6tQj9QdRrgeLzrsl9GpeAnO+WoQdhvIEUBuimZ9l/doWI6ATiXrc9yweeazI
	0WGbiS69rwFLUA6BPpDQDeXEmw4d/qGbTHIsUTwP9aVSSxNsunYUOzvw1gSlvW27
	Z+BdYghv3ZbMC269yXSZDBdNq0HrXwcTmJebFHgnbGo9qXqrwliIMQNXSlZGqjrQ
	U2VvdGIzyWc78GnzV4TFHUmOHt54ps1lb6YANvyCvR1MDQXnnDmUngnPDhMu9DR+
	OcPABA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6d8t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:20:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11bd7a827fdso17718494c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767039608; x=1767644408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=;
        b=ByFV6TeCwejM9c00g1m657kaLjF+tU6LuWF2ToVTI4euAP82wg7cbSedeHIsyVvfy2
         agaLvGol5K0YtXtI6yaGn3uXKWMKQMPtwizXVVLBwIRgP8PELlCglXliRZIvOk5dJTKG
         5vGaIIUMzZmUa7Nar5owsg6Ap9sDiH2FcNu5xhy73vgQWvFgdnzxgbMyJTyetDh2/fS8
         qXjrsE4jLahYIuipKrLqcw3NURMEi81VtQ44Blk7RuvR8xSGg3lhozeCDpf8eHJjCt8Y
         Y/en/m/uoIsHgNFDofXV8is5MhhV4he0R6PiI4XrHRVS7jBzlB67D/m6iDXGtz0Sp7Mt
         J+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767039608; x=1767644408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=;
        b=RitDcRZWotdzjN4QKwZPl3tuLcuZpcVjapx6GtjjCFkF+WzVW9gO9okh448JuVihzl
         7c8tXqFyk/aSmXtXLjwfZyTiNO+22ydciYl5BNUn4mqzEGOd9f863Nw+LIOc6UtAV+Cx
         UOiCZKUJdMDEi5xanpnw0xwrh0VXMqbTLVkSUIBfo6zHZvRxlsWOjwP9/AM9QbWwk6/p
         FOktFuPVL8hTVuzKZSsORzf3DJq6oVCJV2QbCo0IVnAupLCvxVkKeRhDXajkIM+naMhA
         eq+XbRfs0HpJRE2yn9YW7lM/1kwHYLf7GVpTmSX9mjEa49avgxXviKuwKuTAsJmx+vf/
         NNYg==
X-Gm-Message-State: AOJu0Yxu3DMaXgozlTNRMdVxLNCVus6nFMmsum/vjWnq3i6sLZgiFVrw
	hUoqUAkSLispB/fEkTNfoe/UHH0hSqlK3C9LPrpo76hfaGla6BEpGgqqyHmLV/lRsFyS5D3CI8U
	86ZC2lpAkcNfHZIn2jWmsxBs5s8IAg2XAecntiQR90vth7ibphFOFhRnY1mJ6meDbA8zf
X-Gm-Gg: AY/fxX5A0/FHts5FvBFk9rcmu6q+wCmueP4a3QORBw2HYtsn1q2/YmhbSQ1QnxAGPPo
	jxSNgY3++keG7VZrctwjHLx28k5TuhFhKLJ50WOVqcjkUDnPnY5/HgEuXFMU93SL0nPDN1+jgEx
	S8pzNamfgBlPaFIWekZf6Qyp/Au9c7P3rszizwaz+jCCkqZKefE/mb6YYvRTxPsXLSsQOCXk4lY
	XQKp41K7zJYvXWRFG4PZGAfCKTRY8XBPag6wAtUL4g/ZDKdjJ5dywRBEJrxq3oh/mU84EyynBEK
	Hc/4M9RDJDx7MllawNMFXyE4ioHKFwAA2ixdOGWgGrimPSRGrSW1s2wXpsSNqOPVjqCLTt+fE6a
	zlILR3l3SddukMO6l98e/UswiRe+S5jbnTOBg1dL9nBI0LGGQyuzySZWS975cC4U=
X-Received: by 2002:a05:7022:e1a:b0:11e:3e9:3e8e with SMTP id a92af1059eb24-12171afd95bmr24941775c88.23.1767039607753;
        Mon, 29 Dec 2025 12:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/lwK2wTaR4697pd1i+xemc7zfhrLFxVX/r/0pN47IvpGex944GuH8FMyKdtpVLY3DVSOxHw==
X-Received: by 2002:a05:7022:e1a:b0:11e:3e9:3e8e with SMTP id a92af1059eb24-12171afd95bmr24941750c88.23.1767039607116;
        Mon, 29 Dec 2025 12:20:07 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c23csm117915702c88.9.2025.12.29.12.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 12:20:06 -0800 (PST)
Message-ID: <60aea371-915f-431d-88dd-3be633dc2bcf@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:20:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=6952e278 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rvCqxPIgLajCgieXA7CcmoEg5kKahp0z
X-Proofpoint-GUID: rvCqxPIgLajCgieXA7CcmoEg5kKahp0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NSBTYWx0ZWRfX9zMNCGdRa4k+
 fmNkRoxr+sG0+rmC1dvO3q9PZ425GrqO/JmnRxmtfSk7As5iE3nOz5u5Wdsiz4+eyzYp5x9MQws
 SRnjRxrJB5e16Mg6yjzS6Csi4pQxTHofn5Yb1vPRuZEosUZH8M+LqQpwy8i+BrAMnuTBmc95y0r
 GIQGN1yQf5FRSuqW0OmDnqB0WNf2XSIO9JXG+MNIwslMOszIbMIVhB4b6yAM806ujhDZxNTxame
 qtQ/oi1OB08jogvnNrvfV6qW1/5X+mhRGQ5U8t+UdqEbKtwV8tr+PMpxbG27oYhxTfuQkbKfWsq
 WLAJfMQkifQtnEZOOcQCVNVPt3Wh16Q2Wxdken47G2s0uloAzOj1z0/ftfBaPBpwQHiWHEJOczK
 4sDjhfwEsB4/RtJr31eRF+9mwqheY35KiZSy5up/Ei00UVLZshyBdTFOVfzrdbOtdDlORzx1t+1
 o1XxzfF1p9JyXNlJbJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290185

On 12/18/2025 9:51 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

For the qaic bits

Acked-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

