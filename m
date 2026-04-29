Return-Path: <linux-arm-msm+bounces-105093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Fg9I6dl8WlfggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 03:57:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB348E2C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 03:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAF713032DF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 01:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1784B35C1BD;
	Wed, 29 Apr 2026 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PP8XlWyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAEEb+w8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C216D34C141
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777427867; cv=pass; b=UxPeup49Wp+E0yLYwXkB9Hxm3RzwGvZiPyGIr6J2OG/tpmbpVy2khHR5zxV60W04LcSAFNQCtw0bh3hOBPmZsIJAifCtr5N5mR4azRI+DuxpPw4pYKe6u//eRP1eTmX7icp30WnY++BF7tK0rj9sfKR/KG/L041tAdCky5GACI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777427867; c=relaxed/simple;
	bh=v0pECtDLS1/N/08xgmMrXQST0ph4UNgD2w4OD3nqRrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLRwVZl0jei5DRHiLgoy+WQRNLAOK2+Rl09D37ecTuip4ssX80L9/AuGBq5713rxWtdGw7Zh6+8bmcJxfsFzQe/iidnLuRmVntnA2LX5VZFM9WxBfixBpn0VhwGMrvR/GWtAhpfjdlb9gCenTKc/TksaKGcodEJoG79fdo4VrgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PP8XlWyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAEEb+w8; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T1cAZ43713223
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGdi/0odJyQdRd+R58nzgomfaTnHnMHFNBmgVpxzfGI=; b=PP8XlWyMxWwT4ci6
	en9xn2JHZjvetwxHwd/WuPlvYhixLk7AyHlmfqI81lcxXS8QsAx9ZlBZs/gt9GwW
	6ueQJ/Ab/Gveciw1C+1cIJn397SR1MA5k8IFqMyWmvG7EOo7BhjfL9ciSRc4iLzH
	6ukgF9Bp/2SPwHXFh6axZGrfoGkAZyWzBdJQZYgw88T3WOnnG3fuRIYcDBM4iZSx
	AtJQxISQcC6iu4uz9KMmujmGEpMcNgKXuigDCRMqncJ1c29ljyVfDCbAPMhpsi0D
	X/hGNIaX/W64h/DHC9Jeaxp4iYM2z7UrefBJOkWCa/dFJUJ4yaFmjriu7t5b/jvB
	ve79JA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtxb52bnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:57:43 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7982c466ee1so68791627b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 18:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777427863; cv=none;
        d=google.com; s=arc-20240605;
        b=O9HA0SxNeAaTvritxJTpiFOBX5FzVYT644FV/EkEwxhu9BC9H7xswKEFfpkjXAeGdb
         EJFt8G9urRuwZc8hA5+NK93o+5RT/pwPtEoYeSanTVO+l7+pOlo+BM9S6BLVBByh7ZSd
         jUeF/rKjj3BuxyxA9OyqB923e+PAeRpgUyU58hBns/EOxcSDvQCJkERGvZLMIvMLaGHY
         z4gsKt5VLaeNMTHBuElSuXs0qwXRUjiRW36tP/yAlaEC9sEOKMTwFWsztboq7Fjjyujc
         LcH4NhNNX8JQx0vjxjUPQrRf+z6GyKPsooOY+PpVQxc7TzrCuJ1SCEaOHFcUNnpSaVz2
         s7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QGdi/0odJyQdRd+R58nzgomfaTnHnMHFNBmgVpxzfGI=;
        fh=qoFm4lHL6nqDWSDXUOBO3jeVhkOmOprQPZA0+99cJ8s=;
        b=az7Q9Oy5yUWKgFgPBeLC5b8Ny09zONPmTcYFAhnR2OefDglDLf0lS6Q5lDNmNSBGV9
         Pcr2SQVnx6I2Flr39wx/Qad1PFZ29eQ0cCS97rjmQzzxRRn8LXpv9SwARCbJvGa74w3j
         YwYiVL2nvErqpHR18YBAWxi5k5NhUKvIEE+dZ+xbO2g0RoPRT//VaxO0j+xlb3z6kFTW
         3iDF44IEL/giDjsLaUsCNRG6gK7G0KKamGc9CRJ/VkbmdXE6HfIz1GkmNXKmXMl12stW
         p9by/QgpczsBN4AOKPlscq1BJ0belSxTTSFP1HtuP+TcT9SOx0c8piTVqFXj0xxjkJTQ
         N+jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777427863; x=1778032663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGdi/0odJyQdRd+R58nzgomfaTnHnMHFNBmgVpxzfGI=;
        b=TAEEb+w8ybynUlOOLnp28a5QfVBXOtbbzEJofBuGyuFF4wUqtHwtBfk+gV3C2M0Ahd
         rrIbKYzfCjMP1JtaEwK/B1PVv0pOOEiHyn+cIfTZ0k/H/iOP8J2bNGXNvLL7hScg8O5g
         hwiJY8e+jHDYQcngVq7TcFRtrWghdt+gX2miyaU3MUxy2aY7fn7tATsdZ2RtoL4nncyT
         8MEAX+zdaIH9yHELTsvCi5xtflPeXsAxNLpTOVp9sB8FFkDJSsvNLogGkM8kgwLY5r/J
         J6H7nT+Ax05+Qy9pDr5X0cCrLMLfg/7reFkxU9Rg9eHy3GtmMcg0yZkD5VTDlfH+gZ1d
         wyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777427863; x=1778032663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QGdi/0odJyQdRd+R58nzgomfaTnHnMHFNBmgVpxzfGI=;
        b=OXtcLkaG1N4saDv/+DLWy0LG+3Gi8kj/j9bCbPwFix8i3sjpN5UhmKZt8ujkKh9HuA
         toCTNzEE3AKE3cOVLH3XSPbIBvZbMaFBDVYBhdSWu6Rjwno1UKlzwZ0vIzElzp1g5On+
         40QcuV7nNQE03GNH8SF7Jlgd3LygBLxvp6Fr+BCg4i5FbwnTwE3Mdfe13fzvMIxQrv+Z
         6jdcrXEbGlbf/LOL4ag+keIlafCc3ogFsoOw8IfrMnj9u9A4PK6aStexWfR2YucFQmwF
         Kkw6olqg8B8tOLm1nv9tFboZUWj1kKQsig4mf+5drzEp7IS82h/kpxOGQyfmhhRNIMhG
         puMA==
X-Forwarded-Encrypted: i=1; AFNElJ+CF4DQGh4smj5K9I7T8plt0QA+xo28ExzFYk5yrLb9bPjPkgCPbUONGFmOmFFS5001N2Gb2maHid+DLvvp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/QpIhDzJqapI0Myd43VaB88oLhMlCTvNMQo8fCwiJexx/VXYo
	QMXCoGuKnytedvUaLCOjPMd1i17AHvTWBSTbcu+yPa1UAlfv3791a+hIYQP1z2HhMAX5zQfgt9B
	SsD109SNTUwa83fqKetXSwcqCWELtMxWVco5C8e0EXC5SRrIWt3uCCVp0UR/usrCRqFyTPRUHnW
	Y55jYusNH96pkTzkJFz9C5oq4AeIWPJqhWCkk20DSRCbU=
X-Gm-Gg: AeBDieuHIyF7zJbTdw+rgzOrJjub3fW+2PtV2OZW2QlbUdmrOm0oujs0AOj6mSXbUDB
	7kF9vIuoexDxsp9IB4UG+eROoE9sRNrg86n4nXRwtmKiL+1d2yG4P6zl1h5dewWe/ISayK1NtsY
	UZD+5PGAqw13LCSp2OYS2de5A3tgRM7bOQQitjBMP8KjUCzhC1xSj5ZGANtGCpGz4HVatv3Gf3C
	mD2F8MjzYXOV0znrk27Ia192fn8qO9fqUYMMVvDdbQ3X9mLUg==
X-Received: by 2002:a05:690c:95:b0:7b2:dad2:5e0d with SMTP id 00721157ae682-7bcf55984d8mr55188967b3.33.1777427863018;
        Tue, 28 Apr 2026 18:57:43 -0700 (PDT)
X-Received: by 2002:a05:690c:95:b0:7b2:dad2:5e0d with SMTP id
 00721157ae682-7bcf55984d8mr55188847b3.33.1777427862602; Tue, 28 Apr 2026
 18:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com> <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
 <e0dacc06-432f-4924-89e8-f5fafaee4906@oss.qualcomm.com> <jznwxsifczinkboh5kakjj7etxvfbvn5hwbxvxauy42mr3cgph@dnnqiihclguy>
 <CAEiyvpq0e_VgTq0FYOSKGxa_d88sz9uOQgMCBoZfztRk1cjD2A@mail.gmail.com> <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
In-Reply-To: <5c7d64d6-6fc8-4323-894d-56d1dffa7d09@oss.qualcomm.com>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 07:27:30 +0530
X-Gm-Features: AVHnY4LyHrK-I6nTHLOE19T1AkoB1MuHWhjX8fcK-VvNG_VhF86VFYS3RjZ7nEo
Message-ID: <CAEiyvpp42MsK_vr1kw86KZUWtP=VWCTPWzCJFdq5Qgd2k91x0A@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAxNiBTYWx0ZWRfX+Ts/FNom4u2Q
 +Pl8foEtFimpShmnMasM7RrWhlJYVFQ2T9kTvfoBG4LjqBGmI1vQRb1JjlMWpE0j9bVb0s5geSf
 aIvBPYP7U7PZ/QACfYQtizkQmz1yTmZoDVqr6V9ERdiDsNgbYQQfwqwS3QiHSPloXKuY4caR+XJ
 t9tziNUvTZxVSYD/CYC78LHFOhs2MPQ1YhT1LkyVGt7HjVzdfnFHuAY2Nth4LZ6dhW7PPZi48ba
 t9UlxWIp/eWfJui1Srk6CNTb1Xmm0J/i310cZZ5Heb5sMWdDf+ScXI3vGcnv/5pngj5mFIM8gqG
 x+Ex6K/KZTiuEvvqKk7hJhauDJR6XUUP5M9QFzYOlxYXg1qG1VWS7b+Xbqqm6F9wjy0OPBse/fK
 QYkmJIm7js+q/dSnEPzuiA0Jqwp6ukV411uxY8oWrERPv2HRf2KkABmmFo1k74AOJym5/yTpY8E
 cT8ZcmzWdhSCTqyUN0Q==
X-Proofpoint-ORIG-GUID: ReHx1_Z21J7Hr-fGLvMt3n8j8Nd6eCb5
X-Proofpoint-GUID: ReHx1_Z21J7Hr-fGLvMt3n8j8Nd6eCb5
X-Authority-Analysis: v=2.4 cv=A45c+aWG c=1 sm=1 tr=0 ts=69f16598 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Gu81GBfdrKZkZUyCsUEA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290016
X-Rspamd-Queue-Id: 2DFB348E2C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105093-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,a600000:email]

On Tue, Apr 28, 2026 at 2:54=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/28/26 7:46 AM, Krishna Kurapati PSSNV wrote:
> > On Wed, Apr 22, 2026 at 3:55=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualco=
mm.com> wrote:
> >>
> >> On 26-04-22 12:09:31, Konrad Dybcio wrote:
> >>> On 4/22/26 11:41 AM, Abel Vesa wrote:
> >>>> On 26-03-31 15:37:08, Konrad Dybcio wrote:
> >>>>> On 3/31/26 12:37 PM, Abel Vesa wrote:
> >>>>>> Describe the ADSP remoteproc node along with its dependencies, inc=
luding
> >>>>>> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> >>>>>>
> >>>>>> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a Q=
MP
> >>>>>> combo PHY and an SNPS eUSB2 PHY. Describe them.
> >>>>>>
> >>>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>>> ---
> >>>>>
> >>>>> [...]
> >>>>>
> >>>>>> +         usb_hsphy: phy@88e3000 {
> >>>>>> +                 compatible =3D "qcom,eliza-snps-eusb2-phy",
> >>>>>> +                              "qcom,sm8550-snps-eusb2-phy";
> >>>>>> +                 reg =3D <0x0 0x088e3000 0x0 0x154>;
> >>>>>> +                 #phy-cells =3D <0>;
> >>>>>> +
> >>>>>> +                 clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> >>>>>
> >>>>> This is TCSR_USB2_CLKREF_EN
> >>>>
> >>>> Good point. Will fix.
> >>>>
> >>>>>
> >>>>>
> >>>>>> +         usb: usb@a600000 {
> >>>>>> +                 compatible =3D "qcom,eliza-dwc3", "qcom,snps-dwc=
3";
> >>>>>
> >>>>> Does the device suspend and resume successfully?
> >>>>
> >>>> Well, tested with pm_test devices and it does suspend and resume
> >>>> successfully, but there is this:
> >>>>
> >>>> [   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2
> >>>>
> >>>> But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, =
on
> >>>> all platforms that have them.
> >>>
> >>> Well it's not fatal, but ideally this wouldn't be there. Maybe you're=
 missing
> >>> some DWC quirk in the list, although it seems pretty long already. Pe=
rhaps
> >>> Wesley would know more.
> >>
> >> + Wesley
> >>
> >
> > As per HPG and downstream, this is what needs to be done while entering=
 suspend:
> >
> > 1. Clear PWR_EVNT_LPM_IN_L2_MASK bit of pwr_evnt_irq_stat_reg
> > 2. Clear PWR_EVNT_LPM_OUT_L2_MASK bit of pwr_evnt_irq_stat_reg
> > 3. Set the following bits in the pwr_evnt_irq_stat_reg:
> >  a)  DWC3_GUSB2PHYCFG_ENBLSLPM  and  DWC3_GUSB2PHYCFG_SUSPHY
>
> In case that's related, most platforms (including this one), set
> snps,dis_enblslpm_quirk which prevents the first bit from being set
>
> Likewise, snps,dis_u2_susphy_quirk for the second one
>
> (although it looks like setting these bits is currently
> unconditional upon suspend in HOST mode?)
>
>
> As for the sequence you mentioned, I believe the diff below should be
> OK - although it _really_ just adds some delay vs the current state,
> since the bits are cleared in the resume call
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f43f73ac36ff..e7b1775b7207 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/interconnect.h>
> +#include <linux/iopoll.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
>  #include <linux/usb/of.h>
> @@ -344,10 +345,18 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom=
, bool wakeup)
>                 return 0;
>
>         for (i =3D 0; i < qcom->num_ports; i++) {
> -               val =3D readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg=
[i]);
> -               if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
> +               /* Wait for the PHYs to go into L2 */
> +               ret =3D readl_poll_timeout(qcom->qscratch_base + pwr_evnt=
_irq_stat_reg[i],
> +                                        val, val & PWR_EVNT_LPM_IN_L2_MA=
SK,
> +                                        10, 3 * USEC_PER_MSEC);
> +
> +               if (ret =3D=3D -ETIMEDOUT)
>                         dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", =
i + 1);
>         }
> +


I think its best to set the DWC3_GUSB2PHYCFG_ENBLSLPM and
DWC3_GUSB2PHYCFG_SUSPHY here as well based on quirks before polling
for the irq_stat register.

Regards,
Krishna,

> +       /* Clear L2 event bit */
> +       writel(PWR_EVNT_LPM_IN_L2_MASK, qcom->qscratch_base + pwr_evnt_ir=
q_stat_reg[i]);
> +
>         clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>
>         ret =3D dwc3_qcom_interconnect_disable(qcom);
> @@ -752,6 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>         bool wakeup =3D device_may_wakeup(dev);
>         int ret;
>
> +       /* Clear previous L2 events */
> +       for (int i =3D 0; i < qcom->num_ports; i++) {
> +               writel(PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK=
,
> +                      qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
> +       }
> +
>         ret =3D dwc3_pm_suspend(&qcom->dwc);
>         if (ret)
>                 return ret;
>
>

