Return-Path: <linux-arm-msm+bounces-110924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sMRYDYv+H2rptgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:14:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32A636734
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:14:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ffAyZhc0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="fM7/0QJq";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110924-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110924-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7E4A303A65A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 10:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1B14418E3;
	Wed,  3 Jun 2026 10:14:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663C43C05C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 10:14:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481670; cv=pass; b=Syd1wtiBWFRxsbrCvyEI5a/VT9D+J1TEgPrJp8Y/VgrHyF5qqV4JZtYG8JONtFxVGFE619ZX3rmE+ugmhb09rrivKS2JCseZWU6r4zWFAIMgZMF9b+Sj1m2eG03pUwHdICyv6I1xHsCjBXlhF3cL5ZpFCVqx3byjM2nQ/GwP9do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481670; c=relaxed/simple;
	bh=Jk9heZwOVqGxyGDtvVS1hW7MiNx1ERlOZdcIgUuajXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qc4JjXvATi9gDPq9Nr4ebGdlbnMj/yYTdSvfYqDIjc7SJQ/a7paiEfaxL43PSzYTyF+kplzQwbIIfqBp44j7v11XN3/9WOJWfbjRnemsx3cZt6FW+lvfViCYw/PgO3Ho6isOq8pXK0yfEUlZq16qL5vcdS+KhEqNxglenz6Ee1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffAyZhc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fM7/0QJq; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vRfL2368043
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 10:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uV+J6jqoEMAGseLw1HdCj1i8yDJLhJwR59yrgqq+0HI=; b=ffAyZhc0oZDXLZHI
	PBh9V5mRzbnzoqLOfggjyij/WxjXBfmx5SBgCK5pslCTfVwqfAXRIswIo1wN8djR
	Q1FsswYFtYmOKGMW565DTWwgv8PidsvVIILmCr/Ay7kvVZX8lSJoaI7+FQDyGJo6
	v3u9Xe1MuI426fiQx6zHalMtl3EnNShgMzTBP+8JBr9q71DtMl/MV9h9i+rlmgGb
	tb2cYkKDYRjXjeLM0QUigYEDDGtAmhMm0cmpveaWF5WQwDHYRBg8+G198eNl5hWE
	PKQH/vGxnW2NgSbU1Fn9BlKiyZOxZ0rTRjxmv/5kV6ecIfWOjxXDf/etLEj5ryKC
	pDxWVQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gg27n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 10:14:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cebec24b12so49389616d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481668; cv=none;
        d=google.com; s=arc-20240605;
        b=fZy9K/df1Lgtl1l0tB/DvNIveor/rQ6ShVVdchLVR8ltqc2T25LGz90gsqE5bmz+hQ
         IM09SCSIOTv30GmpFCVXwMRMATgUq/xxYdFEGGCav2b2pvdmMAkIVs9u6kuXB93nc8Rq
         oNu1raUu8zYqkWzzLtmjUcr401jlR79bqy5Miji5EIhIGk3I71c7UT/efJ8tqohH8Sh/
         +W4QeW0MzO55kGMtAnCJduX3MvO/G2ZZ4q1BJGTcPe+/Wn0tdFxNhk/c9uP0Ri7WUvlW
         pU+3bRGyQ8lZvTm2gWkWItCPoNOPWVFrcnPWqACyQJQZlYVlYnc/HGmtq9nmQheA4z6R
         b89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uV+J6jqoEMAGseLw1HdCj1i8yDJLhJwR59yrgqq+0HI=;
        fh=ZZ6GiL4kV0yCMKT0RiO9DDcpLuOmfbHpHH/k2vsvLi4=;
        b=d3LCOJ1v1hcfUFwkoNAUp4SkozLbk0Mgqb1po61BpKTAGvU7PaFyc79u5gmgutg3Ae
         fd0D2U/K33iSbRVhWoCHWTrTpAEQQ+vYrT/oMFSyq2fb/iQarVumtsnuLOrsBHZjGD/z
         CRfjQspSumvQIS6abP8VvN3eB9GQT8xLnHvJ8JoDNwnLPrtdrAsEwLTLsgQH5xjCPWYQ
         Qff71nvdEb4HOvtDiBqzVrUWL9tUhGW1rQPnl+a7gYequTS4qnss6RtN30o09cXmwC5Z
         TkCkc1o4285t2Ww7pF92K9/48TE368+s08pbCvwD4y5WHSaeLKF820N41s9rR2BUUxuI
         k/1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481668; x=1781086468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uV+J6jqoEMAGseLw1HdCj1i8yDJLhJwR59yrgqq+0HI=;
        b=fM7/0QJqcxS5HSFCwhrpzjPjMY+iqm2Ugo6Qz4QRpIg30zxrRJuA/NJ7cR+BMjGx/T
         wVr5y/nhJFy2bxAQDqc/s7yXmUKTnjqzURu+vggrO1bGLGr+sPyuHIiWefR0ZyJA5GXE
         cPmUurtAWnjUbKEf1MAqE5/IYT8YtA1KxnCNSBQ8H6auAP531XIsoYe4Rn1F08R+nTgI
         qlWy6PeCztczHFoykQzxMt0++FGOW+avVEVjX2118x9TGyf+4/Bn5BZWbXxmWZajkZRz
         r9uqy2oe/ZAheMORA2LOJNFQj1Xk+RKiuNWZvlCuutEJjwBEdD7PwUmCa4c7iv9BNch8
         ZrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481668; x=1781086468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uV+J6jqoEMAGseLw1HdCj1i8yDJLhJwR59yrgqq+0HI=;
        b=bVajyUhr023vMfAzVn/+07FiZm8K+fpf2O8TgSjk3cBXTuyuoyFWq6eXGFhObqeSKw
         A/O00SyB6yPJa5MG407BqbZeNm535a2Qj0aQvVWvLR14M5DvDu/fkGgfNcERv6PY97iw
         EoRvmP8f9+6ozhSJ7D8gbDJwRGTJmDGfDzHhW+ILhbCcrKfDlfnfA9/ZzMsp5YkKDL6X
         7nFU62Wsur8mY66IJNEN04kija57c7/ZZNBfxcgH2aP+aaafhpUq5foyrz3O5IJVveXK
         yD7c1PTa5422UwnbpYfEDRrsgmGKkh0AfrjVG65fkNTTkNF+NBKuqvStYcJ+JOyDBuIa
         2qrg==
X-Forwarded-Encrypted: i=1; AFNElJ9nPfsXmIw5rQTajD1vzOp4674PUBZxZDTQYBfU4AnLUegxutdetmpISvxAgmiWa2NHP4abm1bC4d4wkaGK@vger.kernel.org
X-Gm-Message-State: AOJu0YzjOx3xw7+jouEQzX4CbPDvl8hO2Bp/CL2SlIOjrRw9MoZzn1Iy
	dpyio3W66Juca5wpOumjXzOxcHk69GKIIXxzRe56Oolnq8SXHrVPeHzp1RG4pYWu+wxT9/HthWM
	I7TaIff5dyORhUzRnN5pJr18ZKXgqGiynM/BJG19NJ4DhPVNos6rlQ5lQ2M71hTq6Onwe06f+pl
	1DQkTeBoq2vkpoNQUkjbf+r0lvGAGjk7k9uoeZ75Fiz5w=
X-Gm-Gg: Acq92OEVGUo6cv9AMTNqa6CyMCtysjt8Xrz6QjG05zyaxSe+0kp+Yyn4mrOjJF8nUyj
	1uhbS11MYJ66WNhojliWqHbh+JcRMgzfneTRPlIID/yPET6sGq3910PEIm16au2hUQYLiX7quv+
	XXUNqc7bibCDgZ9VffOIhlJZZUMQwMUL1HyNRcTxr0JDh0Lk9wiWJk5sLRYaWmVeUw9baI4kIG5
	sJ/e4qLJk3sMERO
X-Received: by 2002:a05:6214:80d5:10b0:8ce:b2e9:a4c2 with SMTP id 6a1803df08f44-8cecdc3c53amr29190836d6.19.1780481667841;
        Wed, 03 Jun 2026 03:14:27 -0700 (PDT)
X-Received: by 2002:a05:6214:80d5:10b0:8ce:b2e9:a4c2 with SMTP id
 6a1803df08f44-8cecdc3c53amr29190546d6.19.1780481667501; Wed, 03 Jun 2026
 03:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:14:16 +0200
X-Gm-Features: AVHnY4JP4vFOFIbIAZX0F8fhDzCXCFpBg8ic4yZD31H6-IgYc0KmsNfVvQFDArk
Message-ID: <CAPx+jO-urBm+rTHwQaVYk1Qy7senTUrSZr0SvEi8bXsxz1budQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: qcom: rpmhpd: Add power domains for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX5NJBmG8wyomX
 DS8NR4IshtEkPhlQjxAdWgEG6NWtjvD+v2bwlxIyjDXJoa8vHZq2x45NJXi3g50P07A7Ocnhgsv
 F7X7H3hMArYMXS6MX9a2A0vi7FPV4BvmefANVQpB8NGFWlqM8MG4Xj9H1oY4xq71nEqMfmuGeNc
 EpjDE1jEp9PH4x3KzwEaRnjH/DVA738+9W3Gc93McGJSqKwJwn9RaRSDp1Kg6AHKT9VhNInoXmW
 4ad8AYapoj70ppWQsYtroV0JaCYHg6Bk/GuXLUdSgS7sVAuPv7bZKgojjF341hZeRsHsSnMSCQu
 K77msO3v4QeCsdrrFLPcyZ6tcguD5c5P6wmUxpnQYIXzr/GfTlKAbRNSYd4x6T8ZtxDTynRbJzu
 56cC9/PDAHJF5iyVtPy/Y69TDZocOYbpxpaMx9JmUgyyutecfqDBKVZuLinkifDV8e9gvA/szAa
 I2zaeAsKg2X6Rtfi0hA==
X-Proofpoint-GUID: gtACe45pQ8uNk2d4qXorMJMktgzqCFm6
X-Proofpoint-ORIG-GUID: gtACe45pQ8uNk2d4qXorMJMktgzqCFm6
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a1ffe84 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=rNwRBFL3uO6c_JmZLCcA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110924-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D32A636734

On Tue, Apr 14, 2026 at 5:59=E2=80=AFAM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> This series adds RPMh power domain support for the Qualcomm Nord SoC.
>
> The Nord SoC introduces two new power domains beyond the existing set: GF=
X1
> for the second GFX subsystem and NSP3 for the fourth NSP subsystem.  Patc=
h 1
> is a preparatory cleanup that fixes inconsistent whitespace in the RPMHPD
> define block before the new entries are added.  Patches 2-3 add the DT
> bindings and driver support for Nord respectively.
>
> Kamal Wadhwa (2):
>   dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Nord SoC
>   pmdomain: qcom: rpmhpd: Add power domains for Nord SoC
>
> Shawn Guo (1):
>   dt-bindings: power: qcom,rpmhpd: Fix whitespace in RPMHPD defines
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/pmdomain/qcom/rpmhpd.c                | 35 +++++++++++++++++++
>  include/dt-bindings/power/qcom,rpmhpd.h       | 18 +++++-----
>  3 files changed, 46 insertions(+), 8 deletions(-)
>
> --
> 2.43.0

The series applied for next, thanks!

Kind regards
Uffe

