Return-Path: <linux-arm-msm+bounces-99735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kf5FYn6wmlXngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:56:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D85CA31C964
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07D72304737B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C11935A3A4;
	Tue, 24 Mar 2026 20:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJaIX3XN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9xHHnbw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7253537F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385798; cv=none; b=WVYJtWkjaE0CpbR8eb/ksB8g2fSQ9JokIiXGGozCtgMJGaRHvjCKZFza2LOAe79pQZgK5NTOw1iJedczVqLJs7qJI14WaztoBuS54CJEQQLjCrUoUouvaSHbAWyl11Vez895+8J/47izPljWRWX9G9SgD4TZvgGvyz3ekcHVzGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385798; c=relaxed/simple;
	bh=++lF2FXHTceYCLuNuh5+inPw2OVBfpGxACAkblj3Tu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXc0ICyxDAYkByY4XpT7hLq+7gKvDs2eskSt4cdBmEUKZIaz5ljyF6XmAE/CBn06OVJAacDYaqIgrG3I17/xLf0FeiQSv5uWqTiGcHGZ3VY56H42cpSVYvk9ZcpXE5G7VgmckSR0ozQfGw7Kivn8bwpzredS11IQMX4G3/wj+Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJaIX3XN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9xHHnbw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCixj907716
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08yduP2Mzil9Dxo53ubO/wwU
	qL5hcbdn8QiRrZwDKOE=; b=jJaIX3XNk1H6oL5dh2H9d9Qb+Vl4viVbjkh8JkIc
	44rgkuYaDSq5zKaVepl3KD2DID9ay0Rs7+F92gA4eZbnn8GHWIAbY5gjTDx3xTvz
	/WHfP2j9zS0GKXruUHdSgn5xzajVnaqIY7CCcgbccNoyAYPE4Ol0msAfO8J9KHYS
	A0MQQhkAVjC5++aY5wtSU8XED/g8CHOqda3sIuigrXdXlbZlwR6+/j/fOUHHsSKR
	i5h+WvG3BjBKvfYNW/7WOpx6eiiaAXfr1zskIEJ7fcAiOGXPknAPNdSDis9MzS1/
	xiaQFOlslUCPUGrNQReTQffLRx4aJUHjD7HCLsBTxpomLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm9nnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:56:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b317c40acso104541151cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385795; x=1774990595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=08yduP2Mzil9Dxo53ubO/wwUqL5hcbdn8QiRrZwDKOE=;
        b=U9xHHnbw8NUcmEOxyVOrfTI32goRmqHHMOfSGoSNtBc0e4hzTfuyabmF9m84BVF0pl
         VjLRGNc/EsP2qRP2q3Ok3ziek1UUJ8/Li+NFAwyJgqWPtaEb54LCf2Xqyiyr3iBLsBUw
         65g6BBLKXN0Z9O5yS44IXfXV+WELsbr9dID/78fqG2n3JLvQiSmojvMxGGCax81oQNmE
         C9MYkRzlunKlHbRwAHdYja1C1cuWCE+inqb/EXIEaa8fqgRCOdMH9OLUTGmmTPCJvpIw
         49idK82W+77BONuhct7KjorkVeHdOEE9W4B4vIdZQm/jGfV5szVd12wgYcIGp6iebPP6
         Vw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385795; x=1774990595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08yduP2Mzil9Dxo53ubO/wwUqL5hcbdn8QiRrZwDKOE=;
        b=LqQR2FWFDxtx1t0YJSKPTEuZlUYuKznHMeMpAHQb4TH5EXkDdI22EyAoGJzNPpmqda
         WpWSTyVBVHZ+3GnmKzEbo652ME5euGxQbFy87SNK9uoDqLanUxvzNr7ppPdZa3kzWbus
         sguIkmPGusm+60s5Ze9f+KgAZYGAwSXAaeOSDuDq0CLe1E5HQqaEhFpO8tg/T7VXjofe
         Q6smRUdwySy4K9bLmSjztjUp9oRL66zHBWrf9LuFIMzxTczaZa7WE2kzqMwKkzDiHS1c
         GUVda61VFyGPzXn/b0IYYunaQBM/66TmjKnG7S5jwgWboLWCA9e9VvPSCuOF/gsXbx3Q
         BVSA==
X-Forwarded-Encrypted: i=1; AJvYcCUonCpgsGsShTG9OaW3/DPDAWxxOIIeN8l3PF+rdfNS9USaJxAMq4+cd00VeQ4blljErxREpv/hVmIzw5qO@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxAe5kozGkOXkCiZvuALjTIhbQIns06HYe4jgcG0d/V+d0poV
	qn1MllfhuWoD2pG/fdzw8R2aAU5wvv9teiHGc81X99gcDAfIwMDf6yGtzakuIbC3y9d68hAGg35
	cDfpPKD2M5ZM0ETcXM1Gua+PZAYuzLIvbjik5KMpjvZxMkUmKTV98KX7OLxpDfY5L9GjN
X-Gm-Gg: ATEYQzymOyZ7Xxkuj4zvESs3/zo21Z6rxC5K74GLmfmghQNtJxj0HPWsJ3Ln5w3tm8N
	I4yvU2e+Oln6SCOWQBmIN4ra3ma3AU2E96RKlDJMCRstznkftEKxK5sNOsQWnlnNnXyHb/e7uRG
	FZfXpbfLOxfFhQUVeTZ9wsU+liCHKUpxiNLX6UfBz0mkdt1kI4ifzpJAT4KeAAxo+LJPHv70knR
	g39SfUHt73XQShb1I7ideJAZRbW3wK5aN+hsQ1t/kx/ANWHQhrmXS+ETFaUv/F0zLUx8MfHk6lA
	8iql0MDQ9RcYsYZhknDsqz+V2dM695KhhkWxxMmMdN3QGGocAD4ACGi1hN5UHK0/9qCFg8UzNRP
	UpFQ5WpSC6dKFazxYj2GnIvJwvxhs7igDm28gDQFb7iUTTTm918eUIYoJvmS14IS0uja8YVBnf9
	V4/bUByEkyG4Du9g3HLjPY8wcNK9U2OVQlZGI=
X-Received: by 2002:ac8:59ce:0:b0:509:17e4:cee7 with SMTP id d75a77b69052e-50b80d42d8amr18514871cf.23.1774385795339;
        Tue, 24 Mar 2026 13:56:35 -0700 (PDT)
X-Received: by 2002:ac8:59ce:0:b0:509:17e4:cee7 with SMTP id d75a77b69052e-50b80d42d8amr18514471cf.23.1774385794801;
        Tue, 24 Mar 2026 13:56:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cd1csm3371302e87.76.2026.03.24.13.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:56:33 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:56:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <4rafi4dc7dqlcracrowkpznelezu2bg4fcwur6vsm332jcmxx5@uhno7k3xv5jq>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c2fa84 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=Gbw9aFdXAAAA:8
 a=1lR73kVuVWel2aiOKFwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: SOe9I7fgE80nBktiOwqtW9MaxjTUqxhW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MiBTYWx0ZWRfX31cS5d9VBawS
 7og0GXJ9DCNeOGHxDXco6vcWIapVnDR9duZ5FD5KXYFig7kK0ih3lrm2odLDExgYDIn/8XsemTR
 WqG8TJY2HFFTqTm54fZcyrQWFOvYITpX9M0yu2Ov3H9UUozEiVqSL8aABGSCaK3FKnPCxGW4Sgd
 nm26W6ruIGuC73lOvh+C++EwRHUYyTsjf/hyvlEjIJtMtX6zyFEpWM80wlvW1S3ReMJlGimv0bK
 qPrBIRG79XzGPgx23qVyKBStEfUQXwkjusRfyEltzKqF9v+bGL94CLgA2fDq4dbbNnNglKXG8OH
 HxQNeEnqFiq0JLf3Gs6YXdC4hiL8ZWNPcnym3tKiKxlTvSEeADbB6YuVE0tNJZ5L3BLhc5zTAGG
 JmJ4bwrOkOGV77ZNA19K7Z8PPf7jMj2bB522cjIeeKIxSYNDew6nTqKHwdYxS6xuLHcqoA5WjgC
 rshfzRqoi8ITXSNQ61g==
X-Proofpoint-GUID: SOe9I7fgE80nBktiOwqtW9MaxjTUqxhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240162
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-99735-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D85CA31C964
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:06:39PM -0700, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, venus, gpu
> 
> GPU and bluetooth are confirmed working, others may need more
> testing/fixes
> 
> But regardless they will need the firmware paths specified here
> and firmware added upstream before they will work, so might as well
> get started on it now.

Please move this to become patch #2.

> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  2 ++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 16 ++++++++++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index a5a04ec11eb7..dd42ed0bf63e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -464,6 +464,8 @@ &gpu {
>  
>  &ipa {
>  	qcom,gsi-loader = "modem";
> +	memory-region = <&ipa_fw_mem>;
> +
>  	status = "okay";
>  };

This looks like a separate fix.

>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> index 46119630d721..7948fe3dbaa2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> @@ -46,7 +46,7 @@ battery: battery {
>  };
>  
>  &adsp_pas {
> -	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/adsp.mbn";
>  };
>  
>  &bluetooth {
> @@ -58,11 +58,15 @@ &bluetooth {
>  };
>  
>  &cdsp_pas {
> -	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/cdsp.mbn";
>  };
>  
>  &gpu_zap_shader {
> -	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/a630_zap.mbn";
> +};
> +
> +&ipa {
> +	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
>  };
>  
>  &mdss {
> @@ -128,7 +132,7 @@ &lab {
>  };
>  
>  &mss_pil {
> -	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
> +	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
>  };
>  
>  &pmi8998_charger {
> @@ -167,3 +171,7 @@ sde_te_active_sleep: sde-te-active-sleep-state {
>  		bias-pull-down;
>  	};
>  };
> +
> +&venus {
> +	firmware-name = "qcom/sdm845/LG/judyln/venus.mbn";
> +};
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

