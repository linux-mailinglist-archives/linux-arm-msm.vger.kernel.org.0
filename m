Return-Path: <linux-arm-msm+bounces-99233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPBAGO0zwWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:37:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C32482F2011
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 530D6306BD2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7EE35979;
	Mon, 23 Mar 2026 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDD3O77e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRRoVV6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512A39FCC6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269030; cv=none; b=btyp4QVxSnI52h/+CL3TsqGvsJdzx36T2ZiC4ZKQx02T2jLI6N2RY/QaaodP04H9jYGYDTEfzCkoemLrpOqQWB7GleCaSPW4XHc9p2LVbkXnmLQqtr1pByueQ19XDgpRMCOC0Kv5b/LjuXLjrptbz/IEKJEC7oGw5VSj623tNMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269030; c=relaxed/simple;
	bh=JNZQGnyEmTLIF+OXF5pPWrwQQZ/h29es0mu8yHIp1No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSrsaZer8qOtbY19HL7vq648GTshS9mcgq5bAVQXYEzexl3k9Oxgls0dAJQYoBzI5zG2UoJopiXN+q8Gh9BCA+Ix9fJWks8Ppo4bbBZg23cwCjTzid/XxOO3YlK3evfU0kL+okTY07OuPVR3UJIJEUz08e9JyBzHvGOThFj4oa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDD3O77e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRRoVV6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7308K3507946
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeZR8yJekgJqWCu7/TSknbU6cbZzEp4i9GcMqtBAXUc=; b=pDD3O77espmO9ySW
	LS2VwvkiByk0AHZoQbHwX2mwDdzCqhfJeJu4/h7iE4L8vfYg47TYPcMw3tKgyMjK
	iq05VWzm4m00fIUnolc6VBYTLaK5k44RFjwHPgJAcF+a4NxRcT+p/uCmSmoVgbJw
	4LmRqKLnm/tFIaBnDFHt5fk/pqIeoLEqhTO1mD0kRG+/ZhRhiN8Zq7q4cxM8PjFa
	HlmkfuG3QgidhiQr3iaLmaON4407YBgrp4D+uIKJQRhdqM3+xixPus1c/0TjgaXb
	Ip6Nq2/JCrSRwaIYYfI7kzF5pkXixLd0OYzTtj6stRGKQoaEStsT2BwvFUuwLnz+
	oKzwew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8k8bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:30:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso14872475ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269027; x=1774873827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeZR8yJekgJqWCu7/TSknbU6cbZzEp4i9GcMqtBAXUc=;
        b=fRRoVV6WNqck4hPv0GFJusUYrTwqzTS/s/dO20tbH9wzYmACnVNhhj1TWBk+jhAD9s
         vvHRT5jUadtVpiPzxNnlauoaP6WeHgAG1Ea/bjiCaDC4DgZ9Et0tKMNTnKWvOLud6B56
         nRKl1y/QCzs8078qKFNpHhrD7FDdoI9QJ3KDSh5KzNllqgq+a/WdTQlESRTU6FUmgmEK
         gRqN4UqwYL7qLbHoqYL50GXSiqHz7lQceISe2eIrX8mbzCQF7zRUrnn0VhVdb5OfYKsF
         6J6io2GLHTyKciE1sqAJIwyxyhXD/ktNHjNnnaBKCanokWLn2W9DyBUiBn+v3PMpDJiB
         mVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269027; x=1774873827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YeZR8yJekgJqWCu7/TSknbU6cbZzEp4i9GcMqtBAXUc=;
        b=qxapAGPFvF2HDsS6NTxewWEHsXDZc7ZhdrEOQXJ4H06KUVIKMQ5CuBhUUgOX3AI5af
         yZTY8aiy+y3/5DMc5UYxQfdUDYINcrrOSNXyuW7HuqEA3kY4YKF6RQHUbYOFm7t5+40E
         zrK54FbAiABhLU5UsKhlTdDb706/78YwnVvQKJ2g870oWiNEJmPkSokxNgFZYhISLbEJ
         xyAu1HMd0oFg4iw8liuop5zKA9/7zN5z24FNfjIn07D3fDjuXkrxo/DeoFehwhsBTIhK
         qCN8ikA383aIOjXwvGpo672g+DXiGzu/kM1kWWejoiPaarVTed53vxpfzZ6ZM8hc4C09
         43yQ==
X-Gm-Message-State: AOJu0YwIxUWNLxueD2/qqzOxwZeaONmuootPMVn/lpmwpReS+yxCBDkf
	az4vL5f4gT5qHJPVPAcULxmQQZTqZxpgCngC62H+/eqW2D4/DSVwx3rU9kdslzeHRBOmGUN+or5
	HdNc+s0mZmv1JnIbxxX0q2VFu1A+FYYWWRuKCLMGWWL1ZugaiEwYeIon6rS76PA2YEme3
X-Gm-Gg: ATEYQzzYTzqKLWDWHvTFE7t2BeUD+OOG9io64YmypqTAgBFEd1L0JMMv4b0QmdvayBq
	95KH5MhTq7PawBD71+QIiOW3HNsS4FimKcQkKox+cRQibnJL1c38aC55nx85eRslHaY0eLKrzwT
	ZYESzKFqAnCBwFB2XQ6LiFVuvi+UTFRGz8a7Tomft8qkZe2IEhbCxriHtNntTOyQXuetBiWacVe
	9VODHshtfvZe0T7gUnQ0XC+uNX21oZxhGDdaHhhJfAqMCFMPc0tPhybMyjB2NAFVAJ3x9HCQOdx
	oAa2nd4HKPZU1b34BJ1/5TlYRL69IuZmLFIyxKPQ87+y+F4wRg8OZINghUxUJ6JSmSf6tGKVOpY
	3S+SwB/vpEVkSQWQHDmzz0vnxfb7l1GAtpRPzklZO4p0E7Qoy7oj1s0C1mu0AOh/BB/rcjNvjA3
	dP57oxBDHm
X-Received: by 2002:a17:902:e850:b0:2b0:4a57:e487 with SMTP id d9443c01a7336-2b0827ddd59mr116899615ad.38.1774269026918;
        Mon, 23 Mar 2026 05:30:26 -0700 (PDT)
X-Received: by 2002:a17:902:e850:b0:2b0:4a57:e487 with SMTP id d9443c01a7336-2b0827ddd59mr116899125ad.38.1774269026298;
        Mon, 23 Mar 2026 05:30:26 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366b5besm112930985ad.55.2026.03.23.05.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:30:25 -0700 (PDT)
Message-ID: <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 20:30:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfX0tOmRqP02AIF
 CxWbMaIaW+4x3Z82vU5eHXdMQZQiuacHj25j9jIkNJdxpDPCdxbSyLq7+Rm2shPjFrm4xSjRFHi
 Fmyn+5fQ9JwRHvkFPEQALFN7rEn2QxnxRmkoOZcxZvsbW/m0lur0SV7zqR9QuU1Ts2Gs8LRrhlW
 F3C3eyN5zXPwlGqPd8hqNLECyUnYVXP8zAToSG8/HnfrzykKeB0/sl5R9XuV0+fAi9t9ww5tB6I
 PLnOH/KihNZfImsHXG9yqAkKOtUWNMZhW413SES1HyqVteReVgOp0RrdVToTxziMJRgZsmxVqkz
 5ya/CCa4BAsUh/qdQIdr4UeL0O9/9TSfoegwxR5+eK/3iwRzkDJRFfpcysTUBZy6Ybb0ZwOwu0E
 FZ6RFUl2/mIkhR4EcgQJhsXxEVqpNNoQFtybEaOA8h7z7yv+z6Hahp0Ex8tKbFunq+dqGRCJwnZ
 8yRpi9F9/+02pKSBF4g==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c13263 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qzfVlSID98LAkVwMgykA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: yjzCyBhWi6rbyr-DFQcigJEhStqLo0Fr
X-Proofpoint-GUID: yjzCyBhWi6rbyr-DFQcigJEhStqLo0Fr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,11c4b000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99233-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C32482F2011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
> On 3/18/26 12:42 PM, Jie Gan wrote:
>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>> Changes in V2:
>> 1. removed two cti devices due to GFX block is down
> 
> i.e. "because GPU is not yet enabled"?

Yeah, these CTI devices have clock issue for enabling due to the GPU 
block is not yet enabled.

> 
>>     - cti@11c42000
>>     - cti@11c4b000
>> 2. changes two TPDM devices to static:
>>     - tpdm-cdsp-cmsr
>>     - tpdm-cdsp-cmsr2
> 
> They were TPDM instances in v1. What's the reason for the change?

These TPDMs havent clock source for accessing registers. We only need 
enable its ports to output trace data. So I have changed them to 
static-TPDM compatible.

Thanks,
Jie

> 
> Konrad


