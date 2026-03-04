Return-Path: <linux-arm-msm+bounces-95366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE4GH7ZZqGlxtgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:11:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CB1203E28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF9C3209706
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B524034BA53;
	Wed,  4 Mar 2026 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhhJxPqt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FWWClg4A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7349E34C14C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638845; cv=none; b=k6uNHVllgnz1lMCSXxWXcQipmu/bsBWrbDzmZf7qtpT8/KW7GbD5NpNaGERDeTeLFCYrFH+1AKFgZXSjp4NhsdgYf12UxGUEKtRSgYaQ4Lh4g+so7vZbznFLexHLUOzhWJ026icvemX+Fq2XFRkx7YR74C9nUT+s1cSh8R+WIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638845; c=relaxed/simple;
	bh=PMGzy0QIhL0vRpNSRHs+DPTQgWtI6ilhEm2+hq5tQXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ecgy1tYj/iAb7WhpnWnClVDeZyHyK2hbWmR08cvywUdVQ0Ssa5QpcMoJvMJ9WjMsBxvgCZVoVjL7Vo3i8QFBEWdFB4thx1KVzMW8fqnWvJV/t0n7TDCXrV9ndKrhnp5HuksJ5FsT5rHrPhlZ0dIsIXBUQFJ6ww27yRJuGXIcjAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhhJxPqt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWWClg4A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624ChKQl2861136
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 15:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BseyVlfG6qNLJh0pukGQEsnvFe0Y0lazqGGE1966Oz4=; b=jhhJxPqtA5CNygZ1
	hhZPBB3+4LkVrZ/2IrBlz01xpPZcQf7s7oC6SjIYsfGt8t75ZU9MVDVsyiG9iTuQ
	bKbHZHBud3w8ByFGzdYcbYGOD224Zhax+1lNSdGpV9M5OM3uB9CEl3/pbRnTjw6k
	2q1h7PP0/lRyiPHDH6ny9TD6TtNPsEmKMT6dzB3SuT2MiED3CnhKb9ZdTb9gJfFi
	DswqfsBt+T0jxAjHZYnGTIMWJ1zmZmvATvbSZDU80IpF8t37TWHENSC94fqaUHHx
	omg7a7zBtVUVXRqvPFp/z5iSGrjmLH1fH1UTplpGUVFFHhPepOMafiP5CNI/1/Zh
	kTEgsg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9mehe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 15:40:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4e20a414so175100085ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 07:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772638842; x=1773243642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BseyVlfG6qNLJh0pukGQEsnvFe0Y0lazqGGE1966Oz4=;
        b=FWWClg4AV6hqS2rfjwuMjD5GNjGZosJQnJJyvH0D81T3SNtyEiutRwiOi2eW18efdD
         70NlEmA11C7V9lrt4ElH8igclLttflkN03MUzwsL2XJPcc/vewfo301tyUL//sZSd9eB
         XrWQUCbqLZ7gANcKL24vFxfvHZIz34/k0PSE+vNUHhTkLTVSce0Pv9Kl32J+OO/HXGW+
         r27Jl429OajzFOQY/KLk375pX2ErPz6q1EUQkcfzoDGYZOyVbD+f1KjyzaIRK5F7ZKKP
         Yzy2FYIzE/5CaLntbrZZ2+CisbkDVQl/Fi+MF7BgfUk2BLL+Ay4JC+P2Vivoa7aneowN
         OROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772638842; x=1773243642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BseyVlfG6qNLJh0pukGQEsnvFe0Y0lazqGGE1966Oz4=;
        b=QjM1HN4HxXXBkgZ8Ae3VwJKJ8NQGH+gumVhh/YdHRrne9Lp+j58HxG4NzpLuiYhx+O
         E8/zkiNz+VdRlQW5GHVZ2mdwFjmbfDsS6QBmcnQtqsM8AMxWbn4rZC1xjN5AdioCbRD+
         GeqmqLks7JXFrAdqIXa1bT2XC6HIBiq3R45GZ1Lke+OoQ7VMRK8H5m5osUSC8gPmp1nm
         pQZs5/IfWfhsHAOl045ts3eM663ZjhUKNAprP1pBnPn7ZqDNe5Qk0C0rviPmma6KCdxF
         S/7jvjt1MnB++0rglDOASeA3W7fWn0GogbZivspCw544WBvoW9cNTN4KjTOjJjYo+kji
         K/7w==
X-Forwarded-Encrypted: i=1; AJvYcCV78lCUMc8g56RQ4wqglCoH68RvxhVZDNUdxCW/o8Vpw2ABqZ/U931fGXa4dtVJDp+BZ4/TYSJCDK85QBGV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2njzMezm127iVL9SwLrwQPpWD+BxR/TYSi/YeeUHZOizoo2A+
	nqB7orqW7MOYfQNYjQTrGtuyjfg9vpQjtcmp/ytvYYuET7gZDZGaPjut8iJ5Hv5pU6mIsnLrWeu
	KIDXYb5AvBZv9PjNeRfZc3UNQ1Ap39KvClQGDOus3uMmqfHqa4jJbQZOa/XuuHRRkR4MN
X-Gm-Gg: ATEYQzxjg7vJiMm5NE4ITvu/9wmNpsMSUTNbcdc9M005RbSQPIALfbej7mSKyUml90+
	YAMzlou5Y40wk6OL8HKzv0lDfnxc6i8lpmN/vVM1hCpYCBbtkTyR0HdXFxZXOscRD5IlcsKvGw6
	4Uin7fVQEA4ZYte+M4jQd0/+fNWSNKULtCw7IahJPrWncSpeAYBf1BcGOdkC7plrmraAgMD+hfl
	Rsrh7nbK0+CWdSNDxbzLZURgxmkl9BfI/aDudgkDExyExlBIsQmJkwmj/IO38qhp25j+O/Ak8NO
	5Qx/1E5DgUe7UpCJXOwBaC94xGU5XD4JJp6OKToCKGzaPfCwmIzDwymSv58sRMKql77uk0GmSxs
	2fJy0DqmGSg9ohTIvfoL7krOFZ7sIi8ArcntRe3pdBtpRKabZiKZXJw==
X-Received: by 2002:a17:902:f790:b0:2ae:4c9f:4a5a with SMTP id d9443c01a7336-2ae6aa01e74mr24774445ad.6.1772638842218;
        Wed, 04 Mar 2026 07:40:42 -0800 (PST)
X-Received: by 2002:a17:902:f790:b0:2ae:4c9f:4a5a with SMTP id d9443c01a7336-2ae6aa01e74mr24774095ad.6.1772638841774;
        Wed, 04 Mar 2026 07:40:41 -0800 (PST)
Received: from [10.204.101.56] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6df578sm202097025ad.81.2026.03.04.07.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:40:41 -0800 (PST)
Message-ID: <22534cad-8940-43c5-a7b9-01d002943093@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 21:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] media: iris: add iris4 specific H265 line buffer
 calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-6-850043ac3933@oss.qualcomm.com>
 <cbwz5wtd55enswdi2zvvy3d66nsxlemyzdypheibvljnewmkax@kybx63aveepn>
 <ce80e60e-90ca-415d-83af-4fe2e86ffd91@oss.qualcomm.com>
 <hrjwyqz4r6usqvxhnsvtap4byfu2zvumji6whudda55vuym5yk@u6s4heswm4rc>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <hrjwyqz4r6usqvxhnsvtap4byfu2zvumji6whudda55vuym5yk@u6s4heswm4rc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyNiBTYWx0ZWRfX4t704eYx750r
 O014uYDBSBpYQbCfASfcpCou+ZcsVzJ5TIZ7JdAIy8/1wpkzLrkTIzXOAk4XRrJ5guDKWEq01gc
 kdKr3jZvMG+glX77LDOP6nvE3d8+cpUW7kz0Uhg68Gqfb5jn5wtuL9Lb/7j1JqHNvZXJ5uUm8tJ
 yR26lVMBmpyiXeLObiDYfOjS8cyjCHwMGyf7sioGtQ1zEbxI/YbjLbII4mj1Fn+NW3FXxasYSkb
 YRYekTni08xB3BV2CCKU9r/VqChdA5EKMez2yv05DxKLnBKykMMgkKt19tMQxlO8J77BL2sL9MQ
 b1KzsFfjWhx9lXiRwvwHnEoeqAoeUCGSHbtMPNo98Yj/+Ln0kSb9miLvZQJLIxJqLPL9IgF2Qwy
 4zdSLqGBVBvg6bE1inwIJ2u4+cArv7/KenNSwaVT8WkbAfUx9qYPV5syu5FbQ+nr5Z1tXFbRBzB
 6qS2t/u1w05ZOeK8J+w==
X-Proofpoint-ORIG-GUID: kaZn88M4gTmnAVYgMGdF4de9_97AywuW
X-Proofpoint-GUID: kaZn88M4gTmnAVYgMGdF4de9_97AywuW
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a8527b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=_JvEU8PJbtvYPaoBJaoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040126
X-Rspamd-Queue-Id: D3CB1203E28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95366-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/4/2026 3:58 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 04, 2026 at 12:18:58AM +0530, Vikash Garodia wrote:
>>
>> On 2/28/2026 1:58 AM, Dmitry Baryshkov wrote:
>>> On Fri, Feb 27, 2026 at 07:41:22PM +0530, Vikash Garodia wrote:
>>>> The H265 decoder line buffer size calculation for iris4 (VPU4) was
>>>> previously reusing the iris3 formula. While this works for most
>>>> resolutions, certain configurations require a larger buffer size on
>>>> iris4, causing firmware errors during decode. This resolves firmware
>>>> failures seen with specific test vectors on kaanapali (iris4), and fixes
>>>> the following failing fluster tests
>>>> - PICSIZE_C_Bossen_1
>>>> - WPP_E_ericsson_MAIN_2
>>>
>>> This reminds me of the commit fixing SC7280 support. Should SC7280 or
>>> all VPU2.0 platforms also use separate formula?
>>>
>> for vpu2, there is already a separate formula
> 
> It was more of "do we need separate formulas within vpu2".

vpu2/3 uses the same one currently here [1].

vpu4 seems to be using quite a different formula to consider it within 
vpu2/3.

[1]https://elixir.bootlin.com/linux/v6.19.3/source/drivers/media/platform/qcom/iris/iris_vpu_buffer.c#L313

> 
>>
>>>>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 51 +++++++++++++++++++++-
>>>>    1 file changed, 50 insertions(+), 1 deletion(-)
>>>>
> 


