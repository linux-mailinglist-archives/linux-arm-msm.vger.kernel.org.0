Return-Path: <linux-arm-msm+bounces-101028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK2qHtCjy2kUJwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:37:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 335EE36819B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22E9F3088E9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCFA3A961A;
	Tue, 31 Mar 2026 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdVnZsdR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VE3VHeTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB05A3A3E75
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953038; cv=none; b=eb9UPQzylaOs8A8OPMRwHRY7Ri6oL9kWtH8zYOW7e8sV5PNV9yKycv0jiWhesUMYa6wg2YC/UO1Rg46XbI7tzyV20oe6xLvhf301Rk+nkknDBdBWg+O4JNOLVqipTIhOPRBpNeMAjzaXVZTepvlDnow1xE2t2v+xJ8lVad2fgpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953038; c=relaxed/simple;
	bh=D/jPy94guZgpCidPZgT3orWG7hpwn21maqShzO1e2gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=f7JoNs1ubreCSomyRG9ltWcMNhOiakhZC1B2d3uVU7qfbtlnlBcDCN/ce5XFHjFR62jhbA9Gdpy7Q52zfoT3GFXvYNcmlNq73Lw+0ZHd+seq2r+bDoxJHxbBG88nbYE6DZKpsunEcvBLWtp2Gdu4+c6P11gSfHBuniYrVYD4NfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdVnZsdR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VE3VHeTY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V912ZW2761341
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=; b=KdVnZsdRtnR2gq7T
	lcelVAhTrgIH/shudawtLTooth+u06vUOSKHPaVWN7joo65ZrsQGXBO3xviSME5e
	OiGaJZwZ4BF8NJAS33zImqWlP6Blr5Z/CIEyF6vatsJsQ9wCAyQRb1eH3X6WRXO9
	bfQO7pGC0T7RhPCTgkjv9HTFg3D4FXPvw8tI4Qsb1+QJtTaoKD5y9AejZ8r2Uuzr
	Gdbseg2PE5aUXJ1wpfBSLR33U7dvFADz8kpkvlTGAeHq5U6feJQjCYB0GNvWX5O8
	rQLJ0Asv5QbDCjiysclgTbZk4PNe5ymtq+cZGzQbHqHq3gO0anNOvyhvvikjux6t
	UKOqHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b930cc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:30:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f59c9bd28so8056506d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 03:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953035; x=1775557835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=;
        b=VE3VHeTYqfhf7HCpwNq7efIFtxsrm3KQBkpTgruccaomPOb3djiD4XXiFcYHP0E+cf
         75Lr6849472DrjIQMXnr1vxW+vY6KRxJufiKEpkUB7m+rxZjPX/sYEdDuFkygq8hLrmn
         EsQbOO1ntCkeu1SKGCb7lmziXpGoeh4MkIimw22DpNN6qyEmMF5/V+SJE9uonRLp4Ttk
         WPJJN3UIMbck1Kl1BnWbflerUCIdXH6A+YsbWWcRqUWJh7RdQ/GOGb1vhOkAr6RthcB+
         CbeMQy9JxFiXT9HjdvnJjPtpK36Mt3fLjgluMFhQ3h6LEbYIVb8QvRD9R2R24H51r2cr
         37MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953035; x=1775557835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nIEzeVfwHjMoG7ArZioQyE39YEa3izl6iZRYRduoTg=;
        b=CPuH3NKn1Vks/gEWrKBMnnKzyL9y3Y3cm7u9mSeveLN/Ivv3geV6Zy1ydvpet2u/XW
         fXY1fpJWqQoea8GNhhtDQ65gdwAFAB3g0ZOVRPRbFj2UWNBfx0QNjuDwYC1xXA7F8kVd
         eu8gpnMzTNS4cLZdA4fYubyXQ28jebqmCXwL761D2wMAg/8gqDvswwulujnOpgcQnMTb
         1gaxLKyuwEfJaZ/gvBJ6F88l54a3AwG0DWpTita77FX291/P9GCSjIOMDj5FGIjXFsoq
         XE9bopGMCBkMtLa/j4ElnyRF73wlw+kOpLcOVnrmkpd6t85n8ENSteLrO6rE6Q7L20fc
         6mNg==
X-Forwarded-Encrypted: i=1; AJvYcCX1TyrOoBd5bWZjlJ+Onva3B/8LrQhmSdURC1mV0DoSRlebCNFrBE2LKMFqpyK0/j0fISzdOkpbqdjet7Xj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Hb/QkFNDj7LBCqO7kfqfmnOIZT6SZwO7EvqI5KEF8m9E15zn
	eIeerOD9lqanQQ8kqrT9exmbXW9veu+8VSP5TJksGjFHL2ZISFAACwVRAeoehTmTuuoFbelVzdF
	vwMgCoDAdCEP0op/pWUWDnj3w6IhKswXcfPFWe4RTgb0wov4cOW51yr/yViScxXMfEFW3
X-Gm-Gg: ATEYQzzz/saPxex30R37TPu8dYnI1qYMhwcEmyIruRqV2KQPCwVNG42I9ZaMaMyM9vQ
	BT7AOHADr9lwTZgElqqrFEbzZ/ohgGVHFzCGyFtTG6w81P5zBeEW4da8W1l8hw5nQPnVBly3DU7
	lcAXFOxxVIpYt6cdGKTnnmK+bjGR3+/FvBBZWkWWuofvt33a+W8Wv5nOIUmC9qLcmbtoLS8q42Y
	3Df9kbT91+x56DwqXs1kkSuGFm2/+OQv2tMv8jOWZjNt9n+pAvUE9DEjuzXAV7giNxRWwg318WD
	y3TY31djk2Cdo4kygc7IrjRcjc0HR8JcXaVYkHDXLRZKt/U4cQQdaRjRzS9g1+T4Y4ntzPZIISI
	x1GYpLDsHoyqQeD7CHrr4lpWJGgLWnKfh0JMRp9DL6s4jf1EirT360JdWYFdntYaWDHnTntbogT
	yg5K8=
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr178613776d6.5.1774953035281;
        Tue, 31 Mar 2026 03:30:35 -0700 (PDT)
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr178613206d6.5.1774953034772;
        Tue, 31 Mar 2026 03:30:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1dda44sm385697166b.43.2026.03.31.03.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:30:33 -0700 (PDT)
Message-ID: <2a444667-b3f5-4992-aabc-6e7bb1b1cff8@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Constify list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMSBTYWx0ZWRfX6kyLskx7XzWT
 utbuNV1aDe39U0ijHRQQLoPJJOQY+1cyB7mFVfSaQlgt4M5zar3nN8sRAUM3qzdasHuqo0dyihF
 XLJUd31P3Y5funpfw+6YfydW7KRW8MdRvHe0k/gXEwzXNL01La2ucvuPVPraJMOSRzfZMnCTt/W
 itIhNR7FuXTr7uqYhE7HFDnGQHMXn4Axgc5sh9Nc4zj+9cCWtuaBbTsumg0TnMJD3XvkLaEa+eD
 zncnz3BcaoPXH7Xcao58hahGTy7RMeWL6Fer0w3TiqaD25RhX+r3ZjODTLnDXwi0Dob9up3ysoK
 GGyne3ljD5NMn74Ys5BTp1oUhGyHLSI5L+sCsRoPDXBHKXpXf/NVnqxxhfGq2FHTT6DViHs9xnY
 9TytGI5z7CVgVTdT9Sdl2H65OEwLL/2CSltx1i/jysme1wNF/kt41dWWuo9psI1+mEQx5wK+0ok
 nZfGN196thlnlSpo2cQ==
X-Proofpoint-ORIG-GUID: sGxbpl62FZi5EhTHAmRS92TbMH0qTHs4
X-Proofpoint-GUID: sGxbpl62FZi5EhTHAmRS92TbMH0qTHs4
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cba24c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Opsg_zMjOw_MMP9tyQsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101028-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 335EE36819B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
> The static array 'xxx_critical_cbcrs' contains probe match-like data and
> is not modified: neither by the driver defining it nor by common.c code
> using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

