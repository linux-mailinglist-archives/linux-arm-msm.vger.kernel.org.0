Return-Path: <linux-arm-msm+bounces-110301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MORDEUyrGWpEyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:05:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E560438E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67CBF301C597
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672503F4107;
	Fri, 29 May 2026 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvjaNbGy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdsmLXL1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CAA3F1AA8
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065970; cv=pass; b=SlM4X+dUhReyIRmFW509DyoQqHdsPbaOUssXKBP8O/UuxqBIZBii9F0XW1tGLpdo7jK1rwaHggu1mw24LGrwsCIsvsCdap02IeyJXNHnbrz7R03x2iyU0rJy3Nt+fPyTlLWGQV4fi7OltNFNER8JsGk7qHkC9QLO4TnK1/Tbniw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065970; c=relaxed/simple;
	bh=ujCYn817iX6wlBEWzpPBEDe4rtEevi5+ZUNJsLLv2oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGoT2Rgm001ebIGwwOMsklSiY0wNAqGfUgYxH4cT4sKH1lROEWsenrn74E55YiWWpbFsdEgsv6ZaNo3pXQyLVLnBdqHW616KmtdFCQcvgY2WJX1gMQhG9NwZSJUBSzi3U2L3/q0t6hqq6f3GkhYXH59/ohaFpzvmkLxqV9N8fuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvjaNbGy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdsmLXL1; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLgkv2748160
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voUJObYcKin1raCObqToYyhbjwo0Gb69o1ZFsTElHNc=; b=gvjaNbGy9OG7lgC+
	1XjNFFrJei/xE63AvWA+ms4OiSYfmg0+FVGVDmKiL6kAE7ix5pBZoNcRwaFFsJDa
	+HGGvn9bvwfKm4rNUf/W1V4cGMH0hnHQz/XSMW/tTCi4j4Jx2lHpeBhBWh09nICg
	1z+rKmsEaL37efwt8dBlePbMZMjvjXgGkRxf9xv6Y+eXBK9XugZrXkx4xS+WK5Q1
	2AgQXcm7VC1sbvA/MLZvKgErte5FY143Tijk+3+xo3YZm5Pyh/6L3W1twxbrpq7S
	RwqzLltfBHsgBkMjoYrVgHooE8qatMoRKKwck6DHGM3Pi2UAIAZDgr6OKaj2D0k0
	FagbyQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug43yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:46:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cce230de8bso25698846d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780065967; cv=none;
        d=google.com; s=arc-20240605;
        b=hXihJBR9iTNgKXzY6latESBmRXWH6vUgccXhxq6+B4zF36XmrUR31cR+5I03HtYiQj
         zvXjIGN5DJEfLGTRp6Tpogcy5M15AkdLOlHfUDtWqYdF/6+g7Bk+yPRO8Dh/HIzQ2FDi
         jTR7q6zunB8eAX74JlqflKsQP2S8fItR9L1wfnHVThEL4CkP9Mh5LW8JdIPce8tUEl3e
         CeNVEnaPMFkpq+VG0Jm3gmogaY42c61SHeWjxfvY+tRhEgBG95BxA9YEKxziOh/TgzRl
         DxF2RQzSNAWELU/ABl+Zp5fVSSphZxJ3rRBmW6rK18VAZt8pRMFfXXBQEVHiUIhJRZIc
         5dWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=voUJObYcKin1raCObqToYyhbjwo0Gb69o1ZFsTElHNc=;
        fh=txMMjYvXjlgN/q8PKMaI9frq0RibldGlZmuFTdAGqzY=;
        b=VYQD+dHN3WjVFPGtmqRoZOQh9N8CpzwCPAhPurqL6bG0bspw8Ew+XKhAylA3aOKUpA
         4vVMp0V0tkTSAkz5dt9UVW1/IhjjkZQcf6fxEnvEFOigDWNhJGMe+LCzmvGAhPS/EMhZ
         n1IRxiJOKhUfgTjHyJ397/JXcG8VOnohcYNKL1k93PtxfGdM05GzCoiNFuRlkxdOJJ2t
         ka4ugB7opqvBpgXQ7yybAAbGGDuEF+6QvLv49lqNo7kOxJS2Xgsuu3I1UM0Lc32z2Usx
         t7ugTNdbMV1ypzs+eoieXxK8kPSSsXFi488WmG1exDTpws+GsGpPWg59f04mjsSmWQTv
         oKww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065967; x=1780670767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voUJObYcKin1raCObqToYyhbjwo0Gb69o1ZFsTElHNc=;
        b=gdsmLXL1o3n2VUCpZex7dM82iA6UDdpimAAk9EEXZBMEZrBvNs5Q0JQs4aTyMkPiGP
         3hCs4XpRzJw+wonztg1EafKoxCpHnBDAliEe0yeKo3be+U2G2FWEGNKgc+WAHWdhXy90
         qo6tvdR2Pf/RnmmuOZMCvmkncFK2GU0DFIHzE7qoedTrE3gXO+7FUyyMxnbbTbGcqgKR
         nJdwaWHfR9INM1z7D0dNL2roTauJHtlJ6kTA9XVAmQyiANX3cl/KsTS4Dp8fG9ytYBP7
         ZrVJOv/lkHj5S+bp1IcKh3fWtdJfUO3f0iWjyzWAwgaLskTujljDY2IH9xZvhRrKDB8g
         EtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065967; x=1780670767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=voUJObYcKin1raCObqToYyhbjwo0Gb69o1ZFsTElHNc=;
        b=hXrZqdm/3IqSYTFQFniIAearFELh9DZWhL8fkNvOWDKVHbSdwvm3gwBlHF5b2xqqaj
         MCb7bxpF6BZEX2egq0AU8Q2oEzebgwhhE0MUud5fDGGCGPYv/2dW3SuBliZYKVJEDium
         ixuQBK7Gf/k29npikR60Lf9D7ar0b7dxrvaUHQ2CpmMKmgDIt/vQa/3KEfzswSrld9EB
         qPFShoaOaOvTNc7zwzqks9ks/Nj+Mz2TNG7CFVBtrLTCjSNSrIMjHEm9AgzuSC64qp1f
         zhRnyPEWqV6yyvuPuNVX6QYed/3zqwzwL7mLhT3Z7TIMrtXGi33Qkm/2ZYIuBNNx6Jpw
         Dfeg==
X-Forwarded-Encrypted: i=1; AFNElJ/flSPZB94pVJ+bxZ1uboxKTabq4/1NlF62aN1OZmwuWSH3g/wvg3hNjKVb4IhYqIK8YV4EIvnoz+PmU+zt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0IWz+yuYKlmgarhwkBe3FOmRWmZLiEl0k3oXdfpwcenI2+FGt
	RZclAFAq3REFk3E177Fmnp/3Kxaa4r/x1fTKTX12ucvdGwlQQDXUKcl0ATytZiQ4pUx6Uk7LKV7
	OnT0+bEtSKmxUqc8KULrGdvKGlT7OMNqlT1DZEwrTrKQ/5MR3u+kq16JeLlUS0zzE25tsTww0RI
	NtYtBlq7nsVwbQbQEY8/NpC3JzYS7jun4S9tp2jSJ1wRA=
X-Gm-Gg: Acq92OGORpLJeI2blktxk70lTg6hUUp+a6YebYJI17bS7ns0CGeIPm1BlImKwWZHDyc
	hv9kmh/hzOSJfbmx+KqfqPoILJNHqaHkbuFuxdFUHNhDjPKxiliBrhxGJzPj5SDObe1AQohcisS
	osGIbP7fUilIIchYTpP0G1FqOWX4gbLBfT09EuO45Vc42XtQK9AB3qhpXzmmg90cHGD8DS36Sve
	RTAMSHtlBqqGx8Ajw==
X-Received: by 2002:a05:6214:2129:b0:8cc:611f:197f with SMTP id 6a1803df08f44-8cce8273b9amr40421456d6.44.1780065967446;
        Fri, 29 May 2026 07:46:07 -0700 (PDT)
X-Received: by 2002:a05:6214:2129:b0:8cc:611f:197f with SMTP id
 6a1803df08f44-8cce8273b9amr40420966d6.44.1780065966941; Fri, 29 May 2026
 07:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135342.11678-1-manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260528135342.11678-1-manivannan.sadhasivam@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:45:56 +0200
X-Gm-Features: AVHnY4L6MWNB9ipo3mmpNNI-uKAIfhPINhRgf_XrDuSat0AGf5o159oc_oNQjTg
Message-ID: <CAPx+jO9782bBRuMAsJBgRc7y=THa_+48hY8xPieZAB_3dWeaHA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: sdhci-msm: Rename the binding to
 include 'qcom' prefix
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NyBTYWx0ZWRfXy3LzZUX6zb7q
 nyPBHWqBfi4mr27+u3WhQIBuNLMfvd52066faOqkHhqAe5bXFzkHcO4SDukzt5KpNwT8oOcMJuI
 hMfTbSTyxamYEbaEMC7E6wgrkolt+moouKkIS6K+jp/xLxwKsk+/GnJ1UB2R2EB6Zj2YpsvJ8xT
 ow98w0qv1Bs1GuLqQ3ctDaXuEC6pQ9TiB6ehu4ofNuXsWeEKFA+B+jXzkUwf28if0JntLDbVohn
 cl4jj1Jap24vS/Te0D3eYLvSVpfCi5c+jugIUYxHzSzWDJ7oqB/xLtiPE37b5SUo1yEImPjgZd/
 rJctBq0QsmSSXvd5AukHlZhh/6tg5TTMpVL/FeWWtH5hmk7m+Ovh9o47S5BAPgbwJwn0rJiKGoP
 UVwY4v8KwmvNymXz8zbZiMTU2HvE0wxB4BXeEYENS3qWZ0m+ktLBNxetPmfTFPn2nuo8sy146TT
 FiJpHLqrTGuRBMSgCBQ==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a19a6b0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8
 a=5jWyPAnK0HxrPH3f6sQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: Ej3p5BMNn5MToeU-882Xg3VzIjClYfdC
X-Proofpoint-GUID: Ej3p5BMNn5MToeU-882Xg3VzIjClYfdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290147
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110301-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9B8E560438E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 3:53=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> This is the only Qcom binding that doesn't have 'qcom' prefix in the
> bindings name. This doesn't match with the regex in MAINTAINERS file and
> the 'get_maintainer.pl' script fails to list the 'linux-arm-msm' list:
>
> Ulf Hansson <ulfh@kernel.org> (maintainer:MULTIMEDIA CARD (MMC), SECURE D=
IGITAL (SD) AND...)
> Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEV=
ICE TREE BINDINGS)
> Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FL=
ATTENED DEVICE TREE BINDINGS)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENE=
D DEVICE TREE BINDINGS)
> Bjorn Andersson <andersson@kernel.org> (in file)
> Konrad Dybcio <konradybcio@kernel.org> (in file)
> linux-mmc@vger.kernel.org (open list:MULTIMEDIA CARD (MMC), SECURE DIGITA=
L (SD) AND...)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE =
TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)
>
> Hence, rename the binding to include 'qcom' prefix so that the regex
> matches correctly.
>
> Reported-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/20260526151003.p4kn2vek3hpv4gzv@hu-mo=
jha-hyd.qualcomm.com
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../bindings/mmc/{sdhci-msm.yaml =3D> qcom,sdhci-msm.yaml}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/mmc/{sdhci-msm.yaml =3D> qcom,s=
dhci-msm.yaml} (99%)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Docum=
entation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> similarity index 99%
> rename from Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> rename to Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index 695a95e8f35d..cb16c08d22cc 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
> +$id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>  title: Qualcomm SDHCI controller (sdhci-msm)
> --
> 2.51.0

