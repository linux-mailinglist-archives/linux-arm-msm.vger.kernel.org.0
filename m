Return-Path: <linux-arm-msm+bounces-103153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBgpGwlW3mmsqgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:58:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C083FB889
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B63CF30143C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2705F3E557E;
	Tue, 14 Apr 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAS9D+o4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EM4S1xvl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87DC3DD533
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178693; cv=none; b=ku99JEc4vHfwKZP7u7vRo9AWlxMa73qbDwZqAyZJVmnzGxRUcy+liPSzD1cn4Pf79zt7WKK6hSPKbIrM1Ur/VK7jnm0c6B6VvVA2es1aj6s86BfPjtpe6W6RVvZx/mN7xopicLWrEv8ZmCxSb2h12gXZ9qarJd+7sgmy0Dywm8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178693; c=relaxed/simple;
	bh=HBH1KRs3jRWZUj6eMPpW8xLt5xPVs3cJ2L1QWzkvk30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pX3ordYoxbnv7UOfi+MCQVG/OPvg0grwEAEZ0ElZVHMxL+ZOB+bGEn20hAXXDaJTn9Xrt/b/sBpDM3kXtO7RB5/+zus2UjQKnCNqgQTWDbSUNIFPbcOIwTYvttDjJQNSd8XyOSAM1iUJjmLap2/GAg305DgTDLdnnzrgmILERFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAS9D+o4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EM4S1xvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBejkc1479036
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gce0sLg2N2F8GuVSRPDawuiW
	1Elu+tqSsHfkICdhZFY=; b=TAS9D+o4tkBbPPwXwAqpcRcVY9kT98AECTzyfxBd
	QddVMzrJALCsqEKwz91EDS7FEQGGzklQVoaK39OURmS450IR0XBRThD4JmcHyyts
	k4PIFJXOOXbB7pJocPTbQCD6a2B6YNbjcdsEvNDPepZoFw0OSC3p3k5uafJjnnc6
	Z9G53SOrbZ77XmPEgHAvPO8AnK/YEcdpVpzC7pilOYi8M9fhAa4fdxugEb912ugr
	l35n/6qRyHf4A/pOuYY/7VS7XXjyn5JYHoyD5nXs3T4v0f/nWpb/ZSG8+3qAIq+c
	mBWGlwA1O6axVX7iyYV3Dj+LlCAXclYKQakMPwXpDRNsAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87j38mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:58:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8ed08aa4so96967371cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178690; x=1776783490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gce0sLg2N2F8GuVSRPDawuiW1Elu+tqSsHfkICdhZFY=;
        b=EM4S1xvlS2p0tA9LePCvtCaGpq5NPnFZc50nqwVl4XL9XxdW0f8nIMRfCZBF84GFKj
         oLFbKX5b50lAUWtvjaSLYc57t6+5tnAbaiFnu7lfQSL9Z9PP7KRXsr5aWkgr3uRSWWau
         f388Ps+4dvWmRHD799Q8suyNj0tsUuc6Ynz/wOYgRwQv5OdCQFG9uAC/+fDEHkEJuzyX
         4IcraWUKgkzNehMzjYp8H5cFDdmeiOU1l4y3J6qT8s6TL4D0UoyeeJXZQhwJmIMLCpIS
         SLqc+72zTLsg+/z/PI9RoD9nvAxHGOIqAukBHYmKrOSpOdYbpYbloQKocvQnATJ00D24
         /Ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178690; x=1776783490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gce0sLg2N2F8GuVSRPDawuiW1Elu+tqSsHfkICdhZFY=;
        b=LWhmBnUBaSo+vY5L0fJpelT6JtF/fryjlfei4U7KYS/urHM5EeueuRY9Ou/bSf7YEV
         +/rAXMNYtfosgdaVec0dGqcQe2pebtE90Bob9naXVyArQJPAw9o8JvC/wHFDtHpl8bjs
         K+qKmznMXbIS3G6NetOM1VD+WzbpnBuyCtTww/5TGwnSLXHvkcIvIC0XuKbUVwem4FE2
         PTcwNIyPzMAP1sAZ3B996EIPPBWnUVOF9Fuo9iJ4kR7QgcUQ8Yj9ZKGi0cKreimL4CvS
         YimY0Nr5kigXUaBPBCEse22i9d52piQWdm/KofbQAmBVsWNzTrQUDKKBq+8TqQfVnZk6
         fqsg==
X-Forwarded-Encrypted: i=1; AFNElJ+w4SLHclSq0UR2cgqrJ0hw8yO0qrGpNqFVYmdtTeAqFx4GSAmlj0tWyS/0DwzFtHf0RHC8YxkCHrAkTCvL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz05iYchv2agjF5asDvs0T2H0WgV08eUElhS8bmD1sd3rdXKkkl
	1nRrcHMjQTpWwM9Ps+KvrNBlisI+xWP30K33Wnn8VnmuYkWOkletzne12hXNTEB77Cs9wMcjBxI
	wv1c4wqVX5KrO84n7Npla99z9dhkEfZGxXR9YeXETOM46YE1RJWyDoLT0V1MIfkyplSV/
X-Gm-Gg: AeBDievzYHfwI7CMPWFZ4YG3u2PeLxdKUQ4gBIrcvvcyruBBHdeiNxlZeADQTSNrcYK
	Vnc36fT3jGvjNS7RDWDKCBSYRUJe7if3XSqQi1cyOSW8wFE+iv873OVrqFko1ZhITAVMYarQmB5
	jiWQlHTFHxb6rZJd8CM7H1z7Yk2NzjIgcloHmOpXqd6t6NFCUuWiFrcHgQRCcm7+5Uj4IREGKvM
	pH6DWWqylFSoj3SXNOGqysmo9bQ3ZjO66THnNbsDPjmehxLwqllfjTmGvNT7YCWZQHeGNe70HIe
	7ef4nSKG8AdWEsC9hBpO6KycXBJrhp0r1GFRWXh0bU6kANwr6uwCSaOoc2A8QFrNAU+GcEHKBfK
	io4KGAGWtLZaw5sL8PLtRps+IDbocxU/GgwzsTKL+rwlT0dGD15EI4CQMxCTbUZ68DfURTPr0RY
	UaphfZUD/+2zW+kqNkJDuvATa6mBc981IW8ThnqWWaHzdxbQ==
X-Received: by 2002:a05:622a:6a88:b0:50d:6557:5c8f with SMTP id d75a77b69052e-50dd5caaba6mr182791411cf.58.1776178690093;
        Tue, 14 Apr 2026 07:58:10 -0700 (PDT)
X-Received: by 2002:a05:622a:6a88:b0:50d:6557:5c8f with SMTP id d75a77b69052e-50dd5caaba6mr182790931cf.58.1776178689411;
        Tue, 14 Apr 2026 07:58:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm29802381fa.23.2026.04.14.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:58:08 -0700 (PDT)
Date: Tue, 14 Apr 2026 17:58:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: qcs6490: Enable DP audio
Message-ID: <lo5ecln3eq43cg3mjdy5qijpk74bdj6zx2yvjjojj67an5k6e2@j5h5etlzipt7>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
X-Proofpoint-GUID: L23PSsWNh2QNRnq8vT4IBhixCs3HCKNP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MCBTYWx0ZWRfX5NJpjpk05n9W
 XTWthxbI49/0QT43c/8DayG94X/kbb3Z0g5RpztXGipYvjnonQvX3HvQGO1BDTIrShDm5M7N2sa
 KsfCrDbwVP19NG53Mca4xAUjExFEYn/Z4m/K1I5HwqQXi68O5PiXGweBsErCzdR3YOZhK+oGhgJ
 2tyZEBov7gkpajSBOyf7/ey2ck5s9qD1o7sZTsovB+6kAUouwkiAYVaQbim3AJkHKYBhG/Bg7RN
 SElg9R+WE1BMkOp8EFYK7z/2mLaMYJBHktaMZt95puq0FkRxB2lUPiU30lAwGytmYpqOfUmZbhv
 L8tQtPlM0fwEcHl8aRd4CIh7rS/OoJfLMoYcojZ+NfQC7JUnsuTF3gje6x1eEfqkTeM7dJTcp15
 o0p5p8GH2RVDPWATsBxs8AtzbikOcjbPoweAQPPwoWrGV9hAfRx453vNQOJUNgTw3Wfv1F1bSZ7
 th/0NjD5Yi8vPO5Q31g==
X-Proofpoint-ORIG-GUID: L23PSsWNh2QNRnq8vT4IBhixCs3HCKNP
X-Authority-Analysis: v=2.4 cv=DrpmPm/+ c=1 sm=1 tr=0 ts=69de5603 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=e6K5Mrs_8uKg62F0G3UA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140140
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103153-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5C083FB889
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 02:19:35AM -0700, Kumar Anurag wrote:
> Add new dai link to enable DP audio.

DAI

Also, will this enable audio for the USB-C DP only? Please add support
for audio over the mini-DP port (or mention that it's not available in
HW).

> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 2e4062052828..90fd8822dabd 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1169,6 +1169,22 @@ platform {
>  			sound-dai = <&q6apm>;
>  		};
>  	};
> +
> +	dp-dai-link {

Still keep it sorted.

> +		link-name = "DisplayPort0 Playback";
> +
> +		codec {
> +			sound-dai = <&mdss_dp>;
> +		};
> +
> +		cpu {
> +			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
>  };
>  
>  &swr2 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

