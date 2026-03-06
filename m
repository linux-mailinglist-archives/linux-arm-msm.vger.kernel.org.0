Return-Path: <linux-arm-msm+bounces-95914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLzKB18vq2n6aQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 20:47:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B088227333
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 20:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD32B3040A8A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 19:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A74142F544;
	Fri,  6 Mar 2026 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="huoB6ej6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ukz6OMlj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C506D3321D8
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772826459; cv=pass; b=kbpGzY7d7oPfVMgSf4fuOAD+9ZzyGc0Z0PTaL68ZcjxCLcC4N1fcH0TNx350CRhEHISvZnsW33z8hZosffa54ZymF5ZLljsG3fWGLMNEL6gAqRoDSBg2r2F5RhUuU0MJy5PupmvZNdloyfTI3YwdFL1wAA51VDnZliReLGhvNkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772826459; c=relaxed/simple;
	bh=VegoySy3Hday4UDO63qyf6nrV/TBBf0Vz+6T1SzUDlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3U2/DwtvN3IaYECp7xxo9nrIZ290arhmEq/pVdL0UotaoJvP1b+cjBAftRV1Wy2lmfLYFt9Uq3RN8d0ykbPDhjz2f5ITkwcf2GKHwhGqr/G/CVbBD3O2DzP5Fo2YV5VxbtK8EImM5j5zQCc1xJvjQBxhIp15iSwxlemZHNKl6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=huoB6ej6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ukz6OMlj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1qhY2164033
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 19:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5nTFkvWRlBwa8CwoxYQdnOTwfVARN5qGHvtojP0Pu8=; b=huoB6ej6u3TIeCt2
	FhxCRCwxb26B1R6f4DVdQIeAvzD9eUSVU0fhtO49kynPlyu5mfwB0UM7YPuC4vOl
	TdKzQ8xnijDEqvXX9YWvC82MXR9vKJGHNa1+n8CBd41Gcn3Tde9yNDCTonPaZvqt
	G+JQEmNAHyzU+KVYo+1Ygh2Ol3Gc2Cr+5l6ohFgM/q/L1OoUGaITx3LaJwWcTa0B
	WWi0+bYGnxvMaz60QrdEklAWWFN9wnkDUODP4b/K0pKAK92Wf/aTpNdfcFVNzA91
	sTqCphHFtMh9O7oKDv2++OHTSlBdQrwlfZT9BEUiEEj26uEUvKG31HFYYOdbt5nF
	441f8Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9aj0mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 19:47:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb413d0002so6028536285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 11:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772826457; cv=none;
        d=google.com; s=arc-20240605;
        b=FPAcwrraK+fIFwHlwmSWnreNR04oyI6byILi9VZaUml+1xX734JUYb2V08vgSELKHG
         5a0GmV0dX/pkHDsEQOkgq7G2Nlkwl5GaLB9z++Nrwkf5AzMg/O8LxlMO9PZ2XpQpj52K
         Xv+Sy3bI1gs8Tjqk8y4QyMuaf2VEhnxby6acVRtzjTl0u3wv3LEk5Km2onzTM/u6+ajo
         qtb4vUdfy8rkx+QyScjS+5nEPX45KOVlFGHqY79tbdHnALmgM+XejnzVC+40cyOgof+9
         EvkGbG0ZCoKxYd1Yfa9eli4YZtiTIJ8RPxVYpr8WOrG8MO4kVIIKHMo/41vVZk8fho9J
         s9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z5nTFkvWRlBwa8CwoxYQdnOTwfVARN5qGHvtojP0Pu8=;
        fh=S5Z12kAiCWd1bxJZQzEReYD0Z9vzjEdGoPmmjrsGRHI=;
        b=FHsbdDg6Xfn1PycEKWncBxSk6gKqzJyWW+lTPLWmYAiQ+gWurQNWXpa7xa8S4wWVMY
         LwkA60wJsiHNMWLCsGTAuXlu056B8jkQTHFTPXkJPJCxUTkzvDoFKjx0Ij4vrbyea9L0
         q3UZyNF1epTe66WpwvShw2ghegaw/Tz3jl07sxPK2UePdaYbqeimrVgPbG6gJv9N4pjL
         5BH+6pgNzN3wB1jhpMoHoZXphGVHto8cixGCKbbHgW3b1m5nYtowVBNr4IT1evW43BVz
         p92jCARELVXVsoB2+aHrhIh78J3G7dnz+Vqx9tswtfjYO303+zamGdNPXpped/ZRyvC3
         Hwxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772826457; x=1773431257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5nTFkvWRlBwa8CwoxYQdnOTwfVARN5qGHvtojP0Pu8=;
        b=Ukz6OMljWUhW8wpH5XCBURclA9y+zqe0EUe+//whH8de9dOSWsvmHJKf4FxKSNbCrs
         34xmXNsfu4MoryB9Lk7YFhhKU/5fo3Mv5tAHQB1EY4S24JTcPTnfu7rVvJm8O9mrSJt9
         bIPIQNdzacUAUhin2TP/NomvSJSo6RZNzIrvDrwlBi8Hsaf+7QRlZdFiTE7FmTSk3UuA
         7Xkh2rmRneuPQ20VEZg80fh676PzOQCnTPDRwHhUEDrNZZS0KaOuboRM5ibWY000jRAO
         bog3uSorvVerEMqmzA4E6A/rpq3LxXXx0mKlqAYAD3S8NDFQDw59KYSSqiMPMTMf7f1J
         Pxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772826457; x=1773431257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z5nTFkvWRlBwa8CwoxYQdnOTwfVARN5qGHvtojP0Pu8=;
        b=IgWI7XxKK06BrS8OPWsoyEDjBQLw0jiJbFlDVkMPyacG4t0c8pOvjX8sackxZWf3fz
         s2RygvCYDvm1jvV90c4+No9jr5bo42imVYSnBR94GBlysXjYQy1Qw0+64LvTOPY6cohA
         CWMPSlL8Ipbt2HbQK8bcJI3QXy2LYaI1Sg91JAuzWCIS8C0fDbZUEuJh1d7PgH7ls2aB
         ernud9/D9npJhGThIz3KO5ejSN9jYjB0DTokeCOD1H0qc7slnxuqo2YClG1XJxwBCWQa
         k3b12UBi6JvUCyrVHSkwGnMlD4oHNIeRZ4LD/D9qIZ6vK+CF5iwB+FWzl9ta7V7muK53
         Mwpg==
X-Forwarded-Encrypted: i=1; AJvYcCUZRFVgw6EsYql9rz5CiGJN9CJg/OOqOrE+TtkaHW2tl81c4B4mQJc2ypol3ef9jTVDGjTL7MG+dv7UIJ6Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz196h3RqWwc402sONrrvW9/YVrjdn986hWk+cD4rECbr0l0qWt
	V42ECZOaxfoOKZ4GaCKAX8trll9g3Vu2vBuLBYWxaBkZQ0wkZ1e5CiHIGjqi3DeiWsnEzVPYokk
	1QLiEGL9ZzuEz9Ww5kEtZeuoJ+KGI7yJWqJ6LajpSk7+2ypcUosq1bvBym8OPAj15ZrObhJeVjt
	nIQlbl94wIMR6PFxGPBzWRYXpLeRITjo8F7KPJNJfsXPk=
X-Gm-Gg: ATEYQzxQIHw165QAsfIB46vs63YtXljqP6gQrvZ5TyC6oViR+ZSzEuW8jOcRWhuUewC
	7zClGEfTsLSjdTiPW46UJHh3JTyE8Hiw9KvBzkqtOImVfQYIV23itUh7WiS9TVUjg/a8wdvUlHA
	NnSCXzdb3qGADTAxnEh/OLaY5aoHsk6Q5W1YIphfeNqnKayjWHrN0OIjXDFp0GjZOxtrVOEWqc4
	te9/nu1nOMnmtYpmRcsb+vlnTDBwEOAY3+FXIg=
X-Received: by 2002:a05:620a:4408:b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cd634f4eddmr839694685a.31.1772826457205;
        Fri, 06 Mar 2026 11:47:37 -0800 (PST)
X-Received: by 2002:a05:620a:4408:b0:8c9:eee0:db94 with SMTP id
 af79cd13be357-8cd634f4eddmr839691285a.31.1772826456719; Fri, 06 Mar 2026
 11:47:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
 <20260306140220.1512341-4-loic.poulain@oss.qualcomm.com> <85680596-7e3e-46ff-b361-d6a736558504@linaro.org>
In-Reply-To: <85680596-7e3e-46ff-b361-d6a736558504@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:47:24 +0100
X-Gm-Features: AaiRm53ut2_mclrpxRFtW6RBVIDPsI-FBAB2CGdKeBtxWDydNVaJmN8fN3RFS3c
Message-ID: <CAFEp6-2hXCcRoVNzFCJW=mFnQFo2w3Rnxfu+-fH1UzB7iTnmJA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: qcom: camss: csid-340: Enable PIX interface routing
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: vladimir.zapolskiy@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Qb9Sa5rc_V2j3gHHxdK1vtYcgfdCosvR
X-Proofpoint-ORIG-GUID: Qb9Sa5rc_V2j3gHHxdK1vtYcgfdCosvR
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab2f59 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=vIXTMX2UoKCX194zK-oA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4NiBTYWx0ZWRfX9XcxUn2io7Jd
 dOmj3Bh9lJGqBXXL4aP6eUW673z279ZCb/kNI3HrjiNJvgb3hWVNXPzvHtcynVEAwJADOVaS9F/
 NjYbGtV10/EcWPOVWweFKR2zWZpvb1qQXEivec+jiCM1VgIg+LNG6bkt47sRBmW8TjHhYpXLYx4
 3V+wBPXmUgiOkR7QpEE9Sk/qJFnO618BfUJA9ym4mI4BN3BXIglZYlF35fOyDmLN7wRwCAIoxGW
 t+omiCgJsgE7VFjj/hblDYd+U67MAbU9PbU3Kzz2LbxzTDmZLucSJ2RWtHp6rwje+dmPKtlevzi
 iJFsVyxhJ/GE2QjxXPiql1TcZv+i3ug0Yc6PakIBF+R6KaT/4RKL0O7ao7fEdmBdm/Tm4W0r2Fr
 B1E7wFwAPjbS7QjQrNmhEQnQUWTJTDaWPU1UuRFEMMCCLFOlHJdoUs/lbpaN7+7j5rTF5PVHXVM
 CBvzEcW2pXcnic7Xklg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060186
X-Rspamd-Queue-Id: 6B088227333
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95914-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 6:54=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 06/03/2026 14:02, Loic Poulain wrote:
> > +     struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
ADS_NUM - 1];
>
> There must be a better way to identify the index than a hard-coded
> assumption like this.

For RDIs and in other driver we use: csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc]
So would that be acceptable for PiX:
csid->fmt[MSM_CSID_PAD_FIRST_SRC + CSID_PIX_SRC_STREAMS]

> The params structure.

?

Regards,
Loic

