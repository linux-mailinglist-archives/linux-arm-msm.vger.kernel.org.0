Return-Path: <linux-arm-msm+bounces-109061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPoJL9YID2rREQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:29:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 414445A5CA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A7A33315C56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED493D16FC;
	Thu, 21 May 2026 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPYQlLot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGEKlvX6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F42202F70
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368130; cv=none; b=pNX/7p8HqlHMeNuF0gGkoQXSoQj5gAHBd3Rj5QEv5UVnMVWHlUqOcEEHzmoeuHIl4B3lMNtlvaj9JRxkiSfjOI4HiYm8Wjo3o7Ym5sd/4IJuiniDhs2rjjdkYXFlJ9YKPcdNSBHMNuiGzFEk1ut/hi2TGJmyXQ3pQhvw2Y7xMko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368130; c=relaxed/simple;
	bh=8LqULcbNlEaRfRxZtDdcZMoXysHCtF5izaRiuTJZZGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Imim+lcK1xQLaC6PuMqqMW6uhn4B6vubrQPdqxFrktfM1y7F+rwI1nT+LClF+dV8wlWZQD+ZVDK6JZnscpjCrwkFF+Sk92bbB1zfgqpMplHFlJdzEe4OW//cdPISPPZLPr+GxQPgwzfbEorhbzB7iNlZ+2WMVacmCGhaLAwuIX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPYQlLot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGEKlvX6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMXY1731237
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OQo6kYzQPwp7Eey7bUz8w7AceljcUrAzDN14KSaeFeE=; b=DPYQlLotn395xkfa
	6r90O2yzPh0BNMtjMi06lc5BZz2FVmXL7hqZvTiNE2ly0He/TK2JUhUSFiWCepKm
	a0Os+hNInTZjr9ZNpTUoqr5pSjoFbhZAffWCYrregi0KNl+120vvm8cTp5m+xtrZ
	pc5QYXJ+sNgTtjlxh1/Tpi02E4UszOzjPVYLkTMW46+Hoh0OmZI1Y++z30bdabVw
	rwShVImXc6UbuYvjQPGwfS23YVVvuRIBGn2cpcT3eUFuGBTCz0ysEaE6ML7v5k4I
	sN5eGxcdtDHJAd9Nk1XiqZOWfadfgIzLZnWA/Y84CtzqTkajxVEICT+IGNCjIJdZ
	ZYdglA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f5ecr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:55:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91345d517bdso128317285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368125; x=1779972925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQo6kYzQPwp7Eey7bUz8w7AceljcUrAzDN14KSaeFeE=;
        b=IGEKlvX627BXq3G8IaoRYX/c3AlUH4TO3fqGJr6rgwQMw9YFABCnHzWRgqlUL3Rgtg
         LnTfzCdp7vfW9d2qtt7bvclP1tzrnLn4MOuoQ4hs1D/oDc54cKm/ZxGivccQ1u6Z0IZA
         1wX2TZvNjAi15Vn6NPiStQ1/6M/XnwUhjweH4zEduyOZJxWNyauckk3K+it+Bt5jfjiw
         CziS/DeXc5jEy1V5CYG6Poxic7PpiRmfojH0/AB4RwG9rOYIdFaXx60vc29j94u1X4ZZ
         bX8HPpjIL8KioHWwaOhB3msKo6gOa5EOOi4em83yoYMVH/cfrZlPQFpFqFdazH0OWz3J
         rjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368125; x=1779972925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQo6kYzQPwp7Eey7bUz8w7AceljcUrAzDN14KSaeFeE=;
        b=b8HV9wbOfQpyfaSTCOX3RmbVDtQdkypdAbHuPqo1JyY8NUAvizmzyrzE/Y++kyLWdI
         G6UEkLB10SYGXJwYABpXdTIqwQ7OchpwW+e6M9Ji5osvdXENWpiJXy2IBkU5mwlpXG6o
         xZ2LoC0cPplox4rJQXctEQFfkuEZlsjE55DRlIosXbU8h8KObn7yAEf1R6TMVD3aV0f0
         /57XWZo6wPgC+SfpdAP3k/TKJSjqRXoIMvQ2d8tQ41Q6lYKPVu55RgWb94OnGHzgn0nF
         xB3L9pIbChv9iyzfYXD5TgEFOsudXT5RNg6JeiUz3kDXXgStiPRLIBdH9gKbUTR4SnzG
         Nidg==
X-Gm-Message-State: AOJu0Yzv3/J+q7/GN/qiSpqBU6kYpIeDxvC3/cVomep/iy0GM0RUSFL1
	5M1/YgCXEP8GaYX/gFP/vwl9N+Ix6TBWX7cHlDn5wsD/cfFJU3+u0WeXHk5MS//3ZQGrxo6NTUy
	Rz5tJyu0AVbJt6l4st77XJLwZd2qlxOGz+HsoQ4Ced7M3zVyNJQCvxZ3YsCIGrJ9dMcMc
X-Gm-Gg: Acq92OEbmpPwCd3oc79xt+TMdITrgcXuBoTtgW+eHbNkxiRgHlEcbYKDzxOi8Z6Perp
	/zAAFuZvmoKjrfa49XOgswmKXONZiEr7RpnurkVWzc/d61nFLwxLoZ5aVFUYnSF7K/Ds5eAEJ/8
	Zi6YGu8Rd0nBOXiwZeTsQ0ZwG0zndlzRVssJFfqVdtvXOpxpj1u66cKKIWzIyM3rjkKf1ttCaia
	aV5Caww0Bfa+zXO5J0ZsmxHPNvX3j8MqS+x4hVPQ7bjtDUYKRnpVSX3aFRTniFofzNQPBNMjmIn
	DXvO33FK8stHC7wzhCml8N8LtGpTQjJ3OF+CYJpA5qFM6tchYMJQWzZigePAKluz5G7pz4Westh
	dZbJzz0DIhFyABg7GX1GDxf09dmn6QgScNGUFGuHBc+8Glld8bC+Z1/7uM84yPFudNxGspzI3OZ
	pfqVY=
X-Received: by 2002:a05:620a:198e:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-914a28d6c97mr262357885a.0.1779368125658;
        Thu, 21 May 2026 05:55:25 -0700 (PDT)
X-Received: by 2002:a05:620a:198e:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-914a28d6c97mr262351885a.0.1779368125055;
        Thu, 21 May 2026 05:55:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aef55b6sm42160366b.58.2026.05.21.05.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:55:24 -0700 (PDT)
Message-ID: <a3a02f29-33f6-43fe-8c94-584994657809@oss.qualcomm.com>
Date: Thu, 21 May 2026 14:55:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom,prng: Document Hawi TRNG
To: Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260521-hawi-crypto-v1-0-9176a3b51bc0@kernel.org>
 <20260521-hawi-crypto-v1-1-9176a3b51bc0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260521-hawi-crypto-v1-1-9176a3b51bc0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0f00be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1K6-wu9-lYFVRRv0r6YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cY1XXd6G_-ydUOxeYwotjQoODcr2NThA
X-Proofpoint-ORIG-GUID: cY1XXd6G_-ydUOxeYwotjQoODcr2NThA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyOSBTYWx0ZWRfX80XbTIzX0Yir
 0xF8mLthh0v+PWNJ66JNo9JH8HYRsGkamYVjMfbUs0Zq2qbH1Za2qPM3egtIsV/YOF8UxnGzSs9
 Y2PmQimgZ0Ow0XTWmtwWZqp6+LnGYn9q+R44x1PM4VrU5J4Ia6iTaacH4rDL97RUHSg8vBD9eXI
 x7iw1YzB9ZXypgzYXhNGfn85M472+R8Cl5o9FOZm8GvbGzzuJgtXJKxQXHWQGN1yuMtsrVG5DJZ
 eelKE7TKngCAgWeIw5j+PXjuths5T0L/IaDXkL3ycV+j4OIitbyOPq5LmFOI3LTsk+a2pFGAsGn
 Eq6e4pZpLFTV2UzNlDFjoMyj2Ni+KEdnNwAZr0daxUMUP+DwvcTNGdwC3vF5hs9fX4tlsAjoGmd
 yDcluD1rb1LW+owRbEKMGWzIHb4p2VdwKgYR2yuzRFgd9+y/DNMH02gcN0F5BTlJmLtZ2uQpnEp
 ypAJsbqz4sRK7pmwe6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210129
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109061-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 414445A5CA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 2:36 PM, Manivannan Sadhasivam wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Hawi SoC has the True Random Number Generator (TRNG) which is compatible
> with the baseline IP "qcom,trng". Hence, document the compatible as such.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

