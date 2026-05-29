Return-Path: <linux-arm-msm+bounces-110316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F5lI+XTGWodzQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:59:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE58606EEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C3B7316B5CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F0337BE8B;
	Fri, 29 May 2026 17:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxVbb1jm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIwytRNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDA1376A1C
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780074887; cv=none; b=sTsuLwI8BxpyLHUm8kBZxyJ9af7b4nDl7Ic7yeuP3sMzykTvcFsrYk2qC1o3HhjgS6ZeS7nKT39kQs5C5l7oSaAqmBWxZWMQxGXUXQphUGUeKg1g1dIBz7bKzB2tO1P2/OFlyHguR3x73GDluEM5u1G7dbdbrlnafyTQZeJJnZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780074887; c=relaxed/simple;
	bh=LUSbYKf76os8+Vz1iMCld3ZOXFGhpgSvvxaDbU0zMnY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=a8O4LJKjnGbRxmSIFHXUu9yiaTvkRk9ZPVet0fgDNKHLeDGQ/F0RmXTmU+ZTtA6nsuLsm9v7TTRILmtqT2iaVfBouibQhSMigd0mjjBsRxQvk0G/1KAeot8qIWt9plWImMoQG9BBDrOS+ONzcZg5OHAprtTbFas08375W/lzr2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxVbb1jm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIwytRNy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8aN03271518
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=; b=AxVbb1jmWn6aHqAD
	3m3DsXClFjd7myjwZOnFRTWa4dNFI+MtDEYGk3juTtH/ltD88vc4NnXJWWjpJF6o
	k37lYBJ+Uqh6frAhHx994cLmGJe7MZb0S8j8FM4Fho1eLwEIE7LAtDSoCDk6V5Sn
	/3JoIRcRouFWvm+Adc+2QgEU3TTUVt45Htxs1deRlYLVsmWJDSlB+yBE1d8EMTis
	hsRw2ENtbsQ/aEOcsThOIBlCz3YTIsd60NKhmQLW/LrtqeRsqxxyDHI6DZyiuuFh
	bnFDOA/pZl0u9j+1POMi9IFPkSUJtXFIb2ALMoTSXIR7XePNV9S0FLNs5JGQ9cmf
	XJnjtw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug50rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:14:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf335549b8so3932545ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780074886; x=1780679686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=;
        b=CIwytRNy7sV51zrWWBgPLj4q3LLPFlbG5wXMh2v36jW5qcm3MMskSegCzZyRMH/xm+
         X99JcQ+VCx5EFaspsoLAMTw5IpM+anh5sXK6WB7GnHNQMj2y1KFGSdO49PRnRojPqhHx
         58hXkaDkzR1RfKqFqzZbw1FewmNldlkE2J3f7qnomzDsGiP4y82b7K6KBE3DVrf2eZRF
         lbX8T6yiPk3HbKZ0Z+5jF1MVFuBUdITXwdYh+PYXwdK3OIqLFZwAw4NAfHsOjAZYEBJK
         CR8NkfAR3PHAolI3XNC3Ih3R5E9YilyQ5EZp8HoRusF0V1ldTurjNB5eyaq49Slhwjaq
         ct3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780074886; x=1780679686;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=;
        b=KhbAw3MITClA+DzpyEtdQLaOI+I+Gr3O/11rR5j6dAz6qt43enLpOxoHRxfIYFGXf2
         YcNuHcPre5+yklD96CeWj/HucYdYvuFzgpIF3phBR65BZuYtd3lSCCuE6g9HmgFCnFSb
         rVDggAH5JKNvk7/tOlaJSXVxPO/92z6+yW4y8mNQpyCtZoHUG6T8/sINNamcZ3w9tIvu
         8k9Dz4CYxH1dyLPYMQfmF+R7ehHN84wHMyzWOQf60kGyd1lj67+b5SavKBnzRA6nEHkN
         SlkFem1qhMuH1LChY+xwVjVtq1lYtIa3pKs7AXxaixQvEebQgoQ4KOqcArohDT4POnZD
         +7YQ==
X-Forwarded-Encrypted: i=1; AFNElJ9O1iuVuoyxuEDJon5wWCUAX65sofGos9CG1axYvdfxS5/07DFY5DGyfA2MKqBmlNLMTFWWTZ4z16zFJfwm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe1tnIIsJfmRXURDDe4nU9T0M1TWFaUsfouI293ahl8p1q3Kyz
	rfZEkPtBN0T4sj62+/9KBeU9NFXTMo4FFqFGNMl3AiMmWYoOeCQvQ5th9I64DcfL17L4nVdqkQV
	QaqNQDTaEdMqoQVMnkw59WkkUI7PWfDmAEW7HnBkEmkCUudxI+xpBfRsYJtlXWaF/39Fk
X-Gm-Gg: Acq92OE7EPyQgkzDUxF0oGsMcFAmkmg83NHS6envYJHTMV7jvVbYBwKd9jeFV9Ysmnf
	SwwknkO6Qnb94gOiBVNkEQtO9xdrFopuafvCoNAYKgkDhhdlzBksWwFzZwHOJgMoVpKorBt8QcP
	3E0svmKbpg9pmnOUqZpFObWEV2Nt04aBeEj9TsrYP/KjANwtDyL7lS1JrOYBjoRsPvGmAyRi/yX
	a94J5EAJTTNlzRz0Vn6YLgfIJmTEu9EJKdkFVi9FF/D47fUSbmuVoeDv2RAm/5n/MKtIzCX/5Vg
	GLAtzMHnBk6h8f9L2+c24GZWCJrbxp3Gsh1nexJDDFvuIUAbXouhPJa1Yoev2J93kaWyT7+tk9f
	xXQX4tf8+2pPCqv41mxVm7e+AhMPuLzhDBKkUvz9BIHIWPFW5ERekiEGk5EBEUuw=
X-Received: by 2002:a17:903:2450:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2bf368383aamr8593385ad.31.1780074885590;
        Fri, 29 May 2026 10:14:45 -0700 (PDT)
X-Received: by 2002:a17:903:2450:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2bf368383aamr8592825ad.31.1780074885113;
        Fri, 29 May 2026 10:14:45 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.224.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm35627145ad.27.2026.05.29.10.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:14:44 -0700 (PDT)
Message-ID: <051b9597-873c-44ca-b7a5-29efa795406f@oss.qualcomm.com>
Date: Fri, 29 May 2026 22:44:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-8-645d2c8c75a7@qti.qualcomm.com>
 <178000744162.4557.14613962845288279527.b4-reply@b4>
Content-Language: en-US
In-Reply-To: <178000744162.4557.14613962845288279527.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3MSBTYWx0ZWRfX/R6kqOCdDhsl
 b0gdDkNrncz2Gk/ULf1YkLO16aOetZwIDWW/F+I3Mrqf20Ag3QG4XAuwVDtOFDZjTNHEJJYamjJ
 WNMxGvlJA2BY/In+INBc/mT60+qeDZzAJAAwF2GfEC5txbpLnFp/tky/I/Vel4+BaADsCn7Ia62
 TbAqZD3JjZ9SwDGXPjCFOLaI+/tvh4qKW+ODp+ALBbsznEbs/ob459fmE6QkMEQQ9250jkuzE4l
 XwmMikRW7nOVWjz9JzHFv8S5yEwoA5JuBdPgfLuKHTzfd/WzjYf3toP+/SwJ9WwMD4I4pci0f58
 Q7ev031F2xaNk5drUOt94bOvdzadFIH3s6fDkKyqeX6rY3F6ec/lmM92YU5pLUcqqvZhSEJgg6R
 8ZpcEo7RiMmHNPm4kGCTl5tO9udlYgSLprpuhHqzD+sijbtSwIgtI7KJhJhxeTTvkVCXsB8YJPv
 KlPULGrq33j9MWl7frg==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a19c986 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=tDSAgCU/rryVExTQDfsVjg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=nnX9c2Y5NtHo51HYM2EA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: YiQxdTBYEeDg8xFl_DfwsN2M8NN_-11U
X-Proofpoint-GUID: YiQxdTBYEeDg8xFl_DfwsN2M8NN_-11U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290171
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-110316-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EAE58606EEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29-05-2026 04:00, bod@kernel.org wrote:
>> +		dovdd-supply = <&pm8150_l15>;
> I don't have your schematic BUT where are the rest of the regulators.
> 
> If they are absent or powered by the daughter board, a comment in the patch
> would be warranted.
> 
> Same comment for previous patch.

/*
 * avdd and dvdd are supplied by on-board regulators on the IMX577
 * module from the connector's 3.3 V rail; they are not SoC-controlled.
 * dovdd is the only supply sourced from the SoC PMIC.
 */

Sure, I'll add this comment in v2.

