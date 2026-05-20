Return-Path: <linux-arm-msm+bounces-108776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCktNOnHDWr93AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:40:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A2658FD20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37ADA3076B8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F333ECBD5;
	Wed, 20 May 2026 14:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luJfri1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsLs4rV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D2223BD1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287396; cv=pass; b=Kt9JJsoH+o7m2j7yrso3z4X8W6D+KsMXdZyFS9GUkSsA54eOWG0zWfeOWT1rtudNYuxOn/N69uyzTgeX0hZRjU1O4mpA3AygroxIR5JM1HpNkfiig0EAt4JlTLAxdc3gjjoK/bIWQ9EE/+f/ytEhQtFe+yJjNAkhBqAaMNo3qhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287396; c=relaxed/simple;
	bh=uJ6ceiQOgOhCZfY1iBogXOpFqQfDep+SLyd7qBiSXHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RREG+ElIEy9dI6YEQJp6EoY2E0uaPcSvtV4EyHlofTNei4QCwQTMJiJB2O4Vx5fZntgbjeI5JHHQkXUdwwluM8bUZyRfSopOS5+hAd5UHUifsQeoHKzMS1htnXbWv+K718GWoF7UhrQbysoezpiRvTo0RijFacw/LwjYplwRb/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luJfri1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsLs4rV4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nmg8447958
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T6yhqpeA4WQkpL+ACLh3UlGLsTWvYvmaiBfH0Qr/04A=; b=luJfri1qCnaB0Kjj
	UWrcYoJTqlDFRc/7zTCpwCArKH9okmWvuSK2c3PJRGBpIdrHd3rUxBmvOG/DGM1N
	ZBZKzqGrmZykPnePYtJOf95m835cGrX9v3dp2ciKbJL1DYyphm/I1TcWQV1dAWKg
	SFuI9sLqPCFZpWzHKEz67xtpSqtKFXaB7KJLONUUVg6eRRxIgFO/8q5TcaGdThhN
	/BqkBeHGsbQgjjKxQ5XzXIvtn8h+OjaGx3ses14mebDDvOELLFMr1rbOi8F0UC9g
	i0E+iX+TJFBeHtkr9cSTbQCcTjHAcBuOWTeX2CE6UIyQHzsgwjSMS/3hqFD+Uclf
	F9wiNw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrh16k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:29:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca4660827so77207356d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779287393; cv=none;
        d=google.com; s=arc-20240605;
        b=VjXeKQ5EVlUTxD6KIQDpVqM/eP9sr8a0rL70GWIx8w70RHcX+vdi3cJ6iJNdi/WIQD
         Lo/m3J+PZpwFe9NCe0XMJJ7zYzkjpgPxvW1xps0RMN0ATEBfBUQ/LE0h8JGygfpU1Vsk
         RtZ3E4LzbaWyKfkiXcBKmnA/rhEIn1iOWLm8nYmNPmNgvnylPwAfwmjvxOsclM5sqZJ/
         sCk3qy2tfW5446nZ6FsMyXGYueERWnTN3ydkABASSIkmG7ZIUqQMll8UlsVMAaSvngJ7
         BGA8mITSpVICajoCr03f8CMuygVZJE99lvTZsQYjZ3iw2KBMPeGiEWkSNmgU3oFZn8lk
         MHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T6yhqpeA4WQkpL+ACLh3UlGLsTWvYvmaiBfH0Qr/04A=;
        fh=YmrbL1VbpxQN3tIG3PzVsxMfBfyrCNsGtEZkYQAggNA=;
        b=el9RnLhW8IXuyzN/OBDcBGmJ29WCn0WBCdX/qRosrN+j0ln5AnBED7cWcaBwkRCmmh
         WLf2KCKlPdP1jLa+XbGTamZ85+EaQfVLZfQS4cQMyCci8MicFCCxNlyhdxWeQfzhBYSE
         p7S7tcISnv9YR1fL3VThtyKv0lO3i9MrrBjB/snDD2ghptPEHuFXLLVdrBARBie/VPoe
         SDh+eY+z4krU4rrNu+uS/+9CwBBbXpxhbRtGdFSKYYhq0I6ReQkNNpMiV6q478oE/6vb
         JM9c/+WUd5C3vgpy8W5uLAeBQqp8ZCxTX70SWEbJ/sTVL9StZtm45wtZO48s3UHlGIUL
         8QIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779287393; x=1779892193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6yhqpeA4WQkpL+ACLh3UlGLsTWvYvmaiBfH0Qr/04A=;
        b=OsLs4rV496AdoRsCxEjSxv7ldhYiiUwF0T4Dt1BANAFnOW5C8fKTAwGoMIs2Sxre8e
         PK0MOerharEiXS+SHvQgBjlilne6DUNq2ZW2aSeAoDrTUyogHNnAKXl7WuellmtS3IDZ
         M7ObPeskTWj6FlcDI7SyfkuvVI0hHxvrA4NPKkXRoN3KY3WHpAhp3QJ/56oH7D06uGNi
         Y64nRR/cyFWu+i231++xMtVgABhpHH8cDs5hnAleGnU6GHCqvkOzVDZNZVL/17/gQ/49
         Aa/7hJ307BJstxSzIkGsgXQv3JqjWHnAbhroG7Dp6tufsOfrRLV3QdDC3R5o0OjTUV1W
         peZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287393; x=1779892193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T6yhqpeA4WQkpL+ACLh3UlGLsTWvYvmaiBfH0Qr/04A=;
        b=JSPSWVPvwTjc/bXNZk4T0gm1vVVY5I0PkMkBp9dAznJcluZgCkdJXNG+uQs6ftPgW8
         DfFRa8W+zOQox176LdXiheRlMPZTOW1x/TrMkOp0j8PF/LuxH7Gg0h2VdmNMWhNvH1Nc
         eXFUQ7lll3w4+UsW4Tz7bVVTOr9+OCCfaIiMKA/NhMX2Vrw4FDpDqE005L5bPm6cJH2P
         u2H+arQBm13ioQp4pfp74sKlFc0yJRTXonjOBwsfSKxHIPcJjoBzLnoXEBVXJJ9zLoe3
         3VOOxQUDLBnxU8lMKtFxnuR5/mshZvp47ofFQ7fUB9Uwygm8IF/GQpvcayL9YrC4OyV7
         N4vg==
X-Forwarded-Encrypted: i=1; AFNElJ/eR3tuAxA3lSggzU9oqXOg/mR+5k46mlIcU3OMX6f9WKfReJSZq5VSP6ovqkGlimH9V8M9Grr9CGknbq09@vger.kernel.org
X-Gm-Message-State: AOJu0YyM7pad0dIHdTYXlEq1Nnb2VInaZVeJzSRY2acMj8TxdELDS3Dr
	CvCCvxRf9gyF5n5HCx7IPx9hR5/8x8I6Z2oHi+yzekvUczVZ8UJydrW3NVWMjBP6h50kWtAEYRZ
	DLXGz6uFqnzMjFCvC9jpMmn0lsOFomWld4mawSIMP5/y2cJK6M2BjWTYFJuxrW33WPp9M6A5NbR
	6WWKLDWTWmavMy58WrigX0Shrp6DWzdlgouzzypS4DnD8=
X-Gm-Gg: Acq92OHliBsL1K29UTzY60IQhRu3SCXvBySqlgUR4wPmg9Lf4SsRn0IJnKoBFG9Kd0A
	FfrE0CceSKP1RTJ2PaiaA4yJHHDeGKIajNOQrAd9bygqxiN6DUP3SLjZusHFb52hfEBFC9t/PiZ
	Ctq4/z3kaYimZCfYyHET3e1bbBONCXNbYWnNZinvO28sydsQi/+Qd7bL3xHXzquEzR0hWXbFbIe
	lgEteEDLOiHHYmJM+2yss48S3nPIZjQuK8BuJg=
X-Received: by 2002:a05:620a:2890:b0:910:c78d:12ef with SMTP id af79cd13be357-911cf3f7626mr3622213285a.38.1779287392528;
        Wed, 20 May 2026 07:29:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2890:b0:910:c78d:12ef with SMTP id
 af79cd13be357-911cf3f7626mr3622205485a.38.1779287391929; Wed, 20 May 2026
 07:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-3-9f6942310653@oss.qualcomm.com> <jetl37zsfcs5kl4b7iarbngrdu4ebp7ag2cvpqvkku6tbl6r5n@qozh6n5fq7f3>
In-Reply-To: <jetl37zsfcs5kl4b7iarbngrdu4ebp7ag2cvpqvkku6tbl6r5n@qozh6n5fq7f3>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 20 May 2026 16:29:40 +0200
X-Gm-Features: AVHnY4L4rWNphXQmeHCOQKyuxZcVbSpk2c2jukIzCXfC1OBduPiOmLNzgTemvps
Message-ID: <CAFEp6-0A=LrU44pu2rfUqXW9k9peSu=b2qq_FVs4WZUj-g4pDA@mail.gmail.com>
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
X-Proofpoint-GUID: SObFPBK26lghZBGoq364_S8y_AaSBhNS
X-Proofpoint-ORIG-GUID: SObFPBK26lghZBGoq364_S8y_AaSBhNS
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0dc561 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=ncdiEfFe64kH1Y8Ome4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0MSBTYWx0ZWRfX/EXs/vXkprwL
 nt5mZDCkvnqh96B4dx65G09MI56qVDF0A2/x7oChjxu6QU34qAfQSNMmNXVf1Ku29GrSHS+8Rp3
 XgL6Bl2RkHUI+wkBo4K781f6XGZpzqc5EES43a1ERDFSSRNJ1rEpxImCeKcDoed4iWHV6b4d6qh
 tLxp9PfenamTfxraW5E13C8ijnVC3MgfYa+QEN+CQnvaiLzfaGqAHwb1jN8V8wwlWe4c7jrp3O5
 42Yiy9xpRm0eXzqAZ6yc/zVrMZUPK3TK2Hgl0uCBVjOc1O3Sn4PYLeGxcuKx+vFGdNP+BsecYHX
 XwHxc3zUXwNglN6E/Ro1qdm/UVsQXJTfQ6NjK3ZmxO/OsWitK/wX0D3vv66K/7bmuMnPdAPvdyJ
 QmEHZi4/zXU1cTcBVazEMkYq7pbNJGRyPgovgKBIhkGuKzJzStulzoAxUyWSRCVZIbuSbLW+3nK
 4ItfaysedTHQG1iPBLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108776-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: 02A2658FD20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 2:34=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, May 20, 2026 at 01:01:44PM +0200, Loic Poulain wrote:
> > Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
> > Arduino VENTUNO Q board. The module is interfaced via LGA and is
> > compatible with the M.2 Key E.
> >
> > Add wireless-lga-connector node using pcie-m2-e-connector binding,
> > connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
> > the Bluetooth interface.
> >
> > Add pcie@1,0 downstream port node with pciclass,0604 compatible so
> > the pci-pwrctrl driver can acquire the power sequencer and enable
> > the M.2 slot before PCIe enumeration.
> >
> > Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
> > (gpio56/gpio55) used by the power sequencer.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 65 +++++++++++++++=
++++++++
> >  1 file changed, 65 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/a=
rm64/boot/dts/qcom/monaco-arduino-monza.dts
> > index 93ed575817af1c5e903662c209ead629fe202ee2..6fcad77f320cb82eccb6f07=
244d185abfb1976d9 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> > @@ -154,6 +154,39 @@ vreg_nvme: regulator-3p3-m2 {
> >               enable-active-high;
> >               startup-delay-us =3D <20000>;
> >       };
> > +
> > +     wireless-lga-connector {
> > +             compatible =3D "pcie-m2-e-connector";
>
> I think it was discussed that LGA can't be an actual M.2 E-key
> connector.

I am not sure I followed this discussion. Do you mean that I should
introduce a dedicated LGA/vendor-compatible string in the compatible
list of the pcie-m2-e-connector binding, or that LGA-based designs
should not be described using the pcie-m2-e-connector binding (graph
representation)?


>
> > +             vpcie3v3-supply =3D <&vdc_3v3>;
> > +             vpcie1v8-supply =3D <&vdc_1v8>;
> > +             w-disable1-gpios =3D <&tlmm 56 GPIO_ACTIVE_LOW>;
> > +             w-disable2-gpios =3D <&tlmm 55 GPIO_ACTIVE_LOW>;
> > +             pinctrl-0 =3D <&nfa725b_default_state>;
> > +             pinctrl-names =3D "default";
> > +
>
> --
> With best wishes
> Dmitry

