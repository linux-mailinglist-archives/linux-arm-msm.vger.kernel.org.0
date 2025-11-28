Return-Path: <linux-arm-msm+bounces-83695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE0AC910CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 89C3434BE6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 07:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0557B2DE1F0;
	Fri, 28 Nov 2025 07:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M31UZECm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HyS3gSum"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD082DD60E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764315568; cv=none; b=cy+z6Hq4/5NqdbotbBcEDIv1kYPX46M+LaTs7Uf+AkXBhP1xrVCT4p7xewXYcsAY8kbN5dZ7QXvM9xKq5QoqRL9VdWuziinN1PeCqlRa+ouNS4MCy/UR7AbofncS5dSbxgGmsxcgSIVhCNcrfwMJpctbXln0rGeSJ9DbawhmjqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764315568; c=relaxed/simple;
	bh=B1rH2VGakTd+82iKzkUmjJCkjBhqry8fRBZMXb/dbpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSM5GaYr0+bd8RUJ6hDdTbX0FWOqGTxN6dYEprdXd6/ZtO5FSLPTI1VmQNCJkAQ3ZGP+/MRTWHe6fmgPParGUA9E3SaDX9uyoDdIA8JNUBhkd9nniuekaiIdJlPG5Mo1twwzyz2WnyKfKSR9cDcXjMZBzal70YWGt0ExcAaxVJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M31UZECm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HyS3gSum; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS12QLL848995
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shAh0Bol9pcCGzHnB/ctOWK6vAuHxbG4hKUYdNC1kBU=; b=M31UZECmIn28hMqQ
	CZzLFxaNfptXHq738uwFDbb7YbMhs12DlibTea1mGWNKRAilqxbQaBw5rGnxe7F+
	hiCUqGXYPE9um/dOoS2WrYLnXmL/jLHhzrBrYS72mAVC9qUs3+d5AJerW12so05B
	ojvjZPhHCi7cpbLaYvpH8x67U5YxpXGH1uJjV+ucRKF/kVku9E3DtUQwCJL13R3r
	hOEjO0REJKz0q3XB+ljiIvgqgpg/sKpvv1MoijsIx/4qLNUhtQG3co3zfD7lsVHh
	dkzW20zHXCxHsUHwnyxgFC9EkpJoJ540RwXYLQeeI6oF/Zr279XjEV/wHoNxak84
	DuJq0g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjdaj10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:39:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba92341f38so1645049b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 23:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764315566; x=1764920366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shAh0Bol9pcCGzHnB/ctOWK6vAuHxbG4hKUYdNC1kBU=;
        b=HyS3gSumYL+CbRKbBk24Zz63Pw9BRKYTNxrAzHrErsdFTpJijsc1s9dSsnhQ90W+PZ
         ezSEqz1fZwSnUvh6GGHhkR3f91yEbVgLBHJqI4NLe0wk+NQlWeg4r1renYyABDKkb7uw
         7/ZM/zliWUz4VHaLL9vdbxCCVRO3YlJ2lcIYA1DK//EQs0i01hltWeXfqiIoTWR6DUtI
         RQgvqF6B5UZ3UcqloHZPRa0Vp3FyOCXxnwxgOsJTUFciVV9O/P89XG+wI9WA1EZbOKtE
         jGbO66IosztftfQLWQL7T7ye1jmnoDy+zC5VVDe73xdQ76GsIvTD91YIpLcF/FnbFloP
         NOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764315566; x=1764920366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shAh0Bol9pcCGzHnB/ctOWK6vAuHxbG4hKUYdNC1kBU=;
        b=gYsYWmEkRA/Zd5bxeEjF0Ou0fLuv4jT+waWNXRE2FyKL7Ig3JJ72YxhvYgnDT6hecj
         Xt49jpsVDyOPUBnE7Lc9rb+O2G+O9l1b4t39a4TWW/ClcMJ2HlzUWZYDzfR0G8MSes9L
         R2qEZOYG66+3NF98hKnUamkoOhvhHB/3gS8LlR/6MI4asQjga91M1kxishEzZ0aRvCny
         7aGZ3V/UUVPzdiNtur6V3tfSzFU3PxFyJih3tvJjfzCwEMxXK3wwpK3AS8m3eely7kUI
         L3eE9uorDIm5A3V/LIRqubKQ8QSMHemARZTugmLy8ShDF4mFjyiKMXOn7rw/gxXlotlr
         hTlg==
X-Forwarded-Encrypted: i=1; AJvYcCX8q4fjkpuGP51sqr6KP43GO9w3DOGGQ+02c+y4VJ+lx69mKGToHXtzX/ufWPNc/9qqTnfyHTWgf6xVbbeA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+H9DOVpMjtNQtMzRyRozU1+3iXIBRkf68lgWgFVodMSIhyPSB
	ZhiEvWpUNN2tItMexkLJOsOIu1kTpznlAr4iRp5bQuqJpnAh2h2Rh5vt44m0+xEfvV29BdSoRl0
	vhxfVnvteRa1jncDnJ5oe0TtTcg3DfdG9mtdaid1eJNSSKoKXajiCN6lxEWTZJqz71Q12
X-Gm-Gg: ASbGncu+S6Gnf1+Glt3X+Ff2v1mlr8h1SJdkCRSSWhSpOC9wllYapRmS7QAQuR4P0XD
	FDgIvXXpJzB+2S2Swf2d0YXdo0IjvESJquWSZbnqFULkEbwsC3ULWUPJVZ1qTlvzWhF4d5oeiRo
	kdQx8Uca7Ss52s7Tn0j5TNGZPzJzlxGcKlZ4OKxcv2ZTzvP331MTL4qof/ie6/aVyeSfQfb70m5
	VIUuEJriERE/5+NjUlpKzmwGh7bpY2PSFC1EAywj+bSXFiAKAtbPAKZOGNwLD+qyKMUo5iS+eWg
	R1cmMqZFlEuvW5Rq6x2Sd4FwOTw6cCqzSi1MHmoA2BEMwzZTpuB+RIeghnNCy2ZwQww+DMAva59
	hs+jzjp8JsV9/UQ0J/ERxkNk7p1LM/Pd/4bEj
X-Received: by 2002:a05:6a00:3e11:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ca89969776mr16061729b3a.14.1764315566032;
        Thu, 27 Nov 2025 23:39:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IES7mwNVMOOPPEAyMVt2VKS57l+pQBcyiT5SY/rKK9XH3gEsL21mDCvf2glZ9qXXauOwtLl+g==
X-Received: by 2002:a05:6a00:3e11:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7ca89969776mr16061678b3a.14.1764315565572;
        Thu, 27 Nov 2025 23:39:25 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15fb1486asm3981423b3a.61.2025.11.27.23.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 23:39:25 -0800 (PST)
Message-ID: <fbf5c49b-d0c9-40a1-be5a-4ef21d8ee5ee@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:09:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] clk: qcom: gcc-qdu1000: Update the SDCC RCGs to
 use shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
 <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-7-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i6ZYEUMsbgYJGm6LGJVTAY5wz05lWZFl
X-Proofpoint-ORIG-GUID: i6ZYEUMsbgYJGm6LGJVTAY5wz05lWZFl
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=692951ae cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA1MyBTYWx0ZWRfX8vqYFK9W6s7E
 iuoVj6Odm6OkRJwcQxyLTyGJoq0buOHOUX33Xon4xvO2hdgD0EvrgmK5rlwWb4m1JP1i9N9a+Nb
 /Vl6Ecz6ss2cYnKQU2tcJsQEwvMh/soJbxS+ohScN1dt7HSgw5Zx6eRvJSc7dI3WRVl6tJm4qrA
 rjkxzYonr60Zt6/HrDNjRTGZF4O9PnOJDHAEap3maieyAFJ5aS8gtx+lw7Oxq9twan9OTZkAAyi
 UN7+H6VR2aX5G427NhP5bH6ZNVtR3UojyJPVNHIeBZ8lHqwSZHzzPcfQ8s8ZwVIEWBh+Pjd3uGc
 fQKqLB49o+Rgq/DkRDPEtsN2YXT0BJjtC4MVzdZeXHzE1bz+ErXsaqKIrQ7dIlYAPwhwl/m2dVV
 yrn24US2gWjk88EPIxgbnDIEP6Gb8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280053



On 11/27/2025 11:27 PM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: baa316580013 ("clk: qcom: gcc-qdu1000: Update the SDCC clock RCG ops")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qdu1000.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

