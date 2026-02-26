Return-Path: <linux-arm-msm+bounces-94289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O94HYo5oGmagwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:16:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE4F1A59D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A530330B2DC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3B6A937;
	Thu, 26 Feb 2026 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADcYTt9E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCtpEsnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449731D5CC9
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 12:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108155; cv=none; b=lA76/LzJvFocTZoyCpii1dh/URab1/hpRNNCdy7UfHCVgcREarRiJaY6f1JqfG13LtKQ/rFRTaIVX4JqMUMwy2nLLSVAiRIR8fZpC1GHt+SezqMbOJn9SROYf/4tS/CjA23POsg34614kxYmUnxa9frtm2Ofdw2LOr2jn4UEdUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108155; c=relaxed/simple;
	bh=lXFzGCAdVLAd5URIMznq+00idVT7o2TBbY32aarIi6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3THYzeWN/IJoIBLVMlTWwiukj6GX7alZ8NvWf+QEZNViLM2K+bmI5rEKiUO/uR01ffboFuEHxtBXg9Av8jVsGSCMHWUxGaTzDD6opbnrM/lhcHKh3lLSh1jA6XOn6ebqTxcnMKkZsNN1fp93Uom49Irc1atxJNqutp3h8nsWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADcYTt9E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCtpEsnB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKps3339775
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 12:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vX5qcDAni9HAJLNi0K0MLyXHwUQcxdvzrBmliUoqx4k=; b=ADcYTt9EN+VnIw0R
	Dh/Ko51ROBcDi/iTPY1WnkLkbIcU5ge9mLTPCkrH7rozcUjU1XutnFQ29dN0ZVqE
	pqZva8W4vSqiIXXOp2HIlydTUmnBeqBYCVSw2aqF7l+vhp62muO3WmP+kY9RYTg6
	q7DuFbcJJCSWpvwPqaEvBDqtNUqZesWpnUVgu/HtTwOeOMzS1x3EatxV4hRdb5hX
	B1DunGyPEvvY2qJNL5Ytg8w2bcLG017pKxofNTh67B+VMWOCI+A8xg425aA6O59X
	A7jrUpj72msLsF2vdaAziKXRRlMCm9JEZJeYLHqjM6bS4g+EVJG6oQUbxOsEbney
	5UzusA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0t3m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 12:15:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3978cdb2so53136685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 04:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772108151; x=1772712951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vX5qcDAni9HAJLNi0K0MLyXHwUQcxdvzrBmliUoqx4k=;
        b=iCtpEsnBip2djZdCyU0i3i0dFfD02m3Pep9+wWKeDs/8TynAHHCK4gvfhfOLXUqYzl
         +q5f1f5zNgOpBH4dwY9GgLsi6mJhYccHQBHNBpTZYcKqTK/49p4TmRSeakEbm07DxVCP
         by4MRj5CWMDJGSeE1qiANNgKbcwzKepr+aicwttJDsBDF6oThWFpFiw+x0tPPP7r/lmI
         ojijlYUtW7AKuJsM2snu+78ZIjb79hgEB5zZaciGK3juOVmWy0pkiUewLZh279Ce1Zke
         NPtlOWEh2dUFd/7BGF7xd7CtuG/OXT5VDQAvUrKnWMG5uOzGjINV8xhLvccpHpb9hrAl
         jHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108151; x=1772712951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vX5qcDAni9HAJLNi0K0MLyXHwUQcxdvzrBmliUoqx4k=;
        b=IV01DaCLGJustEo0JdyIIRXuRqEoGTa7woI9Ai9a7aFQ09a6FUG9YOTpIZNsphDN5S
         I9BdcYBcF2xQaTII8z7NdsuYaKd/1aa8zTT8JJDTcgyCfGkIzHvgoiK4tpZtkz9bHzKs
         PqbW1os4i9zKhddUqMymJ6rwcLPyXB/EbEvO4qI6IxZ/UGyKkznckfyE9/SwgYro0aH8
         W0CAQTO7O8TJWk5s2vuwgHzrNXYp9hiWs3S5Ohkyyov5VbH29i6K7i4I0MXPS58CVmJq
         mqJXvkPVWUV/4s0aqRtg4sI15VnJnFC9Qjp/rCuXxaJNG5mLMncTB1405lOatL+wvbYo
         Kc2g==
X-Gm-Message-State: AOJu0Yzq1jHi6P9z32cBEEnFV+Lu78qKKjSxh0315KfnNVKDed8Qpcdg
	N4TwtphjxNrhdOLt2gK5qt2vvVRcjKNK+i18982tOuWOYbJMA6xmeNgPLgt+iTYOF5lunIMLAp1
	M+CtzUSMuNXVgeoqkUflSYYt0ADQevwQB0Ihm7sMPZGgdIjQOPN3tqxS3m1//zFPD3ECu
X-Gm-Gg: ATEYQzxZ3arDdawWOTotey6NuwjhpW4z/lXg006K2Sh3CUIO8xmzfqrjXZ8vC89+sPU
	DISNDGApjnnkSbgpr2t2uoKJkWV1dGRZZqWJycDAwJjVFz+tybPQVPEEfUI/Omi6JHGh1iw8/W6
	SG3S9x5oTVO88/0Ja59pcF2p5Klc1KZzwXMLTcltVq7fkdLNVvQ9fWPBvBYOGP/7nK11pi0Gw+Z
	avf9uEdZLTxE3eAg5MBDSCCUh7Cg6HyCE/UdxbvPN2yspYO6lses84tJoUq+kX4kiTrAoCMja2w
	HSJsZvjn8/5FdvrY0gjuFNs0wloqSj0PW6r8UrqBc6ZCDkZ2mO8sGYwofVumyYsxircvxpH1mzu
	kOd4eL1ljRj14LF0OCO+pZoIyZSHKtg1Vkt6y2oC9KhaH8AXXbH3oL6QcfIS2uZaiA/OlwjmP9i
	KICBs=
X-Received: by 2002:a05:620a:4706:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cb8caaf296mr1765671485a.10.1772108151238;
        Thu, 26 Feb 2026 04:15:51 -0800 (PST)
X-Received: by 2002:a05:620a:4706:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cb8caaf296mr1765668885a.10.1772108150750;
        Thu, 26 Feb 2026 04:15:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd4695bsm436468a12.12.2026.02.26.04.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 04:15:50 -0800 (PST)
Message-ID: <e544645a-e113-4ff0-bb1a-3a6577d6a83b@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 13:15:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth
 support
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
References: <20260225091700.286108-1-wei.deng@oss.qualcomm.com>
 <954f6a53-b597-47dd-926a-adb5a7513edb@oss.qualcomm.com>
 <c1355057-486d-4852-8fbd-f9916786de06@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c1355057-486d-4852-8fbd-f9916786de06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDExMCBTYWx0ZWRfXzXhqsrpRWI/+
 svdctoHbBCKKzROsB5n9VVy+Rtsb4I18+8xL9ko/+aTDvwN6jGJNytfXvIWRuQHZu0i3WCKlaiM
 fZjkjqcag4h0S3yF1s1O/HWGRQOH0fviNXO/Um87MgNavFcN/7QEwtMWVOwmwpZ+Jpp/MfJuoyL
 QSXAIgWqdk16vqrwx+BTeOkSr/lyOmOdWhhexeAM1EVpOJib2yekb1L43fjILSReCdRj4EowLr1
 TTxVRdrI9YQnnYbNrNgsztpo7l/htq4vWtCk5ucRea3OCVHu+Bexa6F/6fDVAAFzfq0jLzm3XTm
 i3uFbR8sOj7U+zslSmzMGgB/tb0LukKMX2atRS0SJjF5OPjakcoxzI9zIwdkJe9cElA2yW67hBX
 xQjTywgCLCKF1uZlynui5r2X2hyYH1Qu7yDuy7DS1/KTRq+Bhkhtghq3ag0bHzLFQneNAg25PsN
 ZPSEhI2dUyzgRI7cdbw==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=69a03977 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_q3aKey68L9-M7rtS5oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: e5S2TbmT51IXq1iBJ7oz14joc6rA3Qh3
X-Proofpoint-GUID: e5S2TbmT51IXq1iBJ7oz14joc6rA3Qh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94289-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AE4F1A59D3
X-Rspamd-Action: no action

On 2/26/26 10:14 AM, Wei Deng wrote:
> Hi Konrad,
> 
> 
> On 2/25/2026 8:27 PM, Konrad Dybcio wrote:
>> On 2/25/26 10:17 AM, Wei Deng wrote:
>>> Enable BT on qcs8300-ride by adding a BT device tree node.
>>>
>>> Since the platform uses the QCA6698 Bluetooth chip. While
>>> the QCA6698 shares the same IP core as the WCN6855, it has
>>> different RF components and RAM sizes, requiring new firmware
>>> files. Use the firmware-name property to specify the NVM and
>>> rampatch firmware to load.
>>>
>>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>>> ---
>>> This patch depends on:
>>> - WLAN
>>> https://lore.kernel.org/all/20260122053624.4068718-1-wei.zhang@oss.qualcomm.com/
>>>
>>> Changes in v3:
>>> - Rebase patches
>>> - Remove unintended 'output-low' from bt-en-state pinctrl
>>> - Use prerequisite-message-id to replace prerequisite-patch-id (Konrad)
>>
>> Only now did I realize you're the author of both patches!
>>
>> Next time around, please keep them in the same series, for easier
>> tracking (since they're very much related)
> 
> Just to clarify — are you referring to the below WLAN-related patch and this one? 
> https://lore.kernel.org/all/20260122053624.4068718-1-wei.zhang@oss.qualcomm.com/ 
> If so, they are authored by different people. This BT-related patch depend on it.

Right, I seem to only have read the first part of the name.. sorry about that!

Konrad

