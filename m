Return-Path: <linux-arm-msm+bounces-100707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMrlIk48ymmd6wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:03:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D7357B17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 327B530ADD77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF803AEF42;
	Mon, 30 Mar 2026 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4CCJWdp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNcBlIfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE7B3ACA6B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860946; cv=pass; b=EDFcp7ROqYUzuAlZ0C9u9MaGFmZ/ZU0ZIewfdqBCpNO1A51lXh1Ql3lznTrgCxS4QEPTjjal/g3Q3/LPJZyQDgtVAY1nqM5ypBbEsNMrNOFGMUo6tKIrfjH+D6Qs9MI/fhjeQ9/1ZWoezvuzFxJU79a4tJNIfzeRPkArgX8SJnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860946; c=relaxed/simple;
	bh=SRrNYohKxnZSbgLZfgaJEvQX/4xzIBNkhGypkqbdSYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aG0e6CuUpdJpfJda9QVuOnPsLbkEP0PFtVTIpXHnVZ0Dp2qc1UtCPEhrE/TWLlAnRW6z/lm9weMGadrMHc0sZ7mcgn0iPy+FY5z0hYLuvQOh5x+mE6WTnbp/yWaEADF7oYBsm7HeVaYK0tGhUuBq2UEjop231guu9KCTPePi4yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4CCJWdp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNcBlIfI; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7KnpE303197
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=; b=A4CCJWdpZcJy7BHy
	s8rPnbA2OP8suuW5zKkGi5UNNCIz9NPJono6Yo+NFMcE7P6cKFEL3YQ1NRxr1tfh
	aI7q4zEstPqrd3EOiSkS6sQBOQ0tA5zV9yQenSNRn2eV1I9Dy5OZ0teB8E6tBkih
	29VP4t2Vu8NvSrzBrV4YUItdpF+BfX9v71zmgqKq5eDdVmOYHQIFP/O9bIG6FRUr
	g71dXbtPMaxsPSLFooKadWSoq5/ELH4pDKzn69n+DUxle/6xZp8gzfFssNI3cLCa
	PxBdsStk4UKWY2onpoz3VpY519+EF1d/Q2sEFMe0ke6cqGwc1qyiRr7tt99M98hF
	9RbfoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqek6xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:55:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso136286491cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860943; cv=none;
        d=google.com; s=arc-20240605;
        b=Gkv5pgsOda2brVfmWIwcPv/YMyGb8zsCLDoRodgLS+wrTQ9hD+srrJQ7q/ECwxjMFr
         cGaEggOgedvHyeqjeSpYX9QmZo4AkMIM8L5ItXKCGM7o+F/eP7vbQE+zebYg7I0JRHO+
         YUV8Qk2NZSGRm74VKkWCiwDqV/RHbxrxHfH65fIPSwkGQtZu0MFF25vRYvROpHwSEfDX
         QA3JeFDivHhf7/rECow8sPmgtnj/+rwFXx/HbA52vVKy5VpuBNd7tfOXHFITkCRbWBxi
         c2PNFGNmj8s3oi+qhJh386ei40aL+hkWHbV3ireHlUFK7XVDx8Wz9rSK6GCSjT4Rr8uY
         RXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        fh=q7z4J5gQGrjeBu48yLOZ0Hy63LN7akDHyuDGjMOp4P4=;
        b=KMpoSCF2Ss+ugCnrnh8ns+GHeseGgr7zC7b0bmdCo2PEcdsnPORRhiNJi0dq61jsrK
         2deUGYLM5bVquT5z91JPb2p23scIx4S06Oty0ML/RYy6xML4Su9P/9p/uMlryMobi0k0
         ZVcMX2Mo+kckJsxNoy/vI1pek5yLTMeDdF5jNnj1ZJegPfSgT2soiO30AY22inkjW2wk
         qjIPd8uKILR06PyZtLed9XulCgt0PpXFYOGahDrHaoLRJhnJdjxb4z+cTKZ8z/cLYrPw
         Kj35cUIxMoxdB8YbApPBLq0gW1OdoX8caZZOl8koElNSVhJj0QBOHq56sTkaDLT5BY3B
         rNvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774860943; x=1775465743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        b=TNcBlIfIi/L4MQNGd8PeCf0aVsWT0V/0e+aAh0l2eCuGRpFOo5ch3GJQwvMObtglmM
         njkMGFre0k92Bi85MPZs0891LHJqT66XiMN1S7qUtm5yEz/jSTWHKcXbaDQ+7nBkOHtJ
         6PTdJJ7BxoPygySqfL8tNBKlPUslv1aTPbNDkegxKwWYqw6PvyxAzTGnWkMEv3RAV+Mz
         +gtyWOJw4TNFfs2GF2Fa6x01sS1nPlOTfvg84W9yucFZfoNJX7hi4/Nyk114zX7w41MU
         v5kG683pQGkDfMjlpEGLkVpTTmAG5TirpOowEzrvadko89yGqp+Fzk/1XWckr/3vghip
         fMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860943; x=1775465743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PefIoBp8Rz0km1wBYm1VpXsapGC6sDamADdSsc56l5w=;
        b=AeLcvdtGX9SoZRSctEJ74vYiThSbmMMTQ9JrVe3IWWz2X+6uiSvr2iM90zXrlwhq0u
         x9Ef4TkDWgC4Nw+Hi8EBQiLTI1FcmExGqg1fe5PLgoNXj08S0yCTJCc0xfihN4ihyzY/
         YbYFdG/Qk7x2LctbMh6qUAq9Vkxs4+Wj97KR2pcO74q3xTW4fBQ7zNdcdJI/QYODFlFm
         Lr9PxUYE7HKNQqBStuoSWps95/tW0a9+3HRUMw1ER1YHHc+z2QnE4wYAk/1EY4JQAVwj
         pAsXP5lgooF2Ifzb7M/CqgA78HEGvV1YmPEqE0pVx2FkWDmbvm7smlB/UhE8XCVlToUe
         rdsA==
X-Forwarded-Encrypted: i=1; AJvYcCVW+zRCK5Mbb+G0dAHQLoS5EAflFl7leme0kCC7MtZBmR5/lv6t+y5HuK9pG8xWroOhI9NyVbCqqU7W0ICI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6gIOrJDAQlsI7y/vsbRJrObISY0opbYo63A7kb9BpmOf1GTqq
	gpFi61tXeMbPlSTATfvRHBk5NO+r+zszLzYBrnVRW/lMR7+Jq/ODAR5NvWKUvn8DZelVJPwmI7A
	AW4+1TxlTEWcoV8C1ZWWV61/3gx5EQm8QdWnqR/irIAsh2J61sIaeg2vai5jGQ7PM6/rn6FvFaE
	hTfGPtKFIgP5TTi2YTfQsalPyXSVs5jbgzcf8c3MqLQ6M=
X-Gm-Gg: ATEYQzw2xfpnrlFNJ+3wEdQofC9nlZEWZiUEnWdPAtCpdbuCwHIRnq3uPUHn6MYxG6e
	ywFTpHokhl09+vYw5MJFFC6vWPa5tEEDezKkkmvyYHLQO5MM+TDEX3peY39hbhxmLYRIDZeTdg/
	9RQcmQwI37zSrQWTPz59U0UyGiEDusFhGuonnz3DrDQof2Ai6acK4NSGXCAW+IfhlcQQwCyrLPC
	69+cJttJaFudruG36NA7+ERX/REqvD7lM44U4c=
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id d75a77b69052e-50ba37f5c80mr177298031cf.16.1774860943443;
        Mon, 30 Mar 2026 01:55:43 -0700 (PDT)
X-Received: by 2002:a05:622a:2593:b0:509:1a72:e332 with SMTP id
 d75a77b69052e-50ba37f5c80mr177297741cf.16.1774860943044; Mon, 30 Mar 2026
 01:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-6-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-6-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:55:31 +0200
X-Gm-Features: AQROBzBxMB6veijPqkgVNgzq21VJpm26IzXgh3AXCyALUcCgg6JzL9jZ1w35UvA
Message-ID: <CAFEp6-2iSR_BBuYE6t__yuRr1e4WN8pGnqJSGS6YnKVFw+YPdg@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] media: qcom: camss: Add support for PHY API devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca3a90 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=2ZO8jXjuQ1C68hZI1ogA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: h5_Q9Rvn0wQCHxn3iZyE5Yb13OQEUBJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2OSBTYWx0ZWRfX7aDDSxLKRQhQ
 OQ+SsoGe8A9kISLhwP1H/k+AS47HRW54Jp13ngWIvb8vlwwrihlDCNTLXXQNZ11VXsDJIVH0p08
 mA4s1hFoqxk1QA6iOEQuy92XJBli6La9sAbF1VsyD2f2AWYz4ey6Fe53dEFlEBsUHy5VmVeKrhr
 neGZTkWEGSyoVkOK4l6QWORDS6zkgYptWBJ04vbmUrt87AMNm3Lc+XCkW02PCmjYKL9SPZNstNK
 /JQKb6dBRfyxhEWSqqo+6eAk1e88TFqGDCA5z0R5PsI+QbXHuDoq9fwFMdpLk8e8LiDCM9YEj4g
 T3pW/RO697sW/xfjiH2i5q7W26cQJDJ30R2C54q8jZxHvWn+9GonzTSZ1Fp1FgkwlaJn1qZOiVc
 W+WOYqi9UHbt6SVKQbLna0vH23A14QX1zQGa+qtpzv/wY+8ktMLT7gzHMqrzLdRl7vBkOWOaGIr
 vemAlWD09F0gNXqwz5g==
X-Proofpoint-ORIG-GUID: h5_Q9Rvn0wQCHxn3iZyE5Yb13OQEUBJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300069
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-100707-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A67D7357B17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Thu, Mar 26, 2026 at 2:29=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add the ability to use a PHY pointer which interacts with the standard PH=
Y
> API.
>
> In the first instance the code will try to use the new PHY interface. If =
no
> PHYs are present in the DT then the legacy method will be attempted.

This looks good and pragmatic to me. I just wanted to raise another
idea for discussion: would it be feasible to always rely on the PHY
interface, without maintaining a separate legacy path, by creating a
platform_device and attached resources from the legacy PHY
descriptors? This would allow camss driver to handle both cases
uniformly.



>
> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 189 +++++++++++++++++=
++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
>  drivers/media/platform/qcom/camss/camss.c        |  72 +++++++--
>  4 files changed, 239 insertions(+), 30 deletions(-)

