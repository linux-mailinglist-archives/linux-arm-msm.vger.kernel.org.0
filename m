Return-Path: <linux-arm-msm+bounces-104356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBVWNXMw6mmVwQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 16:45:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A58453D7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 16:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58321301EC74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7534F344D9A;
	Thu, 23 Apr 2026 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZezkuKGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axvZFX2C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B3331A57
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776955500; cv=none; b=ZZ1PgXydwz4x+VUoehWBYrHYAmOTKEI4Ur8ZfSzZiPXkf45DfPkcUtLChgb0+EakGR3TXhgDzna35PaJL18aU8gFoyHDYSPQ6w6OR53/EuphtL+JwnHfYf83+NEfoMieRSZWapdbFesnTiGWaYadyZO4SBEB2cjnx6uJ9Gychuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776955500; c=relaxed/simple;
	bh=pSORkoaCfoc192FCtWtWjc4MnlZ0lrxn8eYFf25KNrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEZoubT1cYI3d/wq+Le+UUrRyf3ICocrTwa+MXg5GUZiHriUkv9nkJc6m6wK5TQkgG4smzVrguWi307G4ACxTo1FslT1cNAkoWUGsnqmeBhejIpUOwdal6+UVBmO91p/xHb0pEjYJ/7HDhNM60iPKtH7ffOInYOYay1Cku+s/8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZezkuKGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axvZFX2C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8trQa179321
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 14:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0a9Bhg4fNKr4opaNYhLqPsa1la9Dyy8ZA/hEl+2ho0c=; b=ZezkuKGPofOTTRaF
	Ggy3f0pQWVraBYZL5Eh3+vfThzrzVbdNvEw0dCyb3ZoBmCdN0tZsXR23AZwlKdWi
	AdN/kn6mVwaeg82CA8Ro00SV0rqSc5zVKgp9wcLOTnmZq+Foe+Qa8QnD9KEVEksY
	P1SDTWe9ZcIgj8ulAB2Mj1e/O5YZT2J/mzAMdyv5anU9dquO7ZAhgUNNNb7wySC6
	JdFkEnDFIpv/DCqT/XqBBrjpfuBuF0g2tvfImxLqX683sQhXZ0eFtFvWZDxV4TYU
	+8NEmwYv/IZ0QtCJsvkygb/ApW9MELI12/fr0ZO32Qqg1A/QQ/DNWT+lDWrRLrDB
	k9FwkA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62j0f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 14:44:58 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c91ef7009so12568725c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776955498; x=1777560298; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0a9Bhg4fNKr4opaNYhLqPsa1la9Dyy8ZA/hEl+2ho0c=;
        b=axvZFX2CqbwkDrFs/8fW5dn8iufG3T+VY5O/xGfeH321Abqe7MsZxF0zEYpXV+OxDi
         v+wq/mdhFVn1CZPRR8e0a3G+CVF4TOWmW2t0TcXVD2EQsqun+K0O2bQsdxL01OQMlbFi
         pO2qyUW1ddixi9/I2kqmbKe/RoUMsNIGMmgyYaTxqNIZYDH/JvBtr7it1pqVadsHvMwV
         uF4dCHRm1AXC6ja1BwBRZOUmgMy9foFo9cTHgu1ALlTUiKieHgPwlZF21RLab3lUBF0U
         mpjka/7birWJa0Q+uPLmlcIQ7r2/PtuObizBAVe0yZ/mwczTyIiVVFMnh/gmR7TqydHe
         k4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776955498; x=1777560298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0a9Bhg4fNKr4opaNYhLqPsa1la9Dyy8ZA/hEl+2ho0c=;
        b=k8o4hm6I2BDsLzlOykpVAvyE+2RpCOBeizoYUN8R1CeKbWM/PNVA6c5gwlsImmq51B
         MlQOPCQXREqMQwFd3ceyEANo3w+imzj7NrmgWLtXlNBKV0Jecjj28kEr5TFIomwIOKM1
         kyI2tASjuNw9yOgq2gjrQ5si9Tt0Z5wKlhUIUedWzPqNmZynF18ywct1yp1r1VvviflH
         xX+1A+rxnmET6LKfSRDqguIAMhoeIH3QidV+0OCx8gMFwJ4sJ+/IGU6ISxweA8+eg9Ff
         yP75lkO/W0M3zV2Y0zBHYtZ40VHgXYMnaphS+Q4j9P8Turxc3MliolbA002S8CUmgGbr
         RTMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PHp+QnTXiK1+H8QXtLgf3UibizMPUeSUCKukOwRGDQwzDptecRanL5gE+jlj/lVxiXRZaG/mSYELhi2+3@vger.kernel.org
X-Gm-Message-State: AOJu0YwH7/Yy21t6ehce0LSpGwvCHtL5MqD0fbmPILwfM6cxinBzjxwc
	QHPQ44+CqxgFC3ls1AM26Uf9G8OIHXRQL4cORDARnBbhxNUM7H54PnNJy6teOxTPwaoABjPtZbE
	nAriasff/yATlcxEKsO9K+DmNfCa3tUhOZNeRZ6pljHGWE1F2m3f4yNFDb93brYGYyyg8
X-Gm-Gg: AeBDiesnAo6ltXhsM8W4fAIyXG7tQFybYBtiLurlqhms4GMbiGacmVB0rkbddkjhXhs
	OkNL2gbOU68pOsCFdC9hITkoQ4FSWOIPiU49D8q7/zR5PDqkSMx8B6T4qt9rj6+FJgHm1xykkhu
	S043SSyCuJdCy3naw4dhrE7SsTwokngbje0SPEIk31aXo3z1Vd+Zhuq+9BMqUhy92MvUe4IQWVv
	zZPavg3v9mQ3H5TmbX6aqKoEAxiNRiQhfwRNN6d5MjP6nViTtD6AdIoVt5mNw9thI9GNrQ7Lfir
	JlEbP3TZN1bSbrCNizbVgwe/hpHt2mszxAWpSR5V6i8rlc7a+X6xHqt/iQdHDvQ7oDFjUsSuAlc
	hYyNua5rJ2OFnr49dfNszGW5rGxUT20L3Oy60EsrOKKEHlZK2a5nRX+XbDLblb2Vw2J7VMmHj0i
	0=
X-Received: by 2002:a05:7022:f9c:b0:128:d24a:a5c1 with SMTP id a92af1059eb24-12c73fa5bf6mr14615374c88.28.1776955497511;
        Thu, 23 Apr 2026 07:44:57 -0700 (PDT)
X-Received: by 2002:a05:7022:f9c:b0:128:d24a:a5c1 with SMTP id a92af1059eb24-12c73fa5bf6mr14615339c88.28.1776955496818;
        Thu, 23 Apr 2026 07:44:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm21072313c88.1.2026.04.23.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:44:56 -0700 (PDT)
Date: Thu, 23 Apr 2026 22:44:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Nord
 SoC
Message-ID: <aeowYpvA6MegAX6w@QCOM-aGQu4IUr3Y>
References: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
 <aen9U_3jMRagJwgp@QCOM-aGQu4IUr3Y>
 <CAL_Jsq+2oJF4GG=PDsW1y6Cz7-+Qp2DUz1jXEXxD54PoO9zRRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+2oJF4GG=PDsW1y6Cz7-+Qp2DUz1jXEXxD54PoO9zRRQ@mail.gmail.com>
X-Proofpoint-GUID: fSzx2VE0fkThXah0EqWEy3cQ7GeAy2a7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE0NiBTYWx0ZWRfX91NtfVkN4hY+
 H2YQ5W2H1jK0CdyDkefmCDJeZop9KLEuwLQw4RL+WPzsdsiUMaimF2qzapWN0EVXChAt7r+Ap7a
 pvaenb2OeXV9fBrzSWPhlPG55To16w6IImbFgvWzovqT9Ka/6HNbTBxTO5+xwBgA9Q22IoxymUT
 R/Io3nL4emdxu8ftmNUl63tUi4g4fiJxggMx5AYijExiXGop4EDgJKhCTMHElWy20ebuzdekL87
 Hjm0JzLAmNm79Jzu2N0Jumae/2PgRXO6L4lm0pJjyTkeSaTOeF1kPYXMbWJmquO0pUrR2CqoYhq
 kjVKLLEv5+/0Etn53mtnN9unoD0coBA8knRjBkPA7N5IjOhU4afyTAJrylxXhwxgPSPJ9C+h4XL
 Jzdcs9gaUy87Kqv+hSPIbYe0eNIHu4egYrGP3MYvQe2QZrLpaX8v4pu5fpzeJoYcBYVTTJQ+rth
 wE5QlF5VRSVfPHpuRsg==
X-Proofpoint-ORIG-GUID: fSzx2VE0fkThXah0EqWEy3cQ7GeAy2a7
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea306a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j3siSaVScxvUr_GfrVUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230146
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104356-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59A58453D7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 07:08:15AM -0500, Rob Herring wrote:
> On Thu, Apr 23, 2026 at 6:07 AM Shawn Guo
> <shengchao.guo@oss.qualcomm.com> wrote:
> >
> > On Mon, Apr 20, 2026 at 02:44:01PM +0800, Shawn Guo wrote:
> > > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > >
> > > Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord SoC
> > > with fallback on SA8255P compatibles.
> > >
> > > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > ---
> > >  .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
> > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> > > index 352af3426d34..d73f9edcbbdb 100644
> > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
> > > @@ -19,7 +19,12 @@ description:
> > >
> > >  properties:
> > >    compatible:
> > > -    const: qcom,sa8255p-geni-se-qup
> > > +    oneOf:
> > > +      - enum:
> > > +          - qcom,sa8255p-geni-se-qup
> > > +      - items:
> > > +          - const: qcom,nord-auto-geni-se-qup
> >
> > AUTO variant of Nord is SA8797P, so it makes more sense to use
> > 'qcom,sa8797p-geni-se-qup' which is more consistent to
> > 'qcom,sa8255p-geni-se-qup'.  Will update in the next version.
> 
> I thought QCom moved to these codenames because the chips are the same
> with different part#'s by market/application.

Hi Rob,

Your observation is correct! We did move to using code names. But we
hadn't needed to use part number along with code name until Nord SA8797P
(and Lemans SA8255P), where platform resources like clock, regulator,
interconnect, powerdomain and PHY are handled in firmware through SCMI.

Those resources will be present in Nord's DT but not in SA8797P's for
some devices, e.g. geni-se-qup. That said, SA8797P has a different
programming model from Nord for these devices. In case of geni-se-qup,
Nord is compatible with 'qcom,geni-se-qup' while SA8797P is compatible
with 'qcom,sa8255p-geni-se-qup'.

Hope it clarifies the thing a bit. And I will update subject and commit log
to make it clear that we are actually documenting geni-se-qup for SA8797P.

Shawn

