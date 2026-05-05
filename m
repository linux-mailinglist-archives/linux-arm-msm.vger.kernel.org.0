Return-Path: <linux-arm-msm+bounces-105964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPAwJNvt+WkLFQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:17:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1F4CE4C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C0E93046ED1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 13:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EFB2E9757;
	Tue,  5 May 2026 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPFtpj7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVKQ+gMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B78D2EDD6C
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987026; cv=pass; b=ofcb6c16tZvzPUI0ikg/Iqg1pfqbUhqunBzB44Mdhfl+iFw9BTHN4Su35jGbvoDb5Sx5EqxR6XJA3Bo9y75g+Gn0iSngAZcV0q/UKOR/ul/lrghiEBWE+OtplWYym6DpSvB9idcf3kRI1Lhm5cFH3YQ1vw6bRXmvd65oyaOz7wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987026; c=relaxed/simple;
	bh=RINXaIomji3Z5k68WUVEnL93Hz5H4UongOpfpintwjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujF+ON1RNFTiM20kw5xpphLnhDgcgW2jlWR9iFjJ7mOb+gsG5/uvwcLhxgpjzXib7Wjbqbj5SUF1KsuBSeBhC4sWwWBx5bUqJE1UH6LZCniSXty1DVoMJ3T1Ux2AScOS+a1/B4pRyhFfzfGaXqSTncfLi1O1BiLG2i/Q45CGEoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPFtpj7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVKQ+gMa; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6458mve61346170
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 13:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=; b=EPFtpj7YXNJxCs7X
	HJwZFiVLoYL6T1l5DiF60DoP837ay+JVBPpk9po9f7fDQ4tsGp0eTtCVyAEr/mnm
	CqXSuSleUA/r38a9U+iEwWVIx4DOr7BgOHdTO7H68+6N+wem0sD8vzgq9fiZpckp
	1vWFHhe8HOUaJfEJ7x7pnl2CyodAN9Rd4rzmKEaofo9HThcwAyHL2Sea14I2CdHv
	DIg9nlmSeHY8rZv3cVyJJuWH7pmeiL3P/u3X8ltmyuhtlOSIVNeVC6cUrRRrHDE7
	KiWzC21NKF9EDEGlgV4SOWXqA+zP+3uAsmZDif/ODfvfQh47VftK/nbBu/J0gbbE
	//GMEg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xc6bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:17:04 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-950bdef305cso4611853241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 06:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777987023; cv=none;
        d=google.com; s=arc-20240605;
        b=JZOtOmZLUCCOkqxSDEjxASff+nbFLVeEBOi/6UpS17otM5UELjc8CJoz5xcplkEFIs
         HzygFiRSv0EwmEqdC8yrz0+iVsgw5HRtQbAqhNimBZYXD6mX79b4doiN03Yzb5bOhtIQ
         0SNdaRGgfLHc9TryIHrv9Vsclf76HfFxYQ+16db10lLTKFhBDJaEujlI2ywPq42P66b5
         aohSCy/Hs3mUuPkJjyMGGyoNp82SBMAEEloV1kToDM5eSQBfDyFXDWCC+Wb9qWCfz8Mz
         oBEGlU/xcjjPwIc9vxya3kqKR0FBRCesKI+Z/l+VF7+RLIa/HHWLxJM4vmde9EhVnm19
         +LtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=;
        fh=nrJBRxmlUa1at/Xc1I5Lqc+inYUb0Bb9tGQIWrMLiHY=;
        b=Ypam1OQag1euxfteW465zBnqo/mieFmqL8P2Uak8uccIfIYfMQwSyUAHqveWsDW1Zz
         52icTZw5HZnxvkGcvYJnYzr5PPGEvdnXW7LALe2pqrud1/bXUMzBe9NDAj/G031X8DoI
         5HzX1bC/3XUOmmUJC7SeCdNoVOCxkkb/RCeakiW9Zpri7P53ZLXovjzt2/9QkDiyRjIA
         60ptF3cmFZCYmt3sti15SXuczvPcWlyv6I8r+wCcnFrsTuzsp05ZmqZn5ZnrK4ZkkZOe
         G07JB3ica5GlsqRBicYM+lwIuC0uikthUSo328nW/NePivoYZBaeo8u/lm8RMd/wisQ2
         5Jxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777987023; x=1778591823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=;
        b=OVKQ+gMateW+W+JifJeKvOFvIRLK9xJl5Oa1+H75KnEmWvpeVlwqvsSSxaVXdNZ3ke
         G0EmyWm5f4/FkTmY1YChRlbP/JiaPTm+pddUg7YWGdI9PlhJ7Gc0RIo8tveRNt3+ECDd
         bKxEXZCP0V/lNJiTwQ68gAIsouti9Z5iTuOqGycheCYKEeRHgQW4ogMt72ZlgGLRA6yX
         xblRKlnSceiMyNuvRlgGea3W8ZUqkSA0P2CSyRhKgkLkmQ1Jwu1cBpvrTcmh7yDdxkbA
         KZxePQ+M3DnbZmK5rFdmmDBrob/l8QQSPCp546WDhZ+b5YHdW8WZz6O1eBIwwg2giJON
         +p+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987023; x=1778591823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=;
        b=VuLUwKxVdOPsXDqGuTdKkmzNwAPIEmFAp4V3dSaPj6pnsnXAuVoGye80Rri6kDqfKX
         bYN7OPbmbiKDU7mewf+YERgrEGaEan+diwRgbBYtxJU198KsMVxgM78IOHasgeWmHO/Q
         22ZkdIrVwOWANsCt0Qp+rZQLqL9bcY//pQ9upu9aBxQlTgXSw2pRrNOkeVGvPqMZof4V
         0teJRMxeGJF9QUaVRFauZRu3AWJ1KQubwhgnFNnMP/oQSV7QX+SkiFIAtQAyBAw2+PpK
         630IfmfjZoCGTZpGxnFJjR/qOuhJ9eWqH1ysL1UI7syjLaura4dG7G86njGGW7qx9TPP
         EWBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+PLNSqk3wG2k8ryih66qgBWi9wofwbqg5mmJ3U9VBbj0xK+OKcIhpfpBTm51hPvf770KpUZ1+ifts6OCS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc+Ah6JTZcV65GW7FseeA3ZOR/Ku/v6oHrn6wn0t8t6MFNuHh1
	wlMRQSbUpr0QnfFsVk+zTnY2ORfBn7i7ouA5O1t19QUMgjT+/cNb538PcyERGVLBR5h5knHEzaU
	77C7hbr4IzoRA/kCviTD3Gwx9iq1wcSWt3pu827ehfl5t4QlkUxitBy0e/VGpKiI6oUTApWWqdp
	oJvNc+puca2FDD7O/pD6cAanEsSEI3Eef+f/sBi7D72/w=
X-Gm-Gg: AeBDietSGL2NVanccFkHb/KPgJPSczkmXmvSXwEdl27c5pVNPjbzDsFpAAWQ5+yJVA2
	6fkHG2JwMfmYpa6+jY3Gu2z2Iy94GzMrB65dVRHHMnEUnbuCv7QIKKCs3hoT+xJfJTXUBwXJrE3
	okxExShRI3KRh7xdXoT3es8DperI26V+9Vttvw0Bbd+CqT4iKD0uuO5Om/1Jrpn45UjlpImfDdS
	dYGLKp+gUDuJrs2GP9hJDDXSxigelf54ggaqyB2cqsBKf01Q/OVyFLg8lCQagoztj63vXwJ1kJP
	C+I=
X-Received: by 2002:a05:6102:5e84:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-62f591e15f8mr1334697137.15.1777987023160;
        Tue, 05 May 2026 06:17:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5e84:b0:612:7ddc:52ee with SMTP id
 ada2fe7eead31-62f591e15f8mr1334635137.15.1777987022558; Tue, 05 May 2026
 06:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
 <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com> <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
 <0c6c9366-a190-4143-a0fb-2aff38ed8804@oss.qualcomm.com>
In-Reply-To: <0c6c9366-a190-4143-a0fb-2aff38ed8804@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 5 May 2026 15:16:51 +0200
X-Gm-Features: AVHnY4LGEhfsUlkX4TOjzlp790x-TMEYbGtYBxNjEt1Hs1iHIIf3wT5xSTTbtjU
Message-ID: <CAFEp6-1uDO7UzYm+5ejRH0fCtnFZSA3z_Xa+4ibDEbXBh38ueA@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9edd0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=_2yBmY5WZcee53Sj_MsA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: SIZnY8xkZO9j8o_QSpR3Dwub4vT0WcPN
X-Proofpoint-GUID: SIZnY8xkZO9j8o_QSpR3Dwub4vT0WcPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEyNiBTYWx0ZWRfX0KQHRZcLtcOo
 KGY49+6TyR9wI3U1j2kQgV0cB7MuPDjpsBrSb23ySCn06qbBv0jc8ylScayZzQ6xomQTgyw0o9s
 M814ZQtjiEImaPzG4XY2NKrysq5XyCCaU3SvPVKQxqTVl4kdbfSX6DiKBLBXE2bWsP/PBDNOIQ9
 Z4/g4xz9JPwd/OAZNBRFAdtY+kuV6R+blc9Q/DnUc8P+uwood7b/tMNtayET7a7szxqURL2MHwO
 e8GKCgoo+78BxJW5MqNjpm8CzZr5GBhX9GRieLRdB7ZHHlQKDpZcxvrov0aZ+gVn0GwMZ4OvF1J
 1JZSC1rGD2ueDuFMrrJVkfnXV+4JE6nguho6acJl5oXqUoI/I+txyC5he1BZGRgoHcLOleOTik4
 V008N389c7wazfU/3UH0vPz4cE09f7pnWM63+b0S68foqKV42Dp4P4ks7L0q73zejBReJ7ncnGy
 8lBgE2BozFd065kUDMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050126
X-Rspamd-Queue-Id: 26D1F4CE4C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105964-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim]

On Tue, Apr 28, 2026 at 12:16=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 10:33 PM, Loic Poulain wrote:
> > On Mon, Apr 27, 2026 at 4:22=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/27/26 2:43 PM, Loic Poulain wrote:
> >>> Add Devicetree binding documentation for the Qualcomm Camera Subsyste=
m
> >>> Offline Processing Engine (OPE) found on platforms such as Agatti.
> >>> The OPE is a memory-to-memory image processing block which operates
> >>> on frames read from and written back to system memory.
> >>>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +        clocks =3D <&gcc GCC_CAMSS_OPE_CLK>,
> >>> +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> >>> +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
> >>
> >> Should the two AXI clocks be aggregated by camss-top instead?
> >>
> >> Otherwise we run the risk of the OPE driver setting a rate of A
> >> and another sub-device setting a rate of B
> >
> > On qcm2290, OPE appears to be the only consumer of the NRT AXI clock,
> > while the capture path (VFE/TFE) relies on the RT AXI clock. That
> > said, this may not always be the case and these clocks (AXI / NRT=E2=80=
=91AXI
> > / RT=E2=80=91AXI) seem like they could reasonably be managed at the
> > camss-bus/top level.
> >
> > The open question is how the NRT AXI clock should be enabled when
> > required? enabling them unconditionally (similar to other camss PM
> > clocks), introducing a dedicated CAMSS top=E2=80=91level interface for =
voting,
> > or leveraging an existing framework to handle this?
>
> So, interconnect, or some internal, smaller version of it?

Downstream, there is a CPAS driver that handles these clocks in
conjunction with the internal CAMNOC block. Dmitry also mentioned the
existing icc_clock mechanism, but we likely need to investigate this
further to support proper dynamic scaling of the required clocks.
However, I don=E2=80=99t plan to address this as part of the current series=
,
as it would significantly increase its scope.

I believe the current approach is acceptable for now because:
- This NRT clock is required by this specific sub-block, but not by
all CAMSS sub-blocks (unlike, for example, camss-ahb), so referencing
it makes sense here.
- At the moment, the OPE only enables this clock without setting its
rate (i.e., it uses the default), so this should not conflict with
introducing a more complete scaling framework later.

Does this sound good?

Regards,
Loic

