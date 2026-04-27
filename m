Return-Path: <linux-arm-msm+bounces-104832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJyxGEDI72knGAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 22:34:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C794047A145
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 22:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B076630205D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EEC371CF8;
	Mon, 27 Apr 2026 20:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="flLk6J9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdTOCkXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650DE366814
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777322045; cv=pass; b=tU3vLCbwM0RxdvRa2B+JdxwZjdmYvCOavSy3TWVEe+w10dddtgFAImM+mJy+GyVEw9C3L5ZIWkPSxkqvZ3CzHth/IQT3bXpv465FpYruSRpkKtaIK4IGyam30hmvYwZYgMoBMInv94aDF4Ex7q9bMR1/gxIQC1mtkfVaoRhBhrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777322045; c=relaxed/simple;
	bh=5dFf4SUBMP66al9PPeN37zfbBUVyl6Hn9p/qcpwkv2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlSPKOuBhiQg/HQcKv0E/M4XwM8X5S0JDCZuegp1/BSb3Ivni3Zxpc38aVBznZxsv5rtmNW0loZtH0yZ3EQKjjMTQ5u2qvOhXSPdyqrNkSLOwQ2RY5R4hu8tw37opNrK6T2tL4LR+Iqm/gEOYMJBIarPZxfHC3v1rLw3B/zGzzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flLk6J9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdTOCkXl; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ3MJp2111973
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=; b=flLk6J9/5KJGIGro
	3UckxDn6KkOsQ5xfqbYUZRKjIlrKEn0WITFWx7wYwnZK9Nue2Qs3umRUEJ8VVa7m
	n2HIVM25BX2K2lcGvFESq7JthJ+8fbE6VBrcBiU+i1NqP9dpZTBmymG/FJ0MD/LV
	bQoYSkqo81Pit0iLqYUCf9DJWStajsGjiN5igoJB0aU8EiouHHLmKKzcc+n9mACT
	qYdsna7negCmXiRdLh/4MrGhM+7DJSEIBC3hlQ5+fEW6ND6mMRzMuDdxvQhmWUhV
	Rc3Fl2+dS7jv/KV2LinTwpegk6Zj60HAvjQ+Np2gV92KdlmeFiNSO0Z2WLVo2DVQ
	6hRC1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbgax8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:34:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ae6aa148a7so210848616d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777322042; cv=none;
        d=google.com; s=arc-20240605;
        b=UdEQYD4qc+Pa0Hp7IB1jHp3KA61uILLbo+fdhAFT3BGhTiVRLq0+iYiHFzs05tAOMi
         AFk3zHLZ5/kyin2PkvobFABKK58PnAy8E7Jn1SWQOk2Sn84khSQGJVD1KCwBs0CJiyfz
         RLuDNg1r34P/QBY4iPMSu51bwwpKhgYRisFOoP/mogU0ieu08+a7lpk56cTkibqc/8XL
         wUA/Ql+mVz5WFGGZPotlI1+OOi3vKMliUB6yU6wrmhBYMclPhpOOKTVg8A6vr30ZX5sz
         PRtp6Ri+GLmkgAMZDNd+4NQfZ0T5bnSfsBAbXxtSeNiOoRYmQxGWfAbpLJNjiXSn8uDM
         dfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=;
        fh=/4tujRukbKSOtF1iAoOTZ7hygh+hnBa1d6cDg8dUp/4=;
        b=HUZFTrpwLh0fqKQTSDlnTIpHKbuOqNB0Q5pKMuXNWeA0d8u3niwmP1s0qzzztZ71xE
         4OoeicyJI/y4K8PvRgHHi/Umw8UQtybu2YwG1piF88CAFOWPF34m6K9yZQB6MSsViJka
         R8gBVl3pXfDswFwPUgyncIaZi65pA7avlSS8SDl90HZAwu9C6Dbp8P+mY/YH5JW28+pq
         Cvr2P+DS+3aWLKtMeVzrcXUeaDLKu2yQvaCRtwTiGefOPxwTgcMwefrW1v5n9Q6ZUQjv
         zI/mSIBVP1qDKBhyihewGsYQOtiStAvBNxoxJgEFSG+YoI1emCGGCCpOgCfdLU3cmDh5
         KrFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777322042; x=1777926842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=;
        b=UdTOCkXlWJSMgHKj200eRfHIMhm87R5i6AVeKir1zzkOir6l3Md8ZHiH4KTQ/e6Ojh
         v9fxYYFHbFSg/zVdjDtLqxCqH7x+jg79ougpgmYK8TPzp0lAQr9JIaC7bswYB3sjj+XU
         T6LT1jL9eSf425ux55G9PSeA9U0wwMNjAxcPXahuPxjHFQ8xoKKXbYBHI72PV4eZH+uq
         v5txlCUW72U440SENhBArS9k7u1zwNLGM3/3qbHXxlYQbhc9Tuo1P8hg7A1kHT7kNvWB
         chneS0bnjrTRJ/8Tvo26MATPVTXEfInBugDLSsg95bLPmb0L67oT+3kbetn2Bp8aPb0j
         sRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777322042; x=1777926842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzkPIKk9u96O6H7P1bdKNoMSV2AVIfh5b7spc/gNPMM=;
        b=rUJLgViUpA+Lr7CKGb31HO+p1+PBG66xv+2j9cVgiAGj2ZRjy5ad6K3Nak+OHUdwie
         hKHZzHG2SOqByFe3DSBJXWLalR21wZWL3lGCAIJcTj4ZB9GKOSzTSIrg8giAAy5dnSpT
         KgpK2ws3PMIbc6LbOyvZ7Oaoq4N4gaywRZ7rk5QjiFN3GpInJaxHbit+CDHBEqoLrg6G
         slvCBQBdMkSvAUe6XNj16MclcYHfGHS1RVJamuEn2mZYexXrDm7a/VgRhUOHziSslCUX
         wxCCN0Sjdcf3UX94DqgkeO4pTY8hul/aFvidAB/pdHJiFAmunaXhpm7qlk3tFyXvaPHO
         p7YQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WjaR5K083WDEHlsUQRcALl2IeAVyq/zsFhDEe7Fqg3Il42N4vrpFV5a02PZg2l0l1kK4h4c9E0gb4ks4i@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQNYpHVPvsAayBdXzDCmkbXxkH7Pl3Qw/mz4fS88c1FDYvwN2
	jks3fqMEB7AMGaqRcxdhzjIy+sQcO75ekiaKetXpnxX/VhD9wjV8ZLaxN5c8uf7Q7EJUSOC2KnB
	41k02p+5NFcjqK06x6xfsR5fhNSTP8p9w8CQUbEf3f/eN4PHu2689QiC5ygEusHt+03zPcJnvJL
	H4Jcu99Z4H9XMDmNABJECADFNUCVAMxPAjEdqMyvZXPxA=
X-Gm-Gg: AeBDietqKL6fEKCaQ2Rkr1CUfyNn3YzQzj2At52NmR+GworyvTDHDnCZynXb0jcrAEF
	W/7W0lrsPX/wvGJThaELiRGgz1rKjX8ivpoF5O9jK/gG0hPvza87uCYTVZDPCNcKz03N/yd2Oji
	VjPxsiXXYGUxeILAY7aA1MsdHHaIvXTGi8cV/JQSuqF/C6tOgoFZsmbE6g2bIEwzzqy+uqdg2Ip
	ShwEWgOGaZXp9NJrf98UGrARdD1Yc0bJ9rTo8jKqaev8eF1VYf8C14s2dCky8hb5ykf/FIanyXC
	apk=
X-Received: by 2002:ad4:5f09:0:b0:8ac:b0d8:65f2 with SMTP id 6a1803df08f44-8b3e39240fcmr3249806d6.19.1777322042257;
        Mon, 27 Apr 2026 13:34:02 -0700 (PDT)
X-Received: by 2002:ad4:5f09:0:b0:8ac:b0d8:65f2 with SMTP id
 6a1803df08f44-8b3e39240fcmr3249106d6.19.1777322041639; Mon, 27 Apr 2026
 13:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com> <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
In-Reply-To: <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 22:33:48 +0200
X-Gm-Features: AVHnY4KDLficlBbaC6G7fd9Wou7Y6yvKL42b-mOiAZ8QDOmheuQtn6aM17Lt5So
Message-ID: <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: XaAqQbnKOSGx0Uor8WiTp4TL1hxM8dtm
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69efc83b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=n6yBxzqcbVTERbX9KwMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: XaAqQbnKOSGx0Uor8WiTp4TL1hxM8dtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIxOCBTYWx0ZWRfXy+MX1/c89lk/
 WxRp5GWpCfuJ021nspn6av5utjV5Cr9TqR4Dwoh2RJ67QGZDXtMoxYaV7ywI3XyJaFwtvuq1qo+
 PzkGYqj4UWBsZ9m3eo5HKWObkHvlbD1f0sT1gzOPRN8deJ6GCNSjDYz4NqMi/fKKp+vuNjcl9E2
 KDnEiONDj+ZYhcZDohTBErt+IFLls5W1TU2C34QepxCLtDQIc/hJt5H/MS/NAfHxaNZdBK+0Yw1
 ZOgdosysp5DeNq2+NNzb9Wxu6fyV1JwqCrzdufvbMW4tGWBCvSapFCBrR1xBcIL3zzNk8QbBfBz
 Vx5o8vtuoWFIUhVulCpr8FT8uLS17GQAUkmHi/s1BYHXD1Ji63zUnj0zJTL0pUylYr9UpoHeYN6
 8vC4EP+LK/SNUsaVqgUIMBPPR9u0sY9ZYz5Jl99r/IcFc6pWiGNYHHuU3+a7Ab/bchH4PLf0Ksm
 wHvq2ZbuppdA6+HS0iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270218
X-Rspamd-Queue-Id: C794047A145
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim]

On Mon, Apr 27, 2026 at 4:22=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 2:43 PM, Loic Poulain wrote:
> > Add Devicetree binding documentation for the Qualcomm Camera Subsystem
> > Offline Processing Engine (OPE) found on platforms such as Agatti.
> > The OPE is a memory-to-memory image processing block which operates
> > on frames read from and written back to system memory.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +        clocks =3D <&gcc GCC_CAMSS_OPE_CLK>,
> > +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> > +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
>
> Should the two AXI clocks be aggregated by camss-top instead?
>
> Otherwise we run the risk of the OPE driver setting a rate of A
> and another sub-device setting a rate of B

On qcm2290, OPE appears to be the only consumer of the NRT AXI clock,
while the capture path (VFE/TFE) relies on the RT AXI clock. That
said, this may not always be the case and these clocks (AXI / NRT=E2=80=91A=
XI
/ RT=E2=80=91AXI) seem like they could reasonably be managed at the
camss-bus/top level.

The open question is how the NRT AXI clock should be enabled when
required? enabling them unconditionally (similar to other camss PM
clocks), introducing a dedicated CAMSS top=E2=80=91level interface for voti=
ng,
or leveraging an existing framework to handle this?

Regards,
Loic

