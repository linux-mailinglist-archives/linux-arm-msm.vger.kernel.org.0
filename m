Return-Path: <linux-arm-msm+bounces-108782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNw4FYzNDWrh3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D2590740
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE8930E9ED3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA67F3ECBFB;
	Wed, 20 May 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gx9EpT+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+upmF5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8C33D9DA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288093; cv=pass; b=i3Gvp3t7hL14XetfAM93qdBIPQrb5BPMr+Kd2Hh53K5/a+JA/09cAcjMBRdz9KJxvWQgTTL6AyCT8HD5DBuyIgoRc7Icmd4e5b5ZcRKDh7Eb10OSDtkvA+jbO4v6ZRkMsyP2SBKuGSe/p/DkF7921rG8KFyKIrrvfg/5JF/CDAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288093; c=relaxed/simple;
	bh=xbUg8Tez49Qym/fFbF+EEOQeWpWM0YvZSTU0Ng9IgYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuB0x4R90933Hr0atm27YwQckYd+9HXwaJMW45b3Syv67+idJLB5ObQmJ8Q/0XisbMhNheJkAGNedfzfA1VMM9FDgTtXEiH/7y6YkIwl/XI8buOFgSngHhKTNkJzj86rmB4BboZZoF0GsldH/QH6Qo0a/HH4juTxbyyqE+SAS+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gx9EpT+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+upmF5H; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuSRR3680282
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhdQb21ISCuiB6+7XVLpKLvr32coGHzkT1dS3Rn5t40=; b=Gx9EpT+xa8pxdOq0
	XNYzY8kOQM/Hr7PLVClI3TM+OYCo0nTMERSQDLo1l0XIQ5UtfJCa9gm5SY8Y/toD
	GJf01zTFg7pUDWODu/rb3SNSx94qWl4lvo6jSUNerqpbaunNf/SZaPd+nDYOcS1X
	GEXzuRAith+p5H1MSibwmmth5SpzYTLEEjrlfrEU7DdncBJ7wyM8L2Lic0+MZq6E
	CLMVnqOsRNHgkveL8IzMTePUzoFN5jt+izlZdzmb3RNJV1+swrowgRodrpcq1Vmu
	nMyAxF2xMLnQCG5Du+CNzVR90Xcc3Is3KADZK1SOH2BznSu2S6oOHJVvboRkd+is
	XoPjZQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j062d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:41:31 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69644bda339so8656435eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779288091; cv=none;
        d=google.com; s=arc-20240605;
        b=EJZyddMPBIVB6QNJa9xYjWqxVvVP8XbRLCVnaW9EdHmMLtfLXKnthRmnsmwNsXRc2p
         QxNH1ndNfXmy904xZZiHLzG/WGOfw4Zvw9AmE5Z3WxmM+xWAjq18WZyuldHRbxUcLt7X
         5CMpMb4xnFdov4brwkjAw7JODesOjXEdM//JuggO+3th5UU94Cu6JKi9b0kzEcEGOFLW
         w00T8daRdH+SlNg7osudzc4XdU/VfTxUdG9/+9mS4+K+/umkkz27NQQcmvlad6G8YHro
         lhy9il1IR4Yu/psxTnvNjnseljrhecCkbmWJ2QFmceZv2eeffRIlQNZ04qC2rTzz0UX8
         OB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhdQb21ISCuiB6+7XVLpKLvr32coGHzkT1dS3Rn5t40=;
        fh=SeJNRlkn9Q1cuCDgKDc6ZkX6mZqGWTNYMuylOaq5FpY=;
        b=K3mUT3U+gBpSasqQFCTSGWDO6NccTo/RoayoBOKY83TBzkjtwJO5n7xfxU19RirX+o
         Sj7RwZIwbOs+mIgrcuH2FXeAXd+j3H68BC50Q98CQDaqacDARgMvrWHfdNmN00OJ+7Wr
         YiFKGEHmJ59G9kDMUr2qXNds0H4bbJHZ9PYWLJaPh+7mWgTSpLhi/vy6h0K7jxiqlUV0
         43lUioK34ELDqZJzfYzh9Izy8zPpOllkF1lUcDoyM4Ir7av1RqjBk9sRG9VX4JGXqdvd
         EFrinQZIQHESpXo5aVbcg+rk4EijxXz6SoqsFo9Imbe79s2s3/VFwAVeZngPUNsudDbx
         wFZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288091; x=1779892891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhdQb21ISCuiB6+7XVLpKLvr32coGHzkT1dS3Rn5t40=;
        b=C+upmF5HsRq0cE+0KO8ZioGMSW4S9IVDtTUGzIAf4rCG20ipjBP+gjvObtW5VLZ3US
         RBf4UmQ2MnFgCZDQJRJO7OP1aTaEHO8PbpOFTC6fkW2m3EgD/AYG0H+c2/J2H5MJTkOy
         uT9Mn2mao2yyae5E7e5J8O+yqumrVBpzckZ5j+vHPALrdnStgyNeeJlApKMdUmW2NqIl
         /5s49xjgaIuTaNNym0QoN9Zu7wjKiJDvpI4NLfBupSqiTAUc2U7Lqw+7fHF8OTBb9OuC
         Qw9mbGoM527Ry6lecomVoErt7LMN74vNaUdrISWXEbYYWae/TLDsTVAiBfI70mZCnYlM
         iIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288091; x=1779892891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PhdQb21ISCuiB6+7XVLpKLvr32coGHzkT1dS3Rn5t40=;
        b=aTy7RX12mCcEmhqNheQZHshfOdrxQsQ3xvYbMc2Uoq/rHr7gY3J/cB50OozqyUI72Q
         dfnTtiVs3D2o/d7A5Ufz4PaxDcMABwbzmMPMWxr+5u/Ondi1hqE1GGs0yHdXP7oAZcEw
         +YmJX0CbqzQ/Q8VFwUEuTQr2pzmL3+CuKc4gM60Jdllur9lnNA8jjq/1aTi6QriEmYyH
         FjFBfWKbozjQ3i3xXFZEuGFUIbXxtKlGDUBVZXG9oDaxIuRLHevtl/R+FHBai7Vh1omX
         h4L+/cAFu06SMzFFt0gK+VHXO94VnA+mT0+8vjLh6g+NpB0fghr4iIDsj5JMjGPKB0DE
         Qu+A==
X-Forwarded-Encrypted: i=1; AFNElJ+kdi1PfDlEQJwmFyyMjLoVpTFt6jng8kVeT3bk7ANYgoedPypB/696WxALuYnL2h82kTQGlQ5KAyct07Ie@vger.kernel.org
X-Gm-Message-State: AOJu0YwhomJe+fiuQ8JUbCEf5nDBdDH+FTpbC0r5hsGJcPDsD1e6dbEy
	pLoVWx9z+a8RNcOdpj87mVXIhn6zKCReYMuD/neYugatmoPaq/JTL1keErn+nC4ZHy3UF3ZXaFi
	mEJInZaMVLDpWyrXqsji7NUFwxYbR8s1agzo8t5/zmzM58EPAhq7bzWyAncgfTan1Z6j/R2q7ig
	R4myJTAimhVmzvJtUj1m6rnwWil1Do51jU0YArZ+gfEsQ=
X-Gm-Gg: Acq92OE1z7VEydm1ER2gukk+JRl5bPKJU5xQrKQute0pnZQi6Dv7dR7GX+xJD47zJBA
	QkGgpmXe4a4Fja+gXja14/oAogxrmCWkFaKn4lIduCdsS4AaJeX6DPSnajgGsvLOAyugrGUh7vd
	Pw+RFmviQDuu09qKZpZbCPpTpYgyV5yasVB8DVR8VCTVIxZIXmtsdASFvQRZLrLQJHLn5McHTX0
	bvM6O4Nb8zk3/9GEdXavEx4Pu1n7w73r8ILvFo=
X-Received: by 2002:a05:6820:1c02:b0:69b:85ba:bd4f with SMTP id 006d021491bc7-69b884ac83amr13326885eaf.33.1779288090722;
        Wed, 20 May 2026 07:41:30 -0700 (PDT)
X-Received: by 2002:a05:6820:1c02:b0:69b:85ba:bd4f with SMTP id
 006d021491bc7-69b884ac83amr13326862eaf.33.1779288090260; Wed, 20 May 2026
 07:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com>
 <jetl37zsfcs5kl4b7iarbngrdu4ebp7ag2cvpqvkku6tbl6r5n@qozh6n5fq7f3>
 <CAFEp6-0A=LrU44pu2rfUqXW9k9peSu=b2qq_FVs4WZUj-g4pDA@mail.gmail.com> <n6kl7y47hztf7tgtdxhakpekwkxlleggv4sbzpsd2ncpill6ii@bdk5esjubv4t>
In-Reply-To: <n6kl7y47hztf7tgtdxhakpekwkxlleggv4sbzpsd2ncpill6ii@bdk5esjubv4t>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 20 May 2026 16:41:18 +0200
X-Gm-Features: AVHnY4KjiuGhKKWHmCXQOioTVfBJ-iXDUnzJmiSH1aWxruwXcP1EGQFS7-tjBSA
Message-ID: <CAFEp6-3Gbd1gzfeu5xdfBJixL6JXaoSFkRUsBjOji0ZEOHHyvw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
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
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0dc81b cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=QwjQxBKOi-_Ocnt6GWoA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: gC5yDZNmF4bo4Jmrk3EwXnBorHGqPOqG
X-Proofpoint-ORIG-GUID: gC5yDZNmF4bo4Jmrk3EwXnBorHGqPOqG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MiBTYWx0ZWRfX/B1F0CcKloN2
 nTM42LW18iDfRDEEcU+n2UDQiXnIgx4A2VngvVX14Oj31/gZYJVOaRJ4IwBFtVuvmXx2yBY8V8j
 OVoXTfHFeQ+wXW93CVb54p/eiQml0Bhi4rx9Hxd5RldPGNFjWVTJo8AeQyFHa1YQnBkFUevoqx9
 xs2ywVpl64+fGb+9bOiVkBlnKSHJAAMBLNCjLA9T21WL4dsYRfTMDC06EeT+uqTZekvXVD9BipS
 LU/eT/WgqRNsYTcPHfBa6q4JxJxrdv3XD+9NOFjejxb4R8p3tmdRQAD+RjFGGJYlJSRp5Dk2+aP
 OlRfiICjQLOg1mS5GRAOOC5i00KYnZJmjsRkiNfttu9+OfFymSBNGAKt98pIN0H+/87o7R6D+Kr
 G3Li1kVc/WY+IE+CRDLrF/7NN8wsXms/t9t+MLgTB93JTd6NvJqwiAcVo3rjEVjl2oEgLHAfegz
 YEIwgd/UxArrhODKVIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200142
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108782-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.1:email]
X-Rspamd-Queue-Id: BD1D2590740
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 4:36=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, May 20, 2026 at 04:29:40PM +0200, Loic Poulain wrote:
> > On Wed, May 20, 2026 at 2:34=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Wed, May 20, 2026 at 01:01:44PM +0200, Loic Poulain wrote:
> > > > Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
> > > > Arduino VENTUNO Q board. The module is interfaced via LGA and is
> > > > compatible with the M.2 Key E.
> > > >
> > > > Add wireless-lga-connector node using pcie-m2-e-connector binding,
> > > > connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
> > > > the Bluetooth interface.
> > > >
> > > > Add pcie@1,0 downstream port node with pciclass,0604 compatible so
> > > > the pci-pwrctrl driver can acquire the power sequencer and enable
> > > > the M.2 slot before PCIe enumeration.
> > > >
> > > > Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
> > > > (gpio56/gpio55) used by the power sequencer.
> > > >
> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++=
++++++++++++
> > > >  1 file changed, 65 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/ar=
ch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > > > index 93ed575817af1c5e903662c209ead629fe202ee2..6fcad77f320cb82eccb=
6f07244d185abfb1976d9 100644
> > > > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > > > @@ -154,6 +154,39 @@ vreg_nvme: regulator-3p3-m2 {
> > > >               enable-active-high;
> > > >               startup-delay-us =3D <20000>;
> > > >       };
> > > > +
> > > > +     wireless-lga-connector {
> > > > +             compatible =3D "pcie-m2-e-connector";
> > >
> > > I think it was discussed that LGA can't be an actual M.2 E-key
> > > connector.
> >
> > I am not sure I followed this discussion. Do you mean that I should
> > introduce a dedicated LGA/vendor-compatible string in the compatible
> > list of the pcie-m2-e-connector binding, or that LGA-based designs
> > should not be described using the pcie-m2-e-connector binding (graph
> > representation)?
>
> I think, it should be a separate, vendor-specific compat (maybe using
> m2-e as a fallback).

ok, understood.

>
> >
> >
> > >
> > > > +             vpcie3v3-supply =3D <&vdc_3v3>;
> > > > +             vpcie1v8-supply =3D <&vdc_1v8>;
> > > > +             w-disable1-gpios =3D <&tlmm 56 GPIO_ACTIVE_LOW>;
> > > > +             w-disable2-gpios =3D <&tlmm 55 GPIO_ACTIVE_LOW>;
> > > > +             pinctrl-0 =3D <&nfa725b_default_state>;
> > > > +             pinctrl-names =3D "default";
> > > > +
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

