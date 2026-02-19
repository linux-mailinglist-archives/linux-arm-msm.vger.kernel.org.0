Return-Path: <linux-arm-msm+bounces-93436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKkmAWRwl2nUygIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 21:19:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 522A3162463
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 21:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D95F8300EA83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 20:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBCC3164D4;
	Thu, 19 Feb 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gF8ulrvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qk6R3ZKT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3653B3112AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771532384; cv=pass; b=evHRdVGV5rhQr/U98xys0mmEi8th1d64STmonbFoFWHLo+N9GcxqS5m4ezcw7ki/kpTwRSQsZyYBxjxjsGB613P5Nny7YQ7e9J7FZokEqax6StvkblTQByxxJnhQf9g7/Cl4eM1nIHjbP8/Tj3fbgRlWMGk9r/VsbNddglDCbfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771532384; c=relaxed/simple;
	bh=UawwyEKBoOPSd1rQL7Dt1QHG0OXJ/oTpOBlqgdBKsrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYrvQg1uVIbFB61y0Ur/91Yn0iTddeVvTB4BIzvjRr2DcIK7s5a601ajERomn95FJ3lXwLuh0Z2dOvXmrbASwMCFgirktlZ7aEB+e9Dzk1ZFbjUrRwR5aDEMD9FfYzIxS2J7/lEVFK3UWtTSQlNzjtH9FMDxWitb5Qfnv0lvSzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gF8ulrvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qk6R3ZKT; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JC7dXg2883966
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 20:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFjKiYByGJaFBlPv9NzFODRchXOJEP9dsjIuSmH3oS0=; b=gF8ulrvQbBx468QG
	iMl+UQTqJN2HEUAKQayBWZoxvnhgRASuyHzuzYLHa4leO6AiYgwkWUeeKV8HRG6E
	Mj6ADZs2jNjAsNIzIZh5YXHoF++oqex1dGS3t6qHi3jyl/b/Ha7wGsdRA7B02Gij
	Ph71TTiJFOVJIFgEu5YQxROsTMG4Q3gTs42DrChpgSDAKWmNfZ6xe6SSu2I0/f9d
	7eB3kEL2KGLr3IdkgpvzvIPQyMjLo4wm0r4b5mez07oyo3sdLTIjdsFpCA2Xf3M0
	PoL6bkxy6dbmLvOjd5xZcekQOE7wNz6sHyfD6hJPkeK5xfoF2rweNbG0oX+rJkrL
	47vtPQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfgb02f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 20:19:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89502dfd7b4so108075596d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 12:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771532381; cv=none;
        d=google.com; s=arc-20240605;
        b=Ci9WB/J6xNKJXJ4dVc0Bv6cqsXiJzlrOhTr7WHRyRmoH6OWWZOCS1IonoGOmIeJXz5
         RkYJF4YO2AEciSuvzXyUHyZpzQhBTCv8lz4d24BOF2AzJjC2fMDlcLzWzPH1V0Gp0tZr
         zD8kDeqLjgU2y8VLuEl5b8ej/u1zYw+MCnOmj96gN0kOmbVSEc5YGzwa8KCa1UTEgTNt
         Wlrwylsx0eeL79BQ6EPc1u/Dxq/oZyv+ZM2cCRF2GAH+IFT/8Fq16qHNxfU8S1phV/HO
         DCL00ZZmFuUnF3WHVLntxiamehrxBpea9sEY34V5H9nYXRrjulPY8FqXgCY4BP0qspPT
         FBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JFjKiYByGJaFBlPv9NzFODRchXOJEP9dsjIuSmH3oS0=;
        fh=dryi4p2ntI8kPAdT8dNuOxE6n/Wv2YEkQUe1YC6FI9M=;
        b=Tk39Tjdj/yahOOCqi985GhhOEoC7N9Og0w3ciotsVos08Ogla/BeqRmap+2O9ZciJu
         JS2ura78ymNqXeDQGC6c9OPlYazjWPmabdb6Q1N10Ra6hQNKbZ4JMm5/cTeG9UE1eH5E
         9Ic6MPd5UZFV3KDYOS6+StZ1JP7JTXPAgkzbDRdk/7LZFym07HGt7lnL4sJg4I90kYAY
         8Gm+3A7FsAt2bsrMrORgL0WtWt/TAXYKgmqVsyThBy+UQEq3+SAfghiubOTa2EEKtWVG
         cuueHZmn1L0RXnhMM7QB4hieURfYrm39odQhUsguqR0KdmbI2+qp5+FPDdnF4iftPZnP
         WUNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771532381; x=1772137181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFjKiYByGJaFBlPv9NzFODRchXOJEP9dsjIuSmH3oS0=;
        b=Qk6R3ZKTPRjCDaCd9QNTMvWfeLNkaoRtGCHBbIE7OriQTUaKsUx2tLUslEITUdwf5m
         YedN/elkh8qiUu6WYcnwBkTUwlHLXT8Evhkbz5Dm6nb5rm6GsaEbBK8cJtKRP+ReOCKv
         ZPaDLP/iisa89TDksNQdRMTjzeDR4I/Xp/Zo/4f83NpAHgeyucVOXv/c9s1jAHneegAR
         sgFNXjwf6XKqa4fbWWKiOoZmMnwjJwkPITNhLBuZwnvEp+sLcEAzUndxuvPZ2YYOZak8
         F9K2klhfKOVmh+0BJLkmipq071QybZXiG7mrzCAar6ketGYM0A1RvW4YX2Q2wn5AUfQK
         dH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771532381; x=1772137181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFjKiYByGJaFBlPv9NzFODRchXOJEP9dsjIuSmH3oS0=;
        b=LdLCS99346uQODZ1y2RH4vIg1E5CfAkQE7TXxRPTsNzqYA21ZUW9aHudzwpfNJo7lu
         Y8bHuEgdbtfV3x68i6hNylLLR5imKP2s6Tm99z34Pbu3dOUfWIeQdl7/6RlgwR6sKGGo
         EPGLOEwJe/OjMBBVbA5GTvrVAQATk7ybMFbL95H+Z9BBbVT8tFVjlI+/SbHyAM+1FYTW
         pS7JkWv5uR2JPt/7okzSq258Yz4Zdl4rMCkyZBPQT5FmXqlxjZxNofwcbV7IdUQKUNDU
         Jk9otanC/zgCVK9PHUbqP6cfOzjsAP6SaMjSXTepWRFeDgWUmSnBW9wK1eGzbWr/g/TZ
         2Tlg==
X-Forwarded-Encrypted: i=1; AJvYcCUuDGnBRE/F2qo0C3i+9SXq/Kh/+VJ7FhX+xbDwtGATRjCcSmawxMM3zMfek7Ph0Ro2BXdZUvxs+AumAqK0@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZ2axhvHrdHou3dFyXSqVL4GfaITO8FWyEeI/ETNRt2VG8dvU
	9X7EahfwagfKnjDpeQZw/48THkz1Fg3Cq1ZOmii1plUHpq7AZzgDUbA6S7L05PGDRi6SlBsyKc/
	f+xwNdmyHmTXdzjobwg+QKP0IoYcAH2V/62/rkiEemezu1N6rRWsjOez+/+YkJiH1J7hkDio0ZO
	h9mjqg0sUxU728GhMdG7l87sxin3i1iA8tvVczqFT0lo0=
X-Gm-Gg: AZuq6aLalk1jXBUm92eMTCuk+8mUQfnoOozUHS03LjL/Q6L2YnHGZbRJbGyNkPd8ESS
	lWz0r5nBG6FG50SQTWtJJ/TbRXpo1aQxubNhBY3KrFdbKUpsuiErcipXq1jOQGNzAiJCF9g1eK6
	ydJNETMhfb+2Mm9QmFmlZLnJ5yBV75+F2KvZ91dybKrctsQ1VH9p2cYMwKkbEA6kPitRYwMWT+c
	0bJ6ci7DAcThH2x1lqMVrj/2JUOQytUqI4zByM=
X-Received: by 2002:a05:6214:130d:b0:88f:a4a0:2ddf with SMTP id 6a1803df08f44-89958083fb7mr101051176d6.46.1771532381330;
        Thu, 19 Feb 2026 12:19:41 -0800 (PST)
X-Received: by 2002:a05:6214:130d:b0:88f:a4a0:2ddf with SMTP id
 6a1803df08f44-89958083fb7mr101050816d6.46.1771532380857; Thu, 19 Feb 2026
 12:19:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-3-loic.poulain@oss.qualcomm.com> <708b6179-90b9-4fe9-9c0c-738fc1c82c2e@linaro.org>
In-Reply-To: <708b6179-90b9-4fe9-9c0c-738fc1c82c2e@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 21:19:29 +0100
X-Gm-Features: AaiRm51wi0fSwrfkuTIYmpIdvN5iYehCTZE40jiIrgOP3CrOcmGSZQ3xTf8g_TE
Message-ID: <CAFEp6-2-Kck-uL3jx5GjRpcfUSgXN+82uCo_tqtybNBF+mBT-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: qcom: camss: csid-340: Enable PIX path support
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: rfoss@kernel.org, todor.too@gmail.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Mwv5r6pqDX1tHxqv6qxzSCi3rU0c28Z1
X-Proofpoint-ORIG-GUID: Mwv5r6pqDX1tHxqv6qxzSCi3rU0c28Z1
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=6997705e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=h5MQyaYAs278ZTsjb9AA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE4NCBTYWx0ZWRfX6Ud1aNVe0yO2
 DW7E10bmLF3lYltJiWKFCTxHUrYgVzJ3SrQN50a0D3aZ5oLYzSS29wD7fRJCQsVWLQuENOkstzN
 izjWYVYrBy3gmxKfncmmWfeS9rZCTA9NF1hZHJZgbixueJ0btgMkbT4r+HJMJic4t3REGGELke0
 OVH7z3X2ZbwEltGk7SES9Kuxpk2Z4YlJfS36ownxCiYY047d8PIh70Ve/Dpy6NkZ2cYbDglohAo
 mxqk0HAb/DfGQ0MJjjL5glnh33fK8Dqu0knPbtjn72h7fwRjlO4YTbR3FRKoBkD8FiSPq4g0SGT
 T/rcJIKTYiu/o+pvcxhofO0HxxgAXyPNTz1zO62XexgfJwPnw5LZtcKR+XNlRvO6t139+lZLX/C
 gU7RCSkfXX8lFidVUYaS41wEqZlUKZW7diVZqU5AQdDhFqkEBXi8FHzsL3qks2PFDKbc4tlX8J5
 Krlbt4F33wRkKt7MeYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190184
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
	TAGGED_FROM(0.00)[bounces-93436-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 522A3162463
X-Rspamd-Action: no action

Hi Bryan,

On Thu, Feb 19, 2026 at 4:51=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/02/2026 15:27, Loic Poulain wrote:
> > Add support for CSID to PIX interface.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   .../platform/qcom/camss/camss-csid-340.c      | 85 ++++++++++++------=
-
> >   1 file changed, 55 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drive=
rs/media/platform/qcom/camss/camss-csid-340.c
> > index 2b50f9b96a34..f7b4cb054c55 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> > @@ -41,19 +41,24 @@
> >   #define             CSI2_RX_CFG1_MISR_EN                    BIT(6)
> >   #define             CSI2_RX_CFG1_CGC_MODE                   BIT(7)
> >
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
> > -
> > -#define CSID_RDI_CTRL(rdi)                                   (0x308 + =
0x100 * (rdi))
> > -#define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY         0
> > -#define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY               1
> > +#define CSID_CFG0(iface)                                     (0x300 + =
0x100 * (iface))
> > +#define              CSID_CFG0_BYTE_CNTR_EN                  BIT(0)
> > +#define              CSID_CFG0_TIMESTAMP_EN                  BIT(1)
> > +#define              CSID_CFG0_DECODE_FORMAT_MASK            GENMASK(1=
5, 12)
> > +#define              CSID_CFG0_DECODE_FORMAT_NOP             CSID_CFG0=
_DECODE_FORMAT_MASK
> > +#define              CSID_CFG0_DT_MASK                       GENMASK(2=
1, 16)
> > +#define              CSID_CFG0_VC_MASK                       GENMASK(2=
3, 22)
> > +#define              CSID_CFG0_DTID_MASK                     GENMASK(2=
8, 27)
> > +#define              CSID_CFG0_ENABLE                        BIT(31)
> > +
> > +#define CSID_CTRL(iface)                                     (0x308 + =
0x100 * (iface))
> > +#define CSID_CTRL_HALT_AT_FRAME_BOUNDARY             0
> > +#define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY           1
> > +
> > +#define CSID_MAX_RDI_SRC_STREAMS     (MSM_CSID_MAX_SRC_STREAMS - 1)
> > +#define CSID_PIX_SRC_STREAMS         CSID_MAX_RDI_SRC_STREAMS
>
> This I think is fairly common - PIX is ~ always the last one of four -
> should probably be in the shared csid.h

Yes, that makes sense.

> > +
> > +#define CSID_IFACE_PIX       -1
>
> -1 ?

In the CSID register map, the block offsets are as follows:
IPP: 0x200
RDI0: 0x300
RDI1: 0x400
RDI2: 0x500

However, CAMSS uses a different internal interface numbering:
0: RDI0
1: RDI1
2: RDI2
3: PIX

To keep helper macros such as CSID_CFG0(iface) simple and avoid
'complex' conditionals or mapping, we maintain a direct mapping from
CAMSS iface to CSID register offsets. Only the PIX path requires
special treatment (-1 =3D> 0x300 + -1 * 0x100).

Regards,
Loic

