Return-Path: <linux-arm-msm+bounces-94967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIsTIU6kpWngCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:53:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B11DB33D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 135DF304A072
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A552A1D0DEE;
	Mon,  2 Mar 2026 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nUpyE3X7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wt6YbqBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446FD40148A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462719; cv=pass; b=J0lUjsdYmqVi6d5sE0Rhc4dFIU/0lbGVs+mIWgWtkLBBIoEN8i4bOG8XdE2ABMOrTcyd9b4R6RmmqGbGcFCeLOvDhFzbPTR+tZlIary04+SI6NRxMAIYCi/V1UQmO9D1SjJrAeS1l+OmcuF5ehTE7aruZN3nGLYBgFe48AGPCSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462719; c=relaxed/simple;
	bh=hMGFPbgcy/TDy785SFcklcPbDYptUIGhTow4s756vO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmPdK/30b6wPqXIYrqlBT32SPqzqrVaRWjeMcCkBYVPn/Z4I/AYcwNbrkJsL/6qIX+NqeqxGLMIK6ZBi15q1IZrJLgWXNpK77n4x5cWw/fSVip48cekOF2vG4KG+xOfPqyTnxLKMMen0iODRm/n/fRyzJFvncUAam9dAnoGaGJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nUpyE3X7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wt6YbqBC; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ENw1n2729394
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8WwZvM7F0v0xEHh0vy84aspSZXuF+1K2PAn1h9/oWc=; b=nUpyE3X7u+6y/0JT
	NVH/iPuT7cBuBVhVQSQkhyxSohal/Tu5MmTgSUobzaBnEbRx2QQlpsg5B69VMwJE
	B7xdcbkEOnd2Rq6BYO+p70sJCeibJ+Gv0veeDElUqJcbAhab1XRGGAb8nKWmpY7z
	bUFC9AYyZ/CZnmWyCtFiOSGjmgPg6n1LmLIwCantWjI9qCRuJ8si7IrsVTxtJO97
	m0TVVQnmPvQsmAmPmRUTRjMWpe1WkacbI2rKD3cLdV+RHq5h9kYJP8TgGh1ZLVNm
	iupqrOwMZuqZ08iamhD4fMRY28rdTi6s4NeJdNjXMA6U5V2QWolFQdwCDlaJLRuq
	dxSv0w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbaure4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:45:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899f619264fso86829796d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772462716; cv=none;
        d=google.com; s=arc-20240605;
        b=QHK47aRX5DSiDC/AF2ZWaSN6ic8tgOa+JQa12ijM4TwL6yzIm5lyIXjoRlQ98XnDBK
         o4sm5nCNnr7wO3PHoGYUOUvZPW5NjNZGQlEllAYLdh59kAFKmpgWu033CZLooWwiJK3l
         jT5jY52BjaT9MoBXPjl73w9Qytnxd0aNXAZe/ehNteLrAukhT9Qu0Hm7mZKp28J2cnc8
         oGAQBuCPiIMqpYcGPBHNM5puLVFly7otKHe9Q1SceM1YIEH51pKldDV6EaaA8kw755/j
         ahy9gJf1vh0RqtlIn5ce9YHwTx54IXlqltO4zGmdZIn3LWi2fC4yeIqjDbonHF+CEWf+
         Qdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r8WwZvM7F0v0xEHh0vy84aspSZXuF+1K2PAn1h9/oWc=;
        fh=gFeIa6xNiDky+kHDPXKaqD6aol3R5HU48dgAgj6qNmY=;
        b=J9O/VOL28q7rMdYaR7FqvsnRCDNFb6NzQiVe6SSPZnAMPEMUtEbxlQoS1vF53mwmzw
         BOE1SQCFoMO+4EKICy3lECjA6xzKTyc0kvgKBeZXs8uC8UVe6abqhsuoop5ZHgMkXf85
         DJi0h5xYs9fnG0WNvITZRzkyGiSN48nXhDjtrOd8WHbTlOIYvrPsgAkddmouIOLEBOfJ
         leX/nznfVZ5kQPu5k3uS+RJTRB5i6bICJoDIVsOiFQoAuFag/iLKGfbHwvITQdYAzy12
         L0LwEPVjCK4n6SSxOpG3THiphbr5mdbh8zFNZP+sy+oo7CXM52s0AIfBtV40GEdguZaY
         FEuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772462716; x=1773067516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8WwZvM7F0v0xEHh0vy84aspSZXuF+1K2PAn1h9/oWc=;
        b=Wt6YbqBCbFe+BiIJIfy5Q8NVcCa842RX97GoN2b26vjS4v08Q0sW1TUjl2wwLGGbJz
         gRY3dQB0G63qRcGmbxNHySThtabmzHxF8F+bFgh2wa6Fx+FkH2K6ThSSi6gCBUX+g8k+
         xa7DrVYqlutq/vCr6mSB3mvKKC5KgZKpzhLaJeLOz55AQdMN/zMHwXJcSWVNBednfIfB
         9DafO3PCAmgVnIUOybuMAe+oByjgTv4veFI67Qx1Jek6/qOcHGw+KpRrvGM6OoBg36wp
         sI8IL7ME4e1A7G0rBJ6QwbuPunXEj7UfuNPKG3NCnAxC1NbWFolzz2k/bNz+rgapBSdW
         4wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772462716; x=1773067516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8WwZvM7F0v0xEHh0vy84aspSZXuF+1K2PAn1h9/oWc=;
        b=mJpZpA3rRr+y7mvDJAoDJjBiLiNzSUUk/jIoWo1Yc6fCoEbNABH1IqFyLR1BS+ajlM
         SyuOyfaR/4KAZIIvLpeR1RRLlOnCk0iTR4vdk2eszuCXr16g1qOx7l8X891kStfoSKCf
         qtcmTFHX8BRf/nLsppwajw1DjyZTpoD2ZTSKyndj9DJr+cK1wakRCLuAxDy3tmpbEuAe
         Sqr0efRD0+Iz3R6eVhdHAeO8cyawk2Ysn0mQlORXiresgUEVAzLamw/QRT9wpRD6dE+E
         YKSjp38Z0p5cfxwm7dZy3Ogx25XSZEx94em5RtAzrbNLMLnHUV6j4jUIiR2/pn+eNah3
         c6wA==
X-Forwarded-Encrypted: i=1; AJvYcCWDBv8+0UGg7XBFoTZMe8YMUkVjAFJckwOuZxflj3QRoXUU22lGlWONugxr0FW/QU++zLGm+1Mmk5XpeUPF@vger.kernel.org
X-Gm-Message-State: AOJu0YyLV9LHSv1NFmXoMonifd/2b8YyhUU08dIqyCDtlk/u6dwn5ioV
	jeOv82Q2QskX+fdihLy+gfyLIAuOisDhE4BNZ8jL/eZxGZtlOmuN/46Xv5fZ97Cta3nQK2p0aaQ
	FMOHefD6jd3q/WrFVuc1/4uWZLh7QfeFH0T681jjiO1cCYCPNtFyismSSRG1/44NruaMdBabTq6
	tsLeQfkB8wF3J0LuPTGnuJOzHichTHKVPryUJO22KLuGQTmKSuoUMP8g==
X-Gm-Gg: ATEYQzycBIRyvPatDEmInPT/XVCuqVLYZWI2HEFY4Q7sYZ0tTk4AOUge6fT0wuFLEYh
	cd5IY8HIaqFk/cYSBHwJs3N0nP2bMCG58vMUCaqDdyJntLk3QzUyXRUPhgomNIouQk9EYQ7KwP4
	dTs8r27CT/R86h/gpbLH4OEiFUI867B2r/xkl+KfqPl1FngLEdiG8C1qTkQcidI/OKncsZoBr/v
	+vKgD9AzK0uKXucvrOogVlNcd+4WY+rIwOEu0jg
X-Received: by 2002:a05:6214:21c6:b0:896:a693:743a with SMTP id 6a1803df08f44-899d1da886fmr198072496d6.5.1772462716322;
        Mon, 02 Mar 2026 06:45:16 -0800 (PST)
X-Received: by 2002:a05:6214:21c6:b0:896:a693:743a with SMTP id
 6a1803df08f44-899d1da886fmr198071806d6.5.1772462715780; Mon, 02 Mar 2026
 06:45:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:45:04 +0100
X-Gm-Features: AaiRm52g_q-9ut5YRuzPfVjc9YOUMUhXK_-usBrh4QiYg5o-Hkom2vB8v_yqFfY
Message-ID: <CAFEp6-3iU6XEcwqkX4erAEPpgFubWMoihQy1DFyKmLtFOM_uvA@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Resume the device before
 executing mhi_pci_remove()
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mani@kernel.org, qiang.yu@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyNCBTYWx0ZWRfX7VsbCzMsICdg
 a7qIgyRSSJOMGNpdaQuw1iF593h5U7fNYuEHDhCPNn7dMxWGlDmHIp64gAsYgZ2YKX8SiQflyT/
 xXWtIcyVc2AIvj1OebAQS42rhXrIqJeshMYjsGuFYJdF2GBdZIUtfO+0ZSB5EMA0SVzqf6d4PK1
 NBkiPXJGfUu8gnavCia+DVgOdE9rAaoldplGZ++cuZANjB0sIbn0r7/xAqIsWErlVPupak4QEVP
 SquAUCdBpOGdBrW7wBzfzNNH2Y320l4TPKRFAJTMty2k58oYKcIrcG1kfqw1yZq5e6YN95kmlHs
 WsyzMkZ5qJjCzOUVugWkKHkXVrMjNCaINmmNxd/qt8ngA+FnIi8DsgGtjuitpmT4FURCpq3A+g9
 Ou4zPGDpw57MRfJWZJmAjHyfBaf3u1l9Y4fyFLV7cOLTmeDqvEqH+hK8YZ0oaYDjJ5CUdZ6t7bK
 AiCuREfD41iY66OVNpg==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5a27d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=o1KvY5UHcyvAiU2fnK8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: uKPh_wr-2lG86P_sXfEJ8-7Ecaey8lko
X-Proofpoint-GUID: uKPh_wr-2lG86P_sXfEJ8-7Ecaey8lko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020124
X-Rspamd-Queue-Id: 9F6B11DB33D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94967-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 2:41=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> mhi_pci_remove() carries out device specific operations that requires the
> device to be active. But pm_runtime_get_noresume() called at the end of t=
he
> remove() will not guarantee that.
>
> So use pm_runtime_get_sync() and call it at the start of remove().
>
> Cc: <stable@vger.kernel.org> # 5.13
> Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index 425362037830..fe3aefa15966 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1440,6 +1440,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>         struct mhi_pci_device *mhi_pdev =3D pci_get_drvdata(pdev);
>         struct mhi_controller *mhi_cntrl =3D &mhi_pdev->mhi_cntrl;
>
> +       /* balancing probe put_noidle */
> +       if (pci_pme_capable(pdev, PCI_D3hot))
> +               pm_runtime_get_sync(&pdev->dev);
> +
>         pci_disable_sriov(pdev);
>
>         if (pdev->is_physfn)
> @@ -1451,10 +1455,6 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>                 mhi_unprepare_after_power_down(mhi_cntrl);
>         }
>
> -       /* balancing probe put_noidle */
> -       if (pci_pme_capable(pdev, PCI_D3hot))
> -               pm_runtime_get_noresume(&pdev->dev);
> -
>         if (mhi_pdev->reset_on_remove)
>                 mhi_soc_reset(mhi_cntrl);
>
> --
> 2.51.0
>

