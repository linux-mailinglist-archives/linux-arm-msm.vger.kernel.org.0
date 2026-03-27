Return-Path: <linux-arm-msm+bounces-100479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPHfCPr1xmkGQwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:26:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB434BA72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A1F330A3C9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EA639446D;
	Fri, 27 Mar 2026 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItGHgQWd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TU3Tc/qS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9A3947B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774646539; cv=pass; b=kTy6QjsAZ4A3HzZVmPL/wVbNDayQYnaHBo6Qpn+WqvzdDA8cqShV6/WcCaiHWV/uYgsZ78NrLG7y+Dj2bfWVI4+KRtzFY0Uvpyrh+VN/3Qo4KFDJ8AP4S7+rhwkjFajj27IbsOFaNgXlr5rLhb81EJGzPTRbZ6NHBokbn3l8Vj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774646539; c=relaxed/simple;
	bh=EKd89lwZSQ/xsDQeDeVnhMqnSWOHBwJ1HhYorIEMpOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUNlbLrHCoUUmmoMj+PA2skFoXkPCJjbgPeztbGx71dnCrfIg9YqzbVqotmhLGZqylvB222jlA0uxcYz/m48nh/Ry0stz+4khshmOWUfm/Z40bGg/c4pMq6HKU6w0PN4xsBrksAE2DAL19+NuUIubvkRi0afYLdXX6S8lBidi/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItGHgQWd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TU3Tc/qS; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtRnt451895
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=; b=ItGHgQWdEC/OotkD
	lYqaBWBVfEN8SJ6MUCVvSS00UXSOu8XmYOg8IzeyNCPpnVxvxKUfSdWenTNIIHhD
	CU2cfZomO7EliK42WXN3RT0NihJFx8578fC7UCIgMtxkVC4BE4VunAF8JSNQRisA
	FcJh33p/JrXf+Xg5QMkw7RzM8hkNwCVXe9ie6iOg40Rf5fwRFThQEoQsIRlwdhIF
	tgkxGhLQ/bljJX4XFidEr9Yz3W5okEiEkk1ia0q0YrJ4jc0ISWFxjdGnLKBEcyTX
	ZnOa6hBta0b9evaUx5ox1NapVJaZFYyEEHD+/htXFvQ51Zze93h9Wtk5EOb163jj
	A3K4xg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx3hjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:22:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899edf0171bso69187336d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774646537; cv=none;
        d=google.com; s=arc-20240605;
        b=ZLFLYFruMoBBb903XZwVBXaST1BGTRJHxwuMunWc6204FDorpop1NT3s/+kvIg0yPf
         c67uAaL8tsqqiYUJCFc4o5dfk4MG9J2aiq1caH2Qd1JkNWWTVjV7ymUF6rU2ebchgVmo
         GxhNw4cuj18u5Z5RuHhU3XP4cXq5BBsqc56AJBnuwi8d+izgQ0eZ0drYoQ7P4bQKRugG
         JvCXm5GbOsi13F1qcoyZZz37Jno2Okercl6wRxSsdzSE0Hg/WXhJRKyGFH494XwTlLZV
         rl/3WsVv8bLFXHL8iVI3/bNDDsnkx1oMCpDFzaqQeUrgFmRnfSSaVQr13+PiseVJ8shI
         11iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        fh=4VITAEHdpFkur8lmlms9EYLNIaRlnF/p06R3Y08hq04=;
        b=W7VUsM/sUldA+djSNqqsAdiRqqC59n60tM1oQBHTBGy9MUTFG5Oxq0ms/r6CJtjEg4
         fsvobpTNJILHKIGO32aEqoc4HClenyX94KE1cm40moc+zJGs67QS8MpGcMK3Z4ibHlU1
         ieWyy/f6XUfomQ8ekK7fsGH9NzNRa6Q1fQB6GkvgOD/eb+K8okXNjIn2WGKDK2/P7XmK
         5fhEmzDs8jmQN4fbopL3s6pWrqGYq1vVKiYlKHvqabZT8ZviN1QgwdcyOmAo8Vvw7sdw
         S8nGKqOGkM6TLUAnR5ZLyrPZuaBUGRyTKQBDuPMzwe+xKCxpZ7j/L5L8Ym0Jp7/NDkf/
         5ZrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774646537; x=1775251337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        b=TU3Tc/qStrZnr1l5foed5hTU8hBwnFi3YjlkMbLLg91r3MR/axM5A52yVikollEqWM
         3AzK4vs8mZfQPnI+S0kEiWkFfLG8IhRWkxz70jnNL70Pf7rub/lfTupEu6EAdPLjqEPR
         t9VE8z8UEySLYcgzCuOX4cFdDCkVMBqVUdv7qJAu6XhNCbccBQ/Yyq8P3J84yo9XSUcM
         8ISWxnGalREu/klByImrhKVHEoczkrlmPMlbItzEtaXKhEZt2gCiSUr6LIo2psj3Ruz7
         x7LMDxykO7DSKjo3CxPZE/oNjs3R1iiO4f25sb/7nC6XDrrU/fYxjTOxRu8E3cNkGcMy
         9jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774646537; x=1775251337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeKQIQllLYW41sCID45frB/eLHlYNGIKXDuo/pPMVtc=;
        b=fGSha7UiV+Vsp4zNKg73793c08MfY1rqoGcKz0dIkn2s9qdmQLJiB9M2WZmkNI6PCv
         v0OtG1zZfj4NArbk5qnnSWf73+wIyFXElFP303Y6eMtRAH1mpqaDMlzoVdvhQ25COk1R
         A4nODYFEQvQO80fcLf2aUQUJ0B906LYVwTiU2+A+VpsEZtWvpnyeomYQZk6DA+o2krHn
         YU7Pa1YrE7xWkpS7Kq54tXnCIs2jDCUybAL1FLQwK+JgS9vK/bXC4KyqVt3GVtLbDtf/
         tPM58751a313JgDPolS168RB+kXieOz6jYBZvDoSceoxzauXizcYXXgrfmowoQwaEupE
         iRRw==
X-Forwarded-Encrypted: i=1; AJvYcCX9z9nPmcayyPERpUg25ZAoWGyxtJS4fL1TR4esnsFfM6SeOPFRZuYfkPPfchPldxyvRgLRud95pTvF0ULJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZoDuJr5yr8h3fJ7Uvr3n/kwb4bDEosWD17pa3sLGIvnpygV9
	8NXarsflstPQ7ZJhaMHWA1YC6N1Sod3N360Lq/5u8xL3wFoZKvu+6upqUM2gBPvq2PjMqGnV3Ja
	uYE7JRhC29hz9kKcVUdbsJxhsY0jKedGkwIariLu2tIFNo1F/kZlJxfe3yN3knDEBolESi1l87/
	e4LcB5fQyCIP2iRTG7zIRcBK3wjGI6EZZoUyldRVq0SGA=
X-Gm-Gg: ATEYQzyK5JkvOExY5hnjKrbgCMPti/4cE3ZaC21HO+Qp8QQUXcIoUfieiPMyGx67F1B
	ULw4mQAcv0yZFYgIBH7OaRMfxsQU0lxgLWk7FzaKSgy+zFNe4C6FS3x4dvryH5tj3JOPDpcZUo9
	Ty+pBPo85soghS8G0zkwnG/pDK4tMGzLLbj0/4mUimCETiiUUe+a2gwFooI6O2TxP6O3JsrPniS
	nDc7kg/iiftALE+TcnSn0baYiF6VO5VsgLmnOAOfPe/t6JAxvid1endxeMe5hy/lyni
X-Received: by 2002:a05:6214:4602:b0:899:f820:641a with SMTP id 6a1803df08f44-89ce8ea0959mr54540546d6.30.1774646536621;
        Fri, 27 Mar 2026 14:22:16 -0700 (PDT)
X-Received: by 2002:a05:6214:4602:b0:899:f820:641a with SMTP id
 6a1803df08f44-89ce8ea0959mr54540086d6.30.1774646536246; Fri, 27 Mar 2026
 14:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:22:04 +0100
X-Gm-Features: AQROBzCYYOuC9NiCmUVBMRzmwgB3BcHsu5HnhoneZ8m-194fkybLeOjKTsh6p1g
Message-ID: <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate sub-devices
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
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6f509 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_ALasc2Z-pMJxbpW9BwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UprTXiOTTmrYr1Bym9MZbGy6zuzKxFyE
X-Proofpoint-ORIG-GUID: UprTXiOTTmrYr1Bym9MZbGy6zuzKxFyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1MCBTYWx0ZWRfXwTjtt63Pl3v/
 WVuseSfln+4eswjGqjzh/x0/9R5gBBfXvJ24dT5RJxoO8HbTNWcANFGs1S3d0QzsIlr+WYbk0s4
 cb9yDEVp2/W5IKvVORU1aQyGsrAZBjAY7RvRpENpy+uSviG5s3afuaUe0DH8OVOFhnMPdsq+Jzt
 styAkY2itB/lpCCjIM6eoBVHJ0nFwjAKIsue6u3OijU/1HMf44hEiAAOH72fHhhUhlmUiRFfhJR
 vqzo89ZTikYC84bQQID0KALGcL4mQnQEOj/NKhou06z6BEjLVfLfd00I9w3QBI77aHaVCD+C4DW
 MwfJ9RrMilvCGac4D5GatzRur3zr+xs3Ln4dLUitYc0cw3GS/E1UueK6x7WUydnXVluyjBx0fIW
 ywiT9cp34+8I2jfoKg0Xi/N+/i7gLxR0TWZGvcejvzgEcwq+oz79ALgSTGXlPcn74CboqLcRfiQ
 bfZn4gsdLUQ7Y7buVYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100479-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: B2FB434BA72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 2:28=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Use devm_of_platform_populate() to populate subs in the tree.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Other drivers typically call the populate function at the end of the
probe function. In this case, however, it is invoked before the main
resources are enabled. I assume this is because the CSIPHY device
needs to be available early. Aside from that, it looks good to me.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 00b87fd9afbd8..66ea057291f6d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev=
)
>         if (!camss)
>                 return -ENOMEM;
>
> +       devm_of_platform_populate(dev);
> +
>         camss->res =3D of_device_get_match_data(dev);
>
>         atomic_set(&camss->ref_count, 0);
>
> --
> 2.52.0
>
>

