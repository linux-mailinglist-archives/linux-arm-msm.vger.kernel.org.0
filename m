Return-Path: <linux-arm-msm+bounces-99715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMdGHtHQwmnRmQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 18:58:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A1A31A68A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 18:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26EF4302304B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C98F3F211A;
	Tue, 24 Mar 2026 17:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQbjlWh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKCsnuKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09743C8715
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375047; cv=pass; b=Usv3OWXV5ezvdlqodK5TuRPMCksY5AZpteQSXcSSCvL7ftJfyuaLawbmK1qDYxTxcpTfa4uAgZoz0tQruyCEQ2AEflJ08R96Tk7QE0O3K2Ipamxon4Fh8e9kX8H65ob1455fow+sv6ro7GF2O5ovsqX1XqOGbCallboicGUvZfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375047; c=relaxed/simple;
	bh=P876SDWXfNIY+Kam7DlLkRPoG9h4PZWGuw3/fAEWziw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXSLBGjQu3TcVdlxpecVjovibMF8QwehqtXDkVboWaPLK7bizyfBta61KxHlfrdJ2hZoZrx+rg9HBt5oBZH1Md46l+wO9fgcIugtRXKrlRcAw0A59i7eQnPGrKVxyZbQkpSZjTGGECd8Y8vfMBvDLcP+o+oORVuzHaqax2VNjQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQbjlWh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKCsnuKZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OFpjMw4059466
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeYF0wlguGNZoM/Jg1wXIhP/HcQ07aj7CpHVDJrfU3Y=; b=oQbjlWh3znLVDZDO
	xcc//1FgemEtF8pv62YlSU8TJ1Yb6BWKIlJC5F83me6bQgVgmVwgH/FVx189yS1I
	ns5/YEJxwnR/lxe7LGgBSYijzA1Dlmo2kkQovSDhkTJtazo9b4ifyfZCcQzuiJXf
	s0DjNobTWLFSHNmhfDKsrQ5BnJr2SzYIk6PlM54kSQdt8BtZ9FZgZEKJ/ubf6DhA
	+o0WhiF++JmcQeW8+BYvd6EFS1ontOQ33nvVc8SAIg/OO4Pa4JO+dFVRkInnhCmI
	7VQBZEXMa+x2MMahpK/QbZB2KKA2ee/LNQa7d/FBedDzMJBTBl4A7S520/U86rSG
	CDlY+g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsku795-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 17:57:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35be4ea8292so3387788a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774375045; cv=none;
        d=google.com; s=arc-20240605;
        b=jCyFXaDvy56N9r38G+apbApNhoUwicqumEd2LcTDyOm8P2yWspdxkp4mTvhs1m1UFz
         TrYdDbbrsR3yjnUurEXxc+qNVK3rdQn5dn/pCIkQ8MXTjv8cO/67WYqzqGPWyOnpO8/f
         fhkYBWpfeRqIxXyDeZ4enZrQ5t7nMwlVYcDBGmziM8/8oOr/3jspjNPM7ZrZhz3VxZd9
         t/yCyTI1l/uT1YzQPWI+G3+OCqy8JQTMbfjXEuXzmi98R1Tn40EBqcV2zGF1alIc27VS
         xIGs8anFx0JzMd5aIFwHtRJQ+sAnriUFk1+figYly86t7opHCxA18mSbH9zFlsf99jMq
         1LGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UeYF0wlguGNZoM/Jg1wXIhP/HcQ07aj7CpHVDJrfU3Y=;
        fh=8Ad6GnCDDWKb9iYL6dA3ZMqoHTC9MeEhZ/so7BdlZCQ=;
        b=fjueNKRNJvzK4XFf/nJf4F1jYhtZ8htr7EmIOWWMFd79+JjpFd+6nWon+Uoi8C5Xwp
         xqwK5pXo/gPp7lTPtPXisUwL5Vphy/TkPK1IcC5wtN3IzlvPpKC15FqWZWiHlggrEZ8j
         vqDn7K2XAfikmohj9E4H15g72U+r/TParNNcNJgcRUbmYqOUqvoCrHbNl66Kam4yPCPi
         77tUKHVi8x7jEuSQw0CM1VqFDtKG2Arn0OVMwSc+p495YdYnAUBvSwZ4XrfUqoyVcSDZ
         MNjgjifphL6jy/U/AST76oa1m6yG+r01zhVSHvEpyFIDmJcRY7BVzYi0e29Px8EEK1f2
         u0+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774375045; x=1774979845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeYF0wlguGNZoM/Jg1wXIhP/HcQ07aj7CpHVDJrfU3Y=;
        b=GKCsnuKZqUEfrr3JXup5IJ5XUO2q2G0R/YIqYAjbYJitl5/T3Oal36ODov/TX4HJ8E
         6+IXLbBrUjGegq/+v0bI22FhMYa5QI66sibYADmgypQvBPzOsG0hw/pD859bf7Mamao8
         6lsQaAXS/CsC6pkvFjO8B4jn+4oGVNDUhNdryTLj9RwoKQJGb9EFYZuCNhZWRVKj7Hl5
         RA26/ffw1Ald8T0VkInv6OvvI5NDDQKW7P4EZCPS5trXrfpmTkP4kI0t+T+xoayWnHLN
         Y83AoAYYKNxH4t9+Sf0VFWX1jBP3Zg/D1J6988CXNTuj1XMoTBMLi0UgjgcT/hYGYxUk
         9rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774375045; x=1774979845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UeYF0wlguGNZoM/Jg1wXIhP/HcQ07aj7CpHVDJrfU3Y=;
        b=IyvwQ/tVKwChrvv7NumZga0vPv8ulOzSQ7svS8vcZ1xqXhhYUMOPeMPTx3069H2o5J
         vvAjOjGaseoK46HmcHMOsZiptcKJi0TjtCpbFfKbTQorI2nWmX8IxjouIOTQdabo0q9g
         8HxtCWF6qbTDjitP45WQO51925IxKwxzz4av6b726gMbEJLrhnmSGITCDgJR5NPnzdLo
         m+biUiRPtEvZ8w9O8120ICkMXyynXSgQwfhkAh+Rh+NPHEUwfMNo99EUhxsfbo8fKR1e
         4kOgkqPoSCLu53lDa5ySjyFmulDQt+s9nDKqM+9vVpNi3Zf9vmQmMJ7tUYM8uY3kbcoi
         q7qA==
X-Forwarded-Encrypted: i=1; AJvYcCXfA0+lBJ6noLb1yDE4tGyUI/GUkcesGAz5yXvZl9AxlOfajvDOD/nnY9Y9Wm8CPk0+PMNIASbodgX+0KDm@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3088ecIscLDghtTOxkDdjQyo2WutFDjeEIHGLQ2Vspjhjm+q
	CB2T0b83omUvy2HkR1MEErbHJmliYymW5TzY1Iw2oYhH7P/OR7C3UEkMHV1penEKmQ+OAIBFMAV
	9Xz/NZzDc+SrT+iZLN0v4li3ktzdaoiM/K5HQRvbeo14bu8QqPm5Bvnrfvj8eX7C2InERQPJHeK
	gU+wwHfJKc1aLXgS7FpdmXxZQaA3BvjPvOw1L0tmZBTwo=
X-Gm-Gg: ATEYQzyZRqLVmosPDADrYWQjSkKD5rcWMLLvO9zPl67lC9d4PaC35zydgOnp7Fpgi7d
	PSBXUmF0AIBlRoC5xjC7UQXU6b0F0DtBMR4QSHo07lYQ8kcwaUVI8df8GBNH0nMoB9FER14jizb
	JNWakkNBrLoTcBalecJZ2MU8wdVjQWJMXFyJNC1m1Byj236NsovRpTct7gxDNv+gVQK9CidPvnf
	zeuezs=
X-Received: by 2002:a05:6a20:734b:b0:366:14ac:e201 with SMTP id adf61e73a8af0-39c4aec94bemr550728637.63.1774375045288;
        Tue, 24 Mar 2026 10:57:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:734b:b0:366:14ac:e201 with SMTP id
 adf61e73a8af0-39c4aec94bemr550704637.63.1774375044796; Tue, 24 Mar 2026
 10:57:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com> <20260324172916.804229-2-elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260324172916.804229-2-elson.serrao@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 19:57:13 +0200
X-Gm-Features: AaiRm53AshzSNeIczdXwH8Gh31QMXHywmUzyBlfAKx4t4rHTI58txnC5AXJZbSI
Message-ID: <CAO9ioeWxk_=HowH-FcEakL4EXFyAz=dyPwEpqSXPQfvmuvfPHg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_1=2F1=5D_dt=2Dbindings=3A_connector=3A_Add_role?=
	=?UTF-8?Q?=E2=80=91switch_provider_phandle?=
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEzOSBTYWx0ZWRfXyi2YOnSpVuR6
 XRbLi6/ZERQ7FJ5sHshq6XfPqj9sV5ULEFhWvuOydss2bGHYrFYZDthdWog7izjT5XLRbA2xYat
 vcje8f0SeAQKr2O/EcG0qyrhHVG5fXnlEBvuXG+x5tqXAfRyG+545WEnJLYaoTC6l/egJFJQ7Mz
 uQQyOpfWi/0Tt0QbmklNa2irl/e8jTbQbWU3HRGAdiomA3pIDI5S5MvBs87JxWdnYX0zyZAlAkM
 TO4rvZZv23bjxXd1bzRynaaukPUd+XC87vQtHOwOVY5ufTUGW1PyV6HMrg4tJny48TKf9ZTIgXB
 Wyxc6EQB/vdmTX2s+ddUKoZzybIZHPJfvhpxe8hIMAchzFivUh5wzzHWKA7fFeiOdfejG0tgqix
 Q4FIvuc7mjma6LXQUFXZRODXgK0k5sfCsoJTF5DSoIlBuyJdMICCd4sAGfuB9EwUx4hEQtm2b11
 zYZ0T/7Ex72AbWYKr4A==
X-Proofpoint-GUID: xvB90Xig8zJkmAEGgyiQ1vgZHlrssll7
X-Proofpoint-ORIG-GUID: xvB90Xig8zJkmAEGgyiQ1vgZHlrssll7
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c2d086 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SbLLz8eIMczvZioIoHUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240139
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99715-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: E4A1A31A68A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026 at 19:29, Elson Serrao
<elson.serrao@oss.qualcomm.com> wrote:
>
> Add an optional consumer=E2=86=92provider phandle on USB connectors to re=
ference
> the USB role-switch provider when no direct graph link exists. The DRD
> controller remains the provider via its 'usb-role-switch' property.
>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/connector/usb-connector.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.ya=
ml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 11e40d225b9f..ef8d3d26461b 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -95,6 +95,14 @@ properties:
>        - device
>        - dual
>
> +  usb-role-switch:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the USB role-switch provider. The provider is typical=
ly
> +      a dual-role (DRD) USB controller node that declares the boolean
> +      'usb-role-switch' property. Use this when the connector is not
> +      directly linked to the provider in the OF graph.

This kind of properties has already been discussed at least twice:
- First for referencing the DisplayPort controller from the AltMode
node (USB-C connector)
- Then for referencing the USB-C muxes / orientation switches when
there is an intermediate chip

In both cases the agreement was to not add such out of band handle
references. The solution was on the software side, letting drivers for
the intermediate devices in the OF graph translate and resend
necessary events.

Previously we didn't have such an issue for the usb-role-switch,
because there always have been a direct link between the USB connector
(be it gpio-usb-b-connector or usb-c-connector) and the USB controller
(implementing usb-role-switch). As with the EUD this is no longer a
case, my suggestion would be to follow prior art and let EUD receive,
interpret and resend usb-role-switch events.

> +
>    typec-power-opmode:
>      description: Determines the power operation mode that the Type C con=
nector
>        will support and will advertise through CC pins when it has no pow=
er
> --
> 2.34.1
>


--=20
With best wishes
Dmitry

