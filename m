Return-Path: <linux-arm-msm+bounces-113377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bO++NacrMWqDdAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:55:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3336D68E846
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:55:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UY4WjJaW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jd9bsmAu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113377-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113377-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAB003144A70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D4742EEDD;
	Tue, 16 Jun 2026 10:52:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D835D42981C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:52:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607176; cv=none; b=XIjcFug0EO7POk3+N5wpBkwV90TWWcOtM4tbp2hXvVM2jco3KljtqALmZjUnSTED6DERAYt2EMYqrbnfd9IJv2fK5NC45ei5dw90rvxoi4rf87S1/LZX7tg0hofaq6q5P/VtBdaJfxQN7Uw+ECnAqn3mNObEl1bfvjHGU+cYtxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607176; c=relaxed/simple;
	bh=+CbG4B3JxMY7uH+JI1+n6IET9IrEjXhSBpbN9epGDU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVH8FSXSF1n8wnELwitmCS1Wh2Ie+G9jIKthxiHE/MMQuC/DUZ4l5Mb2/LMiL/tsGDpFZS+8yChLinfI3wRjkTXc6wpzZppdBfgQtlS7st3bFfbcv9PgDEOWlGflAcC/2OfRFl+z36omwCPqpGuNo8L6ifuHt1SMfNnGv+l1boI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UY4WjJaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jd9bsmAu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9WYI249596
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aV5EdZ6TwwmY6Bn8F8Ucvgg5WDTVmvSF7rfydXeVao=; b=UY4WjJaW/kcm1PZe
	M9KprQPUoy5O1Ew/r1yFOTB6Znom1XRSz1f3onWETtUCyFUw1clgx9RowUir9gh+
	tfPxun1hmRt9W/DLL4Exz5jeFvnGeBMU0LFgZQmw8AvN89m1TjKOe7xto0JM8gJg
	NMGOwxtF/qsAo+ig4o+P60vu+WBIExElcC7Rf/TW7T/Qi31K+RFHTsgh27hZvYhb
	PjEec9zmKKOjcoKCv8b6t0gnVNWlppZg5NigWbhsQX65xVYeoEHc3wTiJV7xGqoy
	YETHykrGWU2zRVtzyj3HrJFHYxpdJO4Rsbj6QwR8H6mPMLVRnKaivbzqk4fRHL8p
	x5Fnpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs8jam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:52:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-917fd2bafdbso73291785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607173; x=1782211973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aV5EdZ6TwwmY6Bn8F8Ucvgg5WDTVmvSF7rfydXeVao=;
        b=jd9bsmAui8SLEWr9BBOmjKgnhvDs6tOo0QTW4awXELnp0nF0+8ARJM5ctz8Cm/YmLh
         xWC8hfbNinuEjyWpstQNvEfXQfTCQeFJLZTU5Epx8NXARMPUX0WBSxCM082DMoevK6HH
         HpzSZdTXTx67UC3VzD9I9uirH0SgFBO+sVDn8CPQpuPUcRx/czw6yeVctcRVdxfx2GCA
         WXbTYMpsEhtcJbxPEa4NuZFZPBrYWE+GidvWdNULypBb69VRKNLDlGZQXzDQ9VdAbxtz
         t+qHp4e7NyKpMyxktRznJ5O+x1NtMDcYgx08f6BaBKQYZf1zAcfFpUTdzOFejOWOeuU6
         k6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607173; x=1782211973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aV5EdZ6TwwmY6Bn8F8Ucvgg5WDTVmvSF7rfydXeVao=;
        b=j6bEBXgg4JlTeQOFqc7DM2gwpS3OV+8IJemTeEOAO0rYPm6L/i48gUfsmkxUNU/qVI
         kdagZulKiYxM8C5BPECp7/KdwxZOqRT1AWgg0i5/TudMXeQUutinK6/4BHiEaUCMSlgq
         8ODj3QRZiFUMqL4HN7MGQTG6b/c+nojQOqSCuSYcjcSZ2Kuw6jkzLrYzTUbA3MkmtZ3T
         cGl7hpYGI+hc379oYS3d76yzfUvcxs34nspdvZ3BDacHLXstqJBfce/3fV/b+0WeJ88o
         5MU2ZKkYrYzuXV3Tdsl7uTZgGRaFCNaDhhXdNMdscoGM425W7qCfhANWTwRNZb1Gg2fW
         U2XQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OUaMfnIgtdHRKGABnzK6k3IYIRS8Pbja+lVYRTQq3aFORdzQZsTFBS16ghmD9RxhUjG+QeVpZDhavLtGC@vger.kernel.org
X-Gm-Message-State: AOJu0YzuRSFUGnuj+AUGlW8xQ+XPC1zjC/lv7YA6pYfSmZCbKowdzrrv
	oC9gaba+6+IOvBp6+/p6eRCuWTSr4sCreC9vd5tr4HsIOcfxJaaQeddOF5RA6NNxmxKTz8uRbUv
	hm1ZYo23Gi89w+V9IdGzM3pi27yQ8z9P1QY/8U++B7/LNFhqwkTae/MILfLvUbUoAWSko
X-Gm-Gg: Acq92OGn4BPYeM4S3gv+u4CqTbNUltjpVT8ijB6TE/8lDz+yT0Rx7rNA3pJVsAmuDzV
	JbSgX+o7w3NmK+b4AdBykjYQPYqRJBmvwV+RzuJu5amlZUuY4HxqoKhbDHC6T4TQg/BkcOgQ1cQ
	y4oAmnetsGUYJjPR+PNOWlM3SgSsXci8HcDtX0k8jV6S3IFvhSnsexoXoHydJe58UKa8bdrA/jI
	uHWe3DW7wHCu7A/46ngLs3ZuZYQUXB+djch745GllkHhSjnUH4tzxHX3yi4dqcZXBzR01hk0wKU
	K7ANzD+rqXBZjD7moVzui2l25aHHA70+FmCXGkuBDG0ifBBIBB3JtxER6DjGDfcp1qOT4HiJx1+
	xEgAwGYRkRphG+q+VUzJBmetHFwxzY8IX0dt5ujck1i/f9w==
X-Received: by 2002:a05:620a:1791:b0:915:8055:3f9f with SMTP id af79cd13be357-9161bcdbce5mr1719230285a.6.1781607173053;
        Tue, 16 Jun 2026 03:52:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:915:8055:3f9f with SMTP id af79cd13be357-9161bcdbce5mr1719228485a.6.1781607172664;
        Tue, 16 Jun 2026 03:52:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dbd7sm615295866b.29.2026.06.16.03.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:52:51 -0700 (PDT)
Message-ID: <1b30fd97-b298-435d-83a4-944e536bc8d4@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:52:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
 <aimlsgJssczxBGhQ@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aimlsgJssczxBGhQ@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O1LAN02BrWUCAbitK-rT9HtumV0eKrcX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMCBTYWx0ZWRfX+3srTeR0X4bY
 XBcZhHgKh+5gOjW6VZjfq+eSPcXVT3JtBS118MjrAIBCBC7P072DG7DQ4CSs2n/5ZaaK6unX/Ym
 VKQ5EGzc3xqiUdcjEd+Yi2dPX871r2XmTJjDvEcZWrPFKLex9exuQBU85YnfwTNH6hnbRTkIP21
 VsyHoz10ib9VeKz5P1yHJY3w/bU3/jMXkjxbsYaiiDPz5JhLe2kq46eDiIQKB0+iCsam//fnDi4
 8zwbx2jpKgpMNRZ+ET3k7/zUpW2pyQlMAH3s/8qnJbRBCFiFxeDwHCu5ztcId+9lU/eB51NnGlR
 lqaNyEoVLtON01rdAjL+6yiw5Kk9J3dSSi2V8ogprMhCB+qzH/dXtcgPUkCM6n1Hq8FNydelkqE
 jtFa6/HXhZMx1FA8b3u/8tzZWhQQnkH8LjxnhJVBK9TA7NbliXcWbqLBkygXeH7fHpQmBZa82j+
 B8BACh9DOCjLxm/quwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMCBTYWx0ZWRfX90xZYVBrsMk9
 uQARl/KEAnBohWdSMMiGJWK11cZgEDE0rA3z44h241BBtRcGrlC3Z3WfZaF6ewmIeWoEV+tqb6y
 aQFiOhdz7YhAn5t8/jZgnQZUJiGG++s=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a312b06 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Uo6mbPUbqXj1CD9ImokA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: O1LAN02BrWUCAbitK-rT9HtumV0eKrcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113377-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3336D68E846

On 6/10/26 7:58 PM, Stephan Gerhold wrote:
> On Wed, Jun 10, 2026 at 10:43:12PM +0530, Taniya Das wrote:
>> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
>>> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
>>> match nowadays is gcc-msm8909. Looking at the differences between
>>> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
>>> definitions for the BIMC PLL.
>>>
>>> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
>>> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
>>> used for GPLL2.
>>
>> BIMC PLL is never controlled from High Level OS (APSS). These are
>> controlled by other subsystems and voting should be via the ICC for BW
>> requirements.
>>
> 
> The driver doesn't really control the BIMC PLL here, the PLL is defined
> with fixed/shared/read-only ops so it mostly just exists to model the
> clock tree properly and have the clock rate readable for the PLL itself
> and any downstream consumers.
> 
> There are multiple drivers that do it like this (e.g. gcc-msm8916,
> gcc-msm8939), is there a reason why we should drop this?

My fear is that the kernel may have stale data at any point.. perhaps
unless we set CLK_GET_RATE_NOCACHE?

Konrad

