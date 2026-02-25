Return-Path: <linux-arm-msm+bounces-94178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kELkFhsxn2lXZQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 18:27:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC85719B89C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 18:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F066308E310
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AAE3E95AB;
	Wed, 25 Feb 2026 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJbqzYJ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8RGTaW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2C3E9F7B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772040429; cv=pass; b=FzwBIpxDSJ7kA/U7lzGnd7exswlB0/2sEz6O/OEsFj/VT6xVte7nT353cLtjCBRTCxSsCk2dGcNsxcF26UXj0XX/xGQLASI6GsJLEfGY3sYCNIoo+PnNeyoRB85laYFXW0GXvfNTScwB63B2aOiQPVFeqn+pU+U6Sn6/VWyARPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772040429; c=relaxed/simple;
	bh=1YmQtSMFtFWtqRzSWEpc60DBb/b6Z9MbzTdSZ1sQEPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ki6ejDGF0ps+Bq7eh3iXesYMpK/o2pPR3CkAaYH1jWn01dIXql/JWL2Bdxl3qRO9t1LZugj6G1mUjLLsi9ZmlxaBN2wWUUYcNKnAyZUZ7I+WQeYMEaNsDmK7xNQi7S1dwn6JKc4XWqv9fXzaE/8TjDoQc/yMTR80Y5vd/Cu6w4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJbqzYJ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8RGTaW1; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PHP9CP3056517
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Hku3AtI69zFRmAUNKIAygU10IDZKE27b4zLdDLC6UY=; b=FJbqzYJ4wCOq+Oy9
	di8fVHvZji2VSihFWpOHpWL89QrWYWqFTZZxh6X8rvCZEo9Y+gHAi6FaJrDSuMu2
	1anw6AIvV7mOaIAKrgy+Ca1uw/IegHWEI/1EBmkOYA8nhT7K3RmxaXgzIWTgtKvQ
	PDk143sMTEjM/+QSbeDqokvKZWIySCjFYSVIJyWQ+BmLU/xbeNqSAYFvX73urd2h
	KlOP+rrG0azrhuZxs4nKObdmif7c+jivIBgsiP6r0c9WHxJK6RX4yaRfOQJxOWXX
	2fT87fMWAXXF4ybIesslUTANHKUHqrWs7H0zpBMhRw66Xw2zARbKgxpvz6GJ7GdF
	gImQrg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39hm59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:27:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506a07740bdso725235021cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772040427; cv=none;
        d=google.com; s=arc-20240605;
        b=JmtfRvtEsIhxnoUkO0kDdwrhKvrRxusReKukPsFSAuZA4QwTyFbl+Njwhy74/rEBWC
         KKkIBTviOCjcg8JeVBjDz7B5Mr0eWUaH81OjfzXYe3bk6huT++nceOBgQPASBpHfgHcR
         KI+OOHdOWO3PouotzW2smVKD20inRpb4tmFBzKvQx5eDunzDlLvBIEci4BH2NX5M75cq
         pFdF1rxrgYktCrS09uib7JgkDFVITz4V4wWIkrNG51Rq1uzqJvKFqo0R6bas5Ij1BRLU
         qzcZja7hMrhkuXMLxjkQht9TPN3OoXh9YtU+CdA5lGXHl6Tf4H/dLs9zPUNm3ECdGePU
         eUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Hku3AtI69zFRmAUNKIAygU10IDZKE27b4zLdDLC6UY=;
        fh=psgT5e5Ac5Oqt1GmRw1LS0sN1AZ3lXECwYKS4hCGzz8=;
        b=ZPqmHFWFUdC5Z9fZfNdxyXZTEqBLdFBzy4YPv19aN1g8JmER0soUIwMCWYT25PSI2t
         24nSTcdfrnveAUKIxo67sgE+d7QtnBfVbdQZboCsjT3OBiwbipAzFe53HGiDqhQ4KGhF
         t3jyg6sbNc8Z+T7MgzrnR3J71vGMSK2eOKteZFNIO1s6FNwwpyAnCPoFi3fBDZb6yiJi
         0gI6g95mf1SuntMMmcxJ329o1tNDnkA2rPLIP/ksYRduMaU0w528ghCUuPNrQntCsoOS
         cmv49d+YEpEMJ55UgxmoQINQDiDVyVTCH3UTpbdPPGFiEuwGYHASM8oouYWlioINaKWH
         KIpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772040427; x=1772645227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Hku3AtI69zFRmAUNKIAygU10IDZKE27b4zLdDLC6UY=;
        b=Z8RGTaW1VsaVULAY/CaV5C4Fo3gwph8d14nN+JX6DU0oNbK0a8AsiAJGcja/fTIbQt
         fpj79UF6e4E6dQJTmCHlaANJJ2nN+hvfSI+xtDbEhOZLYq+qQT3UmGEkTzSwJ43yDyk6
         DBgrf/liMNxXPjY9ne/C7VIv9yZ/YYl3G2t2W4Gc66WmEn0/B1obz38sFIQxCP8QocH0
         vUh0ypDY9ccK+8Xx4XtsMxQY4AOYSnAXblF9f6dLI+HyY8J+kd3kX171xhQVRzdpQMns
         aV322hEOEep7/qq3PQzxwOnFRG9Jdz18Z64pzKhivdL1550xVEcVp7WiePGoTwPVaLOf
         IYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772040427; x=1772645227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Hku3AtI69zFRmAUNKIAygU10IDZKE27b4zLdDLC6UY=;
        b=nD32KErUkBITbZVtu+XKkMpgudZpWna0I1whZCZD60hoRzreL2yfX64mfUg1Y6aC0j
         Vr1lYOxXRBBXE19VrIKG7tsXuPYlKO3NqIzuthsoatB874YI+TagepVjBawgj/uYtBzO
         osagMp4YC06fAtG0rmxE/a5LPPRmUFvPXfdmbxYROcSp32hPD0e6F0d4vto+qaMaZMW5
         Y5QIHKhMIv5eHq9kHR3ZUKNmPN2dvrs01wYcUYIPML1iJXrKj9VriP9kt77Xr0fULUgp
         Km6clXXBq8sM1Abrqmq6VMAFsVu8EYztU1hT7T97pa2gsQac2UCONOTXFjE7sH+YxiYO
         bx0g==
X-Forwarded-Encrypted: i=1; AJvYcCXz+uHgfm2V3rgCm2tJvoi5urKT3fs0OHmaD28hV9yc1GyP/O8V3lHypgNLG63yP4XsG2nUiaPCcyWOsH7Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3hG+MJT792LIu/lBjZpTOz/ueSJalaUDW6OwUgPbmypBhz+e2
	4LGZeasl9IZ5jZNTxrmUZR0VzMMI58YGCSxD1V+pDnIB698hr2VMcKyQ3oGimGuXLWtxUMjLu2e
	NdBFYhAEW93MTMNpKvRmUS1T4KJ1aWyonVPJa78zO7cRG+nliw2WFZINPHsCtf4utmSvYSCkp6z
	Vz5pM1SWEYOxBFaKREt4z51G7hu3XSDkaundmqwxIpuH0=
X-Gm-Gg: ATEYQzx7XnbfJzeTZFthdyHkBlEYc4QODQ1sgMlUgYDzkp1n5yBQpjYxGbBAROMvH9j
	5xSw0yHOE9HKB44vBQwztwl+xdtNPS2+vzApmF7quLVQ5ik523JSO64yoSovZ+02ANMVbjVOOnD
	P1bPkV0U7oCJGAwjRG/+nOFIJrRJvputV9U2zu6e+HynThHYNI8jevQVjG5p1cENQXwvMysz1D3
	kDoh4Tt/ZZYoqCKsiCV+zJialOtgv/jIMEEPMaa
X-Received: by 2002:ac8:5a83:0:b0:506:9e57:8ba9 with SMTP id d75a77b69052e-50741f9b2e4mr16727421cf.35.1772040426606;
        Wed, 25 Feb 2026 09:27:06 -0800 (PST)
X-Received: by 2002:ac8:5a83:0:b0:506:9e57:8ba9 with SMTP id
 d75a77b69052e-50741f9b2e4mr16727031cf.35.1772040426157; Wed, 25 Feb 2026
 09:27:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com> <32hsnxlqg6dzu3zjszuarn5tu73vpvwhf3u22wvrucznz6h4ub@xzuqhcayo2jv>
In-Reply-To: <32hsnxlqg6dzu3zjszuarn5tu73vpvwhf3u22wvrucznz6h4ub@xzuqhcayo2jv>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 18:26:55 +0100
X-Gm-Features: AaiRm53cAm4tC3lS3yKgesKNZaeSPKB3K3hUOjqqC0kh4okc-dfZ4uYHYvWP64Q
Message-ID: <CAFEp6-2vCqQM82ZGt6txnPe5O+iT+mhLAkrOr3Qo4gKUquS4cA@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Add debug message to camss-video
 format check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2NyBTYWx0ZWRfX/aiB06BQMvYw
 EgcG0eUAPSM1G7OuwAZA2CGJdB6wq2Yc8SOY9F5HZZlcsA9AnyGcnLHU4KxfeNVy0k7cKyotHCd
 8jUE24Sb6zZdduIUpEilAdQsTP5ZKEKoSsZqAX5VmMu0VA1hQmw2+aECi42bzqKk4pTj2jkwXOX
 ckwA7N7biolXZwSAo6T10wfwe2bVKJg5d71YEdVCaab5s6dSyPQxzlZspRL+UXC2DPckvQK6pWb
 AYWtYq537mTwpiIh+QDFS3G6Z1mxwWm8U+PiMrsaTYv7+Smw2JpB3KWy+vxNdn6Tw5241koWV7O
 q0K34kUMlWvAnX0Eg2kueDj5FGKJalIrOsp89RYs8CFGqC7W/Ej4J/qG9jJkbtbn7p+3j0Ntc5v
 SHGqUUTEuJZNjC8mgM1LDVEQNOwMCixptvPdmpcubnkMO2/BF4/5YJvmzSoITVmzPoUF4bLti92
 YnBR83M+bSooJoGgVHQ==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699f30eb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=2JGOZOhU44fMd48AngwA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 2M5A8eGMluVF3it9kmPmggzFJIvRg3rC
X-Proofpoint-ORIG-GUID: 2M5A8eGMluVF3it9kmPmggzFJIvRg3rC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250167
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94178-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CC85719B89C
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 5:44=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Feb 25, 2026 at 04:22:11PM +0100, Loic Poulain wrote:
> > Add a debug trace to video_check_format() to log both the subdev-report=
ed
> > format and the format requested by the video node. This makes it easier
> > to diagnose mismatches between subdev output and the negotiated V4L2
> > pixel format, as well as issues related to plane count, resolution, or
> > field settings.
> >
> > A small helper, print_fourcc(), is introduced to render fourcc codes in
> > a readable way.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../media/platform/qcom/camss/camss-video.c   | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/=
media/platform/qcom/camss/camss-video.c
> > index 0c76bc2cc574..601d5a43306f 100644
> > --- a/drivers/media/platform/qcom/camss/camss-video.c
> > +++ b/drivers/media/platform/qcom/camss/camss-video.c
> > @@ -114,6 +114,19 @@ static int video_get_subdev_format(struct camss_vi=
deo *video,
> >                                   &video->formats[ret], video->bpl_alig=
nment);
> >  }
> >
> > +static char *print_fourcc(u32 fmt)
> > +{
> > +     static char code[5];
> > +
> > +     code[0] =3D (unsigned char)(fmt & 0xff);
> > +     code[1] =3D (unsigned char)((fmt >> 8) & 0xff);
> > +     code[2] =3D (unsigned char)((fmt >> 16) & 0xff);
> > +     code[3] =3D (unsigned char)((fmt >> 24) & 0xff);
> > +     code[4] =3D '\0';
>
> Any reason for not using %p4cc ?

I was not aware of this format specifier, now I am, will use in v2.

Regards,
Loic

