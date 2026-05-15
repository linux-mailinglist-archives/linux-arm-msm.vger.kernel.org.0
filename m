Return-Path: <linux-arm-msm+bounces-107804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFWvAvP+BmpiqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:09:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DCB54E209
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1781D30CF21E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD2846AF3D;
	Fri, 15 May 2026 10:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuvu5y4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jKq6cuqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADD646AEFB
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842320; cv=none; b=J3BlkkgWVYiVIrbXvWANnrrP2hWywR0+FK3yJhfts+wHRmVVnqpXEmZSy+DHt+nzaJEgTXoAUkTjsahU/bhmbBkQlPfmSCR9xAqniqCCK9ByrcXiybWjYMNB0bU5Ui0vMne1K8LNnesBx5DyQjTkl261iIj0v9W9ytR2v42KJs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842320; c=relaxed/simple;
	bh=TC4T0C60h3JM4c9Nzi+0aJQT6edsfDbbFjJZ9ITizDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9GeLusij/OP4fkh5hRmT49aiPJEW92WDKMx1Ii9wRYOxv6PuzSt0evTgUTx4t7d9dmt48XELlMceSsIz1JZvD/M6X/tCgJbjxLXGB3sqUDI8oXof9k/bKFF7eL5nGhOu0BKheHim2JrGZuJLGUOYLPLopHP7K9srR025FGcJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuvu5y4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jKq6cuqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F55HOk4008388
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0SWersyXK3wYrn244oU9ZcaO3tcWFPY8lw5D9aJdtU=; b=nuvu5y4V0oqwLHwX
	l01FHDoIgt90NwG/PhfGjgzLkxAV19sp36RERDOFHr2ztisQR4d5NxGRoTVQqs70
	UzPCViUdooFHSMiGnJ30VmVqGZbbq3OLztqc+/nYkav9hK9UDA4s+qZ6wZJSGL7w
	IpkFkKTRWNi91GthAvnRAcxGREJ/GdKcMRBBBU9fZkv8Li+8ODI/LROK23pE0H+9
	vWQm0m6ZEivI9vnPBp8wGRgXo/bQPJQzuzTOaVcjAt+LOKpVPx+9ACECVg6WhhYs
	t4JvyHIXASfQ13jDENsad4apy2djWu/lcPI0I5uWjXdN0eMsd63W5PSf+1dhSwLE
	aqKwWQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stx8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:51:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-910552aaff2so45683385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842317; x=1779447117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0SWersyXK3wYrn244oU9ZcaO3tcWFPY8lw5D9aJdtU=;
        b=jKq6cuqa8CXYwmjHCRDfbptIbHbQHGaCjMpBVPV9iznyRf4/a67yyVlPS59CAGARFr
         W5RU0d60enyHs3WYQRlQrxkrroqbmw75xe/TZ9UAAx8DD2ejxhxWkcxQXr7IVkQc7Qc7
         NehNJUMGCnOr58+lDgcWDmN5bL4HaND1VXlDQB3+YE2euXFo6tDCV1wB4gkGt/WbyGd3
         cJcnpH214efUcZMyTi/3HqOa47/5FrCebUO64lkIV/qsfi4WacRUlqE/SbdkMwWxPbxK
         dXX+BrHt2SSYTFgow7pZutukjFjUJmW5SJiB4+S9Y/C9QlPjADDCsW/nqg0Iz7J2ag8a
         La+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842317; x=1779447117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0SWersyXK3wYrn244oU9ZcaO3tcWFPY8lw5D9aJdtU=;
        b=T/UhWBCa3nZbeCtXn/O5BA/nDsMvFuVa63/gpZkmzh/SSgbm/8BoZPA8I1uenvvvSt
         uUY0XOVJFqGreJYmeWg4xx9JNGSSPZkoSoDDS37DbluWzFoj0boxd4M1vNslo8lTq1HB
         Pf7nDyp7KwjwErZKSj+LsFE5VphIC0AyHKxrMcofpufKbaE1xkTTSL2PSrqywYINvkus
         loO6yqEYlM7AQs0UH6649jR9ntsdiglaaQChIkFLEM/s7uy+E3QoFykCHngR5ZxlUpon
         TbWW8DXkIp9LcAR8PpT7SYKjcfjDGz4dE4TbfFpIsjnnIpiZ7TtR75wXCx+HexdMOarz
         P+Ew==
X-Gm-Message-State: AOJu0Yys3hbUULbwAcu0OLnYB/GlkulQSdmCHdSGrnbGcJcJtaniEywC
	UFuGQVMFDJpkPQ/8cx2CCvfbkZe1izJTowjr0a58rLGbQL98R5dnyCpn4JM4hAKvGbRqRtMlLDH
	ggmEV9Gwxbu9bPxcK7PIQyLuTnCYVu7w0/0yz+zgS3lChuLYAGOa0O6+rgnQ+XHl6HjS2
X-Gm-Gg: Acq92OEgvGTjkadzynJXM8zq7etk7M//j+VVfgY/cbhA0aCJYrZOPnWgLjeBHF1WiuJ
	kK0aClqg+1F3pYS+Jsu/0e7jYOwKTR6HO0Ph3nCtk4A+MSPlmyxXQidf5rpZtv4jbI7LHT9Va5A
	tawqBebkXfhPmkpba5olFIb1pkh+fV24KnM/sZR4wrahHVjXMcq5uO+AcMVhHMNdQt8eHcSqQbU
	XY/WMcsk4sN1nFp+EJbMRNsxLZoqn0XMu0rMydk+wemLC4pfq1dPgbsgCJ1oG342D8Xkmu5lMbq
	ERW6Q3umQUm4a0UXiA/+DpmuowIw0wo06tSW4kJBeb79MUu8OfPWN3qXCX9SfxY4UEYgqgTWHD3
	VpD5vFsS6viZOn7ppGVcem+nT1928y9jOgT+2/OPdEunhuO+NS7lEtPmWf3eaOE3UpHCJwx3KQX
	NG4Zs=
X-Received: by 2002:a05:620a:2845:b0:911:318d:cee2 with SMTP id af79cd13be357-911cda5186dmr391523585a.2.1778842317386;
        Fri, 15 May 2026 03:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2845:b0:911:318d:cee2 with SMTP id af79cd13be357-911cda5186dmr391521185a.2.1778842316959;
        Fri, 15 May 2026 03:51:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e800sm1964619a12.6.2026.05.15.03.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:51:56 -0700 (PDT)
Message-ID: <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:51:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: qian.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bgnEpl3v5I6er38usM8htVe_cxjeq6PM
X-Proofpoint-GUID: bgnEpl3v5I6er38usM8htVe_cxjeq6PM
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06face cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=w9MK7oTFDpT5FHjZt9AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX/ZUyGCjr/1zF
 yCcwyvaHanEyrchLbP32NaTK0W8GKL4U3Mi+QyWRPUIVBQceNpH3nqXIzvPa6KSu1oUYboRJJd1
 LMVIUzTt2tOLL39GjrP+X5lesX6gbEqnBLFKfyDAAtWjG3eSWQtD4XL08EqnDC32+niRT7Qcytd
 bj9MM59MUV2OAx1UYtAtbqu2grI4n/dv0ttChLzf8ODX63rnN7pI6ffBX4YzLrKqTzeGJEdntj4
 ZWlJvIf+mKddcjcId0b8iUeelrHzXX+B1Cwp83yOwOVRFUHxBL8Sz4jNZn80RzzC9Zz6/1hkc4K
 eFuAJcfZi3Kvfuj8oFVxSG+BL+DWujllAwwgdWeIUoEDMbfpPbdjZ82xwrWL4fo3vvGjj0NN/mh
 rC+rNBP9nDaWIWAOfoBeArHSTNr4It/4ig8oXUolBWVHulcwa+mfGBYxeRwzEx8/PSmzvoy9T34
 l/dl8UzEReEi8qZG4aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: A7DCB54E209
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107804-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/11/26 10:48 AM, Qian Zhang via B4 Relay wrote:
> From: Qian Zhang <qian.zhang@oss.qualcomm.com>
> 
> The QCNFA765 M.2 PCIe WLAN module requires GPIO56 (wlan_en) to be

But isn't that just the wlan-en pin that the power sequencing driver
takes?

ref: drivers/power/sequencing/pwrseq-qcom-wcn.c

Konrad

