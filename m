Return-Path: <linux-arm-msm+bounces-93435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPu9J0xpl2mryAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 20:49:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F4D1622B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 20:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36CE43012CB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 19:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9529B244685;
	Thu, 19 Feb 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltWN5MJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSlko3kJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8332F3C13
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771530567; cv=pass; b=QHAzFJELEoupJxw3e8jK5iaryyuuAOKR28Lc5Q/qrJIoiyT+ap8zZmqyPBH1GKKyoXIBdnn8rddwFWD/UpZo5wrlfWIHTO8m+kcIPeTixqQtEaUrGUUxwbbsVMhzQh4BF00ZPGypsyLJVv9pSiYlHLXvsuHpldB8hnaytu/kkr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771530567; c=relaxed/simple;
	bh=AwoGFh2Iw8cbyGdRnHiBE9KOdgOh7luL+gKoJZOnlYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpwT8D6dJuQKfSl9/JHzqTXXtMcs239BWjEfce/NgfdidBZvLHF3v3hvIXgHFWiYTE1TEEegrv1QvliW8XWANLg4jkXLCldVgkm56yMKlIQS61M+sKNlfU0ol8uo/gHpNlOva4O6kD95kmpFxL+4lhX1LxpcrLao1nGMCe3H9LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltWN5MJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSlko3kJ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCphqm160557
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgPv3nI6uopdJRB2V5KbCVW22bsi4dRg9pnCiXF9wUw=; b=ltWN5MJ1fFJq7xzp
	+ctiGSgKGLuMduthRamf+/gzUNhxeNaUCw8OPPvHaT9CD5WW1df+rIau8uuZCQt8
	vZ85LNsLltQPP24vpe4vN/i93DsFg57uGzIq2b2eDH4Krn/8SeY6lZOx1bX+7Kiq
	P9n7yoBJVvL5QQtUvEQAHSmqNkeu1QEDn6VkpOihrzqXqjptahj2FHI2cgw7ziNz
	CBELib8NZ1wDX32joWmdMPOfkOoq2Ip1z7Smc5c8TyaF+eKjArRML5AybLvrQNb+
	aV3pd6CgEFDJxnvUCh0TmYsdyonLEwo1p5+dsP71wPt9psfJCjRpp5DwuHa+JQT5
	mSN+DA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpgas8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:49:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89493622b50so17562626d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 11:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771530564; cv=none;
        d=google.com; s=arc-20240605;
        b=QgM6p1L2JZetsG8KXSnldzJ4X7hwKkaJHygTRInOr4UA6lgPXoSl+XqQV/LEmHk+mj
         oC6aBo6be3IB8L+NKYf96u7+lsP2Z8O8K0x4dAO59ERXp1+TsVNl/+jXnyUsPr/QNC92
         DFtexI/xH+A0TM7DEJDok7tNKHfzZ6VIvSBq1FGlzV6rgPlkdzoYPZghicXeIs4SPbrn
         67Ei2BJAofVTPHL4MgYAb0Tqg7oMmNOyD0Vh5kcMrg6AqRJCogDrOpZGX6ExUuG8nTng
         44GKXm09lcJ0FCUchEX8hSTebkgsrXT+yxw+mxs0KYGhs51hQ/hYQhHe8oXnJdpyqtjw
         w8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vgPv3nI6uopdJRB2V5KbCVW22bsi4dRg9pnCiXF9wUw=;
        fh=9TML2vv1YjDtM4EzRLLO9drCEPpoDezblY6F6mH4Bw4=;
        b=aBFjD4J2O0e4qNshGTKcWyT4smKd8e4fz+e+jDRtEOTPwoJCCaO87OtDSKmtF/IZOO
         gl0CTMEXSYEQ/3H6iqcyCzKg84bqg9c+nWa+DU/GdgHFswG3da6D9H1YiYN+KrVspQO2
         Wv9wNwK9P+d+Zf8PowBax1pRGjmedyMtjZgHgA0Df7j6+bor4xSVq5CoROXnWzqUYkpx
         YVQM71J7bfgGb3VMXHopq2NPRMsS3zd/92SCJ/l32hPTlaI7vmiyqKBpZUrGzaanqX2K
         KtY+YVG6NgHX4OV6Vm6O8D8CS5fPtoGHo6bGWlUlyBI9xbALHpSzyIQJkQVCK52JzPUT
         c3Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530564; x=1772135364; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgPv3nI6uopdJRB2V5KbCVW22bsi4dRg9pnCiXF9wUw=;
        b=kSlko3kJqPVwvSEMg3uQk4QODWQ5hEib7IOpJHF/x0ya9fTCJ/ZdMgLiGdLwarJsgd
         zZlQTnrJmFXNAsayPjuFoBJq8Q/+dfN9uY7RgGO9pRGlezddw9dU3HiUdhDJDPitQZun
         n/qU7jZE/0tgBWMTkbs2nlvsweq1TRg5ApLcKCyB8dNevn2UbYomNieTMksAg8CNw9f7
         0hqgS+8NjlD5sGGGszKacK+rWgJZJxCLjDpqLbGhXrOUtPA8NFh9/NpU+/iSL3Adi3xi
         PoD9/x+o7Qvst20d7lEyN/ZOvhXI/5GKARjCmqu9D3tiby6mYrF2sZ717F5HcsDg7BXS
         Nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530564; x=1772135364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vgPv3nI6uopdJRB2V5KbCVW22bsi4dRg9pnCiXF9wUw=;
        b=NjDGwmFIJjyFD9si2hKZyw9vI43Tx01UtNRUoLyBVBRPqgFerxa6WTn1coKtYtBaDv
         kfPyUyNMqwXxNvE9+FLTN1Bz68fMMb1VytKqcDbFf4suNqpC6dO0DVhiwEw5wQ00UBxH
         4cbSTzvU9Wp8/ZGREmRvY8Q/2INcDafSuQfg0b5PmxNTK5YBf6Z8lM7704Tyk0FHmZQ5
         C5V6kqwuHb0gZwKvDdcE/EKBVVBv8Kszdwfx3Isxk9DVIGjT00K8//zV0vWYJ3bWLlDE
         pRmuV03ySoMFS/HvFuHyV5eXDjj5/dAKm+YBVztxbxSzTjefczcNzyAR+T2ChiQeIB0q
         0tBw==
X-Forwarded-Encrypted: i=1; AJvYcCXkLFlFxkZCcVpk0ixaXGSVJJWuYauy3oBcwc50J9+yxo1Xj4ow6wBNzJLWbc5ZzhLxFRh9hLHk5vnmbBUh@vger.kernel.org
X-Gm-Message-State: AOJu0YzmS+Kp1UADWVE7u3xOWK0ZyqjdC5Y+ogGgE0C2qB0gBVUeH0Eo
	3V7UtgM56o0bFDZP+JCGyTyiHpswp+FuzJ1eWwcXsSaag0h7edkzS4Q11q6zVyZ/Yxar/oeH5Lr
	0uvXoDucgB7WwuRNq5/lTOvuZvxgfanqBgzRfR9YJrzXcpwc17cCZWOzA55MjCQrJugKpZGMRaD
	vLTm+y/tdEAOCwhxbRVjbyzjFcpaMnwzTveBD4YJ/qgiI=
X-Gm-Gg: AZuq6aJW/YO0iaFs7wGo/s+uqdQr3bB/2+TbSwYIF+MO4EOlxwvdGyixSkwhAQdw3jQ
	MgGAnbZQudB/9S03XL5J8Oz6QUM4uX2ZxwzQZyRF5VAh7ec88cp1etCRMdbZ1HxvFL7QQvQ75Fn
	jNj57jU3MqWPYrU7Bf1Y/ZGC4Sys4JG40rJHRQ6rVfVa9/Go0jx5Cvg7/EmT810Zc8pHAg9+kUV
	ZV6vYJiwQFQ6tiPcLbWOnLMeaUg9uW7SBu1/e4=
X-Received: by 2002:a05:6214:21ef:b0:895:3344:b1b0 with SMTP id 6a1803df08f44-89957ff2ab2mr95302896d6.27.1771530564232;
        Thu, 19 Feb 2026 11:49:24 -0800 (PST)
X-Received: by 2002:a05:6214:21ef:b0:895:3344:b1b0 with SMTP id
 6a1803df08f44-89957ff2ab2mr95302496d6.27.1771530563730; Thu, 19 Feb 2026
 11:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-3-loic.poulain@oss.qualcomm.com> <a79efce6-10a5-40ec-bf5d-f37b2bf29ee0@oss.qualcomm.com>
In-Reply-To: <a79efce6-10a5-40ec-bf5d-f37b2bf29ee0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 20:49:12 +0100
X-Gm-Features: AaiRm51NxUxbCi_uvimqcc69j5rZLbG-QzkPHyk1mXHS_u9Wwtuga8fbOJmiFhY
Message-ID: <CAFEp6-3N43h3azYxokEwvTdv3de9L5ytXJuaG7bbim9_px464g@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: qcom: camss: csid-340: Enable PIX path support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: LerDhieFQGb9NGFW7gNg6Q9M4SU4TFM7
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=69976945 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=ZTt2BXceaBMhVjPvKegA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfXz34adY85gMol
 Mflne/ptn9U5pZwFztzOK0CeT/sbH1roSrL+Ww24T2H9GNOvuuJcLbene61Yue+8BKpLSSVp0VR
 fgaXCqZ2xUeGic9A9l4QcCNZT1CGgf9w/cO8IEZaXRrSnwRBD9YjGYmT1e1KtLdQdhJhHsEOP6n
 wuItmPmvgR4OPWHwtXvCCm51svz6FXXCXpeQX0/nSJnONc5g5Qjx8ezXrYGhpDQ3zbIZtXC3kss
 /hEDoG4pKrAuOz0vlIGJ8w2W18XE3L6vAh1nRVD8MDlWtv3e3RJrWxxg8JduopKwJy3hDCy8SW+
 EDxl6ZF1OYBJbujPX12rPK0c1KHADmjCHCkVL0vYa0NebKmZp57pmaUkzvGvo5wm/M5pTLVXDZP
 NNLmIuN8zTqYue79Rw8KvoAWr0NfY5uJrXnBWHAHLGD/z//23S4NJo6pXmFk1pW/E/7vfSLPzye
 5QByTeOq+55rNdfykgw==
X-Proofpoint-ORIG-GUID: LerDhieFQGb9NGFW7gNg6Q9M4SU4TFM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190179
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93435-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E9F4D1622B4
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 4:43=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/19/26 4:27 PM, Loic Poulain wrote:
> > Add support for CSID to PIX interface.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
> > -#define CSID_RDI_CFG0(rdi)                                   (0x300 + =
0x100 * (rdi))
> > -#define              CSID_RDI_CFG0_BYTE_CNTR_EN              BIT(0)
> > -#define              CSID_RDI_CFG0_TIMESTAMP_EN              BIT(1)
> > -#define              CSID_RDI_CFG0_DECODE_FORMAT_MASK        GENMASK(1=
5, 12)
> > -#define              CSID_RDI_CFG0_DECODE_FORMAT_NOP         CSID_RDI_=
CFG0_DECODE_FORMAT_MASK
> > -#define              CSID_RDI_CFG0_DT_MASK                   GENMASK(2=
1, 16)
> > -#define              CSID_RDI_CFG0_VC_MASK                   GENMASK(2=
3, 22)
> > -#define              CSID_RDI_CFG0_DTID_MASK                 GENMASK(2=
8, 27)
> > -#define              CSID_RDI_CFG0_ENABLE                    BIT(31)
>
> Much of this patch is renaming, could you split this up, so it's more
> obvious what it actually introduces?

Sure.

>
> [...]
>
> > +static void __csid_configure_pix_stream(struct csid_device *csid, u8 e=
nable)
>
> Perhaps that's yak shaving, but I don't think enable should be non-binary

Indeed.

>
> > +{
> > +     struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
ADS_NUM - 1];
> > +     const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
> > +                                                                csid->=
res->formats->nformats,
> > +                                                                input_=
format->code);
> > +     u32 val;
> > +
> > +     val =3D FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_f=
ormat);
> > +     val |=3D FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
>
> no vc/dt_id?

In CAMSS, each CSI=E2=80=912 Virtual Channel (VC) is statically tied to a
specific RDI instance: VC0 =E2=86=92 RDI0, VC1 =E2=86=92 RDI1, VC2 =E2=86=
=92 RDI2. VC0
typically carries the main image stream, while the higher-numbered
channels are *usually* used for embedded or metadata streams that
don't require pixel processing. This is why we select VC0 for the PIX
path, as it reliably covers the vast majority of use cases.

Achieving more flexible or dynamic VC selection would require
decoupling the current VC-to=E2=80=91RDI association and restructuring how =
the
CAMSS pipeline represents and routes CSI=E2=80=912 streams. This would be a
non=E2=80=91trivial architectural change, touching both the CSID routing lo=
gic
and how VFE input paths are modeled.

The DT_ID is a per=E2=80=91VC, 2=E2=80=91bit identifier that we currently a=
ssign to
uniquely represent or map a given data type. At the moment, all CSID
drivers simply use DT_ID =3D VC_ID, meaning each RDI/VC instance
implicitly handles a different data type. For the PIX path, we keep
DT_ID =3D 0, matching the RDI0/VC0 stream. Ideally, DT_ID allocation
should be based on the actual data type rather than tied to the VC
number, but that belongs to a separate series.


> > +
> > +     if (enable)
> > +             val |=3D CSID_CFG0_ENABLE;
> > +
> > +     dev_dbg(csid->camss->dev, "CSID%u: Stream %s PIX (dt=3D0x%x df=3D=
0x%x)\n",
> > +             csid->id, enable ? "enable" : "disable", format->data_typ=
e, format->decode_format);
>
> "... %sable ..." enable ? "en" : "dis"
>
> Konrad

