Return-Path: <linux-arm-msm+bounces-112759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 32r7AtKoKmoqugMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:23:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8AB671C8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:23:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CR+I5iQl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a4GPVmlR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112759-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112759-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 037E53004699
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3803EB105;
	Thu, 11 Jun 2026 12:23:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6570A355F5C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:23:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180618; cv=none; b=XKUnMSr2lj6tYobfM00GG0ZgUuW5E5N83+bWwroT7u6MM8raM1C4TyoGJg2BgxPLOfQW9qd4156W1ZjJ6JIACx4IiJrEbS2AYq50hPUAEbqI6OODpMYrN1WKAKuxdcJsl6wI+ZoOQnaJG3noG5RW8N1M7aRfNb4vr+6las6Lkgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180618; c=relaxed/simple;
	bh=Up0TGC9AUDlVL81y+b9nF57+0CbKx535aaKX2JXMVYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHc5K0WEBCMGsnfngNL9szcYqWXbyhrbI2WGuqsKDfShi594wkN2cmcMkbOj3b2kzIus1qQ8j7bAo+sRl7qcCXu6l+Ss9zrhn+YmjH/vfHou6hzzEkA4WqJDdfMOeUPf5Pa4Q2kaaetusNyqrEatb27Sc0UgzT2Hse/hKg/OIno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CR+I5iQl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4GPVmlR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9x6jp267533
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9p98jHioztL+apkrbpHDu4L/Zphbn62xjE/pBSrzbg=; b=CR+I5iQlPQdsXKSe
	LO84UORERhKbegjou+maJ0fU6W/qzZG1kuXZsnBXKFhxvrm9Ngti5U88QrcgQvVv
	YEEQPgMwcJLKhbY4nSOi6kiBSWokRV/6nly37BjAH4EfJY+VRMQwE+eXqqYwrGSB
	8X1RCleRgSCjjz+01my7k5LZyteMLSPCsTv9wlNNRkDWcFtYIZcMuDRm1ofHgpm+
	gAd8lftZOsQf86LKTmGLD0c3WMeYnOYTH91Ez6xXCOupdUDbr6pzdR4zhZ+/LNmd
	8ExXIi2yDX09Ghg8XYW94O+EaG/RqM8iF9WRlvpiYZHKRzhTPmF4BX1oA4T2DaGb
	8M2fNg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u3b09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:23:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2a4babe45so17561655ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781180616; x=1781785416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9p98jHioztL+apkrbpHDu4L/Zphbn62xjE/pBSrzbg=;
        b=a4GPVmlRj3oHWri/Ne9fzytcqGum69H39RSF0Go7Fuwgbu6vBOaknwn+OVrDrj9nJ5
         EVr9LGtq43oaGsqGxMJbFHSr0TW2vCa1M6yUvn5Zz8QSkPumFde0khv5CGT40PubWnmD
         9Io63r13rrOo5NZise53BCjM38/THTVat0jhXvg/zfYTncSAA2sac4X8O+0mgM5w1/E4
         7os97h9Sd/h1BBy5hJBL/xpi/l2IQMJMJLIUj0pL9OKFkxp8vD6W1292LXZYDo/IuT8X
         Xjc2hdQRP8N8xFHXjsIji4PcFQMhYp9YnF+y0j6I8Cin0u7zAu3ZPpQSXXMONepameVK
         FMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180616; x=1781785416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9p98jHioztL+apkrbpHDu4L/Zphbn62xjE/pBSrzbg=;
        b=qowad90SSgZ5A30M0Nc2MuL726w2xuJhdPUal8IfS8cictxkIMSM301QXIyW9jp+qb
         6bbrhVbBYJECn1baEVYASLBX/wjE/wtvc01uaDvY0p3Ve7lLCjq56nKHCyZiHUAKzC2y
         qg4UcOPhl2MW6+ufFgnGFo1qAvfUP1d4PvcuQ8l2HlzPhOTQDTxC/RNLATtWYqFit+2y
         PPInqccRcJXCFNHP6epWtMSelQrhts6AXKt6kB4TPkCeQQBISIpLMrb4vV5Uk1BgLdOB
         f610Y1UOLYun2/1PsAmk3w60iPzyRoIDsc7eb1IaWCFXDPA4kcEdw/jmqRaVxNbvg+BD
         COxQ==
X-Gm-Message-State: AOJu0Yxjhc6MQuXZSptAHxiNFppqnYdXTnForEoSSo7s9XO1gIRH/uPY
	u2S1ikwSVcWLyVzWNzC2vHWG1PQvO7UEY/tbQAqGrUU+eWDpfSHOw9jFqifZBY93IZZhNWJM4ao
	V4kqYU8ejT2UyfGCZOCiFBZUCYeQfxG6Gv7o0TzcpPgoepvG3T5HjShsIJJBO8Diq93j7
X-Gm-Gg: Acq92OF7lKG6rUCZ4mgKOcEdh2kfvPC0m4C3GtXBMeIHEC0CPzVWt3dJsntfrPhn4Qu
	FSP2wb+/baOiglaNCjefUkuwYBxEwkqDQtC82Zt0OCB4MMq1Z/mt11YfOiCJBq4Md+USdkSK4KR
	UQrC6pnBA7Mn+3qOi72a6KqadLXPfIWA8ycoo8htqvDIOGleOD9sJwQERxJ2YG62E37J44ObSH9
	YFgy+EdD8LVAwMTHfi20MeAoXTWW0DseeNxP0ixftQx0tU31FRMLnYqt+/RQtrOkunW0LjjtbSq
	E4cJNfSwmrqfDKQ/U7TIlx5s7yOlAGtSv82xA6R67BipS6Z2LQ6IRfw/mBdYbXu7OwlOhDO8Dqw
	OuCZwSMY7UnKniLdiV1OTcyPiATF3Ufi9050zm7ufsKX6EyRYxIY/14PBzX7oY/s=
X-Received: by 2002:a17:903:41cd:b0:2c1:737:bed9 with SMTP id d9443c01a7336-2c2f298049cmr28064575ad.30.1781180616161;
        Thu, 11 Jun 2026 05:23:36 -0700 (PDT)
X-Received: by 2002:a17:903:41cd:b0:2c1:737:bed9 with SMTP id d9443c01a7336-2c2f298049cmr28064005ad.30.1781180615613;
        Thu, 11 Jun 2026 05:23:35 -0700 (PDT)
Received: from [10.92.167.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm277319705ad.11.2026.06.11.05.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:23:34 -0700 (PDT)
Message-ID: <9661cc21-7f3b-433a-86e3-d1593dfbebd1@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 17:53:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-6-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-6-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y8mPdcpdcW7DHwyk6Oe_gJqGExeJR_b5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX6L5EVZHY3AEg
 P1hS0UuoO7LpvlptUjnXBah4Skt8viTXFC2w49IMBiRYcFZzU48qzXGZ6X8xn+k7sLF+3lj9DEa
 j6Evz/usAT1nD6HN8h2hzAYIfXTnz6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNSBTYWx0ZWRfX4DL4edkHV1yG
 9hsush3YRCFmsE2SKPSNsZlZw7m5lE9GEsQlYbjmeaieiV/UPKkuGq4h2EBTujd40ldu3itAxzk
 Yct4s95KH1TI/7x7I3Y+9RH0IkSQ25HaYOCj8iF8sJiNqMtV0UCFJuYC5JZ1edltEzCn4P0ZC8a
 tpJ+lksBdFLzX82A8JH0iTokj0vQu1MjgLjbZd9vdY5OYvULOxTNuuSxSmpQoliUkmMLXzo//Z5
 zk4DZC0IinsPb4+eq3ECaUgRt8grhQY+DFchR0XyK8rk9X9sFdD0FVeIw4FXja4O/ybvqOid3FL
 OpIPK6U5ylyhO5RTRVyXg5YXNI5WkDXFeqfiMdqHrPMDsde7uAALpfF+HBu50KVoUovlGRgRRfh
 We3yndchEoTg7CZ35Q3PzDcf3neUsUSx/kYbgFNcrjIs9HqGMSyVushUbrfyJS+yHgHwpKlEP8Y
 Zr5bBmCC+ZLIyX2vmNQ==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2aa8c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xhZcOr--89cURCpmMK0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: y8mPdcpdcW7DHwyk6Oe_gJqGExeJR_b5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112759-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC8AB671C8F

On 09-06-2026 03:17, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS device nodes for LeMans platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


