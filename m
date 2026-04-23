Return-Path: <linux-arm-msm+bounces-104304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HrlDe0G6mk/rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:47:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A29AA451760
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AB9D301ABA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279C53DF012;
	Thu, 23 Apr 2026 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAG1VZ7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZG39+YGg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53582FD7BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776944835; cv=none; b=kxQIuEyiJA0IclGxNXJ2k3rHGFc1knCBY6+8qhEhQucalQcis/1v8QEsYVpwdy8sXgPLesemCV5NPX5PsbFczUJtFlGF4rfXRNiT+qtVOmxBPq5Y9wodttoTccsH1Rv3aEhM/HKGojofCnKDxXYG9h2xMLVsl8g6ZVdLMnc4LZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776944835; c=relaxed/simple;
	bh=pf4xPrLptPcZTsfyBX3J3PHDd8iI7szlgq61F0eoRWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddyy+7Lpg50AvNPNQNDmTlE/2d36RxAyvbZXGcUM8VtEVzLv+G0QtzDRvaPXJG0Kn/a1efQU0teZS/a36p8DxkB7IBfsIGT1HhFS29WfSfnwqNhnDqBYqQGD7xq5udvelndQCmAORUzJWrUYs2rxdyJ1KbnrcFXbtE9EPzP+jO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAG1VZ7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZG39+YGg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uL5p987855
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1zuWgAnUulF9AbNuuLh6oflt6IMnhJYD6QjmVzuEsHc=; b=UAG1VZ7woy9X6KHE
	CEp+mnLPMnBnJs+kB7wBcQ42sm+/aOxGW4SlFitPofZULHADC45S/7V5KT+cQ5tK
	O21Iyy9q/NDTc3ADsYgkW0eRQcSKXZjk5v3iBk3k8CZuy54PI6PwFuj/PiSOZrKH
	zeX80xDE7JfbGJ+nhjYMfRp9BzLwwT/PszJlGFK4MYvvYbJR4X5/V5ZzgwRx9QiA
	TgFtoYeZn0MmublGZSsnbW7K4/xZMT52mbDtl1lO8S7P/urJWlZwr/DKceQ5mnne
	/TV9a+U0R1sFmdjX7rFYzGfdWgfvYgZ357Dliah3FUBnewaSo1XK1hsRJOTXsM4+
	44LcgA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q3sjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:47:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so69117415ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776944831; x=1777549631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zuWgAnUulF9AbNuuLh6oflt6IMnhJYD6QjmVzuEsHc=;
        b=ZG39+YGg+7/KxrcaJySGRFDNVY8qVjUpyeMwrrWdF45PsJiQr6nlYYOvW6yniTnTDv
         559vSbz3eDkdzobWRXgKckJS55tKg7Df6X/ArdgX7bpL5YDMYCpXFDI7dCrDAj6/n9E6
         Q+vJfAXfuH5cHLAN0HUY32TA5lEU136GMKDq/Z2R0FR+FqW+vZFLJuRKROenoorbqD18
         5Ln8RHpESXfYYl/VQhhh+qw6rFhvZUyoX0m+I/DQRggqR5y58b1IIu8nNxHu3o8sbwv3
         S4AIT0TUvsJ2Yds7bWakipJ/NIXaltt+Cv0TBEYYpJjieWMXrf6ZXgkvKF+afVuyUy5+
         xY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776944831; x=1777549631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zuWgAnUulF9AbNuuLh6oflt6IMnhJYD6QjmVzuEsHc=;
        b=TDMG9oMpztJt0c2vGZwDZHHkYSaiQcf/fD9Az157OcrYsSwcA9tyO0ZrgRCtYarQjl
         S4DZ5/wyx6iCtrJl7jrKK4D4FyPFTGRhI+ok+2AZ4DibUWLZETHAfPsWzhL4RfaWjPvy
         9oKW/VLYvK9yPPDx1LMCCj0cFb3AYwRSoq2AcB6x+y1BEepab8KJ7B5YbIfB4eRnh3QZ
         W8uBqICYiBYizeVp19/gGQVadnRjw5Iw7ZCePS0hV2zZwI5iqPStS9ZhK7fPh7Uc1gG+
         p2TEEaaD7Cg6kFooE8MF2qxlCfw/RMOejf6FGwYrMwnDfRgptFIFd4zOwjD0yiEN5X0J
         bZbA==
X-Forwarded-Encrypted: i=1; AFNElJ/Oavi9YeIBWhKowWkdkwcJ3n68/HzgqBrLY3X5kxwYAxs/xFJsYlqqErVTxskewNn5ouiDm6x9JaL5/H0s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7NgQk/ZgaK7g6SZdyFhHmiQing4tYdr8B+3+Gm3eQflWmUSAS
	er9RGXLdqI42x2isyKsOADEY3Yxzf1RkL6bcg3nRHbEWhdQOSVsMysFeQfbemuYrfx2o9Hqk2GU
	3F2qe8LXmk8PYhJlu1CQo0h+cqSk6KbJwDVQuoKjvZKcmK1spoLPPK+UQdRgZLT384I61
X-Gm-Gg: AeBDieskagBgWE8SAzMtipR1kkRuUCxEqTt3f75xjXaKDns9zfWL5V8R6nLD/FFIqNF
	etpiOVpgWqnDWhIP/gSDqwAppEKmrWS26lbRhMi44HRJAyL19HM0/Z7lQw/MXhNTvg0/RNyApsv
	Kl/kghW//aoSdjtVlzzH4rCc9wWXMI5IPqS6u19nCrJb1L7cG5hFL3kPteX34H0N4HOz/HdKA7K
	apLa9cO62mIe5o/Lid5EG7SazCntGuo0Mo0PaNxJ5GYeL+ZcEzF9h/IYJtXJafLBabPun5tgZTq
	UVuVG6rnhohyyRCqnpH9C5AIbhr/Xf7QwYmOVFN47SNS3TuV2CXoQydbeZNNvnhHRy9agEFS32Z
	d5ccSN3TYO8AOALuodTa04MHrHxTWvVYNvdoM4WpAHtsbaOYpQou3Z3KQw5cuTsI=
X-Received: by 2002:a17:902:aa98:b0:2b4:5cb8:99eb with SMTP id d9443c01a7336-2b5f9f8808amr205116705ad.27.1776944831273;
        Thu, 23 Apr 2026 04:47:11 -0700 (PDT)
X-Received: by 2002:a17:902:aa98:b0:2b4:5cb8:99eb with SMTP id d9443c01a7336-2b5f9f8808amr205116385ad.27.1776944830776;
        Thu, 23 Apr 2026 04:47:10 -0700 (PDT)
Received: from [10.218.6.76] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm177109095ad.77.2026.04.23.04.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:47:10 -0700 (PDT)
Message-ID: <6379a497-05dc-4cc4-b1cd-1efad3eff2c1@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:17:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
 <z5bkivkfvr642qpjujpqzwpozpqeqhs3vsqcpjfbkgipr7csko@fs4hal7fvqnl>
Content-Language: en-US
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
In-Reply-To: <z5bkivkfvr642qpjujpqzwpozpqeqhs3vsqcpjfbkgipr7csko@fs4hal7fvqnl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69ea06c0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HsTIzs3zK7ntyYVOL3sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: G0eChfw6965chT1l5YJf31_Wo-ecFG5n
X-Proofpoint-ORIG-GUID: G0eChfw6965chT1l5YJf31_Wo-ecFG5n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNyBTYWx0ZWRfXw3l+LBsGcyyo
 udz+vWcQ6qHEqrmUN3rgAhwfiUsNTvnOZU9J6iofZzZAsAa/Kmy07+YHNDjcbiFY/Rv5CU1RU2z
 gNyOL7uuPJp8cYIMVkhwATI6aLUDjQZ/AjlOfq0A7YGSD16b0pM2FopTHvFLUKxD+rXaUkIPAZK
 9NgER0oYl5707oRItjQcHLxqkXMXIU2+sTioulmhZgnGMCBlm2RCFM4l7e4xQZDuSLAvp4VtiWN
 HvEvj8NGcrvNq1qpch2S3SequT5W6shFkfl8H5FGjyqYSsmLk2HxdqcHlG1Xwia9/HFD/9WmNtd
 9lKHLWcx3oSM4SNctAfEzrYNNBTNxZzyu1hm6ZH5+FlBuDshO4s8A3o+q0YWkL2Mjwt1kqenA0t
 zQfCEKS8JG193Z9gcALqn01SFJZlxde2ZpKic7624agWt3Yv4R3ogD4Na1zFL3jB89prWjve3ut
 Z2ZtrjVqrNkY1Yc5PHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230117
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104304-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A29AA451760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/23/2026 5:00 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 23, 2026 at 04:55:24PM +0530, Navya Malempati wrote:
>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>
>> PDC interrupts 122-125 were meant for ibi_i3c wakeup but qcs615 do not
> 
> Is this something which changed between SM6150 and QCS615?

No.

> 
>> support i3c. GPIOs 39,51,88 and 89 are also connected to different PDC
>> pin to support non-ibi wakeup. Update the wakeirq map to reflect same.
> 
> Should there be two commits instead of one?
> 

Removed the ibi_i3c PDC mapping and updated the PDC pin mapping as part 
of the same commit.

Thanks,
Navya

