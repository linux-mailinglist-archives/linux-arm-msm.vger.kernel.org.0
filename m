Return-Path: <linux-arm-msm+bounces-102701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEqGIVsf2WkQmggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:03:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E513DA070
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72452303DB4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69883DA5A5;
	Fri, 10 Apr 2026 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzGRHItn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR4OTJ5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD8B3DA7E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836646; cv=none; b=ZJh5pnrfsi4nhpaHlb+4ImnVLRlekK4lA1xMcBKIkWVuRaHWkmdB8R52ver3y7vISdDPIr0hjyXpWmh88Rpdow1jL8VpEbwvFKRyxRALsoXIQxMt9P46Yl6dYxM2wzqiQsdtpinF2Cau8KHOa7syOvQGM4g1qBKWnLYqwRwimaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836646; c=relaxed/simple;
	bh=qh9wtG50Yp48Ve5IdDl1scXXfBVhCvPgdjmlWGWHLRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDkoKSKDXs3ZBhLp/YRh2SIAZ6K4Quuv8u9E+cYfu0GBnEOcRQoZ5k5sQxOwXXK15WuN3V6kawCIL48RyE3/xDzFpR52ltE6U6/zCKOXsplHRik2WPxenudxQj4Mo/bE8rv/YKlOdV3ZeTx9nhRLf90yhK29ypgR2s4Ffkdm0FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzGRHItn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR4OTJ5F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAcgFG4148029
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vt1fY/hZDTpSME7QkNrl2ujl
	DTe43Za3yhtgb4mp7bs=; b=fzGRHItnZik0H4frxR1Zbiw8DBTC2aLwTGj2Ix84
	QSoMcBViZQgEyBCzQkdfs6NZz1S1sob8trOsUkLRWzN4FE3oO/SMcfA8W4EBQPzw
	9+z0gUnjJnfZz2QjVWiXE3fdfIOnQyCn64ePPCL4prG5f4TDD3sfq/g0zjqZKm+V
	i/+zS15GsFtkn/Sok7SPZMjRz6hUfY2ewoziK2GTWFsOtsDbOnH4w1UO51K1m1kU
	V7w/Bmx/PQmCDOL//KJR7WrOAI7E/15ArCdfq07KGFT1ZyDjvVbHnJWq2KZcNcVj
	zje3Ydx+MWNGkp3Gs8othyFXl86AVX96rG8aFXqYbE7e7w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgj0d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:57:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12711ec96fbso3163869c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836642; x=1776441442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt1fY/hZDTpSME7QkNrl2ujlDTe43Za3yhtgb4mp7bs=;
        b=JR4OTJ5FGx7hWbyqEOd37WjonN0xe2EDuTK+HdOQHuIiWUBONC8QWophb7WZSagXXx
         5WUwFVlrWXhFL8oWw57iaKrhSC8MjrzUD0nqwqnzHUvmiTko97Zj+bRjIJfaY++N1VE7
         pVsafosFlGBW2uqYKxsi3v3B7wZ7RxyPk0kt7D2z0PdQEny+J+mPOzxm7P3oSVDDadbJ
         pybTDcdBjg/Zlwj9CQxmTSQGDDGFSaOifyg4suin2AZcH0lpCLUJ6YIXixJ01yTLYARR
         3IibNAvr2hEf1F1tebEbyeVGcPurKSc8mordPls3JoAhP0MJDx5/hoxfzs1J7niRGyuD
         Z0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836642; x=1776441442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vt1fY/hZDTpSME7QkNrl2ujlDTe43Za3yhtgb4mp7bs=;
        b=DMwVJlVgpdfzF6tkv1pxy7323HlqsriiF3O8uweF21qwNf69HufEWMzjPzS1halStY
         N0Rjx/wEdEGVardy2dsSOi3GudxqZJEOGpGcbrAVcXEzocswEZ9TteVP0m+NjnfM63Tc
         LGOnxF9jjXErtofiOoWuipsVVYlXk45o2crN5mTwV5Bj1uAkcQZcK3OsYwLyecCdJgZU
         9rzhdob4FqD0VavO55SCvnKtoYywA2o2KfOZ7A88z29XDJ1s+ICWZfcJ+VkyOr1yqbmN
         S8gzNBHgncEm+EfREe0bdw1TwwHV4dYEhrOGXEHYwhjtxDUyXz169OGssHdr5MTLNTbj
         rfrw==
X-Forwarded-Encrypted: i=1; AJvYcCW5vz9HRslAPaSzERe/+HfQoDF9ULmZ3s4lXmr2PbIk6W67itv2/NPx2u0Izhf7YyjLgf/BUlNTKul26AIT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy4aynj8lMkFQ3fpm4cAjIzcvoOdCnF/55MadRaxXq2LHNiI1o
	JKZa3eApad/P4mes+ascV4HZuaOfaICgiCv55HT3OW2byqZ1kktwG/UqHhh7sXUMRphVcWl56jD
	VYZrL809GAGr1zzC8bE+yIV1WbrcCx1oyyMnUA/y2LLAgWa63yKmbsSaAwbUEdlpUv+SA
X-Gm-Gg: AeBDieslw0iif0mJyRxKX2NHWAA8hwj4qpRhTNA9gLCFFho4eQBFeoarpx9Fj8B040H
	kYh4AL9CGQ14GIpZNKoBMbzKGRibJPa/OZ439EbftdE1/BaKUNZtHspLzwENFGeYBoQsU9CunHQ
	UulI49XYspa+fI3jBuBjn7WiuNjxQk/Aqj6E9WF30qcICTPu2Xcz1zjttwN7+s2zpmDGQaXxvpq
	cg+8eGA70A7JoPf4FRukS/ZSk7ObDc+sCBnwRy8N0W801NsRXBBj0YhxAsfouh/BzOJWlaNyVS7
	cOSb3OnykmKgywXFI6cVnHZc07cpMPIFzm/yEPpJFWxghyw0S+DrsSDZ++D4TobUZJgSBE8V/wu
	bThXHCvRvgG/XWdBRYE0rdHHbqMaWqCrVqEWt9YSd0IY3MbuQJRlBmmn/sTLhvnGHrrT5EQMHcH
	Q=
X-Received: by 2002:a05:7022:ec07:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12c34efc9d9mr2249567c88.24.1775836642026;
        Fri, 10 Apr 2026 08:57:22 -0700 (PDT)
X-Received: by 2002:a05:7022:ec07:b0:11a:4016:44a5 with SMTP id a92af1059eb24-12c34efc9d9mr2249533c88.24.1775836641456;
        Fri, 10 Apr 2026 08:57:21 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb031sm3733104c88.13.2026.04.10.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:57:21 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:57:19 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] clk: qcom: Add Hawi TCSR clock controller driver
Message-ID: <adkd35ZFNvhCcTCc@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 08agoQ_3KI78IBroNYpvacnte_vu86WJ
X-Proofpoint-GUID: 08agoQ_3KI78IBroNYpvacnte_vu86WJ
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d91de2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HxGML4-F7vsqb9dMjnkA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfXyIDb4bDPD+Qi
 ATC6nKTmcvCTsKTqSesLhA2cD80C9hs92+F6BGCWqDfoq9w+tiXXtssWWZUY3z5WZcsdrlz4hHP
 kHz3h5jfWlCRvrYc8Pw8NhJaI8kucrFwWkuUaNW/W1fn4/X2wWtnFsyhGNiZKSvhOAHmsiqWIGx
 mSCF6RpP7+2lpTLnVAWFk3aScE+g3d5glDShFYrKSIN8wkVcTswmhlSPh61+xj1iWTbbpKabIRq
 bph04fKvWPOWFRLM4vg+rDzVTOWR2qQN6m8aO0Otk3DwthoETbdE6hXPNB0p/U1NhUaTa98bOVs
 oeK8vn1I9aISbuIEQIFHqVjpGu1gRETfT8QfK1JpbpFMlFfxHPaUaKZwryZYthpDdxj0UHvh+CE
 Ylo/374xRjc2r7Iz4of4rtHEm157VgLSWZnatUQaaRbpw7dCdkqM5ucl1S4ZkGyg1XOkztlCIJp
 SwVbIeRFYy4k64A0NIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102701-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mdtipton-lv.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62E513DA070
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:51:39PM -0700, Vivek Aknurwar wrote:
> Add support for the TCSR clock controller found on the Qualcomm Hawi SoC.
> This controller provides reference clocks for various peripherals
> including PCIe, UFS, and USB.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig       |   7 ++
>  drivers/clk/qcom/Makefile      |   1 +
>  drivers/clk/qcom/tcsrcc-hawi.c | 158 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 166 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike

