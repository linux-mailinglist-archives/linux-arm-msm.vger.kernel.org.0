Return-Path: <linux-arm-msm+bounces-94272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP22B1QdoGmzfgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:15:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 787A21A41B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28407300A38F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7CA296BA8;
	Thu, 26 Feb 2026 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xg7Kv22q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXFQSIcK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2031AA80
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100930; cv=pass; b=I0IS3/TNlqKF/60b7VJHpWb1kdyqK7Goi2FaZEcxRLa7CBoYAMTRtrhMqfMOcRKk2BnsSnn0Ki7bRUXyirkS0SQ1yi4hUmjDxtZPnjqKGGLJIHf09Rrw6aSlU5BzlWp75kP0blhTJ3o6CTRUZxxUgl+216rguuYWNMvLu5IhG2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100930; c=relaxed/simple;
	bh=vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrDfNOlnejeIsHVm/iQRpJkP4ga/NQdPqy4nivF95U7xtoI4CvPq7zFpkzGHtYbPfZ0L+AvXUPzNLDgvBZz4BX/7G6zhRHs7ut7uMUb0P5QZGb2sYzwwxVep56DDhaPy/6qKgSdH1MFRDHElcuMgj9ZCoktkCEXuJHs7Oue2CBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xg7Kv22q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXFQSIcK; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAEMte2363910
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=; b=Xg7Kv22q4DYcJW8l
	x+rSoTCSnEuMvFBYPM+i7DikLv21RqNMMt4eafwJlOuEgAQAFjUNu/vTs+ZKVQsv
	dQQAX6ucODJqiGWWIHKZYtncnCnGx7y1hEu6GrQOq+MOjtrxClLAfR3EyF6UI3u3
	Cr2fH9VSJ5gkoFmyPZsUmTlUGmkk2lAeXEC7uZH1Du1QTllXNNgMNobH3wYN3+a7
	n6WEN/VvlB0wKZXqs2S8xPP0hGooW0qa3K/wOK/cgLiv+MlvfYXo4jOVxwVfehel
	9wcZPS0EVwHpgZJhjlTdgZi0Sh269bSf9nj0T4wHmGw0V2cToCoYQIb4F3WwuLnA
	ssJjoA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8d8046-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:15:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89546cbb998so64073806d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772100928; cv=none;
        d=google.com; s=arc-20240605;
        b=ZrtGPC0KXhIj7LBin7HvDJgdGKq7U18iOGKpb16usi5/cxRL15e3JdLoLVsfJ4s8ts
         8caZtG0PCqNsCMyavEGoi4fTLrHP+vpZf2QL1XpfNiNIuD1fArKufYThLa7B1BgQEK17
         d1f5M/6Sg/DsyTUn5VkaPPEPmdmP3LrtQOJRR7YDYPVuPIJJCIlzEOM8lluVAN/J+04I
         bPUFpjRI4j7k9akrdrokH7NtjdnP8wDWmVFUM3kSSdN+AkZeuTsZbNifxG3XIcRHVozf
         3cao2FcYqjNH2lIiFilebpIJV+K4LpincR+2TgtIp9UKDwFoFskGPF9txerOk2TFmK5B
         eKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=;
        fh=VbaeI0hWJkY0I7epRmjkRANRVW/ZXINCuBux43NoUIk=;
        b=htmaxuhLLccYmY/s4aS4yuaW+6yngUeXFF+OsDVUCHNE/MJ8KLkdx7/VL/0cu/6Sta
         YcTsUDlXy+kwB9gmwYCQ5qmWiszBhC9NX5buEcVr8QNbmpO1DcQAf1TQYlAFG9WEvwUf
         DWT3u6hMssTvmkjfCjVxNqPu1tpvdojk1QCpD8d9U1fZTkqMN/3CKkqNb7NyWyuESYtD
         21leql2ZZrYs60G4f4XxlNLH3DwW6jKYLz3wfjKP7wIix6+Pc81xtdTO6MZwBtdM0/UF
         cKUxMaNqSbAJ8kjtZbm2pMStpQvKvjvNmuZk8DO158zuUErd9uIzTuFyN0L87KpoHls+
         Hl8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772100928; x=1772705728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=;
        b=cXFQSIcKeeVISdyg4LEDoOufWUPME+1yfY8PdILeC6hBqajQzf5vw0nt2vFJFxjKmU
         C3F74pcZwAOES1MIoNr9NBscGjvMY3swzGLyLaQ8XZ7t3ZZZNXh5VK1pdoV3QPOeqguT
         ew3Uj8/0f9s6Einz5zVk0RE4fbNJhzkbsj1adofswsnTEFDRtjXWDgREA0bY/nik5glt
         itSo7FUxeg54ll28RwW8970nMD/8pGFMWbC3xkeiLWKVtCmtayRAjErm2ARgZvxlzjAY
         b/JSHX7Tq9MienelpwMjvEqYemPM4phmS2esAIVweQQzlIAL9S2tn4s3wsrk+19cJUp+
         68uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100928; x=1772705728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vuzVksNtpyEzrrJAYrDWC5LrnpvjHYNfDeodFaiQLh0=;
        b=rna/vFhIiupVzNLnm8cl5pWOd7eLi2cHJUzZSFp0cM1TT5mE9krrq5elKqZKroEnmT
         3vun31ScYHjMaNNiuVDJPLFgacMhjY7xKb3TpqhZxZdAQQI0cumcullh9Rp4YgwW5GlL
         TSYKJW2o9mcdtGqyP+8CTA3aaAZYIFGo4JRzl1BoeQADkZaLTmecXTKk9Qo9yTF/frui
         0b6HIFroHY4bSGDhVSdBWCmMG+Sw/fDzXrRuOp6Y6d6c0RFjrCiAxQB2aeD5wtjXftTS
         J/LAeevIM3QEsvC8D2tel0256J/wMqNci/CntPnSM82RPuZYoxLhq6Mh0MSlEY2geZ8W
         1Jhw==
X-Forwarded-Encrypted: i=1; AJvYcCVcFetBNDQe8Vk8oJG4A4pc1nQMrWwTe0GRWixi9qFei2B03DtUspvUtRvN6oLbQxo8k8Z/DRRVcgq/DVSX@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvCHqLSy1qTDF55aJAlptWtVNo7rKSup02oIHxaMEFaC71ff+
	K4pLnT3HX6SjXOYMy6pATcAaNqEIILW4z8cIGMEc61J2TzOESd5haPSzy757n4kuPxJH25qfUxe
	7/Wi7tQ4kMe1immFpr2xd8fJezoqrsjKHQKlGJR+5NLoKKmsMTDd1TEBu7ghCHwDVDTl5yMEQzw
	Izepf7YBlgYhQfRJWRLWv+LNz5Gtrdz27F69H7yeF3svU=
X-Gm-Gg: ATEYQzytQV6oge/cdVtaYieEzmYvxoU7Vk4WbDe4wsMT6vGEE5H2cvt4TZ2mHP28oTu
	ve0UfqIdp5QN0kINAwZGL4wGcsta8fLE+bzO76HKmu3Lq/o6Hw8GXZjlDz8U0ykfZzFnXF65b+H
	czc2Ey50IUrRh4InaK0ncIZR48cDgbPxXAn1IIecfU9QfgPOl9W78zZmRgBE8DJSPQbPUDC1i2m
	MXbsKap92/GPRMxoAf5/vNGqgScil63Lsv58fji
X-Received: by 2002:a05:6214:19cb:b0:899:cb60:d9d4 with SMTP id 6a1803df08f44-899cb60df02mr7392666d6.57.1772100927966;
        Thu, 26 Feb 2026 02:15:27 -0800 (PST)
X-Received: by 2002:a05:6214:19cb:b0:899:cb60:d9d4 with SMTP id
 6a1803df08f44-899cb60df02mr7392476d6.57.1772100927613; Thu, 26 Feb 2026
 02:15:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
 <20260225150122.766220-3-loic.poulain@oss.qualcomm.com> <6js2jmzcbo2dmt3g2griookjt7kkrbukukzkv6ft6i6357g2x4@trpobakpysw5>
In-Reply-To: <6js2jmzcbo2dmt3g2griookjt7kkrbukukzkv6ft6i6357g2x4@trpobakpysw5>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 11:15:16 +0100
X-Gm-Features: AaiRm53jdS8mwT4tqzlvDCVXXffYDOk2bj3rtFS-iR1LGt5EWqxNq2h_Al5-Tns
Message-ID: <CAFEp6-3KA5tztKscsaHn3=MVKfwC=gbCMNgZhi7SasxHXxttYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] media: camss: csid-340: Add VC-to-interface mapping
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QMtlhwLL c=1 sm=1 tr=0 ts=69a01d40 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=_5tTEtisqCDahmSd9ckA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 8UTWSQ9L27S-dNYjhGX0cE11uvNIxLfS
X-Proofpoint-ORIG-GUID: 8UTWSQ9L27S-dNYjhGX0cE11uvNIxLfS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5MiBTYWx0ZWRfX3wLWo6KuHqCv
 EDLUQeu53Y6SbJAXIO7m3PuCvOM6g/DUSkT0oqXYVA90RB7jJV2lXavB3iKPoZR7B7fv9lFZb7Y
 krvjQ0oNqLm7wyihIYdafYnj/uzb8AOrIF17t4K70SUZfMFb07NdKyRA2QV4/wGY2AEE0TLfsb2
 zIpOckpwdc+Ajv6948EsJ8tCh2bIOvPCIlaU9RLmRSSilM/NYC5d1MA+A8dCIoE03tN+RmlEKpC
 T269LTLmKzfHTKSGsvjF4lnBi1AogcWeqgG0thmg1StbdQP4nJKFx5MAfhsJkHzhYpQ8itAD9dr
 d9zEV3f+4wa9q0vR2KV5J27uI814N+VN+y5RLcHv4g6Bu6tgwGT2nrUhOE1/ET9Ha2+DfzeuJFT
 rhXI32W2gYJ0cBUnnmM6H7pLD/pjc5HyF1pkX3U1cUXBS3+m32C1s8b+1qy6UAX/2Qxhie9PIpz
 g1PyolLIRoI7tnjgG3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94272-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 787A21A41B3
X-Rspamd-Action: no action

Hi Dmitry,

On Thu, Feb 26, 2026 at 1:16=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Feb 25, 2026 at 04:01:19PM +0100, Loic Poulain wrote:
> > The CSID=E2=80=91340 block uses different register offsets for the PIX =
and RDI
>
> So, what is PIX? I asked that question at v1.

I might be misunderstanding your point here, but yes you did ask this
in the v1 review, and I updated both the cover letter and the
subsequent commit messages in the series (mainly in 5/5) to clarify
what the PIX interface is. If this is still unclear, I=E2=80=99m happy to
expand the explanation further or add more context in this specific
commit message.

Regards,
Loic

