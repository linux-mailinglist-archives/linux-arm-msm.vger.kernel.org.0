Return-Path: <linux-arm-msm+bounces-114019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /OqwEghCOWrJpQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:09:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46C6B0307
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:09:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="OwaS/eYc";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q5wPAl89;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114019-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114019-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51035300789D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FFF3B7B7B;
	Mon, 22 Jun 2026 14:09:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57453B777B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:09:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137350; cv=pass; b=C4m7uc8/tXPUUOPkIHX32hGpu3QoPjLIsnw8qqplwEnSCyjg1FtL1nmtQHg5Ds5RJS0F1HbFzWJdcUdKsI7A24NiDJlRCgZZsYbYwCV8rPzoIEwjj7nX6oPOj2+3UXMoh6YuwlcqAtSLUTIOhJtDC0s0fqIzuqBniO5KPmvSyuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137350; c=relaxed/simple;
	bh=j0PcU9FA9y/fGAXF5DL6Fd9e9DH01a3HLpwe/GGgy+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeBWiRu0TABZ+KJ0kM0Bl+9awXEIFH6SGWmIZCkc2ric0GZV4aDMEpjjX6BEa6bLbftmVsP+9AHsqga0rjmj8Dq55ccy4CVFE9Lj6a5mj1YhDRYaFNEfX5nMQSyFbpSE5RD9QedpFZZc0t9RDQMg6pTv5QIvwRwyZj6lFk/zyac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwaS/eYc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5wPAl89; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGLuF1338648
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8F2D2XJYiv9t6673rlEnIKYq+3oUjJnSIMZO2qDauaE=; b=OwaS/eYcL/DzLaXf
	I1rZ9Es8Me08EuamKRhDMc97a6z+fUKPBv6jqxHySXCmkt7RTZjO54SMk8ZST7KK
	/Riyy8mXHLFXsL/S1tY75ARTSoyvAKxa9+ptc+0wpmJ+ncL1xfHzMEujzXFt0HuE
	dQbUAu6CVzDaVj8uDX5JrVFUKI1oS7dxer0A4qU4qa7wLBDEfuLGHrNEFllmcZdh
	uWDX86fw6cB9+VOjFfHfGB2Eb3TksgAmgDjcMz3L3fBVeQYEhJvC9vm5uaqpm7Y6
	Xv/7ScvPZ12lQWGnuCLLxDzci2h2C4F1iYNtjslgxLRMjzhMlKcHXB0muXIzcIMR
	Ttt0DQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37h8rpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:09:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966db2071b9so5361063241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782137347; cv=none;
        d=google.com; s=arc-20240605;
        b=cSQtco8aYsEVtpFxB8Ar2jrLSpBIeWwsbblWCS2YE8XlpzC4AyWkIBdhedtlhHXqj0
         sGyfgAJUooVKGRGxEy75Sx+yks+MWrGOwAt3miOY/4qf072nLFgte/+1QPOSeWSUHPuD
         /hTvWeexpFq7n2s0u5TTp5pB6XT/IOvBcvNBhKCEcIsZnT0HpeHIAmoHPSo5M881YeGD
         oXOruU8TMVnIbNL3o+Rl7VtZCPoT+FG8DeASnf9foD6+6SRDG1mUI670utJqbuoihBcc
         PZGooEc/IewTz3JOpOK8Xns+hE/DT0GbDnvAJFPhbBUtYAGYdCY8akkGUnLvLyffI1Ze
         kDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8F2D2XJYiv9t6673rlEnIKYq+3oUjJnSIMZO2qDauaE=;
        fh=0CqiddHTvJBqsjw8xPZYoXwmssqB+Xb74Mkob1wjzYM=;
        b=aeIdsuvSpSFOmHdBfhJjQKrIw5i3e5FE6Y4OSLk+MClApOvMKWkf5+xxd3YlH27c4m
         SyWLiLj5aNOitrq+M7etCpzxwPnDFRUCqaRy6gfFk8lSBKSUxJoYCFyj6EYuA0pvCftc
         piit2laNbsFti+xfNUokeatVVWHqUKZI5aUw5Jew7SPyKDeqiVrzNQbjmCJEQVAEJ0jk
         OTBlGd42MpyFouo5zlJq6io6xTe199BMhkrCwW6pKUVOWJjIZCFqQZkU1OVuVT5MQMjo
         tHIkXL8h3HzYH6H/tUt/NYOqgrQl45Jg7Mw9lg6NKIgFUBIeHQIzhV63RH3sTa8GFW2C
         KbYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782137347; x=1782742147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F2D2XJYiv9t6673rlEnIKYq+3oUjJnSIMZO2qDauaE=;
        b=Q5wPAl89sRPVWrcwAKdbOYLvdAIJVIgOH92VgU84Bn6SPGO2PrTXcrvjV5zhJSI8/n
         j0udyGRq8jetcaeOk3IBHWgyoTzakqgczhaUjGqjnSrGXTV/JO7qvzU4Z2HjR05xob85
         TIVERPK4aUOPGxPHwtyzcBliml2fdu4PZQBfaUIdZ1KW7k3yOmUVXEdql2j8EjUzQISK
         THVkOf9R7z7yMKs5nsE+PD+LBwsN3jDMAR4zSgFSOXyXdKsmXhKL7nucwUkQEXUltXah
         BwEXfjfhX6iXnPFZg1cVgECBd0RynCiGwisMAYEI3KcxccyO0M2qwrTYdLnD2EcZUqyE
         JA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782137347; x=1782742147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8F2D2XJYiv9t6673rlEnIKYq+3oUjJnSIMZO2qDauaE=;
        b=cCISOTajB3Ko2WUAraAnyEqgYqndEut7lTs1xs2EXJJ0s+u7+D2Toacfcebppcc5wM
         QLQf3lETxgKtdYsPU38i1iARD6sgV1FnqlZa7k5YP5lcok7icSesQUrJhcOYKZLlW5ud
         SAedlRg434E6Xy0VUsOpqBNGvs3hdZgE6fyAsVbNeC9LKOR18dKktmBsfD0K0OhsWciD
         JzkoNxadwqwm9WeTR3AP7UrBDW6jnOuIWrqRlnGe4imtEe3NNhKCWnkfv1K/tYVL/yS1
         lf06FmQYc8QWZH5ASjbEhZh1PF+DnFzGbkKgpIuCZ0gw7wvU5kaRRVwJ0KGhEU/iFPCR
         qSEA==
X-Forwarded-Encrypted: i=1; AFNElJ9bBM9zl5/e2VOvou3gmLgfDNZB+xB9sa/i6CCEgP2VnZZj7YMbGM54hc2Ek/2QWSqENXmNtjQbOyULIsMt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjp8My4nDuLzY87NgS0aXpepAeOvSeKxEZDpxLorRLvzRyk9p2
	zuMVbmX/ckjyqmjXtFFpQMta8xyTCXnwTM/OdoYhr0gqGlQEDnmH2A/I9baTVSmsNmK5XkGy+PM
	vFzjkRC80MPADggU5HjGLjT78M6ClPb8GC0oirmRNJ+pFc+Lepvut68DZ8TJNg1ZodIPokhsKQm
	SLh1UbN5FkQO2gASrPdWW5uK12iCNBor2oPVQC8ATpSDs=
X-Gm-Gg: AfdE7cm4IkiKOkqkbZ/v3Os2/popwnlwVe2U5o9SXv+qwzhNBYD0B9uye+8QqRaXo+r
	eHxdxbK/m9H1IXIY7JYn+pLkvC3Rhit4pNudHXZcJmJCTJbH0YGsMtaRjP5xbs9uYLoTbJMbh5q
	1yztrLrwbiCMIZvp49UvhE01XyW/L6DlJAZCuvYu97utoucdNMqqw/+40Tyu/fJtVd9tKOKwe+i
	UTHWvI/MnQti0WiQ1fl8pM+kXRen6o4mCSTOVE3UUVBtnrFpauWs/3pAr605NwDnwkFVEOUZVWg
	+/JGr19Pig==
X-Received: by 2002:a05:6102:94c:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-72a767f94cbmr7292342137.3.1782137347223;
        Mon, 22 Jun 2026 07:09:07 -0700 (PDT)
X-Received: by 2002:a05:6102:94c:b0:639:4bb7:c916 with SMTP id
 ada2fe7eead31-72a767f94cbmr7292276137.3.1782137346809; Mon, 22 Jun 2026
 07:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 16:08:55 +0200
X-Gm-Features: AVVi8Cdxu7NAlkP6yLvTDdtoyFpBtKVQYUlnmHNky4ya30e3n3LB9oUky-fhdQQ
Message-ID: <CAFEp6-3De6r3XwSmnKpMSSf8KK3K-esDAhTRKN41Bng-Yf8dXg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Additional regulator support for the Qualcomm SGMII
 SerDes PHY
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: SScKeNNMvMk6Gn89tqW--ozjKLTek4GD
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a394203 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=CcxlLIvrYPQ71yEhQx8A:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE0MCBTYWx0ZWRfX89/nQoRT2Hii
 WPc+LAhCu9JUHUT2tERkQh9DdSTu03XazDyr5wdJ2bBRzYAoIPCS1as/tkz4WGAyVmxbTn2g/Gp
 nKBQBT+KZljrI1hd4wP5aqrqt32NFOw=
X-Proofpoint-GUID: SScKeNNMvMk6Gn89tqW--ozjKLTek4GD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE0MCBTYWx0ZWRfX4mAO3M1kkxi7
 ij+3ebXG0GR4FPnLgGjvJXIAjbAHlSD1lkPcf8Wycj2T+RtXLOejGx+y3ptCul8puzjwMjx6qjm
 xVwa/iNyLgV2oh2I5XzfmbXC3g1qae2UHtnyNmSmnh+ehrkBHOIs8oZvfiyIZXlksuCWZTc4CnU
 xNKSD/7FOc93kribBmWOfu+0fKPlU5PfXzBA/UzfxUY8mnJ4qHx26/nJnbzgSIFTGKyZUZFRjrf
 bedMK9eVQmVJslCX5F8BsdAp61g5E/Eq1gc599CQxN65FlEO2CHSYl7J3QpgVhDRLtejp+YdGrA
 gNgNXqYoOXL7W0juRUufTLqiyiRci662zoK6acbkMQUIKFd/xXc9nBA4ujSU3tO/L1/gG2k05Z8
 JRuoG2dZcYbMziarqlU4nodRI72tKxilWZhLH7VrB+IrRWt8s9FxY0ibDnAxRrGtbuYZpyl98I0
 suB7GqqXLzWpfZ/CyTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-114019-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bartosz.golaszewski@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:wasim.nazir@oss.qualcomm.com,m:quic_mohdayaa@quicinc.com,m:quic_yijiyang@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF46C6B0307

Hi,

On Mon, Nov 24, 2025 at 10:26=E2=80=AFAM Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> wrote:
>
> This patch series addresses a SerDes power-up failure observed on the
> QCS8300 Ride board using the phy-qcom-sgmii-eth driver. The issue occurs
> because the SerDes PHY requires both L5A and L4A regulators to be
> enabled during initialization. If either one of them is disabled, the
> status register does not reset, and the Ethernet interface fails to come
> up due to a timeout:
>
> [   77.105651] qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STAT=
US timed-out
> [   77.113447] qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes =
powerup failed
>
> Presumably, the issue is not seen on all users of this PHY because both
> regulators are often shared with other peripherals. However, the power
> rail schematics for boards using this SerDes PHY show that it is
> supplied by both L5A (1.2V) and L4A (0.9V) regulators.
>
> This series has been tested on the QCS8300 Ride board, and the reported
> issue was resolved. All Monaco and Lemans derivative boards require this
> new configuration as they use the same SerDes PHY.
>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

This appears to be a real issue, but I haven=E2=80=99t seen a new version o=
f
the series or any response to the feedback so far. Could you please
follow up on this?

> ---
> Mohd Ayaan Anwar (6):
>       dt-bindings: phy: describe additional regulator for Qualcomm SGMII =
PHY
>       arm64: dts: qcom: lemans-evk: add additional SerDes PHY regulator
>       arm64: dts: qcom: lemans-ride-common: add additional SerDes PHY reg=
ulators
>       arm64: dts: qcom: monaco-evk: fix the SerDes PHY regulators
>       arm64: dts: qcom: qcs8300-ride: add additional SerDes PHY regulator
>       phy: qcom: sgmii-eth: add second regulator support
>
>  .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml |  4 ++++
>  arch/arm64/boot/dts/qcom/lemans-evk.dts            |  1 +
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  4 ++++
>  arch/arm64/boot/dts/qcom/monaco-evk.dts            |  3 ++-
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  2 ++
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 24 ++++++++++++++++=
+++++-
>  6 files changed, 36 insertions(+), 2 deletions(-)
> ---
> base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
> change-id: 20251124-sgmiieth_serdes_regulator-027fc6b15216
>
> Best regards,
> --
> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>
>

