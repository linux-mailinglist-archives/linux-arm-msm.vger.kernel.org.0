Return-Path: <linux-arm-msm+bounces-92470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGAuEUsDi2kMPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:07:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D859F11967C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B487C30A74A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F208D346E46;
	Tue, 10 Feb 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oH2Nk9Iw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsnXnVSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD936342534
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717813; cv=none; b=t18Fgz85uzYK8A6osqxxBQGa5xk6iA3BaJ8hXJ4g/Fsy4A7iEoRI6D9ZUHKYe0FkhvNwgOvvnKa7eDkzFxK5Qwee24la/fAjunRAG/nsFVMRyRlWwUzi/QcIJc7HF4S18vzs480+KCDnPZ7HTA+bJFE38b+g6PixC/R4BNwj1ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717813; c=relaxed/simple;
	bh=Xj1AtvqQ4PQzWYtGvJgL4wEojKHhuwURqUVwCseaJL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIeHKP7EbZK7JMa663L2fP4k4pgOo0zXtIj7H8JYDWcEEIi1ZX+btjtlv756HSa32uxTRm720uWCRxGTV0ip4l1x9nS4DtLcoZrKuHmYKQDInPqWsnYE2SxXWOYTw6AHSJugVaZRtr7lv2ltfl36EGyU9INtaWo8I7OvJAtm9WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oH2Nk9Iw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsnXnVSm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6oPRm857026
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Os6pPZw20jKpAOXee9AdeLoL
	X3aJ+1i2Nj8Sg9WuG1Q=; b=oH2Nk9IwRpm9DmatdG/i+L6Wkb7/yuGpGE+H+Xg2
	fR6P5/5DLE7w7MSUzdCNN2UutCoW1Y+lKiXP5md5y5TVqPvYYzMyhK9NuAltyFuj
	dMwgGLnnlEMkcr537JsX9Nbdf71vxunI0okfF4DlcW73hFbpvOufThFC1y8m4LWn
	rlZI2121WYb4EgpyHKu3l59EBTF64PomXabuDoYnRDcBwOeZ/V4eXYM7nppV8pdm
	B3BCIkGDWpKQ9POimAO/CJCdcz3LVDENgysEF03HgmVFlFaN4BD2KI/whZoYMK1g
	qgVE1cw2m1HqrS+D8ZFv3AZchUDDzzQgnFajvX5LcClHWg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7ga63rha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:03:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8947d47793fso251060146d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717811; x=1771322611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Os6pPZw20jKpAOXee9AdeLoLX3aJ+1i2Nj8Sg9WuG1Q=;
        b=NsnXnVSmSbhpYKhi0k6Q2vqj5AK6Z8XJAwaDb/Ka/+dUEyB9yx/HcV3vWCYbbMmc2G
         FXKV6n3TSQRzr3nK39iVdAxEDA/U3f276ZAjvPkC4WfgMioKUck5mkstLbQKKxgUrTGq
         FzNm2svdYuwNJBbTlvK5VQSVxp8iGFxy+85IiP1+NtqFL9Hzfz4HDbG7X4CWDX5Sndds
         KKj2EYnXUBPFzuMBOygt29elhjbP85QzuX7JkKQts+163sa4c4FqEKYO4TVc2GJS6pEL
         SefyW69nEuoP+dVCiNWCr5oaAlyDpkX7RZgn+d2NlXv00q2efxYRqbb8HPc2XgMNYArt
         fLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717811; x=1771322611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Os6pPZw20jKpAOXee9AdeLoLX3aJ+1i2Nj8Sg9WuG1Q=;
        b=KHwPzT3rn1iZFpiYT1P0Ppf8PdKCo+4Kj53PUO5Otdgw07mZq9qp/wAXBshuqZ6QyZ
         HK8PHj8tUG/FdwJx7HYDixN40lqFzIvoxtGNvo8xg7yGHIf4ePqddTCOLh3qWIDjZ2R9
         Bl9Iu1GQ2yupNyx52QbaUd4jQr5TV+70w0qAdYiVkD8AjBSGqRChnNlAQrpevmKR69lI
         21MSc0/DSSgcRyCJANsVsjoCWv/lz6ZcO+cj5ZFJ5RuFrKBp1C9h3M6Aw8e6WLnjqFcd
         rGt/DHVjlI/S8hG4nbv41EnMGJur5rfEymfhC3jxaLdcnDa1sciKb0hyYGpgBytdsZOL
         QhDw==
X-Forwarded-Encrypted: i=1; AJvYcCWu1RbDQYIemopfr0kGSlUkMT6x7S0/Q2h1bC1rty2fGWgsbLZ/NQ2tSO2ytoO97w8BSghtQdrDkLNQ2qbF@vger.kernel.org
X-Gm-Message-State: AOJu0YwR2SES1yR5J+vNz8R2l9WRWVjAMjNqKK1ncqVnHlNM0cMXkthw
	tEVGfUcZtQCm2mBTl9T+97Tv1nGembWJ2WCIWuwdJhaYeDpgTLjgBv9JpJAhZ95tOVu6wYAiJNX
	Bo6x9UPtnf4zxs4/+d7SjjmyaMO4bpzXlEvnutCGmoJ3BeHxv3vRO6cU9KZdJGQlvZxBl
X-Gm-Gg: AZuq6aKq4cXTUjud7j5lSTDk/Vjfl8VKhXQQ0qvYOOaSBj45qtfd+jvAD5RA6Du5tAx
	48NYBJghYp80VOf1z17onL3wk5VHopR7gcMZqA7J4Ubfks5v0NajOOiq9Cm7MH78UhrCZrBL1QT
	Oe/WC9/G/KwmVkN6nRO3hKkZRCsEIw2URD5e/ROIz7FXgdz6tjnd7URYOxUQ8LtBr8xIm8qaxQb
	nw/LFLktlWZDvOX96pgEiY9pgjzQ1KhAMfSzQh21hQTCESfWV6AauGpWagOXJyuUfV9lVEitHUt
	tePYSZWKwqGy5d2sqQM+KIDGpT/pP7Ju4JFBr3i0rAOUKTmJ/I0Ql8+ReXxNhMdmty5iSW6unWp
	fHld6/87O3r3KJ6PJgDY3MHBjTy7zfnIbLVs4
X-Received: by 2002:a05:620a:3949:b0:8a1:21a6:e045 with SMTP id af79cd13be357-8caef409664mr1876898085a.19.1770717810600;
        Tue, 10 Feb 2026 02:03:30 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8a1:21a6:e045 with SMTP id af79cd13be357-8caef409664mr1876894385a.19.1770717810032;
        Tue, 10 Feb 2026 02:03:30 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e1a8esm46819215e9.5.2026.02.10.02.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 02:03:29 -0800 (PST)
Date: Tue, 10 Feb 2026 12:03:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH RFT 3/3] arm64: dts: qcom: glymur-crd: Enable USB support
Message-ID: <nyucp3ptfsznirluuq74dgrleudx3hcf54mf4hpzbgfodlrhll@oe4gs3bzca4z>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-3-98d6d387df01@oss.qualcomm.com>
 <4wyliidx7f2otaudyfhevemnigd2zpietbhsovhna2cvftbd2o@x22jpa6ffjyy>
 <kupuqmjjuds2aznpl3oicbl2ererfa6i4br5c45mg2xr7fwyon@f6qoyr34smr4>
 <rqcvkrrfqil45wctqtjfmvublek3d33wkjvhogp4eymnwskzxj@nzu42jwjbmrw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rqcvkrrfqil45wctqtjfmvublek3d33wkjvhogp4eymnwskzxj@nzu42jwjbmrw>
X-Proofpoint-ORIG-GUID: m0AXVQUbP72uwJVJTqmyS_HSZu_Ukzko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NCBTYWx0ZWRfX9NsGSiMVFcNA
 anVntNnfzH9NVOu/6aa9/LwBWE1Zi996wEJd1vDmtBMvyXcILOn2RXv9zEdByfpHsdMYHkg84X7
 djK0wejVF9JBEuISteOrP2a4N4Bo1/L9HCiaV0k9nbwHnzBHNdwre5JCOoaonwG6HxglPTkb469
 fnISGuHQ3eQdRU4nq9vZ3GaZoF1kUM9qVh5GoXA2CZWzTgUzgIcl6J+sQZ59KzHfU3BUxOtNAIJ
 wqSzcnSJljGnTV5qmYamOoLl1qLP+VbBm6Jq+Al5jbWkdeG9a8iIf7g1yY03w0RzQKkLNYv/qMv
 7Nushg12stPpDQxTwiKJ4sOHND+AFWsIi8lZKKmhnbDQ6xS/Q5rivNUhFeGjQpU5l/GWVzkDqpS
 3UDivKZpvE1NGJd5Dvm5qAUR2cFXpv2Fq0isJcexbUuKL3dsoxdxzwf7Ai8wZSmE7ygb8Na3dq4
 9/iQtJza8y55qb2L4hQ==
X-Authority-Analysis: v=2.4 cv=WK1yn3sR c=1 sm=1 tr=0 ts=698b0273 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=tGu0c17UIxBQEtl-8TEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: m0AXVQUbP72uwJVJTqmyS_HSZu_Ukzko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92470-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D859F11967C
X-Rspamd-Action: no action

On 26-01-26 19:52:39, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 04:24:24PM +0200, Abel Vesa wrote:
> > On 26-01-13 20:02:25, Dmitry Baryshkov wrote:
> > > On Tue, Jan 13, 2026 at 02:33:06PM +0200, Abel Vesa wrote:
> > > > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > > 
> > > > The Qualcomm Glymur Compute Reference Device comes with 3 Type-C ports,
> > > > one USB Type-A, and a fingerprint reader connected over USB. Each of these
> > > > 3 Type-C ports are connected to one of the USB combo PHYs and one of the
> > > > M31 eUSB2 PHYs. The Type-A is connected to the USB Multi-port controller
> > > > via one of the M31 eUSB2 PHYs and one combo PHY. The fingerprint reader
> > > > is connected to the USB_2 controller. All M31 eUSB2 PHYs have associated
> > > > eUSB2 to USB 2.0 repeaters, which are either part of SMB2360 PMICs or
> > > > dedicated NXP PTN3222.
> > > > 
> > > > So enable all needed controllers, PHYs and repeaters, while describing
> > > > their supplies. Also describe the PMIC glink graph for Type-C connectors.
> > > > 
> > > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > > Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 283 ++++++++++++++++++++++++++++++++
> > > >  1 file changed, 283 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > index 7c168e813f1e..3188bfa27bea 100644
> > > > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > @@ -56,6 +56,97 @@ key-volume-up {
> > > >  		};
> > > >  	};
> > > >  
> > > > +	pmic-glink {
> > > > +		compatible = "qcom,glymur-pmic-glink";
> > > > +		#address-cells = <1>;
> > > > +		#size-cells = <0>;
> > > 
> > > No orientation-gpios?
> > 
> > Nope. Glymur does UCSI 2.x, so orientation comes via UCSI payload.
> 
> But is there a GPIO or not?

Nope.

