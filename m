Return-Path: <linux-arm-msm+bounces-95759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGEXCKinqmlTVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:08:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E4A21E73B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 11:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 574E730792D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 10:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AC535AC29;
	Fri,  6 Mar 2026 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkVlokd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PB+C6Y7h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDB335AC31
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772791467; cv=pass; b=bf4ti5vsppzb43/HQXzehg0Wj6uu8+ene8Oly3ee5+6H2djVPyncnoehUC/t7Tvix3ipzyzSom6SUfh6OyLjpvIK+1uhD5Jk0DEv4nl2nVhy/2vHOK1N/wpFkeNXdoUCqrh7FzAiR5/4DIlpNmsekg2wA30IyjJvtaVeoiIW8yU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772791467; c=relaxed/simple;
	bh=V3pGW3Bx7Uo8ZJGztqx9Yv/hyZ+MU0sGXrjRPE/dgQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCXSnu4Jl/VSAT1ucbDvqarC45GG1Uy6eiYsggD8Ki9kdn7rprhz4kYi70hZvSnY2ndKIcDGn5riONuOCsrDjMerTH0gxf1dSyPFcHhhzeXbna/7gH+FsxcxiNby87M+2sVlofieZUd5+Tc4jyNRAtLRVYZYk+kkNAT+dPLdAwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkVlokd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PB+C6Y7h; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6269P0Ma1162844
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 10:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGDpuikJBFT+Jd7LrkMANUiA6NwhpoN6OuD3iIM3Vyk=; b=lkVlokd8am7WYYhW
	iUhFh171HpgUz27lfV/o5LaoCsb1ftgLG9J8JzGHOAe9jIuyvUSsXFVSsVjMLi7u
	huyclpt9irax/uEJwv9P8IIfao0VdMLnCFYY1YksvivLFEIzKLU7OEozS9PMLfhr
	jeN5lrvc/IKrKajlqRUbM2tN2fq+aqCUH4Jb2kOtbiPc8MB7vN5r0KJUpH8McIN6
	7hB1bDI3EujMntP1MC2EY1GPPn7t/MZwPKwydExUbwT9EQISfjECvW7FIc1I9wFu
	ctbuzHgcHre5jiT9PnSZRkg45D/G0e2G4y/YmoxUFEsgDOcmPuWxTHT6hB2OQN2/
	w8RFeg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ag4mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 10:04:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f474fae1so344409276d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 02:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772791464; cv=none;
        d=google.com; s=arc-20240605;
        b=NUnwr0wp7QJ5b+FHfoFj17GilSm7x6FCpUHq0cS6c094MOpFLmHqGtR7IbM0P1kBFR
         6nBjYckpgS1Czp1KzPrWSLF6h8Yj8oe/C30nbcmFUexNzMFY6lKTYSI1z39RdG3rUCF7
         BugK4oWdY8wKSyPMKFph4lKLm546/1UA5n+xzHXDX/KqaCL0Ei8tmpVu7dn0MqOG0Tpu
         sqfwRqSvVXP3o0pBjsJLCrXrR4vVxtnKKHaNmh0pwLQwOmp+IHcIQh5YE9whKCz3Ai2K
         tJT/CdJV6GAsx6wlXy2SbOdn6ROGS2biq8VFQhxXGedKoGVYUFsPR3mg/5CBL8PnT0OJ
         m4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zGDpuikJBFT+Jd7LrkMANUiA6NwhpoN6OuD3iIM3Vyk=;
        fh=3aRcy/+jWoaaSIEMBT19pvDDfsG6ar4k14ZRsfnvIqY=;
        b=MJuLdprHwbrHJl59sb20+fXFeMWCsCto0H8t6JAVVK4zq5HmGMsLd+ta4ozJqpvJGd
         h6v2bMgKCQrN9z+8VEKyeK61GMYQ2cDmDBMsuZrdd2FHYiZknQqOEe/DEg6zumxeYQr6
         XVTjQDByzmNY0MUVPmpKhGZ73LR7rzdRi7BD/flnF/B7eWMbCZJCjjTQbGvrxyTtEEtv
         7Cv/uMcW5vIkLugcWrxpg7qKsq0DI0Cbzley9OQOwzbKG2ddx6L1OimLGUogfyzC9HeV
         IWo3zCK/lvoAjFfTS78gdyeKnOCT28aZ0UBxkrlEgKXdwic3OQAYBWmEGVwgPPPrBaxq
         /wqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772791464; x=1773396264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGDpuikJBFT+Jd7LrkMANUiA6NwhpoN6OuD3iIM3Vyk=;
        b=PB+C6Y7hR7xNhUzbuw+aHZVf69YoqNTmFmER3P78iNH5l5SMvfWVmyaKXuIbXCBbb6
         n4r5BZZF4S7N8XYS2A9894qwa/11fC77Osnj+VrmOlgSajZAMRMZiW5oh1/V/m4Z7afd
         JbVwcbZYEtlx6iLS6z8qPIwVjbZOO5+YbjmfahJwWM9LBrwrNDZK5QYN+SGkTWV6fxY4
         qekIPDCitYzSI7FNo0hZ44RG4d8XhFsb4TEh3NsdClQ+pnSVvqVV52enJO2guBsH3C6Y
         igGkiH5e0fWBlDlrKAQCbAYXJMUmbnqwyzdFFoNjIWYSEepdU4gelEWhCiZZ9PsXzrsT
         9gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772791464; x=1773396264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zGDpuikJBFT+Jd7LrkMANUiA6NwhpoN6OuD3iIM3Vyk=;
        b=H02ZlR9ou/UxANaR5j8rJV8zKBNVuNi1fc7G8d5p5zYLbzlGGW4Rx5hhr52pbEaXIF
         8HJENfMgdKKP440Fhzrv7OygAOicoFDAqvc4jKu/b5AURy+K3YpNhEJnZ9OlaQLnl+ya
         3NyGxpuF+yh6MhD7gUhpjTtpMXhNJP7CCtyXCPpcgJAz/zif0hvAGXisI90z1BgxHNGU
         mwrex0f/KaIcvFqLjrYNUTLDfmKm1+R7s4LUGSyQmN4w1zA5936BmOO4JOA9ar7VP7o4
         qdIJcrk9D8nMANL8j3/Lau0vq7MNPPG7kQyfl9SD/6WydJi4VCzO8YrlUwNJZ7SzczS0
         gUfA==
X-Forwarded-Encrypted: i=1; AJvYcCURbvu2MM+OGqSOg1GfQP4I1YYsuRRmXTANSBuY1hlSeMOMjtYBKlDvZsmhJKGoTp22oe5jD9X0BkJ9UNp8@vger.kernel.org
X-Gm-Message-State: AOJu0YzpaTYo3qnw1kXiM5r1aB7RzStGkAb0CSk0hSB3ghIdsvo6mmfj
	O27qSurF68538JSb6WmGblQawhIQjAhPiI2hGI6eXUwpqYETMIm3QYZd39ykQLXVRzzbuRLob8s
	hp6yUGgSRNJmYHt5zIlZIUztrlr4LMV3no4vwCjYYX7GMjAasbx+YimUSZgGKPiDak0y8PjWMHB
	yde0vUL5ducAjIqOkspO7vGZZPb2z6mxqeXgDEd2XGiwr4FOB/sknx5A==
X-Gm-Gg: ATEYQzzWlqjMgEgLXl/l4xfNzgdm7ABAHgxr6emA3HALggDuxMzQxLRuLMQRbNYUtJm
	sQkM1OVyw0W3RDLaleJoxpOJYBQlJzxMr5qgPO+2ywixdF+FUYBOt7T7+XLHBBiojZiKHYQ1sF6
	j5Gv9uBVLFAq0pAh9Roi0WCThGBgg8OXQ0njZ1ySpNgD+YRUvl4ZfsGWb5izTiR9jZii+zw1j8W
	04CblU=
X-Received: by 2002:ad4:5f4c:0:b0:890:7f85:81d1 with SMTP id 6a1803df08f44-89a24590d35mr81022946d6.13.1772791464571;
        Fri, 06 Mar 2026 02:04:24 -0800 (PST)
X-Received: by 2002:ad4:5f4c:0:b0:890:7f85:81d1 with SMTP id
 6a1803df08f44-89a24590d35mr81022646d6.13.1772791464141; Fri, 06 Mar 2026
 02:04:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
 <20260303082157.523847-2-swati.agarwal@oss.qualcomm.com> <dea48c89-6718-49b0-ac4e-840e596d0166@oss.qualcomm.com>
In-Reply-To: <dea48c89-6718-49b0-ac4e-840e596d0166@oss.qualcomm.com>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 15:34:12 +0530
X-Gm-Features: AaiRm53RQFZNVCtAzxk4NE75sY0jbJ2GHVt8wPzaKO0wNVXsoSIfAyAhY4g-ofo
Message-ID: <CAHz4bYvDizO8eOdsce3_c4LwxET0GSfvUF6B82eWtii2SAXSQQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: monaco-evk: Enable GPIO expander
 interrupt for Monaco EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iLiO7UQoYk7zDDrkwNkM4ISAQrAKRxSg
X-Proofpoint-ORIG-GUID: iLiO7UQoYk7zDDrkwNkM4ISAQrAKRxSg
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69aaa6a9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=pUK3dxgOIw1TfiUeg4kA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA5NSBTYWx0ZWRfXwL5AG+Nhe/bu
 E5CeZXXPLrYXU+F1tlO/6c3ZGN+yM+brUZZTmfd8tk/ZEDFZMCPWAZ95G9bqW+DTkfvOPTno8HQ
 LYikMh+6oPEwET3SKp7IOo1yVMjVOAU5TCmL2lFD2/CCHQzSWnlWYmyMHdPq1kaQnfCjZcFqK1X
 3oZPtO5LkO0DuMr/JZaP7lyvlpgZkzf+YIUND0Mnsn6eeNjcNPiY1folRGGtZ7dQ0Z2QbE5eRvx
 E+BITuMB6bHyK0z7GbcyY2WN989AL6+vfcM1vUugFFperyi/EetbF1Tj/QD0niPtERxmqmMXDvK
 5BBlXUgHiC9cG7Ru7L1mIY5UViKFAaMkLdtBZZ8NN5Kbl77Z1TfAbNH4FmcBcsmVhhzWtzdFiu9
 m2cgkAPo/Jzf7RgwHELDJmxxcwNCg3eHs8DoT47IXz6rAsRNgXo/Bbq0XmHKiW9c0A9qjt448MS
 LasvescnSRVZRFatZjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060095
X-Rspamd-Queue-Id: 29E4A21E73B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-95759-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 3:29=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/3/26 9:21 AM, Swati Agarwal wrote:
> > Enable PCA9538 expander as interrupt controller on Monaco EVK and confi=
gure
> > the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
> > internal pull-ups.
> >
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
>
> [...]
>
> >  &tlmm {
> >
> > +
> Stray \n above
>
>         expander0_int: expander0-int-state {
> > +             pins =3D "gpio56";
>
> The TLMM entries are currently ordered by the pin index - please retain
> that.
Hi Konrad,
Do you want me to sort expander_int as per pin number and not as per
expander0_int and expander1_int.
For eg:- expander5-int-state(gpio3) followed by expander1_int(gpio16).

Regards,
Swati
>
> Otherwise, this looks good
>
> Konrad

