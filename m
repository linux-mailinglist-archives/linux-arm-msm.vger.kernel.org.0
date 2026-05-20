Return-Path: <linux-arm-msm+bounces-108759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPnIDhy/DWr32wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:03:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A837558F41B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FB9C307022F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21672BDC0F;
	Wed, 20 May 2026 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ir/IJhuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrfcUt55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238ED2C11D5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284857; cv=pass; b=pbOR1aJthmXspJuY4zZfk3dOth6Wzz2JUbqEsWF64MwdYUkekkCmMsg10qVER2XA7aFsEu9BP5xv5Js2+NK4D1IQq6YKS1Rtti0aErQA0C6aEE9DHhB2hANU1uZKVViF6DxDQGrKKnNBT41sD3oQ6wGlydvVqvn5QhVJ5gmIkYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284857; c=relaxed/simple;
	bh=TcDJayFh4FglJgtgy4RlM5hSfeN1hpj3e+Vijpjv6F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMcJVD/j+IPVCzc+3eDvWEfTVht1e7pPdUHUq1W642WvCVavD8VH5vU091rJtjPWe9BToTGfNepMg5MGZHX9WSmYObfZR9vKNEQpZ8nHo2sYrjlTDg+LGWDudgNKGOyTFbzD40+JcDD6jti+7CiZfKpRhCCWd523E5E/gZChcjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ir/IJhuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrfcUt55; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZYQV3085003
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=AEzwBHnh7dJ0KK/LA0YzrTOcEY0xRPMkPj2SAzGe+44=; b=ir
	/IJhuKDN+Now3D4qwWWFp8btkEtnv+wemcd0iV3tYc0v5PP8bGe5mctmzqGBuFZS
	WPShQ9xKaqIA/amgP1PHlPVKYYD8RzlMeV8jxTBE6uhniUQIb4sh5z4MRM9iV2JV
	5j18Yoi99ipYoiJfoFa8TAsV4XrZbSkj/+F5h/+XPfa9TykZiit4qrsXpsH24q2S
	V0HjcDBsBXDGftInozahGXqZdaSCq9KmHwGuB481pMLRQff+7M1qSpcn5d6U2QdD
	Yp46XmvY0pk9FNiimZXF6DGwLbqscqnF3aOqXo1IcaW5a4Kbjixg7/a5i50k59GA
	iaDMTE8SewsHkBAFi73Q==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f0f3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:47:35 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-439b8d149bfso4800838fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779284854; cv=none;
        d=google.com; s=arc-20240605;
        b=XZKT6LYrO6xDd6q//Yc6GQiAKplrSYXcudGupB1mHHSKuSBlaPQxF1vxIeqETCAX7v
         PGBznrB3JzwpRC/hCLtOYPjhoPEMiPCviluhWR6B7FM33R6c/MMBsGrMbf/aZ+utLwqM
         QE/4CWx+9th5Hb9J8saQHgVH13S9UUne58KvG5yB5keFCSsR7s+UhsoLidVIAA1IjaKt
         tw7ugj1pn6PUa7UFKoO2GYfzzRDNDiAotfL+P3t3btO9VNAvpFTGZveYu3Ip9dINrw+a
         ZkqF5qt8+uKYaI7qzKxHPldRRj5CqgT74p+plTBpu06Nc+Qa6ioGUNmTKaetFcAJZjua
         ZIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=AEzwBHnh7dJ0KK/LA0YzrTOcEY0xRPMkPj2SAzGe+44=;
        fh=xsDbbHQlUSP8ob+vhKSa1wKQQ/5Uwg7VEMW13xqSVhE=;
        b=cPcZ9YJMbyAM2EasV/MVjAYDPDk6wiXlVzYh9L79WJnD0PGeQ7Ll8diqhDEcnng765
         g0e8qbbhSL/ju9ytWBBuEt9uu4UBV1/J1mCsr4cKHigXL7hvBgdJImt+vGxlBRYg7CNo
         9bvjrO1CQAljpkY7Oa6q/vNhfbAZWKQZolZIH7fQ3NAc6k1zVdRh1YhMaf1A+fQbB40V
         p9z7DBFRLqSQ9ObXQKGuIFyaeuVpWFAfjHmS5XkAfuk9EWRqm8VK+7Aw/XQXME6wZdp0
         TX7Om8NZFFvQqi5G3IUMSFwFV8d+SqF9d1H1CURq08MbMrjWpGVGkPyHwPT9GExyORuL
         Ic/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779284854; x=1779889654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AEzwBHnh7dJ0KK/LA0YzrTOcEY0xRPMkPj2SAzGe+44=;
        b=QrfcUt55JVKuhDfPChFWSqJJtLTxEc/xx9+yrSubZu9J4Xbl69qv5+ski0RMJBoIa9
         0t28VXW0sK8LEn9Y/ppMzfo9DdoBwVFISxPkCF7geGZfrHuLf7xbgMHKn8+Skcnmxdn9
         qzNmLxJpA/5doEEi2gYqOY55fgn1WUAcITI/DtAo/JaDsSIzSydNH3pqgSG6LbJsBQtl
         jKq0/oIPcabBWeRLHQE023DGZ27Ep2j5SoRBjiDtp+GuaZhYxEKYlWEGnsas5Ml8rjO8
         I41JkhZvwbXdDpn0QQTy9aRjOV68h+7cDwvFI6V+8V40/1FYbRNzzRlNBZprXz7Y1dOt
         fgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284854; x=1779889654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEzwBHnh7dJ0KK/LA0YzrTOcEY0xRPMkPj2SAzGe+44=;
        b=FJY9PqNMYLSWNSvVLfT/5+jyuNPUVsw4/4g50iCGpLstZfHwaBtEJdzIDqmABGr0ou
         id3vqPjt+GoqtjNqilJozlFzUBHoK8eli2CM8QmUAOQrYC66RAxEjuiCJxmerKLsuyGm
         jK+4twsTlZ4eevEwdUua3pofVDYoJz9WvVhYx/cwCOKgnEEggObBpJsVCW9PL2gaBUmd
         fiF//iUwaTPRVqZrYbpEJSyFx4kowUJOyonfUudUal6S38Nl5oxFhAQ45IbBsJBJX2PL
         v9mBVaATpZpLhyqwcdvv2GPClCLyH3K4M6rkUbtgtZRE7pj8weJnO8Rtthc1MZn7lnsw
         TkYg==
X-Forwarded-Encrypted: i=1; AFNElJ+QlEKxbwcu+UvcZujCOjnXdRybZv6/JNNNZqiLtt9MtUi6QlHQRZbDIEmB1kQV88Xo1ftbPdsVUMK5Ny2f@vger.kernel.org
X-Gm-Message-State: AOJu0YzQwm5YfckBfCrkJz7LSqJ78DQv5k1/R0GDZ0MQ9qs24wK8RgS/
	IpZrsfT/X+cRKhtDZvK54DkCSc3LKV5GaSqaork/FT+YjEaPZrqVOMoF5mwxpvAQS1GgZ5iatRr
	ZZMcDpkaMcieLbKqo5/XrtDUgUkaNXuZ572EEJ4R79r+PAQISxB6O0qR4AmbUNbfPYs966Bg4pR
	ERzi3VXjgPWjJhYz59acjc+tbjzfL+OxWCLh8KfMAxSIw=
X-Gm-Gg: Acq92OF0frxwEX+vkjijRwcscHM+HPy4de4ZBl9IHyJTXN6EWPd3JAOuUnR2GjcmXXs
	0WzGOMgYyCILO7TUXagnagieHZ2IHrYYwWTW6ZEEkC9Z1hzR0yWemD91rs1WORMpviQQABxj89v
	UEsQBQa0GO/XXgzffxEe4ocH6CBuwLkl8AtsJz2Lawgb3qwidcOotkPYdu0xnknmukZzwIBHFTX
	I7UGgnA2vDA93DSZH0HNLug6JyyW2M2EM3Rc+u3yi+VrB3a
X-Received: by 2002:a05:6870:2c41:b0:439:f46f:c3e6 with SMTP id 586e51a60fabf-43a2de0c518mr15920018fac.36.1779284854569;
        Wed, 20 May 2026 06:47:34 -0700 (PDT)
X-Received: by 2002:a05:6870:2c41:b0:439:f46f:c3e6 with SMTP id
 586e51a60fabf-43a2de0c518mr15919994fac.36.1779284854130; Wed, 20 May 2026
 06:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
 <20260518190735.16236-6-robin.clark@oss.qualcomm.com> <b4787a2b-c1db-4c0c-8c58-fe60fed83cfb@oss.qualcomm.com>
 <CACSVV01srddm1569SStsdBg_L_JG79sPgORokNUw8odgyix=pA@mail.gmail.com>
In-Reply-To: <CACSVV01srddm1569SStsdBg_L_JG79sPgORokNUw8odgyix=pA@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 20 May 2026 06:47:22 -0700
X-Gm-Features: AVHnY4L2W2iyJl0xEtVcL3iOFbzIH1hsMF3IpZHMa3awxKpfgFecbH9ma0VO5qg
Message-ID: <CACSVV01UwdB+O6=h-3vVmeiyBFMYCT6HTrcF+Pc8CwSpTSFcaw@mail.gmail.com>
Subject: Re: [PATCH v7 05/16] drm/msm/registers: Add perfcntr json
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0dbb77 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=BJRrLYK1mc_FFp4VC2gA:9 a=8f1wxSZkJpRnjI3K:21 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: bEXwODFuT4Qmfo6wTq7opMPOVtn3T1_2
X-Proofpoint-ORIG-GUID: bEXwODFuT4Qmfo6wTq7opMPOVtn3T1_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzNCBTYWx0ZWRfXwJi8JYAp7edH
 bz73d8wn7vwVqZpcq1psR2+sJII4qE58tOkzvx12fhfBNWvKJ2Y6SNlIfbxIzpj7iWFI5D86EYD
 aeBbW9zc6M+bn4/oOSSXj4LKNV2r+XV83CEjNVH3a0/c71CDJ/cEgpyMFUGEyFIrN0qXupyxGaz
 BNC6svr3moD8p5DGTLHiD3VIZ4AHFo7+rkdKHH+N/N1JujsH1CYFkHDJSlNviG/fowDJz9wWGcO
 ntlBG9ruuNCPIy7fesTz2c8o0u/gFKitAdg9Dbk/dvQM9GYb9zafiiCUIUe4W2++8Ve4Tc/rrvR
 f8HJN826jDGjqg1gQiKzcrluRir2WxrvjlLchLcbOqtfe6ZvnsS9+aKeJAajuoJBb/MeB8Ke2U4
 X3oixhC3nqXX5WuBoT/ip3PolFGPc4sdoaJYU5zvQXCWM/i+TO7n4Jpmd5OefPBQohjYCIXroeo
 BP9bKE9TvyBfkrys2Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108759-lists,linux-arm-msm=lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,gmail.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A837558F41B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 5:30=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Wed, May 20, 2026 at 1:36=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualc=
omm.com> wrote:
> >
> > On 5/19/2026 12:36 AM, Rob Clark wrote:
> > > Pull in perfcntr json and wire up generation of perfcntr tables.
> > >
> > > Sync from mesa commit d2c4653ee953 ("freedreno/registers: Add gen8 pe=
rfcntrs")
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/Makefile                  |  25 +-
> > >  drivers/gpu/drm/msm/msm_perfcntr.h            |  48 ++++
> > >  .../msm/registers/adreno/a2xx_perfcntrs.json  | 109 ++++++++
> > >  .../msm/registers/adreno/a5xx_perfcntrs.json  | 128 ++++++++++
> > >  .../msm/registers/adreno/a6xx_perfcntrs.json  | 105 ++++++++
> > >  .../msm/registers/adreno/a7xx_perfcntrs.json  | 228 ++++++++++++++++=
+
> > >  .../msm/registers/adreno/a8xx_perfcntrs.json  | 240 ++++++++++++++++=
++
> > >  7 files changed, 882 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
> > >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcnt=
rs.json
> > >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcnt=
rs.json
> > >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcnt=
rs.json
> > >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcnt=
rs.json
> > >  create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcnt=
rs.json
> > >
> >
> > << snip >>
> >
> > > diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json=
 b/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
> > > new file mode 100644
> > > index 000000000000..8bb31820479e
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
> > > @@ -0,0 +1,105 @@
> > > +{
> >
> > RBBM and CMP groups are missing here.
>
> Yes, so far we only support the counters that mesa has been using.
> There are some missing.  Although RBBM and CMP look straightforward to
> add.

Oh, actually, it looks like we need to use RBBM_PERFCTR_LOAD_VALUE on
a6xx gen1/gen2.  So I'll leave out RBBM until we have a way of dealing
with mid-gen counter changes.  But adding CMP looks doable.

BR,
-R

>
> > > +    "chip": "A6XX",
> > > +    "groups": [
> > > +        {
> > > +            "name": "CP",
> > > +            "num": 14,
> > > +            "reserved": [ 0 ],
> > > +            "select": "CP_PERFCTR_CP_SEL",
> > > +            "counter": "RBBM_PERFCTR_CP",
> > > +            "countable_type": "a6xx_cp_perfcounter_select"
> >
> > << snip >>
> >
> > > diff --git a/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json=
 b/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
> > > new file mode 100644
> > > index 000000000000..e60aab1862ec
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
> > > @@ -0,0 +1,228 @@
> > > +{
> > > +    "chip": "A7XX",
> > > +    "groups": [
> > > +        {
> > > +            "name": "CP",
> > > +            "num": 14,
> > > +            "reserved": [ 0 ],
> > > +            "select": "CP_PERFCTR_CP_SEL",
> > > +            "counter": "RBBM_PERFCTR_CP",
> > > +            "countable_type": "a7xx_cp_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "RBBM",
> > > +            "num": 4,
> > > +            "select": "RBBM_PERFCTR_RBBM_SEL",
> > > +            "counter": "RBBM_PERFCTR_RBBM",
> > > +            "countable_type": "a7xx_rbbm_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "PC",
> > > +            "pipe": "BR",
> > > +            "num": 8,
> > > +            "select": "PC_PERFCTR_PC_SEL",
> > > +            "counter": "RBBM_PERFCTR_PC",
> > > +            "countable_type": "a7xx_pc_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "VFD",
> > > +            "pipe": "BR",
> > > +            "num": 8,
> > > +            "select": "VFD_PERFCTR_VFD_SEL",
> > > +            "counter": "RBBM_PERFCTR_VFD",
> > > +            "countable_type": "a7xx_vfd_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "HLSQ",
> > > +            "pipe": "BR",
> > > +            "num": 6,
> > > +            "select": "SP_PERFCTR_HLSQ_SEL",
> > > +            "counter": "RBBM_PERFCTR_HLSQ",
> > > +            "countable_type": "a7xx_hlsq_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "VPC",
> > > +            "pipe": "BR",
> > > +            "num": 6,
> > > +            "select": "VPC_PERFCTR_VPC_SEL",
> > > +            "counter": "RBBM_PERFCTR_VPC",
> > > +            "countable_type": "a7xx_vpc_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "TSE",
> > > +            "pipe": "BR",
> > > +            "num": 4,
> > > +            "select": "GRAS_PERFCTR_TSE_SEL",
> > > +            "counter": "RBBM_PERFCTR_TSE",
> > > +            "countable_type": "a7xx_tse_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "RAS",
> > > +            "pipe": "BR",
> > > +            "num": 4,
> > > +            "select": "GRAS_PERFCTR_RAS_SEL",
> > > +            "counter": "RBBM_PERFCTR_RAS",
> > > +            "countable_type": "a7xx_ras_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "UCHE",
> > > +            "num": 12,
> >
> > A740 and newer has 24 counters
>
> We don't yet have a way of dealing with mid-gen changes like this..  I
> have some ideas, but nothing implemented yet.  The same situation
> comes up for a8xx, where some new counter groups are added.
>
> > > +            "select": "UCHE_PERFCTR_UCHE_SEL",
> > > +            "counter": "RBBM_PERFCTR_UCHE",
> > > +            "countable_type": "a7xx_uche_perfcounter_select"
> > > +        },
> >
> > << snip >>
> >
> > > diff --git a/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json=
 b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
> > > new file mode 100644
> > > index 000000000000..503b113df397
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
> > > @@ -0,0 +1,240 @@
> > > +{
> > > +    "chip": "A8XX",
> > > +    "groups": [
> > > +        {
> > > +            "name": "CP",
> > > +            "num": 14,
> > > +            "reserved": [ 0 ],
> > > +            "select": "CP_PERFCTR_CP_SEL",
> > > +            "counter": "RBBM_PERFCTR_CP",
> > > +            "countable_type": "a8xx_cp_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "RBBM",
> > > +            "num": 4,
> > > +            "select": "RBBM_PERFCTR_RBBM_SEL",
> > > +            "slice_select": [ "RBBM_SLICE_PERFCTR_RBBM_SEL" ],
> > > +            "counter": "RBBM_PERFCTR_RBBM",
> > > +            "countable_type": "a8xx_rbbm_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "PC",
> > > +            "pipe": "BR",
> > > +            "num": 8,
> > > +            "select": "PC_PERFCTR_PC_SEL",
> > > +            "slice_select": [ "PC_SLICE_PERFCTR_PC_SEL" ],
> > > +            "counter": "RBBM_PERFCTR_PC",
> > > +            "countable_type": "a8xx_pc_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "VFD",
> > > +            "pipe": "BR",
> > > +            "num": 8,
> > > +            "select": "VFD_PERFCTR_VFD_SEL",
> > > +            "counter": "RBBM_PERFCTR_VFD",
> > > +            "countable_type": "a8xx_vfd_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "HLSQ",
> > > +            "pipe": "BR",
> > > +            "num": 6,
> > > +            "select": "SP_PERFCTR_HLSQ_SEL",
> > > +            "slice_select": [ "SP_PERFCTR_HLSQ_SEL_2" ],
> > > +            "counter": "RBBM_PERFCTR_HLSQ",
> > > +            "countable_type": "a8xx_hlsq_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "VPC",
> > > +            "pipe": "BR",
> > > +            "num": 6,
> > > +            "select": "VPC_PERFCTR_VPC_SEL",
> > > +            "slice_select": [ "VPC_PERFCTR_VPC_SEL_1", "VPC_PERFCTR_=
VPC_SEL_2" ],
> > > +            "counter": "RBBM_PERFCTR_VPC",
> > > +            "countable_type": "a8xx_vpc_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "TSE",
> > > +            "pipe": "BR",
> > > +            "num": 4,
> > > +            "select": "GRAS_PERFCTR_TSE_SEL",
> > > +            "slice_select": [ "GRAS_PERFCTR_TSEFE_SEL" ],
> > > +            "counter": "RBBM_PERFCTR_TSE",
> > > +            "countable_type": "a8xx_tse_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "RAS",
> > > +            "pipe": "BR",
> > > +            "num": 4,
> > > +            "select": "GRAS_PERFCTR_RAS_SEL",
> > > +            "counter": "RBBM_PERFCTR_RAS",
> > > +            "countable_type": "a8xx_ras_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "UCHE",
> > > +            "num": 12,
> >
> > "num": 24,
>
> ack
>
> >
> > > +            "select": "UCHE_PERFCTR_UCHE_SEL",
> > > +            "counter": "RBBM_PERFCTR_UCHE",
> > > +            "countable_type": "a8xx_uche_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "TP",
> > > +            "pipe": "BR",
> > > +            "num": 12,
> > > +            "select": "TPL1_PERFCTR_TP_SEL",
> > > +            "counter": "RBBM_PERFCTR_TP",
> > > +            "countable_type": "a8xx_tp_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "SP",
> > > +            "pipe": "BR",
> > > +            "num": 24,
> > > +            "select": "SP_PERFCTR_SP_SEL",
> > > +            "counter": "RBBM_PERFCTR_SP",
> > > +            "countable_type": "a8xx_sp_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "RB",
> > > +            "pipe": "BR",
> > > +            "num": 8,
> > > +            "select": "RB_PERFCTR_RB_SEL",
> > > +            "counter": "RBBM_PERFCTR_RB",
> > > +            "countable_type": "a8xx_rb_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "VSC",
> > > +            "num": 2,
> > > +            "select": "VSC_PERFCTR_VSC_SEL",
> > > +            "counter": "RBBM_PERFCTR_VSC",
> > > +            "countable_type": "a8xx_vsc_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "CCU",
> > > +            "pipe": "BR",
> > > +            "num": 5,
> > > +            "select": "RB_PERFCTR_CCU_SEL",
> > > +            "counter": "RBBM_PERFCTR_CCU",
> > > +            "countable_type": "a8xx_ccu_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "LRZ",
> > > +            "pipe": "BR",
> > > +            "num": 4,
> > > +            "select": "GRAS_PERFCTR_LRZ_SEL",
> > > +            "counter": "RBBM_PERFCTR_LRZ",
> > > +            "countable_type": "a8xx_lrz_perfcounter_select"
> > > +        },
> > > +        {
> > > +            "name": "CMP",
> >
> > "pipe": "BR",
>
> ack
>
> BR,
> -R

