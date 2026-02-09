Return-Path: <linux-arm-msm+bounces-92232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INF0K26iiWlU/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:01:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C932C10D4DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0ED53008E29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EC1318BA5;
	Mon,  9 Feb 2026 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSOeTDXq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUj471A4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B54271476
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627688; cv=none; b=K9tMIcfNv2rA18DB0jl0VNMDkPMnAxfr1127llL412QRaApWXYSz0hjT9SRPe4TGw+WAieaykxqKlfCJ3gOxvFh0AebK4sgkbv6wkVtk7aX67EytxDykfPX+0hTUxZrYw37bhjTxnk7xp3BgbawswgtrswPf9E83g4KoAvI7P1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627688; c=relaxed/simple;
	bh=uSgklIfTBTRtR8NqjKKehdwNRJd7avUzqLCSPkGtOKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrbV++FDMnWc+lfJNjoo/jJr7mbiUXouXWCdMl1eaKYdx4ewRwyaMPgpbZtgcDVvCIfvif42QpC++iRXur5wmLkQ9Lr+n/sJEuhz76vECz9/fCc+15MPGVj6ShgwpV+ajCkPCHMjfugDUlNO0wlX8S0T6nwmBQbxOy9E6x+9BOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSOeTDXq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUj471A4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195QWdF1476711
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7IaXF97jLdxchN2ika1fIfI0vekMRGY1NwbKNgogDWQ=; b=WSOeTDXq8+TZwlKF
	NdH0NRAjhWcLkaYXHwwsMhpsc4CEzVwKZMdyTlO7hiQzAWu5H72PualL9Wm006uB
	VKjfOlpyc78E9nGErDCqWG79d7wJiZMpZKlq6lkOppUSBXX4B++tlFO3U9VcjTIM
	NliKRiRRcByyLqBIkuxlR+1P0HluzrGCSox35RPJUGC16apVmFSIp4U/FoI8zGDF
	cE6XuJBJfBPawySKAQ3vYma4xc3O3YkjvzJtjA55jNhZWxz/zIQLRX45mpa2sAns
	zj3UazYmKVoo2eYNr+DtnTD/bIoIlA5xsHKTljmtuwCHT9lodA2Ammn4O50+BSG4
	y197+Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c64hnkx4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:01:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ed0a070db3so902926137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770627687; x=1771232487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IaXF97jLdxchN2ika1fIfI0vekMRGY1NwbKNgogDWQ=;
        b=ZUj471A4ulrM7lAfJYq6T08brn6SoQm0CVRJFfgMInDvF5GPhsY+47dLubw8ZJcIEE
         oPt4wOMSDIgbOLgl57K5cyr/1NaZtAUctwvGN3kNPOxFM6VjyTMT23CPTPxOHgNJgCsY
         cQIvI2cqDTSeIq+R+PZArcDRSGG85mxGVbFZ24F3sWlquNwKVv6nDZywDwO/xRU9KyFF
         wGiKOSW5CjxZFTgx3DEoGkOQuCm8k+UXR2YCd/7cntXPGXqoDHIXdkV/hhdOBtOFbZWr
         krV3MCe9w0FNdD5vgf2HcRzziLdm+4IlvtDwwyCJfarDLB8syDPcpcer3BIoLtUCzGgx
         G1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627687; x=1771232487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IaXF97jLdxchN2ika1fIfI0vekMRGY1NwbKNgogDWQ=;
        b=rHEIP7omjcQtB6nZfTb2Gdhk3KH+8Ozg9HDXniqjACoeomUt4R/EpV26avzUA9ltIN
         ZyGKuzdfhWn0HIy3gIe9ws+cmqSTqVx69MSOiFhZWk6viivDUBSF3l8HrldLskLNtwnJ
         qjHkCZqnNz5L8LmmEKLCg6jvkQNb0hoimU8YO3t1Suen0EkST7WgXn64S4JaSIjH3Nq/
         W+DzsxojrgVKiZFDOREV61dB/Tg6dKC2hIkwhuXgees/bjXHO02jr4JWRMD9SqWyDRpx
         Ri4TffqDr1fynZgHtEpqELnJwKcmB+DBelIyP8FpxtX8lFGE8cyo7zscKYLajkRHqwvu
         5w5g==
X-Gm-Message-State: AOJu0YznN1LHHFgPhg905zpzkHvbn7RWt3n8MvoPFajrgSs41KlwVyCC
	Iu5Yn27eP/wG7rj8ssXjO3Iv5FfYY34ZhbEi5mr3XNz9951tMOZ0Pw4nexFn9DAqxB4oBaExlr0
	4SeUXLhlUnXmVfHPOCgvyHLaWeyPrJCM01ENuYIj0hilg8pQaGBcsP9OjtFUApOhZULjyih8/ZM
	8L
X-Gm-Gg: AZuq6aIZ8zQHm2fQogE1eIXZJFM0YXWZbgtxyy+t/FAxBjIoMeCM14OUzgKxDPsDCH5
	+VyGXYjNcNScrlIOY7yGtRWlL1fFZ2WqhPOZTbhO5p4YdEK6/3Cq1CDOw8d3QMFxx908/txOhR9
	XFSxCZh7a/ihJnwTyG3sJvt6Pi54rjT1uO/e2Vs9J/tw457PVq2Msp464xuqBxYYZiam9euB+c0
	OGkCKx9RpkyJIBWSI8+BV8tlm3utSnmuu+moQWNcIq8IY09lNiOCqqUQd7iPVYJzyKnLeaWuuSv
	nsS4FPS83+vvDuS1z58Lx/8OPOlG5twDoDC9jCFReQLtHi1cyeGCstsZMX+iwDSaXZQyauJgVkU
	y7kD7rKCtnthQ31onA/Fyh6E7ivLGxIurHoPv4qfKhGpg0YlFkfNjNJ2duqWTfhg+BYw=
X-Received: by 2002:a05:6102:441a:b0:5eb:fc32:9361 with SMTP id ada2fe7eead31-5fae87ca0cdmr1532108137.0.1770627686862;
        Mon, 09 Feb 2026 01:01:26 -0800 (PST)
X-Received: by 2002:a05:6102:441a:b0:5eb:fc32:9361 with SMTP id ada2fe7eead31-5fae87ca0cdmr1532104137.0.1770627686477;
        Mon, 09 Feb 2026 01:01:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ef25388dcsm295523666b.54.2026.02.09.01.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 01:01:25 -0800 (PST)
Message-ID: <22bdcbbf-8691-4dca-b8c2-06e43a81bb82@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 10:01:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add ACD levels for GPU
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260207-sm8550-acd-v1-1-53d084c58c9a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260207-sm8550-acd-v1-1-53d084c58c9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mu4Ck9ljDfaYN6XPS-E_gGtUjgQZ59HH
X-Proofpoint-ORIG-GUID: mu4Ck9ljDfaYN6XPS-E_gGtUjgQZ59HH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3NCBTYWx0ZWRfX4lxHTQDyht43
 cewXxh7sWB+sdPBqCQ8JcX7KeW/jSws5UMrIaKzbEIxB/hk3IiVac/WJ2frFTt4cPi9bZGhCxE2
 ZI50MihIMp3UbHXSSOMFqbnTrF6Gc5FHggGst/BhQ+7gatafoJ28Aeuc+SWt1vR354qV8MzZ+je
 52/9DdLX9vvQ3CGUdjRxzIQitH85PKJiLeXwbfjBL9Jtf4PQjx3DaRyGzy9tYQVtGNxisOrWe7A
 Z99d+g1V2GFL5ac9xJvnzC1nduo1I/4Ss7VXyS6/5YKdGbTD8xEMDvUuLk+BEAH7mCz6BXsJLQ/
 rjAXayuhKHo35PyRKZpkdsoIbROj3HPHLKuBdzNvmqw+laSghrQ4y86XDg8ZBUQhfF/y+1Q3rXn
 9O6qJN3r5AF7IknRCg19pMFPB5YNY8eV81yiHFZ1m+EZHg+kydd1O7ZXwARav9EF4sZjBxIDaeE
 cNUw16Ac5FZdcO3wSYQ==
X-Authority-Analysis: v=2.4 cv=SNlPlevH c=1 sm=1 tr=0 ts=6989a268 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5Lzz3qiD8dwKc4tulZYA:9 a=QEXdDO2ut3YA:10
 a=J4saplWpJU0A:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92232-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C932C10D4DB
X-Rspamd-Action: no action

On 2/8/26 2:20 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Update GPU node to include acd level values.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

