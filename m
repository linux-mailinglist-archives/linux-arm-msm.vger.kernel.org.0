Return-Path: <linux-arm-msm+bounces-97834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7+qYJvWIt2n8SAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:37:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62D2949FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 05:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40D0630055DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0650E33A9D3;
	Mon, 16 Mar 2026 04:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6tbnXyk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZMsceFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A330FC27
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773635823; cv=none; b=mxHu+wVGi6v42Bgc862Yt9mgK1x4Jyk6t15T6NAPEZqSVj7PsBmC74hH1nN2JZFEvi3FpRv7zvYl6zGe1GD2x3uw3zZE80Fu3ReVY7/C8T9op5w/NvERTI+C92RokfWAblzQRd5cilEFlb/bRKUsAODhUAy4XJDcZmE0Gu8fOwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773635823; c=relaxed/simple;
	bh=MHq/ggIuD0G5x/JV496CxH1JIPSrNVnxRjHwwItF7vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qs/3l3wGnrytEPTfiP1pK8yeHirlSIkclqba73n6LP8l5uBdS+LWD9som49Q+HzKr96gOxwa45gQVVrkIb5/F/a7qkZXqmGR5b7im9W1pCYPCIYvuBezHMc/ayfsJWkVcOxsvSsVQeBtM+3CYUZNh/Q0IwgbzsVSM+WSmY266AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6tbnXyk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZMsceFw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G3KIqu3433309
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFbjsbqI85gZSU8iBFCvyTzG3Zqip4n2ZD1U7wtutak=; b=N6tbnXykl6a2Sevb
	bF/Qe3vdsX4kGt+aJeIgiSkgQ/zSFhrx3vFnXydpVwh4oe/VO1KuV3zplsG6AMgF
	1PDi0+2ARUaBCkfk5YUO3fAiPfSMW3hRPliEMZJkMXX+o0tZDyNry5r7AOJ88XuC
	kCxqQ8a7c/h47I9Yogbd1tOmqWt6FbhLrSP+ZolOk2HpuYH7c7wNJR4aE7Q/tGO+
	a876g8BcPdFpT4BGYsNjCPZk+ZFmqDSIffCHSaXHrVjwB3An+jg1xHPs2iND5TP0
	a42bccpU91b2XyvxuarkLBi8/6Zq5GcJglegjE8dL38O/BwPrmftsEXkyu6/Pk5l
	iqcwDw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00am6xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 04:37:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so32922652a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 21:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773635821; x=1774240621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFbjsbqI85gZSU8iBFCvyTzG3Zqip4n2ZD1U7wtutak=;
        b=JZMsceFwTKaGPeoJ6VQNV/CTxAMda5d4QJd4h04TL8WX7fz6L8trfG5U1pxJA6T5FR
         s36AvEhjsmn1nvCP+lBeRwv4EJ+CZ3APTZcpTZYaFSDk5jWIMqj5n1GgqQQQZEIADJmN
         sj3HUFHoMBes5kSxnt2gJNZf0Bq6hSP4LPAVOoj2z2gQyAd0XYcC4LLM6Zg4DC5ZtoUT
         uXekoPBNHGOjIK1WjuKXaFJzqa7ahAsUAFCoHn8tmJHr2P69kX/2wCeTtW9oCAC3Mt4I
         6JDmonU1zIdIqB+ZyPHsngLRNL9InusE0R+Sjt4ksBmr2EgK9YuOommryaElu1XEFWSu
         76CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773635821; x=1774240621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFbjsbqI85gZSU8iBFCvyTzG3Zqip4n2ZD1U7wtutak=;
        b=RLGG0AGCOhB/CP8PkaVX6jlZqhviyCSwpQMYAsvaOHPP6/dqlmwOg9CPfuWn4Pa3Lh
         4NNTW5N5JMNhVaCfBLtKOqLR8TH321pr+GSZfHpzJkvMhDIIv09xfIryJbIt66mSRWmo
         RcGMdszs8GKIukxts6dqVYWo4Mfm0mp2aL3N7L23x1Fms4LBVqWFDSsusWrqZIRn7BiQ
         NIAfYGjUW96qpYCDs+uLHj1kzSgOtC5lkDW1cd43E7mtSSy0RY/4a6E6fXGfHmOMrW92
         vpGOah//Tu+c7KCow+9wII9o+xjAyLQWLxsFkp0earRGKUDmhJ/rKLyF6jhLk25t0l+m
         JPng==
X-Forwarded-Encrypted: i=1; AJvYcCUFn6W6E12K4d7NWoQ7lNQUMgJZSMT7NRuCvLGYJFsaH1IodcwPcor93AX5bwP3jmENfvwi1b6Bwp0ay58Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DszheS7AnizmZ+5dcL7cjmuBaH50BORA0IolfHXlPMkJrliV
	RWc3KwEZSDCPRKOlEcyqbr/WjAjGqyHonFR1jU4HtlrSb4YHF8lf8ordDDLaRd212zp6Nv6+spA
	x6SZYbsl4G+cLFINMT3vwna6KxAy+H8Dp+WIibENExWSVRpevObF3dxJGHKizEcCBEgAy
X-Gm-Gg: ATEYQzwGkUVk4LsWS4+V0fxlp7FS8ZDziIqN/PF9+PbF4zKozwcpSwN/iA/GFg6iIVm
	XmMfT49UveRLoqybn+jjEBhe38G3EWlWjcKP27mkEAT8G1ov1fwvYrVRq4m81sukS1ZYOQb0zG0
	+8L4mKcQehL1X/XxJL+TITAjt5svCowsYLTcjila1UlqvyInmyrlT01GK0rOwBE61IiWoulJm7E
	alo+M1icDXUVYjJIofCDDhD14bd7xlnNB92/CeEPlz5uu6nB7bGOW+dQRLsSCH56sv98wrQksgm
	RbUkybUDrsAQ5nR+r3K8gF2SXs9OK/YGOZsNjGervPc+j+bUYi8HUpi+NGPbgQePG0f3fxb8cHP
	lbrFCP8bxqn3hQ9fU75a1Tzc5T8Nycq9vC9Vnv5nzv6dW/LX7DHE=
X-Received: by 2002:a05:6a20:a125:b0:398:87ae:5967 with SMTP id adf61e73a8af0-398eca1175fmr10536859637.4.1773635820709;
        Sun, 15 Mar 2026 21:37:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:a125:b0:398:87ae:5967 with SMTP id adf61e73a8af0-398eca1175fmr10536841637.4.1773635820271;
        Sun, 15 Mar 2026 21:37:00 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm2989834a12.32.2026.03.15.21.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 21:36:59 -0700 (PDT)
Message-ID: <191a3b8f-7309-4561-ae40-3c187becc32e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:06:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: x1e80100: Add deepest idle state
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-4-760c8593ce50@oss.qualcomm.com>
 <20260313-accomplished-unnatural-rhino-59ccbe@quoll>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260313-accomplished-unnatural-rhino-59ccbe@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oM5mZEuuvjoGwJ7E5MUvs6KQPB8Udhz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAzMyBTYWx0ZWRfX+2poiqYmZbQN
 9RlK0Q9XnpsOut0GupPvt3vuuxwFnFIL5+igpPbXc4nxADhgKHV3IgD1D22ot1J37f90OfCsP1Q
 Dqz1t+Z4chR1hHLTbN3vmp/FvbcMzzTWpeX9G5dmHhkyPk4AoSuR6G3EKH4oxX9PIesURCsbcFK
 qNCNVkV5HupQzGhYNmgD1ouvo5Yn+Y2ry6L9xpZknKNRf9IKD/5ZtQa1M+w70k9TV7uUJ3K3uSi
 gEmREipktL8fuRrXNyrSmMZ4Nqy9R7PVb93INgejFGG55T2kv5vhPw7wrLP/Iz9eeesHYjWz3F7
 GTKMNwxPbdozjiItVWjh/FCxJqgBJr8s47CXmkuQuZxe4sKwY2+19RH0z0D7Rw3X+VnYTTV6oy7
 akbDQmnss+JhjZElSwYRB+rbzc8wwMrAuq8EKW1Haxyf+D+I0YuXjCo8dtTL+OMkxHw6nFfBZV8
 KnRnAcNEG8Al4qUcinA==
X-Proofpoint-ORIG-GUID: oM5mZEuuvjoGwJ7E5MUvs6KQPB8Udhz7
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b788ed cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qAycWwI3HuNM5PRzo7QA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160033
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97834-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,b220000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C62D2949FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 7:27 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 12, 2026 at 09:26:38PM +0530, Maulik Shah wrote:
>> Add deepest idle state along with pdc config reg to make GPIO IRQs work
>> as wakeup capable interrupts in deepest idle state.
>>
...
...
>>  
>>  		pdc: interrupt-controller@b220000 {
>>  			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
>> -			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
>> -
>> +			reg = <0 0x0b220000 0 0x30000>,
>> +			      <0 0x174000f0 0 0x64>,
>> +			      <0 0x0b2045e8 0 0x4>;
> 
> One register is not device's address space.
> 

I can move this one register as #define in driver in v2, SCM API is the only use
for this reg.

Thanks,
Maulik

