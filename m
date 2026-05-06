Return-Path: <linux-arm-msm+bounces-106050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCAKIvfD+mkzSgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 06:30:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F012C4D61B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 06:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C662304292F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 04:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4492E8897;
	Wed,  6 May 2026 04:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWFXdJMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvV1xPCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768A49659
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 04:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778041839; cv=none; b=OCIxApRM/BY4xYihDK9/mz57xI6wBFG7oiFUOhZt5Q11cNFM23mmdApm/9TIeghrMg0epFCLzt5QG5DKh3j9DzNzD6EILLSqTvuM468Sd7L/Z5j6FX/4kdJepl3nrC0ura6cKmua8dNxol8+ssnwTDgUrRwii+mJEvgSQ8OjpCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778041839; c=relaxed/simple;
	bh=KzyXUN1QgP1pIDr7BcDdx51n118ngCDLhM35Jy+uXXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7J6wgTK4dIR/N8uIe0HFf4OzY0hPGBqua+bijHildwVxj/FCBQBbI6px8DPLvGGLurgijhOrgzaNUDoRGHCjJ7k+FWXs8goTkU+4nX0t+JJLz6Dytbi+p9KIrNaLK0IBW+81e4Erk79fCW/PaC3UnC5VFeFPqOMRgnJ3itsg1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWFXdJMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvV1xPCH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6461o3iB3740712
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 04:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5UpIeHvKhN/qMa8uSRFl2kpeYl9njEmNvEgnCIvDFXY=; b=WWFXdJMacZlDrqam
	IhOzDcnrAmns04tqRp4XDidyHqj0JaTrY3m0YK6CmZ4avsFoveLpWOj8QnTG0hmW
	HwTFAEQOIbBSk2eTocyBDuWIupwknWz9Vb8LDsmBSKznwcWhuXnXrLKowBVWhTSh
	EgczdMqD2YpN8s3M4rOWl2UzwspSYaxcbZ53wHapdzPH92NIP6EcfWPhNp9tfArL
	0I4V8GKcDtaSFqi7XdGPf7vCjU6GbvEkV2JrlVyw6/vJfLr5BBzIDNwuAn5/KCE1
	4JF3ajH9b2l2l/32oN5yYae9JmyJ9piMQrKF2TGMzwzd1hslwxj+VbEOxVi4A4v4
	sLC6DQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyefqbv08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 04:30:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f485961555so1938856eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 21:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778041836; x=1778646636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UpIeHvKhN/qMa8uSRFl2kpeYl9njEmNvEgnCIvDFXY=;
        b=KvV1xPCHIm3tkMpR4s3h2WK3b2vZM8I1VUezC1/nQYjUW9LzecnDixSEfXlKvEoVcv
         McAbX411Zhyjk7kiq/eowZbeEx5lCHeJBa2pMf5wsOi1hjr4q2/1T1aS38hrKxcQfVsa
         WRKekG4KcYRU5+Cb2erB3fYYO9F7geUEZ+uu9ORaHgHPk+9C5ytHJ/1FC+qRFEpZ+vYL
         hkpm20cb0zyxVXC4RZLLOcn75fyzWB1yTQvJ1LDuTY0RbOxohL/lOvOvRxSCwucyuERM
         PXcHkvjEZJ8KbsnqnSsTHY9a8uZVG0OAWugedZGnUiVx2c2ZoTJ0XGAELQ3z3QgjQb+A
         EtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778041836; x=1778646636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UpIeHvKhN/qMa8uSRFl2kpeYl9njEmNvEgnCIvDFXY=;
        b=Ky5IdzueSNoThMybiGtmnWmALtwb9pfm1wvP3WBP2QPk1/bb7pyWmwSNB171X+FYct
         hWtLrJjzoZfc1gbc625djIJX4+fbSJYsC6wxPSvGubKMz9p1y6XSDNxsE9XTFu7jcn1X
         5IMDN3g3bnjUK34m5wZi+NUvM/CYvKtm8rAq8E6Lyq77U2rYAHPtWpbrRPJbA3TZ4SFZ
         GT0387BUQ922dSx56Ik/TDnIcUhcfABPmk/VMd7C1J95Ofv/2RXO2NnCjjlLiswIMRnd
         s057mq2tM1OZvUVh5DlWu3tqh7rlHYzkb8HmuJgKojii8U3BoGk004aJiCwOCfMuj4tS
         JKjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RcJDpMWEEuObXuQ6S0IXfXiMiuv6FzbOJ/BbiOMQhDdaIMl+uOJSYrBRwd1pYAnndqOUNXDDW6TMxc1L2@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwCU7I4T+Erj1iBLCLHOqBXxS/XNapPvgPB2w4uMmlWIDWxth
	SJSe66ntx4hmOVwcxzjglNq6J4N90vpOVJXZl86FBohEv7Z+0BBC/RV4kWEWcEmIifHpR7sK5cC
	hI4+LGQpgfKr2WYhoO8y0jCvrY8a7MS0SWXTVnpUmO+rnQLspcJq9RZ+vuBdGX5Iciech
X-Gm-Gg: AeBDietkE+JM0rz37Nz9X7bwPMvcRqDHxDNR5t79pdUgdRbQQ7P6c/j7k/P5whHey3N
	a42dk9+6vAc3Rrizf11je152E2sEQOPmj9CiGmfxDcovBnlQV+c+odQHzEMBJzI7WDAablngobB
	kEh9GSyPmIhuJpZ608hNGIgZPvRVH1C6XAxNPNEmNtZQnCZNREy16VUnLh3MKoiC3qJIQRwap8s
	03YfB03NmdEKoHXE+MagFa9dnjVdJWE8FWzjzI7TUjUNg5gQ4cJwg1tv3/p23sh21hzL6HVU/Jh
	MHgS2wMGiPBrzw5a9R+kYSf31PLb2x+Al56EU6bHgf6QrDrP3zwuin1vPPClj1pk2zQqAf2jkV6
	+A+k53udrozomLvJuQCQTrGIbQ6h2a4mK2NK8E/z9Lf7o/eTLCn6q4LYy9mK4jUA=
X-Received: by 2002:a05:7301:2e89:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-2f54806545bmr944808eec.4.1778041835732;
        Tue, 05 May 2026 21:30:35 -0700 (PDT)
X-Received: by 2002:a05:7301:2e89:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-2f54806545bmr944796eec.4.1778041835170;
        Tue, 05 May 2026 21:30:35 -0700 (PDT)
Received: from [192.168.50.84] ([76.176.60.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f57057bd00sm1579297eec.30.2026.05.05.21.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 21:30:34 -0700 (PDT)
Message-ID: <a6e84f02-ed71-4369-b816-7bb3a0fcb56b@oss.qualcomm.com>
Date: Tue, 5 May 2026 21:30:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Introduce SA8255P as Lemans family
 SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA0MCBTYWx0ZWRfXynAf2sLX5dMK
 iXFj60SC6IT8/CTf3HkGQjwg2w5+R2YRCTXvidc7NKCBJ7mIQR9bhSeTgAlkWPyWKZVAbrHK/jT
 PyKYkHegXYBSgtpvTUP+1p1CsZXUQ2r6ZJzT9UMpY8TypNmPJNZQuhCho3FerGw4tgpo4fc8EOT
 uxYw6ei39xtKLUjKUUlT4YJgo/+e3ZyLcSjqpNCxdCTWvY+vd+VG3P1iHXdjLeyxZoz2XIBUcJw
 vjtKFJyMfKNd9wibW9rOjtIwCX9aAZZ6aqPVtUnfDPJwNvIO8mEgdsv0iEbiLL/BehPXik/YLjJ
 I/zLkLykiWNDTFSyqotWUbt6UA/MapavLqAldT9GjY5EsVHboSMLgY1PT0T4+50GqBPL2ydG5xQ
 N9M/JnlgMdbxz6xgJ4toHTslIYgdsdNuKLJLHY+ZKAhhGzX47XlHTkTXoDBKSohQCK+53GeKj3f
 nwGYIa87exEo/Mx8QDg==
X-Proofpoint-ORIG-GUID: C2AY7Uac9u4bvxHOtn-XVJPwjqDbkZ9Y
X-Proofpoint-GUID: C2AY7Uac9u4bvxHOtn-XVJPwjqDbkZ9Y
X-Authority-Analysis: v=2.4 cv=edoNubEH c=1 sm=1 tr=0 ts=69fac3ec cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=0ISbvMpsx/t7i6H15JfNAA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4ozLBc_48SN-xzW_-ykA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060040
X-Rspamd-Queue-Id: F012C4D61B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106050-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[deepti.jaggi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/9/2026 2:10 AM, Shawn Guo wrote:

> While the patchset [1] supports SA8255P as a standalone SoC, this series
> offers an alternative by introducing SA8255P as a Lemans family SoC.
>
> Lemans family includes IOT SoCs IQ-9 and AUTO SoCs SA8775P, SA8255P.
> Among them, IQ-9 and SA8775P have platform resources clocks, regulators,
> interconnects etc, managed in HLOS, while SA8255P has them configured in
> firmware via SCMI.  All Lemans family SoCs actually share the same
> hardware configurations like memory maps, interrupts, DMAs, etc.
>
> This patchset moves those platform resources out of lemans.dtsi and get
> them accommodated in lemans-iq9.dtsi, so that lemans.dtsi can cover
> SA8255P as well, like lemans-sa8255p.dtsi includes lemans.dtsi and
> sxoverrides/adds properties as needed.

Tested-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com> # sa8255p-ride board

Thanks,
Deepti


