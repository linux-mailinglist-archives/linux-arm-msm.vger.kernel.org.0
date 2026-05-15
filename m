Return-Path: <linux-arm-msm+bounces-107811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Iv0J34BB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:20:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BD54E4CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 822DA314D6FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F130E472766;
	Fri, 15 May 2026 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/lhJqZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NgghNvW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8536346AECD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842585; cv=none; b=aNV2IfxiK6QjM4mF7kOwfLj31lD3KXtYnqs2FyPQU4ajpcpXeqZAGX/sezBtmcZJsm407mSTDHuI2tO05Z0c/igRTyfaUEjFYyCXq2G2yMOOmYib9fCs9LexDMxO5svDjUP7TaVs23OQ6FQbJ7ymjsomw7BJOO7ixNEc9jpup0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842585; c=relaxed/simple;
	bh=7pI2CkgOkj1QdKQPeP82rrYu8n8c8T0fbj+4e6fR9P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txrulaIvfOn3HhTpatLquxao+TqpouhUdPLmy58k3PjglARn+ekm7kHMhVQJV3T6lmpVKPREAj2nXNSDTtajrziqgtWCUKwGBw2nfNxOlquYsM0h3QAanxGvfEhzBNynIBeKbUG4ZBjh9zgLxYUGTHIT3iJWoHzFbn5CmnA3ASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/lhJqZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NgghNvW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F59pQK1847949
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQl+nNFkbEygaebXDDr/5Cgv/szcdUhD1+tk65nXCHI=; b=c/lhJqZ8Ku0a6NmB
	YHnKzJ+/8keMK2ZrvYZ81OCuIht2aXsbxAwHblgsG65zAS851io8PI/b+EYw/ROr
	25vIpn53sqfs4Z8qwm3FwKOkRYftq6McQ1VnOVIHGlX0edoTYWb8g0Ux1jLx4G12
	GLxzim2frGFv1Ioef7KwBX6e0NcXKeYjIWydGrcZGnfGwW8IuYBQIqC690ht3leO
	X2eTMGx8cOsByWacd9vJEVeiQbQqPQUOspFeJ10BL8FIfKtGJofLIuY21fWuqJvC
	30H6yC2XmSm6t1Y3vj/jTmINktkRfH1ZSESGl1e1PeA9kTOQGwWKKdwjbKOQWjqR
	HKUGZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2w1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9114b077480so38744285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842583; x=1779447383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQl+nNFkbEygaebXDDr/5Cgv/szcdUhD1+tk65nXCHI=;
        b=NgghNvW4g3YOCCDm5+kkPswqI5orr7+M1r1eEoC1yQZXx5mgada5TwySTO2kckbNKa
         mdfqUk8YhS/X3Ou5uBkRBOsXDwy5Zhg81g4PbG/J34UNO8owDQXP9ICYKgUY3jZBdeoz
         Vv5A0K3Qbti8cSD5PBf7cMw0umO899O/0RBHbVz/srM6vFn3R0UBav3NvMB0gJ17P7LW
         BzghBHhY8Ci7MnFO8aplDEkN5s2zWhkRkzjXp5CgyZbBAsmGSaJmpzilNFUwhT3EnYBQ
         4qEQ2IdhSNT40PXo0J/ad1c8iOXDVHJpZPtbqjuK7v/ebQoMSavfilAQiwyRHHzfPPxD
         9srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842583; x=1779447383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQl+nNFkbEygaebXDDr/5Cgv/szcdUhD1+tk65nXCHI=;
        b=fThcarkVSnqSC5umesX4ctWL+AYo/b+cmQ9g/FdNOb9cczODrTVoo+bWlew1hStmN7
         YcBnFiyrszg+FU+p8oUSY3Q3A8jIhNK6RsG3hIuVSZCMTUq0vamUa6TQVXBj+yLnPUvc
         Nz4exydg2V22yeCs5m8pXYNIF2ronhe7sTpiFAooPgcLn1xh2zsDBimD5MYPzV0auZq+
         Tw4uKDZlJ+7hd/Pwx7oIZRv1UnpM5lj5N+3vxuS1l2SCd7bdnKFKfkd2iofme4kUhOQp
         FhWHdpa2lVMC+pG/pC1B7KsnV0NIVjdzFuEezE26g0Z4Flp6xnvcIIJIXeCvimn2/OQ5
         zv1Q==
X-Gm-Message-State: AOJu0YxPU/Knb8Yt4mSvm/xM0tDD/28/MLQ5INVD7uhUHKAGXpBQkR6U
	AZV8c0AghCOrIM9vo5t2i8Gm4B/E/Q9naffRxl/QSytK2ezcx+Z9MXAIj6C3YiyVbQdP8nL1s5l
	/KKxpvb69U5JUaS+jF+zxXzJc4Tb3UoCJc1+lOKuG3an6d08zFihWxFQplOUFPxaZyd6g
X-Gm-Gg: Acq92OFPURAinqIq6S+e+fejPYdgNnanMOk1asIm0V1D3vTPbPRv2QoSr42FMY2eeqs
	75jPKjEkb7oEdC1hdoJ+xM/z5kC+6crlTA0uF7egZnI0zItGrq96/G9Ul2QI2plkQv4bTX1ldH+
	WNIrmhMctIaoNZHhMMRw8GEBs6aBPltvzV+jFcfFdqEsHUqMqemeFUgAdicWkwWUJAdM/jy+kcu
	ZTeqG0OmD7ArnwSNjhepSyJHxX47cmVNTKU8jgu96Oe/ABgWflA8Lv7iaS+IyKOIsYacC6ixtj/
	ME1hFylr5GytrYZvzP+aEbCHkoogRC3/ZSexbARGgKlHn0vvgu53JkXr7AzFJLQeILbiyy7Ipwo
	jSQpaOijLtlDjm1GjDE998eTnzZxTEwAOoZlH/YNrZ6l+Ts5SO58q8FlET3gbtNrk4X7y3lpAbJ
	nuTYVjYiB6qyjBDw==
X-Received: by 2002:a05:620a:a410:10b0:911:dfb8:37c9 with SMTP id af79cd13be357-911dfb83b03mr212491085a.3.1778842582856;
        Fri, 15 May 2026 03:56:22 -0700 (PDT)
X-Received: by 2002:a05:620a:a410:10b0:911:dfb8:37c9 with SMTP id af79cd13be357-911dfb83b03mr212489585a.3.1778842582381;
        Fri, 15 May 2026 03:56:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f76sm1784549a12.19.2026.05.15.03.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:56:21 -0700 (PDT)
Message-ID: <8bb0140c-bdb8-4ff5-aea4-15879a27f13a@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:56:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco-arduino-monza: Add Bluetooth UART
 node
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260429103537.1282497-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260429103537.1282497-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06fbd7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Wk1vn-X9fqPfTJa7il0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX7/s/7H5ujfE/
 rTpMmES8uJkm5jc0mkFNFPsVwnK7uy1jm2SdK1dPIlHbofxvyzGrqXJvhdzFbC1YhSI2jwobGW+
 jny8C0gGcDIaen727nStryTFSGlW0HiApeu043uYKaS+0jmC105/xHLNdcki39UneDxR0mIKp6u
 L5GWv1xxSijkbP+jSsdtwIoPUODSCiVi8gkcnSzpzHQZhY0aV2nWHmhrFTI4BqS21QTUx77nUSZ
 n5cknTFcwg3nRdCB9gYM8DqexofuUh25iUoxMUNBeIJfY/K5TiVFIX4DyN97p4wsafJ9+RFuQCm
 DYtQ88O1izi7Fk3+Y+ytUJQrI+dfNLfjWZrPDjqt4SOjCPzm+6Ak2GD46pMIcMCaOu2HqFNQqPC
 KJeWERGu4Ip1VFMxkOIL4icTIshiAUKSPPxVUzHqYhk+jmx6TJHp/CLnw1rOtXrfIbyj30XuFGy
 pL3WfdiK/tjPbCQJXhw==
X-Proofpoint-ORIG-GUID: UPfJ_aNDral6NyJpCZhHgQDHAqi0VcQw
X-Proofpoint-GUID: UPfJ_aNDral6NyJpCZhHgQDHAqi0VcQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150110
X-Rspamd-Queue-Id: 0F9BD54E4CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107811-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Action: no action

On 4/29/26 12:35 PM, Shuai Zhang wrote:
> The QCA2066 Bluetooth chip is powered by a board-level 3.3 V supply
> provided by the hardware. This change connects the Bluetooth
> controller via UART10, and the corresponding GPIO is used to enable
> the Bluetooth chip.
> 
> basic function test step:
>  - bluetoothctl power on/off
>  - bluetoothctl scan bredr/le
>  - bluetoothctl pair <remote device address>
>  - bluetoothctl connect <remote device address>
> 
> low-state test and state:
>  - rtcwake -d /dev/rtc0 -m no -s 30 && systemctl suspend
> 
> cat /sys/kernel/debug/suspend_stats
> success: 1
> fail: 0
> failed_freeze: 0
> failed_prepare: 0
> failed_suspend: 0
> failed_suspend_late: 0
> failed_suspend_noirq: 0
> failed_resume: 0
> failed_resume_early: 0
> failed_resume_noirq: 0
> failures:
>   last_failed_dev:
> 
>   last_failed_errno:    0
>                         0
>   last_failed_step:
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

