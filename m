Return-Path: <linux-arm-msm+bounces-99358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAXLBHJ/wWl2TgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:59:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE582FABC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E1743353F73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E253B9D85;
	Mon, 23 Mar 2026 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kb5nB1aE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+qdLUcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44693AF650
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283494; cv=pass; b=bPWnmzbxmKTlBKiE4eohtVlgV+WetfYhkfVeBLTHmd31ctVwkbXVHad7+Xe7/k2tHuzsck/N4AYEcNCYpHLXeN6TVcxykY07tUZwuxWmrxalpJ/+5s07eTcIzDHE6NWOYFb/3S3ulTt3YetES9CEUNlSg55QqRpbn8VbcsAAjgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283494; c=relaxed/simple;
	bh=nnrPf4ABal+ROA9j22uCLWEuAIBJc+AQEH0rvl+UZZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eK2zSL5b/G7NUbayYHZaC4UTd90/h4hMLc5Po5dHHimvPf4dAJ9QUf2OKC502loLjoiOv9WkwV/SMN71pI6dHK9hicbBUWTzxHy86aG4jcn1VIfNNBGAo3KvvXtWD2r3YtnNn2YC0vhk1H8Y7ffyVSVHyEUldnljXjbei3IxlPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kb5nB1aE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+qdLUcE; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGRx02488643
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZ572RpNkD9NnmO9VWS6w0u0/xf9rfubmv+0bJXXOQU=; b=kb5nB1aEoK7BdaVV
	WTt054uNoy73wZjBqSM81LPUUmy9P8P7LSkYVseb8S/tEIJSMLSBQzBTe57sc67s
	/9sciPLMopCBFtobPWPFBv9YDeEr13NgXG1ch2qG5lBpTj0cJAvQg43rXO7ZqRQ/
	blT6u+lqAzwUkPiBInFoTBNe/YRWLPRRrauju9ims1c4CBFxDvHDwaYduTMGGN0x
	MheNL8xzpzHweKV3nh6JjRNqhOJhF6NrYlSrdx2iCL22sy2T1d8AcVbHgzMNvyHq
	nu+qbNf2BujvLutE+r4wUobuRuq+swPFA/dJ43S7oeXftkxctFhLSavmN2N+iACD
	3SIe9A==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jrs59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:31:32 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-67a1e063795so73055162eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774283492; cv=none;
        d=google.com; s=arc-20240605;
        b=fic/PmDlYgz5At8wCoUdhFuKzQWUDptdh+xR7m/btrHsURRERT35UWBqMsalRToXxE
         iJJ/EeltDqtHMar3vGsXyYWKb1T+Gw4Q3Y55CvKlKgNWG3J2NUnuB690pjWokxQnrXiV
         emEHDHD90GXuUeS/AEZDvt6ftyjp/fvkn3PhuyHKCTYCnYI6+96PhsTfdzkdYHTIO8XU
         ib8ctT1JjpCLTUmvCSgetpWddsLP0aIKf05KkqgsukwuBa2lwl582c8lc9tsuzqMhI4P
         QQLeGRZIi4QglPnXI5MTv+R1qFVp6eLRS9iruky3a7xR+1kqcmB3E3ZVDMRfJwT+ocER
         Ho4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JZ572RpNkD9NnmO9VWS6w0u0/xf9rfubmv+0bJXXOQU=;
        fh=6BOqdQg5ylIgSWMV/OOgDT/CFVqQT6ZyvXCicp2prrQ=;
        b=LgZr5WGMwRGuRSxYhf1wKCYkwI1XqcPUyzfiiZRQujshbUYDh/DhzMpAJPCEN0z0WS
         cyNmLkGrDNAvKU6w3GgsxKRiVNO6lrmx08U8NibRryCkdYswtQ5DcU/Om16xTK9WDPix
         L6509/yGOPlDqXM3dOruwY7tcxzeMUXJFYO/gjNePJmJ9DTUA7o+nssy7c4N+Q8hGH0s
         Y68BP8r4HepkdU2BvuNW04kOK2uO5932DgeQM93nKG9EDqlChtO2krYJB6E+B23rJYG8
         n25cDowg8+jnHu4w6pDiyWDnB5z44G3VQ8n4E8pDSJZAG5Z0DSipUl9CH9kiSXMUDxF9
         JsKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774283492; x=1774888292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ572RpNkD9NnmO9VWS6w0u0/xf9rfubmv+0bJXXOQU=;
        b=h+qdLUcE2W4EbNzQMCw6zwb3sPipLSQJ8R3HuejwbB4qLqlyVnFiMVeOfOEuZRKc2L
         yX7JdykZqLXgIo2TU7Wa73ftR3+UsgeI4QVacuFA5kdMJ3l834Jx3hSBT6vkKQnJsd/D
         szznckP5SMxvmKhp4Y9h1ZPWWK/d+oqtE9+oajM+svd8tp0PysOdY23H30Y2Xm/9bdtH
         7hM6kfrOJWoCg+wUX9UE3UHW5GWzChz8t69dgBhJncRADppK4MgktF18AWYWitay7QSz
         d64u2kibUUY0OHACAb0VLR3q+Xz3dzxtx0ZV7OeWG+Qvd7DG4Hk4XQxSMENwjXt30zkv
         xSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283492; x=1774888292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZ572RpNkD9NnmO9VWS6w0u0/xf9rfubmv+0bJXXOQU=;
        b=d3U3YCSMCvTpzhWzFJxPnBErRAHF359tZQVo/ubvOS3g76dBUioz6E7KSsUoIOD7P6
         1w8BFnPVspjj/qFlOsV3Xmp/UoTvPAkVnzM9LitHR2oaERNGLD3BEiRwVlJ6U2BQOt17
         PRMBfN3WRRT5BzO16g1rIAGQjys76TjI6v6ZuCl8thCGr6j4ZkMFS0X3d/4ORchBYTjp
         xWmI1mg34+dddOA1qQ8j63TkF8Jxi+Oz5EMi4/6DEYDEN1HCde9Eu/3XssYhrxtZe7C3
         CmQWUbSVBmDnsnSNFzyrXj3a45qPmoxPlpLNXcpSerHrEHsAj9QP5G9HuWiefoAij7sc
         Ut9w==
X-Forwarded-Encrypted: i=1; AJvYcCUdA/NR48715Xbr3tjQpkTuTZIxvO3BbSIHD2JaAlyVlbQ807IGszpUfA7BNceRRW1I827/esPJgLEwmDtV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn5Dl/P11B23ccUElEJIs7rR+k61pctPs0Be+SbGo0ff1qKFHZ
	yh8lzGvHW9V7x2C7cX9TXGI2K/CfWOsUO/FCAnuLWKJLoxYgLodot3UpVFKMrEtKh3AIkPlDqdL
	23Yf2YoUi206pYlm6XGmbUdNPDVSKaGU3KERu6W3kg7KquMSG+h0LC2VTf1djyrUiA4ILLJf9LB
	DdHdGW2S88r5oLE1JgayAdkVVM0C2lq7YTYvuK2e6pQOg=
X-Gm-Gg: ATEYQzzA92yE9KopCU7U36CljBTb1FQY2feLjLJ8ds71x2ISXAqHkMDN+1QU9BIJVf6
	CE8MSjZwVerxyEuIQsXIH7aox8/HJ0SV6obcdPvij+y603LDYBhoihBhHwvR0FeDjX2BT8NOhPC
	hEgp8Uj2m/Sli0TpGBxtBSsx3g/aASZwXl+2cMLRYUjUKhViTr0HWFfzCKtKBFWaZoffO+Dzp0C
	caAfYPouPpLpYXcAC4ZXIlSVgwKlOafij9aVi9A4wyTEqY0CRQZ+Yli6UXlCuYeCMZp
X-Received: by 2002:a05:6820:60e:b0:67c:3142:b191 with SMTP id 006d021491bc7-67df5d8b201mr184614eaf.24.1774283492056;
        Mon, 23 Mar 2026 09:31:32 -0700 (PDT)
X-Received: by 2002:a05:6820:60e:b0:67c:3142:b191 with SMTP id
 006d021491bc7-67df5d8b201mr184574eaf.24.1774283491520; Mon, 23 Mar 2026
 09:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-4-loic.poulain@oss.qualcomm.com> <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
In-Reply-To: <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:31:19 +0100
X-Gm-Features: AaiRm53pz500vb6i3cErdYdz3rrYyZsWdQEpVL4m9bzIQb6suv6a2Ww6ErO-Z-A
Message-ID: <CAFEp6-3R+O_j+g39oegS=WHUTxnF2LzPx0t-C23+PA8zUhCmjg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WgystcM74UoCvO1POoMK-rtX2ky9Hw8H
X-Proofpoint-ORIG-GUID: WgystcM74UoCvO1POoMK-rtX2ky9Hw8H
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c16ae4 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=XYktinp8IYMsYWtSA-8A:9
 a=jswe0t86hwuQ8JBO:21 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyNCBTYWx0ZWRfX5FkSO/LJ8pfM
 i0pi0EV4sbRUBIwd+j1kED77WOKDit3h5RaXhdfSqbHnGyP2DBbLxyNzsjHe/jY2YWbaJvO7gLV
 dzSSf6sx6xKcSRbBBHed1NxuMAuHVhBzNToIU0wPz5G1zJZSH5kW4DRgHL7EBqToyO9KM+JhwFW
 EmOFgTRx2SYoFl5dNfcybFFR6BAEyYdx9IMhh7VxO35+lrPWVcbyysQ1eYnpwODj3guJ9n6mNK2
 luksPgVGuLc+ePY7P6UHuhxBvj1Wki8HloHrEmwoE996O5owD+ahaG0fL3B90qn/XaumGTtGZU1
 DQHrhEhsMyFJlyxgwoKRVEcOWtEZymN30wq/iZlVoGDwUolH1hw6Ne0JUefFctCZWVYeeo77XG0
 2Vbv9PmqXpvT5ntCauNdscbG6AZsIDGUOq2PjP2Dm8h1Y6Z5YBHD9Su3zi107suRUO8W6GtHTBI
 Dqz5FLKqH9NYYXVKtKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230124
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99358-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 6EE582FABC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad,

On Mon, Mar 23, 2026 at 2:24=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/23/26 1:58 PM, Loic Poulain wrote:
> > Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
> > QCM2290. The OPE is a memory-to-memory image processing block used in
> > offline imaging pipelines.
> >
> > The node includes register regions, clocks, interconnects, IOMMU
> > mappings, power domains, interrupts, and an associated OPP table.
> >
> > At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
> > clock is shared across multiple CAMSS components and there is currently
> > no support for dynamically scaling it.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/agatti.dtsi | 72 ++++++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts=
/qcom/agatti.dtsi
> > index f9b46cf1c646..358ebfc99552 100644
> > --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> > @@ -1935,6 +1935,78 @@ port@1 {
> >                       };
> >               };
> >
> > +             isp_ope: isp@5c42400 {
>
> "camss_ope"? Label's don't need to be generic, but they need to be
> meaningful - currently one could assume that there's a non-ISP OPE
> as well (and I'm intentionally stretching it a bit to prove a point)

fair enough.

>
>
>
> > +                     compatible =3D "qcom,qcm2290-camss-ope";
> > +
> > +                     reg =3D <0x0 0x5c42400 0x0 0x200>,
> > +                           <0x0 0x5c46c00 0x0 0x190>,
> > +                           <0x0 0x5c46d90 0x0 0xa00>,
> > +                           <0x0 0x5c42800 0x0 0x4400>,
> > +                           <0x0 0x5c42600 0x0 0x200>;
> > +                     reg-names =3D "top",
> > +                                 "bus_read",
> > +                                 "bus_write",
> > +                                 "pipeline",
> > +                                 "qos";
>
> This is a completely arbitrary choice, but I think it's easier to compare
> against the docs if the reg entries are sorted by the 'reg' (which isn't
> always easy to do since that can very between SoCs but this module is not
> very common)
>
>
> > +
> > +                     clocks =3D <&gcc GCC_CAMSS_AXI_CLK>,
> > +                              <&gcc GCC_CAMSS_OPE_CLK>,
> > +                              <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> > +                              <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> > +                              <&gcc GCC_CAMSS_TOP_AHB_CLK>;
> > +                     clock-names =3D "axi", "core", "iface", "nrt", "t=
op";
>
> Similarly, in the arbitrary choice of indices, I think putting "core"
> first is "neat"

Ok, I thought alphabetical ordering was preferred?

>
> > +                     assigned-clocks =3D <&gcc GCC_CAMSS_AXI_CLK>;
> > +                     assigned-clock-rates =3D <300000000>;
>
> I really think we shouldn't be doing this here for a clock that covers
> so much hw

Yes, so we probably need some camss framework to scale this, or move
this assigned value to camss main node for now.

>
> [...]
>
>
> > +
> > +                     interrupts =3D <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>=
;
> > +
> > +                     interconnects =3D <&bimc MASTER_APPSS_PROC RPM_AC=
TIVE_TAG
> > +                                      &config_noc SLAVE_CAMERA_CFG RPM=
_ACTIVE_TAG>,
> > +                                     <&mmnrt_virt MASTER_CAMNOC_SF RPM=
_ALWAYS_TAG
> > +                                      &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>=
;
> > +                     interconnect-names =3D "config",
> > +                                          "data";
> > +
> > +                     iommus =3D <&apps_smmu 0x820 0x0>,
> > +                              <&apps_smmu 0x840 0x0>;
> > +
> > +                     operating-points-v2 =3D <&ope_opp_table>;
> > +                     power-domains =3D <&gcc GCC_CAMSS_TOP_GDSC>,
>
> Moving this under camss should let you remove the TOP_GDSC and TOP_AHB (a=
nd
> perhaps some other) references

Yes, will move it and remove what we don't need anymore.

>
> > +                                     <&rpmpd QCM2290_VDDCX>;
> > +                     power-domain-names =3D "camss",
> > +                                          "cx";> +
> > +                     ope_opp_table: opp-table {
> > +                             compatible =3D "operating-points-v2";
> > +
> > +                             opp-19200000 {
> > +                                     opp-hz =3D /bits/ 64 <19200000>;
> > +                                     required-opps =3D <&rpmpd_opp_min=
_svs>;
> > +                             };
> > +
> > +                             opp-200000000 {
> > +                                     opp-hz =3D /bits/ 64 <200000000>;
> > +                                     required-opps =3D <&rpmpd_opp_svs=
>;
> > +                             };
> > +
> > +                             opp-266600000 {
> > +                                     opp-hz =3D /bits/ 64 <266600000>;
> > +                                     required-opps =3D <&rpmpd_opp_svs=
_plus>;
> > +                             };
> > +
> > +                             opp-465000000 {
> > +                                     opp-hz =3D /bits/ 64 <465000000>;
> > +                                     required-opps =3D <&rpmpd_opp_nom=
>;
> > +                             };
> > +
> > +                             opp-580000000 {
> > +                                     opp-hz =3D /bits/ 64 <580000000>;
> > +                                     required-opps =3D <&rpmpd_opp_tur=
bo>;
> > +                                     turbo-mode;
>
> Are we going to act on this property? Otherwise I think it's just a namin=
g
> collision with Qualcomm's TURBO (which may? have previously??? had some
> special implications)

588 MHz is categorized as the "Max Turbo" frequency for the OPE core clock.
At some point we may want to enable this only under specific conditions.
For now, the OPE driver does not make use of this property.

Regards,
Loic

