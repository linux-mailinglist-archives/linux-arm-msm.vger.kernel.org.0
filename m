Return-Path: <linux-arm-msm+bounces-107856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBmoOngLB2oLrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:03:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC954F01A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F0ED531B14DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E3B38F925;
	Fri, 15 May 2026 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BS0qiGxs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqcIWpox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E73CE4BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844487; cv=none; b=KUPU+6ip9YOsjDuYI5c/MUzNg/TlcWCddttV9SJLMPFQQJbeLMxLkU29mvYgaLySpqgVGo6qWF2PAdJWtV8AHjwl6ZlkyBhdDt1n5VR4RSVlgShzk0sImXkDd9sf1uboZCUlkLk0r5IvNNcNvxGHkk8WP2dmEyizISLAmwH4+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844487; c=relaxed/simple;
	bh=MGYvN9/C1dG8nd0mhdkOs7JIPjaMEapnUVdAhEo1FnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tL0LeOCRlHQA8Cq/F+OY9RokFNQ8wAoph1Vk07f8BZonHbo6x0/SNRP9jT0XhuH784Y1Z3jkaPLaEX4Wz8NXjvGuUmDG2D+yniVq359iC+FZ5LMnKY4l43QYOMUQOZKnusAcbkeX9VO1qBGlazEsr9Cy/INu22NEPl2hoQkajXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BS0qiGxs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqcIWpox; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAsqW54008602
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+5SIsNGL8MEySb42mrk4qf6hk+QOdAbm+JQakA/KMIA=; b=BS0qiGxskdxIIJvL
	LaoS1BZrx/iXGupCqkXUSxwQGD/mj8MD6TZoFC+I2a2WcaKO8XHfb4ZivB/pT0tI
	cdVvcbchc2jc5+cQXT2Mk+zitKaCqjgwrkRV56EZk45R6DFIzgVdNsoJYgLYIFZu
	y4dm52TQKklz236E2QWaSsUWS6F3OIevhkdA+CYvCIXqK4YnyH3VNlIE4buJyKX0
	NJXYjA15jmnpopX/CwTvv39nLlrSZId8mam9XaK9VemVH6ebHqmh9lxDJzTs+TOd
	j7mtGXGYNM6Nr5jOicTmonaah7zPoMLzTAdmIES/2f4mJPKTTacFp/PIjUaJXSye
	vDqyPQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su225-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:28:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9568c79b893so393266241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844485; x=1779449285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5SIsNGL8MEySb42mrk4qf6hk+QOdAbm+JQakA/KMIA=;
        b=PqcIWpoxWYGe0EJSAgAh7U0Z1n8eij1lJfi2RxGG/EGEDpTHNi7GPvmYG8NL1n152/
         Jk9FWpWjTC9uRFjDldnBLMNJsY4q9MWrg8bhY/0rQiMvXsb2WPSeJb7MmnsnwXJWxouN
         csusoRvWHyoGSczUQhf4kLMMTTi6cW7CevD8sRtBSxQxM+D9ysj2JP+62cuS3r6kDXiu
         tJlixHdMo7GZ3QfoPxhg3yaGYHjOi7nC6M2blIQRs+0ImI4z4PxV7hn4C98IRyL1/j77
         5Xdqy4oZl10Wo18kipJaDMf2llpUN71duoN8TBLBMvM1TMo8hJJysJdihRVTkrewuTEy
         f0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844485; x=1779449285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5SIsNGL8MEySb42mrk4qf6hk+QOdAbm+JQakA/KMIA=;
        b=lq2e9KUSafVQxBMwTQsXa2/YdQyuhQq7tVSM+6TozNvTqU05AJ900G7kUPCncNVpME
         8ncxUjQmKX6en2cqqNWOv6m+gcG6k522PqAr/Dr+T1h6CJj0x3xzESTxrit28tb+jpdp
         gz15BN3KeX6SzmJysa0NQhjcy4ouPDkOtHZyEIQPckkcpEXTiK0vGfqmMZjikYNZIVdk
         TT6xk+lCVbto/7z505+7kh/0ML28bHVv7E9h8rTVp0BoaaaGDat4+NUWyujNHdeJ8fm7
         iFMwfGe+mx0Lya/ybblaFAq3VKfwLfZR7+AWq37a6wggvTiMkOKL2rDLPJPytMKLceh8
         CpcA==
X-Forwarded-Encrypted: i=1; AFNElJ8kKyW8x9YNvROo5dz4vEJVWT70ByQ/B6Cytrnvvkc+Vvfz8guABZoqxR9VabXjIOYA028KKCbnVBidqUGa@vger.kernel.org
X-Gm-Message-State: AOJu0YyXHbuof613PnKlj7TX5Z9FV/eeaJaTlXBO2eYJPHELRtYX/5+c
	w+zGjrjJ/0fTSj9xcr8lgWcQN456KgSMN8DTZ7JnOYWxiab7A0Cb7/2Z75Xj8A6nesTUk+ZD95b
	54TM3Ghenihx5nkCGHQPX561QoAZv9hoTrkaOt83XOQjvHuVVPsqnDEbkzsKUzzR5LCxB
X-Gm-Gg: Acq92OFWK5uc1aNSjND2SCQNFy7BFEQK62SlHV2jziw2GqT5x2LEW1ZSwSMi3Jj8Ofz
	FKmiu4GAHP/6X/uf9jiOhAjJpKiGzi6D87mJFA/WbOWkeK/ONjfYB+u1/ov2/aAmSCdFnFUl0oH
	v5nmkyJi7CIoJc8bC8a1cEVrxMVhjg7+8y8GIOLJMwSPIWQliIgcgwHgUvg1Fe6bP+teotwzdDz
	X+3X0vX+2S/0gjiLLcOBr4D3Q4oJJTjac4xWshN/lUuk0c/MSiZg9NC2HrFXZHLEiMVsS1id9XW
	wiQrNNu+iaAcl1mpEFP7EG7wRRzoEKfE0NWeSxdmMggz8lWs4G7FSas3IB5jwq2lPycJQJLY0Au
	tc+2CQdamq8RS9v+AP1aYxe1PZesppbd1OTgUm2a0cJZ9ASEdQlf3T6+fpOgGPM8PieiWyZp7oN
	whkkc=
X-Received: by 2002:a67:ef86:0:b0:602:b87a:3524 with SMTP id ada2fe7eead31-63a3ffa8809mr439695137.8.1778844484419;
        Fri, 15 May 2026 04:28:04 -0700 (PDT)
X-Received: by 2002:a67:ef86:0:b0:602:b87a:3524 with SMTP id ada2fe7eead31-63a3ffa8809mr439689137.8.1778844483971;
        Fri, 15 May 2026 04:28:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e35ae3sm208702566b.46.2026.05.15.04.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:28:02 -0700 (PDT)
Message-ID: <abe8443b-9871-455c-95d9-d16975c0fbdf@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:28:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Support for Lenovo IdeaCentre Mini X (Purwa)
To: Mostafa Saleh <smostafa@google.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        maz@kernel.org
References: <20260429141815.827157-1-smostafa@google.com>
 <5c838838-00e5-45f2-9515-edbdcddf50ec@oss.qualcomm.com>
 <afOP2xXmEpV1eI3Z@google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <afOP2xXmEpV1eI3Z@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VWw3ABp1gM_PIlrgq9QGOQ27_aHl2Giu
X-Proofpoint-GUID: VWw3ABp1gM_PIlrgq9QGOQ27_aHl2Giu
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a070345 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=FLMWTHjliotF7KI-E18A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfX9CZu+Tx8SvzQ
 vTkbOCiUx02wAsLFZQs6Xp6ejvVF/4t09DzBcEXlPF5gbGaKI5gkmudBVWpVuHtJdiEtOtwK2Jl
 meVvxUWmBlLbl/HJBWedWgZqZmSyDz05Rgbw9uHio2oHCY6IVFUEt6cSnnbIyO4cU5LpJqMmEGt
 HrEdkps/AexTOcwU50Fp/FXPTm0+kEepmDlHSijsmFFV/yWLTYnIR1CWe8mIetONL1JzyrOE4uN
 CgU65LPUR8UrzSO+4e3Gz0YiHQbKIT1kdjrMZ+BUCcAJHrit/hHwWRVYPrH3a3se8H2ww0GWn2C
 MIfDYSIcR+scEu/wyqVgcbr1Ry1wyvUmti8t09Dbw2Pd0kb5t4eb0x19PvoKq+EzOgVlFyHFo6+
 NLdsuqVXnQz0k8hBTnaADpCT2AEaJBIkhocD9GwRBy9X3GvP8Gwx8/881RQbUs760ymphEOGYf1
 eQWXfDsk95ewATbwM4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115
X-Rspamd-Queue-Id: E9DC954F01A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107856-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/30/26 7:22 PM, Mostafa Saleh wrote:
> Hi Konrad,
> 
> On Thu, Apr 30, 2026 at 06:48:33PM +0200, Konrad Dybcio wrote:
>> On 4/29/26 4:18 PM, Mostafa Saleh wrote:
>>> Hi,
>>>
>>> I see that recently the support for “Lenovo IdeaCentre Mini X” was
>>> added [1]
>>> However, unfortunately that doesn’t work for my device, the board
>>> resets once I try to boot the kernel from UEFI.
>>>
>>> I believe that’s because it is another variant, as I have been using
>>> my device tree for some time[2] which is hacked based on the crd
>>> device tree with some trial and error. With that I can boot with
>>> PCI/NVME/Ethernet and USB (there are also some other errors in the
>>> log related PMIC), this device tree is based on purwa.dtsi unlike
>>> the upstream one which use hamoa.dtsi.
>>>
>>> Are there any plans to support the Purwa based variant? I am happy to
>>> help with testing, but I can’t confidently send patches as my device
>>> tree is based on trial and error rather than a data sheet.

[...]

> I can try to see the differences and build another dt on top of the
> hamoa one, but that will also be based on trial and error rather than
> actual knowledge, I am happy to test patches if you have other
> suggestions.

Hm, I ran a quick diff and even though there's a lot of noise (mostly
due to the same things being named slightly differently), the actual
meat and potatoes aren't very different at all, e.g. the PHY regulators
are the same

Could you post the full dmesg with both DTs?

Konrad

