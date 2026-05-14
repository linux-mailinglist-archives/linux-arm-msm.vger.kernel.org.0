Return-Path: <linux-arm-msm+bounces-107571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNEmBQqnBWrGZQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:42:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C765A54081F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8648B3029A71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAB638A72F;
	Thu, 14 May 2026 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8MP0Xi9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6F7pZBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F8389DE8
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755326; cv=none; b=HVOAg0sJ6MpTr1l2ZTVXR6QRLr19C+y3ZyxBWxlJiqlDnhHh5Jb4JOqUabTxdW+MBbZ2kF0xJ/fQt4jVvcLYPOLpNqb2cLlm/TAaD1NJSEpQAx1ppaLDrZhMR/0Vy9w263GFwfmIDQDjf4VgDxmd6bXrAX2oIfZCBo5q/CgbuNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755326; c=relaxed/simple;
	bh=LtBhtfiuv4Y5RfZicaEGd13o4R6rP5rIMEbH2sSRdUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T7UgKCqr1cmqfFA2lW8QA3m4qBFk6vdGCraZhCg6DYwMTmt75IzGqIcivZS+eLSfEyQvg1VPXfRC6Kz5xPQ96jxUd+xQZnxY1HZLHIU/uJSw/rw94Dvz9MmRVOEpaNJv95/iOFlYU1c90JdQ/TZ5iJZUepWPCiC/GaiIsA3eAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8MP0Xi9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6F7pZBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9k69W2796433
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yUS6IJYb4IGli3+2TEPKUq1iErZcoKG3jUP0gvB0qB0=; b=E8MP0Xi9BnhX64wC
	VFKdcdFt1oEDVmDL28VdXZzbAUWLXrX/ihDDIe32IUztJADDzxO+2eLYnHa3k/tV
	Z3r9/x24C7pMiegcyaVkebYXgzY99Uca2LFhUE96LhybvTBNfx/FRBpfq2TCbiBj
	3gii/PleLNeCwBcnopJODByOa5G6owpYpd7jgQw8MwVGH4OkluPZVhq0RL2rehlB
	PyYr2bVagOkOWU0Dsep5eY59CiXekSeLURhtRS4GfDbxM0liEcMCdmg8N5ctBfvS
	MaznUq0ZUWeWfkSEsQWGbfIRuPpGTsX53ENzFXl8LCRqlkeA1wI7vL6F/+eiHg+h
	1sL6ig==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492srw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:42:04 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313443ffa2so544399137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778755323; x=1779360123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUS6IJYb4IGli3+2TEPKUq1iErZcoKG3jUP0gvB0qB0=;
        b=Z6F7pZBKwGhxw7hdWsXpEU+fzG9wdBw+HRzKRMXcrgLgzd9j/Xp670Km7HaKvKYWeo
         H8itV4eGgKHxzLyrbUkERuF+PFN0xjHfJoxQEcr/YEih9lkiVmMiVM56d+0cqnp2I7NB
         HtQYzuAqXD7K8ff7YtpzedefV/LoXZEB8vidcK6SfvA3vrbB2fSYnO22IrzpCNOdWwNC
         rTIkbYfFWJM3LoGRxoVgSDZ6jkRhygsxgFhy+4WE4ggJ6krfvaAAAb8krwcblAIdssn+
         i8lNH8bUiEQrLC3zqnxWOHSzfMMy1aPO8Chez4vMj4cflsip7RcAgj+ihbMGkYAN10j2
         KSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755323; x=1779360123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUS6IJYb4IGli3+2TEPKUq1iErZcoKG3jUP0gvB0qB0=;
        b=fl/pOZ6O19WiIQVa/pX9gVm1am3rEhrcctSEy8zaYr8TGo85vzUnGOummM7fVXp4SL
         aF+aGxQH9WDY8siudmqrCSX4pd+nVH13suflmk7xcD8FejxWIvpp48vpMNL6RcvcCE0e
         nm8ibgMoVw4OOuizgIs220vKjKlj3ZMjD6552ChPCFZIpDaE630lsG27dgvEqnbYrWeu
         BXi0EeX5gBwkZ30UWsS3LzW4Fl5lZA8AEm/y2aKXqU5R3OTuxSrk+pTjOPZy1zyBCGLz
         QeZRmgfJ4i8B53uzoemjY2zpXruD6ErwK67xju1M38otiHwAR/VAiPO7Oob6MFxB0+Sh
         nQew==
X-Forwarded-Encrypted: i=1; AFNElJ/BAj7qAWJlhUvPUPZu0NvS9H5Vf/7oFu0nXMj27Y0rC9ClmMwO7gA7ooCBHrJ3Zv1uP4shClGnQsj5+AW3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ULuSo7DcmeoIdY0+nEJuYE17epJlVGCzLRPsRWgnH3yfvg5p
	E6YRY/yzOFCQ+pkicw2gRirQa/BJI0e+thhy3HvQccFmMcd86B/YN33YPFtgI+f5nkUyL69j/df
	BNMFRrY0A9aAMIbZdbgPmkwL0zkb24K40Jvu8+P3FGT9aIcZMlPO6YUUY3Np7+fM+jxDI
X-Gm-Gg: Acq92OHuZ/hQ42bZP9q/N5BMcZTn2J5p3JNUhoRWsCD9+GZvnxdDU+YpMrkq/AvCAsz
	+ZUOEMpD9JgoGLuL/ZBwgM2VSG38AXbzl8C7WnEIQpUSWOrIDWtzK97rDj/DhBWIkVRBgV7IIzp
	S24IuIQKFlJDDfS2+N5VuJLvBsigYBrlDhDlBXSZ/v06xkVcre3+QPPYX0J4MCOW/ASCeFM2727
	SponOfu95dpwCNNhusXaaX7c36GUKq5yZjpucI7rP49lGaepRTEBeTdINHhuQ5BYZdsFj/WAXZX
	veurDpgoQNk7svkL2kPHDkIX/5vTuM70xEbdee3vEcjeM2masn0h3eyUaudUpj6XXrKM7Ywsh3z
	5h9O/bFi7ThPWYSgZMkZkZlueO3v4QoAFaLnF+PQPwKjqRpK3MvleaSRjry7Zbbs4CUOwyY04xs
	J/y0AXVMewYa8DfQ==
X-Received: by 2002:a05:6102:b07:b0:633:3bf6:977c with SMTP id ada2fe7eead31-637731db5e0mr1487110137.1.1778755323589;
        Thu, 14 May 2026 03:42:03 -0700 (PDT)
X-Received: by 2002:a05:6102:b07:b0:633:3bf6:977c with SMTP id ada2fe7eead31-637731db5e0mr1487093137.1.1778755323219;
        Thu, 14 May 2026 03:42:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm74825266b.24.2026.05.14.03.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:42:02 -0700 (PDT)
Message-ID: <2ddbee9a-05b5-4001-9025-1dc760979e56@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:42:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-3-b5070dfbe460@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514-icc-ipq5210-v1-3-b5070dfbe460@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TSmmIviIoqVp9ThaWH-AKh245e1WhPIt
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a05a6fc cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XphJAxiLvHLeF-1rOaoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: TSmmIviIoqVp9ThaWH-AKh245e1WhPIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwNSBTYWx0ZWRfX3KMATSQrxECl
 UOq664xoNSQKP/QPEFGnp0tv//bM6M54AeFJJ4IhSY2FWmFJsFWOtluR8KZ3CG7Ka7mbmO0GAiY
 vBpar1X9KiQucYav/irgSPGaY1kb2yrmOGQJqADq8wNkNXYV0HkqNdF+qmjpp3ZKRjdf1BkxCm7
 7a3/giT0QFl3XxAFeFH/GQ7Xc4MhXwhLsQmLHxUr8Sey4ofqLkdxRfFvEZ17Xe+I9L3EtNvqpju
 mx/jVYjc/xvNKX+LPZkb7NvwOXLi4weYnVVt5z1pM3z3sHEO18J/5V+9SgOwZiKmkCd8B0f2kd5
 eMjOcmIVXouNznDYDVeEWqfl7d8/xmAk8WoRZvH/tOvxmrS8jdOIxB+MTSwlzGAxs+GO4hkL1BU
 LHD/dPCcurjg0dTflST3h64v1W/ietAT6zjQ8aBXHZfcrk1abrt99jdkcgtXO/irO4nw3QMblDM
 sACh7SvKKaYUyitk+bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140105
X-Rspamd-Queue-Id: C765A54081F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107571-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 6:05 AM, Varadarajan Narayanan wrote:
> Add 'interconnect-cells' to the clock controller node. This will be
> used for enabling NOC related clocks using icc-clk framework.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

