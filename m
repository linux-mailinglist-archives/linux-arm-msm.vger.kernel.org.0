Return-Path: <linux-arm-msm+bounces-94032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCP0CnyjnmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:23:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D753193566
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E035324DBCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB3C2C21F2;
	Wed, 25 Feb 2026 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVjXGq5a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAiuJXpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF2828B4FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772002935; cv=pass; b=inzMecEtohKWjqd4n4SWJF3/WSWwTJn56C7KbuTUhKZ7q0AnAuAt3BP/TCoGrsBxqVuCmCXPNN2NJThZWVhCeE+NMdJodjQCVRKzS061GTdl089ndrqcvvq88k2T6FgYzvmzcrieVWjHpzto3MeH4Yn8JHdtoH8ZQDd/SHipTc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772002935; c=relaxed/simple;
	bh=+CQRq2f0y9Kz9FjiYV6i3TaDfft7KUVskcOfCnv8kk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7p3tU41hefOFrwJ4s5A1FPEqRf2tzqDC/au8kAp0uCQUdXMokNF1GI0UAKUaXt1Dxu0UEUPiwrjkgcySB7eufG4yanGYYSGniKS9lKCRrDqQ9zKKx3bXB6bJEbow1Zs01Cr49v+FW8xfLJqJflTf+XuL9uPBfWDUFr8yW9rHLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVjXGq5a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAiuJXpI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OMRGCD061764
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIvxcIUiExE28+h46mlIzXq7o5B1UOORxIQdbDo662w=; b=oVjXGq5aGk8h8lX5
	7Xq4vyf4XuMIW35qr5Vb64FFU76rUoEjqhnjeBCgmuldZ906a13WkTm6Lgnn21uS
	pzMU75igLRR2IfPJNc3Ym0B8r3odGJ3biwu78bbwF0My2ritdJtzhU+71oLkuOuC
	vx5ZaiLIumEGHSst3Ncj3yJHg1VLvmcwzzZW3E85WVe3rCoLEk2Fwb4WChbM/plm
	FI9xHz/sGbq2HpBXEFABo5qh6XfSOKQOon0/eTEKnyfUY6JQInL4jBLbOgDQXx6O
	08+pTzq1zy4LfpjBzIX269+5WDNaNAgQvl1Hch76yRUhCHz7c43RdBawcUURvgP2
	2HF/yA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cherjakaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:02:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896fb2fb9d5so749794556d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772002932; cv=none;
        d=google.com; s=arc-20240605;
        b=P1Kg4/j4ewblW0uKBLZbVFVEbmfuF3gtWbXJj9J1tbI8yj9TofAg5Qx8j5S00ij34k
         AVa72yny6Rx2PVvn8gXocMoCNSAGRLKpY2KiVPPVPJ7CEJb7qOVVUqSwAGpp28isiE2o
         6eHz9ZkDzRb3BQ6zKo+nlWgl6FKYe4A9QabGQBSh6xBMMTClVVSaql748e4gpsvkqc7r
         xf0uUW5dGj0W2TdS/ZigFe68kWcUQEBA5v0IrnyDrWFDfiEDQk2akhLS+JNibmLO5MZg
         h2ejwyfkuGCyS6U07FLudXD0J0iPPXQmPYob/CVyseeP4aru1M/4bjeNGqQMZ4uN47IA
         28wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TIvxcIUiExE28+h46mlIzXq7o5B1UOORxIQdbDo662w=;
        fh=+thxYI/WH7hzCAmZhS4Dt1m5f/qzensRYqeNMa+hitI=;
        b=IrZJE6rVIsUd4xtIKlSJqvDbBpkwM26FVPgpQxmoXXv1GPARpFjVWQRPPj6KhQ2xnr
         u7EhQ7Jnv8WZGsXzopvu0Zw430e+r+JoaE1aFVePXXESCb6Cf1fF7P961oCpST6MG/38
         UrO5iIXIRCLhBPHzzELKLr+A5aRlPti2A1O0EbXUxZFDHC8VMHBPBRw8671NDiS4S6Jl
         bOA9EElMCHlh5mRU9htVft0JI1dnhSzNLnEeIg1h2xXQHgrNKMusNF4Sne2zGke5swK9
         rCWwA/ks37RwE2v8dibl/IwrvQk1aV9JKmwLSLLlDKsWIDubC+1vkZaD4bPFXhZpHzuC
         byCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772002932; x=1772607732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIvxcIUiExE28+h46mlIzXq7o5B1UOORxIQdbDo662w=;
        b=QAiuJXpIM+sNO0fkjGt4w/GPdvMxuXuH0rKTPyyF0fbO9lix7RHAVatt+Gzs+/bST+
         JQVDtTaI3rAAqPVpTeJzanS35EimVb7nZkvd4nGSn886/SxtFw/p0evlrI+xhPjATn4J
         53kb/cH9MwqkDr3tXa9QoGdstVYdShjlFrUvVuQktXnZNSuCY/1sOofzv+VHotwICnUI
         3aW4sO7zSPn1Et1odxgeag/cAPRMWKG2rNUxLtEXfsP9qjbVGalgzxKs4EV26v+Ym07U
         fH/TekFtKgmihYBWGVNJR0fPuJl68f/TI2T8AimpNGAPjWxFdGH8K0aLPWnNIGArTxVY
         NPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772002932; x=1772607732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TIvxcIUiExE28+h46mlIzXq7o5B1UOORxIQdbDo662w=;
        b=eqLHFLJNf98q7vDmEdZ+YihDUH+p07ixbXvY2lkq9mlzgPVNv/U3XISdNjOmKHJD3r
         yxlAcelBvjnHHELl1bGH0wEoJQ0ya/X3uA4riF/Vn25TijG83iTR5f1cHikSUubkCuMR
         l0zAP8YC9Y3F+BD+bwvKIxhRp6Cup9dquYGBc7urpoB47dOFSsfTHbxxM9pO8fpgHXBN
         CvUMWPUODdlSPVi7OdDBI/KAsyfU1bzzXHwX2LK0Cvn4bIg0ehAlYJxJFVeJ8kYjKaNl
         MRggdvo1HbsXtWbvHWgw5kyoBjkyv0uucktUtGJzrIXijST880+E3ortQm/XTgQuOWWD
         +Irw==
X-Forwarded-Encrypted: i=1; AJvYcCXS5EomC1TdBAVCt4VumHtNwTmxx/s7RQdBt3kpMJs2txaPS1fHAAlxVUllZYJMmKnM4fSY2BIuQzhrmIDw@vger.kernel.org
X-Gm-Message-State: AOJu0YwUxFEgd59o/UIIqyuG5c+ZlK50wP2h6e/c7BrojHgzgLkVycPA
	k4gA5bKw4NXCncLX1YTGMHLFw8VY+pWnkR4SrV2SdFQCRhEfxwMZ6GznrHRO1/MYvabSYfiiLsA
	VWEuBfEelbBv+/S7MtPEcOdmR7zJhvx1AVS2Li6w6zwd8huHTWdNDOKKNjaroVzjna3PD/TVLA+
	dE/1vQ5YXh6zl/SQtDRwN09EU+ItvOE0DY54/3VeFX02U=
X-Gm-Gg: ATEYQzwyi+Ev48UUYh4zW8P4ONEt4BG2n8dBf15pjanziCXlokJW9XgzE6YPzJdOyVP
	PqCbEh0YXUvbCE/Pr53ciLjhElKetWDsXAheR05iXPr9Wb+E7Fs++YXmVmCWrkJWFQ0PKA46aU1
	/sNzBFZ8xSul2W2WU6OkpJ1B9wdrLJWRqhS/qT4bMErlFIl58YY8le8/UGnQHgIMy2E+xkibxG4
	TbdsvauC2NfFtZl1CETybBRD/rzzTDlzeROVdE=
X-Received: by 2002:a05:6214:260d:b0:895:35ea:8bc6 with SMTP id 6a1803df08f44-89979db5299mr219389216d6.67.1772002932354;
        Tue, 24 Feb 2026 23:02:12 -0800 (PST)
X-Received: by 2002:a05:6214:260d:b0:895:35ea:8bc6 with SMTP id
 6a1803df08f44-89979db5299mr219388946d6.67.1772002931936; Tue, 24 Feb 2026
 23:02:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-2-loic.poulain@oss.qualcomm.com> <e286c232-f307-42b3-8b3b-c25b62389c90@linaro.org>
In-Reply-To: <e286c232-f307-42b3-8b3b-c25b62389c90@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 08:02:00 +0100
X-Gm-Features: AaiRm50mhi6YRntJhyse8EUz6OEEsWYUyscJMgYaTgccpHGwRrCsM83Hltce7bg
Message-ID: <CAFEp6-39z=0Ja3MjBNr0vhoVqEmHa_K_4yJCwu2ihyifYmvmtA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe-340: Proper client handling
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: rfoss@kernel.org, todor.too@gmail.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2NyBTYWx0ZWRfX2cVi6wuoS0iP
 qOJWtmmXFXXVjOzC/9OF0SRZFgWaIvk3VeFyiKcRW4o5SoXsLZkK6K67HHbhItqZybqMQz9t0Yt
 EMvVCiIHCoCjQlIZroizLRZuScMAxoCimDIqlN11dguEHIN9HoBTrgDNa87DQA4ndIaHtkz+HUN
 4aR1N205wI7FCOCZ3rsPr4pHJfklRB9MlCOxuQfCO9KwsInZnqB+fnk9IcrxeQY4wJ9/84bVS75
 pcvXH/OJfIvvV21XbeodNNJwxjZD31MSNQKjJuTNzCRkTud98rajS5UudVluSW+TbAgyaGIeLli
 HrqffvgxkCiR3hSYG8j/Zjrk9PK7OSZfxyGIQutF0kjD1qCgpMAstNCghh5UVAcZZ5nARk2JDQY
 7WAG5JEnkATLdsc6oL9DY9UEM+xRPUwUhuOlPXmSVuZbxNnlb2ad8ARkwG2ywO91dwFeWKHtkt9
 O9sRCS/Fdoldjkwwdow==
X-Proofpoint-GUID: WYsmhijQBU9oYpzVa6YK6wbZJlJgOxIg
X-Proofpoint-ORIG-GUID: WYsmhijQBU9oYpzVa6YK6wbZJlJgOxIg
X-Authority-Analysis: v=2.4 cv=NeDrFmD4 c=1 sm=1 tr=0 ts=699e9e75 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=sD84q0ronQK_62RWDccA:9 a=Nt95yvp0HerYrbeJ:21 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250067
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,linaro.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94032-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 9D753193566
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 4:47=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/02/2026 15:27, Loic Poulain wrote:
> > We need to properly map camss WM index to our internal WM client
> > instance. Today we're only support RDI interfaces with the RDI_WM
> > macro, introduce a __wm_to_client helper to support any interface.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   .../media/platform/qcom/camss/camss-vfe-340.c | 94 +++++++++++-------=
-
> >   1 file changed, 53 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/driver=
s/media/platform/qcom/camss/camss-vfe-340.c
> > index 30d7630b3e8b..c6ea8b6216c2 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > @@ -69,24 +69,19 @@
> >   #define TFE_BUS_FRAMEDROP_CFG_0(c)                  BUS_REG(0x238 + (=
c) * 0x100)
> >   #define TFE_BUS_FRAMEDROP_CFG_1(c)                  BUS_REG(0x23c + (=
c) * 0x100)
> >
> > -/*
> > - * TODO: differentiate the port id based on requested type of RDI, BHI=
ST etc
> > - *
> > - * TFE write master IDs (clients)
> > - *
> > - * BAYER             0
> > - * IDEAL_RAW         1
> > - * STATS_TINTLESS_BG 2
> > - * STATS_BHIST               3
> > - * STATS_AWB_BG              4
> > - * STATS_AEC_BG              5
> > - * STATS_BAF         6
> > - * RDI0                      7
> > - * RDI1                      8
> > - * RDI2                      9
> > - */
> > -#define RDI_WM(n)            (7 + (n))
> > -#define TFE_WM_NUM           10
> > +enum tfe_client {
> > +     TFE_CLI_BAYER,
> > +     TFE_CLI_IDEAL_RAW,
> > +     TFE_CLI_STATS_TINTLESS_BG,
> > +     TFE_CLI_STATS_BHIST,
> > +     TFE_CLI_STATS_AWB_BG,
> > +     TFE_CLI_STATS_AEC_BG,
> > +     TFE_CLI_STATS_BAF,
> > +     TFE_CLI_RDI0,
> > +     TFE_CLI_RDI1,
> > +     TFE_CLI_RDI2,
> > +     TFE_CLI_NUM
> > +};
> >
> >   enum tfe_iface {
> >       TFE_IFACE_PIX,
> > @@ -108,6 +103,13 @@ enum tfe_subgroups {
> >       TFE_SUBGROUP_NUM
> >   };
> >
> > +static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] =3D {
> > +     [VFE_LINE_RDI0] =3D TFE_CLI_RDI0,
> > +     [VFE_LINE_RDI1] =3D TFE_CLI_RDI1,
> > +     [VFE_LINE_RDI2] =3D TFE_CLI_RDI2,
> > +     [VFE_LINE_PIX] =3D TFE_CLI_BAYER,
> > +};
> > +
> >   static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] =3D {
> >       [VFE_LINE_RDI0] =3D TFE_IFACE_RDI0,
> >       [VFE_LINE_RDI1] =3D TFE_IFACE_RDI1,
> > @@ -126,6 +128,16 @@ static enum vfe_line_id tfe_subgroup_line_map[TFE_=
SUBGROUP_NUM] =3D {
> >       [TFE_SUBGROUP_RDI2] =3D VFE_LINE_RDI2,
> >   };
> >
> > +static inline enum tfe_client  __wm_to_client(u8 wm)
> redundant space
>
> > +{
> > +     if (wm >=3D ARRAY_SIZE(tfe_wm_client_map)) {
> > +             pr_warn("VFE: Invalid WM%u\n", wm);
> > +             return TFE_CLI_RDI0;
> > +     }
>
> Why or how would this happen ?

This is just a paranoid/defensive boundary check as this value comes
from outside this driver (camss-core), but it should never be
triggered.

>
> > +
> > +     return tfe_wm_client_map[wm];
> > +}
> > +
> >   static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_i=
d)
> >   {
> >       if (line_id <=3D VFE_LINE_NONE || line_id >=3D VFE_LINE_NUM_MAX) =
{
> > @@ -209,10 +221,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
> >       status =3D readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
> >       if (status) {
> >               writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
> > -             for (i =3D 0; i < TFE_WM_NUM; i++) {
> > +             for (i =3D 0; i < TFE_CLI_NUM; i++) {
> >                       if (status & BIT(i))
> >                               dev_err_ratelimited(vfe->camss->dev,
> > -                                                 "VFE%u: bus overflow =
for wm %u\n",
> > +                                                 "VFE%u: bus overflow =
for client %u\n",
> >                                                   vfe->id, i);
> >               }
> >       }
> > @@ -235,49 +247,49 @@ static void vfe_enable_irq(struct vfe_device *vfe=
)
> >              TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_=
0);
> >   }
> >
> > -static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
> > +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
> >                         struct vfe_line *line)
> >   {
> > -     u8 wm =3D RDI_WM(rdi);
> > +     u8 client =3D __wm_to_client(wm);
> >
> > -     writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
> > +     writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
> >   }
> >
> > -static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_li=
ne *line)
> > +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_lin=
e *line)
> >   {
> >       struct v4l2_pix_format_mplane *pix =3D &line->video_out.active_fm=
t.fmt.pix_mp;
> >       u32 stride =3D pix->plane_fmt[0].bytesperline;
> > -     u8 wm =3D RDI_WM(rdi);
> > +     u8 client =3D __wm_to_client(wm);
> >
> >       /* Configuration for plain RDI frames */
> > -     writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_0(wm));
> > -     writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
> > -     writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_2(wm));
> > -     writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_IN=
CR(wm));
> > -     writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BU=
S_PACKER_CFG(wm));
> > +     writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_0(client));
> > +     writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> > +     writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_2(client));
> > +     writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_IN=
CR(client));
> > +     writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BU=
S_PACKER_CFG(client));
> >
> >       /* No dropped frames, one irq per frame */
> > -     writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
> > -     writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
> > -     writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
> > -     writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
> > +     writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
> > +     writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
> > +     writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client)=
);
> > +     writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client)=
);
> >
> >       vfe_enable_irq(vfe);
> >
> >       writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
> > -            vfe->base + TFE_BUS_CLIENT_CFG(wm));
> > +            vfe->base + TFE_BUS_CLIENT_CFG(client));
> >
> > -     dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u=
 stride %u\n",
> > -             vfe->id, rdi, pix->width, pix->height, stride);
> > +     dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u heigh=
t %u stride %u\n",
> > +             vfe->id, client, pix->width, pix->height, client);
> >   }
> >
> > -static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
> > +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
> >   {
> > -     u8 wm =3D RDI_WM(rdi);
> > +     u8 client =3D __wm_to_client(wm);
> >
> > -     writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
> > +     writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
> >
> > -     dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
> > +     dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, c=
lient);
> >   }
> >
> >   static const struct camss_video_ops vfe_video_ops_520 =3D {
>
> Otherwise seems fine.
>
> Your series title got mangled somewhere BTW.
>
> ---
> bod
>

