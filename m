Return-Path: <linux-arm-msm+bounces-109593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHAIF00NFGo7JQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:50:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA65C8094
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2D5F301A299
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652CD3E5579;
	Mon, 25 May 2026 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0ZR32dP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gmu7iBg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF373E5A1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698773; cv=none; b=u1oiOAtEnS01N2gxw9cpyJmYmJmDCcp41pVY2dnFuu8W7BiQzrGGj1NEaWo3HZmrVDcQFgzVpHmHTO3e6/DJe8gKR+l6tdynJKCOXg0MsEVihUk2ske4yH0hcK9stLJ8fsmYniR8LFBU9tZ9Fv2NWIgxNuyBfWEi5Awg2d2DEyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698773; c=relaxed/simple;
	bh=JOzlCCQgArEOC9cPMwGXLcMLk+pKr6iVJ4pkajoSe0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzT+JscIB6NJON3CihsaawWSDqYu6aNmAltg02eBwzF2sYzRp+D6A4MYUd49UbMuvLD4evj+gIvwY6/BYkKYzj3s59R7+k5AiwKpWwShvuZWKFe6xmoDMP58cYkcBCfafcT6ndlODhqolW5nit/9A8UbXxcpWhH0tAcTsuv83SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0ZR32dP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gmu7iBg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7WJLF2244701
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hFiV6LzYg2/gkd1HSW0VgQp7
	ymJq45Zmxzox7MJnUAg=; b=n0ZR32dPrxyMsE59gimaKdFweRtJMKTJ66AMq3Dg
	S9F/YIQe9LKg/ekHv+TxEBfMr4FPbc+Urpcy5z0JLGpsvrDimvPF9BpLTKnkZ6XF
	sV1/LNEhWq4h73wT/uCA7nylzCs9gGAyMdOswznx0W+c+9f8P1wIMgyPAWTejbze
	OOh1zCKwyOjHvUFn2yenbwMd9rr4MxiylSZKSGMjhVQXbLKhtJaOkXxp3c92oW1B
	Lsc4bUWADFPCFNVsEAsDULjCg411sWsWll/eoBCp78NhDwCA679IhandwMPTIYtB
	V8/4DDSJDM6UMgk7R7ZMNOoZ3eDhDeO0cTwBS5m91hbJkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7nu36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:46:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cde13e8cso81028691cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698770; x=1780303570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFiV6LzYg2/gkd1HSW0VgQp7ymJq45Zmxzox7MJnUAg=;
        b=Gmu7iBg9PcaFs34oIygHZ13z77jM/8d0HUxPwOgy/mxjzGmeGacpuayrCl/4NZQs68
         TemnKaAppplHER3ANaM3y/o/KZaHXYbKiDUO/VAVzKX2/33itENR4PkvhEVOc3Ktk2Ze
         m/4LVyByUgGxeBGYzNC7+E66rzdBod1q5wPBIZTz8kGWFKNLYFbB4etZwTAaaus68PEa
         uxSJNblreaLaKo51eHKocuPNwOEu5jZd/NRPPJO1NjrPTKYcszZhRz7uwCMbq7jz1sMl
         x7ZudN/D8oD4fsJZ8QLfuEqnLgiIVQP8bARJEezUyDk/2nfGz/vQpG1GiCflFor/L8qI
         0Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698770; x=1780303570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFiV6LzYg2/gkd1HSW0VgQp7ymJq45Zmxzox7MJnUAg=;
        b=RTqKfZIevYiLNs6X+3vgBgxDlp+hVbxNTKFGQDhkji2b/+3yEHqEfGvZ7pMCjQYYs0
         4/nJhcoqQt2nYcwyBRCM57FlljK/QwVvYDuFORDSEWovUmi/tlbCa9ZlCmsvyR8UB75x
         RKB7BKQ3Bn6CX56nTAi2Zcomzx1rOivaTvSVu84U/Tdr6WoNgK2yQFN+hm5CX/ZzIaI4
         WLHV2dC/JMFfEHtORTLaPHaEBi7Cdc+MEKFGy0bajqt6b4k6IDbvkXw/8a2+EtN5fgsZ
         Uum4aKLe2Yll+GII1/seCFgCosZM1T+2bNXnhoPUk6GEqOJ0oVqJaASQJ1RdiY5qnKoD
         flAw==
X-Forwarded-Encrypted: i=1; AFNElJ8egKXPBzo3pUYMoO1X5Q9sWWnCMeXpz3Ze6g95WA8VqbvroLXcPbgosnfgjBXDUmItuzyNSNJ9LUCQgSiN@vger.kernel.org
X-Gm-Message-State: AOJu0YzyxRKqMJps9wO4mW3OhiOIu5KA/0YI6ObLdF6LjGoMvAB1e7Dx
	44ZmnOoFiK66bMsmnnOxEUCNYAetkksPc64ynhbchDICMWpG8K/gW1qE/+v3f4nW37w82v7lZVB
	j0opPJ+euJjONPGmW76lBVRyyxksIhfBPGP3xqixU/eNF4Ql6sb96YJLEcRIWW7zigoZY
X-Gm-Gg: Acq92OGnZuOXLgbq8DsRyEVPKNmB8pG5CzrA1XTIGigBdXDIp9cjArI0pMkoGN1qdyW
	aqld5z1+S8QFULzpCmVgVHcb4PErBrvmJgo5+fcHqHMEotEY2NH2zhgvq63Y+P5utlgX1OTnJEi
	JkJlD4xbcZtz3Rbew58dJuZ/nb+ZYBu8ce+2eB+U7zeErIShAjQd45yDuncXYIMQB0MKeBuDZPr
	9vvjB+hHzI9GPrRin9TJO3Bzj5FgZ0HUCWmebT7dIAqcV3aL78phS2t9ZGaL+5IVmTAB/dMIp9s
	rD32lx7ijPsAMcL3mLAsQgr3i0a0IFLAGF20mMJNTfFSY9YbCliek2GjHwMoD3zwXKACiaHhVZf
	Guab3F2RD5skzWZTEMY6J/W6+ELfSm3WETR9Fvl7rnYUfs5AnhCjHeY6OMDPN5hNm9iVzwNoCgy
	cmYHgcLKOhnXGtG9RUPjBBRPQvq9GXtrZxeOE=
X-Received: by 2002:a05:622a:4a08:b0:50e:5acc:e795 with SMTP id d75a77b69052e-516d428549cmr194093211cf.9.1779698770161;
        Mon, 25 May 2026 01:46:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4a08:b0:50e:5acc:e795 with SMTP id d75a77b69052e-516d428549cmr194092971cf.9.1779698769783;
        Mon, 25 May 2026 01:46:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc0a196sm21352231fa.21.2026.05.25.01.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:46:08 -0700 (PDT)
Date: Mon, 25 May 2026 11:46:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V2 2/3] scsi: ufs: qcom :dt-bindings: Document the Hawi
 UFS controller
Message-ID: <fhdronmweor6vb4yu3ggickvvzj7ls7w4eqb6tsvp4amjpg7ae@xfr4up3iesjh>
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
 <20260522172716.820490-3-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522172716.820490-3-palash.kambar@oss.qualcomm.com>
X-Proofpoint-GUID: LA2bpC-es1KfLkCoRj-h6HCwjRfy3be8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4OCBTYWx0ZWRfXx67jXhSCCMMm
 WjL8d6skuCQhKjcy1OpbGoWojPX//HAAX+aRGmv6RMJdUH+kSpvXaiMOPA8gzFgHCKmsIgWPB8/
 9Vn7PvLfKuZaL26nYhWf6Z6LM8n2q7Eeuq60rl+QTWn4LDGde2KU1nsRifNB6noR/nW58H0VteC
 WJ0583awj9Fpo9fgizYF63qJWNCL+lIRAbBxtfCuO/Mt6jqb7axuA+glPo77Ya2b9OTHQccEoJV
 0W0+ddRBlTmV5lWHWOnRqOl9wYNbzauAlZwlFd0SVMjsUkzTMn3o8p9y1MxTRSqdQmmDgIiyOZe
 2mIAaS5bhYCwd94FTyCpadpWzEenzuEZbDi0mX4HZ+PmQ1MXdBXqmSgqcUN+Oj456nnRA5a8Ddn
 e5CmYDRguP0Ub7F6Cz6yk/h728EBgFR9a6FF7Wown6uFmTQNQp5Xeyrlr/pemlQEFadjH8rck5C
 bI7xAvTyfJ2baL8grGw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a140c52 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=50Eb8-NO9TumpNjsHIYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: LA2bpC-es1KfLkCoRj-h6HCwjRfy3be8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250088
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
	TAGGED_FROM(0.00)[bounces-109593-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FAA65C8094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 10:57:15PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> Document the UFS Controller on the Hawi Platform.

Please fix whitespace order in the subject.

> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> index f28641c6e68f..3de00affa4c6 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> @@ -16,6 +16,7 @@ select:
>        contains:
>          enum:
>            - qcom,eliza-ufshc
> +          - qcom,hawi-ufshc
>            - qcom,kaanapali-ufshc
>            - qcom,sm8650-ufshc
>            - qcom,sm8750-ufshc
> @@ -27,6 +28,7 @@ properties:
>      items:
>        - enum:
>            - qcom,eliza-ufshc
> +          - qcom,hawi-ufshc
>            - qcom,kaanapali-ufshc
>            - qcom,sm8650-ufshc
>            - qcom,sm8750-ufshc
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

