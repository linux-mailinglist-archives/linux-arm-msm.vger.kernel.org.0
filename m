Return-Path: <linux-arm-msm+bounces-104061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKScNDSc6GlNNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:00:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D864A4445AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB3A230235A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DD03CA4A8;
	Wed, 22 Apr 2026 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7uikPmy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFrQ2m1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFAB34DB6D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851677; cv=none; b=qk/6k/lmt4sE8p7GN0pJcIuEKtgm9YhORcTe5kmOgTX6qJ2xc8SWscsaFBgPWhyu6HZSoRq5dajZ/msbC7JV8/0NXjACZxIIbEQWsCVqCQEcbwSx/qGS0+F7q7oIcmvbxasqLhLusG8yg/QSsMs9nNIym2m4WR1LD7gtTAKwYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851677; c=relaxed/simple;
	bh=MKNmegGVJLDRN9jVOMYyxHdMwkw2Zd18rVfSLiRXSNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oh3ugPAttI9N/4Hr4vUkWo2F/pnEqQCAY+rJj2ODwk2xhqMYwKlEvFlqkFIFleRc5+XRfVZAHCr+bme7/C6fPRhARZiw7eHIjvwQrw51JwOf+U9CrC+Gd4LxuOyu3X9ddaA14M/8lt/1gxnNYdmIHri6Cv30UiSsuvlIlPUQS8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7uikPmy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFrQ2m1G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5H4ID4051049
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAtj7A5eiI9lqq774F43KPQibsO1yZwbXiCwBAPqRT8=; b=o7uikPmyEGyVDQSB
	1OAkiocjRjIPfDGJVgyArKPCkFWbMOCodpxTlvVh0CiURKxhnsE8x9ZMlxjGuC13
	WJ/E3hIw4lVz0xQ7zLlboIEVCh5qrW+CfOS58veOiwdi8MrPeQwINIvLcrv4c+fd
	441LlHG2gkdzqfxWvpQB8SlbW767wypvTsu9M8nL2j0ewVCVOxCFl3r9WE9aBogh
	UhBjSv17DPTsKCarDYsGsGfOyJ69KTZbZeT2hj35V/lffvxwoUeeFip1JcXyomsy
	xUuar4YdYh2h3jdJhTIu0u/+56MucGzKducMly72a4qxDDe8SGhTyzrzjAgNiR6B
	xZt4dw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfjwb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:54:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954b9b5da7so14526746d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776851674; x=1777456474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xAtj7A5eiI9lqq774F43KPQibsO1yZwbXiCwBAPqRT8=;
        b=NFrQ2m1GdcCYPo/fjtQ2iQAte9SC8ipIlAkQkV03PR2nA5X8cDp3WXgZEZ84tY05J1
         YRqD2QPFrBTjdtHlrbz1QQMGm+DK8aLBInX5+WbYAY1HNAfJyQQ0yStBTcQVUMc7M+GL
         Opp2OCdanoyI+CvLsc3E+xr6VULp/oxbQ0J6djJxR2akON3uJvfipLeu43COtBH1JFpe
         koiA1YxL0CTWlKSknAQToAoqDROJHp5PgTyG+W+Vx8Vh2oO+3mTG8/MBnHUaY48otHiZ
         Q9eJ396zTb5uHzbi1uwfVs373Y/U6p+xPd/0BJ/p1jiPxpUaVeXgqSg/FYEmpPLYnhzs
         0GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776851674; x=1777456474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAtj7A5eiI9lqq774F43KPQibsO1yZwbXiCwBAPqRT8=;
        b=Hv85o3wce3S9pvB8ozxnpfa39B3q2UqW2atnXES798fdUpMBcNLv9Ao6DUM9PyKpgn
         Ptidy/YfRHCYkrNats7xgX9GS8MwNYOq3J4jdqFQanEFIB0wFzLt3IZ8Ml/H+5LThJDH
         3oTZ/gk8KvweLK5iT4Ma5v7LkWayGqDOarBJspyXu3XehWq14Evx7iNPuLgInid09lqV
         rnh4FSgpB6NZKlIdMf5DODZxdP/oR5J5LzWvtlJ8tiLZr2YCYolKO20vD7myn4734F9T
         xOKik3PfaY0oqp9wevCItgMpHWhAnDYAy1iOwjcMrXfzHtLoOvBsohXoq0sr55dwc6jp
         xXaw==
X-Forwarded-Encrypted: i=1; AFNElJ8+DpOD1KzPySj2Rhg9MsBtTvbkwfdjxRnQjX2fvEhoOyT5Chz12j4IwVNHd1serrTFEZqGv8bO++TB9n+x@vger.kernel.org
X-Gm-Message-State: AOJu0YzxnvtluyRJKT7zo0EYcmFyYaqE7uwisLSxfPoYZ/dgYNcFdF5j
	d2+WQM6ZKPAAmZ/gKpslWxWY9uWazVT8ffRXxnvrMWrVNmGyLHkj7t9cfOV1m7JA0s3VkWdDUHd
	scDIOHGDmshZI8Upii+c03jyqyrKq1WOuKrs7hiWgibfjIRknPWbPtRO8u7rGY4XJnXaB
X-Gm-Gg: AeBDiev7qFR4oAuP+/EIAo+eSBT9Mcyd9jFEZH/X2manxPx8l75lszdVIrXJcCM/27u
	RertwzLNZgvNciMfhvEsC/EtvkCrQyvmxptKd9Mg4mNc6+rawuoe6q/AmCdH1f6i/6fNMY8bmrc
	EaIPIYC8lJSj7xysnqm8KlD10AYxVaYz2qDnWsVSp2L9eAJe3dXZ/qI06bPIxU9/tBYgju6apSA
	pG/QOXVeArQ9M+7nkJeegWDY3eFELw3mS2HycDE431JwDT3Gy9Oi/q8906I7GZbDUwx390rgSS7
	RjWX7DeL+Mp/kV3wVBAZAYXheG5klzVa79ZIeY8WoGNjg1DShwmtIbO9HsDsnEddyYfqlmWnr3Q
	iOvECzLd9wzgBZUJuZdaAmK6tGivtUgiyN4l6VU5hnFO1RcNJ0c9SC3q0ixHO2bflfzGMaxbuKc
	yBtk60Vz1QtmW93Q==
X-Received: by 2002:a05:6214:21e8:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8b027e819a5mr233907966d6.0.1776851673983;
        Wed, 22 Apr 2026 02:54:33 -0700 (PDT)
X-Received: by 2002:a05:6214:21e8:b0:89a:46fd:3001 with SMTP id 6a1803df08f44-8b027e819a5mr233907706d6.0.1776851673452;
        Wed, 22 Apr 2026 02:54:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c414sm519877666b.44.2026.04.22.02.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:54:32 -0700 (PDT)
Message-ID: <b21b1f73-881a-40bd-aef6-5c34aed0e266@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:54:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
References: <20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com>
 <CAO9ioeXT0jxu875jBsAbOVrDqonASWSmmxJbP0AiitXb-gUANQ@mail.gmail.com>
 <a967d7ec-66f7-4eaa-91e3-0a96e5a8ec7f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a967d7ec-66f7-4eaa-91e3-0a96e5a8ec7f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MyBTYWx0ZWRfX4TYbfBc+tFll
 sK3u6rU2e5ZrfquvWvIecK5SsUytZdvozScSD9YOtrMElb7Dfm2KlNQwKR2K3ALOgXfa740sv0n
 IA88SrPBPhLYulzqAximeot0yAD3HhyFk/SQERxe0UulIxIU9FzsDjcIbDK2ix8B8cYTL4EoK/z
 UsqpNnc7P4IgF3+yqCidKzNZFkIsD0bFFXEWuM+cqKAT0lf5UPBLvAkGzl6grPqLjTCuUmVSiJr
 DSv1zGahAasamxAqGTC65wRLXfVGHskcJnMHz01dJdvUTq6wpzEyLlNo9LvtGsWZvTOr+AcI7hW
 D2WSz2Srm/by+mqghcS5SkH9CbsP+n+Lb5CADf0VWHGpcdBvQ+UmdbPLYKGdfMMW8rgRjRvAhzz
 XsRq0g6P0vUXq+tQqrTFeshQdUbBCR3Kg/oJ9yerRo46I1r6MN1eWBtE3Zj1EitR9WGwl7WhFAZ
 4ww0WjCS8TG2AIQ5Elg==
X-Authority-Analysis: v=2.4 cv=VMrtWdPX c=1 sm=1 tr=0 ts=69e89ada cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TPV1Kb3VoT3DjyXF_ZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 6EsCwZkOvD1MlynecZPKbimFjOm1G1bb
X-Proofpoint-ORIG-GUID: 6EsCwZkOvD1MlynecZPKbimFjOm1G1bb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104061-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D864A4445AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 4:18 PM, Mahadevan P wrote:
> 
> 
> On 4/19/2026 6:48 PM, Dmitry Baryshkov wrote:
>> On Sun, 19 Apr 2026 at 13:16, Mahadevan P <mahadevan.p@oss.qualcomm.com> wrote:
>>>
>>> The existing DP PHY PLL and AUX configuration for the Glymur platform
>>> does not fully follow the Hardware Programming Guide requirements for
>>> DP over Type-C, which results in DP link bring-up failures.
>>>
>>> Update the DP PHY programming sequence and PLL-related register
>>> settings to align with the latest HPG recommendations. With this
>>> change, DP link training completes successfully on Glymur-based
>>> platforms.
>>>
>>> Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
>>> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> ---

[...]

>>> +       writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>>> +
>>> +       writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
>>
>> Are you saying that we don't need to write 0x4c here in case of the
>> reverse mode? Was that changed and why?
> Yes for glymur it is changed
> DP2_PHY_DP_PHY_PD_CTL
> Normal Orientation: 0x7D for 4lane; 0x75 for 1Lane or 2Lanne
> Flip Orientation: 0x7D for 4Lane; 0x6D for 1Lane or 2Lane


Dmitry asked about the other register - DP_PHY_MODE.

I checked the reg description, and at least for Glymur, BIT(5)
(the difference between 0x4c and 0x5c) says "take bit 4 into
consideration, otherwise let the HW decide". I wonder if we need
to set it at all, for any target.

Konrad

