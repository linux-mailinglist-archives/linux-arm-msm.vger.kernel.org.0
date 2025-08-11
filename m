Return-Path: <linux-arm-msm+bounces-68318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB1B20598
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6089422E5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABE5277C9F;
	Mon, 11 Aug 2025 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aj2ELdzs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D293A2777FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908441; cv=none; b=F4a5F3v2c7PXD54Q2ZBn9D+Fo3eIJqZp2Fe3/pWvPymsrfTxbUx6HNXWqMp4rh1RNwRGA/EvQ+zmJ/GN0mT8eNe5kESZjCaywgy8RZ7Psc5ZGU4uDe7uXN5/EPO1XRoYdgxHS2blLKetvhN8/lwUN8XABoIGsyHaVH/7LlW4HOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908441; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWWbPQ6BcxXESqJwtSJCxjW5WHIcnrTgqGDO41PxF//30J8j2oxtzRIEdhY8qrvFcF50F8REGGtrqFu+9ScGIbQpwkYNoA5oTT4qvIVbD/wy+egX5FFSd45Zu+mcxBXNBOnpoEXlO0ppysFyPYubc5sFM+ck+9XKa0uTfGetLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aj2ELdzs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dAV3029206
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=Aj2ELdzsgekhYgRt
	ClktyV2PtJ2CPU1+yHxzLljbB7VL8jO6/Qu75jWuF4fCwLZRtRfpwD2z+8UHaQlR
	F91dHXHznoR/VAZnbcxOhAUWozo1E/eSg7+hcF4UbaaP1SS8dX3A3ul8wwIvfskb
	kAQKD2pNqF5Ooj94/JJfwt0Adj5BvQ99j7X7bZlnKoz6n05iJ5U0uT2yhvQsERrj
	OPufcVYx7EdUIj9e+yP6ogpa/JGZLbfNiHq5zeUzmzO6ksgpYxhYFm8dXIuLIxOM
	ZaqxieeJm4j532hLK/vWcm7CSL9NeRS7c2KyCBW+NCpiuXBPao/WoB81t22D9wFK
	aerQIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbyh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7074b13178eso12948646d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908437; x=1755513237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=T8VlIjjat71opbmvDmeiSzssv4PonwWzgmn3rRs3Y4g2lEA302l0Mp11YFXMid13NW
         +1C5JdBM3YUaJIDj6pyMZp6nKzYn4RsC3z8I/zHxnkdQOTw5tq9QfzNuuRqD2AuB3Wfh
         ctL6bXS4n48sul7z+LIAduOt2cxllasiXrIHBEYzefCkwM/YWMm+IvWQWw6iA69gXLTk
         xAH6/FdsISi0+FTmrIJAsS6yAM8AVruS1U4tOug1fVItBENwyh1ayvAkjvvHjR7JS7Ml
         FXrLhfz29cfrR7IVz5k0qt16w0zHJKEAfuktVHUbk3Z6cd2mrvyp4FWZsiGgXX6iKCmO
         Gu2g==
X-Forwarded-Encrypted: i=1; AJvYcCWiQd0mZIM+0K0fvqf+Xa1t1RWrC+zgDhRXJo/I2tZ5OgAjL0zhfui9mArNlbxeNWhk+3uPv9AOX9a0t1gW@vger.kernel.org
X-Gm-Message-State: AOJu0YzNgq5KkVSMRlSn6PE5l2CHG4iYnOwTZhDrx1xJsQ+P+49emN25
	5U/GxbnY7yUBi6cH42HDC+bbjCyl+L7JkAk9RgojMZCKrn1KmGIu8EkoA09mMFDoa4oAel7CoEx
	9JI37IQjltQwaq3rZkgT5beP7ryiQc7hWnmM2yInJZjDel8CjBFyJ7lxDXolMeTsPGxQr
X-Gm-Gg: ASbGnctZmCJlcL4fZbjOYJERxcYSRj9AJuQwdbqLAGWncNwvsni2uTrE0xCRp6kWL6u
	Rp4qYBXxHGaPvrmktH0eljvemMKL8rCEsLjqZY/9wr+syN0ORkUERAQfbTBdve1TsuBLTWcYjU2
	1CemY6tjC/9ugsxVlO/yR2Y0IMn9Y2wVJkZjUZx51WqTwW0NfjfBIGqL6QnKWg1srDsZs1d7GWU
	QDNSJqYKm9V4IaeR5UksQYU/uW9tJgvR5kH5qRpvUJUAff48FvqH/E0hAAGKGIdJpDigrMdTrsS
	B4cg9zFPF0qEERY2YULwPx5g+h18zqCURCLS3cEry9ML3dsPoK8kjn7fkxiFcQfqELtmwiX3clX
	gc7pi9Cude+dnH5m+4Q==
X-Received: by 2002:a05:6214:21c9:b0:707:76b6:2135 with SMTP id 6a1803df08f44-709ac152639mr49721756d6.4.1754908437516;
        Mon, 11 Aug 2025 03:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZPUcFhvJ+o3XZIPZBMeA11da0VhO9plin+aeS/4AZ3/QDcw95Q3QsJu+fTZO17e7WElJo9g==
X-Received: by 2002:a05:6214:21c9:b0:707:76b6:2135 with SMTP id 6a1803df08f44-709ac152639mr49721596d6.4.1754908437064;
        Mon, 11 Aug 2025 03:33:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:56 -0700 (PDT)
Message-ID: <1442a1f1-8cba-4f63-a9c8-85118d728365@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX0Gf4nlejBqj3
 f6D45yLnQ0x6qqFstyPr2rzVon/BWYz68gKqYEOd0GtpLUY8BZQpIZS5f++IupGJCiqUmxdarXS
 0UZim6gOEYHexGApt+zq4ZTTg3Fsv6u7RKiEDyJfj4rNNR/YIrm2Po7LCbFnI3Q45jtaRW8zmgC
 FUH56ExmeGXg3lD1SrQ63MIzmy6a8WZ3T7Xras1OJExK6Y13C6Jqj1ihdwpy0BKLlEJpMxgKX9i
 a1UpNK1bCRd0S1o6UYYfj7zoQJkJYh1uMHvdVwBQ7atiU/oDdgstAzkYC3fXzN7C+Y3Y9isxceB
 QDI2s5oiPZ8VYQTjyRwRNEQFeJFdBhaj9VkX2pJkwJBCpJvU75FC2kX+2OuBFxiIB7e2818P4gt
 6Ys9HfW2
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c716 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: hvuA_D7RIt_fTv1VTCzeBeG_xdyvnYcI
X-Proofpoint-ORIG-GUID: hvuA_D7RIt_fTv1VTCzeBeG_xdyvnYcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

