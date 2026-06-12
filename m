Return-Path: <linux-arm-msm+bounces-112881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ny9BH3S8K2okEAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:59:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFBB677928
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:59:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=keyxsWPI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ir8+80M3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112881-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112881-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A28A2302AEF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEBC366DB5;
	Fri, 12 Jun 2026 07:57:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17E36C0AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:57:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251042; cv=none; b=rW/VbG34OzcfccC4DGd88vqbrgbXNKHy3gZOGXd67i3J1sLl+XgVV5YhzaWHLEwCrYP2iBwVV2xxj0sra2mld+PoQP07Hk3uGzzfht3bhGHCgfGNmEVMYZYl3rTtTdf1pJOo/glrKq5SmZ77liaXnvCJnshlUXhRF8t7ef2+4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251042; c=relaxed/simple;
	bh=r178vsKwvgyqUHd4xJpDzrxyGb4ZvsUOAqi6mLxfCRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzkV9xadTLYF9ufc1aLSXuQamZaIWrYQh9yWEiHkhTUdE3Bp3M54mv3iFhJOF8yunjR8Bey5HBeOlnhdC2nrOZxxwrTWQZ/ZpHJe3YKU/6K0fU1yfuSOcjXEs7pU9VqwWqIigIY9zVV5FYZTXm34hqh4XOwpDT1Ukjx48sbTrv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=keyxsWPI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ir8+80M3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C28e2549535
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jOQo7atp0PkKhTHTvYjSenGu
	Cfs6kxtscFTLtljYI+U=; b=keyxsWPIEkauKEmZPfLb2SNcuo/U9LQqi18ufS66
	zSqtUZL0btXBrdAVlBeJxPIaek+bFswen3fvqHRmTXIEsCwe+9eMrFj02/EpNwe6
	ldtWQI+FfyF1ZHQognU8BJ7X8p6RPL2NUhbkFxCzsJTpmF5/OT5btFwnl06Cior/
	T60YA+gBRgYFpqNS5OAJLv6fqjc4VyZzu+92X4jp/A6kNaxqjRufhcqOoBUyf2L9
	y3/fBpE7p1nOQEWlyqKewSB7iXvnPOUF2/q/TOx+EWBZfWO1207E1HdasTPQcJrB
	ezyj/MyJ53W2c3PO76f9k4RnUmYXeUxsHTKAIXro/j2/9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29ut8wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:57:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so12500851cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251038; x=1781855838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOQo7atp0PkKhTHTvYjSenGuCfs6kxtscFTLtljYI+U=;
        b=Ir8+80M3trkpHPTaOeED2hvQva5PbrgaUDr/rxpHF64mWrbCA2sS3NwaA6guNjHY07
         bNYJu87zohmqnrdXNw00rd0ivQaPbB/4HJqhXPOXEXN5UEnOOqmXGysCCrFMniIYgg/I
         IGDZkIlpeSl/SHlfLuhiHYDPa/Gmw4fXjewwnw+hYfH1XjE070AO8kZ2iI2Y6pAVU5Sp
         iBcuv2L3RdmovGkWlaU1AF9gfALW+eHR6LRHrDWdfld/aqQ78BgXaeO6GSgOQ0MFzHmw
         e78GTuuzOJ+DdKXyd3JURSRWqXpvyWsRBGNxjPwZNfWOI8DjzMOwfG+VehD/4JmuQHzI
         2auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251038; x=1781855838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOQo7atp0PkKhTHTvYjSenGuCfs6kxtscFTLtljYI+U=;
        b=bDNelN+4uEu8LJh0Wld2p/qjlsnDiKSY3hPCgk5/CTgXpAGznxWRe7rgibq9oopTUR
         /r2JOYXsldYFTfPF6W8XItgzIvMsxQ2rsscqmba/wZUQcKtr8DxfWhAhLPjYFZx3mjId
         EywvozdUIRhR3KLSaHZak471wF+4abUFvM74yf1LquVU8gsrqTtJ+eVNaaJ+RGo6qS9P
         GgG7DDQsZkg/232WKNjoSQRuAhdKBc2SSqcgy28YOKjpjPVDeU/TlC2TnqBXtpjKrLNa
         tttpTWzAYsHTvvVkDc5B94B39y+/47Mz/vipL/hPAo4IhuAFGAh2OOu9WnRUaPfdJ3/1
         DG/A==
X-Forwarded-Encrypted: i=1; AFNElJ/NY98sKkPgNovLSHO8/d+zCkqLuSKo916JEKReUPqqFBJeBbAk08Gziby0h0RimjC5ZNWLap3SSd58/Q1H@vger.kernel.org
X-Gm-Message-State: AOJu0YzpIb2v8LrnIxm9/gfkHW77oh4FhN9DDBGAyoTcmldPJ+g6c93s
	hYkDAq7s1IH/VyfwFt5xDyregawSxgxAbxk3P01nC71oo1j/d0OdA0PoNYSn9MHLvIrhMNuRWOC
	GQXad0+00+2qxV1xdj9OTyXidzxlLpzi/4q7jq1/lSzds2zNQaEWWqkxH2vIbeW0fDXkY
X-Gm-Gg: Acq92OEmFoY9jGSbPKtTsE67uocaia7cTyaBkwb5Btb1w7KxeN+calHNQSwmvuOlISy
	2/A0EyDDdehjXcpuOnEFJYS60jwFI+nOAA5uNrV/xNbykMpqCgVUr1addsFAQPpAC/lig8VdjdX
	iMdBBqYut1arjWTVj3R0PGYFPpLVN7CXcIJwFRQlAqoEVB3DPdUpVvsqLj7PGgHnOIP9DHAoLwH
	afZpY2RS0uv+NPkDlDoCLIpEJp/AA4LGQa4ZWHp9elxRHtxo57vbTbw0zNNBh5zhhvUaCPZolWS
	YARECY+jpFeiPXXpFn6gHhf1cOmN5rodHKVibNAJhIAC6sxEx7bL/sxe3wuyZMGJ/UdPDvioJ3U
	/k+sAehaPGv35npFcgt9FypArd5XmNkuz1sWCrfCWFhgcs65KU2FsX0kpo/tUg+xaB4FK6sYzCP
	EuCpHrugdp1C+ki4uWu32aRHdkmGiirE/OhsE=
X-Received: by 2002:a05:622a:164f:b0:516:e39a:8540 with SMTP id d75a77b69052e-517fe53afb6mr21287061cf.48.1781251038448;
        Fri, 12 Jun 2026 00:57:18 -0700 (PDT)
X-Received: by 2002:a05:622a:164f:b0:516:e39a:8540 with SMTP id d75a77b69052e-517fe53afb6mr21286871cf.48.1781251037972;
        Fri, 12 Jun 2026 00:57:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f52sm321429e87.6.2026.06.12.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:57:16 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kancy2333@outlook.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Message-ID: <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfXyNUd74T5A97o
 rzk1r43w/0csx7ePSPwTrN/Up4dpIDWe/xrfJvtX+je9ePmK238UbUetBtK9VsIKB/ixpXlbwPg
 wSN1VO25Xbr6A+K4OqCL7pItWPaGJf8=
X-Proofpoint-GUID: xLg6ZYW-98_pFajhgnjsG78UIOrn0IXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX3SoggmxpKYnY
 5atAadLqJK6fnZ30jSYnvejGZ28Oj1k29SWgr8F9Hb+fi/KUJ4fGQt/Smnb0gFg477EH6ZEzJtd
 7LXfotkuVIZv0fyTmCBLIHuLBJTkPtVs3m6zYwzTQy2+PJpk/3E9ApvI4hruiQ4arlW2XUsg1uM
 QX+vCyDmP47Sh6SWssYCGU3n8SD00jq0txRw6uP82/ANnlLgvxzuPIy+BL881JgL+KY73u8UbUP
 RJCmakvddDL2ppBYWv1rrthffj/BZt2VyAMJrF03OggUTsYkRTHzfIRf74u8NGvjyO2VSdCHUga
 CcNMrPZFOsoTozY7zikH2pl3+DKQdU4PWllCF09x8Xyy/MHOg7Us1W1+mYZS6wO+uqdtk8103gf
 77xCeZdEvYiCLAqOj2EJLeDBHFvvElIE7yAw3xG7cfcad0l+wivqtaoV/b6bMF1U2qOjnOC+LZo
 MW5JNK5L17P5avbEDvQ==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2bbbdf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=f_qOLs0Lkya9IhinK5kA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xLg6ZYW-98_pFajhgnjsG78UIOrn0IXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112881-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,outlook.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DFBB677928

On Wed, Jun 10, 2026 at 09:41:47AM +0200, Neil Armstrong wrote:
> Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
> is incompatible with the default SM8650 generic sound card.

Incompatible, how?

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d..508d1445bf21 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> @@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
>  	};
>  
>  	sound {
> -		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
> +		compatible = "ayaneo,pocket-s2-sndcard";
>  		model = "SM8650-APS2";
>  		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>  				"SpkrRight IN", "WSA_SPK2 OUT",
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

