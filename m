Return-Path: <linux-arm-msm+bounces-108306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K5EJKfTC2qaOgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:06:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCCA576B21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B2BB301545B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 02:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E515A33263E;
	Tue, 19 May 2026 02:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkFVTV1a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4OsQdlq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F10331A77
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 02:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159531; cv=pass; b=QP6n21RNsW6PUXDEsZjUG5znFZDEdXUiI1QudAqZoMSXIvY3C7bZHfSdYqR7+qVQioI4kMAGH0G7PwqO5HMgbrPH+vAb7YUltjIgWAZvJDImGe/fkWhTeRpNU/W8ug+m6szox23RHz8K5E9WhqwTcKAnbBavACtRUVDb1f+5E7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159531; c=relaxed/simple;
	bh=tDJJIZdHHeYBMT8QHjP9BeHDpFpK/+ux/cgHMkuzpRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHPdh6yv5agnxJNPzbkNOa2LthBaeq+3Vcg+Oz96qeMU2bcfIFgLmi5IdlDPCXhrEgKYfssKayBUm9h/KHmMOeofOgNFT6U7qxaXPBuXwt2g9ME6gzAWWhHwImth+1I3fgu5Z8HfSfIwhkYI7aRq/JWLjv37l8Dq5/4dY6aNunw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkFVTV1a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4OsQdlq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGKIQ82090992
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 02:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7T6HxxfYbMXy8mZgRtMzDKdv8XFY+6b8//+YsG7AGNI=; b=MkFVTV1aG/qrMgwL
	Wpc+MWIQZOnTDk0Gkz5QvPr4OKJ6KGixXTZa6b03iQCpc6nyaC28hcYJnO3+CwVN
	gnMmuvdP+VvJJhqzbt2efdDIg5ct1FmARF3m9agxL4vJLblzOiknrL+NlBC0uAZe
	7hpugVcAneHxjCBhV1xlDy4FXOKYDGA2PF+R2yBvxDrW3Ol/rP5kvEDpppT4VFiT
	lwZNtm7GDmFqH+uewvaYGuZBm9O8HfmzxbogtheMgUtPYe1zYWCcYZfHRWV7R2+E
	2Z4+yHaPQSV0fbQEOT7BrWoUXyqNIFqwYyg9yca5hduCbyYP0upFyP2rVIpWtENp
	HazNoA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpkcm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 02:58:49 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7c24193e2b8so49155737b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779159529; cv=none;
        d=google.com; s=arc-20240605;
        b=YgXyD/9iUgSvfm4Y6+KsmLEYeRW83Sx1xaXpdgJOUSQvjtGgYExpDC4pdUhbbpwqfX
         gzi0DYiQJ1SrCyX4Qsq/Ca+UF3ojhea4BFUCxr+BetVKvxMVoGrL79U58dX9SID0IwLO
         0qoNfzhzdQmSYTpyVTnUos/hCoDyEc6KSGDIs5b808tQPz5PVfxlgGftxWyVnU5q8krA
         X4z2PTGn/AhBjTdjguRISCd1Oxif8BCi/nQN8TDZyvjF5icWL2EcDuxwFuc+qDTqiFJP
         CkVeV4eF6weqVPUnd16KDPSd4BOePIIm52D5Hwpfu4dJT8Q+kCDb0ynypuXm5vrqezSe
         4Mlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7T6HxxfYbMXy8mZgRtMzDKdv8XFY+6b8//+YsG7AGNI=;
        fh=HmY9glmOzu17L/v9YUzSASVr3kuwiV0tX+KhO8eXCuM=;
        b=CTwFq1grUz9Ax3HIxD4mZsYN6RKAzGV8eREwU+/3TkczyQu4dfcl1aFjRIqUBecFGJ
         9F/UULZY5Q2pHo0JFObMgxzK7x3d2UaAfQK7Y8faCeJe6ae5w7xAj3bt3VZVvAnNEN9/
         H+Loh+UwqUSQruTVo85cEm3RI6muw3bIwSjf7BMRLCoFnqE4Z8vB6TU0topSP4p9HdwK
         5J5wueXNTaS1ZQVi/TmirJiLKBSo7d8tx/jZxgup5Q54SP6dN6SAqkvWLFGcT+IVe8Gv
         GC6VFUZ6TMjQBCQ9wmG0wPJ+MWECP6UITQtRSB8TtfrKTbluAmpFNNfFNQf9YYnq3qhD
         5JHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779159529; x=1779764329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7T6HxxfYbMXy8mZgRtMzDKdv8XFY+6b8//+YsG7AGNI=;
        b=G4OsQdlqtcinmF12SZqgKMdcbwCRQA8bAH2QfPIUMOw/tKIzG0i6MsohPyHTdt3HyM
         812Tme4tYjg99pM8YoZk2VBeqm5F3UakiuyqrPm7UcdGFuel05TLA/miiP2qPsDms76E
         yPbd/T5sHwWZOpobxvmy8qzzYTxuQ6Og25VgBwipmChu19EooRV+OTqAoMLamKdRhmCE
         CMh5YpIctMRmF5j2L2Jrsw7KCOWwo9nxGx9apClyufTOhChz7POvjfzqlJQfw+BSCzac
         2kcP5qdRkhCT/WnHp4pSOYDRGpT9d52jK+ZcEzTQJrN5YI7AsXukweiLV7kLfEkXQrJd
         u8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779159529; x=1779764329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7T6HxxfYbMXy8mZgRtMzDKdv8XFY+6b8//+YsG7AGNI=;
        b=pJgSr+Q0IP+2ckDHgZ7PD4nqBpM/SphV+lXW+uToCeHQc2NeOaLwRKoHD2III6AcN8
         J7Autk0hv3J/GzNmbSKGmfwIvYi7PU5YLFUMfI0XF5LKdapDvt7mRLmq/Xe7TvAhR6bt
         vD3pa1uaeIAsl3tksw0uBvtY2mA82XSAMaWafBYpoBc7Y9NakUaLFPUrUJEf926oS5hO
         el61DhD5hqLa5V2GQBF1SBj3lPFhk1+UYTUGv65X3H9ZNajE2eTAen4N/uwYH3323dop
         CI/hKlYXTn6pqG4IssNVlW+g5GASnonD7gRnAj3XhrrAUC+nYyXRfglz8HgNCr0Dhwyq
         bU8Q==
X-Forwarded-Encrypted: i=1; AFNElJ81TtyJjTGYqMMeG3S7zBfyvWBsZFAJ/CoyQytL96OX8TfHYEHicw9N2VFCxeqZVSpdy0Z7m7v+cVVW4wLa@vger.kernel.org
X-Gm-Message-State: AOJu0YxLoKFWZ0DEr/CQ9vlcpFk86LHSA3EeaynCGbw3BpFYyP6awy9f
	SJ+PIzdiGpSo/CJUwkXcEsP3BbEmHpljC8j/0W94f8inwLAa6yKUizAh7fCicwL/Qp5rkIvtvx1
	pivQi0Nllpww4HWTEWD8UaWfqk+KDGJ26d4L4GoLYMd7HsSqYTZmaBaU/eVaDrGiNAmvKZnjJEx
	s01x/Ao7XW7BgBITUm3oW5R+SfINwIAN2wI6lspHfkjQk=
X-Gm-Gg: Acq92OGY5Hk8UW2Jm5WzFOnEyGST2GTSts0MNQOxmdyQHCh9+Zw08aO2bS5sionNE5w
	i7Us6m7eybssufdSVmwvPdCQRvmEBjkFKKN0e1w/pNdyW+lG55InicZJLSfiFkOc2S0LwJhmzhA
	KTxDx3goNK3GrMIBaA7LXymS1v7zP7dMLaxqEznDYVbXDRshF7A5x330nhtAdDBsr4SAd+lXWqa
	znzTg4=
X-Received: by 2002:a05:690c:86:b0:7c9:30f5:203e with SMTP id 00721157ae682-7c95d9a0e49mr185757767b3.45.1779159528556;
        Mon, 18 May 2026 19:58:48 -0700 (PDT)
X-Received: by 2002:a05:690c:86:b0:7c9:30f5:203e with SMTP id
 00721157ae682-7c95d9a0e49mr185757637b3.45.1779159528162; Mon, 18 May 2026
 19:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com> <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
 <b71f7653-78bb-49eb-b4c4-3fa8bca3e705@oss.qualcomm.com>
In-Reply-To: <b71f7653-78bb-49eb-b4c4-3fa8bca3e705@oss.qualcomm.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Tue, 19 May 2026 10:58:12 +0800
X-Gm-Features: AVHnY4KBa8D76YJCnG0Vw9p4xe2pQaka3Hy8P5fFd-k18lgxW6Ot2JsNRSos1dY
Message-ID: <CALC2J1PqdKGozWX-WapCZSkjGZcM_JjOX29HQ8r7ghKyaBXj_A@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 8niPzGfJEBllIJkIbMt3exoWQvmsD7gj
X-Proofpoint-ORIG-GUID: 8niPzGfJEBllIJkIbMt3exoWQvmsD7gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAyNSBTYWx0ZWRfXyCXANMMJHmfY
 U0dfKY6xGHjdVXCwz9/5FyLfPfki99YZ8SPcfIj1ltS7le32ZkaCwieYl7mWxdUz2vs13KmVH2n
 qmOq0JpFujcD8Ato8FLEiGyjJ0325CV4Z+tTGt+CmS0uBHLwr/v+kk8J6QgtJQfiRp31gQ7b6Iw
 5IiXLH68QOixzrFlotRhf+1trwJp9AS6dET51llYWAHBUuBameNT4ruvB0FP8fowGdioJGEB+8e
 m8Ns/6Hh1/RxxdfUFpsl17wt9wl4jNNluPdPa6pxG9gWboo2INnKaXgF6schQ+KwHZBb2FN4B6L
 itPZBYKkGNM/iNrzxCHOrIlFw1clYvLHh5Tv6W5rHIk78M3Id433r/6KRa77Ndd+MZIM0kyrIog
 CL5kXzjVlBz+W8gbfGah30zUi6A6EGx8hgQ32cwRuviL41dJMv7Y86cjbdSoLDW9r1+JbL5iYMk
 RDuxZ6CwoZENgPKNVsg==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0bd1e9 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=PzQuETEFkMCL5wnd60kA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190025
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108306-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: DFCCA576B21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

You're right that GPIO 56 (wlan_en) is consumed by pwrseq-qcom-wcn
through the wcn6855-pmu node =E2=80=94 apologies for the confusion in my
earlier reply.
Let me explain the hardware on this board, because it
differs slightly from the typical WCN6855 reference design and is the
source of a problem we're now stuck on.

Hardware

The WLAN module fitted on Monaco-Monza is not a bare WCN6855 =E2=80=94 it
contains an additional, module-internal PMU (PMCA6850) that gates
power to the WCN6855 die. So the signal chain is:

SoC TLMM gpio56 (wlan_en) =E2=94=80=E2=94=80=E2=96=BA PMCA6850 EN =E2=94=80=
=E2=94=80=E2=96=BA WCN6855 rails =E2=94=80=E2=94=80=E2=96=BA PCIe link up

wlan_en is therefore the enable pin of PMCA6850, not of the
WCN6855 itself. From the host's point of view, asserting wlan_en
brings the module out of reset; the WCN6855 only becomes visible on
PCIe after PMCA6850 has finished its own ramp-up.

Initially we reused the qcom,wcn6855-pmu compatible so that
pwrseq-qcom-wcn would drive wlan_en for us. But we hit a
resource-allocation issue this hardware behavior creates.

The problem

Because PMCA6850's enable is driven by pwrseq (which runs after the
PCI host bridge has scanned the bus), WCN6855 only appears on the bus
 ~10 s after PCIe enumeration has already finished, with no resources
reserved for it.

Topology =E2=80=94 WCN6855 sits behind a Pericom PI7C9X2G304 switch alongsi=
de
  a TI USB controller:

pcie0 RC =E2=94=80=E2=94=80 00:00.0 =E2=94=80=E2=94=80 01:00.0 (switch UP)
                       =E2=94=9C=E2=94=80=E2=94=80 02:01.0 (DN) =E2=94=80=
=E2=94=80 03:00.0  WCN6855  (BAR0 =3D 2
MB, appears late)
                       =E2=94=94=E2=94=80=E2=94=80 02:02.0 (DN) =E2=94=80=
=E2=94=80 04:00.0  TUSB7340 (BAR0 =3D
64K, BAR2 =3D 8K, present at boot)

dmesg (kernel 6.8.0-1071-qcom):
[    5.545559] qcom-pcie 1c00000.pci: PCIe Gen.2 x1 link up
[    5.882178] pci 0000:00:00.0: bridge window [mem
0x40400000-0x404fffff]: assigned
[    5.912197] pci 0000:02:01.0: PCI bridge to [bus 03]
[    5.917368] pci 0000:04:00.0: BAR 0 [mem 0x40400000-0x4040ffff
64bit]: assigned
[    5.924919] pci 0000:04:00.0: BAR 2 [mem 0x40410000-0x40411fff
64bit]: assigned
[   16.476921] pci 0000:03:00.0: [17cb:1103] type 00 class 0x028000
PCIe Endpoint
[   16.477176] pci 0000:03:00.0: BAR 0 [mem 0x00000000-0x001fffff 64bit]
[   16.516689] pcieport 0000:02:01.0: bridge window [mem size
0x00200000]: can't assign; no space
[   16.516704] pcieport 0000:02:01.0: bridge window [mem size
0x00200000]: failed to assign
[   16.516713] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
can't assign; no space
[   16.516720] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
failed to assign
[   18.093137] ath11k_pci 0000:03:00.0: Adding to iommu group 24
[   18.101694] ath11k_pci 0000:03:00.0: BAR 0 [??? 0x00000000 flags
0x20000000]: can't assign; bogus alignment
[   18.101724] ath11k_pci 0000:03:00.0: failed to assign pci resource: -22
[   18.108613] ath11k_pci 0000:03:00.0: failed to claim device: -22
[   18.115481] ath11k_pci: probe of 0000:03:00.0 failed with error -22

At the initial scan the PCI core sizes the root-port window to 1 MB
based only on the TI USB endpoint that is currently visible, and
gives the 02:01.0 downstream port no MMIO window at all. When
WCN6855 appears later it requires a 2 MB BAR0 and there is nowhere
to put it.

Thanks,
Qian

On Fri, May 15, 2026 at 8:22=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/15/26 2:08 PM, Qian Zhang wrote:
> >
> >
> > On 5/15/2026 6:51 PM, Konrad Dybcio wrote:
> >> On 5/11/26 10:48 AM, Qian Zhang via B4 Relay wrote:
> >>> From: Qian Zhang <qian.zhang@oss.qualcomm.com>
> >>>
> >>> The QCNFA765 M.2 PCIe WLAN module requires GPIO56 (wlan_en) to be
> >>
> >> But isn't that just the wlan-en pin that the power sequencing driver
> >> takes?
> >>
> >> ref: drivers/power/sequencing/pwrseq-qcom-wcn.c
> >>
> >> Konrad
> > Thanks for the review.
> > It's not the same pin functionally, though they share the same name. Th=
ere are two key differences:
> >
> >
> > Different power topology: The pwrseq-qcom-wcn.c driver targets WLAN
> > hips powered by an on-board PMU via the power sequencing framework. In =
our case (VENTUNO Q), the WLAN module has its own internal PMU, and wlan_en=
 controls the power-on/off of that internal PMU =E2=80=94 it is not part of=
 the board-level power sequencing.
>
> I don't believe what you said about the pwrseq driver is true.
>
> > PCIe probe ordering: The WLAN module connects to the PCIe root complex =
through a PCIe bridge that does not currently support hotplug. If we were t=
o use a similar node configuration as in pwrseq-qcom-wcn.c, there is no gua=
rantee that the WLAN module would be powered on before the PCIe root comple=
x probes, which would cause enumeration failure.
>
> What do you mean by "*currently* does not support hotplug"? Does that
> depend on some more code changes?
>
> Konrad

