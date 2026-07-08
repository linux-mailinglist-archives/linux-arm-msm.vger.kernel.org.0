Return-Path: <linux-arm-msm+bounces-117768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HLNaDUZ5Tmr2NQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:22:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1CF728A4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:22:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hQyosJ2X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZaD+ofyu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117768-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117768-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 070EA30838D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE89041CB45;
	Wed,  8 Jul 2026 16:00:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575AF40928D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 16:00:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526403; cv=pass; b=i+VsrPGeck2EyFjx7vMax3AFnb8ylnY22nuvcD4a0y0A3eg2tTMlxzAf4GlX++CngV9JWkzZJLYugIvrF8PfuaRsg+EF3Z1Cm5SimZmZ5YzGfNa0VSLIMQk2sLHDdcOBKH/JGSH4RAL6nABBIltPJlQCyia2aGta97iGjoeqZNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526403; c=relaxed/simple;
	bh=+XvlrfevpEhHEhMG5k4mAyz1MKzMbdgxVvrUukUJ+iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDztuCczLLR8FQDMe5b5QDO1wsC/NZhETmMXrmGBrM12jtJKuzAN5xs2CigRzMYvHJnAjK1xvsZwI+NWje6dthQeePvrpamoNugZCMcRNvlIm8Fh64P15aP09075UOvmQ86V7bMyihLYgTihqBOwk9REvHdw6d6LM+GqnejEIc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQyosJ2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaD+ofyu; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Rkt2738620
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 16:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/KDa/nFvcGqLtQCRCgYR2/CFmbZnbqY7AG66N1zAjwM=; b=hQyosJ2XSKj2/xX+
	Twf64aut2gDwjGjQ1XPht47ynSUGxROl1EFo4VfbbWCqK8zmQzL2rEBQXV32XXJa
	uB1xuIXo3VuooclO7RyixL4DBekeguURGHJqV+WsRwXClwoIV0Dv6/Vcxxws9Ey7
	qTFhtx9q6fXElirSUKnSD9eW/t3RzGJW1W8CfKyQcQfyJtxTAw7OlivxMs3uN2rO
	iLK6XwIP89nOP1qvMuh+ZWLIWMn6/BBBY2t5E1jfC9LcsyJKw4i5s6py9X7kKPwJ
	tWaXZEfGg/kxDB74HdDLx9Ac0rmqVNnrZLEfpEri9bBZz3kkMl8RT8jZJj5ejXjR
	FLt5CA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv2853-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 16:00:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso1555785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783526400; cv=none;
        d=google.com; s=arc-20260327;
        b=MIirLXO4oFDWJVArm87d1EcUzheOhlf1EZwpoGimK021PQJo3Ek5l/6P2GH2eENW2g
         FOrXtmg17PnqyGXbo99DDFmt5GANHi6LuYskVVFIZnWBa+McF1ubNr7yYh646EWVz4CN
         jIh/fuGq0Q9S6AjiNs9jZLrNw8/T9Sp/D8U91MCslTKvesOcNn+kVxX5aHXf6YL4cGVh
         x6hjgTHZUp7blcf18H+oPLd6Um6k3F63nc4qg4azrS54VzCivPVrQ/8oy9BXmcCk4YNZ
         hviYY0bqlvqGbW8g/CFjgIIkLE2GvC9xru/SsyecNGRlM6WVrZT5YfVKqC2KDsztSLDK
         Nmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/KDa/nFvcGqLtQCRCgYR2/CFmbZnbqY7AG66N1zAjwM=;
        fh=1Pwfa5cKy4dggmDT+0cHwDcnqLyvgI8LeGc2VrjRH+o=;
        b=lM/MjerVKAgh77JrooHsEIHujUi7G0x2a61YoCT7Cnu2KrBLzgDLRkjPPZ/toZkYir
         ThM7TIWwOFelq6x3JyEy7V4adA/mAhfIHWJNvJuqs7NS5ewDyUpqK73o/tEUf58mlPky
         PGt4lD4gvT5LnTAOMY8pOMw+x/XAiSKubZxRWGVwG242Zjk5WDxMRA5RTY/24dFRuH2k
         UMNwxEK/3yPaOSfepfTmMQYopkYhYirpdxZ9d5Pyzk9oi2KW/v3Mlc0GkqF4jq8Glv87
         0IfQC/7hnl5ctXAOj9Wd96Yl7QWytndBEyJomAA05meL8s0oBvfakJodc/Sbk/xofPHv
         jKHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783526400; x=1784131200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/KDa/nFvcGqLtQCRCgYR2/CFmbZnbqY7AG66N1zAjwM=;
        b=ZaD+ofyuj9k7kQXbSWt+27z0ZQxQbMYIVViu2mZq55HsugpGHCJ+eTXeWYMYnz4vAi
         ZHtIHM4PV/e5ZBp07whz8bDYr0gww7me9jCM9Hbz2bOBUlK7JkcjYD8mXD/HSjiUf3qj
         SAL93CZHgdC6AnCgdOM//pwGcyxfloZZNHl7Bfc674CCU0ebL1VFeR1/1zPtRU88jTAU
         19y2AoxoSJQCKkLkzA9a6+Gl2ENXsRtxyvDYvbCPLNpKbQ/cciYRtAeH9zDsXwqf90Sg
         Ui3Qds6N3AcV+WW8qm4RThCHqzIfyrswOhPLBAyCe0qJKv42tbSK3xsJSuqWk/cWA6wZ
         JmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526400; x=1784131200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/KDa/nFvcGqLtQCRCgYR2/CFmbZnbqY7AG66N1zAjwM=;
        b=DV4lWJWCWtGSjJ5dGMfhJf+krHzGL2rExDd7j9/Qg1CLpKMIxJbGE45q640nwrp6+W
         /KZ1eVYlPwLdj48ojE4XiIaTj6F26P8F5hiCTh4mX+SfUYkatSo8EdZQnwj2AizLnpvO
         +vBXpUXq+29xbCkdesVEVFWyv7xmmb4a/+1zs8t7L/bQfdjnOpd+mnc+MbDcFbpRMI2A
         pSedLmo2mWFnhNFMRkhRt6z3LzUehW0k6kAcw4gN7nwr8jSR1hnhbtWZJ8qeNTb/6MtT
         v61uk2xNjD0ayimkTlEvHL6gmpjfg+UD+bpx1Jt3dJxqwuLqtQMGszlk1hc8e078RcHL
         6wHA==
X-Forwarded-Encrypted: i=1; AHgh+Rpg0UEqPc/KhgJ46vTA27QR5BS2a/Nu3husEgnUoQ0nAiCoL/k1Bfkcfk6AirE129ARrC4BsaemQluksbMd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrxml5cWkcewxNPuzafhJ+tIMPXowNh5KkN1DMa5ve5Eoi/7sw
	1F24u4fTP0maUtesFFZJB/9gblbaDcD5bC9G0SO4KDHiixFcWF89+x76tFPSY33/1v9nUE1/v62
	eYUowOI6SLpyX/75oUdqzVj1nQNLuVE4ThvPdj0an7WzqYfaRRgCUy+9HaPLU55mGYjimiJAEKz
	78qAqDDHl2fois+FCPl5NMoVvKrmmE+p4bljUlQdpYYcLW5xIpnu4=
X-Gm-Gg: AfdE7cnRNTKtAWd3yznavc51VPyKjUh0+dmX2BRdrnfZzitFSQ3j9yv5Nc+cPbCaiDf
	oax4xnSna4VShMSD6M6RxlYq9NUfqLzyKBImnV/eF4Up1AJjVJ/xiXntPIsmW8chtpDd/62nbFI
	VONk6d87Eig3KWvidxZyPp4Mgj/ZFckMouxVDa4Gpi0za7tpcO8wrsqS7T4tuuyDS47WRq
X-Received: by 2002:a05:6214:4197:b0:8e7:eca9:de1e with SMTP id 6a1803df08f44-8fe9ff3400amr34160736d6.3.1783526400321;
        Wed, 08 Jul 2026 09:00:00 -0700 (PDT)
X-Received: by 2002:a05:6214:4197:b0:8e7:eca9:de1e with SMTP id
 6a1803df08f44-8fe9ff3400amr34160336d6.3.1783526399826; Wed, 08 Jul 2026
 08:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611085238.37666-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260611085238.37666-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:59:27 +0200
X-Gm-Features: AVVi8CctTLAuJ9qFC-jA3hxZEr_XvCSE5_0BizoiE3Fpxud_73f40EnOZ9z0jJ8
Message-ID: <CAPx+jO9k_Rcd24UErqHSi9-4AHyGYYcq8E6Dy=n6wGQ6kcJt9w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Sort table entries by index name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e7401 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=c2wLe-LXPUWkI_yqov8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX/7RPH4jQDzON
 rFyyyDPhBEKuF/6Xn5mgRrda8Pqc3jWj4uJlM2hdHB57ovV/DgKpw8wchnYsf3B0h/ZbSTC/D/T
 NuHqh8q6arjcb7jzWpCF0umM5vmDlK8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX+UrNwtoql257
 pNxrITNRUDBeEcp6/kSo2UgbNPfbtdG7mc3UCK5QELiXVQYzo0gEtrKnfCNaxwYrVLVD2/X3qtG
 2qEHJnrvzuaaBS8ifBSrTyoqbroInkwdgviU7OKMoXNamGehDpGSIaT2z9CThRn7k6cQxkS6osc
 6SFCpRcbyn0ki9UEY30MrirzjNyX3JyJac1xKblbZktkTCHhtMY+ueBgTS5w769nqTZn/hQ2ABf
 SYKbe9Miuyr1lI2PQCokxPX8DFnOlyEiBGnjP9dn9vhMFCjMTAflgu9o4uuhE1+jBJ0X8HeDXaa
 RaU4KlS/l+R/n/OCAlsYhjw9X2JRuz5mBvsDUGjtyngqZR/wWT4vrzXemQQIo6LV0lK6Iw7C9rZ
 4CY9aVU0m2GgIz2Pc9CkATWj1/CiZx1UlWkonRc4gygPRmjxqg5zMCk+gknYxq97qPlzuYqAwSA
 D6Lirvi39RHxWdFYAPQ==
X-Proofpoint-ORIG-GUID: UwECaeeM5aNfq5XuqSnd_BMTKzW8L68d
X-Proofpoint-GUID: UwECaeeM5aNfq5XuqSnd_BMTKzW8L68d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117768-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A1CF728A4D

On Thu, Jun 11, 2026 at 10:52=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> List of power domains in arrays of 'struct rpmhpd' are sorted according
> to index name (the define, e.g. RPMHPD_MX), not by actual numerical
> value.  Fix few sorting mistakes, so comparing the tables between
> different devices will be easier.  No functional impact - same binary.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index 63120e703923..c12127d8e8ae 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -305,10 +305,10 @@ static struct rpmhpd *sa8775p_rpmhpds[] =3D {
>         [SA8775P_LMX] =3D &lmx,
>         [SA8775P_MMCX] =3D &mmcx,
>         [SA8775P_MMCX_AO] =3D &mmcx_ao,
> -       [SA8775P_MXC] =3D &mxc,
> -       [SA8775P_MXC_AO] =3D &mxc_ao,
>         [SA8775P_MX] =3D &mx,
>         [SA8775P_MX_AO] =3D &mx_ao,
> +       [SA8775P_MXC] =3D &mxc,
> +       [SA8775P_MXC_AO] =3D &mxc_ao,
>         [SA8775P_NSP0] =3D &nsp0,
>         [SA8775P_NSP1] =3D &nsp1,
>  };
> @@ -325,10 +325,10 @@ static struct rpmhpd *nord_rpmhpds[] =3D {
>         [RPMHPD_EBI] =3D &ebi,
>         [RPMHPD_GFX] =3D &gfx,
>         [RPMHPD_GFX1] =3D &gfx1,
> -       [RPMHPD_MX] =3D &mx,
> -       [RPMHPD_MX_AO] =3D &mx_ao,
>         [RPMHPD_MMCX] =3D &mmcx,
>         [RPMHPD_MMCX_AO] =3D &mmcx_ao,
> +       [RPMHPD_MX] =3D &mx,
> +       [RPMHPD_MX_AO] =3D &mx_ao,
>         [RPMHPD_MXC] =3D &mxc,
>         [RPMHPD_MXC_AO] =3D &mxc_ao,
>         [RPMHPD_NSP0] =3D &nsp0,
> @@ -480,9 +480,9 @@ static struct rpmhpd *sm7150_rpmhpds[] =3D {
>         [RPMHPD_GFX] =3D &gfx,
>         [RPMHPD_LCX] =3D &lcx,
>         [RPMHPD_LMX] =3D &lmx,
> +       [RPMHPD_MSS] =3D &mss,
>         [RPMHPD_MX] =3D &mx,
>         [RPMHPD_MX_AO] =3D &mx_ao,
> -       [RPMHPD_MSS] =3D &mss,
>  };
>
>  static const struct rpmhpd_desc sm7150_desc =3D {
> @@ -698,11 +698,11 @@ static struct rpmhpd *hawi_rpmhpds[] =3D {
>         [RPMHPD_LMX] =3D &lmx,
>         [RPMHPD_MMCX] =3D &mmcx,
>         [RPMHPD_MMCX_AO] =3D &mmcx_ao,
> +       [RPMHPD_MSS] =3D &mss,
>         [RPMHPD_MX] =3D &mx,
>         [RPMHPD_MX_AO] =3D &mx_ao,
>         [RPMHPD_MXC] =3D &mxc,
>         [RPMHPD_MXC_AO] =3D &mxc_ao,
> -       [RPMHPD_MSS] =3D &mss,
>         [RPMHPD_NSP] =3D &nsp,
>         [RPMHPD_NSP2] =3D &nsp2,
>  };
> @@ -809,18 +809,18 @@ static struct rpmhpd *glymur_rpmhpds[] =3D {
>         [RPMHPD_CX_AO] =3D &cx_ao,
>         [RPMHPD_EBI] =3D &ebi,
>         [RPMHPD_GFX] =3D &gfx,
> +       [RPMHPD_GMXC] =3D &gmxc,
>         [RPMHPD_LCX] =3D &lcx,
>         [RPMHPD_LMX] =3D &lmx,
>         [RPMHPD_MMCX] =3D &mmcx,
>         [RPMHPD_MMCX_AO] =3D &mmcx_ao,
> +       [RPMHPD_MSS] =3D &mss,
>         [RPMHPD_MX] =3D &mx,
>         [RPMHPD_MX_AO] =3D &mx_ao,
>         [RPMHPD_MXC] =3D &mxc,
>         [RPMHPD_MXC_AO] =3D &mxc_ao,
> -       [RPMHPD_MSS] =3D &mss,
>         [RPMHPD_NSP] =3D &nsp,
>         [RPMHPD_NSP2] =3D &nsp2,
> -       [RPMHPD_GMXC] =3D &gmxc,
>  };
>
>  static const struct rpmhpd_desc glymur_desc =3D {
> @@ -834,15 +834,15 @@ static struct rpmhpd *x1e80100_rpmhpds[] =3D {
>         [RPMHPD_CX_AO] =3D &cx_ao,
>         [RPMHPD_EBI] =3D &ebi,
>         [RPMHPD_GFX] =3D &gfx,
> +       [RPMHPD_GMXC] =3D &gmxc,
>         [RPMHPD_LCX] =3D &lcx,
>         [RPMHPD_LMX] =3D &lmx,
>         [RPMHPD_MMCX] =3D &mmcx,
>         [RPMHPD_MMCX_AO] =3D &mmcx_ao,
>         [RPMHPD_MX] =3D &mx,
>         [RPMHPD_MX_AO] =3D &mx_ao,
> -       [RPMHPD_NSP] =3D &nsp,
>         [RPMHPD_MXC] =3D &mxc,
> -       [RPMHPD_GMXC] =3D &gmxc,
> +       [RPMHPD_NSP] =3D &nsp,
>  };
>
>  static const struct rpmhpd_desc x1e80100_desc =3D {
> @@ -860,10 +860,10 @@ static struct rpmhpd *qcs8300_rpmhpds[] =3D {
>         [RPMHPD_LMX] =3D &lmx,
>         [RPMHPD_MMCX] =3D &mmcx_w_cx_parent,
>         [RPMHPD_MMCX_AO] =3D &mmcx_ao_w_cx_parent,
> -       [RPMHPD_MXC] =3D &mxc,
> -       [RPMHPD_MXC_AO] =3D &mxc_ao,
>         [RPMHPD_MX] =3D &mx,
>         [RPMHPD_MX_AO] =3D &mx_ao,
> +       [RPMHPD_MXC] =3D &mxc,
> +       [RPMHPD_MXC_AO] =3D &mxc_ao,
>         [RPMHPD_NSP0] =3D &nsp0,
>         [RPMHPD_NSP1] =3D &nsp1,
>  };
> --
> 2.53.0
>

