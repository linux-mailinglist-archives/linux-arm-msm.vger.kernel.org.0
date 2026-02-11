Return-Path: <linux-arm-msm+bounces-92537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHEqC9nfi2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:48:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80260120831
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6574D3056173
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC0729BDA3;
	Wed, 11 Feb 2026 01:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clF4rIun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7eSU19r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23141A0BE0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770774458; cv=pass; b=SX2YbpeqMoE7run1i3XYO8j/VO0ReUfd4wKzZeI76yQoEKPVsob+5DPYJq6e8/O0QYcbVUtNUjGDoOQ8IjrC0oRB600HDs7x/zQeQT7YBAQMswzyPvgvhxvptOMnxNcXGdr2NSi/gKJoqCwYJ1vltWOTiHudVBeCjONYtmk/osU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770774458; c=relaxed/simple;
	bh=4eG6wLmOM6flgSHRCDz4vsd/5YGlPakWzpl+iKk0s6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Utn/t7rpwLkgGReB7d5CyBTtlFQRBNQK/FTiFJ5waigK7zVmdmw4KiDToYa1SSRBAsjN6CE0vTnJkubpLN+dyJKKE4Fjd1m7b4XPL7weG3OKgY9+zb3pIEukk7q+5Flm97W7ejz2UdR7Hmsvd5yn6gCnzwdgpRi2OHi2xXjrPwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clF4rIun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7eSU19r; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AHVV1l3744788
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2DmDlrXlI7BEL++7DUl1rOw6pprf0Rvnb1aZwqREnY=; b=clF4rIunueDKO8NK
	Rz6PXVSMo+PVbJyyGIN4qCOel8daEfzn+NF4XS/El3nEt0Pi/VLqwveriS17rrrU
	yT/tS6QGXbEowHlOueLOPgFvseRityaDxrSkB3PJF7afCH/4Vsujy8wteMzdKVs0
	rESA9FEbWIPHtKHJVr5cecK9ukXU9ud5nZI20zOQU6Xni2Ij/BQ3ZQvK7cDwOxNH
	TUZaLZzxKHfw+KzR+dyUma+e5Wlf6gGbGH+n06FmN5n2Eoa6Weg+77Gv4tk0MnF6
	ffzU0wMKopt406lXzWzscn7mwlo1JJ3RKDrabRh6BCMT4g9rwzVtvt0JiSB8b0Fs
	w2wEvw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c895c1gft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:47:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3562bdba6f7so8777970a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 17:47:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770774456; cv=none;
        d=google.com; s=arc-20240605;
        b=emHmO0bKegr9gEmVO0hwFXYui5+cLYAVTWpuAfC2zXwTeC1DNiecNL4BYQeUCpf3PZ
         eGhYL06fVPYXENuJ/IB1kcOicKfheNEne8szHLS+tQnER9Xbpze8DlHHlpeqllNm3Mmn
         16qs/HKiatO2cvd0FhiFNNCP61AZULt+FLJ0pMBcTgOn3paQJ9P3dIHivfD0wHtOLe+n
         7J3LhX1y0k6qCQUr/nDiZQeMj1AcCyNvjSL8CNzzTT5RvezJ/Ub5GGl0euIJAnDLvd3c
         zycql9kwZEZZfbPBQMaoYqsT2NzFC4/8yi3K6Q4VHbXpBAjhUJ4jLkRHTAmAzJk6hKiD
         55Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r2DmDlrXlI7BEL++7DUl1rOw6pprf0Rvnb1aZwqREnY=;
        fh=fcXQFZDg32eQSQVzXp7k4QhgJiJZhZBlLDF+XsX10b4=;
        b=e6rr4thMCaPnc3l21oOXNc8ff1NA1RbwVQEvlumXCdzBFcS2/qDgdLvWkLq+9NXmDS
         TVl/l60dYBnJg61M+YpuEmD5tPoRL3kgocvFTxBk0QgyuyF+xbjNgGvASDGBOiFYMUNa
         A3J/+pCITlEUVAFEjtbsgPu1omF580RFsF+GCP2s694Od9VvbabSP7nxqTJX5oJahpRp
         VhoBB9rjm9mhF4utuoIsW5fsqosQfqH/Mk50dMw0YwQb/HnCqdR/cKcCgi1wGEWSMUHz
         gsJRsB4a+vywkJ6OsnZ+YlxkwNbP19O3yKvzoaE500uVVzMN79PNpSqrRtbQs2tzO38f
         IGzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770774456; x=1771379256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2DmDlrXlI7BEL++7DUl1rOw6pprf0Rvnb1aZwqREnY=;
        b=G7eSU19rCNOgY2VnavcSd/9kYxizXrEkMHzPhQo9mwKrR/SBysPmyI4MtsbJ6Belcw
         hsgVofVuw9OKJMb42muvgu58f1hunvTB4wPT3p6/0FVGFe/FFqg+rHG2MfHHFz+sjQUL
         8jyESB1x97pmP17pVEkbvDLSISJzdHN5cxmx5BwAh9sHbALVxCJERZjpiR68phzhcLZJ
         GiMKeNs/z+fcU+roTZZTp25i6EUzWIdwe+0fYffIYq+dKAG6m7fxe5TJp+1Mt+l4SHQF
         bsUGRUEJHcL2viWo6GOMtyk0/2st4XXthedUVUsNFa4j/hnF93zM7R6b1KGrjBbE+tmk
         kZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770774456; x=1771379256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r2DmDlrXlI7BEL++7DUl1rOw6pprf0Rvnb1aZwqREnY=;
        b=cKDtplNBUbIdzFFM680oxZUxS66iukmGyBBfldPleQMaAIVnKJhuXFehY/pWzXb5pG
         Iq+RRdpxKJWPV4wfPGgr8hoKeNfciKOxNCNta3DtwgbMVJ3qzekhXA39Ba/GA/0cVtUn
         oq77dJpkXbIsXQSYz2SMPmq6B6d970LAO015alLL3+acJdWEFq/gsSmp1YCkkYxeB8RK
         w99oDdyK42vbHdzl4StPvZTmWo59VZrnxf9mNYtvGv7hglVfvjpZ07cP2g4DVCELAmLy
         TfadZOxyt9yCyIEHg5VSfaj7SDt2t003lz7HGTR2sQq3lCVAUWVpFUNEL40BoyINihVM
         UsMg==
X-Forwarded-Encrypted: i=1; AJvYcCWMJ9vz5TBQWVF3X2IKW2QEdt25QI2A5Ukh2ouvRTw0DARI3zf7By1lHxMw4YQyt6a7StnuXxVt8IU1OJ9F@vger.kernel.org
X-Gm-Message-State: AOJu0YzUtZOaRbt1APB3zLd23beKh3pszCRhGIRi+a3WzxUEsLvKPm9W
	pXDX/fehZC1lfoP0IEwCXj65Nbaw8+p8XDpwoAWHobbn1j/cDga3vTa8/md76PoOV/R329II8Ic
	wPYFxvQU2vrIEMPIqWg2yw0sggIwy+4bdynlmh1BOCr1/rqKK9z5JpQvfSiX3gDguSsc6cZpaaY
	tFCX94JwJNUdlNjz26HxrzMDXmBMLlW7I3Nf1i4PZLcE4=
X-Gm-Gg: AZuq6aKrvwY9KeL0FGMCj/Rk+yAum6Bs4E72/tTH4gruPWaLsNhGvZU2+YgakkaXgiS
	h1pTe28LtFV8IAJCw4M3RoFAxXISOCA4kz8NzNXX3bnnN5vvi4ZN5ZDBbr4rEUYQvUc/DYBDCr0
	t9jNwhPfW8k7w6jZM9Afo48p1IWxolKQg0jbQt6wnfPJvHEFfClO1AKIcLRZWRZDz/aYmFht4CK
	ao+
X-Received: by 2002:a05:6a20:2585:b0:366:14ac:e1ef with SMTP id adf61e73a8af0-394324a82c3mr474061637.65.1770774456085;
        Tue, 10 Feb 2026 17:47:36 -0800 (PST)
X-Received: by 2002:a05:6a20:2585:b0:366:14ac:e1ef with SMTP id
 adf61e73a8af0-394324a82c3mr474040637.65.1770774455593; Tue, 10 Feb 2026
 17:47:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
 <20260206104642.1038381-3-swati.agarwal@oss.qualcomm.com> <helfsilh2qi56laxsounbxlp5zn5yq3eqkrodgsgtzxevwokqz@usepksge5gz3>
 <CAHz4bYsqkJfdeMD41gNf11suJBj+4zhoy==mWdEqtZ-B2S_6Lw@mail.gmail.com>
 <b2cbejqrxttssho6j5d62u7mhkc5mn7vybfqlhbs2oeca3oq27@w6ws3ogfuwsg> <CAEiyvpre9_C0KgJEGmmxDznxfAJLA6zkK9BU15tODX5nESc9Vg@mail.gmail.com>
In-Reply-To: <CAEiyvpre9_C0KgJEGmmxDznxfAJLA6zkK9BU15tODX5nESc9Vg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 03:47:25 +0200
X-Gm-Features: AZwV_QjFn0OdzEYmt8OePqaXaRvlXZzSUr8PRYbYeRpKM-rxcaN0O-lOFNr-Lys
Message-ID: <CAO9ioeU-8zzj0Rps-qq3s432kHOLVjZRnz_7zXgn7JR019d26w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: s9E5hmeukLmtZ664DgMciMQKqMwzU2Yw
X-Proofpoint-GUID: s9E5hmeukLmtZ664DgMciMQKqMwzU2Yw
X-Authority-Analysis: v=2.4 cv=AfG83nXG c=1 sm=1 tr=0 ts=698bdfb8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=5cnOFmeSEoT83ppDvU0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxMyBTYWx0ZWRfX5NfbrX9bBnNa
 +QoptX38BiQ3wzkRxQCgPrdckVlbyIIPhVRtsfbK9NK9Ea4mde9bmhsn4q6QZcy4M/5cTmQwjlh
 tLfzkqB9xJLqIcWszkIb5/mW/WehNQHMrrKaeYJAabnebJaG0wSONa/etWRdNsun1hehkZ4KDHc
 ReF9VEO8UTH7dRDgAPfvBMlZvXJhMI/Bwebxe/sI6Tgk7JfnQFiar17VMENBNvjgXeAMn8Z0lDm
 RC315GRpqxdiO/8b0V7NTE2+7mvRgy1Z4nHpz2QYZCNIljG2+g/Kh1FafmvkHLaPCHGvrHAPbKB
 M0dLc1uCWxXroY4/iKyRKFNkFuxUvuWj1RZtl5xzRkv6r0+2NpyhTGUIdFJmsNxoMjpcq7BR2LN
 Lc53M3f87lwWT5ldM2Sk03/dtoJmvw+hAyHYzov5V38sWNkoRONcT+/AvSWYn1XulP9D3SaoQ57
 xpfbN9EJVztiPyRL42w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110013
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,a400000:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92537-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 80260120831
X-Rspamd-Action: no action

On Wed, 11 Feb 2026 at 02:23, Krishna Kurapati PSSNV
<krishna.kurapati@oss.qualcomm.com> wrote:
>
> On Wed, Feb 11, 2026 at 2:39=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Feb 10, 2026 at 08:29:50PM +0530, Swati Agarwal wrote:
> > > On Fri, Feb 6, 2026 at 5:44=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Fri, Feb 06, 2026 at 04:16:42PM +0530, Swati Agarwal wrote:
> > > > > Enable the tertiary usb controller connected to micro usb port in=
 OTG mode
> > > > > on Lemans EVK platform.
> > > > >
> > > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 53 +++++++++++++++++++=
++++++
> > > > >  arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++++
> > > > >  2 files changed, 60 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/bo=
ot/dts/qcom/lemans.dtsi
> > > > > index 808827b83553..2710927c9172 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > > > @@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
> > > > >                       snps,dis-u1-entry-quirk;
> > > > >                       snps,dis-u2-entry-quirk;
> > > > >
> > > > > +                     usb-role-switch;
> > > > >                       status =3D "disabled";
> > > > > +
> > > > > +                     port {
> > > > > +                             usb_2_dwc3_hs: endpoint {
> > > > > +                             };
> > > >
> > > > Is it USB-2 only? If not, please define both ports.
> > > Hi Dmitry,
> > > USB-2 is micro USB having only HS-PHY so only one port is needed.
> >
> > micro USB is on the connector side. Here you are describing the USB
> > controller. Is it also HS-only? If the controller supports HS and SS,
> > you need to have two ports here.
> >
>
>
> Yes. Tertiary controller on lemans is HS only controller.

Great! Is it written in the commit message? No.

>
> Regards,
> Krishna,



--=20
With best wishes
Dmitry

