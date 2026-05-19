Return-Path: <linux-arm-msm+bounces-108497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM4ECXJcDGrMgAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:49:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C87E57F00C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9218C3001CD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665A74DB571;
	Tue, 19 May 2026 12:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHudPXWN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SahnvIig"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD4D45107A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194896; cv=pass; b=M7GdJ68DeBQdZBOuO6HEG2VShgAhDYMY+R+CYfVYe71r+pm0fVI8UDZerj59OWNfcnZI5A2luFxAqUpamwY0xe7HsoXw7iGx1LRsn4xPGgXO5E7GZvGLlEWwr+oqGAvbMwwoDA6wTl2XH+HKNbBFaAmaVWIHnMs6HjqhVNwFXbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194896; c=relaxed/simple;
	bh=tsgnV2aO8dyapXDpjYvvBCE8bTReMUKPZ4SILq8b81g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H466TmPkCINcJsVZQviaWz1GxXk4sdutRydbUvMjrLFBr7H3AWp2h5wPvCmZ+Lr1QDPbtKNltAuGW9q2JDeCWJ1o/0f/51FqGvnQu7q61jCagbT305mOyX9iuOEeoGJ9cJUTZm9+2CvrxYsyA+D5iX0Wa7JgUZ2JKYS2R2bpNrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHudPXWN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SahnvIig; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JARbff4130974
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVUH6wBFgYiTBEVe2zhpxVry+VzFY3pfxbuijh3eje0=; b=HHudPXWNccwdsBlr
	+Nzk2I/MBcSFdaT5jB8yEKJWx0EEvc/EB2e0QlNn5wNOFyw6ndLehasBUTPpLrBc
	5yNzXDVyPu2npU5bSMbBf98jJcU6K1FoePh/APdWWJyOHW7o6QaCK/6FCLRy9Zwj
	7GuQXmxrEbda/7mgAXW7a0KDh282mMMWATCw6Y09t0YkryOv/DeOQaZNKyeLqNhJ
	eLS6ccYdBCQyJnHwDeXEBY7X+JDW4m1HDARU5ioxePwPI+ADl/vXQ8Mafjq4HXDe
	hXsSs0S4wHhVRDavfQHylXxiuFRS53CRYFIZ36n3Q1dDTZDaliqc+FJRVaTdBMxK
	mgwxEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1hs0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:48:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90f6c6101d5so874148785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779194893; cv=none;
        d=google.com; s=arc-20240605;
        b=Gos5Tx4kTZ2S0mq0okNBmKo7CUBMIPHdjVQkNvzGLAzPbwrU79+IZ81fYYyOQDjqpL
         3rNM+P8TedrsDQ1fL8oRUM7nyGit/3pcW3YBcavpF9pIH2Jsa6SYBVydlOP4XbT9wkra
         BGCb+PR3PVT/PMZ+M4cw0qHCggbBc5bkh2StZdzg8qhIvPRDyV7TT1m9mamqKawbIg1S
         NU0RTfQfyeJ33w76pF71oqbGI67U/bnUkRdODgEOBS2us4pACOsK9YjjhJ9FbrhusMm/
         pd8azGbEd3stLcM3oKR6cBEAlSNDbW1lAq5hU5/prCZRnOxnC+YjExkp3RrbRXRcrriA
         F7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FVUH6wBFgYiTBEVe2zhpxVry+VzFY3pfxbuijh3eje0=;
        fh=ghXZPvAXmla6z0OIgm9ZW/eNFri+qCC+7dzA7ia9/1M=;
        b=WDf9t29+TGcFaJaecYsz+OcooK3hA6NBfwXuLYpe+s6o37AHjEXkI5h5ygxKa/qqSx
         5g+DudRXIgf5Pz0ibUWrS+TfSXU8uV5Y6gYcwsclpXiioAsAoCvluZQsRQhh8p12rpBS
         gYQLGEZcd7QQUJKoMRWw+VvpYDT/+rDZCCEoXe6Ki1P9kpc692cjGhk8v9BfpCC1mwCW
         kLostjbu+c7ArqR/IT03W3QfG9odoRQUTfOzsxJo1cOpXp5dazJIHriAEsvt1amOtJ6S
         NK+Q/UcXKgpyXS2JmTKxD7uVHaYwU9JwTi/6WlnUzUGqDQaH0EV4RZHJd+73aF7zFlu+
         4TtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779194893; x=1779799693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVUH6wBFgYiTBEVe2zhpxVry+VzFY3pfxbuijh3eje0=;
        b=SahnvIigoqN2WG4c8plmzs/t0mjhnykmomDfyWvLQpXzO5UlsJFj9GpcX5ntOptYJ0
         EGampXl9ZDuk9w0Ff0DyecqHtMo/ke7kpTTEqgD5jHZAhJzmhmlWbdkacfjkETAtQj+U
         2++NCGKvm/bZcvjSdUoyl1yyNcpgbourtF9l9mV0pZ09fOzHOGa4jFA3U1Gg0JXPiaD4
         VYo1HFIKU7KQNCXI1ehsVDkfkn8qUUKf2SjOVWqw/kpfAfUXVvRzSjrccSIZEC+DuuAX
         a53e+eadpQ9po/bbv6uUH2F5p9VZW/FWK8rZCorPlYKwyExbcBhro32jl5mnueFvnW29
         XaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779194893; x=1779799693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVUH6wBFgYiTBEVe2zhpxVry+VzFY3pfxbuijh3eje0=;
        b=U3N//QquGr7DFdEWuaRaCY1YSMYcUE9RNhl6l6CEE/GyfyupTdWObSkeNodbJwwVIC
         0Xkebqsxm9LyMPxdE3TJeJAXKKAHd8CsJPme8WKmTc3PJ4hp69HxZuqtYbhf/vltctBc
         Ls4dXVHfqLNuB27HlhLQd5sRTgFUSslfwkkNoQQVL+VbiZN9GXQFnpgiZW7syi24g+Cp
         kSsg7dPXcV0pwTEXxe3s+6M3IZXZp8J1LTpldzaQVO3/V5OOoXJLGON4ZejVBA0WixzJ
         XIelAt7OUtXClkpct2ZK4vSOFj450eDWcjDifc5Ra7VFLLPjmVWpiWyXfoplzR1WjmUi
         PUHw==
X-Forwarded-Encrypted: i=1; AFNElJ/M7BkiUHfEmYqKumf1pR46Ou13crHhl40PCQlFZGPQoerIsJ9EkmpWc0qa/4g0NM/cQ9jJ9gxRmmoE5UkF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcat5GbQCx72toQgI83j2ZDuD3Vng6p4JYTy7P811fWUddRaYL
	aRkm6ifs4V7G4C0NIwuJXCgIFrUKcTmfi6d2NkYKnewQ4YaIyNpf86J2m6y0NjWCjvGubSHDgb5
	T+Xnb3jBcduOuLho5W5rSsJ/ig24qxa5hIqXNNRW4Hv8H2HmlDJtoqxSqgXhGiJidzT8THUG56n
	fiZvE5U3G79uHj/WrLS0XScJvecKqhlK8r411/A4c29EY=
X-Gm-Gg: Acq92OH5c+iNiqcYvliiDBjszwELDI0SSRcmoCFEZzOu9TiVHHFKFxPXnpqfM7ai/rt
	u4wMV9sZnwz7qubJyixs8UMfu8gkJOYjKMLhReP8uJIGyJIRX/El1uLmaSe95jqJJCbTv3VN45Y
	4zl/6xrceJQstJtWcYjNELTlPNaI5LsfSh4DsbWaWjB6T5OdboEJxocKqKzLcJ6PNXowPcwrJ73
	HJ+1ieRTnUYG3/E2KNtYgltT2wLHylL/y6yQug=
X-Received: by 2002:a05:620a:1984:b0:90f:429c:e63e with SMTP id af79cd13be357-911cdc4936emr2936953385a.12.1779194893163;
        Tue, 19 May 2026 05:48:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1984:b0:90f:429c:e63e with SMTP id
 af79cd13be357-911cdc4936emr2936948585a.12.1779194892757; Tue, 19 May 2026
 05:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org> <20260515234121.1607425-4-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260515234121.1607425-4-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:48:01 +0200
X-Gm-Features: AVHnY4KevGWQPierX4-OQr-g_8yECcl0PFq6IHdvowvHo86TBnJAG3UzKxDhnvI
Message-ID: <CAFEp6-06qWkuN+dSg=27jdvH59k9BctnnRcT2LCFYmOzyxTpTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] i2c: qcom-cci: Move cci_init() under cci_reset() function
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c5c0e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=U8yPnnuYQYX5AjQiYr4A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: J4bu84Vw0_fKwCeYtWkgDvLfpWr53wxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEyNiBTYWx0ZWRfX0VwzGUY0GUkg
 i1jvVVsnxT9zpsOv0IY98S2ISaGYsecnez00y/B1DlsnppAj6asRZoA4lDiw8MK3sr/XfOFxbz6
 KRt3RH3LapcHV+gZQzKS0aS6zV+LStjnZWKXqrdvl53Fu1Z+ViLqEfU7NAGoX25LyV/+hzv5wOh
 4L96MUR+wGDxRGt9rh+dp1FMf8PD3jZMuHp4QjnLlM/OCSGDojlYLmhpsGLvvw2Std3FtOrbYu+
 4MzHKle62MG0XsTCBHHJrDZ4O0W+VO38jOsBKfugETyihiyNL788U/ApUkVmJJaflQTLMEKfXHe
 bOTFu2QcADDdJpbYaIVa/KAb3awiIIzlDwvoQXlxV5Pcj2hg1kOjPc7iidO+j/DBKjgeuYJxzFj
 Hu7fewZSXbI5hX2kD2wmne8vfif99sSaAZ47UvxaSfN/g7Hhed9ZjiYwmo8c4WhebBdrkEpAXDH
 uR6BqwtoHrpzsDmr0uQ==
X-Proofpoint-ORIG-GUID: J4bu84Vw0_fKwCeYtWkgDvLfpWr53wxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108497-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim,linaro.org:email];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 2C87E57F00C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 16, 2026 at 1:41=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On probe or runtime errors cci_reset() is called and it should be coupled
> with cci_init(), instead of doing this on caller's side, embed cci_init()
> directly into the cci_reset() function.
>
> This is a non-functional change, cci_reset() and cci_init() function
> bodies are reordered.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 41 +++++++++++++++----------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index be41a53e30c6..2d73903f14d3 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -225,24 +225,6 @@ static int cci_halt(struct cci *cci, u8 master_num)
>         return 0;
>  }
>
> -static int cci_reset(struct cci *cci)
> -{
> -       /*
> -        * we reset the whole controller, here and for implicity use
> -        * master[0].xxx for waiting on it.
> -        */
> -       reinit_completion(&cci->master[0].irq_complete);
> -       writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
> -
> -       if (!wait_for_completion_timeout(&cci->master[0].irq_complete,
> -                                        CCI_TIMEOUT)) {
> -               dev_err(cci->dev, "CCI reset timeout\n");
> -               return -ETIMEDOUT;
> -       }
> -
> -       return 0;
> -}
> -
>  static void cci_init(struct cci *cci)
>  {
>         u32 val =3D CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
> @@ -286,6 +268,26 @@ static void cci_init(struct cci *cci)
>         }
>  }
>
> +static int cci_reset(struct cci *cci)
> +{
> +       /*
> +        * we reset the whole controller, here and for implicity use
> +        * master[0].xxx for waiting on it.
> +        */
> +       reinit_completion(&cci->master[0].irq_complete);
> +       writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
> +
> +       if (!wait_for_completion_timeout(&cci->master[0].irq_complete,
> +                                        CCI_TIMEOUT)) {
> +               dev_err(cci->dev, "CCI reset timeout\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       cci_init(cci);
> +
> +       return 0;
> +}
> +
>  static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
>  {
>         u32 val;
> @@ -302,7 +304,6 @@ static int cci_run_queue(struct cci *cci, u8 master, =
u8 queue)
>                 dev_err(cci->dev, "master %d queue %d timeout\n",
>                         master, queue);
>                 cci_reset(cci);
> -               cci_init(cci);
>                 return -ETIMEDOUT;
>         }
>
> @@ -609,8 +610,6 @@ static int cci_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto error;
>
> -       cci_init(cci);
> -
>         pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
>         pm_runtime_use_autosuspend(dev);
>         pm_runtime_set_active(dev);
> --
> 2.49.0
>

