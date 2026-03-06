Return-Path: <linux-arm-msm+bounces-95762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGigDBqtqmnjVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:31:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8971221EC67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64BE93060BCE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 10:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B20937C101;
	Fri,  6 Mar 2026 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZNrFYMs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwivZVDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F05C37C10C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792889; cv=pass; b=jF+SyI0wZF1T9x8NimF+xXeAiJFC/F2e8cwoJDCVfs0EXP2YoXeIHniK+zUMsljqSZ4D3XeNv2803SvVLVOq6uL2XL8imkOyh5zfxbRX9h+oipRcMRpXgw7LKTC6nQU1BCSkQHjbBJkvA6cSdxCgkPLq+Wdm+9fPqEW62iQDNMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792889; c=relaxed/simple;
	bh=tdvWNHoSdu2Iafp7/mrEBG/G+46fyd5oPjPg3sfvUEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCtd5ujnQ41Ow8Sel+UpOzxnIIKs7tFKAdtrURdRt2GyFUu6JSKh78WL7kjTPIPaOECMtk/D9Hk84brfKtF+xUiwzOcYZqUcCaPgeE73q07uTT5DxO/sXJwMx3UqDyfc6fVBU9Mdv/w7cJtYG7KkHSON0fn4n2zcuqyt43ftHe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZNrFYMs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwivZVDt; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aVAc1087378
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 10:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9h7Pr+7iqUr+8V1CASot1k/T1Bc+EXpK2ZcBTLqhM0=; b=YZNrFYMsk/Fkkusp
	mx2tkNw7vXOuadXBQCGBDBUTlnpr4NZWNentC4QFbcG5JFgpAt1ePFONSVn3deL1
	du6XPuHnmNjRjKozn+7yp1KVO4GZaLcJhVStbKqzhRv6jX3CKxlmllys+4Hzatey
	JliSi8fTmWxnYIg9oOT7O3uCq0cv5Jri9G5kxjq3+xcNYylT8JoAnL+RjcsKgw16
	/Run8SLGv4x8IrgXOw/d+NvubpqD7qO6zmjgcukTczcfqrv9Zw8Q9k2STjZkcRnt
	HWfPzwo+IOH3e4ul5BaL3HOs5xN+3QhnD3tMo+cIdjqsEqso8ZuPjOWrhJrKndmA
	3Yz0vw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6arrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 10:28:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so4813926285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 02:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772792885; cv=none;
        d=google.com; s=arc-20240605;
        b=Zb4NyF9SRbLGvIR9jUD3sQtb31gPHkEbOM4QFIpSnMOzrsotSZIzTl1Sz2FO6a38TG
         It+HbA7XnbRcAp5eCFqstOwov5YdpR9KnfaRyffmgOrHbpTYorchL6GxHkdLOWPKQOwy
         xbfcgfLy4ReZikVMaegn4DkXmKVJJvjCzCp0SNkCknR7NabJ2sLu7PMwmn+Eb15hXd2g
         hj843astAKIzlqgIGTJhrBiCZAEajUrumjzGkNrjNs5Pv2U0WsoXCKV4uk+Ys0PA6/2A
         112/rEdR1009fPQxuUjmrtCgSnGQelLIa1Jzq+JiC4rmdu9h676DDtFV/sbQUEHToMO1
         fGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y9h7Pr+7iqUr+8V1CASot1k/T1Bc+EXpK2ZcBTLqhM0=;
        fh=sADvuChx9VA87mLQrwqY3jtBQOMhFprjagzoW+EUSFc=;
        b=Z1GXJ9hSSO0Pvw7+RnuLK8hNe3/jvCYN6UgB5+qDNBlJw11GUs4L6FwMj5HV4KhF9Y
         4zn+r1BIQGmHJMWYopkbkYh0opaHLlHXye9GdoyLiDB5IDI7rfGXuJQl1fcW1t8YLbxk
         YOAIh45pObGyjg+oyLc9s+wN3mdejrblqYVtWjTL39DWUXyrfa2S9LlpASJHefl/3ruX
         iTYh7Q58iLczZLptjzfE8vjcuFXtTQfmv1l8LSGeJdbI/owDsGmEMA9uM1w4+rDTy6pT
         b2pWcWKUvAWSP3vJbL1Ah6/ODY/TYEoGoekUqWki3+isE0UPxA8HfUuk3/5LedOJayNm
         Kdqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772792885; x=1773397685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9h7Pr+7iqUr+8V1CASot1k/T1Bc+EXpK2ZcBTLqhM0=;
        b=ZwivZVDtbsWU/w8SoRcOCkZQ17h+GAfpi7mAEOZrgCFR7mbSQXetIjRIpWcXZbcQXx
         AqH8KHNfiBH4FMALrRqOmI3gWXZIN1vZ6+9l8vpknH0Q45kEsncxQLswJ/qFThba8KwS
         o4XR9GnnvcJXasjT7v+cns/MJm8hTIZLvxu3pkzAYBgbSFmEyqjFWg89kBcPI8wSQjcw
         y3qEJE7lhg4LSNoQikIklx9FQm6ZiFYC7uh++TAvpVlXFTZ3wS0MTp/goLD/o1fKisjF
         QSTWArRoSpBGU3SPHzwmBxD1TQUUyIAM1CHO+JQ4rMrViyx2D35JgAKYcO/LModEJGo3
         yYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772792885; x=1773397685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9h7Pr+7iqUr+8V1CASot1k/T1Bc+EXpK2ZcBTLqhM0=;
        b=HMexM8FAuRRRhhp7vbP81CCYU4uLqfRehZxNi097gW7ER2VasRKWZNy7KczTdnrrt8
         1MVhYmUnwGJsRJzia2H6QORrWByCioeoPBxXN8ju5ZscmcvJPSA9RGto9oUevia33kYA
         glxKl7r2r6HpaqNqd0tP0wxxKOvF0PMnBKH0tUNT2uot61JCWrsdeq/0WIuzkV97QcKZ
         BtkxfOdxCbuzkdt68yLi6C0ds+mN4Z6qjrQ3adonUJL+wawTAz6h2zEmAAy9qUVYtJU+
         WsD1l9vSdL4HNql+gWj6j+LUMqoa3xNW3kwEkV10cQhEN7eUVkhVzS0EAUnbSwEKIWh7
         qgTw==
X-Forwarded-Encrypted: i=1; AJvYcCUUaeH62wq1MxSb1pCNyij5QlkBeINJNJagV28IhseJIf5aP/ZqDbROc3po3yWQyNm2yQLISpHRpQRd//58@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4JcNQyJa2VMxp9/MSmEpL8NNB0Fdrl/w5K4fJypCPV3xTcCj
	yxbu3L/R8GsiST0wGGq2Yt9GnC0C/skyZonTF/41Koa2y/VhA+z1V/WDZGwRM7edrOi5M+jFXaW
	pL9zt162MMCMVVlfnN5ZqoUCHuYbfhrv+yrEmBIJeFXoanVA31B7NNj4MBzcxdf7c78vobU549J
	qcdNq/yrTmJCzcGq59CRiMAyOwO8aTs+IKuCfScnHViLk=
X-Gm-Gg: ATEYQzxudU5evqqnIrS9xsoIE2Iq3KU6CgFnhBxSyHU2yLV1D1La+emKrvOgCGPX1sN
	2xTGvlFx2iz6ysCnnZVXmpxQW/fbZ1n2XowK9ep72/ZJiXeVs/aaditV1l+hiigCDA6v/yMIqrW
	Ia4wPAy8ZibnJWCCt8QuZaP/vvZDH5tyjrvNEqfejsqIaEFL4nHRlwiQNHCCOqgcmHXOmKEArV2
	E1EXQkFbMmBgqZHEvyxy7MoNoc79lpmgNYvNOk=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr161743285a.78.1772792885459;
        Fri, 06 Mar 2026 02:28:05 -0800 (PST)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id
 af79cd13be357-8cd6d4afe58mr161739885a.78.1772792884906; Fri, 06 Mar 2026
 02:28:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com> <20260224-pci-m2-e-v5-5-dd9b9501d33c@oss.qualcomm.com>
In-Reply-To: <20260224-pci-m2-e-v5-5-dd9b9501d33c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 11:27:53 +0100
X-Gm-Features: AaiRm53iYOytG8xnHxV8VVUSUeAKgAc5EavTdm2RyqP-mIqV3qUo5jYkbTQaMc4
Message-ID: <CAFEp6-02wcaEYr5BJvqMgtMD6vArLghvw+Lh-YE+OLXyZa-i6Q@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] dt-bindings: connector: Add PCIe M.2 Mechanical
 Key E connector
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-acpi@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kCYBCn_EkNdE34CmtTOIPr8jCF_b69Xn
X-Proofpoint-ORIG-GUID: kCYBCn_EkNdE34CmtTOIPr8jCF_b69Xn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA5OSBTYWx0ZWRfX6p2kk6fatvhl
 mv/TTDPk1+I+srFEeLqYn7Q9g1S9YxyLScW7fcd2WayjdU/Y4nm+NcWwGJXcJC29UONpt9mEqid
 p6+stz1BWvtlYJZxW9BOhxPoo6TJtFUICvsCyBYFw8iAErgE23igtlRb8R8jAs2E4EhhG885M2Y
 e6Usj0wbpovwnb7LGP5vA3mnMsDeqoGyUxn72DA9F0VNJpz4C8wVPBEGfaP2tbnBWUNudN7+sPU
 Ie15oquWqEv/zo93eAOU5AdnmifpHAWL7BbMvbnclWmgU7FG3zHXQNWgLPj5HAQOYJmVYOS2/GG
 5Tiy0MSK2iyRpvqgQ+LL65aR3vBrMDmrXuLSAJvxzaNTRi3AvNkT8TOjw0BhyPACbKLksgpUnRd
 Lvap0wiU3dHQ43ioGQPOZgK7tbE+PZajf2G60FkrtKs7mhNp6Rqd1kSslFNq1T4ajmiSmsLMVjI
 Wv7ydBM5WeBH5eBFZMw==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aaac36 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Aq5ih5MREXdaAn1MBKMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060099
X-Rspamd-Queue-Id: 8971221EC67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl,vger.kernel.org,linaro.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95762-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 6:32=E2=80=AFAM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Add the devicetree binding for PCIe M.2 Mechanical Key E connector define=
d
> in the PCI Express M.2 Specification, r4.0, sec 5.1.2. This connector
> provides interfaces like PCIe or SDIO to attach the WiFi devices to the
> host machine, USB or UART+PCM interfaces to attach the Bluetooth (BT)
> devices. Spec also provides an optional interface to connect the UIM card=
,
> but that is not covered in this binding.
>
> The connector provides a primary power supply of 3.3v, along with an
> optional 1.8v VIO supply for the Adapter I/O buffer circuitry operating a=
t
> 1.8v sideband signaling.
>
> The connector also supplies optional signals in the form of GPIOs for fin=
e
> grained power management.
>
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # ThinkPad T14=
s gen6 (arm64)
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  .../bindings/connector/pcie-m2-e-connector.yaml    | 184 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 185 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connec=
tor.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.=
yaml
> new file mode 100644
> index 000000000000..82dfd776d480
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yam=
l
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/pcie-m2-e-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCIe M.2 Mechanical Key E Connector
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> +
> +description:
> +  A PCIe M.2 E connector node represents a physical PCIe M.2 Mechanical =
Key E
> +  connector. Mechanical Key E connectors are used to connect Wireless
> +  Connectivity devices including combinations of Wi-Fi, BT, NFC to the h=
ost
> +  machine over interfaces like PCIe/SDIO, USB/UART+PCM, and I2C.
> +
> +properties:
> +  compatible:
> +    const: pcie-m2-e-connector
> +
> +  vpcie3v3-supply:
> +    description: A phandle to the regulator for 3.3v supply.
> +
> +  vpcie1v8-supply:
> +    description: A phandle to the regulator for VIO 1.8v supply.
> +
> +  i2c-parent:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: I2C interface
> +
> +  clocks:
> +    description: 32.768 KHz Suspend Clock (SUSCLK) input from the host s=
ystem to
> +      the M.2 card. Refer, PCI Express M.2 Specification r4.0, sec 3.1.1=
2.1 for
> +      more details.
> +    maxItems: 1
> +
> +  w-disable1-gpios:
> +    description: GPIO output to W_DISABLE1# signal. This signal is used =
by the
> +      host system to disable WiFi radio in the M.2 card. Refer, PCI Expr=
ess M.2
> +      Specification r4.0, sec 3.1.12.3 for more details.
> +    maxItems: 1
> +
> +  w-disable2-gpios:
> +    description: GPIO output to W_DISABLE2# signal. This signal is used =
by the
> +      host system to disable WiFi radio in the M.2 card. Refer, PCI Expr=
ess M.2
> +      Specification r4.0, sec 3.1.12.3 for more details.

Just a small nit: according to the spec, W_DISABLE1# is intended for Wi=E2=
=80=91Fi,
while W_DISABLE2# is designated for Bluetooth (Key E).

Regards,
Loic

