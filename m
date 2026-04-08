Return-Path: <linux-arm-msm+bounces-102327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DR4L0ZY1mlJEAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:29:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A4B3BCE2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EFE13037455
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CAD37C0F2;
	Wed,  8 Apr 2026 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hV3H/GLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kLvhj5J8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFA53290C9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654652; cv=none; b=HGAWYFI0B7u9e0c2LiEoB/yi/c+Ux5oFoPHUnO+2UTrHYPXEp3WimJEJIl6QoLU2YkASZUIQywwFfCkLAub1Gj+5Jh3v0hav6vMqmyzRjkYeiINqnzHqHRG3KjyIkIt0yPIavPkksP4fkEKSVjLF3qRpKMBdMQzON+JMi0DFLLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654652; c=relaxed/simple;
	bh=AfFYQQUGwk44jOZbLBAWUljtUuIjTQ+BWSEwzzWUV1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcagHiXTpKxrCsNOHLGiOPlI7M/EOtyg3RQrf957tB6NWWsRAQhigPmRYr8WoGb22af7iCkjsvJJg4Aj0xTWRK7qMvRR5SBhmM9XTJOgIohr2r/UX4PKy2LGKfzRoSOLcP2l3ZtTOFbtY3hqf1/0KC29rPyQP16ZMqYt0XeIZLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hV3H/GLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kLvhj5J8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6389VAOp2412322
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 13:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGr79M7gQsrIfszEgdj7iKZUWTCSVw48bv+SAF4EKvM=; b=hV3H/GLpUcz5n7Ws
	VA+nLZoULyzv02XkfGa4XoDvamnIyZ/ecUC/rY9SHPYtaUhdmvE1L/LSflZ7ASwP
	oTEfRu3zSQPXlmpSYRVKwMfm/ipMS8puX3ECb5qu8u5pf+KOWvVXfVpUjIEhQz9/
	hur+Jtb3diustn5N5JOyeeUUnm1krb7KweXx8ZjxDemDEnnzgo2WhNrCroYIm7ct
	Kswuv1oYSVqP3SjLK5opUaB0je1JB5z/V0Y8IVDWJsp2VIr49+QMtpdjnkOLcOan
	ZuYaMabh7zs78R8lXMHahDivWwuBZEw28fKEIffNkfEevQz+Zbk3YzJ3dGonXKUh
	XqmL8g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vbx6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 13:24:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56d83122329so412398e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654648; x=1776259448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGr79M7gQsrIfszEgdj7iKZUWTCSVw48bv+SAF4EKvM=;
        b=kLvhj5J8CMCx+nyEH1EKpmi9NW9ciW+6MQs6sduh4QpLjHx8rhWwFn5Q9eSZhJsT6B
         qmyChKPtQePaEDuo+LMDm0Kch1hnC/stm6jJvluMFzZE2Z8+R+5pJ4KqpDDUWk6Elo/C
         98/5yIADwXDssf3Biv8LY/dZNUPI9p3bq38eE53GzbvTN2W+qlJWp9KOlFkZZ/Ou1U22
         QZ6ovy8OU65YLJFOg8w/Fh+j56WtPvvh97axfH3T7np4wO/3YmX6UdRI5KF8JOdbyaZx
         1322CC4LvwtkJjjY2zH/xvViv/dNaJCxAMjxmFr7BPyPrjeSMbxaRIgZezAqX6mZWvCF
         XQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654648; x=1776259448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oGr79M7gQsrIfszEgdj7iKZUWTCSVw48bv+SAF4EKvM=;
        b=g0uFFttui10pdsAbyF8qnJ1B2eA9gmWxFJIuu1LhmEtsln2Zfk8fMfURJ0b5v0zI2t
         VQh51cxXCRRzT3AOtStL1dzJDzudWkPdHWrD+navI1M4pJwIkTgUfUen67KDPebqmjLq
         6+TYd4Z3xo/ezeIRtKe95YflpSMZ6EQmy6kxG5vXGsWT+GgPI8tcf+5nur14yQJSjrLo
         0wymA4i2beAtvJ4d3wTNKmaLnAL7Ry40uVCAaBC9MqmD/IhP+1l00wecnLilqH9ybWXU
         CXLGKkXiVW8Z6Nm0dafN6OdKuyDDhdFuuLgKXSJK4G1frLMOhulwIO4YnWcbksb3PlEB
         aMoA==
X-Gm-Message-State: AOJu0YzaUQyFrmp+kGZLIFIDU2h51pmewZomTP8Aqoed3A5IKhMkSERb
	6j6hbGMFyO1BVW3aPMSg1zpuOm+L2NIJcuMqZQ7PQa8qquaTLARBk7lIpNYQGYhmkfwxFtTzc+1
	895Yu02p6fj8L9SNp/zR93fxZlwIVBA9acUTRLmwFRvYAnpywrRVzErscmYPUaXcwn7qm
X-Gm-Gg: AeBDietcIwwTEE8pefyECroGOr5bfr2KxAQbheW/CIER1J6Z9WQtUm20XJbhvEvkkq6
	D4pjYRkn0MGrT1LJC2/cfJHNHmcsEbKb2sfnCw+7+4lZouJjJinirwm7vfayaJ9NubJCS/qnHjD
	DwJ1crZj0I7Xi5cpX+YvlwvVAR5KnWI6D/w5gXYMDMK6el/+l2yMAKbu+3kUWFDbPCfwuO7YYTr
	OFJsLm5aHZf32zZ3Y5m344DgrbTvEqn1sgpLLYQ2KrakC/pLawMA6HWAuk9luJa2kdgO0EfjHHG
	8/6ZJJaEfSLn/bgcJoi6sYir2g+yLKVNR3OhIXYIFPG8hCYA8envif0xhvySjuIPQGY4ubOq5zR
	80Fi7/0RX74cKuwNwUBfpxl6LIALZrQEkcjBisIqz+dnp8dRvBKkFSTmA52/ncd39egkLT2GsAk
	CjzdA=
X-Received: by 2002:a05:6122:6584:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-56f185095aemr784095e0c.0.1775654647910;
        Wed, 08 Apr 2026 06:24:07 -0700 (PDT)
X-Received: by 2002:a05:6122:6584:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-56f185095aemr784065e0c.0.1775654647372;
        Wed, 08 Apr 2026 06:24:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff131csm650248866b.52.2026.04.08.06.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:24:06 -0700 (PDT)
Message-ID: <35c2fb30-659e-4a2a-ab06-498dbd288cd9@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:24:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: m31-eusb2: Make USB repeater optional
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyMyBTYWx0ZWRfXzGfUzkk8odEY
 HPsFqhjtCDeYgEOcfwlqfPvt92afDIoKgge2SESvxr+4eylzU4Ku453yPI7SvBz/7ln/LhW2IPR
 Z+IKLo7pqowVl5/3CAmT6kkyDiIGKI6GLkkX7/szEQzPb+wTz4Kmb6jvzn3s3d7KBRbYnPTrUtV
 uiHI663cjJYDxYGf2b0KfB+QVLVQWrKpY1WqQl1wjoiFhkmJF+2Sv852O7Ntha0l910o3DYBaD+
 aXDDKJmEAQ4Cy8vu/4SP8tGEhuBVwEnPRjM+73jrzgEot/w5HtD/1lscMzyjqoWSubNa4bEW/2N
 oKvzCvIgBD+kq4anWtv45vlh5TcQ1U+P4sKYnuxanNaYvHTzsh92wHyJqb1zXbURDUWYLf6u9TB
 rzTTZ83XxSZ/SNwWnL3m/gRKoUvVtFO3w/9gX580K2gMEVjGkpHKfnxOhLSpFkR6mTJqLtPMt6a
 ZjNiK2aS9ouejCcCztg==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d656f8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=TBTR2SLNknTDqd2QJGIA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: OTaZUD8bL806al5H-kyv6oHfkETUX505
X-Proofpoint-GUID: OTaZUD8bL806al5H-kyv6oHfkETUX505
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102327-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27A4B3BCE2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/2/26 9:34 AM, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> A repeater is not required for the PHY to function. On systems with
> multiple PHY instances connected to a multi-port controller, some PHYs
> may be unconnected. All PHYs must still probe successfully even without
> attached repeaters, otherwise the controller probe fails.
> 
> So make it optional.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> [abel.vesa@oss.qualcomm.com: commit re-worded to reflect actual reason]
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

This is a trivial patch that fixes probe errors in some hw
configurations..

Can we sneak it in for -fixes, or is it too late, Vinod?

Konrad

> This has been sent initially by Wesley here:
> https://lore.kernel.org/all/20250920032108.242643-10-wesley.cheng@oss.qualcomm.com/
> 
> This is still needed, but for a different reason, so re-worded the
> commit message to reflect why.
> ---
> Changes in v2:
> - Picked up Bjorn's and Dmitry's R-b tags.
> - Fixed the subject line, as Bjorn suggested.
> - Link to v1: https://patch.msgid.link/20260227-phy-qcom-m31-eusb2-make-repeater-optional-v1-1-07a086bbaba4@oss.qualcomm.com
> ---
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 95cd3175926d..70a81ab2482f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -285,7 +285,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(phy->phy, phy);
>  
> -	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	phy->repeater = devm_phy_optional_get(dev, NULL);
>  	if (IS_ERR(phy->repeater))
>  		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>  				     "failed to get repeater\n");
> 
> ---
> base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
> change-id: 20260227-phy-qcom-m31-eusb2-make-repeater-optional-621c8c1c0354
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> 

