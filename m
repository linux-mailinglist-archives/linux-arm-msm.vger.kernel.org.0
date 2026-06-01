Return-Path: <linux-arm-msm+bounces-110486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JAvLXbfHGqBTgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 03:25:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0B66189D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 03:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 856433004914
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 01:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B961DDC07;
	Mon,  1 Jun 2026 01:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qpq3vd7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLJeDwRe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED4C175A88
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 01:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780277108; cv=none; b=L0T5QcLwrTmv0/M5LHFLiHnMR4gTZKLrUqGfkeqP7j2fRfELwnM3BxKEZ8x+JX/Eg5Wgz3fFHB4RldE5WWpayveDrNk7obwySeMXhqBOW85U5e2gAf/wa1a+6vUQklFZz87u+a+2Ocm82HxlXPLr98ACPXrMMtfwOIoTQ3xLGlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780277108; c=relaxed/simple;
	bh=HB/H8kRdQnNVe+iI1fetIkgGU9UEJ/VrxvkBLPDfr2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzXAe8z5EedlHv5923shG+bXVljGBQOc2ABRf7qGP1LtpPo3uxOqCuFOump2F7qLzr7vNNvzrvZ8Th7mNtFTX9k6k3j4fdZLNcSyUAa8mTnbPv75/WtsniX1HwnjptL7wRr4MspFiBaM81KDowkWe9yt2PlFSQy24UcKNd4bXik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qpq3vd7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLJeDwRe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLuxr14055885
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 01:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8NIdcfqGLBBvLnTrYiE/G8uxoCpse5IEp9i9iU8fM0A=; b=Qpq3vd7ZF92EmwVz
	zDQjxNlThx5pv6e4zscdPDvLr2i4S82U0XrkekUyVoLk4JJmSbgu4GyJExgz5h9z
	u0XTi73u4ORYREkYWjsAfQ84pbMFywpRlNZU19kRADRhNoz/JQ5twbFrCnTrzRgw
	XKLsfvd1qREwzmKR5yooh+5ASLAvt+9nWEL4IOxZL2VRo8RCFY4DXiguoOmrt5H1
	oFSsNkzYfxeNjKUHnL/M98ymDXkPVLS8QVsvUEzdxvGg+tntiN+1h08vq/0YqoCG
	N9ps251a/IjEyxaPAdukrMWdBr85SDeAM53+zZlAhuAbIYrrBvKsUyHlrly4gokD
	sxktmg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efux54mfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 01:25:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso1723429a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 18:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780277105; x=1780881905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NIdcfqGLBBvLnTrYiE/G8uxoCpse5IEp9i9iU8fM0A=;
        b=PLJeDwRem+pP63lwgSn1Mis93QBLinl+NbYXewwUfNN8ocE0TwFeeb4kw0KB7/X9oh
         EiFTids6zMDKnJVSyrOC9kWYtVp1yBQfCkCNJR8b8RGLOtBY3ijRc3MjL8nK4l04ZIuB
         yfiP5hnhqjFXBVmmsGNBiOS74GEi1v8zSaqAVU0wmXsqnmaU+IRS8rQK9SkrAUrJIE+4
         pGHLkwA5DuBROfhMb2sfv+3TjicVau/QSpl4D0y2QHFIt25tUXfpzou5ZuEm4Ugdsu6x
         3rO9FUkC0k2xQwYdnPzjFTiNdmNScomqV5kk9MMD04uYMrUcUek0N/NwWLSNxlrToQa5
         zUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780277105; x=1780881905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NIdcfqGLBBvLnTrYiE/G8uxoCpse5IEp9i9iU8fM0A=;
        b=ZMyJtP/H9osLnTQn3UIT/oaV6l8tmGFmcuqi/WR67KQqnDFwuY7xvEFKWqzxq4q/M7
         PLWOiS7K+zxdDTzV4P0N4bi1GFH51UJcD4AJeBoinHCroZDqSm7S2OzkechsFCcZSVOo
         XuPp97Dru488RDctLQUpPodRkfpQ6f3WcJX212j9iHrh1RBoJs89dEApFwnH6dpamZ2i
         lnuPLQuRc8ddvIHki4/6JihSVrQ0OzCWPA+GlMeGo/8QL7YeOtu/JgkxL98zryJVd0+Y
         GAfikqeFoKjclxm2PLeCjgzwqGU3MBlh9QNLbejL05GPb7+gY4i7a5gTohYTqXyZRyA5
         nY0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+KOui9uu//E+i6ETA0hyWiBQXINT0Y4tX6ZSebfdHkHqE4SB2Ciw4FiiwrNsuQoqVrxlQROOJ3RC5xWIpr@vger.kernel.org
X-Gm-Message-State: AOJu0YxEdDnfYdssCwO5uM+ttpRq8zdyTVftyeQUc+LHtU0Qq6AAmBZp
	6qBk8AzCKzEOqG6UReANffhDVkQDPbzrSYme4Yypfq+3pw/qAY7Tc8zlKTKbs7ReLYZJ6PtCBx/
	n/Hs14WNdiYhI1hi5RsDM9HRwmF9guHf4vrbbPwvhiHaTr6HPxGyKHBOFHIT24Ce0MA2X
X-Gm-Gg: Acq92OGtyYvwiTrK2jfYGTuRKwqB13CzSW2cCVIig3qRTDQxmb/y8ppJ+eOlow+nrsi
	j+NJAHTF15cJ+I7C9a0n8fe/94FebcDP7TDg4IzBt/Z2miV5mIb+FHwjzu96QkdEemlKKDdVwWn
	LLjVx1ibBQM63p6vBYFyo6vMVvcOlgrzek0mhjLlE7BHSJFbiNkJ32XvFW2LCfFnHoN0rdPDw4h
	4Zfa7wLUthpXrBgxw+bClkaXz0xtKYdAtysx/WBXiQ7imRf6zqGJ9ZAtXqF8PMkDAfp1proQe7O
	6ixlyasqNdAChxC+n28brNuwJsIMZ4DFWTTnGAd+fOxSzr9c6bebUQyHFWSrv5G8V4nJbigxcNh
	zuNoM2rixO8k4STIPFt2bXw9EjHNpPp2oRonjcrzSp+avYBizYPhNVXorMUgAWi+GlbaHpW2rYD
	ufrne8qbYUDuPFvr5pRmqvX4aM
X-Received: by 2002:a17:90b:4d0f:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-36c501b8fbdmr8019903a91.16.1780277105409;
        Sun, 31 May 2026 18:25:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0f:b0:368:7c0f:ebf7 with SMTP id 98e67ed59e1d1-36c501b8fbdmr8019878a91.16.1780277104956;
        Sun, 31 May 2026 18:25:04 -0700 (PDT)
Received: from [10.133.33.48] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc65e8490sm9412967a91.3.2026.05.31.18.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 18:25:04 -0700 (PDT)
Message-ID: <c24d1b5f-c066-4f16-b4d3-e50fc2d40c46@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:25:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Maili
 cpu-bwmon compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-bwmon-v1-1-b8f6e189c3e3@oss.qualcomm.com>
 <20260530-finicky-celadon-crab-2cb4b4@quoll>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260530-finicky-celadon-crab-2cb4b4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1wGQguD-uvfYXkOD7U12qH_q1QLmyIVy
X-Proofpoint-ORIG-GUID: 1wGQguD-uvfYXkOD7U12qH_q1QLmyIVy
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a1cdf72 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Vd5kcbO-RD4PiU99qyAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAxMSBTYWx0ZWRfX+oU2wYFdF8is
 +DWfrC9k0E4TSY+VzBW9LUPDwvAkILM1+i6XtWykrpWSok4Pcn4CqGzIenulSJKi8nXe5EWbqsN
 mRv1LeblfTAgkkYj4+NwzjJmMBrrObA8sp3MotVPkI8+HrJsDTNK1Xx6piv9Iraqt1kCxjzcDEB
 M1XPWqXhmvlfL2qlDp+RP8VAAiAxUmBLaioI9hpM2oYMSK6KKQ6JK7GPWj1fKa9MBOpGWDzJ+az
 bq+fiUxYmceCx4eowwh3Kwbxw6+0mZ3KI3YdQj0KbMEbVMRD270oxG9GvknNZqw/v5op3kEMkL1
 vsi2BJ30qsM1s2BhkAbnRBI08mHTZVYoegAh1jAa9HD76rWwVllXqZ2CXoYGs4Wbe65VQh0Pw4a
 F7e/eQUVtLzOQaA3yNU5nLzneoLaJfDrcBwl9sBrAyAP9unYK9f7ZYqowbLK7cCmql2cHQkIY/x
 v9jpiG0SxoOFPd/6Vng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010011
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110486-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D0B66189D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/30/2026 7:20 PM, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 02:19:53PM +0800, Yijie Yang wrote:
>> Add the Qualcomm Maili SoC compatible string for the CPU bandwidth
>> monitor (BWMONv4). This falls back to the sdm845-bwmon compatible,
>> consistent with the existing pattern used by other recent SoCs such as
>> sm8750 and kaanapali.
>>
>> Assisted-by: Claude:claude-opus-4-7
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> All previous comments (from multiple patches) apply.

I will update.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Yijie


