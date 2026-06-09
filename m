Return-Path: <linux-arm-msm+bounces-112008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p604HnmuJ2ob0gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:11:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C984765CA18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:11:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f41vUbis;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DnsVuPTm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112008-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112008-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 138A8304E6E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7943D1CCA;
	Tue,  9 Jun 2026 06:03:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF9736F430
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:03:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780985003; cv=pass; b=CAtPMlaIdxA8mO5Yuj4bfqLkiqeWRAJ2G1lBbSlP0fZLlDcHwNNaNc/K1oXwL0VEdJcTgOWaOsQ2LU+9UJ9tczgcE7PotHf91XBOa/vpo6BQWK9ULSxeXtpIK5apdmHwF4Nj64n/lCqNECvOKlMetSAqDJ/XYaiXvWyQyXmLZhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780985003; c=relaxed/simple;
	bh=L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnhBA1SyoHdyP9ZjstuLXnRYOC7LPdhgFj79HP8l6T6k387MQ5n3SJuLEidB3UarLCi2d5LQfPFKjix65s74XjS5cq3LMxli17DH9J2BAlwpJkFFMvF2iLDQrstBWRzLwaT/T4lDtJ18xhS+DcbwDhVFyU4zdovaITTZdtH7DqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f41vUbis; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DnsVuPTm; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593x1DN1510353
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=; b=f41vUbisFxFeMU45
	oYLjVeXIMDWOydds2DLLbvKjRSv52aY48MMU3ksMNbpI/QrhMXTAdpRNEQV3wkrN
	t5PpUY091jUqBWZbsJh4YsADDtIAQGm2Y6il7W2EapXb45fKnmc+sRcjOsQTnP/i
	0jmkNJh9pcQQXhv7OYcV3vkf5R5eD1i5UZi8B+OUVaEcsIHyZsHy/0CBrHJXEnb+
	5kG4NCz5Pb+t7dbb45EFoS36DJkI6fmawKadyuzb6mGHQ8hlGMjgHFvE2OrZwj2l
	5dfLXgNrPY3U3TJNrZtwlEUWbfISMiVJIQAMfezlq2fXa0qvsAhUA55hJh3HC6Pu
	Krc2pQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxee3vc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:03:21 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6dd5840c1so9220248a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780985001; cv=none;
        d=google.com; s=arc-20240605;
        b=Cp1hIX+pQP+83NCKq9YHo6e7KeSIyHOKJDGlhTFdfM7mCtyiBU/Wrx1HdPXDpjo2Et
         1H1j1uYKMw/WX2nvux7kAaYTnZ+RUNt85iw6KbSVD/mmO5ldIOSQ1JaUlXZnyXmER6ih
         mZuTG84fXnb16ngItqHpN4xIkAcOgu3TbGbCmSYlPiUl/vFaU4dUS/fyqMkKV2xpk/Du
         PXVFdT+se2vrvSA5OkYY/TOjpHsGUaqGKZFph++9CWZzQxm4iLiGSxc7Wbrpy3k4Oq5+
         B+SdonlalRLmi+aVmBsFR/7SAyP7ccEyCNXzq4xIfunUrrR1xWYeXaIbJRyrqmEaZXNM
         oofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=;
        fh=659JHDtAaoG2rkX/soslXmz+zhEZwTqisd7zUvxwSlU=;
        b=F3maUqatieeINR/nCPUEpu4KozT8PxNdnHRAMa6dq+iCc6unvS357qPJTDqzw2r3u9
         5oEPrL1PlCugg3LenmTuaKrojpjHDjqi7UuKrwI2hz2KZS3ShRzWeN+TqrryaSXrzT82
         UDyOhLSsVGSvGMX8ZYcLZ9USWdLBxhhzI98k2mhxHr1hMt+xYyZXCQvybxgynV+2hYAa
         3MjeVBkn9pW4UfeYIP4Oy65DkGACWJgqKQPRmD+tvPLVAz94UFwGPxuDaSg9CqQ4VXTe
         uKnz1RGT1pkG5SmcFNXdRtGri/F3Ae1YGSKx3Nb0e2d6wLxtBwaZELHRHa9AorfI3WN9
         vC6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780985001; x=1781589801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=;
        b=DnsVuPTmFGy+oM1Y3UqKwBFNqE9rdkQhKIn7WMrik+zyWtN7buBhG6TdQvlkOIAA0v
         qzA69XoNZUi/OA/vG0y6Yx1TWqazrAFwHPn5CyNmLWYNZaXS2xfaQI/0b+IeNiOAmUC/
         UVPiTPqW0wqFPcDY4kCOJAueOfymEdPVQhddHeLItN34fprCXtFc9OetqP6TixYMmhkV
         wZlJMNVNGKZH4P5UV8tJlTDjQzdZtnkzLtNracpX7TrOaRfrFB5Z4T1qjYvMpaYPKHo3
         jDbRCqdu00/q4UECFYGzcyeCC3EoUfiIt9IQpLiSvYcZngTvYuSQsWRQFBp9uzUTrOL9
         VGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780985001; x=1781589801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4TRBdzNZwLBc/g33oBcQeCPWXTx2bqcKr8hl9QQ2Cc=;
        b=GmPea+JaqmiYRInrqSNfQC6WmJstYQ7BF27/9toCTN5Uo2v28rolIYl5X60UtSLWTC
         1pFvhPzbst+Z3HGn6RxMAi3DbU7gxC6s+vkxF9oUfnEh3ZTdGYDGX3Z+/C2KFWrJwfAm
         DlOfUnQxgsy5RLyea7si6e+gJx5ifArg9UQnzpdSWT20sNIEotqrJX2Y1nSK1rYoFZJE
         aXRqFJfCYT/ZU2sYhjJQkTo/Srt/1k8g5VE/e7PmjxfTx5R8RxcfZUawYkVztBF/z3V4
         knXFPCeGg+OoFfpJAw27ABkjp6gLovrQ76AO4q6C2UZGB6M53fA/M98XSDyUmTaH/cVW
         esyQ==
X-Gm-Message-State: AOJu0Yzu8kfS2f4ouHcROtCXaBRM3sM9LIqQ5kVJwX8NLzGfuZ6jHdAs
	lWEjIQ5XSb6tS5A33Zux1dPjAqW3Iw9ah5U3tp8plcUl0+t2dKMIdoe+Uruip/H9QEbZlTjd1WZ
	k0EQDpboLuxD3ax3KT/R3z852MTFa3/9JjJcPJr1/z8ij7mGXKm9h2NaVq3srwu+QztZv8tHi/A
	yAEx/BeqYW4Y1+xc4Qi2vtgRz0aI4H7ex65T1LtGZxi4E=
X-Gm-Gg: Acq92OF7of4BcmFsdnZpCfR84aAlBksqs7sxdV8MHRmlBWWhqLjLOMkgEDqdUbi1P2f
	VoF0KWCKYOj12s1DqnQ8npIImisire5tAWJ5TLe4TnuiDDFZb39d+zORBrHjHWGRJDq5qfjAR/6
	5veALMLI+PVxPHpNm/Mz5bzISHB1ZX31Ez3mEvorEC+QBx43nc78Ee77KOZJKicBRiCnIuG43OV
	dGFc9IbJE/hbg/uhQ==
X-Received: by 2002:a05:6830:67d6:b0:7e6:fa1b:d99d with SMTP id 46e09a7af769-7e70ca4ebf8mr12256750a34.17.1780985001182;
        Mon, 08 Jun 2026 23:03:21 -0700 (PDT)
X-Received: by 2002:a05:6830:67d6:b0:7e6:fa1b:d99d with SMTP id
 46e09a7af769-7e70ca4ebf8mr12256728a34.17.1780985000811; Mon, 08 Jun 2026
 23:03:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603015958.1242255-1-qian.zhang@oss.qualcomm.com> <CAFEp6-0XDjuCNy=Eac94VQC6uzumeTyYPy1CYtozrADpC5D5sA@mail.gmail.com>
In-Reply-To: <CAFEp6-0XDjuCNy=Eac94VQC6uzumeTyYPy1CYtozrADpC5D5sA@mail.gmail.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:02:41 +0800
X-Gm-Features: AVVi8Cd7L4Z_UJCPjGFcYT1f94OB_jmsV2tMvP_qnmXGEQwhowQmYfvtLO30WPU
Message-ID: <CALC2J1PC7TuKyVZTmiYZmnWZnQjULGnQzw28MKT2OG02L7nOsQ@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1MyBTYWx0ZWRfX27XZIstZ2Qzt
 oeKelvxspOza7ZJDfOgeYCr0cRe5tDkRBsJsmHQFLfYLsWnceOKsXDr3hxQHitCOE7uN5kalZiC
 I0oDSg404TLqBaJiRD88hiDH03Iq3/fsENahvNXxZGUjNt6fynEwZh4gYtNCFtKeVxTz9fcnhiB
 r89l2EZfRalwSQ035SsElotiKSq37LSc+RRzjug8iXtU8K+8mzEG5foKot18l616s/qrcRlU28N
 jo7eRuRY9asvTaW5br7pl+nznayDt4pFRa+/hucfcwUgBcpqyJqYNP95h7Lhfhs9H9wjCv9+hLF
 /Q4H2PDcxQ4CP67Vbtkq70K6Uq9ACGiHR/guRkVzCcD/rL59N173lLw5ghl3y+4ggj/NSMBXHQ3
 7NzJl7bHQF0yVy8hHqRSXyppeevWcEMXac+UOPS7LYl4ePDkCUs6c2E8W66Mffy4M+x63oWTsWO
 8HIIMvk/0qtawGqn5zw==
X-Authority-Analysis: v=2.4 cv=V6BNF+ni c=1 sm=1 tr=0 ts=6a27aca9 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X9Xm1guRSrHqRF9YbQUA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: D8hCDEYzrnimY2qLnR6TqPOTMA4jPyJV
X-Proofpoint-ORIG-GUID: D8hCDEYzrnimY2qLnR6TqPOTMA4jPyJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112008-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C984765CA18

On Sat, Jun 6, 2026 at 10:00=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Hi Qian,
>
> On Wed, Jun 3, 2026 at 4:00=E2=80=AFAM Qian Zhang <qian.zhang@oss.qualcom=
m.com> wrote:
> >
> > Add support for the QCNFA725B M.2 module (WCN6855-based)
> > connected to PCIe0 on the Arduino VENTUNO Q board:
>
> This overlaps with another series that relies on the pwrseq-pcie-m2
> and M.2 connector bindings for Wifi/Bluetooth:
> https://lore.kernel.org/all/20260520-monza-wireless-v1-0-9f6942310653@oss=
.qualcomm.com/
>
> Now that this connector is available, I think we should use it for
> this kind of module.
>
> Regards,
> Loic

Sure!

Thanks,
Qian

