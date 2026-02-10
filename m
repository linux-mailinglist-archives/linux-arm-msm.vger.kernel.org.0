Return-Path: <linux-arm-msm+bounces-92517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EzrIgdIi2lSTwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:00:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC5D11C2F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED9763044BA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9754336C0C6;
	Tue, 10 Feb 2026 15:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMaf8aob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EdkGorU8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE436A038
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770735606; cv=pass; b=cwt3n72bErRjt6/nwBETIN7N/sDPLrJzB7ovmqvkUlOkMa2TBC/se2uJBRXZexqjQG/x6Gpd96Xd4wlTywHBlCfoIEmwF4TW6WKGQAhJgEJgRFI6e/c4fTKvVsuPPVdEXSzFaE7v286RXrocM/OCdytiWZy0DQsl33ZwvS3n80k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770735606; c=relaxed/simple;
	bh=D9gI3vSkKn22fgH2zlEa3oUG0lrdV82zEBEk6tAPTtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzZThHbfDe6FgTly8GVGOZuHtkvWaA7kFFarj9WfriGmHukBtg7WGrWyPLaQjt0pX2jlaNNvQxxh6Y8c2K7eUqL8gXRE+6lr86hqtAZcW/5OAUpbOYq/ULe2vE4hPxhjphPPRsGbRrkliwh5GWe7NJ6QHBr/wquDJRcConzB1e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMaf8aob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EdkGorU8; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ADUGpn857023
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KS/vnHBQuixhcFd52GZKFvwjsMD4QZiqnePysVX07pM=; b=pMaf8aobj3ISc3uW
	MqK5zYvG8gSqdJvAAQklTDmUsz+yOkfDImmeZRxGLBEzqB54erbrk1C5XEG/cf+f
	+bbbOkaPON7KP63utck4dKQrlEc4wciVJ3OzaMWLuMNQj7YXUqAlKGUsOr07L3VD
	nrGsK1Pchd6cUPS1AKubKncR787amdKTRw8amCxccvsDZ/yCqojDFcOquKMkJ/vx
	oOkAPfc5yQfZinN41DaJg449evdQVSEUje4tWT0ICJr1WxL46X3Vlb9ZgwcS5C/u
	vI7kqe0v5FT8x26Cng4rfOuai1B+KVoCrqnD29Hg4j7HpesCgbF6j3N5vCaJ+VrA
	iZ8u+Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7ga64m7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:00:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954803bd74so10486186d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 07:00:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770735602; cv=none;
        d=google.com; s=arc-20240605;
        b=DK7i/iIHDh7K0z/hx5of2Gr8a3NwpIf8lM+gdd8rA1rwrxc6IArLQH3Qr45RgbF4YU
         ViVhH93m3Ajq9nXosQHJMK7I1qRXyanvb9726aU+yPtbhmXOFnrMtwJB14Y/ZwPl6MV5
         uBPbQ+Jq6XsbeCG8t34IDC6tkFZuuC+hTzjjktaoBPx0cj+KrvOgn6U7Ns0W7C67FtdN
         4x2+mmwCb10/rQZEC7qBney++78A5Wg0G2zloWzph6vc8ATvkaS8TTuthYSiRvHZfBMI
         4BPq8uxbL/VuSeDUwxTYQsHAoFmNgjZam39sRhSvC9T9a07fG7sxivJ3u7jn2EWtIZJF
         xqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KS/vnHBQuixhcFd52GZKFvwjsMD4QZiqnePysVX07pM=;
        fh=t/bOcZvgrDWamtevSvzuv4Xx8bGIToPXwthMeho+Pa4=;
        b=iHj+qnHPLcIwwUWOPjxMRWFAbwXqwY8//3B8J4Gh03V4REeb+1JNnGB+EsZ39fY0mj
         GOGugSfPl/5I4H5B4T8KpVZgNhu2TQuw8yIe/K6AhL1SYNHcxwOmiOP/p6RulfPdbgf0
         5vUwqApTliV7/52bF7BVYierOUpYeznN3N6fQtqOFnMXsq2iUwsPiR/p+Ww2KQm5w/op
         TJMMoWmwBwRv8HTJNfGNEBo2WwsNf0MSjjI6qpis8A/IRnmq1P9ccQejS7yOIVCyjgoC
         9V8UJa0BXPrRyROYVZ5WKLZoilFRHX3WMZ4HojzrCzGbB3U+C+3DEy9KFAOOLWdMjIYu
         SENQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770735602; x=1771340402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS/vnHBQuixhcFd52GZKFvwjsMD4QZiqnePysVX07pM=;
        b=EdkGorU87+tQ8h9kQehpGJcQAfop3w3f1gUMQbcFyd9rVIhDxjyifeYrCJBSGQxJqn
         nmqEh2QpyAe6MbEPmb5wY5mXKxPoTTnlyzaUtKWDIqmNdDN1RqqFd2yFUA9VcltTxXG9
         MasG9c22ox8wSw79peWKZFgqVaN7U3NesKSs/LDa9r/lqOE++NlZGWwqmOUOzOpMQ/ut
         Q1az3KpqlQaD0/heqOI5x/Megl4G0WURVpDH2RW809zxk/5OWO8MzOhAC6uJmRE9P6Mu
         Oi64leSAytN26lJsZTHVsjyP0d5c1SbQeUNofnxPS3VQB7vd47s4qiAxonZPJLguZNNK
         U0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770735602; x=1771340402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KS/vnHBQuixhcFd52GZKFvwjsMD4QZiqnePysVX07pM=;
        b=AxEdR0dQH8UP/oHQeTXTVQspMx/CfeQmj3svZLte0g8TE7dRgx6UNt7jRH4juCbt6s
         MjcL6d0lZ7FGx463+v0TiQlPH21/M0K3tXJUPGaUvKqU05+PN2oy955vGcbLi8Iwzsoa
         Iog+PXWqTb9raAqoA0M8rN6PAmXKwqEale3O5NrTy2xePJMK6kmQyIQT7NhU4ymgqQng
         MGGH45Fjl+BBq2cTVOPi/KOw8btfV8nYBAQVQ14O2SY+4m6xAnajFrERZxkhx3wRt2gN
         RE5BTSQw066WzgnFTZ5jP/6PY4XbYdeito/LI0F5jmSq0OwbhpQVrPDM9H6e8zIPgi+B
         9uxg==
X-Forwarded-Encrypted: i=1; AJvYcCWyOSVvNPGLyCWo3dRWU5NxIui2x1t+0OQfTRMEEYorTrvpbijbHSwdULPZ4Wuqxyzy6fmJLp6vgQVSbF3K@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4YEGFA72NMpV90r/AzEtplH0FDmYhYKb8049gPnFVMHI21xP
	q9iponXvydR5lyijg78oilx0GS4t4VyHttcgfNf5cevRMrxzFxHz7wmNPouCJkHxu/C2db4n0NV
	AXn6t/ixgoSK78Q4LZ30Q/QZSFnAAAgZXYwMxPmuNhNF1bYcbp43ZSVwJoBGN8Staqb0A0mrclK
	YmeblGhyD6so/qyny1Unswwgk03/av7Suu5qo5D47Arf0=
X-Gm-Gg: AZuq6aJsuXjup2m2kYMroQ09o3SdmHb72a73poCQwEvtLCltg++AvnD6TnlK97FgfFb
	Bf7T5rra7YJoLgOmBtjD0rkijRRZcTZJ8K140c/JDaQK9dxGtbYTV5s8xhJr87dROa5QYtPB9t0
	adZG6dR+e9NJUPaV/cuZpJa9fmLfyyEpJfhwGhRRbaAdd8YcX1lrqaFfqBiuvy2fhOMEl36JVpC
	ueQ05w=
X-Received: by 2002:a05:6214:2602:b0:897:277:d04b with SMTP id 6a1803df08f44-8970277e17cmr88406246d6.57.1770735602181;
        Tue, 10 Feb 2026 07:00:02 -0800 (PST)
X-Received: by 2002:a05:6214:2602:b0:897:277:d04b with SMTP id
 6a1803df08f44-8970277e17cmr88405466d6.57.1770735601513; Tue, 10 Feb 2026
 07:00:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
 <20260206104642.1038381-3-swati.agarwal@oss.qualcomm.com> <helfsilh2qi56laxsounbxlp5zn5yq3eqkrodgsgtzxevwokqz@usepksge5gz3>
In-Reply-To: <helfsilh2qi56laxsounbxlp5zn5yq3eqkrodgsgtzxevwokqz@usepksge5gz3>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 20:29:50 +0530
X-Gm-Features: AZwV_Qhgjq0boPXu0xwU7HW2fAWTgeiH8-9zr2yGDjBZQoUDn_G_FfRF9CxJLcM
Message-ID: <CAHz4bYsqkJfdeMD41gNf11suJBj+4zhoy==mWdEqtZ-B2S_6Lw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 0Rm9TfwreJJ5IbjkETxW98I8b-GcJkKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEyNiBTYWx0ZWRfX3Nnr0b4dAD36
 krxUocqmMIlPcSj/toQOnzXX+9NIkqexP5/6WL1z/EXB3hHjDQs0mipHw3UlQsrSqgA4R8N74EC
 q/+memkLtC0UMd2f6glZcww7KfdxYvHu169xkX+z65J7nP1Uke8yakcrJQ1QmYKnU4MXILAyKPI
 UT9NLwKp3o0lpnADP8Uu7wTfTYQyGD9DCjBI6r07IkKe8Q6I1Cznq6tcfGlS1CuZYoVt3mr++un
 ThzPwx/Rg+ExnSPot7NuCdutIy9nmTO08hi0T3Ags+vHZiwoKJ7HtXHJfUZuWKw/TKQlvfOZDEG
 yzRdeksouyyNShGlYGDUxQWbSILX66MBAb19TV919t7z3OQbo8GV269rbehCOg8h1dOGm3U5Rb9
 rk7V5pb7+IWEpSpUxlQnSKJiL24eyK2rvWL/7VwoKbWTyMMBzrGVmDyKik6UpisdxYHl5Nv8BOu
 M7KU93HI+F0zZGHJP/Q==
X-Authority-Analysis: v=2.4 cv=WK1yn3sR c=1 sm=1 tr=0 ts=698b47f3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=nlazdkki0YCUCd2hNbEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 0Rm9TfwreJJ5IbjkETxW98I8b-GcJkKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,1f40000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,a400000:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92517-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: DAC5D11C2F5
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 5:44=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Feb 06, 2026 at 04:16:42PM +0530, Swati Agarwal wrote:
> > Enable the tertiary usb controller connected to micro usb port in OTG m=
ode
> > on Lemans EVK platform.
> >
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 53 +++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++++
> >  2 files changed, 60 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts=
/qcom/lemans.dtsi
> > index 808827b83553..2710927c9172 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > @@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
> >                       snps,dis-u1-entry-quirk;
> >                       snps,dis-u2-entry-quirk;
> >
> > +                     usb-role-switch;
> >                       status =3D "disabled";
> > +
> > +                     port {
> > +                             usb_2_dwc3_hs: endpoint {
> > +                             };
>
> Is it USB-2 only? If not, please define both ports.
Hi Dmitry,
USB-2 is micro USB having only HS-PHY so only one port is needed.

Regards,
Swati
>
> > +                     };
> > +
> >               };
> >
> >               tcsr_mutex: hwlock@1f40000 {
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

