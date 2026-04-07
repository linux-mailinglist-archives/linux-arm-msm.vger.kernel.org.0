Return-Path: <linux-arm-msm+bounces-102074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOs6NpG91GmWwwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:17:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9303AB323
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AD393015E2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 08:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4803A257F;
	Tue,  7 Apr 2026 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWsUjMDg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLxAjpYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06F3396D14
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549814; cv=pass; b=l6eRpLayoVAAAyxysaT4hEpHL17AOo1ndckb8WoM+wlG2XAOPMV4vUBa447JNm69dCbxX2/gcKhAS8E6hKa/B4s3LyAW+Uz0oX50oyG0v6KAe1Y3dJ5WfodigoPgYot8hyodHX+pEoOTvxlX5gruUDc38QfP/GPfuW7Q+cWmr3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549814; c=relaxed/simple;
	bh=DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HomDo/w88b85iDR2CxyLvNgeGIdO3M+STNi20grzW/LCh7uEGJ0xU1dY6VCMAYoweOVV5RFN4Kfzb2Oj91PFXrNLUA/elcb25Kk7BjEA1KcwyltxeluD16snOaIzT2aoIyuW9DeFpXRLHOU9RB1RPvkfzKln0HlrbtjsVOgjVEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWsUjMDg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLxAjpYR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376HLO01407039
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 08:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=; b=AWsUjMDgUCzLy/G3
	EwUhErl8AUhxX/EAlSB6cDdLyinbChRX/OIB+ybql7C/X9/vQM/+Rj0la47xplr9
	dNrnYG/08cal5QPo33Ym1VT8PKpXGJ+Nmsdd87SkZatpznndEmVluIRtqngD3BsD
	T7d2iGP/QyasNa04uqKCxnpapOH+UjmsB3u5PqWvLlehjcT0rq2vVfa3XwNYpNM8
	WAMPqPT/rj+969MTtBH6kUPwuaS0jnq2OADouUyCKIENBu4UhO/BX6OMYQhkCGPO
	iFA9JRqSF6oNor91vH+1huACkhrX9QBG0r3xL7Gq/2+RjQ9nrZc11so7X4NK5qyS
	0jVA4A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrassdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 08:16:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ebd9e1ee4so279076776d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 01:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775549811; cv=none;
        d=google.com; s=arc-20240605;
        b=JOLJNu+JaG0p61Z88ci9BIi+b6QnOFMiH/6swtub2A6IaFZ3QGt3xfY25pzOClXyvu
         WdtHBRM93SDmWqJOK+UVj+7b9ClzCVWCKcYHas7JxN7UTcCY5uqgJqku11rMfg0w+Kdf
         QdFi8k+6dzT7Uv5aQ33gN44u+GhbJkOHvJoWzbv8hGNJrGdNPUIfkQYjFPU4P7eJVPY6
         3ygw7D3EAl0szaSROtNTCyeadTqcqOx2cEcW/Dgxs+2BgHcWk9giMU3YMRuw3MBQG5Og
         SY9Fjg/8qpIu6RsfRE48b4xISDFK0oX6ZkLEqd4sERRHrryKgen/OhJwM0SCmHXw+e9c
         dkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=;
        fh=GyC5Hl3VQm/ESRyEoRljwYtKM1DwIjPsDm+QZCPb8/c=;
        b=Rjh6f3iGCaGcZA4Ufyguj+HTWqnW71aSwNWrpRxfY1Eu+iMmV48pjjtBafl8G7KlqY
         uNLphEKg115a9SIUVVx9QuSpQGA2fs+WN2s2C9EFtyuoztdZge0Cil5gCHpmmGhmDVi1
         INz7n9frb9MD9hIjSn7ue5jbu+BhOcnQG2PsKjlHxbBkt+Nd225fQHpvs/5rV67YE4vt
         xFzZ4HpUTGDKgXOIy+DEAXktoCDN4YhXfM7Xl6lczpqlJPyPbbSEFyY2TeudTYnMtyXo
         R9+tEmcnZtTZlCreyDoeGxUB/u9ATf8/xMgbZMATcRGklGckKtDxBry12VoUz92iKs8i
         jeeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775549810; x=1776154610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=;
        b=NLxAjpYRauSHPAcUDF1uqz0h5qPIS8uNpJ/mwSYTyh1kJ4A8mpKNeW2qlF2SWaTk7/
         3D1hdCrkteDkVnRUonxSySMguJcJfV3ceGQ6+BhgTWhXPwEDDtyfbAJdU6aq4VDJBJ5M
         tqFcJRR8D4jzHt3J2IjWfsNxWDG5TDgSwVPoH9d5fucesTnN38Eu2VnLQnqWqKDj0wQu
         38ZYM0JEsoGmoiSP7VS5cqoRpCwjXSLi780E6ELl28Thh+cZKGhVZZZhdfntwfmvlK9j
         aZS7TTM1Bjq+XAUz08djLdlEHJ7K7I278B2kwJpw3a2atC/rMQW04GMRzBC7+9JNXi6r
         0IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549810; x=1776154610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUS80N1TkNrchRW550dN0fYwEfuhD9eOewhPt46405w=;
        b=QrxygGpHanbkeQvMezro8ABPLW883V67Xb7/mt1gG0HJQG88iiqz6Trbsy++/gOLQV
         o2O3e3dP+Vj8panPQmhMWOc5KD1F/cuY2ZZU0rXGEEBZGaN2sjrep7uoYacRq9Rv2SmM
         qjM3Qhzv3145VKDGqT+oe7xDOILhPMgPkkyHPRVdPatgLu6b1vBWiYlRidNYOoK5fWVB
         4VX2u/jLoHgAXj3dknSwsfQoBo4EZ8M7MbDmMnNPS34Aj8CTRJCtPukMQ6lAhKMQweGM
         Y1J48Nf0tQctTjJQyB8vn7OQlrBgK+N9NzypHUxwl6+11FW2yx/CBx4QRe/lhYeQ/9iX
         6wIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAHzDfy5z1C8z50P2UtKlcxpWN51escx68NzimbmtJU0ZUr1/j7Y0iY4g9gnp9xLSYdB82buRCpvcKFGPg@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2nPYeAyNeQ5Qy8noWwvqJ1XUgggWGGB7UuuxZXD/Kr4m9zBpP
	qlneTF5qx+3Q3HvtpMRI92h5uO9EpWHvcX4vSbiWgwjNQn3/yaH9J3WhjJtfqVxVwwxx/xpZlog
	Z/YUM4Xql8JYikQTlAABv8NToqYh2vawT4dTsR53sncOF5njnbfKDA8pZZ+sMJGGbvR2XsLrcUj
	0uInFkLYQ4XIVvr1m6fF+3aq6+gqyTjwJSvER3IxiyL2A=
X-Gm-Gg: AeBDiev3Nvb5uSRUx1H48AuNrvm4B0fNzpIRjbUpZhFb6A1u/CjDB8CwPf9qXoGfAsX
	pHoCPPJsEIxpvjo4QyCWxGuBU/0wPQAtaD1OneZGW/6xo7QjTVM1lCEwfxL+t+yWGNORi+DrmS8
	MYoQst9U30zv0c/0JuY1liEkct5LsJ0iBbZQVP0AzPCD/fjOyifN0NSpHh61dz+GQX2s9ke5pHs
	8DUpbArPTV/Gyg++606bNoFp/YsO6YS2Nl3J9s=
X-Received: by 2002:a05:6214:29e1:b0:89c:8671:10a with SMTP id 6a1803df08f44-8a6ff6b30a7mr256054826d6.0.1775549810497;
        Tue, 07 Apr 2026 01:16:50 -0700 (PDT)
X-Received: by 2002:a05:6214:29e1:b0:89c:8671:10a with SMTP id
 6a1803df08f44-8a6ff6b30a7mr256054546d6.0.1775549810106; Tue, 07 Apr 2026
 01:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
In-Reply-To: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:16:38 +0200
X-Gm-Features: AQROBzB9jXN5WQuzdqwIuJDQQdxBWeKtibXoNReRFTql_Ig6jSb_XVxokroni2g
Message-ID: <CAFEp6-2BMaT+u0cAJnZNCaxbiNGCayYs5uMr13AEe2iWWZZxzQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: qcom: camss: Fix RDI streaming for various CSIDs
To: bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 32larsqoUePjp5-FGnMyk_uzqxTfefzf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA3NCBTYWx0ZWRfX+OGK45pb9RxG
 jbQX5+YEiDatp/JARlJNPlQnPTr3tAEVnko7lLCt/xJuHuRcFHg7kRfNOsO9WmMBLnu+ILPJfN7
 FzJA2lDPwb4muAFguqZ0448B3Sjg5rKwUysh8vfqF+93ccUJ1Tvi0uphLGuVFrkXlODPaY2B5hL
 VXWeB/Evw9ZoMetuMTP+Md5if5DDM2Br3fU8dYsoJuDR93V8iX9Z1fqdARe3Edi595PcGtI6LG+
 oaGJUq+bFrdLq0d6ed9u+TkKKQtxTKPAKmC/vrVLdLA5EDTg3PONlgXS88M0/DgLNR4P7KEy6Yq
 vDxBSqWllAyayHXK2LdUnUTMfMjti6E0N5BmPD4cmE0pXeFQF9IrjEaxWu5Pbjelhq8O4g2lcGR
 BBbBANO1WKhhY3v3XcazYYgP5ZiXsr07uWGxHi3qo5drnQelJTXf9V3czdH46pTpewKUrNan9uB
 utSs/kht8aEC+7pZ5MA==
X-Proofpoint-GUID: 32larsqoUePjp5-FGnMyk_uzqxTfefzf
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4bd73 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CE45hHjwcgbT6912zacA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102074-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A9303AB323
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Mon, Apr 6, 2026 at 11:55=E2=80=AFPM <bod@kernel.org> wrote:
>
> A serious bug has been copy/pasted from CSID 170 into various different
> implementations of the CSID.
>
> In simple terms we have a broken model of enabling virtual channels which
> needs to be rewritten.
>
> Taking the CSID 680 as an example. The CSID can output ports RDI0, RDI1,
> RDI2 and PIX.
>
> Each CSIPHY can connect to any of the CSIDs. Each CSID has four output
> ports RDI0, RDI1, RDI2 and PIX. To get Bayer statistics going we need the
> CSID to write on the PIX port.
>
> Each of the RDI/PIX ports can process any valid virtual channel.
>
> When adding virtual channels a spurious association was made between
> virtual channel and the above mentioned ports. In simple terms
>
> vfeN_rdi0 will always be fixed to VCO
> vfeN_rdi1 will always be fixed to VC1
> vfeN_rdi2 will always be fixed to VC2
> vfeN_pix will always be fixed to VC3
>
> What this means in practice is that it is impossible to route a sensor
> driving VC:0 to the PIX/Bayer path in upstream.
>
> Given we have now gotten a mutli-stream support in the kernel upstream we
> should move to that API in CAMSS.
>
> First up though is to remove the breakage of invalid VC constrains and ma=
ke
> those available to stable.

I agree with the observation and conclusion that proper PORT and VC
support is needed. However, as things stand today, this mechanism is
also a convenient API for leveraging different virtual channels.
Concretely, if you want to receive data from both VC0 and VC1, you can
simply use RDI0 and RDI1. Changing this behavior would effectively
break that usage model, leaving us only able to retrieve VC0 data,
which feels like a regression to me. The more compelling use case, in
my view, is the ability to stream different VCs in parallel, rather
than streaming VC0 multiple times?

This then brings us to the Pix interface, where streaming something
like VC3 does not really make sense. In the current csid-340 series
[1], I therefore took a simpler approach/workaround of forcing the
main channel (VC0) for the Pix interface.

[1] https://lore.kernel.org/linux-media/20260313131750.187518-4-loic.poulai=
n@oss.qualcomm.com

Regards,
Loic

