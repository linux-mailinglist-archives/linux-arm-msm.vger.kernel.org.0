Return-Path: <linux-arm-msm+bounces-100662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L4uHnQCymns4AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:56:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EA4355680
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88B28300D949
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42E930FC21;
	Mon, 30 Mar 2026 04:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inO+f772";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzK767XX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B683A26A1B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774846577; cv=none; b=QV/YSfAZKFPHhR3i1Gy/F6EjGg+1LOGMl6xZzMIxX+10oRuxWEb9nxcBZc8EAtB+2XEiwXVZudUrCNZtbmYrUYFnMu8ZZ7IcjHl4gL+pGCvgUpFCEWX2eOIhNlfh1x4/n2SeIlu/b1yV2bhhXhrzs2eCzO/eWUMdsyuOgANgQIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774846577; c=relaxed/simple;
	bh=xt4nL01wX2KqbENJVRpe6EAYvo9duFVqMqTp61xxKmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0S3sv9iyI8ZHBKL0nbVAzGeDRTKSE+7VK+ul3I3ALh9WO59+yU16J2xqluxZI65nCGOSOhcC+EXCyWFRcGCJV/VaAIJIX7Wg6naKgNAaPUAYt6tlOF0qsbk5L/Aj2TJxW7f2Jtj35IVl8glFvDCZH7MhL4y8zJOY/RXUh9l0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inO+f772; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzK767XX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4cs174086214
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9t3pLpkMMGLYxzJ3ezf64g/HI5nzm3mmWJG7tU2bnc=; b=inO+f7722dcimJsd
	wbC+BXnBzjfufYRq+3NGwh2+tckSBOQM7q3UlUMKR315VmequwC+Y9T34pu+HFyj
	dH4XxYO0046yCRmgQyPv9Cbdk1WsFz1wR64TwVI3oFZeho2+F0uY+3rrSvmV8/hP
	c74PBp/5QU/lf1+Q4K5qW++p2hqusq7WMi++2k+PlCWhw/4jcQUe9OWhz66cxgEr
	F6F2JDmq/Kx7s/ZrpzV9ScRyeuzffKeWoYB9RzJOTKi18chDiaQPPiuqAn5V6TqL
	6JbX574PfLBk061KDQzRrMzI4zArTuSb7lbhzMYyh/deeoZSKB3YkukMeGG/G9oD
	4Z+0wQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67714edx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:56:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso2913796a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 21:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774846575; x=1775451375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9t3pLpkMMGLYxzJ3ezf64g/HI5nzm3mmWJG7tU2bnc=;
        b=NzK767XXpaj34lUgfFP1ZfXQQE76XRuAjNUF/AoxtkayHHwfSzIabNdinqXEidHVVn
         kA+TW7lcCUVPplhSrS9mPJvNrOwUGExofjIGn3ILsxMIJTMVffHuHOMTch3Is4xfj2pL
         SX0UnhodjQe9bbyUO1Tx1gqVeSQw4Cy11rP6aLc1wIGzWjxibD313LG9oz4Hp5B2djW5
         iPccqKlFuTuU3/8KYeCTul88aI5bVP5raX+vstKg+VeBXVL6cqYOEHYEExdE3aJMGa9x
         1rcPB/bn5aAsq0Ifu18yt647+OxzFgowaDwm0UiMOwJFovMF2ZJg+qGKLUYckquINFSR
         ujPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774846575; x=1775451375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9t3pLpkMMGLYxzJ3ezf64g/HI5nzm3mmWJG7tU2bnc=;
        b=J5pMXcMXRb75LTa4ABYMz6rv8MiD9YM+oBjzlppKpVdqdVSb2/RYJBYHN0gNlZUA2C
         fCJhcCQXaJUph4oj/1MiJ0YvgiYInqIW00l07EHZ/EM5any6gU3BJgbXZv6FP/Nerd2Z
         eq/S69aiDEqevVH0eiGw+Q4j58+7/M7/iVu2RPmbkRmWiRn585GGpymy+D1E55o1GRjb
         S+s77iTXYUyS7StqH61LBT5Uw8FGEZFuaf6Z+R5Oe6kt+lUCVCSdfDFGtzTUnGRt7atO
         ypPLRg0bwFD5vUQ0PLnZBZmF9FJk2knyryNLvii8GA1ACaqFbZ9nXV5OB7nrQ27ZcH0R
         x22Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrUQEiuJBp83cd/XstoGH2u+ekcv6AAjEpNiOGaw093joOPF43/Dw6zaaUL7Qkm+EPpnsW2KTAu2+ps5dZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3UQy+z+/a74qQj07DGZasCF41UVYNm6j/p6IeBmZUqzi0kyNT
	eqMG+IwTz/Efe/tPZp7pV+QPCMOQWLwxhIiNIM9Kf+VNG7iCF8FD8fm8tPdPImm/w+02qrZsm13
	tNotohcwcT6+ablWFTPxLD4f8PBXXP9fHfg8CLK1BjuGAOB/A3e4SANhbDCerN8yf5WlS
X-Gm-Gg: ATEYQzyujkQ6omO4m7Qf4mhTPMZmpBTe6hHwisgVR+MwdpTyUukXTlTS9DEJT9fU8QD
	PrD1D1xtKEDmqNuckhYXOXcXBsnQBw0F/AGenhPOaBUsIVI85FZmqjR4zxuYMjcakI6aPTY0o+y
	FF1L1dDGUw3+Bq6V/optGjHU4UEELN4RpDuNRTHK/La47JXd2b3i6Gs7n5fBNoJuXh/H72SeGMZ
	iDZ2EPyFKrhBnKILnBJzWNCv+3zU/vEH7R+g/0Au9ZHkqsm69zZmgOXJatuNgcHwclRBuE1QU5g
	MeBl+2EJdnqK87Qe8Oo+/5xI/S0nwUzFVLAHgA9+eabzm3wUL5FSZA70d9e4oA4n0+j/eTQBk/G
	wrR7uUTLiGji1iVcmBUMxFjWRQhF2SqC6sUITnuAFzr34646wC23GzOjYNhAzJp3Jug==
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr10608127a91.4.1774846575418;
        Sun, 29 Mar 2026 21:56:15 -0700 (PDT)
X-Received: by 2002:a17:90b:558d:b0:35a:329:73d8 with SMTP id 98e67ed59e1d1-35c2ffb03bcmr10608102a91.4.1774846574965;
        Sun, 29 Mar 2026 21:56:14 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm5755629a91.9.2026.03.29.21.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:56:14 -0700 (PDT)
Message-ID: <095ba19f-90c9-4410-9b65-607d29413bb1@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:26:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
 <20260325-ipq5210_tlmm-v3-1-3a4b9bb6b1fc@oss.qualcomm.com>
 <20260326-marvellous-premium-grouse-d1d1ad@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260326-marvellous-premium-grouse-d1d1ad@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jr9dQrZc_LrAet75klk7WAUhQ2QY-iqW
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca0270 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sbCXkxCAo7F0d2wfUiUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: jr9dQrZc_LrAet75klk7WAUhQ2QY-iqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzNSBTYWx0ZWRfX2B477vpZGgP2
 NIx/6EFwZF3cQ8smhTb7ToM94vXPLjiJAvoofgt92ZoN7YmzWLPkIaHSg2hU/2cE7T5f8+4iMN5
 z/IbkvIpdHJRpB08z6qH8jN2xs+JP3Qf+50qxUcG9jNitdPzPyBcJ9pgXtJuWAtFEh+qF0KM2C1
 zM3zL2pS0G3D/UaMbw1d6Q1+x6c9vAcLmgvdNuVhwhwEoOHCCp+92x/JGmp4Lx/J4Ifhsdibp4f
 JIffOcRLJNDIhGDr4SsLkyTO/N/Y6eSV8Icw980nk/bkzSrdJ96ySNvwRn3p8Rp+wzfZKneNoOg
 yGIbfCdad/WksuU7pU8lx3ydPc2ItLQosdwrQO7asn5tpPyd/b7J7pgSCAARSYv0OYxR7wJL+Gq
 /iUOd8F6oW2gMYI2HK+gZQcvWrI1B2xx3cY/8muYY49QLmnLDTaS5aLxhj9KWBMIdxv/PiwZ2hy
 xaLrpZ1+GeZuS0F89Zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300035
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100662-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1EA4355680
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/26/2026 1:55 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 25, 2026 at 01:05:15PM +0530, Kathiravan Thirumoorthy wrote:
>> Add device tree bindings for IPQ5210 TLMM block.
>>
>> Signed-off-by: Kathiravan Thirumoorthy<kathiravan.thirumoorthy@oss.qualcomm.com>
> I don't see any differences here and cover letter does not explain that.

Pin control function names are made generic for some of the functions, 
so I thought I should drop it and mentioned it in the cover letter as below.

Changes in v3:
- Grouped the QUP SE pins instead of mentioning by function wise
- Splitted the PWM functions which I messed up in V2
- Audio primary and secondary mclk function names are expanded to avoid the
   confusion
- Dropped the R-b tags due to the above changes

Based on your comment, I understand that since there is no schematic 
changes to the binding, there is no need to drop the tag. So I have 
picked up the tags in V4.

Thanks,

Kathiravan T.


