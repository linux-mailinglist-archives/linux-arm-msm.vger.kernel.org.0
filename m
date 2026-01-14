Return-Path: <linux-arm-msm+bounces-89078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 487F9D2170C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E3BA3022122
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103A038F954;
	Wed, 14 Jan 2026 21:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOpmXL/6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xga3NiGD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07F38F238
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768427412; cv=none; b=GOOctPmn1j93KPlVi5YhqAflli9rf1UbSB38Ohs/+wNIMzjd9SwCIiqEDqxkKEgJlIwt1UEoxD+TscsK8wSw72ES687+zBAzfpsL5Ywj84cBBifzKzBZ+szOBgX3/aFwW+mShpHhfamaXWQfYCfn8+uUu5ckcX3rP0j2INnsL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768427412; c=relaxed/simple;
	bh=pM6rH1wDt+deEBUHqE+D5yOSxEdfw/j+X7ePmUlHSz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJXPjxyunbBErczdWSanwH/5YAcj5hF9x655LVnGQ5XpKa+qi0V8BVY4gaAjlRr+dGCSe+7+Ll2+pI6oR72Arr9lLoGATsLVNavY8fVFSweLAIEBqF8LgMBEfVVp0+UIx1Wxkj8aaNttMLp3qH5dp/uuUzbrcTQ/EhFx79yMCic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOpmXL/6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xga3NiGD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ECrncP2736164
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hKeUV2Uhbrfkcr6j7DSR+Sck
	JGwnu8Y7+L8EWtr68+s=; b=FOpmXL/61/kLOPbdbN1pFDf+8qWhvTyi5PGGtKYW
	ijqHDxJbPB/mxNCR8NBIxMiPBArGQjzsvrkz8EK0GfrKZMJ4inkKnAXWuksmDvVY
	9leBlqbPE4cyCr4o79eIdu8mAM7LzzE8ec0ZZgqaHoWBIZWyuhwX+5/bE0PIdtoP
	RuFVSweVZ5oTE27JM3vsVSkq0jaBfEeDTZ/yXqj3Q7zb4aDIpAXm3dLjq2v+4oFZ
	wymTNwD9bHvF8pPNf5emsUhBg+HbchqutQBp88M+Ji7/obtLf9pbXebPlwibiK5F
	9sPPqQeUBiHzpXtmfZi8BqHwPiYNbKOirBd3YLqApBpKRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5hq7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:50:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c53919fbfcso75756485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768427403; x=1769032203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hKeUV2Uhbrfkcr6j7DSR+SckJGwnu8Y7+L8EWtr68+s=;
        b=Xga3NiGDQpMwjEYy+u1fFdI3IOiaEKLefffstzbD4tG+JmB5DxYDGwuJUqXv0IHq/2
         duBXfVOFMM9xgHGiEdPyqghPSsK9HE1DUixaOsp3+LImjNLidReEQHy6V7z7fJBh5rgx
         JUNLczMl8FISoDZnmeeAlhnCI2ETT41NLYhHiYmONUhxoWNq6+lVcCgTm5pb8LUoJbo9
         JUoVreIe6NUWmLS5jyizLgtL7lePbJPBS377YZq1wemFk5/DK/VwUDOHhZrBOjVYqu4n
         qCDn0cdIUadGn3QBJl0JQICycddsLi3spTHTWtAIPbTMPKZ2yYInpYdWN/+qsUzVcBkY
         Kcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768427403; x=1769032203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKeUV2Uhbrfkcr6j7DSR+SckJGwnu8Y7+L8EWtr68+s=;
        b=Wh2WJkEp2Bd0qaf3i2PpNbMFbWChNRv1W14S+Z7e/9XIhT/Z91MG0N39uC8KMx9PTR
         cN3D3F/5HoAIeYFyyZYSAc9+HLxJjAfNNZPgxaxKNJctdGZtCT6K9IjkiUfA77YOzyIt
         bSUh4QWvo75OroxtMaiGapJviUF1+9x+ERHUecH/sY85zw8ahHYgW24kn+I8g0Elck2/
         1vaclfBocRKu6Wb44L98vWZDCfdEIQtiCCcF8wWJ/Y4xx9kmqJ4cs/3wTo2xMaeGNskH
         37T0qeLJA490PeXsa16/pKhWME2T5qgdgyUTt+aWkGF399xpEE87LGUUTaScrrRvnt9F
         DU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXukSJS0a8Ji+bBTXDu7n9x+6Yy3jibD0t784NcmlvwRFjb2XoBZ8d36nUdJrfo/gsWzXvpANls7ZbkETSm@vger.kernel.org
X-Gm-Message-State: AOJu0YwnTXGQfkXQ1gZGYSSFDzqZJfsx6qBoPKffkvChafTP1N9d+lkY
	9r8LpYfONk7pPbO/LAx1bRLvndviNg9bXMCjBA7NfnMHfTueqral5xCPjNFBDTg9tq3s+OgoEzp
	SD2VuQPkwFB3IIPKCQBFtMMfgrItn8XfL4VY9yfJRWKXZOqvGXMTtGZohkpNVk1H/WGQy
X-Gm-Gg: AY/fxX58IgteRCwnS5Ifa7bZbkS6Ogn2Ghcxy7taGm/q4uajh81Ju1h1WjbC1pW2ZGz
	xk9rRlsvs04odjtDMK91Sy9B5MJYMMzeJuzpmVuSaSt3zARQObsCR8BfrussA83a1lyLmov9qzL
	oEJktyoQMUz72Ct6ZgZD8dkzU1si/Kx9VpQ4lU7nNuYGWl2mSVqwF34eT+GCvx0GqliPh+o1pgb
	f2y/6Xw4yASzpYuadBOSl2JjmpO+S3rIYWaSwfT/o/vlGx2wTeNg95Cg1fW4/2uc7g4fr98MyrN
	FaTHiqiqYS3nL6Ggiy927ZDjM/Lo2v7ONHUlE7WvH8/DYL3Fdy1mq0ZmOn6BeGNA0sSRX/oSZ6B
	Nmx9ZXTjzTHVRylA9EvRKs2LiNGwG5r5btgBbqXHFoV+7dLMGolRDLsVp8S7CdjQD1QSa1GVVin
	79vNUwUFmwW3GQnVnMfAmNTik=
X-Received: by 2002:a05:620a:19a3:b0:8b2:dada:29b4 with SMTP id af79cd13be357-8c5318079eamr480715285a.63.1768427403424;
        Wed, 14 Jan 2026 13:50:03 -0800 (PST)
X-Received: by 2002:a05:620a:19a3:b0:8b2:dada:29b4 with SMTP id af79cd13be357-8c5318079eamr480711885a.63.1768427402885;
        Wed, 14 Jan 2026 13:50:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382ffe2b913sm44608921fa.33.2026.01.14.13.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:50:02 -0800 (PST)
Date: Wed, 14 Jan 2026 23:50:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: qcom: qcom,pmic-glink: Update
 X1E80100 compatible string
Message-ID: <z6hbqbsbafddo33hv6b37o3rklv7krcxvqi4rmk4f6bnghlwrk@gkeccm5jkqpy>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
 <20260114211759.2740309-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114211759.2740309-2-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3OSBTYWx0ZWRfX4RW/8dhRzuYs
 5pyFXiwTegFspOK0BBu+2Kh37+Am71pTzIC+yGKA4GWkYD8j9MH0vlSGN9c4LIY6cqCMTxi2A5i
 icSKn+nd31cBXYvSBnMp1e8nx2ip7a4UEyRT1zpXWZ6tJOY3bP0uHK2wWjvdtCF5RIQHf0L42BC
 xQ13NNs5bEsprXd9EigXpD5V2cnMAQSwbnzjl7InPKQwDw8/FbGKq6+ppFDTQdDjFrK/wgVML8W
 ETSODMAoSXMoM46UFp0YPsnbMQyxy+vUkkyqqD/kQAj01K3r1p48oulITbi9ctT6j3Ax9IRkGc2
 M4y9Lt1Z1l98kkLyHkAlFrEgQwQ9sCF98OMTqBg/mWraJ19AwkL24VVVH/StHAcd4nR6Oj5PKiQ
 UJwEy63te2GgZdc5/nDV8WI9i7vfhhNXZaZy34YtKnZ8Li7wQjbYOrbcEiaSDaTnZ/TJyjHaBDj
 u9cMR2J45hD514Q1CUg==
X-Proofpoint-ORIG-GUID: Qmgvak48U239NImsCauMMUIG4y6ewJia
X-Proofpoint-GUID: Qmgvak48U239NImsCauMMUIG4y6ewJia
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=69680f8c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5xImJ3k2O6QUSjG9o0gA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140179

On Wed, Jan 14, 2026 at 01:17:56PM -0800, Anjelique Melendez wrote:
> Currently, the X1E80100 compatible string is defined to fallback onto
> SM8550 which is incorrect as X1E80100 and SM8550 are not compatible
> devices.

Nit: it would be nice to mention, what is not compatible (BMS).

> Update "qcom,x1e80100-pmic-glink" to be a standalone compatible
> string.
> 
> For now leave the original X1E80100 definition with fallback to SM8550
> as is inorder to not break current definitions. This will be removed after
> a grace period.
> 
> Fixes: 0ebeba917f03 ("dt-bindings: soc: qcom: qcom,pmic-glink: document X1E80100 compatible")
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 7085bf88afab..012c5661115d 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,sm8350-pmic-glink
>                - qcom,sm8450-pmic-glink
>                - qcom,sm8550-pmic-glink
> +              - qcom,x1e80100-pmic-glink
>            - const: qcom,pmic-glink
>        - items:
>            - enum:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

