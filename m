Return-Path: <linux-arm-msm+bounces-109504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OkmJPrVEmqz4QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:42:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0697D5C20BC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 999D5305C4EB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C677C391E55;
	Sun, 24 May 2026 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBaMnBO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7azXtik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F5390CB3
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618971; cv=none; b=MZLReEgIKcQh/1dY/vqXpNlbLHm/qw5/fbQX59F84HYSdK517QGswrtHa6Le4wukxLjwkArbnnXPuqB91okh5KSMbWAifuosnc+znnidck2OpOKlFuxjE0YG226KE6oNRodhE+cPzsQODZHEWtzvjqiQRQfSutHJSDKG+wgJE6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618971; c=relaxed/simple;
	bh=+W1k58JBpvJmrhRivouQ82SbjAmlk6Yeva3tSpfthIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNcLrcCqO/H83q8PayDkGXvWHLGBLiDaxz86pVmKNmWivJV5XWPoF44b68ckXW87ASPKKVPvCSGjaNGalhdPN3G6cMRl01qAT7hI1y03xLLdlm1a6XjuSFXlOJr8uZIqnIdS29UpSchvyv5EEDtUKBg2dgBXI43MWLCYr2OjZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBaMnBO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7azXtik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O0sS2g3192717
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TL5YCAu4sH+fnNry4R/TvUCKep+v9hMJ+/m2KMh4fPo=; b=YBaMnBO9h7HfJ0jE
	UOUeV9LyRqaI0JG9SS+L0kXygDLIgjqh8mIDY2AskCV2oRrmVAx5v+FOPZk9Ufea
	c7ftwn66uALjMl6Tt3f/rdSeYOI9g+FsLjzC/p9AND4vOB9hWzth+YmzSi9XFXJg
	+hw1WL5R0Vn7Gv5vUf6PkqZOePRu0YMFR2cNSWZPTtj1iOykfGQYWEhCAgYqu4PC
	I5xUI928ebIvxm3o/s3dQwWOMwBRcwDX57Alf2WoVXSO58Y5DtJesEwp3SMus5iA
	09R5bAEx9m+LiTEgBk/OocwrL2/wieVYi43jQ6VKor5azjuDBeph0czLBvfEx2MT
	+BaQvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmkcaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:36:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516dd6e4ed4so38727581cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618968; x=1780223768; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TL5YCAu4sH+fnNry4R/TvUCKep+v9hMJ+/m2KMh4fPo=;
        b=h7azXtiknPOO6BlLoB4hWU18D/9LJJsHT9UyuxNlH/ZVAbYOaKjNxtOF6SdX0oEa8W
         6OZxdpLAkHGjjNkrz4PZU8mbDIbPm95PqhgSFwNg3HB56gqvNHOaHJOClkBMNGfcDBdp
         dhRkkW2hm3dxGR5iHeUOiikRNgt2wjrp/z8DRG2lSoqhtBs1UuOqZAsZRslA/ajEGNu4
         hey/LfY7B4kBDv5W8+f8rI+A18p5JuRGUX0uky1MHyorveHLJ4RPX5Zg2WaLlLJjVo0x
         7avLPHazvz+jG3sI7By0jHE8yQmqXf/sxtlcr83yP0CuRvn6u29Tl3UkOaMpN9d6HUeb
         G0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618968; x=1780223768;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TL5YCAu4sH+fnNry4R/TvUCKep+v9hMJ+/m2KMh4fPo=;
        b=WuTnvhZbh2jPHn6hhNbjnumNVnB/wUWdBg0b9dgYyw6ucwXth4TNzBhMF3kCWTE4ji
         knTz9Zp9KwtVkPDjF4o7hFB/KSoo13SOy2sZp7eKuQbtusryrgtfcMj46y7uMSzDe0QM
         FY9PgXLAlhNnQ+lGvWRL3wzPLTssmUNEzVxSi9pCKFT6mbOfqyAztueybiYOcScL301k
         UMhItzvzefdHwBaOpK00msQO/th6JNHwpEHaqIQ7dQ4knLChWgNNrt3lZdbLGmNpaW+b
         Xyj4lOZ20YXPqXUGqs6Y/n0JF6hV+qIkMmnxAQtu2YLFjXnq5t/IIAfeh2LANrhHJ9Uc
         F9Hg==
X-Forwarded-Encrypted: i=1; AFNElJ/IRl8hcUVi8TQjmd8RFePdXH4KJUj4aWidX1o6KdR054m4JRn9xRrxn3jmddGeHnpAJ4xGRGsjAI26q+3z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6MTPDlOt5XMw2fwtLxRV89m3dr7m9WI+kryh1whN2NtZSakRN
	MVvSFwiaC4CJFL6LP52KWgNUxp0jkTvr8Ccn5NW8wOfmokvnHAYSBnCS/aR/RKVL5ThmCksR1om
	Wi9FYAGf1zfHimAqyV3kEj8/aZ8ipPmzCu0btaLEvn6oVQ9Afx8Vc1q8648E8PzjSMVxblC0vJD
	CL
X-Gm-Gg: Acq92OEkjA47xrCKL2PhaUlNO5tJeKm5OlX0QLNX+k1x7/5ipirkBzjooeoo3Ow2SXl
	/Hl7+dWaMIT2ZZiXitRwliyBSrfGEWnCww3qOhG5ITQ+wY2TNsyBaEACsY5a20Up2lazCQzbuJq
	AlCPGS/wm/uxTkYWGSEJ7+WET1tKn6Men2pkhc773+rt2r1aJsToPk3b9726jHVNJXZjq+e/7Zd
	aQgiSwFeFWUTzaQbpvYkH1CZR/KrQWACaXzQiZmIOQghi+XOTGShvEFU5XNG/tTAz7zzx7EN6Mv
	NQonqVLTIRPBIUBp1XHlfJL4iXhQgBJqrhxKhogFTfOJ1wES854BXaIEGPgvgMnJZ/zyFf3ruFF
	+eOpjAoCN3GcBZHzIRMSOaxt8r7K/xezVY2MbmbPDN9JIkW4JW93Culal3LbTk2nYHvlF7Iinl1
	NSPMowIs17TpLID8VT83/ARdZJZGFdYlGIgl4=
X-Received: by 2002:a05:622a:d01:b0:50f:be4f:465d with SMTP id d75a77b69052e-516d44096aemr112265721cf.46.1779618968330;
        Sun, 24 May 2026 03:36:08 -0700 (PDT)
X-Received: by 2002:a05:622a:d01:b0:50f:be4f:465d with SMTP id d75a77b69052e-516d44096aemr112265571cf.46.1779618967906;
        Sun, 24 May 2026 03:36:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca02dd6sm16266821fa.1.2026.05.24.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:36:06 -0700 (PDT)
Date: Sun, 24 May 2026 13:36:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
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
Subject: Re: [PATCH 2/3] Bluetooth: hci_qca: Support QCA2066 on M.2 connector
 via pwrseq
Message-ID: <hpcitldndtwoejbfsxy4e3f6flurmklepyzdpvbm56233dmwn7@eyvf6pycny5c>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-2-9f6942310653@oss.qualcomm.com>
 <cx3pbr47tsy5mnag73oopkodnx4jgoiipz5pzrp4uze7mk4fgg@zogzww23ueni>
 <CAFEp6-3_NuWwF=gthfJyqeHMivGnfF0xpsTXT-xGW7pgFs+j3Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3_NuWwF=gthfJyqeHMivGnfF0xpsTXT-xGW7pgFs+j3Q@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfXx80o4KsSEGi9
 HW8DbhVG3iKkdTvDQbkw6oJydWxn3/0YrLCHbgU7qZ29D2tdpECfW3AJnXFFG4lzT6/uIwKk++M
 vnGx7v5GrNISp+Qr7hz1pIghrtJgUy2wpw0udb4HY6r7wlMwPLK3mpzHsdGUOHymM0BYW12PeIn
 0AknV0HkZzzHBHOoJnNAQICcnzFb1JSanq2gwDw6zZDn7WTjEZlfKjZyz/g+Fy45ro9KzXWt3RL
 X0ygo/Zk6zMzlnnDoEEBZ7rTmcmHOp/nQejWJCIQ2QllnBDs+SyZQbyLBNq0/sOcR4hFdIx2m94
 2Nodamg0GccfFWGwZk+Vg29OIJBZFMBG3GtDlrc7+ybEW06yYpd0/worFitfZXe9YkBZU2XP1EA
 A9jYGiHijkJpCs90aGByER9zsBpRhM+NEtVraspkTeQITZdzNWGXbwAX4Y6pX3+sisJ0V/IFLxj
 KAeNEFH8vFtJNxCkJ5w==
X-Proofpoint-ORIG-GUID: 4t4l7zFeU0A-t5P0_u9BLfW8hk2dHzxv
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a12d498 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xdS1LbVOcY12UDyNXlwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4t4l7zFeU0A-t5P0_u9BLfW8hk2dHzxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240107
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109504-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0697D5C20BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 06:11:08PM +0200, Loic Poulain wrote:
> On Wed, May 20, 2026 at 2:33 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, May 20, 2026 at 01:01:43PM +0200, Loic Poulain wrote:
> > > For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
> > > is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
> > > sequencer rather than a dedicated BT enable GPIO.
> > >
> > > When the serdev controller has an OF graph (indicating it is connected
> > > to an M.2 connector), acquire the 'uart' pwrseq target from the
> > > connector's power sequencer and use it to control BT power instead of
> > > the bt-enable GPIO.
> > >
> > > Also allocate bt_power unconditionally for all SOC types since the
> > > pwrseq path is independent of the SOC type switch.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> > >  drivers/bluetooth/hci_qca.c | 33 +++++++++++++--------------------
> > >  1 file changed, 13 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > > index b5439b9956cfb0497e6ba6ccd9ed61224d23a9dd..de5cba7b7f44e280a48dad5d670fa2758d3268d0 100644
> > > --- a/drivers/bluetooth/hci_qca.c
> > > +++ b/drivers/bluetooth/hci_qca.c
> > > @@ -1873,6 +1873,9 @@ static int qca_power_on(struct hci_dev *hdev)
> > >                       /* Controller needs time to bootup. */
> > >                       msleep(150);
> > >               }
> > > +
> > > +             if (qcadev->bt_power && qcadev->bt_power->pwrseq)
> > > +                     pwrseq_power_on(qcadev->bt_power->pwrseq);
> > >       }
> > >
> > >       clear_bit(QCA_BT_OFF, &qca->flags);
> > > @@ -2415,25 +2418,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> > >       else
> > >               qcadev->btsoc_type = QCA_ROME;
> > >
> > > -     switch (qcadev->btsoc_type) {
> > > -     case QCA_QCA6390:
> > > -     case QCA_WCN3950:
> > > -     case QCA_WCN3988:
> > > -     case QCA_WCN3990:
> > > -     case QCA_WCN3991:
> > > -     case QCA_WCN3998:
> > > -     case QCA_WCN6750:
> > > -     case QCA_WCN6855:
> > > -     case QCA_WCN7850:
> > > -             qcadev->bt_power = devm_kzalloc(&serdev->dev,
> > > -                                             sizeof(struct qca_power),
> > > -                                             GFP_KERNEL);
> > > -             if (!qcadev->bt_power)
> > > -                     return -ENOMEM;
> > > -             break;
> > > -     default:
> > > -             break;
> > > -     }
> > > +     qcadev->bt_power = devm_kzalloc(&serdev->dev, sizeof(struct qca_power), GFP_KERNEL);
> > > +     if (!qcadev->bt_power)
> > > +             return -ENOMEM;
> >
> > This builds bt_power for all devices even though it wasn't the case
> > beforehand. As such, you can drop all further `if (qcadev->bt_power)`
> > checks in the driver. But, you also need to check that this won't break
> > support for other (older) chips.
> 
> Ok, I will do, and double check.
> 
> >
> > >
> > >       switch (qcadev->btsoc_type) {
> > >       case QCA_WCN3950:
> > > @@ -2543,7 +2530,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> > >                       return PTR_ERR(qcadev->bt_en);
> > >               }
> > >
> > > -             if (!qcadev->bt_en)
> > > +             if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
> >
> > And this breaks support for pwrseq for non-M.2 BT devices. There is no
> > OF graph in such a case.
> 
> Not sure why, here we handle OF graph as an optional pwrseq provider,
> but still support legacy enablement.

What about the case when pwrseq is supposed to be used (via the PMU)?
There is no OF graph in such a case. Please check that your changes
don't break e.g. RB1.

> > > +                     qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev, "uart");
> > > +                     if (IS_ERR(qcadev->bt_power->pwrseq))
> > > +                             return PTR_ERR(qcadev->bt_power->pwrseq);
> > > +             }
> > > +
> > > +             if (!qcadev->bt_en && !qcadev->bt_power->pwrseq)
> > >                       bt_en_available = false;
> > >
> > >               qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
> > >

-- 
With best wishes
Dmitry

