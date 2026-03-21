Return-Path: <linux-arm-msm+bounces-99012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNxIF8CxvmmAXQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 15:57:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E51952E5E8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 15:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2169E300BBB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 14:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D151A39184E;
	Sat, 21 Mar 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcj3j21z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfWvg/LP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CA3914FF
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 14:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105021; cv=pass; b=qjjHuVx3E1NBtWz1vQDWJ2yc4fREuscyZqMkUIIe8Vs5uzogQaxiFB5Yxa0ez/EIcEU5VRvhi0/OSP305gtAedmbZA61jw2Fqo2UD8WgVYAy8zWBuGA2GqYQpuGz2a9WYuNTCP/N5Qr4DD/b2GGG0dwBe68mhdAGn+7DfxZPxgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105021; c=relaxed/simple;
	bh=1GmXpOs+zXTsbr9RCYoSBINmO/8mKSST65ibpaAOJJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJC7cA5JGB/FqAXSBkxaMA2nNWIALKf168GZIo0Ib7CB0JfG/wFmLMAhfb3CC9dg/cSOxszKcGd+SardlHXBFm/vHp+pEIHq3402FyT+bkf+aBRfziUYVfmTg/GfYJ9/79m6uva+i8Iz34OtPBixMviwqAwjK8G5ReY8PPAn440=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcj3j21z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfWvg/LP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LBnrB1337504
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 14:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=IsCUsB8kbj2Nj1VB2Vt34iZkOEedc8eMCY8mNmwbBsc=; b=lc
	j3j21z1Zl2CcUxZ3LOLwDgBUPV9P/DyGmoXZpwglb7t2bhwCar1muQQY9k3IyjUY
	c356FmOB+qnsz8+ey9N234QBd7wMl8M0IbUq0WGwim6/RRCuIWXuMDuen9VAHVBN
	KvlUMLWLkeJMvSN93Vq3hsPS3oPCu/dUfI1WYf2MlG07WrNDRdb3X+84HUshmeIH
	olLsFYQ++tbBKeapTwy+gwVoOB21h3SzBX0XRJfpB3/rJ8ZMWoD3WgLVZJz5oBkb
	++akuWqdFcj8AqlDffRcBkNU+TtzaKDqcOj1dCWDhGOlcQXNnJe4irt9nLPajUyH
	JzcGUBDZ720x6ATmK28w==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e129v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 14:56:59 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67ba8269efaso11304628eaf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774105019; cv=none;
        d=google.com; s=arc-20240605;
        b=Rs8bcXzjaZPGkMn7tjEle1ESAdrD9AXDVh+JjFxzCYp3wl09q8gFqYeViNFZJrto2S
         oRTT4WiZhvO8ytMuOHByG/tOxfVuoKG9v4FZFk71lod0vWqgCecOK3AZj9fqAnZdT45j
         VNTVAn+TKXwg8WJ0M0xWeB4Z7kDwkdnH1nNtgh6xysjbWv9R66VZHkp7PW2ZgSh58+0t
         e2euZzLIwVfpLvEEu8o1pk1z7Eg5tPW4Grbte/RmFLmtGwcD89kjnqZxHiU6F6WLC54M
         83D4vAryIl2DlXYe+R3IQjO6QPAHi/Wqq0XPq4/Uj9EMZZTU7DH8nB4lCDtqbG7dOOuW
         rLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=IsCUsB8kbj2Nj1VB2Vt34iZkOEedc8eMCY8mNmwbBsc=;
        fh=RdhkCUz3Hu4OwIdk9Yad+8VajFAmVV/EzxgXxyUKxgQ=;
        b=MnX6dJVcJ/i2Mjv/j6fXt3VuOOm4IZh4j9/lqhTll8K+ddXALM/s1zdyVCNfXYL1d9
         A6OqNfXICk6A8SWqFOrRPMluu0RPuUSF2WbpVecE0JqkkU5qm6xc7CTIyIA+52dcKLYZ
         FhyX33bgvR4TzGVuRiBEAuKExq17UX5SD6vYv0RBWz7Z3VcGK+Uyy2TuOMO89x7m8zeU
         oBr7uJakPWI4HOtpMo70hIhFzKfSqMdbwKXiEXwGcyz45qwBQ5ScKVtwfwNXhVCQY9Kq
         CecuhcT2FimWcQjGgU8CKqQtVGtTgcxlAPK8ZP1Mn90IIC7UFtoJAenY0ApCSxfSnV9j
         Bu/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774105019; x=1774709819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IsCUsB8kbj2Nj1VB2Vt34iZkOEedc8eMCY8mNmwbBsc=;
        b=HfWvg/LP9C11GHJUPov/1gvxxiQTcA7brr3/vmnGHiJGgfk2yb8nQIhZ0FS0+peAHg
         r5UZ0jSFpOeZmMeagJU6Wk2sjy0rfVm2tAAZQ9CKN1DcT7jAZb53EpYucNdVZQRrYPMc
         QuXqwF88dPVXZCEKuusvMGathwjv04RVw19iIK8zK31YKTVdrb4vZl59QbmYjUp6UtUO
         CUtlpIHdz7f6W1czNY+UXURRd2iPv98TsoBnwzt2Jp2HbWqOU3nyYhEeKY8jAaJT790+
         PtIc+uDGQDE9D2iyPyUC7rr3Mn7ciFtYMfkW85vENnLTGURfH5HIp9q+k0t+alZ/Ym/3
         HkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774105019; x=1774709819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsCUsB8kbj2Nj1VB2Vt34iZkOEedc8eMCY8mNmwbBsc=;
        b=HVCblvlczK7wOUJGGf/gR+iADSvJwnA9VWlkbIBrw4t9JDqA5JApE3Eqo2BlROr5tl
         yHNVL0Of6DekpxVL/aI9RgG/zpcGag9BtGSK2Pe+mpwSDs+juN/28sHhMFADZ91YokLr
         wJkQ0hg80DMJGA6O8/dek9dlavyOjtTYsDl4l8T1zQKiYV0yY+MDgxQZBs3gaJH0vWPB
         X8jiMaW5DdT1sII1dC2YpFpAehXanIEm8tSZvJaET3MxcX+rXqjtBHC3uIAMkrJ2ghyc
         TdyQxIPODEuMicLsrgiBViYYm0keS3M6d35ZWLAdVhq/7a0SdB19I05slSpHTAZLfTaz
         1fpg==
X-Forwarded-Encrypted: i=1; AJvYcCX47xp2TEma11SUPrNOW3U7UxfRtGXf5Ev2UdHCCqUbTwkRa6pB8m0MwOwC58L8xLZFsutSzzj0q1/EJYxX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qVChm2TalLadGFwyFTYXciBhROpxeIUUsl66bxBGy45GID0K
	xODNWKbC7EAm2tgj+8a7rgOhNoJIGxzUayx9wGrRNkQRNuECbik+L1TX+jH258sGZZPZnbEuWYm
	LAZkoUmhiaGWHbWRy0D5WFpn/It55/mI2T7+iGQy0pERl6/UIF+14gipFz49KjChFTmtOFgGDho
	+4iP8CiSDsAbnrwDz2u1oZZtiel4+/HNuIxNDIgMsSzvY=
X-Gm-Gg: ATEYQzwaJ+XZe6p+MkQcjnWEjsBUaPpkgnbQ1XGmH6zl2RnAraSxgBu1bOjh8uG/M4p
	jd0m7t/M5COOBiRrODy/eiqoeVCrISaBQ+IwhyJ08WRX5WnH8Oqpg/M4/ScknZUxzF/moYbFJ3R
	mno4EFNh26odX33g02NXEnxLpJbHgBa27SJbai7mBp+GFdLp1NyPQvB0OMg5GS7EpRROcaE+wSd
	NXNijtF8S35M12CamllFItQdFSsFoQQVPxFQg==
X-Received: by 2002:a05:6820:1f06:b0:67b:c5ef:abbf with SMTP id 006d021491bc7-67c22eea5a0mr4039061eaf.29.1774105019006;
        Sat, 21 Mar 2026 07:56:59 -0700 (PDT)
X-Received: by 2002:a05:6820:1f06:b0:67b:c5ef:abbf with SMTP id
 006d021491bc7-67c22eea5a0mr4039055eaf.29.1774105018620; Sat, 21 Mar 2026
 07:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com> <20260320-iris-platform-data-v9-10-3939967f4752@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-10-3939967f4752@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 21 Mar 2026 07:56:47 -0700
X-Gm-Features: AaiRm51fSVtvwDhwEggxITuKsX0LnCSkrAF0Vsy3jEOVrP53K9Zbb24FkFwFkoM
Message-ID: <CACSVV00Es3dGirfe9aHKwvaZog=DtEx9-ZPz1YeuStKobcpT7A@mail.gmail.com>
Subject: Re: [PATCH v9 10/11] media: qcom: iris: use new firmware name for SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: dfvTrdpZcKWXzMZVFpzRMO5wR91rZx7y
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69beb1bb cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=m9s-f9MSkVwDBwkCJOoA:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDEyNSBTYWx0ZWRfX57ZvhfF/BucI
 0t7EcKDXzbRO32P2ql/8cpca2R0a0H5a5KgkrWwXLuG/erJQdmTawyC6CixUWcXydvzgQeFZJex
 L7YUQ61zqxcLRc4I6+Gt+pwidELQ1hHLgYxQGnBKMcai5hu6sWRXYFWu3EtOMMGdarfvOykdD+Q
 ahVN2HsiwqpvcMa82wgqYi80/TWOeqMXbINx00KOvmvm1VyahY8e7i+7zVs8mSrvd7BOxvzYYE5
 IsX8sECZnV8N0UHNy0mZrtNF53SBNOL3wSj3AqJyr1q6EcDQzDLe4iflpO0eRySDXz+h9HU03NT
 7tssHCGym6u7SPCyeCbZ7CeVdOgdaOTbsqoSU3HNNJBZnIORf2eEFRgHYPqp4CQSOchFPaMxYix
 1yyKOA6By1lLVusej+WPzPHNhYrds1AYDtDkt6cuac1UqGG6++kUTbeuhErTWCOw/V62zn81CfX
 wGPF72b2788cU06b9dg==
X-Proofpoint-GUID: dfvTrdpZcKWXzMZVFpzRMO5wR91rZx7y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210125
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99012-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E51952E5E8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 7:45=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The linux-firmware is providing the vpuNN_pM.mbn firmware for SM8250
> since August of 2024. Stop using the legacy firmware name
> (vpu-1.0/venus.mbn) and switch to the standard firmware name schema
> (vpu/vpu20_p4.mbn).

drive-by... how useful is it at all to list signed fw name in the
driver, when it's going to have to be overridden by dts for basically
everyone that isnt' a qc employee?  On the GPU side, we stopped
listing zap fw names for this reason.

BR,
-R

> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_vpu2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/driv=
ers/media/platform/qcom/iris/iris_platform_vpu2.c
> index ab2a19aa9c36..692fbc2aab56 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -111,7 +111,7 @@ const struct iris_platform_data sm8250_data =3D {
>         .opp_clk_tbl =3D sm8250_opp_clk_table,
>         /* Upper bound of DMA address range */
>         .dma_mask =3D 0xe0000000 - 1,
> -       .fwname =3D "qcom/vpu-1.0/venus.mbn",
> +       .fwname =3D "qcom/vpu/vpu20_p4.mbn",
>         .inst_iris_fmts =3D iris_fmts_vpu2_dec,
>         .inst_iris_fmts_size =3D ARRAY_SIZE(iris_fmts_vpu2_dec),
>         .inst_caps =3D &platform_inst_cap_vpu2,
>
> --
> 2.47.3
>
>

