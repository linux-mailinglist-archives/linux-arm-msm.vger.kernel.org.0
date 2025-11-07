Return-Path: <linux-arm-msm+bounces-80802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A950C41293
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 18:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 247A93A881A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 17:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FE933711C;
	Fri,  7 Nov 2025 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTutqEhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ONPlPLiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206A633711F
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538031; cv=none; b=aOU8TFhenAZaXbgaBnwQ3PKaOL4NM8Ivxg7z16nP9bidZ9K017Liq6kZYsTZanwFC2nSp3BrEztipLZvc+Mdx2GP2Rp5wxiCKTqN1DqRaxnoglEFb2VBqs4p1m9F2rTfOWIOrbM9GEpXLDVvwMKlZc42qlDWY7uf/kJNz9NJVUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538031; c=relaxed/simple;
	bh=kWxIZrZ3Kqi0LQ6O5lpDlg0uahEumAj8YWjcf6rMqlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0dPp2OL5tJrnH7P3rxwJciSNvaBLK7UywEOGtn++2LRWUt20jciipX27V6gRh5BO90u/NcAVIQU87ucCB6BYmjcgGHX6xUcaVwBEwZXa6p3lBz5En/wUsOetYeKCd+hgNBKDbac6FktlROfBrP6yXL58t4tZpOD3zp7IieNjPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTutqEhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ONPlPLiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7Bekw82853446
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 17:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDu4LquDYbCXg/gjVsJ2LPTxaSnh0taMI7ccEl+/wdk=; b=dTutqEhgfL0pRnRa
	/au75FIAkEMbWWBlNvFhFq2IDL4P5NPOdiU6hAUQsLHMXiZx9qtOU+x984Bycf5f
	l0a+Tr53IkSe4LP3qZ1OionEcVPUPNeAiC8Ecqyx6fChwFa9RmdSAF/mXLqbPxo8
	DZLQZigWWvQh2Z6gNwTjVyaqbBU/hey99DaesHuFH7hZ9u5xz5fOi0XppqmoBm8P
	KJjVnR80EVsuewWmmUbmiQTHjxLns0fjSSCwLQcVn4iYLq4oVt5Pmki5OHsd7ZLI
	ux36CMwOp+FuOuTuzZPdM8tjz+q8qzSF2Qpu9G0yn00awjuuAtPdpkywpMkAlX8z
	LavGtQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9g3xs0pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 17:53:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34176460924so1001925a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762538029; x=1763142829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDu4LquDYbCXg/gjVsJ2LPTxaSnh0taMI7ccEl+/wdk=;
        b=ONPlPLiKEwc3B2IadpOJNT07CuxnicXchPgbJzJBO5I9CMVqiuSaH8V0j6sCw6prfQ
         7Yhufbry/5OopcXAMr/PPC3Mxce2eAhFKH0vXR6dpduIOEZ5x9Fq0slrme0l251e7aRH
         RE+QbGakBlNyblCNIemVNlnsaMoCdsKGqnUnWodQk5OcazIsRs7H1HccKEvcKA6dJfOH
         mIziRnplFIPrmLEZheuSGVyulnGAn6GedjBkmmsFkURtGSzrPFFGlIUNdSAgOEAyVEBk
         ptLw1wM6DhYdimOF1bTFkxeChNM3LmAVfRFYvluDQYHKnh/yTueRmFx939oz7h1EaBiA
         rTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762538029; x=1763142829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDu4LquDYbCXg/gjVsJ2LPTxaSnh0taMI7ccEl+/wdk=;
        b=tzk5aZfAmsLfoOoqAJ5NGl5tgCAHFIYh/dzCP75S7j2dWCb6riMcEcMVj6+MsB5FhJ
         BXPr5F/JH9x43AlQw6lEHXnajj3YIIV4qEXfeX08UUYaKtClHUopHnDzq6640AXAGhsh
         1gBWoVIruMofFY+owQ2oCtHO6O0LZVb/wO0DprfPwZ4HS34bZ+ozsxTIwOH5WF/7m2YV
         rHpWLEAZ1uC0Dqr0GasGSdEJ1bL2MxIWW/AcT2zzCODUFLHytPve0T7Wa3k01mEZ5yjK
         UZO8ConUOOyVnAEEt/RBq6+QLBC6ZNzyC9kVaAQ9EraG8X2cSoV2PSXf/YfkvROrDQ9+
         +T0A==
X-Forwarded-Encrypted: i=1; AJvYcCXLNEghDDtrwkKNoMsKAeyf3bWpP5NHtGz0+57lFozEO8HDzK0qyY0AguC7GXFeA2xGGaofjc8bSv8blGQY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zjqUbbITfXD3A4THSPNGuiP1tPA+02SL3N0plPbpz27JEiJ7
	/PtugkiAwFxKZp/x+tL4B9rWcUmTvQZo+smfHz9cKxi6enSKaXE92Gbw1gKu8pL/sqwzvphdcOU
	TfwGfNUouxXjqJotwzF0/oAdRKpuQxoYdS8SFHEItWuTqTOnAf4jazSbLGsG4uDZ5S6dW
X-Gm-Gg: ASbGncvXlpqUq4vOKZuyTtBfaD++vBxMtVQ7ghOTHGxomMAWHr5bN9DRX1aCOeXIw5J
	7+jEGDYNh44070PFlBK10oWoZKuSpvttKgwQunxsOnOgVqB0fgEp702KV/hPG9DV1H+E7eMhrpW
	Kh0cKLaOIeTcJQjBJ0EPcgVnVbj5F772MTAYdit6pgKz70I7hjhcr5oF80ncA9nL32oRX7Oi9kr
	z1xvRwa2xkT9nYR7qfFmNSeIV13PS5TAI3d4yjPm+4c2XhsagCJGxnF1T1K69Bwk8ALE1VLccD2
	MTtDs2uXzgBezxNIFEg+lepVLHKWVzNFsC7xVZlJwMAMTOeyC7bd4bqdMxjLmP9IEY3kCq+yJQh
	dyGwrtQIhaWqn7bxMxDPrSVJNPGvllMGqP/B4wfSOhOPHdmblVfBc
X-Received: by 2002:a17:90b:3885:b0:341:c964:125b with SMTP id 98e67ed59e1d1-3436cbab0aamr7852a91.31.1762538028566;
        Fri, 07 Nov 2025 09:53:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIy6+m+Kcij6vt6xRBKl9qnx3FLlJzZPykP0VRDcFrX0sJmh9Kw6gWYAzSNXcrbLBEDZWv/g==
X-Received: by 2002:a17:90b:3885:b0:341:c964:125b with SMTP id 98e67ed59e1d1-3436cbab0aamr7819a91.31.1762538028061;
        Fri, 07 Nov 2025 09:53:48 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d11e2336sm3278610a91.1.2025.11.07.09.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 09:53:47 -0800 (PST)
Message-ID: <13f0921d-d018-4c5c-a01b-9d4c89d3a4ed@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:53:45 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and
 uevents
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andersson@kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
 <20251031174059.2814445-2-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031174059.2814445-2-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE0OCBTYWx0ZWRfXx7SLmtcUcOXJ
 SBcaWGzMp6lgyXA44MjgW6Gj93ncpFRQ4G7HZ9Wt657o27lJ9HShj4S9gYznrFzMVVuY4zAAxij
 JxhQb4r7nJrpb8FF6/crhvEQZTVCWOuqgPf9ipRDMeJYhf1U2cKVoKz53XH6BBpgGDpQFtO8j7D
 xxBjm7z4CcDNE4GW0yAWIX9XBrpMRCOGfqVPOIAAQRivnm2Kt6JOxDFTgc5XhrPR2OVimPdSc0F
 +b67aVIScA2B04aXFYhEAbpd/qmiGY/0CZ7a+DGcgmln6aKYk4BMvGwRHxQbhc4nCi6qZsIAdgy
 gLMYmxpjT22ldVaAqHdZLRbOZ/wZaEzAZoWmCpcrfRjscNmLG236eErN+PSPfMEotBb1LMteumJ
 SvsFEVwRRtuyjJSu33+9l9SAFin8Gw==
X-Proofpoint-GUID: K3s1je2G6cr62FJQESOjpym9cQD3QUW6
X-Proofpoint-ORIG-GUID: K3s1je2G6cr62FJQESOjpym9cQD3QUW6
X-Authority-Analysis: v=2.4 cv=Q4TfIo2a c=1 sm=1 tr=0 ts=690e322d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zlVAGa64hwdQekzuOJMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070148

On 10/31/2025 11:41 AM, Zack McKevitt wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Expose sysfs files for each DBC representing the current state of that DBC.
> For example, sysfs for DBC ID 0 and accel minor number 0 looks like this,
> 
> /sys/class/accel/accel0/dbc0_state
> 
> Following are the states and their corresponding values,
> DBC_STATE_IDLE (0)
> DBC_STATE_ASSIGNED (1)
> DBC_STATE_BEFORE_SHUTDOWN (2)
> DBC_STATE_AFTER_SHUTDOWN (3)
> DBC_STATE_BEFORE_POWER_UP (4)
> DBC_STATE_AFTER_POWER_UP (5)
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

