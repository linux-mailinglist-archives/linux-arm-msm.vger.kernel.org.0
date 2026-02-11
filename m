Return-Path: <linux-arm-msm+bounces-92534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DBYFLPMi2n7bAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:26:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A3B1204CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A70F1302BA5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 00:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420C03B2AA;
	Wed, 11 Feb 2026 00:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erP+U9yR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPiXHlpG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FF155C87
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 00:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769416; cv=pass; b=eAvbj7q+1SjgZH0EO9OWI8/z0f/oVE3zm3jPqLpyrlA46TApqcNGnn/dyMHeJXzoqCl5jVNEqUVWRvfBwqj8e5LDv8X9z0YKhfElwwOSPK4UVuAXQ+lfpA3duNjWSPNnSZ4xE5cgfy7AiuzDiPjpbsALPvrMoaxjozIH3rne5WE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769416; c=relaxed/simple;
	bh=iuqhPPcP9KDK9qs3rm+nQ6Pf5SifV6xuYKVLeRs96kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZH7FeVPmoFwefLRUeM/BmhZBbR+Zp/BdSq+vCZvf8oTeNWyQ/Ncx6F5f0GFckvlPiewVeSyXj1/O1mVAe4BlGVcjvPp40E4omFSWR+bTkQV7Jpvznihs8lr76dcyT5Kftj4AIQ3SZBGOFFUOUuiV7fCADdmo61RnHagLORvfkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erP+U9yR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPiXHlpG; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AKChPP2641723
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 00:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N+EmRhlUxNtuCeVNZgxrbRyVbxQrOfRm4J06Nqx8MEs=; b=erP+U9yR8/4XBsZo
	x+RhdvVYBnyebqpzKdwX1qLygHB3P/VPiT+9uqujDcXWNuOssVkAIh7e1uTcsiy8
	HrQ2Oyd5Bavt4eUFgaSjcE4gE3PaDh87LF2UqpcrEq5M0cdzO7ZYSonUyhcgow0N
	QGEobeRU2fXFG8PdmwSM7qdD8n0xk697ZO9QHMmMg9boc/5MEacrxXZZjJ99Wi9Q
	IgaTCMxOlWA8dz/ZzFm15daR2fp0CWe2dmmY/WTpaB0sOiP6DCKPvPpFbMbzbaKo
	wxN+7VWB3ti3zZBti3sNqFpXO7Y8jB1m+agb6KoswjcC/pQzZSBQPzDpRSQ2fj/H
	nqOMZw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8bgngr7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 00:23:34 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-64956932a51so1566817d50.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 16:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770769413; cv=none;
        d=google.com; s=arc-20240605;
        b=EGoki2pljZK8D6RS2XLgZfntHQD2zjGCihGICVwSRYORkDadQo8EnPAJKdQAWHoJ3v
         HqxfBw72Iydjx3Rf8xdsXnzYKge91LvCtnOR18ANtJPY1bo7bae57CBcIXXphSpDPjX+
         a9KzgoQ58lC1vo11S1D9lexwtEv9OCmfwMZoe1qkirespFgVjlanSNq+90CSIYZjO5lX
         hUXA3dPAGJRspZIhKO/aWrH5UMW9INrxigVxwoBDXFzCCyvC/5TxRGmtiXkpPy7emYmo
         /waqelTQMu/2AsLb8ws3oAtRB1T8eGVCb3XjhdRLmmjPI4cOaBmZaYqXKhqZnIyYtOeu
         HS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N+EmRhlUxNtuCeVNZgxrbRyVbxQrOfRm4J06Nqx8MEs=;
        fh=NmQIU/vFc537i+liAiHXLq5CdoyswjK/QgkAKUTkr3M=;
        b=MmcbCY2LzlT+idCZwbWSfFBqLPC4Fm8KenM3XP+uYXjMxW3kUwfiOJ2Yv/KrhVkZba
         XxnNjjigQ1/Q1KcbnyVb6WnK+PQvh5GKb6SDsvSvMILO4zKq3FIpuPpaVQoZlAnJVhTU
         OVVAmjX8TXUzZa4cw8zsZ9EM7s0cNoPiCmFeKpuhUA4cNVUftsPIqxNrMSPiRdXL5Blf
         204UDcCdezT2lNnGZeFnPHw8hDj7wZOvdFkaV99pMXzaQu5SpdsBk4rNfDAYQEOUVjj5
         tMHBP3+X4jC1Bl26Fkd1fn8W4tBQ1sGUtVNMS2iuxc1bzQ7ypBxgwEg4dp0PSsXnDK9J
         a4kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770769413; x=1771374213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+EmRhlUxNtuCeVNZgxrbRyVbxQrOfRm4J06Nqx8MEs=;
        b=SPiXHlpGe1mfVckBVvxviC18SNmqeq3MIkWATQ7lbCPhLzcASu6tr4O44VP+IFS202
         mG6JD8OMH1LFk3pB23+b8hiYDzc8O57nPU2MmPJMKu25UKCpgBX+mTUPt24LshWwpmYS
         XyT3C04RathybdH2IqSZgQT5OC/ioybMB0yAuWQzTHgNyw/PCaxLLIgwT0m9EOquqKu8
         CYUgWNIJkMDN3DepaFk9ofIz46uHbT5o7FrfZ7ZpuohR8jHiA3VKPXDeT7AGmShBPK3J
         CjoFkIuDaJM3mN1FCtfG9EsDWH/6eNcmZdSSV0d50wU99jOXHY22bSblj15XYYwwM/Ku
         Pevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769413; x=1771374213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+EmRhlUxNtuCeVNZgxrbRyVbxQrOfRm4J06Nqx8MEs=;
        b=tSnQp4meM82cPOg62Td2moO+PWLDM4mqM30BAJawKA4Nn3nK4pM4na/d9uqa5g4eIw
         qRwd/7MfJQ1PWiFQP/6QghXLPU76dUXs2SkTgz5g0b6knlwKWuI30H5TgmvdRNkoQmdO
         9634GsHFkV5F3CG/oIycoBVbzBERtpEj1EeJop7dp7ighe465kbx4yWa/6naGLnwqTt9
         w0+VynFTfFUa0d5tsUHdz6BrDVEU8m0zbIag45CWGHXcvhhI3urXEv/tybELvpNE7sUr
         5cadS1JskkgIiUyrvpGfOWI4+VoP1Dg81nLFa0ffiumpwaQSZJEqL4I40Od/7n+x0QpI
         Cu+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVusHtcSODCvaHO6/aAJOoMUIZ2K9fnZPfjza+AiN0K3bLi7IyJEu31k+yIiAiv67ZveGo9Fg2mSJU8QDPg@vger.kernel.org
X-Gm-Message-State: AOJu0YxTzROekTIlV3cAfHnYHZBINY5d5CWb0Lz1rilwlB2gmwpzzszt
	gDK7dAVTXGsI68IRG+C10+mG5qI7oOFfQwrb20eCf+ZdZW7cHSipvzx7eEO4ABX3Gdhou57aKHE
	1xrdJedrt9BlY2jkHl5VTh0slRt93dYH+fygvSEmZNdxDiMLgBfHB7ZXGQVaicrDbnhe3XxMvW3
	vklAhirw9W2bWfTAamFo/fMf17axMWkZImkLg2QoiEuI4=
X-Gm-Gg: AZuq6aKuQ+dFexl7Bw5aaFj5SYzwk9zTcWHnJS+Lk9NUSF/afyVNsZZomI8W240tylV
	+NF3UedO9WZPxik0XJO84ksBsVGF77tpNR1OovEfE4b53Eaa9nJpredoEas7RQAQJZrClxS7R90
	rUMrVF0E4iS3YOrbJ8EDPNDHYfYbTFeP5uoyADhuS5/01NDshLzS0wvrlySLlnRw+tQpYi3gdp1
	6G4dzo=
X-Received: by 2002:a05:690c:85:b0:794:cffd:39db with SMTP id 00721157ae682-7952ab57ba7mr336166827b3.51.1770769413440;
        Tue, 10 Feb 2026 16:23:33 -0800 (PST)
X-Received: by 2002:a05:690c:85:b0:794:cffd:39db with SMTP id
 00721157ae682-7952ab57ba7mr336166457b3.51.1770769413009; Tue, 10 Feb 2026
 16:23:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
 <20260206104642.1038381-3-swati.agarwal@oss.qualcomm.com> <helfsilh2qi56laxsounbxlp5zn5yq3eqkrodgsgtzxevwokqz@usepksge5gz3>
 <CAHz4bYsqkJfdeMD41gNf11suJBj+4zhoy==mWdEqtZ-B2S_6Lw@mail.gmail.com> <b2cbejqrxttssho6j5d62u7mhkc5mn7vybfqlhbs2oeca3oq27@w6ws3ogfuwsg>
In-Reply-To: <b2cbejqrxttssho6j5d62u7mhkc5mn7vybfqlhbs2oeca3oq27@w6ws3ogfuwsg>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 05:53:19 +0530
X-Gm-Features: AZwV_QglGqm4VOnEgAfQuF97JFwsqkdfPElu26jhMljBA4iUk5JvVdjvmovZJCw
Message-ID: <CAEiyvpre9_C0KgJEGmmxDznxfAJLA6zkK9BU15tODX5nESc9Vg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAwMSBTYWx0ZWRfX3ixRUeMX5hAX
 EQxldZWERCGcSJoCHoYan9wCZ9w5o7mNGRhK3aSyiNY34E8uLF8lcEomL2XhmdFei6vLt5nyV0i
 mymfwU6s/TNcm6uqc3uD0XVWH1tR4IqwKIQb/JYGwyjMOJogaxXCjF3TsQa6kBd0tjwUUmua2Vl
 YoXB+/lDuvlJ+pkUfFFzqHki8ojD9GAd2PZbny+Rve9gnAmKzaHnjy11G/VgN2EhmO+YavJWHRg
 JxFG/rNUFFTAL02ZDsUtIVZfyb0chIwupHunXSsErwO3xBW0UoWyLwycOdCzzOdvax5+Wngmt41
 tgUMGRVNqJWovu0Jn5qcnpqmUJq240Ciit+WHtY1mjP+E1isL9/d+tKSblflwepBx9A7dXpgls+
 gLA+E9RUBO1OX7z2+gk1m3xifxQmYRJU7Tl7BLUuEX7wgIQn74xf8NIWfgou8dNbtIT1E6hiXuI
 HYnyxYxaplhWyd1yezg==
X-Authority-Analysis: v=2.4 cv=TKVIilla c=1 sm=1 tr=0 ts=698bcc06 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=CC4Ma_bIzGP2HRW-blcA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: yjKJxXObG_qd2Y_ybTNz7lCmXdnId7K5
X-Proofpoint-GUID: yjKJxXObG_qd2Y_ybTNz7lCmXdnId7K5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110001
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92534-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: A7A3B1204CA
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 2:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Feb 10, 2026 at 08:29:50PM +0530, Swati Agarwal wrote:
> > On Fri, Feb 6, 2026 at 5:44=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Fri, Feb 06, 2026 at 04:16:42PM +0530, Swati Agarwal wrote:
> > > > Enable the tertiary usb controller connected to micro usb port in O=
TG mode
> > > > on Lemans EVK platform.
> > > >
> > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 53 +++++++++++++++++++++=
++++
> > > >  arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++++
> > > >  2 files changed, 60 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot=
/dts/qcom/lemans.dtsi
> > > > index 808827b83553..2710927c9172 100644
> > > > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > > > @@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
> > > >                       snps,dis-u1-entry-quirk;
> > > >                       snps,dis-u2-entry-quirk;
> > > >
> > > > +                     usb-role-switch;
> > > >                       status =3D "disabled";
> > > > +
> > > > +                     port {
> > > > +                             usb_2_dwc3_hs: endpoint {
> > > > +                             };
> > >
> > > Is it USB-2 only? If not, please define both ports.
> > Hi Dmitry,
> > USB-2 is micro USB having only HS-PHY so only one port is needed.
>
> micro USB is on the connector side. Here you are describing the USB
> controller. Is it also HS-only? If the controller supports HS and SS,
> you need to have two ports here.
>


Yes. Tertiary controller on lemans is HS only controller.

Regards,
Krishna,

