Return-Path: <linux-arm-msm+bounces-110983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r5KyIcIzIGoXygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:01:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DBA638568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:01:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jhjgfj2d;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RydogZiZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110983-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110983-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 954B43045476
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0095E344DB1;
	Wed,  3 Jun 2026 13:53:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021F0340281
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:53:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494800; cv=none; b=kggbBn2VQ7MqrY5W9BfUZQrzQ8rsabP876L/S4qptlNCvpqodNPtfuQprt26+AVk1aXeY8sPzmn/4pOG45Ko0XKEmvIv6vPoLwfT6QG8FV/W2AqJJfGfmvDKAqTVu+Qp/osYn62Ol5HeS5vV7Nsviy2uPAWWLW8xf9t4z4l+uhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494800; c=relaxed/simple;
	bh=Pe0/nyaz42Pa0EfzhxkmJhiDip4+rKIwI3SR0E4erKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjzVwkJUIZy/oJXal+bnlTrGDmujUUnRW0aAK+CxGePa2HGNlRIymHoAcyNupWxXBspQN5QCvHnsFhdoK/LLa/pWGRZdQYROW8D7y3ajnKI0mCRe6AMTwPhhAb9UJlg8oNqb67M4mxBXct3+n+6LvcnxqYb+oluOqzb0eTiiae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhjgfj2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RydogZiZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vYfa2368138
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSDRVkC5HWAm8ddfs1//fWde9yiUBI8PwhpcLay7p1E=; b=Jhjgfj2dA9H1mxrE
	7HeXuPqDmBGKvs+II19caBrRbgpUy210t0JtKA1OyA+tS3AsRUGZMWwy3HTgaFQp
	X0UCuK5eSIVVuRExGZk/hAlqYX60auzwFE2fZVTbQGZ43+YCAuvjZ/McYsFnrrNA
	Libbb0fL9phbZ02CrCgGfmpgFNJ2mOfYKnzBfhYSq8xhRv75Td7T48Jqe+A08FRi
	qnu2jXtOcy75DLDFjVZ9K4ESQUQHthKmZis2Vf/EOCLgsvsHJqTg16QIVcGyu6QF
	H7oNJ0IHqta105861AILwvsVfJ6hWnpoCQ3c84aHSKFa6WITH0n1q9rrRvuSWHdz
	z56G5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gguu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:53:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157b3e5182so41419985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780494795; x=1781099595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSDRVkC5HWAm8ddfs1//fWde9yiUBI8PwhpcLay7p1E=;
        b=RydogZiZGhNl+gUIUOYmNhep4skdZb+fXWJfkRdtAp4wEcmTJLwgTrr8pcWwQ1tox2
         jD5PJI+e0y0U3Txvrx47UUeAWSXrwLCj3Hbke2hg2qSgCyrEqJm+9RT27SayxcvAJBsK
         xWClm61oqKLoTtqxMXjxWgIWbf/LnBrGx14pcwqT06T/urOGPVRPuNgl7OJHy0t6qpcW
         lFUFNG+uTaYt51dwWPNJbCbLR1tJ+bdIboOPoVi2DfmQOHIwVd+0ApP7YaHZ2hegOlRd
         AJ96EXe3+wAtvt3idamt+HnOQ+jymGly/Njhd0JuMpvFHs/60ZCOnncs4nLTn+YPdf4f
         wt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780494795; x=1781099595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSDRVkC5HWAm8ddfs1//fWde9yiUBI8PwhpcLay7p1E=;
        b=Pmxjh5im791qD3ajwGDXi2WW6K3OaNyaoa/q64Y8aSs5oAeBiUYPD6veJUSIz8amsZ
         Y/rmP+5pjxmPQ60RBM1ng4FLut387dX3g75BU9fKy7gG1RdUDXJ75VlEVlHuzypv1h0w
         jy7B0x4eFhWwck7vSnvw4NoR6tvZyojoTtc8pl7S2qe0fb/kwiI4AK/37bFb+Wq/OasA
         ghTYrYa7WS2ymRWMXHWCmvuIP4w/0SPcCGLXfK8HM0FC1e+w4Rj5MWHKPoP5jPh/o7vU
         3sMKzr/YjvH5PlPP1F/FKqCCebjnFhrFUDmxhwGOzCFDT9/c57lmsJo5XQ0DTsmf94Kh
         /wAQ==
X-Gm-Message-State: AOJu0YwzbqokTGoZ8U3FX7UMN5rgDNP6wm/MDESeR3KvW7mUfYPSzAPq
	2VGPGkgsGrE1AHBK9qbO1G4/NWJF/D0dMfGZN9k4Ciob9CoEhskaT9M5+y54lt8LydzpiufBbLx
	EL9+WRw2sZNnFcCO0F9rHFF/dU59JQ3pELRv7SL4OoWJg5bXYJhTi2mkq6Jxk6sRnQsdtltd5bO
	+O
X-Gm-Gg: Acq92OGd2M6SYwm1M/B2v4vT0BrfgAbTnvT3Mh7Gmf1gcQ99/GLHeuyq1DxmR/zKjX8
	9NelR+9sdX7NyZ0iQGtDsJJkcJN0lUfahHte1dZogOFjC1dktmojSuLxfaSSZ403k9Nmt4WhSAO
	soPp01gbommkH33AFWyDl3Jczfvpw2/bZm89NXwADk46gMQ/JJ+xWeLMKXHxWBqBT8NlqF+6tIp
	BlJU93gF1pgqOTAgHlMH7BhzGhdXmQaNLLMZUVDf6fszXVHndxyXpxrMdrx9McuurbJbGvpAU+A
	Xwq15PNJLeLABbKkah5KkGpQQc4b0q10N4S9/vhiFkQBy9B1Jt5mQXv3kWCyr+vvHFQLzsUxhr7
	2gkEzwUe9J6VwpA1Q1s/VO1Pbp0L0ceh6IIovBWUQsl8yKGIDRpZm0tBlROr5RaVqAuP3vw+1u4
	SQzhdBVGYDRac=
X-Received: by 2002:a05:620a:2955:b0:8f3:5988:f97c with SMTP id af79cd13be357-9158a2c0f2dmr352296585a.3.1780494795477;
        Wed, 03 Jun 2026 06:53:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:8f3:5988:f97c with SMTP id af79cd13be357-9158a2c0f2dmr352292485a.3.1780494795048;
        Wed, 03 Jun 2026 06:53:15 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2b79bsm1233851a12.8.2026.06.03.06.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:53:13 -0700 (PDT)
Message-ID: <1de59ca1-0063-4ef4-b78d-acd7b3cbfabe@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 15:53:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] pinctrl: qcom: Modify MSM_PULL_MASK to accurately
 represent PULL bits
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
 <20260529-tlmm_test_changes-v1-1-88bfdccb4369@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529-tlmm_test_changes-v1-1-88bfdccb4369@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzMyBTYWx0ZWRfXwYQSoEgt08Hd
 jWP7TWGfqwojD1vrKLSLSYwLJe5RD9llzW2hJsP/A4c4WtIPlYqAAi43Qlf4/7ujl6Dis1vZPia
 4DE+zMJgr31FO/OXZu0TEroLHm5tQly+udH1jh+D7uCzsiW/NH1cFlTqk+BoduazGmkawcctU0k
 dg0NyPDPGRfj8mr6ycNJI2z2XbAn8i0+SJ7nKiG6m5TlHw1UxQz6sQdX2CRj1bQ1EIBSJb4Az19
 OGsIR/Dz3fez/oRpJLxY14bOC5FK9K2SgTSRSElmfwzARigtxkD5lSxhTQp8nRiaPLURf5Een/X
 loH1Oo87D/fStcxT20EDXBSKso+o2cK5DO+SI1kCsenaWnVGMRgsQw3gFLU38s0hVRNoBwcgQ7g
 MaP3WPcNITdj1WpVYyDNHdKiwnuTFa/bULj2OwLyZT8MpbWkHWk5+f5NR8djeQ2xlN5Q3uXcBMC
 64X2lBPFloRQnFldpjw==
X-Proofpoint-GUID: bb9525_P8460d6LjjTfF2s-fgCAUekZB
X-Proofpoint-ORIG-GUID: bb9525_P8460d6LjjTfF2s-fgCAUekZB
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a2031cb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=qVY8_epACHd-z0WO0hwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110983-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1DBA638568



On 29-May-26 14:55, Sneh Mankad wrote:
> MSM_PULL_MASK currently spans bits [2:0], but the GPIO_PULL field in the
> GPIO_CFG register only occupies bits [1:0]. Bit 2 belongs to
> FUNC_SEL.
> 
> MSM_PULL_MASK is used to isolate the GPIO_PULL bits before writing the
> pull configuration (PULL_DOWN: 0x1, PULL_UP: 0x3) to the GPIO_CFG
> register. Narrow it to bits [1:0] to prevent unintended modification of
> the FUNC_SEL field.
> 
> This causes no functional change since the driver currently does not
> modify the FUNC_SEL bit, but align the mask with hardware configuration
> nonetheless.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Seems to be the case down to MSM8960 indeed!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

