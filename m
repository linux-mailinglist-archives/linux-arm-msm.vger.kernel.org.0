Return-Path: <linux-arm-msm+bounces-101354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM/SAi8jzWlkaQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:52:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B8937B9C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 15:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 441EA30125A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 13:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707B143CEFF;
	Wed,  1 Apr 2026 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWCX1GRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gs4DolAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A9743C049
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050717; cv=none; b=ubI3y/VdimQqV18rhOZPDtLSahjIZIJEe7EWTOuaftOClV2xCQ0ZPPDs4U6/YqelxEXArK9pPDuIENVgGA8dF0BWNUrASNOdclrAcJ3raWKDciqOheZi27KeGCP4EptIdw8iNO27oVNZMl8FGr3lnMaOD860a0sm/lkQ/LAPUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050717; c=relaxed/simple;
	bh=Vd5vDjCxhWyWtzd1Ee5ee+BsyeQgtwJekLtGxjYqD1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvyPzFYFRAYiypPRkD8LijtLwdKljYvHxXr1ZKvtyOQqey9SPsOBbaHGORKjNcver4hTOcgDOZ2q+hJP3l2nKhKoH/ilKN32fyYDpolgfOor8D2cbJlayqtWGZW4cDfFoeoLriD/ypFBGpiJLF/V42XHggQIGHEujSxiy+QqdZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWCX1GRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gs4DolAB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AWAwx1562475
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 13:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mY+KZaKO/nHSQPzSP9lJCWN7
	OFJ4BSutV8s53MgEbSg=; b=lWCX1GRyqf2hYT1z75bdySnho2y6+VFAedsNHfqx
	ypROgq7k1ZD8ObFlqQnSwNxS53E3mMv5E9pS7iyW1KpCCfFYQRTfRdmEzpiAfOvS
	WcTxXWvoZUFyTFStS1ZRjgL4ariT2m3U7orRCRrNwlK+ROAEA7L+r/FFvE1QoJBh
	iG/5nWOqpYo68ZKSvlQzhZyes2mQRoMTTJKECgbqtwBwG4W00KjSvhzA+H7FiQZ0
	pY0m63a+O101vF81Lt8U+KThWAKtG2g6Tssn4flYUA929CXSVtH6MZ2hlzcTPEbW
	DAyU4Rcn51dXZC3daRvicNmHo0N1u5rYxBd6DF6QAiJwkw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3t5gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 13:38:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso29347841cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050713; x=1775655513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mY+KZaKO/nHSQPzSP9lJCWN7OFJ4BSutV8s53MgEbSg=;
        b=gs4DolABKVMnRY90mPcz530Bwh73TZteteeU2JMfMWWozR/pox/8EmY22o9DC7ua54
         snRoPZJLgrR75m5i17DAyfJNjuygqRQTPzOnKgLo2T2GnTKpJ2Xtjp0R1Fy32LK+fwKy
         WKiFVnz2GfYYNnmWW8PSsfWO4znGEJhR71gvb/KPP/VYsmYL8fFjS2iQasmOPonAil/j
         cv0KoVE2A3vCGYBID/WjO3mNkP9IkSYXSokehFeYdhACeE4JD2+KPXiUU5LyK/VwCE9O
         dOct+T4hsAJrhkZzfWRw2Y2dPZPrXXLgqHAu4IRvXyJEOFvBLzZ8dOONIVEnyTwfNyW5
         qoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050713; x=1775655513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY+KZaKO/nHSQPzSP9lJCWN7OFJ4BSutV8s53MgEbSg=;
        b=S/pqZ8r0DgfSrcCZusTo0MdVfXJ+5NfVT5EsPNI18nKWBfqdaqkjT/9LfmS1qBy/UZ
         We2z6hYIW23RtkAITMLcy0dRB/Uaa9EdW57U3p71Aje8qWGDvJMUgjQjDpmi2g7LHFlH
         Lo5z7ZTaRpC/daIs8Ifxa5yuNzYQONU8hVNMemYon+UpjIEVD9Y4ooSkrzYhPRIfnPIx
         iKT0+iZe0P6rsUa8x0Tpg5XJvu57XRIwS/sZyQw8f1Yc+h7FWqIhUMyQzG7uGgWn2zvq
         hq/NNU8ewfMkRYDRk2wZuOZhmNzKV/R+Tg+7oLulIK7NUQCbUty7dAbboXvPthwmiakE
         9pjg==
X-Forwarded-Encrypted: i=1; AJvYcCUTgeSW4Dnmc7jHh4TrhdYm+FA1jHno5YVLvcllw8jTgw7WIxts7Ops0znPHHo29UnTkn2ta20hO9uDW6Hm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/S9m51mOOrddFm29QoHtYIrCks1lwwyrV/SkPOh01lBOayGUB
	kv9UQ4jv+VIdBawp1NLfgx6HVOH/UFGNUhBo2lFqtaMp30qoQxz17YI+HHeNndx2O3sC9A0yQjc
	iCrjpTaWD7av7QbG126P4/hMMcQwzjtHX0W1ubljEM5wUFdWmg7OYtlnsICJJQLxUhRtN
X-Gm-Gg: ATEYQzz02OZMc9mZpFmRSNyMUKK6kq8J7z7PHCtAZpelBhnVxe/12fFnwQyqW9uoLEo
	3ugYUfRtiYUt2dnBll1y2CLAXNv7JRGWfI1BG/uTOOedSyEU2zwmQD1yclbCYXUnvbwexazWb+7
	bkkb2ZQehh1NbCSPN8IFhGoJf4fzKrSiBX0bZskZS8M+TSdg2tvl4VsSzWg6SOjXgWKX26MMwiE
	h4Qo0BOpVXoYUIedkcyrV8uxZucpFgJdRK6klx64MOFcF8pwoUuMrHWORrbIpbUy3a9wIv22xHc
	ojZdXPpHijHoQAOVzqKJfA7wGxFjurMSfCoeX+ULqa9BzhAqO+7vXXchKlOth399lQFiikPTvAg
	4pVWfTjyE8HnCuUf30xd6VLD0Sd5J6mv48Og9ScXQhUldf0RNVlKKQziBDwwE+TQ4XRsrLrTlm3
	2l4wRWYF9tLjUWBpXRvPLn3ldSjZzQJwafjJc=
X-Received: by 2002:a05:622a:8c0b:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50d2c8ae8d9mr86225191cf.24.1775050713302;
        Wed, 01 Apr 2026 06:38:33 -0700 (PDT)
X-Received: by 2002:a05:622a:8c0b:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-50d2c8ae8d9mr86224781cf.24.1775050712776;
        Wed, 01 Apr 2026 06:38:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f25sm29362331fa.9.2026.04.01.06.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:38:31 -0700 (PDT)
Date: Wed, 1 Apr 2026 16:38:29 +0300
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
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 14/15] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self', add memory-region
Message-ID: <vygzhy45djrxg6z66nin7grwmj2ihwymm6tyezv35ow2cupdos@7ybc4ktuma7g>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
 <20260331-judyln-dts-v7-14-fbbc4b7cc557@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-judyln-dts-v7-14-fbbc4b7cc557@postmarketos.org>
X-Proofpoint-GUID: pIgFB5uQtfaKIckW1XkXy47znDVcNDa7
X-Proofpoint-ORIG-GUID: pIgFB5uQtfaKIckW1XkXy47znDVcNDa7
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cd1fda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=inTf1xXadgHeHM0vA7oA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNiBTYWx0ZWRfX0XiC+CJPFFIf
 DGC7T+3nTyRJzLXCPecgOj0j0whshje63cOupIICl1uTO56iqvMY9sF6cObibmrN68ChAnUaUt1
 43yNZJJubzPFvzl/mGpm56PukRmu/cqWPsl15Ta90xKZV66E10us7HMUC2FHYbD+vMRtbBsJh6y
 d8dNrUvD1zB5Bdp++9zlMgFrwf+C4/OvSbxICIBQKM2JDslNzhGK+0WJ4UEkWHCHNOCfptv4ATI
 8xQ95EK5y8YcJmjItmuUxDFDD41h+vMyAKXj289YMiJQoEslFrxLNQR3S+/AT0/XRaxN+0QCRE7
 iHfafqCMOHJihgylJS8JBV5PBBWM8q3uEg0iYRgns4IOIwqgNue/TB8s9pZDXEnIEwtyDcm8QK+
 QWbhxuVbBehKp6DYw1nQJIvuGCxzpWtKk5fqmZaqMZy/haG3Nqwqkg9WkMvHEg6mxlpka9u/J3U
 ZaWmNo2j4RpLXlnN2og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-101354-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 08B8937B9C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 08:22:48PM -0700, Paul Sajna wrote:
> The modem firmware for this device doesn't preload the IPA firmware
> and requires the OS handles that instead. Set qcom,gsi-loader = "self"
> to reflect that.
> 
> Ensure the ipa uses the correct memory.
> 
> ipa 1e40000.ipa: channel 4 limited to 256 TREs
> ipa 1e40000.ipa: IPA driver initialized
> ipa 1e40000.ipa: received modem starting event
> ipa 1e40000.ipa: received modem running event
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

