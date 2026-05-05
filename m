Return-Path: <linux-arm-msm+bounces-105994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Kv/FIUX+mkrJQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:15:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4941F4D10DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 18:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 067123000B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 15:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DC9363C50;
	Tue,  5 May 2026 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSXkUZ79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffbqjv/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1C378D8D
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995891; cv=pass; b=ry6xEILaZYWjBqFiKM+ug7DaRqBNYTd8RzXqGXXtwyyJiAeejB2GqDV3Gc4Lur9yDdvJrN1E9xSYd4PJl8XyM6eDDSYakOXAuSwL5yum+cTwSQroPuxuaiO9qnUzaT9DPwRi4iqnK/2Tm8+Rl6JFZnUgwoAMgHw7P+GWsG7u0tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995891; c=relaxed/simple;
	bh=/F5bUrQOL6qjXqnNv8WEGRzaHmX1VWR0LG4ALaOjTpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cv4RPYtyPZ+0jmcTKoVTU3I1ZyvpQz3HVWM9sPQoepe2EJjz0qeENWOPs0YChSQh5Qp4DgUU+ioAVB1PcWMfj+RZg1WBXzhiqMe8lbJaVEOXrPvWbds3fMld5DM7QQMJ3lSQAIwECkz/YotFV2F5NEQlMIAOGAC0shQg82x3bbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSXkUZ79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffbqjv/k; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6459VSDi2859207
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 15:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=; b=FSXkUZ79BlApOINR
	af/MGmqQz++xr1KBSQFO1BQOhnKliuSWZGl3ECMY5fzC/ff8iqW2j8yTBQZ8qeIu
	yXJAGiE0zqmaYpx22VYaysHfRBsN61UJwzaX7lmU3aX8F0uUitTJJLX8msJVywIR
	8Zx/7+Ms/92vF8NFmM2E42NtDwcLRHzSy4X3K9kJlBdK/OOXWJrQ/IEozTnuQbIu
	dUTRA+1QmFO0APH0CmPfBjpTLNEQmQktkpxVDzMAyCxoQakk1LSnvi3LakHHou2H
	0jCZqc382wr4rLRbONa/otcXqt90r1m0/cgLoVi5lRIRpUiSBJChqzOBOdPjSuZb
	ZXQrXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ahh0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 15:44:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso93397901cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 08:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777995888; cv=none;
        d=google.com; s=arc-20240605;
        b=S4zm7UkQNbxFHwj0Z4j1gGGVQFnublva7903Cfe+yveY11bIt5vqf7l6kr0fZy8Q17
         V4sIKcGyEBRi6IqOWQTHyriuibrwITdUUlGHwbiI7eF8eL0I2qtM6p2E2/UfVf1R2ipp
         IdpBFcvAsJxsBnSY81gVC36ydLMoNS3xaWTgxt5JrenwT1/5pcWG/zDdp7rVsbvQrF+C
         Pyj+k3VZSMGEadP21uhx2+Fk0lSZUFJTDSCjHWmmuVYLueEZu2AvY1zi9FoEP/sB3yBw
         QewF2LsUC9Lk2wG20AfjfGnG9OW44HNl115TnRTMlVxUP+g5Z48yqaaEVinibQivDk9S
         XrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=;
        fh=SEueJ+z7vtZ736iDTRcUU7gueIRP26vyjR4/PKqAbK0=;
        b=k1+NO6jim+6NSkTyHUbQ/cidHTwTY7lShOCega7sii8AQQRqb5Zrkx/Lk4IK+HaOwc
         4MQkjJWKQsRK7LhgxkOnvoQbqPJJtzbbXVdN8Scel4hf4B5PgmLfkn1Tq8NfQdO6f0CD
         XBoTBlLZ8xdx40aUFzE75+q/tpVWCU2KjsR3JLD7U3itZUSeFGp/i4kgd/C/ww1mfK19
         zzIJAc86mQckYsJusvuysIplofISS/5+bzKpqr19hH05gM3kSCe075PTSQ7g1mALhRYU
         NuGAaDTP2hWIiCKMaeFNyRHJAIJ/1fjAox2TPHLWJZHiQrNO9hGBwjCs1IzzoMze9HQv
         ShLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777995888; x=1778600688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=;
        b=ffbqjv/k/291TnWSxn09gVvPWhpjmygWSkHbCK4uVLJJz+NCxA7PGX14KcTJSvuT79
         LnJ4OFT5iWex7Ouau9SUL9a14wG3egTsV7PqUSX8xAeVWCBl0c9KwPMeLOmj26uwz0hl
         3H1KvmoR+fX/n4lunlJN5W4uq4x7nYOuYwb/DGRos2IdDLo8id9b33j3lWhr0qw6SL06
         c+3vEPXCCk6HZDxssbZ8vlaermuR1XHW0DgcMnnYJJMU+Ouc3ysV7P+qJpxr6simsvl0
         h+0pakAexvBUhADLLsyXCsGXyBDbyKA92r/8CxdYhPnSbN6Oa+GMZnWwv8zpQ7IzmfWu
         tlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995888; x=1778600688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=;
        b=JQK10JCUd2zM2q5N5bZvL0wEkT1RlP6bTiayma9mORNwVHTBdJhNRCfnfFyE7b4OaX
         kAQ3+lIcwl+O9GmQj+Yf/9p83jh5l9nPr2H7kRUwExUgtEZl/sci0rx3WK48XmJAuw3C
         n6nLHH9XNHR9kDYWejTqiiQ40KxUwsF8CxqQTiA1iWrZu0+ELwbwQYWMRcnqagF8CcEi
         n2FlixeFkvu0Q5Q9D48BTCaGWWFkiEGn8LGxjAr5kq6V9Y6OCpKyEmqALLkdTObgTNl+
         wYzfqc6bFR9PgtIavBeDoeiOCFxIsELG/eqyGghK+/HH9xBUJp8khFRL/HOWuDiGNJWF
         4kyw==
X-Forwarded-Encrypted: i=1; AFNElJ/DmCx2IcYbHKHv/SfkR2rh0CzfUCW5Y8YbyCeTw9RN5vrZTuMASiuJswggxhB2VCBbKjwT8DzEdSSwnWV1@vger.kernel.org
X-Gm-Message-State: AOJu0YzyGh9E3oLu0rKIhH0wAFOpQPZHRpkYC87/OLPI0Tc/3QFAIDz4
	pA52hjokTtl9wDsu0l5Y8n/KaGu2xLBoLTvIlC7a7Foxp+9x1mCLQ1Ym7plg1cYM2MQQiK6jszx
	CAxCnQDvCMTSbKCd1iwSBEokORhvTDmLtsn8k71Zs05uQPIonNm5XtudxlZTWy2QSFkTdAhHhKo
	808rgPYeqzJmgyKssntanNjK9ROZk1tKQ2arKf6bjAdJs=
X-Gm-Gg: AeBDieslwyE4v0TaKhXWwsQPGlAS43Pun7xjg1u7sMd++n5Q2rhMiFw8WFTCqp3eEci
	9d/OT35pP8e9kpUjdXhe5Iqkr+PLBkaLkOAVXSZbpKluRhFyoLAG+ssyWjE+qiMh0osZ2JAltTz
	GVBEH6+bgITe+ZFAY51WYOXjJ+OjpIdX7+OGOCDVC5ePM5LcI2bJlvotwWXo8BCHnTxYMgzhw54
	HBUjBM8tjNmBVDXg4eAgujomr0X3g1A9Ybt++cLaSdH4GZXhi0=
X-Received: by 2002:a05:622a:903:b0:50d:9174:cf33 with SMTP id d75a77b69052e-5104be18800mr207043151cf.16.1777995888174;
        Tue, 05 May 2026 08:44:48 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:50d:9174:cf33 with SMTP id
 d75a77b69052e-5104be18800mr207042311cf.16.1777995887526; Tue, 05 May 2026
 08:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc> <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
In-Reply-To: <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 5 May 2026 17:44:36 +0200
X-Gm-Features: AVHnY4IJCC3ds5r3VsgLF9k8vq5o94dTl-X7DpRfJfmTcyAIRiLE7IATJGnRpPg
Message-ID: <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
        linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE1MSBTYWx0ZWRfXx4O8XdGDQwmc
 ZgjCxW18rEieoiud1jbQqcE2qtrghoaaOTyVFJ0U+Ec0OOZgoKWLf0WT1uulmp0TFfimqHk0y/e
 V4e9OuodfE/UxrMT2O1nlJ1/07edUciu8Ex9FV098vtBMqa1dH4gPRgqsGQt0a46VYfPfaCw6M2
 3cZ6XsqTprvCB8sLfptnXihBGGhE5RNVk7ensLxXW9eB2eEcTyn2hqH8T78OdOFhkruOzEto4du
 inE2zAeUORGYlX/XL1Vhq/KhorZir5dRMx2GqNNF5jyZYwN5G1n/JdgA8mDx04km17jvSvrDygk
 L/lpqsQ98aPajGRN5gFDCzX0aOaP4o4IYuM6xdIS2A9Dqj8Otg5PtXVzpjpFfy4WYr+1x+43X3z
 QYY4Yka1MPBiRgUhmFazf4B3VEzvCRRE6v9V6Ij4+IOZHEYUtzFrx5jOAx/+qH/zUWO8G6UHc2R
 LdOmKMSyXS174i2pF/Q==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69fa1071 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=uNWQtxkOhitwP4Q5j2cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: abH_0-qHao8Elk_ee5VLZ6Krr_jbr1sb
X-Proofpoint-ORIG-GUID: abH_0-qHao8Elk_ee5VLZ6Krr_jbr1sb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050151
X-Rspamd-Queue-Id: 4941F4D10DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105994-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[24];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.538];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_PROHIBIT(0.00)[0.0.0.58:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c15:e001:75::/64:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,mail.gmail.com:mid,arduino.cc:email,0.0.0.0:email,0.0.0.18:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim]

On Thu, Apr 30, 2026 at 3:21=E2=80=AFPM Riccardo Mereu
<r.mereu.kernel@arduino.cc> wrote:
>
> From: Riccardo Mereu <r.mereu@arduino.cc>
>
> This is done in order to support different video output over DSI.
> Since audio part is linked to Analogix USB-C controller it is moved to
> the same DTSO.

I'm a bit skeptical about having a separate DT overlay for this. Is
that really the right approach? The Analogix block is part of the main
board, so it feels like it should be the default video/audio output
defined directly in the board DTS, rather than in an overlay.

Would it make things unnecessarily complex if we instead keep it in
the main DTS, and only use overlays to remove or override properties
for the specific cases that require different routing (e.g.
media-carrier or waveshare)?

Regards,
Loic


>
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   5 +
>  ...ola.dts =3D> qrb2210-arduino-imola-base.dts} | 122 +++++++++++++++---
>  ...rb2210-arduino-imola-video_sound-usbc.dtso |  61 +++++++++
>  3 files changed, 168 insertions(+), 20 deletions(-)
>  rename arch/arm64/boot/dts/qcom/{qrb2210-arduino-imola.dts =3D> qrb2210-=
arduino-imola-base.dts} (85%)
>  create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_=
sound-usbc.dtso
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 4ba8e7306419..e89a0e77072b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -193,6 +193,11 @@ qcs9100-ride-r3-el2-dtbs :=3D qcs9100-ride-r3.dtb le=
mans-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs9100-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs9100-ride-r3-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qdu1000-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola-base.dtb
> +
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola-video_sound-us=
bc.dtbo
> +
> +qrb2210-arduino-imola-dtbs :=3D qrb2210-arduino-imola-base.dtb qrb2210-a=
rduino-imola-video_sound-usbc.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-rb1.dtb
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/ar=
m64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
> similarity index 85%
> rename from arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> rename to arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
> index bf088fa9807f..fb22effb9a35 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright (c) 2025, Arduino SRL
> + * Copyright (c) 2026, Arduino SRL
>   */
>
>  /dts-v1/;
> @@ -110,6 +110,106 @@ multi-led {
>                 leds =3D <&ledr>, <&ledg>, <&ledb>;
>         };
>
> +       sound: sound {
> +               compatible =3D "qcom,qrb2210-sndcard";
> +               model =3D "Arduino-Imola-HPH-LOUT";
> +               audio-routing =3D "IN1_HPHL", "HPHL_OUT",
> +                               "IN2_HPHR", "HPHR_OUT",
> +                               "AMIC2", "MIC BIAS2";
> +
> +               mm1-dai-link {
> +                       link-name =3D "MultiMedia1";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA1>;
> +                       };
> +               };
> +
> +               mm2-dai-link {
> +                       link-name =3D "MultiMedia2";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA2>;
> +                       };
> +               };
> +
> +               mm3-dai-link {
> +                       link-name =3D "MultiMedia3";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai  MSM_FRONTEND_DA=
I_MULTIMEDIA3>;
> +                       };
> +               };
> +
> +               mm4-dai-link {
> +                       link-name =3D "MultiMedia4";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai  MSM_FRONTEND_DA=
I_MULTIMEDIA4>;
> +                       };
> +               };
> +
> +               hph-playback-dai-link {
> +                       link-name =3D "HPH Playback";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_=
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 0>, <&swr1=
 0>, <&rxmacro 0>;
> +                       };
> +               };
> +
> +               lo-playback-dai-link {
> +                       link-name =3D "LO Playback";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_=
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 0>, <&swr1=
 0>, <&rxmacro 0>;
> +                       };
> +               };
> +
> +               ear-playback-dai-link {
> +                       link-name =3D "Ear Playback";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_=
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 0>, <&swr1=
 0>, <&rxmacro 0>;
> +                       };
> +               };
> +
> +               hph-capture-dai-link {
> +                       link-name =3D "HP Capture";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai TX_CODEC_DMA_TX_=
3>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 1>, <&swr0=
 0>, <&txmacro 0>;
> +                       };
> +               };
> +       };
> +
>         vreg_anx_30: regulator-anx-30 {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "anx30";
> @@ -165,6 +265,7 @@ anx7625: encoder@58 {
>                 analogix,lane1-swing =3D /bits/ 8 <0x14 0x54 0x64 0x74>;
>
>                 pinctrl-0 =3D <&anx7625_int_pin>, <&anx7625_cable_det_pin=
>;
> +               #sound-dai-cells =3D <1>;
>
>                 connector {
>                         compatible =3D "usb-c-connector";
> @@ -198,20 +299,6 @@ anx_ss_in: endpoint {
>                                 };
>                         };
>                 };
> -
> -               ports {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       port@0 {
> -                               reg =3D <0>;
> -
> -                               anx_dsi0_in: endpoint {
> -                                       remote-endpoint =3D <&mdss_dsi0_o=
ut>;
> -                                       data-lanes =3D <0 1 2 3>;
> -                               };
> -                       };
> -               };
>         };
>  };
>
> @@ -225,11 +312,6 @@ &mdss_dsi0 {
>         status =3D "okay";
>  };
>
> -&mdss_dsi0_out {
> -       remote-endpoint =3D <&anx_dsi0_in>;
> -       data-lanes =3D <0 1 2 3>;
> -};
> -
>  &mdss_dsi0_phy {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-u=
sbc.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.=
dtso
> new file mode 100644
> index 000000000000..6fb256498cd1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dts=
o
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2025, Arduino SA
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +&anx7625 {
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               port@0 {
> +                       reg =3D <0>;
> +                       anx_dsi0_in: endpoint {
> +                               remote-endpoint =3D <&mdss_dsi0_out>;
> +                               data-lanes =3D <0 1 2 3>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss_dsi0_out {
> +       remote-endpoint =3D <&anx_dsi0_in>;
> +       data-lanes =3D <0 1 2 3>;
> +};
> +
> +&q6afedai {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       #sound-dai-cells =3D <1>;
> +       dai@18 {
> +               reg =3D <SECONDARY_MI2S_RX>;
> +               qcom,sd-lines =3D <0>;
> +       };
> +};
> +
> +&sound {
> +       pinctrl-0 =3D <&lpi_i2s2_active>;
> +       pinctrl-names =3D "default";
> +
> +       hdmi-i2s-dai-link {
> +               link-name =3D "HDMI/I2S Playback";
> +
> +               cpu {
> +                       sound-dai =3D <&q6afedai SECONDARY_MI2S_RX>;
> +               };
> +
> +               platform {
> +                       sound-dai =3D <&q6routing>;
> +               };
> +
> +               codec {
> +                       sound-dai =3D <&anx7625 0>;
> +               };
> +       };
> +};
> --
> 2.53.0
>

