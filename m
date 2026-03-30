Return-Path: <linux-arm-msm+bounces-100890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOxeBSLKyml3AAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:08:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A71423602C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 21:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFC083016AFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 19:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DAD394785;
	Mon, 30 Mar 2026 19:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sefp7Lmf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFIm/SBj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678412F39CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897693; cv=pass; b=Ggd1gpOiRE4Zwqh1T7t2lHwdcNtV1xybKpZvKT2j/09ax7XFLzDMluqrkaFYnilK44qwXAUB0Es3sTLzn/1JZop2XlNdE2f7+lggtbK+lyioLazOYOzAkpZiam4lsb4ZcLM0QTYaMNlEQhjUFladSwkN20upXVMuxn6e6+kRhIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897693; c=relaxed/simple;
	bh=WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWKZCRYxbt2N5M6YIqmZ48EcosoVkfoOktvj1quQE6a/SXZKImCL30noGtQoGLEmeb00SdJ1SEw7ZDlqCBubAb14BjliXBD48gKxyi0BYZZHg5KbDKqnbfFSzzB3moUcmg4Pwq0huEaAN+5OTiWp4ZJTnltw6wkxuj6+u29Rw9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sefp7Lmf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFIm/SBj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UFgABA2723192
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=; b=Sefp7Lmf5OaTIcPM
	Cf42n609jgIYdUErNojaWttzVSxaSKUecD6aZ9E6RBsWv0dFuJPHm3f2/Z4/FZmq
	cOEuEKCLasJHMDLLeCwAKIgWRFxyj6Mrf/k7TIa7e2rrfoKhni5aj/HUsSuxPLFo
	eSfrXS+qdBHZPmUfSWO8FW5ivbZooejtKt+jG6CzNn5BzsgS2/wVKZuiwqBAOULJ
	j0PsTngul7ghH5CwFYzF2CBKrL97ynpDfuDSfNEtom/zvbmCGtbZQZAvSlJn2DGb
	weKe357VhpWitEOKevg7ncBszwk8JdHr9fL8Zl8oLMPU1LNV4CbSsB5ULlMJ7LEM
	SZ+lhQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7qt0j03k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 19:08:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a0b5478a12so41515546d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774897691; cv=none;
        d=google.com; s=arc-20240605;
        b=Qr8Il/EOWA4Rnhvnn7tMZC4NipvPqrDkIYy20YKVaKhiGvRX39KjSOGaePdRrddW8W
         0/BUBpuVtua+OKysX2qTdHiXXV/wK3DASD/roqrKokU+Cf4lWAv6ZG/vLkf5jBoH3fsm
         E3eMQGqTj2wn8XxMEDToqh7H86oqyySDZoj6LWYNGF3OHxNPtgJLZNjl+DpZcmCYjWhx
         IYcKkm06SJlXaEMLkvYNGtlWaP2MweFLiwJ1IVXES0F3nd7Awz7sFPITx8z3K6KQc97x
         tOTb4UNUpO8SWOAJNVo5SS2CexltZr+F3uPzYrlyWv5/9SA5kdWwP6yvbpUFPaKKDB8O
         z1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=;
        fh=LGoQL6utp6XnMZWiIWidrTO3UDlzFkMJlPeOWbTy/wU=;
        b=GKBC79x443PNHNnjwreEOxnukwO5NYZjPRCsV84R4y1M2u3z2llnNJLS3fnt3KGOWs
         yPI5UwMCC/en+NZfmE7Jr3U3YVRHikALrDeSypngpb1JKsZ367JrCs6nd+bvhdwLhwDV
         Nj1HalxOlLjNmNaBYdS0evrLlxM0sXDf4dzJ845f+e15G8ljpimK762ELKw3wb5b5Ltf
         JusqhjLWKKMPbWtn+Zdii69NXl/jOUp/sr4otRMHU0erKKCZisu8TUdRpr5f9XxMdlmA
         McitVyR9jaNgBEoSGI8WKvLENN0HKgH0XswhQiczMzeXMQvQxx5rkBGw3yggDFQlZI+n
         vu6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774897691; x=1775502491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=;
        b=FFIm/SBj463XvSb03n6ThnHgDSB+UJtQLU7ge0/Idt9ui3c5/D9VcExttMeBlX4k4X
         LZ9VX3AZ5iTbbtnTPbR6ROBUHz11MEacqOnBXLuABnukHFsUWmDp6ecNc6gjzyNJ1lPn
         PlEMkiYYGn5Q4SFrejU6+klAfHi+cMX/asYBGnS0YrlgS566IdX9V5QDxTDp5iOuJXB5
         LVlIJDtQ2Mk1a5Di3B2Km2rGw+k1240m6yAYu4ZRSMSM1UQzZZaZMmqZi/LZYWKpcwVb
         lZ76J+as9UYxfvlekrFj5CoQ4KGtankJe2BZpq5+A5XPnXBgAVUL9Iyq/LJHmvtPPTrp
         Dzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774897691; x=1775502491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYLUrjNPZS0tw6q9XRJ/44J5jw1SQvCvQv/baraY7Dc=;
        b=hUE+skrwjPDAOVxYEKB5Vb/r4fgohmg2JPe/Nc25S7h4DRwhNSMkT3LjGRpJRHr9Sk
         TReJr+4Hhco0okefaFR1QRTRQaq3qnZCYG5Mgr3XMO7yGZO4QTKfjx+N1McvZ3ywCyKH
         W8PzKBJcNbEuQ4rhV0Hw/ha/KjgWJlcAMGzJ2+EGyFYE1xqqlRd4Yxo1YriAGM1imrhb
         LiWYvA0dqzXcHJKI37tWxv0hkeWng0PFAhkGOJJ+5xiN5VjmM6c01DUAEKgKDsespoo2
         d99fdmF+/3ua0gR64s15a6punZBu5neK385c20Ro4w/D6OegRgcM9whGGrM+755SJs/I
         N5XA==
X-Forwarded-Encrypted: i=1; AJvYcCV4Eu1dfjjr8TSzCXia38qzjHZ+K6g5AB4UcBlmFkTL3YaRJHmRY9qjyIT2EmX3+n5A56yJU45y+RA6TYQz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/a+5iMVpcH1uqoG2jLty2CZ5fXvzWWIMjxS9HDtivmzQarwu
	5pDZsEbeyTIz5gwPvfecDdB81su+6NNSh+rbR+80YKfhklZCZyntD4CIzNkCu3IpRFl2l0JW3Ka
	KT1j64ZXlEqR0aPaGthdnV2DCshj3NH5RMu6jbHG404Ly6pqr6rNNVe50/DyixPN/QI0QuE7hhl
	KyiEfXrmaWnjMrUsPYpc8DEimXHjy4Lh0Z3dYYSKuGSbg=
X-Gm-Gg: ATEYQzyPBbaqcrJQmbN6gnValmRu2hrnzE1W6/n8yG+yvep9uJJ6UiHsp7Nr2TBA87D
	uR8FOri69yXD1Q1cZJ1LEVzFu/Qn+xRP+qWvkMAMuq26WdHrzt+WjaAypeKBxKy9n294yk6eM+F
	fnq6TZwiAYOdym9Xt5pu4/2WyQWwxAsBR79cG1eLFKH/tc+WHQ1erb1KSbJjnt5QtmjWa0aZQqn
	+2nhWhfWe2vB1AMNpPMAr3YOJhRpKUWMxht7w4=
X-Received: by 2002:a05:6214:c68:b0:89c:c713:ae57 with SMTP id 6a1803df08f44-8a2cada9910mr11741036d6.19.1774897690563;
        Mon, 30 Mar 2026 12:08:10 -0700 (PDT)
X-Received: by 2002:a05:6214:c68:b0:89c:c713:ae57 with SMTP id
 6a1803df08f44-8a2cada9910mr11740456d6.19.1774897690136; Mon, 30 Mar 2026
 12:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com> <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org> <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com> <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com> <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <0RTUgDf1wbD0phPk8qAcojZovgMA_68R84FRaL_BHfjzupSA6c_8S5ogVerViYPFNJtvup9sOvL_uPx2t6-KCg==@protonmail.internalid>
 <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com> <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
In-Reply-To: <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 21:07:59 +0200
X-Gm-Features: AQROBzC_trjVaBbw7u7zPM6ws-nlj7qufCuwQcc2aQbNzm3OyUyactYWHLKeTr4
Message-ID: <CAFEp6-2EjvEogSdVNCEY-XwgYe7Bg_2d1me2EWhzDp8Cr=ZeLg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: johannes.goede@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=XN09iAhE c=1 sm=1 tr=0 ts=69caca1b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DLSMq9AfYi4D_SC6SxMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: MGtQtInWdl8tLlZSvDIl8fuRWIhPcD0-
X-Proofpoint-ORIG-GUID: MGtQtInWdl8tLlZSvDIl8fuRWIhPcD0-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OSBTYWx0ZWRfX1X8DGUlHN1pk
 nwWDlEtXol5xJ/rry+8hC1fWRBp6PJC7sgGxRiiBTd+xIQ2CmjMf6LJuyvwXdoxpFLUICYmMmeR
 yzGWFhsBRIot0JiNQe/OWstTClFuE/d2HQhmgrGG8x9fKIEMXIFlM6naJdFSaU445MY9bULw0mn
 rh1bEIdknmZ/duJU7+w4OMT08UVD8rvCm5HbJKG+9kG2gv+pK4wZ4fxXlwDi3xKn9w4nfjlQX2L
 shwLuz8HKyFdFNf0JCOEaX/LvZbpFWiQABXEjqX9uU2xgo8pPzi8DAhmgHl5QyjmfYav8P3pphl
 OBB+nXVcUd3vDuJWEctmYuIJO8FubYHiRMxYrKpSSU07ywf3Soo60X/lbcQDH3GEHomnOGW6paB
 OkiDWqZ7M8TrDvJfQsdhsD9aIl/C9D66UHEC7gXWgrCbI276vEEDnhohxgFkPn9kslRTHsELlPH
 Aks3ZIiC0G7U3wop41w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300159
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100890-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: A71423602C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 4:33=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 30/03/2026 15:27, johannes.goede@oss.qualcomm.com wrote:
> >> That's another reason I bring up CDM again and again. We probably don'=
t want to fix to the wrong format for OPE, introduce the CDM and then find =
we have to map from one format to another for large and complex data over a=
nd over again for each frame or every N frames.
> > CDM is a much lower-level API then what is expected from
> > a media-controller centric V4L2 driver. Basically the OPE
> > driver will export:
>
> My concern is about wrappering one thing inside of another thing and
> then stuffing it again back into CDM and doing the same on the way out.

I think there will always be some level of copying involved. That
said, we can pre=E2=80=91build the CDM sequence in the drivers and only upd=
ate
the variable values, which should avoid significant overhead.

If we start handling CDM formats directly on the user side, it would
require exposing a lot of low=E2=80=91level knowledge there (such as regist=
er
layouts and offsets), and that would diverge from how other ISP
implementations are structured. I=E2=80=99m concerned this would increase
complexity and reduce portability.

> There are already 50 MMIO writes in the OPE ISR, I don't believe it is
> sustainable to keep adding MMIO into that.

Yes, I understand the concern. From our testing so far, however, this
has not shown to be an issue. In addition, a full reconfiguration
would only happen in specific cases, such as on explicit full
configuration changes or during context switching. We can certainly
look at implementing CDM, but at this stage it didn't seem to bring
significant benefits, so I prefered to focus on other functional
aspects, and revisit CDM once there is a clearer need, measurable
gain, or if it becomes part of the uAPI as discussed here.

> I'm aware of a project in qcom that did something with making the CDM
> format in libcamera and handed that off to kernel, recommend looking
> into that.

I will, thanks, I'm however, concerned about how acceptable this
approach would be to the wider community and to the maintainers.

Regards,
Loic

