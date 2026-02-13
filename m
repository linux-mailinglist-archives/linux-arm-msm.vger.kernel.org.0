Return-Path: <linux-arm-msm+bounces-92805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GECDC589j2mtNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 16:05:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B38D3137658
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 16:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A4D930074A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657B93451D5;
	Fri, 13 Feb 2026 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKEMdH8l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCWZ0kqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B33612D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770995100; cv=pass; b=VgClRufdeXDW9MG020ZoWa7f7sl3uTDe1BHL/4rWZSN74UX7TxWcsbXoZRxeraiaiIOsZPeoeFH6Bun2AThxtwtsZnk2C8oA8LdwLOFkJf7B7Q6D1Quf6oHve9+AKguiPUhKuHDTjulOsK+PNx1gyJGoVMTZKA2d8pLbccowtZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770995100; c=relaxed/simple;
	bh=CMBS5EIesxGdG3K8fsAv7vMOUnfkY9B6WEZTZuwoxCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WurgGj7RTw/4Oic78pf4ksLQtyled7XMtK5q/JVFKIfZ2EOsmaWJZ2Tu9i55PxfDJnxVYP1iJ5ZUWGG2dvStUTlEpwNpMstdGmkYlSgWkh1uqNHmrydKxCItWT/pi/NiU5IOf2LmAVTWZVwBPpUD1jGlfhEFOTNzyOj1IRgXbrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKEMdH8l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCWZ0kqa; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DEcvUu3045230
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 15:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eW2vMR1Mwf7vQ0YNRjjPpIBK9206Pf0npi9UisdFptM=; b=FKEMdH8lyudUWZ14
	IhLvOfhMG+cz3cNHiHbcM32t6HcH0tewyy2j+HjxQOWeesrfLM/aLgFzNOaJwH5k
	VxDOM4/xx2Yi9swG23pps0H6TnU/2osUCQLd+qVp847oFE8u6C7aS8/ETduKgHNs
	ePP14RE4kfM9rPywYa6i1iS2DjEPYt3ILwRoTWRBzPHDpm6KVyFC3C89/Qy6qg7D
	IspkRFZqlyTCD3pSAFw1X2UVt4diuz/7GWDPcn3qAKZFYmBocF0gyP/WR7X/bprm
	LqGaunGDEkXaNADYyf67xASWbkQ+xW3QZvkUmtML3tPGLt29F3ceMi+jGlUMR6wk
	332P5A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ps2u8g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 15:04:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5675deeda04so1273822e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 07:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770995097; cv=none;
        d=google.com; s=arc-20240605;
        b=KK8cCfUsgZDR12To3nJoWNdtj7yqRtXpvlfGBAWfo4H9hNRdA++1L06kk9RvyOQSoV
         gZKTLzVgBLXaTjdHp1mA6lPab5s8porBVnMDtO2oXBuwkEq7XWVUD+eNXLfjiTXSDe6I
         Sm6mYmIXAsfGvUkeTqkLaQJhw5Lno1KecDaApms4dlmjTEIg3RHptQ/ux56tCrQVRuw9
         KGTL5gm3bXN128/bHNsIzUwpU/YbmLGWSlemfkGCFjkdNffy7kS3Sbzw/b02pEG6BI2P
         LdITCabD0Ec3dgwtO/QAL0l9RrOvXyxm5/AtgmQ5CW/jZtCEmkRmDI9DcXAr8PbBUACj
         Porw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eW2vMR1Mwf7vQ0YNRjjPpIBK9206Pf0npi9UisdFptM=;
        fh=azI3TsCsuI+hm1stowyZOfKN3WiEWkGkD0lQpXbOjFQ=;
        b=gguKYv7RybWLB8dKcauokJvkrZygpXhYQjriEUwUnTmHjOf7OGa/uDxHhxB6CxwDd0
         UlSKAPMiNQW1vAGoiVd6JpgUN9/TVh7FC3/PXIjzzeENtW3+1+eapOTwWRpwMbFvfQ7O
         VXTVYz8HRx3Lrg+htPxVCxB5O3jSguMNGWEhfjV6ZtD4YhJG7LBHXvugluW/u/5Tnz6K
         hAvE5St6E9yhrgA+GRdBD34N/vCSB/8z4+wiZkBNHRVawxjOjZUfoplHBzluk3H/TdE/
         /ruDPcM71ayU4ePS7gIFRKyJKAvtchlJs1691hPsuv+tV5xjhdY0RAuoASeQRjZKin/l
         K7MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770995097; x=1771599897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eW2vMR1Mwf7vQ0YNRjjPpIBK9206Pf0npi9UisdFptM=;
        b=WCWZ0kqa1BoeDLUn6g9JnN5FmGAwwWjxYLPMmXSh2BbdM41s2W5E01Va46lKj64fr8
         wnAgBhNhnUqIBkPVexczi4XH7wHyTgysfExn/uD4Z/LThDpSlwG/BQyuJRX3e7MEzLoP
         sdNnfDky32WhjD8XgyAXlodjhEyV33vbd6173hjppWM77Rdx7PTvJHOhg2jFm308i1mO
         FPu+w0Ud0atYLuR+SFoede1b+Uu1+udoNh/vIKXMmqqbbnUTy35JgrUVVBMHo1OtFQzl
         10VYl3TzgqltQCch7MI1KNozIMreBqypah2vlQiQHtatZGX0S7Pj1T4gfV8EKySRAvvW
         39pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770995097; x=1771599897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eW2vMR1Mwf7vQ0YNRjjPpIBK9206Pf0npi9UisdFptM=;
        b=WTizJY2QPcYmkyYRSWE1ptRSQKu9+v5uS8SLpuGR0Eoc7JUZIUc2v/JgVL6D56BD5m
         Y2+WocKvO1mUNOExmNJDelXKG9DQOf3TinzwMLl8xHHnyuqNLHJaK3BQMZ/c+wK963a7
         nahFImfeIODLUmeW+s65HZRoi5HEYiD1wobE/IOpvlST5VS6iUy28akEyxHpga2pH2Xr
         lq005+li1/OpuF1vfeq0E5wmf1LCIen+oGJlC0zpxfdRpIki0YlhGiiQ6u5Tpg4SWuB7
         cFTQWH2hmm3/e/8DdtXka053yZ9glCHge/54DiOHRhjBzGrEiScI5YJ30UPnNB5sfOtX
         fsbA==
X-Forwarded-Encrypted: i=1; AJvYcCXlbdmKkDofwIN9JTbLVok8oxGBmjJw1VeBoNtbMen9Olrofwh4W32AbIi7Pfi5OPDLsEKEoB7eaGnJftdF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01oZ/SsuCdcq+8WIv1Z3wdBmSaerag9zb3OGbLSA02A5p8+YU
	mATfxMmZkG2zuqUYh4NJESqGWSR7rk7U0bZok3cetgQT/MyJD3FVsjztW9h/GZGQxibylOC5Ves
	dXAaKRWe2nGEIfsanXW1etOi9XcBBmac2alQzHd2FIhAzrKahQyYkTj2uJYD0fB4GME9KgzjGzk
	9V+CD69qsZIjQzGDlRoXf/2DfCDkwqcrh8qw9c2ykHm/k=
X-Gm-Gg: AZuq6aIoiHaq5fVflr8aRtnhD0yQd6hg9s+BFfsikAEop9qnswS6Ie0CA6K42d5GIV7
	VX9W41f7H1rzP7L76lDihlLmQ5nI0NYmDba1nQTt04C/HBLm+PdZL/RiBdKSguFJCUQMxpGe7pL
	8l+is9J6XM0DH5ieN1LFDli36c81BRVJXjd7uh86nKSyv3fLDU26IqSJxM/bCJvFVCZl9H3I0lj
	z2GGQ6Y0Iw/RWo3VsnoZrGxqD3ROWbgxkkRXJ+S
X-Received: by 2002:a05:6102:3ec4:b0:5f5:4eac:cd2e with SMTP id ada2fe7eead31-5fe16f31738mr892471137.32.1770995096696;
        Fri, 13 Feb 2026 07:04:56 -0800 (PST)
X-Received: by 2002:a05:6102:3ec4:b0:5f5:4eac:cd2e with SMTP id
 ada2fe7eead31-5fe16f31738mr892250137.32.1770995094738; Fri, 13 Feb 2026
 07:04:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-6-loic.poulain@oss.qualcomm.com> <aY7pvakkOnaYsd5p@hovoldconsulting.com>
 <CAFEp6-3yk3sPXj+hGuWvAFsFJAXjH4kWLV8k_5_v9Hax0XxaOg@mail.gmail.com> <aY8Asvu-1u0e02oJ@hovoldconsulting.com>
In-Reply-To: <aY8Asvu-1u0e02oJ@hovoldconsulting.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 16:04:43 +0100
X-Gm-Features: AZwV_Qi-gcKkQ_iLyM-qQ0bS7RPoFrsjQTRiFlw9B8VJFEwLZ3xDSAVLYDCdjiU
Message-ID: <CAFEp6-0rzkqc0ajN72q=mv3U-TT0JHMSPmnJD6ohKuLmbPz2-A@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
To: Johan Hovold <johan@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 1TQxN-JRci4JSmgg57lGppylUbAnKM6L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDExNiBTYWx0ZWRfX0SnnQuiYt7nP
 oAXn4BdReXOUbz9AzugHkfNJpc+nb03XGN0NVjBaQ2JwakP3BO7Wlsq+7cG/m9q7Ik9GtJbz8/O
 e0X9/CsMnD1y3PV9dbXjEhxvx+HCvMQpgJprnhfk6SbMMPKK+4wjZyGc7WhMG2OmegR72uxdyBN
 Y0NujFT6qDhEgiZdTAkwBYcZTkGtJubTFfAvOjyWFfHqxg64SkaJ5wUNLYXdf3thaT7bhyI1Tt2
 qIewlwH+TFUjTr8W9VtZoi8n86kobKLXBjjYPeYUEMbOe8RuIwGkKErm0j1rFZ/cxHDE9+Wh0z8
 oWNxsWyGjOLoI7A+HZcpC0KFTos127taji0GqWYy9u2e4amMsTnALrGVcl9GB4PamqOsIVQ9uGH
 pKx3zw9+DsdqJgiO4kAdTAAcxw5sN61vLYaC0ACUY2AbesV04Ln9wQbcOsA8XTH17LCYc08lVwf
 Y5BoiiD3HrREiUALieQ==
X-Authority-Analysis: v=2.4 cv=LoOfC3dc c=1 sm=1 tr=0 ts=698f3d9a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Q6oW8UG3RuEdIIStXg8A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 1TQxN-JRci4JSmgg57lGppylUbAnKM6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130116
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92805-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: B38D3137658
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 11:45=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Fri, Feb 13, 2026 at 10:45:32AM +0100, Loic Poulain wrote:
> > On Fri, Feb 13, 2026 at 10:07=E2=80=AFAM Johan Hovold <johan@kernel.org=
> wrote:
> > >
> > > On Thu, Feb 05, 2026 at 05:02:40PM +0100, Loic Poulain wrote:
> > > > Enabling runtime PM before attaching the hsphy instance as driver d=
ata
> > > > can lead to a NULL pointer dereference in runtime PM callbacks that
> > > > expect valid driver data. There is a small window where the suspend
> > > > callback may run after PM runtime enabling and before runtime forbi=
d.
> > >
> > > So here too, the commit should reflect that this cannot really happen=
 in
> > > practice.
> >
> > This happened  in practice in the qcom=E2=80=91qusb2 PHY driver, with t=
he same
> > code flow.
> > Bug: https://github.com/qualcomm-linux/qcom-deb-images/issues/208
> > Patch: https://lore.kernel.org/linux-arm-msm/20251219085640.114473-1-lo=
ic.poulain@oss.qualcomm.com/
>
> Thanks for the link.
>
> > I know it may sound unlikely, but this crash has been reported
> > several times during boot=E2=80=91stress testing. I haven=E2=80=99t inv=
estigated
> > deeply enough to determine whether it=E2=80=99s caused by an unfortunat=
e
> > preemption window or a racing CPU.
>
> But I'm literally asking for *what* would trigger the suspend in that
> initial window between enable() and forbid() cause I don't see it.

To be honest, I had not initially looked into the exact cause of the
suspend trigger until now, but here is what is happening.

The PHY is a supplier of the USB device. A USB device cannot be probed
until all its suppliers are ready. As long as the PHY is not ready, the
device core keeps retrying the probe, which fails with -EPROBE_DEFER.

At some point the PHY probe finally runs, but the device core may still be
attempting to probe the USB device concurrently.

Inside __driver_probe_device(), we have:

    ret =3D really_probe(dev, drv);
    pm_request_idle(dev);

    if (dev->parent)
        pm_runtime_put(dev->parent);

    pm_runtime_put_suppliers(dev);
    return ret;

This means that whenever a USB probe attempt completes, whether with an
error or not, its suppliers are released via pm_runtime_put_suppliers().
Releasing suppliers may in turn trigger a runtime suspend.

In our case, since the PHY is a supplier of the USB device, the USB core
keeps 'looping' in __driver_probe_device() returning -EPROBE_DEFER until
the PHY becomes ready. As a result, pm_runtime_put_suppliers() may run
concurrently with the PHY's probe function. If this happens after
runtime PM has been enabled for the PHY, but before the driver has
forbidden suspend or taken a PM reference, the PHY may end up being
runtime-suspended 'unexpectedly'.

Regards,
Loic

