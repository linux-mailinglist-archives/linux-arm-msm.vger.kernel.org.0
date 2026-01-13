Return-Path: <linux-arm-msm+bounces-88799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC22D199C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDE6130101FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB482C3244;
	Tue, 13 Jan 2026 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vzqcb2dt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJqPMVCq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D6A2C3259
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315813; cv=none; b=vB+fImhXIYwWachZU1yezhDXywYuwlmL44XoPzAhv+d4otTCnvVYQGKemMrwa0RQ8ypYqRA7Wxd480nX6Dwp8WaapCH7OhZSWaWChCZFaqLR9Nl5sqviG3M37C+duvnMgc+ckpUA/efRgU16ji9hkQPz9Jg1rbg4c3oJEVBT8GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315813; c=relaxed/simple;
	bh=xU/v+1+Ag2SE9i72VtMK72lv1azlPIgm9eEwAdK1Gdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gn3lIVhUyrDwBQOEQ6/68oKVUItr8EZFujWx3Z2QIYJbKs79oFVJk8xYThPPa6eA/r4eblRiA8yEtN18jGeH/oHPhmb9z+RNwQBq/J3KQN+95EOYsgmcsnB4FyAf677H0XKBp5ZkB/0fWAQ1j5Vc0CNanOxbazzaDQPn7dGLnqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vzqcb2dt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJqPMVCq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDH7om3868700
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=; b=Vzqcb2dt4qxwuj3n
	3tbwEq+TxmsomftMbdaJKB2dWG02cGZQ0B081IHQSeqUVPmXQjcZDZc6D254Acte
	II3d9yzPRmlkewFJLrY4w1CTuMTq75jwimIiyunT7t4D3RmQAwjkgh0asG+N1GWU
	7ecJ+Jvvmox+4AqJmqFXDUPK8jFO/MEyoZtBA9hnGc+yPcWdmotPRWiaQ3tsDZK9
	1ELHWZaOu9wXq2ITxn7pTZwfCDGTin829GIYqwNA1fpV3nzMvqlO5hSTZtpNFoDF
	qCqWP3P2dNIpfl1Fdg+RnsCfpSWhiWku84zBJ4EL/rnfWgB3uV3mZmU+Zapc+z0L
	IJorww==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk9nnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:50:11 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6446cbc11a4so2774510d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768315811; x=1768920611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
        b=aJqPMVCq24tyJKm3I3aRXyyK3nLt3XYod2bpJ7yKvep4EzCg6zkWlAuqOnUhRYqe62
         YWWkmfvtDdNnNVly9UQmGA+wugfpNPEGc+vZEefNbyZYxSso4DKa9r8ft+/MG3w0Ij4w
         yYOWS6c2LUeV9rgkrhtQknPH4LJispw03vIna1HfbPxRsh9Ttb0rDPVJxhGKwhDGOoUM
         05KzYYE195iOWEliQKKFy2RsUgic8pdOKxHLMhVTkJdQ0Nh1ToyaKT1ATDz/XWGceLsd
         Yk1NY4m63anWCp7nxyTk4l+rrexcdGQPodSWb8rri9escXd2mqs1l2MhhKOrwBw/nj2I
         jiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315811; x=1768920611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcwxICmrR4gn1iEbkWO2XmXQzG34ygAOuMpV2HL6dSc=;
        b=eyFEypDjLYbB6ATS73/PRuM9B2ow4lknt4E9Y1R491aYujD2G0nbGxJqnaouw8MnxY
         AK8qal/IVo3IzY/Hj6sYVZKP0by0ngHc0K/8rZ73TNCta285tc2LKDSmPaGhPkSNSRwe
         Txfy4fQfIvusEED64V3ipPliF0+brzpoVgPKHqzaB37eQxS+KCaFjyW0nCkepHNPnN54
         okOsEtFtZ/Q5ik7AO+iYJoDfVXB/TaDYBRNZswTUe6QkKlcFAdTjbsgBsSeifbCzT2ah
         aq43pkz2590B5Kt7eEA5HYvX9075VLUDTTRDsQLS8Sc9zM9vKRuZuOhibHG7jfc5dZlR
         QmNg==
X-Gm-Message-State: AOJu0Yx1Ss+n0ROi4HzybdjqXbxGTfBq2FeYZFxEFVwdtdiUXYRWadv1
	u9lUVYC9OuR9/5e/kfWMfLUDSTtZF8X+wxiTOvC1B6+/Sb1hjBrzfN89Uxld7hOyo/zdDyUcMAp
	T7vnxCTqxHt9/VLWAf9Lzm1V2obtZcDDJq3OxTGTr8a6bBs7iUSHs2XB43KcVSlYp7uLT
X-Gm-Gg: AY/fxX6rCFZLzs3MxOqFUzA8AW5MZas793B34BbahXSgXOv8p5SDe07fQ1qelIPiWOT
	pSy8idBSNp39Rl6q0Tnw5PKrFOXQjxa8IIsEe9wPrkd1Vtg6G/AMZfVRPxe8IyC0QUkyoWH5s+L
	RmJ7d1ttbZGK/MAC0Ix3iBpCem02CHuLk7tAeTH8dKt3v/BWhtVrs/Alf2xucfJRS2Qe/ixnZeD
	NHTfEqe16MrAUYDec3Ar8Oeb2IAUCYZPNLdjef0vrM++5Sc0I1CgIX7xpfQOZ7tq/nz5jfTR/3A
	iqrrJG36CDjdVe7s+2ZbM6xvpPc9H3vnS8oLUt/2JMaf/CDs7yxXXD/LSvtxucLsr6In977GceZ
	9WGPiUE9RoV7EH6uwyuZ173FQVgJ/vBDevxaF+wnLZ0SpaJtBxFiMyvWllfG+MhPxGTA=
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id 00721157ae682-790b5701642mr160364667b3.9.1768315810521;
        Tue, 13 Jan 2026 06:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp1gIBS5jEoXkt1plSH+bt7nf2F4KHwCWqllM1mxQRTlOiQ2zlHM62mWIaorCJLX3SUhEhcg==
X-Received: by 2002:a05:690c:91:b0:78f:c0f3:2e10 with SMTP id 00721157ae682-790b5701642mr160364427b3.9.1768315810084;
        Tue, 13 Jan 2026 06:50:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fc303d7esm1058489866b.2.2026.01.13.06.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:50:09 -0800 (PST)
Message-ID: <d63d4c98-68f1-4dcb-b8fb-7c5daf343cc2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:50:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: Val Packett <val@packett.cool>, petr.hodina@protonmail.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
 <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AISdiNrBIyM5dH7iUBSe0uHtxcGxBqsM
X-Proofpoint-GUID: AISdiNrBIyM5dH7iUBSe0uHtxcGxBqsM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNCBTYWx0ZWRfX8NywhRi/e5Cb
 aDPq897b6pPAyQ2owYSeNZrer0PeDvHEaRpm72nlkniCtWBDtIeDXokHiDfOVsb1x/78iBFKMKX
 qagAD5xlpr5jU5L3JThH+JknR3BHtjiIEOhmvcnYnQYTTjLQdRBf3gRfDPF+yPhyHXQwX+jnzHu
 raW6tLGkyO3lMUrd36sZtdYWmaxC6r5ONPuiUL3PEOwM8A/2kZllpZIX6D49q4lNtMrhcYIItK1
 5ZUvW0HKIO4q6O9R8AC8SMyX1xbFuCPN+Vh1crn/W8T3HPQJ0+Bi7h10pwaSXHTnKKgfc8zksvf
 bqmnnFM2O+nuuunRFIkBLSa4v0DT8YXPfV44VjbmTi4th3oCNAnz3ilvVkr13UGqeCSZpFgQEEA
 DSMD93wYmHTTJKT4akTotUXwZMtTMOvO/M/wINpFXAB7RHp1exeIZPOQZGNDUb5HT2IVu/U8aQx
 pZT5H4uVinxBSXi94RA==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69665ba3 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sfOm8-O8AAAA:8 a=rC8bUFBNB4MWVkYa7ykA:9
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130124

On 1/9/26 12:00 AM, Val Packett wrote:
> 
> On 1/7/26 8:44 AM, Petr Hodina via B4 Relay wrote:
>> From: Petr Hodina <petr.hodina@protonmail.com>
>>
>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>> clocks are enabled during clock operations, preventing potential
>> stability issues during display configuration.
>>
>> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
>> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
>> ---
>> We are currently running the latest linux-next snapshots (next-202511*
>> and next-202512*) and have encountered random freezes and crashes on the
>> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
>>
>> This commit fixes the stability issue. I've checked other SDM dispcc
>> files and they also contain this configuration.
> 
> Hm, we don't have this flag set in dispcc-x1e80100.c either!
> 
> The only random freeze we have on that platform seems related to PCIe ASPM with NVMe drives, but during display configuration.. *extremely* rarely, but the eDP display output can get stuck on a blue screen. Many run with clk_ignore_unused for the early uefi framebuffer though.

Your device doesn't have a DSI-attached display

The Linux clock controller representation of the DSI PHY implements
an actually meaningful set of operations that (un)gate the clock

Both DP and eDP PHYs just provide funny fixed clocks to make the clock
tree resonable and filter allowed rates

Konrad

