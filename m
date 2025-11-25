Return-Path: <linux-arm-msm+bounces-83159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F271C836E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A5A1C34B6C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 05:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587DB28725C;
	Tue, 25 Nov 2025 05:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3GQjHDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DTncleeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5D4280318
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764050380; cv=none; b=XdFblgzhyD3i4bDLXQDo/1e5Y134vvrIG0g7u9GPvInGwzcCJGLzevvtBw1DVc0VDWG4eLVQo81z6swAu26iPfl9L69+gEp/FT6GOj986crHSClXU3a63e0FGmyf1HxQ4xLFsvQNMYVS1oTpuOLDUsNLdecckWbiD6gQbrqP9H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764050380; c=relaxed/simple;
	bh=DLzeVXg1Kpqmdac8Ngi+Yun1wczuPvzXY/lPXP9whX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1Zsc955UUukk0P9lhmn3PTrek9fhdB7pMZF7uMaqzL9U0yIQA6w+cgc30e3YIFd2G8utsVGoAl2VymZ7UT0Ijhnk9YeavFpwtl+cbS1Gc3atGqCvvRSO40P7rTte0+5fHJv3k3xoJ7BKNZD3zMxE5siZfSCAFtsUPBS6RLNNTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3GQjHDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTncleeA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gecc1699054
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMDLkTRGzuILPlvQEG+XGyWGEVc5AUhPUHDgO7Immwg=; b=J3GQjHDUaOnvR5sn
	9HdhkzB51sn/jPdoNGJ0yjc5l846wKVShpoL00WL4BWI8t0wUHNF7D+O+ZN6jG/r
	Uld0Z8bmFJi/AZSvCruE59rMJAVyT664bW+Ga1srrxRofCbewr6OLX/WI9u9jKJ6
	IZeFUM4wPR+SnMhNpn9w7gX8BSoX4qIKdhsMIeLxAGSnIyepj7W7fdLcuJ0NXP5R
	LOVGO7k606ER4ABK5sQB4mZOBMPLQ0bJe5jQ8GzQOjZ8qPFHeozU5q7j/5ZKHc5F
	CxhNsgAS4nfTEBxRNdze2N+wUHFrOE0w47mocLhREXNnO8/El+ubX1fI9kM89KmZ
	0wje6Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp56avhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:59:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so5142987b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 21:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764050377; x=1764655177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMDLkTRGzuILPlvQEG+XGyWGEVc5AUhPUHDgO7Immwg=;
        b=DTncleeAYscSXe9hjVAdFxDvW1728RaGNKAIZllYD8FaQRHmpJdpuNvzu8AFJLSR74
         0xvXfTKMRPQj87JHKvtvpp2G3hSmsR+rkuaKSLZQLmr8u2FKfuj0npZJ/YYMOFkqk5hs
         BXUGanQrTGXcCk5IHHRY5zOWyRc8McMZfVsPE7NRws+jeAT0F8lOTZ5kcx8DBwMqr2Zx
         JeSf3LPin0GMojcBMC91OQ1m97L+3yyx87g/Z74aBkQdqx2MOZjiXIUFF09iyB5NREf1
         xC2bBUfu8shMqQA8SLSZ+0kGZ+rLrHUhmBEQPJPSvilx31yqSI9KcjU51PoZYBJpyt7j
         khpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764050377; x=1764655177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMDLkTRGzuILPlvQEG+XGyWGEVc5AUhPUHDgO7Immwg=;
        b=MfCVl6yVaEN1Bfvknsdy5DAPysvi/IC5sJLVdBlpciHMskaovc0iTOPDhTP+koqtpK
         rR1LWtP3vAsZ5XvRTcRlqCdzqaJ4JBh69OK2kpWi/jSSuPYjB6zOL3IsYd1c3qlYA1X5
         rdIhU4kofura2ZIT/mHcIJTJydNR4Vh7DPx4A2wcZQ08+OKXJWJ+J98Po971MxA3UsjK
         LVvAhc3C9SCKn7ISrrm/Up7+JjgRgTHrL0wjDW45clZLMbo6zUY5AaWBBx1crC3GY4g7
         Q4usBBunTvf8JbDx8u1+m7mSbyR9CA0KysAuiFl62ll08ykewWTaBfBHyiotZiZqAJH6
         2TNA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8kFSE4dley6uu2z3XrP0mOFRoaJ/ooiwATFjYOposyA4CESsPKM0owVTE0gTaSPLS/oMvXh4CkvrKmtB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp8GtMLq5f8EKLmsfp6eE67LvvFu0ingu5vbznsXlGVO5Bl0xr
	csHui2x/8dmrdYCOZeg7v0kr80MNLPgh4KkNsfymRIVlASZguj7jrESbI6LOske0Hry9fVbsE8I
	Xz/wCT8v9GbJzYfTI/NWOq4VyLQem8Hb3PJCq6w1ygviTq1+FIj0RHuzGbPkS8rnA8AGw
X-Gm-Gg: ASbGncvtxxrQJJgJ4Q6sdpPCR9q10Xc1OCyYtozZazeFZzCzL0VMOZ9QN4rn0YRoyH1
	lK6SuRcV1/+6s8S+4h8bdtKYrsXI1OR5oTza4/i+s93CSZm/8KEp3LaaDdYTN7thH5ABbH/1LVz
	1kRKEeZJzKT9o349pUBD2j8KTWouPoRM2hNWrdQ36BkCoKwcpgL6Dh213e2E7zbSX6uNfopccnQ
	qSF/GA3cvAWWsJ9UCV3rVPh69j+9woUnBPkFFLY6sd0IsxmUaHa15vzrbhvHbBDBVbWn4WJsi+E
	f56AzaB5Jo6lOap6vCkb4kyMVYXKzslYawZiCQV+3fUTESN2tuOfnQF+XlGJCtggu6FmZ5h7dcc
	0g0e0MPwHi0O7xor6avKWSyaTni8Jut9dlSj0GbcklSQ+V3qzlKlFFrwGTNXzc2tNK+Af5A==
X-Received: by 2002:a05:6a00:3a1a:b0:7a2:6eb3:71ee with SMTP id d2e1a72fcca58-7ca8946ca5amr1800796b3a.9.1764050376760;
        Mon, 24 Nov 2025 21:59:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKnxLXlUlFvXKip92+KHsNOygVA8ja82PGqxLupS4kq4t+WYy23EeMJ33yx5Jw2IOAgdM2gQ==
X-Received: by 2002:a05:6a00:3a1a:b0:7a2:6eb3:71ee with SMTP id d2e1a72fcca58-7ca8946ca5amr1800762b3a.9.1764050376260;
        Mon, 24 Nov 2025 21:59:36 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63aefsm16619347b3a.52.2025.11.24.21.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 21:59:35 -0800 (PST)
Message-ID: <7e5fc36b-1b87-4e52-94b8-d8d67dcf33cc@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 13:59:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: vdec: restrict EOS addr quirk to IRIS2
 only
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Viswanath Boma <quic_vboma@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Mecid <mecid@mecomediagroup.de>
References: <20251125-venus-vp9-fix-v2-1-8bfcea128b95@oss.qualcomm.com>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <20251125-venus-vp9-fix-v2-1-8bfcea128b95@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fw4Av63iXrqXfLUZlrveG1DOffNT-QTg
X-Proofpoint-ORIG-GUID: fw4Av63iXrqXfLUZlrveG1DOffNT-QTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA0NyBTYWx0ZWRfXyjWchtoAANL/
 UfJBf8X4CDBTxcLEHJxxQIKVK7Gsmwq5jkuRtv1lBHFKDovIjy7KaRlezIBm85OtwseWYHud/lf
 pr53FFD/onqRE8d4gu34BhUT3IeO2VFaf79eWSKiNFK/skGhGPQvNA0HqiKDIOX9b02wZDGy/Zv
 /mUJ1sg3Ro8D07Gwjve9nwyFBcA91H1/h6B2v5P0ijtPeokDaZicwKLON0qulPvifgQ+sWtFaVH
 fAXP51pbGLMVUMuVWUzgkX65qoNLQM4H8yrSqWXJ0n1PJgrXPAx5QhfH428+/54XFci0W218z2q
 7cjyKl/0HUOkJ7dmU+8a5IZJhVl/VjsZQGEsSAbXRPrZPP+aVPfqot4H/7NrjgwfK+/qrU2P/+5
 poaXyaraeoZ3a7EEUVcJTHlsAdDmyQ==
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=692545c9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xp9ffQbxc1IWA5zbOIUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250047


On 11/25/2025 1:34 PM, Dikshita Agarwal wrote:
> On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could
> not handle a dummy device address for EOS buffers, so a NULL device
> address is sent instead. The existing check used IS_V6() alongside a
> firmware version gate:
>
>      if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
>          fdata.device_addr = 0;
>      else
> 	fdata.device_addr = 0xdeadb000;
>
> However, SC7280 which is also V6, uses a firmware string of the form
> "1.0.<commit-hash>", which the version parser translates to 1.0.0. This
> unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
> condition on SC7280. Combined with IS_V6() matching there as well, the
> quirk is incorrectly applied to SC7280, causing VP9 decode failures.
>
> Constrain the check to IRIS2 (SM8250) only, which is the only platform
> that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
> restores correct behavior on SC7280 (no forced NULL EOS buffer address).
>
> Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
> Cc: stable@vger.kernel.org
> Reported-by: Mecid <mecid@mecomediagroup.de>
> Closes: https://github.com/qualcomm-linux/kernel-topics/issues/222
> Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fixed email address for Mecid (Konrad)
> - Added inline comment for the quirk (Konrad)
> - Link to v1: https://lore.kernel.org/r/20251124-venus-vp9-fix-v1-1-2ff36d9f2374@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 4a6641fdffcf79705893be58c7ec5cf485e2fab9..6b3d5e59133e6902353d15c24c8bbaed4fcb6808 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -565,7 +565,13 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>   
>   		fdata.buffer_type = HFI_BUFFER_INPUT;
>   		fdata.flags |= HFI_BUFFERFLAG_EOS;
> -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> +
> +		/* Send NULL EOS addr for only IRIS2 (SM8250),for firmware <= 1.0.87.
> +		 * SC7280 also reports "1.0.<hash>" parsed as 1.0.0; restricting to IRIS2
> +		 * avoids misapplying this quirk and breaking VP9 decode on SC7280.
> +		 */
> +
> +		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
>   			fdata.device_addr = 0;
>   		else
>   			fdata.device_addr = 0xdeadb000;
>
> ---
> base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
> change-id: 20251121-venus-vp9-fix-1ff602724c02
Tested-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
>
> Best regards,

-- 
Best regards,
Renjiang Han


