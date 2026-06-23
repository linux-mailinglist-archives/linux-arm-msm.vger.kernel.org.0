Return-Path: <linux-arm-msm+bounces-114213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vTgiDtN8Omp7+AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:32:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6936B719D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:32:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aYB6eHcq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ggeBtpTY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114213-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114213-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCF443093555
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616323D4117;
	Tue, 23 Jun 2026 12:30:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169FC35E930
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:30:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217844; cv=pass; b=p/rDrdDOUxSOp2tmuCXlXtvEUEbaTShz0/okaPGI+GSiBXy6E6urC+B1u/DuCSTvO5uzRtARaDXmjNBjCGoIjIei3QGw98Z/tnYXwA9Vm8xWIZx/TzUDWVFZvu7Ux88V2f8z+E9mSY3g/T2Xr4HmfLZEpiyHtD9s/2m1JpWFEJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217844; c=relaxed/simple;
	bh=KqJ9tR9MwbyLMUZlwEX/xSNTx/JemCMTpgM7qmlLJYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5DKbiuQ4JhhbeA9NK79NAEtGaRGv2uX33gsz0piI33fv7/xlRhG05ep9o5+UUY5jFfzwiGrOeojOy+z29E9oANHq9nFk+UheXHh0oCI/mKgyr0wiK9WoFE7pOIefCnrCJUbWtDsdu/zwOkrZpWtd13QOWmOnP+ispSE1FNXsA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYB6eHcq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggeBtpTY; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYdNq113363
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=; b=aYB6eHcqzB/b/0pG
	nCdPspOI0ZMFcQSsHfco2vgglQkoGteLxesnSme7Z77+46aCDsq1xRp3pbzErHe8
	Ke8KsH7KR8LjCqQqB6Y3m7f+fJ9+ouOz1rlkOY6JMxzLKdgakDtZTEokfXUhifhM
	iL93tuIAy9aBWYEPZHSEQ579O2tORdzxhJ6IsrbTUkALg+x1f1QCI+WZ5eSnSI7r
	61AWBmlM09BTX89DDn/LwhPjGypY04JS8iqxbBbmL8nuvL/YA1xk5UC4rDMZke75
	+orAQ3ZSGj+u5qnbjYzZaZJJwug1jQ8k6fc61zHH+tCVwZqTbAgZWRtIHaHj+t7S
	76kkMg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvsexg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:30:41 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-800292c6be0so13424847b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782217841; cv=none;
        d=google.com; s=arc-20240605;
        b=ME5h4HHl26tX9EDo0ZQkyfmFH8T5tzPcG1Ui6C3UwzKS61xows9E7u7pdIgMfCLCu3
         R4wQey73sr5ns9qoBKiQ6UPOBiyIZWdwnsNdsgD7l5s3gSZdNyrwUsoc8nNVWlJTjdzP
         baaTZgaqbXXYjGhAIuAZMaI2WnoYtSYUNEfquJu2sMjyElQYIEXISEshHJknkBoPXvHz
         aw1fxcgzl95/zFCq85hooSBISlaoDjmriJXE95Kw3M7cSkT/L7GIoULaUZaCt7HLYbwb
         GYPkIhjqunMFyUhtrmmaFA8LuIAhcatPGQCoG0k7iAG4fa2Xen+Jp4iZBb7mCkbXopnT
         dNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=;
        fh=WR+o5yzEeXiaOSmSS9+T54S8Utu/miMPftw/0kKC13E=;
        b=AY6NJiDhrmIEbY+qhDLuwH+m/cyL+2PXJvEb07Z6aMMGQAvLw9f9bbqrgpMP/4tVDR
         3+enB+RpFticityEGIj7GfvN5CBbc1JdFtZztYxA/Hp2ZlJvWf7E0u5+nr0aiRq1Bxlq
         rpUMRbXQ3vMUuPq0TYJ5DyJba53xRox44UeFaVVNjwNP+iaDFJEvXfwdjOyfEMXtkQfz
         M9t5EZZvmHNDmOvS1/OUTQ28Ts/J5wcYUef/bdyQgDPdTDFXEt8k1CE6hhWLRO3KrcKO
         3cED4FuYRpqhdUYtonPXkjR/ol2gUpkS+PofuDcZ37IUt+65R9bAkjtDRbeHeJklcqW9
         r1aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217841; x=1782822641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=;
        b=ggeBtpTYgHSNWkJBBiKVeQQA5o6sY0u8dtaacbZYesSyAuPpsPW11hmsR8ela2uGNv
         /SXB9YdvgAEDQFLWCyr03I8p1M49j4TE0YW5jacat98lDvBAlgpmqRANL3jeLrTbYeES
         j7i17oP/ymyWtUEex6d1aff1NJC1UWV2/w/LLaJRJG2fW9GrsLY+DtU6XB1TmWHN0Cx9
         RVQrcEireIPx4Ibmv3CqnKIJrQks1fZ1ZR4SJLDvYaC6SoiZIsrEt6NScTYYEM85GB1h
         wH0V9CHF8GajMGcuORhoIuJwNzbriPTs6lnrR7NmTdX59tVoIm5ET2RaftFSwX3o+zdL
         D9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217841; x=1782822641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l/F9MuVrs0A1V4OkOG1O5HRm1rsfFqA413eFJZD2SZM=;
        b=S/Hn8RlW+DpkDXghs3ZXr66yx6DXfHqUrTadES104HatFIbEA9mNTUlkJfYr6fmL+S
         gn0fFbUSpevN1ix+70aQnbUYhqa7RGBTnbICCI0nNRtRmKNI50PybWOJZq55ZES1bPog
         W0p7Onu/ZTnQaxnyDTKf94lV1dxnaLBdx2H7FmtpSGc8Xw6oxy1X6RguI7g46rSEeZ+s
         6HrvyjEtTlKOYx3iqlosFPU1oiMP8UnrI1/EJaO2D6ZsPiw91YOcrHB+x8DAwT//DrYk
         eNvx50dP8KvDjBa9gXa8wqf4ipjzpFDsy7KnNwHN4H7kTUsdUrjG8iUAOxJG6KAU/PCP
         aRlA==
X-Forwarded-Encrypted: i=1; AHgh+RrXF0PvhSP7Lgk+5NIfrODxfWIcqHcjpJ0weh2YDPWOVygHHFJhreN+dK2+VH5g8pQNkGnsX/Bxb1wsR7mm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6XNdXc7GCZlFuG60loqQLaLJ8QL7z5w7/fSI0u8p07FeBWeGB
	eQz/W0xqKVDLG9K8JTsdzhfDtz7cBdb7tP9nxEYhgkISzJjaLJTshlJYOQnXrws9uTBJL46l0Yd
	o2jk7vXlCOLrBLmTU0lNLjTJtq8WnqOABSTOyhzV8g+k4qE68BBLINPS6frzebjZzNnhy3JPB73
	iGMoSqnN2XzzFKP1Coj8MMcieTtFFM3GpVcVOt7jk1h1w=
X-Gm-Gg: AfdE7ckV7bHDS1bmZgGFnJT+8f5tvvWUzFGIW6Ky4wXzoxvqbPZmQ6NSmfecflvobqB
	EOczwA4zEoE0i6dd7VmW+VPBXCsNEQIOVDJf1mEVV6/h5pw4q8Z5woZTHXX58ELfhcZnwvdQAnF
	2J9bqY8MectgJP8/1N1beolaOZpleszulMDcUrYTcBJiWZzHmGkG5jO4McHRzl0NXWmIqN
X-Received: by 2002:a05:690c:46c6:b0:7ff:3a40:d97f with SMTP id 00721157ae682-801323710bbmr187404907b3.28.1782217840732;
        Tue, 23 Jun 2026 05:30:40 -0700 (PDT)
X-Received: by 2002:a05:690c:46c6:b0:7ff:3a40:d97f with SMTP id
 00721157ae682-801323710bbmr187404447b3.28.1782217840128; Tue, 23 Jun 2026
 05:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <178065883033.3171433.8446753794680185025.robh@kernel.org>
In-Reply-To: <178065883033.3171433.8446753794680185025.robh@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:00:29 +0530
X-Gm-Features: AVVi8CeP8QNIhESCYgjuAS6yT63Uj8PaIaSkaRLC7VCSJ8oFpUWf6gegnGmTHYI
Message-ID: <CAC-tS8B6xFMxsZ=Zqw8Ox+YLLG7XfY1WTDab4aZoopXuRYScHw@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a7c71 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mfCsxB9_3l_S4IKQe5AA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMiBTYWx0ZWRfX28fyf5R7FEaL
 UYDLcjghfa+P4dOKdWAZKQsRxV0b+uNH8sXBHpmaGPJ72hEgAt0KhF0oYzl6PvBjYgOB0zjG0r6
 jR/PKcU9WSDUW6govJtYvkvRtJ6chXE=
X-Proofpoint-ORIG-GUID: PQDSTWJV7GBlHL5flnTv7IAImn-iaF4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMiBTYWx0ZWRfX4oRDhX7zdH1k
 G+U/MfJwY7LPnRE0LTPza5AnohFKrj7g4ThI7lC+DynHJxZLTRlm/xXM37Koypa6pUbcdQvRH8M
 gzxaatWF5sYnoVPzBVFJZxnvO1bG37U+lAE47Xo4zGEpveHVBLigoVsC+O9Xuwve0ghmfq8i7JZ
 ixcEZfH/Qlh8uaaDqojnhBfMXWO8nwEhWQFsW7hrUT1WljF3BbZCP/uJ4gDKEww8RWJg/0BMeH/
 Oh/LJcVbRybCpvsvVHuxFLrbF205mdFVttZkLJpyljs4vfxQXn8qyBj2My5KgT95G0N2QvH/g2r
 wgTmuDrnjPo+juloJ/3AeUy+E6tucNeqz9d//Vtrym3QSTdT/4UXz8U8uXoJhTAomrVXJqqgd7d
 vo7txwk0lFQw/FQWQmNJgULXHp44Sw==
X-Proofpoint-GUID: PQDSTWJV7GBlHL5flnTv7IAImn-iaF4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114213-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E6936B719D

On Fri, Jun 5, 2026 at 4:57=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Fri, 05 Jun 2026 16:07:28 +0530, Harendra Gautam wrote:
> > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DA=
I
> > controller used on the Shikra audio platform.
> >
> > QAIF moves PCM data between system memory and external serial audio
> > interfaces through the AIF path, and between memory and the internal Bo=
lero
> > digital codec through the CIF path. The controller needs a binding so
> > platform Devicetree files can describe its MMIO region, DMA IOMMU strea=
m,
> > clocks, interrupt, DAI cells and per-interface AIF configuration.
> >
> > Describe the single register region, one EE interrupt, the required GCC
> > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@=
N'
> > child nodes used for static PCM, TDM or MI2S configuration.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/sound/qcom,qaif.yaml  | 353 ++++++++++++++++++
> >  1 file changed, 353 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.y=
aml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/sound/qcom,qaif.example.dts:28:18: fata=
l error: dt-bindings/clock/qcom,shikra-audiocorecc.h: No such file or direc=
tory
>    28 |         #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/binding=
s/sound/qcom,qaif.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1662: dt_bin=
ding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260605103739.=
3557573-3-harendra.gautam@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>
Thanks for pointing out and sharing the steps, the dependent changes
are also under review,
Will mark that as dependency here in the next patch.
--Harendra

