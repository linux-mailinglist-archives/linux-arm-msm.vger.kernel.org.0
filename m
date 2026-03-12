Return-Path: <linux-arm-msm+bounces-97105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFrkMVEmsmnlIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:34:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97426C474
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29C5C301151B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27747376BE8;
	Thu, 12 Mar 2026 02:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bU9DG/0n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFvuEXS6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E9D37C923
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773282892; cv=none; b=ih28DwVT8+a+WxBngM2isJLQiN4Xb28QYa4HD7wS5erh4eAnhlwgOG2OrfqmbeHuE/IEqo2LXPBXG7yoFykqifwVD5EO4GFq8MewZ4nvJsaWr2dIK5ziQqpbsuLWDAo7JiT1N2vdsUp8uouugLPR0aR2yARpc92Vh/2vy8sVePw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773282892; c=relaxed/simple;
	bh=/nqZ+f2nVivSgfHE253neYkKdpWA3AR30w8tm2ouLLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lo8Np/In1h2N4QaxJz1y3p5PNtgNblUtVchWVsq8sJeVlaDPk2oCGTPnjF2qZiM2R36OxsAVncN757MlGkBMEsOGWI8zPxNMeRhSlDIxTCkphvGOLaEk5f2t+UPYHi5odlbyIpNdAZnIm3aKt6tKfV9LS9HB+MRO9wOVvR7/p/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bU9DG/0n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFvuEXS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMN1np1922655
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iEWRLawKUMcKcgnXaUTfRx6G
	DeVA4xrQwkEkodh5kUE=; b=bU9DG/0nTc66IonE7idQ4MmHRQkftf2PntUcGNH0
	WVCTWF9nT163RZsGB3ONPocLRXedGPpSKEk9yGg7YfLGiDFJ2JV7NxJK5vDtg+yB
	ql+baT1dlxX45Z8JQbN9elr43UoQtzuUNDYvEQ6ZbXekZha7zz/EaPKbDU0LQlTq
	dlg+8KEyATszjHGXvnML4oPNDioD/UvpYCKOFLxoGIR2V2RdxcCC6Vn3rGYNKTyq
	CSIOnnz/J8gJeXp+0FrLw9rFKXNEbNTyrHZjeLVfFD0zTqdsI6VABJsTbR9/qmBC
	qUu7SZgQINJgaLTnVQ3W93uwnmfj0xBpOzBTO5My8PBz0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wrkg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:34:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd827a356aso354265685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773282889; x=1773887689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iEWRLawKUMcKcgnXaUTfRx6GDeVA4xrQwkEkodh5kUE=;
        b=DFvuEXS67t5MU/eOFubbpLoM396Db2me0bk5AqmVAuorb2nfQV/ICzrq/TlSlOD7JJ
         CNPhqgAa3xms/nLdmZ+kyG32XdgpKCy2Ud/gxjvQbj/OmiJ23DT55I3r2C+jdfVcr4Pm
         E2468X3xz8LgDAl5/4BqTzh0s123YGcFBgUjFXXEQGPsFh4JymtpOk+zO9EkIS7Mw3Po
         mxOS0ZrxuizX5tlC9eIXbyKszImEE4s+EeHT8+Yw22dJ2qT4MScQsYrXnbDSUK2n/O/F
         zd/RPsNz5cvGmbRp3EDJHckBdFG9VlpAIaXSKCuEOL1Hot3eFiYfoXl70j7pKDcSUvuG
         D+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773282889; x=1773887689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEWRLawKUMcKcgnXaUTfRx6GDeVA4xrQwkEkodh5kUE=;
        b=lArEMLLVQp+jMDjJXw1/kE7aX6W9K4OSbSnq072KFylnHLY/VGxUEeeITLelaPKEqb
         gx/CO7aodEXmQYocpRJXBq7T5tMl0b74NJ723OuQSA+J2PRtLgOUlfkmAUBf2CZKtAz6
         eBFXEKsxI6RflrsrVBmxPX/CkZp+PHSCUzRDtuK1BKb4axh1u91s8HsMWuFFRIfCXP20
         kIkRnUltiTD23Bwk/OUNCBMUSgg0qZYX9IWxmhBVjh5Wn+LddfFg/NcjPNpTf16lqVdl
         xxrkVyivsXOdawx69v8oHFUXlgPqK8YybiFQTTzPNqXorrVUtm6V5navN6cCTh7qDDbo
         G9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlDqIXatGhkQzkvcIYB4VRJ6GaQZQxyDTDYObSb4nPnkWQfPLPE6X87R1UIl7HTMjiDg/ebln00Qej04gY@vger.kernel.org
X-Gm-Message-State: AOJu0YwVfnovc68nDdOgbJsB9N0vAOoAfNFgHaDkfGwhAGhvOKbQNxoV
	OwMQXU3+RVvZGvUsdhltA8+433M6amywIsi5V9rGDnuNbfAE45VYgRKPGb2XburJN/D6cd7jH5e
	IKkXgQIxUKXUPxOi818+mYjOHN0sEy06rVYfwYZBnzSNAIFCzNKY+u2c+533YKiYOFO5J
X-Gm-Gg: ATEYQzx7cxUlncc9bk6t4O8AIq7TrL0Y6TCd7CyWvHC4liVG2wD2UUadKNymhHGq7tR
	F5q48h12LoqxqOP+HX+yB7+fGumexZMTBo2Hc+L1j9QAr/4kTWk6E3Fzx+/d0JvHBZd9IJTENTn
	47M+B0vAkYUgzQQHtYmTlge49TJ7hHf0Rd4WXdtYA3lNt7JmTxfp3wqvz0P6MSKgeMossQyH5SC
	Idl2R+XX3dhWz1rmh5uREeE10uJ4bvXhMOnGZPmi6+oQKjHaygS6xKS0eqbeYsrCLYp3fR0boUF
	LqBncqmfVLnFhXattmVkTXf3tX4hqbzSt+2swd0tx21lPmxJvZpx2armPVRltDHHv1kd6biMWRF
	Y67lEVEYW5/K+DRgo4UcjDh92vcaR3YXLqPZfdcCS5h3K21RR3nOm6wtm3HXTePujr3fQ9+fLEu
	GYWRDB3XoEGGYzwaHQouH/zrDoni1LxuAT2kI=
X-Received: by 2002:a05:620a:2688:b0:8cd:8d79:6c63 with SMTP id af79cd13be357-8cda1ad7ad7mr618461585a.68.1773282889255;
        Wed, 11 Mar 2026 19:34:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:8cd:8d79:6c63 with SMTP id af79cd13be357-8cda1ad7ad7mr618458885a.68.1773282888804;
        Wed, 11 Mar 2026 19:34:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2e1sm693900e87.24.2026.03.11.19.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:34:46 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:34:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] dt-bindings: usb: qcom,pmic-typec: Document
 vbus-detect-gpios property
Message-ID: <m326m6tjiiatutb3s7jhr472grmlvkbg25cqf5gijusioaszxm@6bkxef6s3pyy>
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
 <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me>
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b2264a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=843x3jrLC61IQHLzAyoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ESyPX0z2xBZnys0ssKekCxg0wtNl2qV3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxOCBTYWx0ZWRfX6ySKjhRy2xCY
 avqvjplvIue1rSNyH9h2O1Y7bz/69swIb9wu/EdT1c35fSrXESqfJRVW2J4qfQ2e/NJDhI/D7Qd
 tuLTEdKcl0J1vtw/8X4qYItcz7ERaSc7+gTfQKBXp0HW4YVcYt/vUgtdG2pyF8Ri9thMSpOLO4b
 y36OH1DG4Z5UZ8QJgA6SOqO8uU4wDtRrgmencFxCJo3lc/Hv+VdE0/Bs8EwLPqiL1VaCzLZ8W9T
 yZiogmh4iqaie9hKl363alzZpdNlH6AWH8ysZ5BRZpm/iwX0x4qQMkUWSUXRNx3A3vOHFOqko/W
 Ba7ajoVKuZ+VXwjr1kFryCBsW+dtcbYsrCeAs0igJVIN82KVvfMWxiB3bx6okM0k5hBaAHbpGn1
 wdAs3yTVEvRpoFPop4ZI/CD68cqz2Vo5eK4T9G7G6bqPH2Xlg9OJe4cdmKyqHzzUKi6l0OeBU6q
 4MXynBd6If0IstsyW2g==
X-Proofpoint-ORIG-GUID: ESyPX0z2xBZnys0ssKekCxg0wtNl2qV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120018
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
	TAGGED_FROM(0.00)[bounces-97105-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D97426C474
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 08, 2026 at 11:20:27PM +0000, Alexander Koskovich wrote:
> Add the optional vbus-detect-gpios property for devices where the PMIC's
> built-in VBUS detection is unreliable.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index 6d3fa2bc9cee..f45bf3e34c03 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -78,6 +78,12 @@ properties:
>        - const: msg-rx-discarded
>        - const: fr-swap
>  
> +  vbus-detect-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO used to detect VBUS presence when the PMIC's built-in VBUS
> +      detection is unreliable.

Can we use vbus-gpios from the usb-connector instead?

> +
>    vdd-vbus-supply:
>      description: VBUS power supply.
>  
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

