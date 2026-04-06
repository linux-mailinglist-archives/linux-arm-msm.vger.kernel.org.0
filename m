Return-Path: <linux-arm-msm+bounces-101934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAclFEV302nPiQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:05:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF343A26CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 11:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 230FC301017C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 09:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739D32DB78C;
	Mon,  6 Apr 2026 09:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WokG1jV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MV6ZjB6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4907930C608
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775466306; cv=none; b=pbxP1C6vWyQ4DC1NlSquTiZsyk+JXN9Wbo/1OpoxORzRgzDDr58WvLqe15L/7W8zycwmADdmwCANLFyNV4C8oXDzv5d47HjzH4okI3ULu4W5dIme+PqZi1PWP7FpsJJd/VEBDqa3WTXdoazVX9FeDn0uh5426kW+GbCzhFWToJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775466306; c=relaxed/simple;
	bh=JCFwUhX8n6J6cLvZHBT/nylt0d34jPjdOhcY0lO5Akg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuKZqy84fVDPrSsXY/1kkVT3OvG4V+/QxqlEe5zoGfWbzVab3v8rK2o8hLXxICeR10M8cZtIA4pBSPBHxzcPKVkLEIuMg/8S6FoRVRfXnLO4ZnVhmRSFUEqs1eFreB1mKxiMYXY/co36eRUBkeOp3Ych63Cl4rlpov4Gj8o5pQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WokG1jV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MV6ZjB6R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63692Gl22342418
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 09:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wY4ckWtfpN2pfgEpvz3rl8Jz7KSBQO2pSps0bfWI4Pw=; b=WokG1jV8TTdAeLH0
	WsES62KZhpnmUicCUJBlMBRKguACz/XLQ9xgrlE1bA8MbMFu1mO10oPDsWTHtHfW
	Fy35bNo0seziStC/yDhZGPbiVtsRKOhab/MIKKwr+Flfend6sAYd/T++zDJARBYr
	S0WBm28qk7J6eEGmnXtpyE/M80BjyvCpW2fHuzCY9cHWrtU/3krYOxmFeZanpBtk
	qsMHQaxcyYvkB9z9QRxbOSGwxoHTQ2JzMZC5+NYZrpxSYJIxpZ5KBsECTLjnXLU5
	aypwI1kSsBTzSCFY/8RwMy/ko9V9VGd5QPRMFVx7zZehfh92bz/tZuXG8+MNf/v2
	TVr+wA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfmu6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 09:05:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fec175so65616895ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775466304; x=1776071104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wY4ckWtfpN2pfgEpvz3rl8Jz7KSBQO2pSps0bfWI4Pw=;
        b=MV6ZjB6RamvVIkf6ebMgGxst+yCuc92A8F06Y+ZZSOGQSayiY/h4+nNmh3MzhKIZ2/
         DPcjNjgvzf2vj6+4G3CSqozTHTj7llI6Ktj0eIiIi/2mL/9tbebO64iv2ltCvyPgkdH7
         t6CMLug9ZL3V07iM2FG0BlRFUVApyd7ktUyl8V9t+bjddUFdc7kn1zRPP52HFOrBMwd5
         ACLm36ZLIZCvzTfOFVKzxh/Xk8P/rjbfTLWILMCaY80j8Sz8JbbVSO6pwfaWRzH+NjKq
         HXAhO6+w2bDSmOF8/5JiRygbRjJEfDa8pdl0Tv4loxnHEato5Noizwd+07z9VKBRDPX9
         4qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775466304; x=1776071104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wY4ckWtfpN2pfgEpvz3rl8Jz7KSBQO2pSps0bfWI4Pw=;
        b=Vb/eCH5qdWqzLrGoZmQocjyR9JoDBh/5j6px8RdofmvRyDrcp04jO0QvPiwf6GCt1/
         tcwxTfOjthvWDpo/eH6YrkYZpKT9dQ8lrQAt2ECNN5JaVKwaxW2TdNid7pD9c7mCxd0s
         vd188YmBZFBPFdVKvwUH5yhCC75j00YTaaEmo/820leAU3gd7VGHSXNbd08QQn0HTBtF
         umA0n3y6IQFtjJcI4trRz/rh/dhIjiWyz8yR1QQb9S6TV6ohFCq0E7W3qwqWbzBOxjux
         wATiibmn0mXnSpfMa0mJuSoUX1UQEmJClUJJ+DXudlrS+OD2WonwFgpqzEnVMlKTW4yo
         SClg==
X-Forwarded-Encrypted: i=1; AJvYcCVa7+XQqDvxWkx1aYPV13A/8cJD9vM3CNcuNtWUgfbSkDGQNWWLuGnubSGhlVj3wAtErCnnp95DmGg1sdG2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg2ONN6h7++DEzCp0uqfiIzZ0N0me6znMls8HiKIrK2YhgKh6p
	bE97ivD1LfC0K5ijw4T+sS2NWuzycW9ZZrrFQpN8nLT7iy6gUn/JYDT9/kzKOBq52Grpdzw+QrP
	w+FKGJmNf3wqlKcug5cUhfixfPWJKzyHYORq+yWSn6wcx2FDsbyGIp+uZ0lEs0KZHGEUz
X-Gm-Gg: AeBDieuECl08Bkj+cuehw8ozL+uObLZvwY1vZ6EzzOah8ZPnJ15d1AXNBJPkJVacC3G
	0pIlFUNtW2nqowTn++ZYaO54gcpCxjo92AsoRIBfLBO0+8ZFFUx0NYJjT06s4r/37L5T+NJcA5f
	CyMEwbQdPQUE+d/ohTCQ/lGPpPi+Kjo4Gnd2Ajv0KJuo8Lz2x4E8HRiQU4OxCHeoLkhoSJNH0sl
	dAjjq0rukEGFdMSbc2HN54cLD4YRj9Mw0PHC+wZqcsJED9V7VKDqMfts/fJgzC3F8mCX0kO5qAe
	JCqY4IQdjb/cTyq74fulH/hwS1+uw9rmhqWrBVtEyFgJmWacaPy4G4STymz5bk6MP74bFUCzoQZ
	qNgL7yC3zk2JIe/G2/VR4YCgWiVGSCWdXiE6DN8d7MqidRblTs+ZuZLeCtcnskACE/w==
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr125987585ad.22.1775466303880;
        Mon, 06 Apr 2026 02:05:03 -0700 (PDT)
X-Received: by 2002:a17:903:3586:b0:2b0:b325:748a with SMTP id d9443c01a7336-2b281705e9fmr125987295ad.22.1775466303395;
        Mon, 06 Apr 2026 02:05:03 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af19sm129633005ad.50.2026.04.06.02.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:05:02 -0700 (PDT)
Message-ID: <5c0a53c5-3750-4b80-b3b0-0bc7595454d9@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 14:34:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
 <CAD++jLkwGT2SxQrax5FFF2x6CznQF_03N_FC6-2n7OAiNH3Xng@mail.gmail.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <CAD++jLkwGT2SxQrax5FFF2x6CznQF_03N_FC6-2n7OAiNH3Xng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA4NyBTYWx0ZWRfX24J3qlO8uzHH
 BumaFsYBmJG8o9O9DiYqfLbkPL1+BQw4LGRYmhUgB0WLJ5e8ZYDVHsX8QZ8grN7jbet1HeyV9ML
 Lv/qowYQ8ZyHlfSvAeoTnX4Sht9QLCJ2mmbf0cAGvTXwqYBiS+E3FLKv923VhZPGTCO4l96NZTc
 5oTgFucv/UtlK6TIN6o/MzpM7rUSAHlwzlulOIIDGaZi5c/k2ZkQzZGxJihyBVi2BFczdpg9qbw
 +eKTL+h6JtDZNPr6pTDfVH/JOK/G1VJxzcTjm4b0XdbcCiI08XmlZVB5AYa6F73oR/bjyMUrm44
 Vxkw2hEXvUrvlrtXc9VeH4UiFwlMjbR+6r1kPR6GOQ5GMisF6HdsIMv82F1FJ0u7/llSIeqz/DV
 NKNtvVYac6l1vx0VFuTsWBO3qujc4QqBUJgPulu5Q5W++qo2on/nEIb6sr5BJuMW+Az+pUEZhbf
 04HphtjLyLcWnyI0HRA==
X-Proofpoint-ORIG-GUID: Tcc2vAHtoHqUAc0la0zFiDODhFWQsUfI
X-Proofpoint-GUID: Tcc2vAHtoHqUAc0la0zFiDODhFWQsUfI
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d37740 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rkh08bgVQrwZcmFFEZkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060087
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101934-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9DF343A26CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/30/2026 2:11 PM, Linus Walleij wrote:
> On Mon, Mar 30, 2026 at 6:51 AM Kathiravan Thirumoorthy
> <kathiravan.thirumoorthy@oss.qualcomm.com> wrote:
>
>> The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
>> Add the pinctrl support for the same.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Patches applied!

Linus, I don't see these patches in linux-next or in linux-pinctrl tree. 
Do I miss something here?

>
> Yours,
> Linus Walleij

