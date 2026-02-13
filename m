Return-Path: <linux-arm-msm+bounces-92758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHF/Ls/yjmk5GAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:45:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4FB134A0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD8AA30523CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61208340A63;
	Fri, 13 Feb 2026 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fic09R8V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFKY+/G+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B0534F24D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770975949; cv=pass; b=ahFobxE8G3OlyyaH8sV8vjvBLodd4WWUMh+dGhRlBuHCrhbYakr5La1e1uk2VOYyxQLxBJWYQCIMGUrUfYkWV2KA1jHaSTdnsSC1z4Sdtfc5zyDj5CuocakdirSsPbQbFYK15QurMRXzkxXfsTqnIqkbEBkuJelbZ8IMtHjYbQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770975949; c=relaxed/simple;
	bh=/yLcqxCao6dHbAS3lI6LLK1o2ie6NJHDW+hh7EnJywo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTo3snxk8rK4+oM4ffk533Q9TlwWodBGmeKicpnZn9+V6RlJHoSITfZV8A1rLT/dVnruNoVklvex0CEvd+KX2msaLjDOItDWG4SW064d//TNUQXzP6yOL4cICHPazZwPxVMxeUX5MfXpoAMlve1KrLjsV4jyB50K2viiBAq7zMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fic09R8V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFKY+/G+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D925UL2733479
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Y5ANPyeVlTxnxEsw0dAIbgZ+/TVJi5Kaxl/X9EUk8A=; b=fic09R8VZqB6ROXe
	uOgCFUM6uH0lGRWdgNRh+QrJlJRuPyRQHds8mpcDmukl9eOTRoWBdSQFxE0gLD8q
	IZlZX1VvmOZTrJiy6VvewseExRrnqLu8SU9rXHsY+eWI3H7bkRc/TkvPNX6rgEfr
	O2CXidRdsWn7mqxJTySq913FIBx4N1YAvuIWQpZHkly5RaXm/WGxYx3HKiO1rVMH
	x8tGJ/h2W62AOfn3sknXeOMSIPQAnxYVmERpEkv2qsVRmVHnBXTBrlFXBNNl8xMW
	2NdJjOLfP+g4zut06awObsfLgdamePHo6v3eILumT8T/cd0xYXMpckt3lysaBIpR
	uWoVKw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wstns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:45:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-897021ebe91so33887996d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 01:45:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770975946; cv=none;
        d=google.com; s=arc-20240605;
        b=RJzNFDhMmI+hIVSPGBRxRnlI0dfiR9yb+QINbIezgTrCOpiz+T8GDvhxAY0Ulg6mXA
         4klNEyHZtUjTu3MT/eG65TW4PjKjHzl8lcuvdvf6ry776qwW+PPPTxH0XM54m9LwAkLM
         yEKUhMOH9RInO0HdL44SyiMM8SrSMwjDqWPwqYMp2S22tewMwcZ4FDXj/Kb9rze78Btx
         hazDpiF3DK6/XPt2sQI+dMi8f/EimXJNmkZIDhYCMuZAH2c7Uh3U9JzmDZPgCgCvGLQk
         NvLWEDjkeoeubhXVlw6AfeqPmKRk1TSJdY2tbgjauXmixCdyRktMUCvc7GZAcy0AWNB4
         BZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Y5ANPyeVlTxnxEsw0dAIbgZ+/TVJi5Kaxl/X9EUk8A=;
        fh=8IOhlUzi/fcUwOrEXZHQvOJ/Gq3Fch+8wwRB20V+8jM=;
        b=WQbvLvqakJCmcp4Hgy5W60J4WC78ZGy1h6QEBbGUXToobb78EX5KNyrkDF5IV3D096
         P1atA8sokaZ+wkNctJV1fUCJpWIBhAABzZWOb9cjxc45cOPDdnET8LC4sMxXxPFgYBQ5
         cufqDMWScpQbAKu4oqnttpkuVUV/YPbxnEldnauFYCkcI9hryJ8+O8f5etmuKVs4IEOe
         g0nmpfQsojAt/Jle+kaMvffeSa0e/UiLAtI0g5yr4+9YwKkxu1BIhhAt0NrEuc/TCR17
         6jO8+04z/VID1DRll2IhoDFXxc7txufXVI/5kv6H0lzE9m5AYttTfppYdymu3+GOX4jD
         /Agw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770975946; x=1771580746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Y5ANPyeVlTxnxEsw0dAIbgZ+/TVJi5Kaxl/X9EUk8A=;
        b=cFKY+/G+8HtcZR+4VV2cha3iyx5hHia6LXXphRVPqGV34F0MdJ5bV4jCpxAZsUKaPx
         rv5GpS0HRq4nppVU/T2A4qJE2DVv18mowOD9petgFT5XzfwoQEui1O1xbambE1LaRf0y
         ZtIooAKD3hE4bnsQ2bkveOookPu6IrIM07KwSyrHrqlfpD0jarlHGTLq14pRTBOb6zQI
         yRDBde6VUHTIFMOhjPJ4GlLRoPjt9B9VNGw4qFnu2Aeq6a7ni+ASuCGCNVwe88ZvouCJ
         7kvUOJD7kYiHyUOUfSW7HbXJW2AaHXCAing+/BvQYnbuyUaZmU+2FaHJ5l+lThaCsgel
         t2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770975946; x=1771580746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Y5ANPyeVlTxnxEsw0dAIbgZ+/TVJi5Kaxl/X9EUk8A=;
        b=PkiaufvGTQBZLCM6EbfpbuPAJ74vQvJQucPtw3aXxpiSu5y50TAwAugHf5PAi6fyq3
         wfvNQNdH2qvt798/eEDWSLbBmDJWZBuJkyirdbCs2VCFHhCnKbpvCKp9hCzz4jbw6MIE
         4XR2cOq9SEm/iqwax4fjbyFhftfCJ/EV8gUffds8Ou4/KT/FtmbHjbP0FZ4WFt1egPcG
         CqGxlN9O9+Q8ABkX40tUsvDD2g+jS+oW5TwZN/1L2oEod4xaPCU7zV9+ljbwlmbntyb/
         4vY17p66J8qZ6fhh8sk60975MzEeu3CKfqQzpdONs0tYtIJ2l+6y2nqvggNXkPHlGlbZ
         H6Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVDXRGnHmDGFV8WHI6WNxtVZOl3dUwK0pxKkmOYWt8OdkDR5DYdBo8+NuvpJWx+jiK3EcDhHYc59OLSW711@vger.kernel.org
X-Gm-Message-State: AOJu0YwccYIGJAR8Dcn77hQaqhjMWnf0M0mT0apGiQTdx5FZoE0fDbwI
	XRbQ3muu9UshwnwzGE8q8MfVhYmYDjewmdg/iTKIegwFEEHYOG8WOpZuqMXZ8r7EvP6jKuOAbXq
	ixIZlBdB9RZQ6Hr2Zzkjz5YXxH7Jw6G/pbxxIng+fcbE4cyB+VNxAzsMIUBbpyv5hhq70Q+2aBk
	duSXUZdeoJ1saB3wwFzp0nQ5OmGatc6UDMi0xKmxF2ZmU=
X-Gm-Gg: AZuq6aIrhlkJ8COPvW/NzUa6oejnP1iu+p/XpALlGIXyt0GNmIc7zPmY/7g3fcxK9Bg
	rfuDe1Qc1Vm7QY4PWd4Ng/VjIpMGY1dqGDdALtB+/ZGxGRPdCiGEbmKLdfBwrZl/waQWaYEcdF+
	rw+Py9yEgoFWeqv+fGgeyw/VwxdsLho1XCdUDvp84AAgndiBklNXjYZYJ3loH+U4j+gux4A9sP5
	u8rhyf4AEy53UPg4BwKGKv15wYYf3pGokRwn1dD
X-Received: by 2002:ad4:5ecb:0:b0:892:70a5:3bfc with SMTP id 6a1803df08f44-8973623f2d5mr13974876d6.63.1770975946428;
        Fri, 13 Feb 2026 01:45:46 -0800 (PST)
X-Received: by 2002:ad4:5ecb:0:b0:892:70a5:3bfc with SMTP id
 6a1803df08f44-8973623f2d5mr13974716d6.63.1770975945971; Fri, 13 Feb 2026
 01:45:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-6-loic.poulain@oss.qualcomm.com> <aY7pvakkOnaYsd5p@hovoldconsulting.com>
In-Reply-To: <aY7pvakkOnaYsd5p@hovoldconsulting.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 10:45:32 +0100
X-Gm-Features: AZwV_Qgp2sXMbTLoidW0oZj9IwUjAleKMG8enw0mdOJ7DRvGHPPQXpM5MMV7gWc
Message-ID: <CAFEp6-3yk3sPXj+hGuWvAFsFJAXjH4kWLV8k_5_v9Hax0XxaOg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
To: Johan Hovold <johan@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nsj2-3YPjjxDv_xgF3hnQWTx5pI1WhuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA3NSBTYWx0ZWRfX9eYk05So4+/s
 ZxnerrfWbtYaEIhLOECCfVm1rUVpwHWdGAzA1DuWXWqPb4Yjd7Fd48aIwMUsyASSPI665OcFwke
 mUzoC0t7WAKiB0z9/TWKonP4aP7qnh4MmcDT+iiHPJigqtMWUsB7bm/2wU8Cfn/CmSGGoFdSzSB
 30TPoveWVJi3DH8lnHXOCUGdhAp5o62Dg9sLLRdIFP2qqpufHeSSbePCHHz1tuUjAzXB9XozifE
 6QctmFZFkCsRgxU2gqyuPdTbCitJbGkGWivTMdz6OHIUIAl0RdUHwELRLNqCIQafy0HVbZThl6V
 IumvsKxhkIOsmX6MyiJtpn0UWLZw4tbVYMZehTh24mc3WvbRmRe7XeUzYLFl1RqIhG2BAkgF6GU
 u5trusL0erQHZ6UYT9FVPnwM3gQE+5aImbPbTNWkhUp6uqfpicz7g6QG6622IMKiXOMCq6IrCYR
 cyGHPdIX5u1khS03kQg==
X-Proofpoint-GUID: nsj2-3YPjjxDv_xgF3hnQWTx5pI1WhuZ
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698ef2cb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=stOHKsqbLDPUz7k-wIgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92758-lists,linux-arm-msm=lfdr.de];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 1E4FB134A0D
X-Rspamd-Action: no action

Hi Johan,

On Fri, Feb 13, 2026 at 10:07=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Thu, Feb 05, 2026 at 05:02:40PM +0100, Loic Poulain wrote:
> > Enabling runtime PM before attaching the hsphy instance as driver data
> > can lead to a NULL pointer dereference in runtime PM callbacks that
> > expect valid driver data. There is a small window where the suspend
> > callback may run after PM runtime enabling and before runtime forbid.
>
> So here too, the commit should reflect that this cannot really happen in
> practice.

This happened  in practice in the qcom=E2=80=91qusb2 PHY driver, with the s=
ame
code flow.
Bug: https://github.com/qualcomm-linux/qcom-deb-images/issues/208
Patch: https://lore.kernel.org/linux-arm-msm/20251219085640.114473-1-loic.p=
oulain@oss.qualcomm.com/

I know it may sound unlikely, but this crash has been reported
several times during boot=E2=80=91stress testing. I haven=E2=80=99t investi=
gated
deeply enough to determine whether it=E2=80=99s caused by an unfortunate
preemption window or a racing CPU.

I thought the series was already fairly conservative in its wording.
The titles use terms like =E2=80=9Cpossible=E2=80=9D and =E2=80=9Cunnecessa=
ry=E2=80=9D to qualify the
crashes or unintended events. I can switch to =E2=80=9Cunlikely=E2=80=9D if=
 that
better characterizes the situation, but the issue isn=E2=80=99t purely
hypothetical.

Regards,
Loic

