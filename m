Return-Path: <linux-arm-msm+bounces-109365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePPLBOuDEGpJYgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:27:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0882A5B794B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 18:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 32DA83024810
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28C1425CED;
	Fri, 22 May 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8UL5tlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ab7yDX+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834D4345CC0
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466285; cv=pass; b=GNjovrXSYzvCtKFTAFbkcD+V2Tq7b/zyB9X1KxF19Sms3iY7WTvTbM29trgO/Y/3yvJBOrxWCMf/x/L1u+ugoXWj2Cblo8amGvsdZr8vbnvfH9i1O5cmp1gP9dvjtdzvNeBRobzyBOwL7ZVpdMIxmbjfw/zTFQAMSAysQnYHYxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466285; c=relaxed/simple;
	bh=bLtI2OBA5rafdql0eae6MY8/XGVx80bBush8lA9uIPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3CmK8x4gfCYLuOF+iaz71F7hHCTtp360rLDH3JWfDcKrbNzhNWhP3uJ8Pffia1/usJGvqEhNTj61x19C5BseUes4m+3H2vXu0X1lxBhjnr5ylgXObOPm7tvwy0iYl9O9n/nwdrTf/DFqQDGW91OBdrHb5Sz22OVGI6+5RB7oaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8UL5tlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ab7yDX+7; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIi801800723
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 16:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lu1niHMrECx4L7qZONZo2E7wZ8eqqnrUPVegshXdyA=; b=C8UL5tltXnXU+6nX
	jHhbbZeMbZja0B7v1zrospoXn2ug1pL3ImgZciQ7OI7Py4ei7tviaRBOQVb6TZ1r
	7I6Sb5E4UsdKg2h7pRgaEEj5/YV1kwv/Wjp+ceh6enYt2BxwvxAwubUsJLS51Ohc
	d5cBl0XI2mFp9IWXX0Kfda9Zl5qiwh42eMTwIE5X1jsDKzWDHLF8Zb5SGuy7KHhE
	yiAXYXtAXMz/bAsnEaIqUKCqh12KIGXxeMogYcgjahBO5eTLbxD6Ss+r2P1FRlzy
	8oLVz+bFkGxYTiKaz1mHJxjjo40BRWgU2Am9jF3DdDh2Uc8jvHTiiiE5YVNpqxGQ
	SlI3zQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g1dj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 16:11:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90f5248b209so355805885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779466281; cv=none;
        d=google.com; s=arc-20240605;
        b=R+SK9CNnnTMWKqXVahAc751yYky2T/AuuK6VM+dR/Ttossgq8pTEQ5LaDUK6ttjVzb
         +Ny7p14ENKxaZwumyJdzuxXFl2YIoQihKWnZYdDkXJgIg7kuH9wzKsUTPcP4tQlOG8Ok
         CalQWSopdmaHNxKp7IiU3sV+L/kLMb4N8qtQk8yYfqH6z/95VmSymfAlbKH5wZW7Oqez
         30XXlQtcfZ/L1HwSN4/rrcbA0O83AdqH7v5FO2R9i2hlFrX4d41hLxBkazsjAhSwRNrh
         gqZ9pv3UrtZIkRyMZA4zTiPMgD2/n/fYYl7mqOdMmvjuRiF/zipvcEJRHOt+hc0/1ZO7
         9OKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lu1niHMrECx4L7qZONZo2E7wZ8eqqnrUPVegshXdyA=;
        fh=nCyIBVLm4r+dMEJXrAHlqGZMTKbPmHejZdO5JjH0Mn4=;
        b=h7hRas/1IHJztHbKqQfNkmL2lMNgVNetDiIoTcL/pJlx+nP4FhkMErIzIHNcOKMUbo
         w5xKQ8VI3arvnG6/Hj5llz/Sl/O8FQczB5iP8oHs1lG6FxcPWTyXLNg08NeMpEdkiy4R
         MbExylmlluTck5fO8yl8iwFZ1wD1IuVCrjVjM1xo80o/U/zL/cm02R/Oqiye3SSEFK7T
         za1O6gxGVpylmwNTKJYhF/1xMD5Ei3SdJsp9QzaMZBFwC3bNJs/nSqqA158irQtHVsyz
         EctA4b6jdtZDarU564tYpVpu080r9nr7/lSrR1V4nZFwXcsCBLUDXheWpRVXPVqNiUQ2
         j8vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779466281; x=1780071081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lu1niHMrECx4L7qZONZo2E7wZ8eqqnrUPVegshXdyA=;
        b=ab7yDX+7wHyPQLuGi1en5pfbfQfl59c9deiCGFVI1FJDD/Nv/TMXhY+nMl2GjWOEBS
         tvLp+pUuuQa3E/W/Sym0mij+VVP9qVZL2bCsTA5iCizlh6cuiRqlpYgvPgIYvJiB1nkk
         lhyIeAOpdXHMxlbPFInMFsXW9mzOQgptTHJJDyJaCXk4F+4UUjX3oGCGtdMqUeTZNnSQ
         zjsAWoyZeTh9dboFkNypurPhcyML/Be8CWgYZVmUTyPOSSVx0MvRrcgrV9sIczJzkGGw
         ClFYASUKNyqw8A1NYTCI3HJZMTK/l3oTsSSqFWlDqMuOaVbUfmqcRdidoZMrN24lige9
         TYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466281; x=1780071081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0lu1niHMrECx4L7qZONZo2E7wZ8eqqnrUPVegshXdyA=;
        b=JLMx4jufZHyv/xTU6Be63lto81Ph9fr3+7YlUmmm3Sw2nVAyIezErTxDRZEAtLHy1a
         XJVfWpYEs0YwG/iPVd25W9pq1hfpNDF0zRxmx02mIEe0pp9SYx6Td3MSmPxnHH9MchgU
         skjeS8DGbWSOgdpSQcFVt0/0YO7AiHECVaQGSJ8GE5yAY4sUg471FuN1EGD53nXgQaHX
         IJCO2hepaEX7hGg4Or+sW7qpfDVvvmk7UWu37W08Bu6hjoOsQ3RATHCTOzo21XnCt6e+
         l1tYnxsQes2b+TCLWqH4bUQbQtz2mvdt5PyqwJrb03E+D9a9CnvyWYBVJFvqU4TSPS60
         MJzg==
X-Forwarded-Encrypted: i=1; AFNElJ/FtKWFn5YSmvzNszm9GaGZzgZ5tnLjc52pCx2UhI1NIaU5VWTVr7b7oq1T1eLCBs79OVq2tSwoJDDmogn4@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCatBNgxklCzBZs3mCoJ5xZjlgJFtHB6ANzUUocGu03VcntnU
	GHRdD/CHPH1cWfeVdNdN2nRfehi7T5f88eM5K81CTTf3y9pGIW6T8vf0N9aMbKdAsPT6r9waM9O
	r8rBd+iyUy5pDap7pSXHCHWYrj60+2Hpd3q5uOFrn8cjPKnpajIDHnbh93EAOl0ZaI1J2jQ6KOJ
	Gp3gct3WjrSCwGDH1k8vplDCvXChc/Bhy5Kn3lMgoBezw=
X-Gm-Gg: Acq92OHst2gziXqm4Q1hH6oxR0CQ3ACRblJtDwG5tylwCVJ/iZkV0n4C3kIxhe/xvN0
	uua+auQ1z6N4Sg2cGxS0pqM+Z+Qa/OHly5O5NqbbeDbC/2oNpIBIem6J5ytBg+nR6v1EgErXljW
	iuptTqnbHGVixpP2czLZUbi8FKEvDsQylMQzdea0nPDBcfqxF9QzvHsp0XOopxzzD6AF68Y5V64
	Bv0kw1dRLgJuWyK5SqQXICM3i1JYzXJth1/xLc=
X-Received: by 2002:a05:620a:1d0b:b0:90f:9cde:9788 with SMTP id af79cd13be357-914b48d6853mr675637085a.5.1779466280580;
        Fri, 22 May 2026 09:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0b:b0:90f:9cde:9788 with SMTP id
 af79cd13be357-914b48d6853mr675629485a.5.1779466280032; Fri, 22 May 2026
 09:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-2-9f6942310653@oss.qualcomm.com> <cx3pbr47tsy5mnag73oopkodnx4jgoiipz5pzrp4uze7mk4fgg@zogzww23ueni>
In-Reply-To: <cx3pbr47tsy5mnag73oopkodnx4jgoiipz5pzrp4uze7mk4fgg@zogzww23ueni>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 22 May 2026 18:11:08 +0200
X-Gm-Features: AVHnY4KZcbVzn920hjyxYOpqLudIDkA1KQq_MhbagXA8SoEUbTo3JjxoNdQTHfM
Message-ID: <CAFEp6-3_NuWwF=gthfJyqeHMivGnfF0xpsTXT-xGW7pgFs+j3Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] Bluetooth: hci_qca: Support QCA2066 on M.2 connector
 via pwrseq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: UV3W1_aMTcWbetxOwuBhfLvEfze1jOlM
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a10802a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=O2y7hZ9sxHz_cEH75X4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: UV3W1_aMTcWbetxOwuBhfLvEfze1jOlM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE2MSBTYWx0ZWRfX3/wqg5kpZ1tM
 YodGsK8WeXq+w+4TkqN7PURC43t0cKOy9rNf7x4FolIQf51zBHpJqLK707gyo+kl88lWQoBLApe
 WGIhBbQBsgBLG3Ij2M9dgqNcTkAjiYCU16wIxiXyrJEAtVBLarFby03lyT0Dm0/tXQ5mwT98pGR
 8joggZtWr4C7Jy0WSE9Eu3xdwp6EUValTJa1TBsm0I+kavQa0RZD7gCcSjuUb6gBp62MgujxHnu
 i3QybEqhhvqIJHNCYWvlsbLHR3wmuCjJaNJ7d/gN2mr8ZNIa6umfSyxG3Gckr4u0zVpR717jKEl
 JeYrs4dVSn6JpLeZHlUwDRrduR42ycltI3KzBPz0lNpUPU+wdkiNvD/7bQH4AEaHMIuOea3KZZL
 v/+IBYiGCl11FAKbnzpMWvJ6pzf3/aKo6lltcz+aRxuiz8wezPFgiLqj8z4X/fcFo5lpHJpUm/J
 e/ooAS4B3oOqp1kyDDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220161
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109365-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 0882A5B794B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 2:33=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, May 20, 2026 at 01:01:43PM +0200, Loic Poulain wrote:
> > For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
> > is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
> > sequencer rather than a dedicated BT enable GPIO.
> >
> > When the serdev controller has an OF graph (indicating it is connected
> > to an M.2 connector), acquire the 'uart' pwrseq target from the
> > connector's power sequencer and use it to control BT power instead of
> > the bt-enable GPIO.
> >
> > Also allocate bt_power unconditionally for all SOC types since the
> > pwrseq path is independent of the SOC type switch.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/bluetooth/hci_qca.c | 33 +++++++++++++--------------------
> >  1 file changed, 13 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index b5439b9956cfb0497e6ba6ccd9ed61224d23a9dd..de5cba7b7f44e280a48dad5=
d670fa2758d3268d0 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -1873,6 +1873,9 @@ static int qca_power_on(struct hci_dev *hdev)
> >                       /* Controller needs time to bootup. */
> >                       msleep(150);
> >               }
> > +
> > +             if (qcadev->bt_power && qcadev->bt_power->pwrseq)
> > +                     pwrseq_power_on(qcadev->bt_power->pwrseq);
> >       }
> >
> >       clear_bit(QCA_BT_OFF, &qca->flags);
> > @@ -2415,25 +2418,9 @@ static int qca_serdev_probe(struct serdev_device=
 *serdev)
> >       else
> >               qcadev->btsoc_type =3D QCA_ROME;
> >
> > -     switch (qcadev->btsoc_type) {
> > -     case QCA_QCA6390:
> > -     case QCA_WCN3950:
> > -     case QCA_WCN3988:
> > -     case QCA_WCN3990:
> > -     case QCA_WCN3991:
> > -     case QCA_WCN3998:
> > -     case QCA_WCN6750:
> > -     case QCA_WCN6855:
> > -     case QCA_WCN7850:
> > -             qcadev->bt_power =3D devm_kzalloc(&serdev->dev,
> > -                                             sizeof(struct qca_power),
> > -                                             GFP_KERNEL);
> > -             if (!qcadev->bt_power)
> > -                     return -ENOMEM;
> > -             break;
> > -     default:
> > -             break;
> > -     }
> > +     qcadev->bt_power =3D devm_kzalloc(&serdev->dev, sizeof(struct qca=
_power), GFP_KERNEL);
> > +     if (!qcadev->bt_power)
> > +             return -ENOMEM;
>
> This builds bt_power for all devices even though it wasn't the case
> beforehand. As such, you can drop all further `if (qcadev->bt_power)`
> checks in the driver. But, you also need to check that this won't break
> support for other (older) chips.

Ok, I will do, and double check.

>
> >
> >       switch (qcadev->btsoc_type) {
> >       case QCA_WCN3950:
> > @@ -2543,7 +2530,13 @@ static int qca_serdev_probe(struct serdev_device=
 *serdev)
> >                       return PTR_ERR(qcadev->bt_en);
> >               }
> >
> > -             if (!qcadev->bt_en)
> > +             if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))=
 {
>
> And this breaks support for pwrseq for non-M.2 BT devices. There is no
> OF graph in such a case.

Not sure why, here we handle OF graph as an optional pwrseq provider,
but still support legacy enablement.

>
> > +                     qcadev->bt_power->pwrseq =3D devm_pwrseq_get(&ser=
dev->ctrl->dev, "uart");
> > +                     if (IS_ERR(qcadev->bt_power->pwrseq))
> > +                             return PTR_ERR(qcadev->bt_power->pwrseq);
> > +             }
> > +
> > +             if (!qcadev->bt_en && !qcadev->bt_power->pwrseq)
> >                       bt_en_available =3D false;
> >
> >               qcadev->susclk =3D devm_clk_get_optional_enabled_with_rat=
e(
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

