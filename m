Return-Path: <linux-arm-msm+bounces-103144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEl8FvtM3mkzqAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:19:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ED76A3FB0AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15AEE300DF5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2234D3B8945;
	Tue, 14 Apr 2026 14:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzzr0Pie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDyPRkqI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76B231159C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176360; cv=none; b=PBIt9ogO1f5lwFDcrE/rmsvpzbjo3tlcN5KUMDvO6N4t58Z+0mUkW+LyBA1Pnd9AaVzhXfsA06Iaf/smeA3S0QGJFlQ78mpqdFv89Iuh16ixQO0A0cC1VtxrAuvjv0CvJytvYRxY2+pFTLbnfxGDTM3YoZsYSuEYUzZuInXY5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176360; c=relaxed/simple;
	bh=i/lB2Oeq0X9k5L2g/I/uYeWXjl4qrKPsO9J5W8JvCVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJnRTD08tOZmLg9xiVeDgSlqw0GpLhpntiOrCsTyhu8EvY+VHc2onJ+UWtCne7QhASOlTLsAXhmmypffrxM74HqITlD1A3sG9xsvHo3QJhjAFeTMsiMv7W6N4ocSBfPRmmhSg25qlsgQCbReb6UdYd5cm8k9M0xERYFTAXavCw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzzr0Pie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDyPRkqI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBrtnx3681505
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaCDwyeDl2rP+JYe0dZC4JPgSHyiJbIFsFG4/04UYG4=; b=hzzr0PiebiYSgqkR
	16SH7lDvSGZi13bmw03O96NlxNPZVddocmp1ZgaD3uNdtLGuk4R2dfNO8FJaPXrt
	Qjak6seZHFG2sNq0JeZ3UCVL06iWIzN7ApUcnUxdkHUrgW/Qf0LiEjCqrYLkHs7i
	JYdGeYZ3XCdo6asjQSyhI1eanrHscUdgJBfKq11c+mqfXsF2ngfh9oKUiZl/hREU
	36/Ht5Kwfxw4vxQWTNXm9Eqv9Pc9DerVD3hG3tlt7yXM7GjQT/Sxp5bqrod6cG5B
	CmPYFR+dEcxRH9+2XVxz+LS1NooPQx7pUQL0IgEYJDATui1o/EHd9YmJKK/KpDoQ
	4nR+hQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d3144-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:19:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f777e3856so98422e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776176357; x=1776781157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaCDwyeDl2rP+JYe0dZC4JPgSHyiJbIFsFG4/04UYG4=;
        b=VDyPRkqI+94xhsYo/8eJI8JcrEZndIJknrxfLMV8MpNcZBKAM7V7zC4tVlZkfUx122
         QceOOlsaJ3ZXhMxug+jcKfkVxj3Qja8eX9jIGddg++CTZQGwpiF/UxqWAdJ9A/NPnmXT
         qapttIV/W4XKIHA2/XMzBx+uGSxGrGba58yeKlrJ4empPAo3FHgjTe/A2gNIpL/ye/Wk
         FVrEWbcDzr1/6ZxMTgU1n2vHY7Ie7zGxoBMCfgK8siEryaXMs9grmi7qhQ5M9d2nXLgs
         0JJ4+bsF1Rj8KuJMESvoS1UmKmFffWlmpB4AVt0aVjJPVXxCxTBVW4HXxrS/FcJ4OgZS
         w/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176357; x=1776781157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaCDwyeDl2rP+JYe0dZC4JPgSHyiJbIFsFG4/04UYG4=;
        b=PXPZ3ibLM0Lv12/gVbj5Q5zOmJWmgaEUD/5NkmNxKUHmfh+nD5Tw3zoo/BJhYcQx6J
         oGWiN8L8GHfqpWGGvIar/xLIraulrSWcwourEa7NZgjPbFWeySiROJQ2BANv+KRHO8Iv
         mPQi1sgJ/GxfJRW5SkESFgcxzSERDLx2/XL87xAo0lrwKGF6cqbSwtGDZewl6gLuYkR9
         Evmfks/Bn7lXRQ62dwbX3K4Oqv5H+9Dht/NI6IQA3Xhf+QgxDSgCgep9zZchKfDHjhCM
         RZaFl9q78t4x86tmj2BAhOFaY+3/g9B5Zw/BmyEnXrj8JUZIDnYhzMs/hmWkEaOoAdkt
         NDxA==
X-Gm-Message-State: AOJu0YxPt7IDhYOVTuPi1x1OprIxj9jdxr6gRH4hN4VDctMJpJdKzBSU
	B6Cf8Mut3FTyvgwgZOpBOhY8iiLX/DjpbvY3Qngh0E1D6ujP6KPzTWrKeXr0jUo5E6EAdAh6E9K
	9OSEQGOtz7QQchISuPMTjmujjDpl1+OxeczXKTl1r94sGrhrCFi1Y/WBU3tQEFX25lN9c
X-Gm-Gg: AeBDiesJoMF8DP99N/bS0jaT9kGx4pbD42t2bsGk1vRmadi6SuI7qOWUqbsBqZYT5Go
	Nq88XAOYoxnMCM8dmnkJKdwsL6J5z6n/EXVif3h86zp5/EVeyJa/P8sdMY04o4v1ntTtAsWFlg+
	9tEuSXGkUNag9s1JM2Al++/o1dXwIszj29Gi1gCxTjbSo+Y2TvwKw3lKbfntVmf6BEh3odkgSSu
	EAlItqox6h3buSbofrmpozHKzJ7xZE9Kic8tOUU9ALgTeTdsEzx+MwrnMLL7Cs2U6Yyhsz+WTkI
	kgBVZP14Xjt1vj2RdjOK6a7gRMKls0f5kgrQ3mMVeBvbRvEFFol8g7o7e6kvHYLrRmXda4Jqp4n
	4xLf4yDfesHXf/IxWxlqoYoDb1O6+ePjeQkps0CJL163M0w4qnC5nJZnpUJLoZJWy+2/9keqCWS
	iqoOpXRZlqT9eC6A==
X-Received: by 2002:a05:6123:4213:10b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-56f3ec51cdcmr2942166e0c.3.1776176357300;
        Tue, 14 Apr 2026 07:19:17 -0700 (PDT)
X-Received: by 2002:a05:6123:4213:10b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-56f3ec51cdcmr2942133e0c.3.1776176356816;
        Tue, 14 Apr 2026 07:19:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd51bcsm410039366b.17.2026.04.14.07.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:19:15 -0700 (PDT)
Message-ID: <7363d57c-5d01-4e94-8b75-f8b5e466fb33@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:19:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: Add Hawi TCSR clock controller driver
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzNCBTYWx0ZWRfXy0B7ZJlNRDC5
 inoOJieu8a/gVqxr52p8s7M9H9GOvhLUP9+qltxwMc6vCtC6dr97mzQ2xXiSJ+eEhxltL/t9RUO
 LCPUsXuUbM2vy+FVPflgcdqFGk7upgzeClaT+v8g3y0lWkQWHN/7Z7ZSk1goHd+LD3tbcw+NsL9
 aBspJn/mXwv7mQE7NjclRon5vcOQ/2TNcbpMpGey4MHRh9aIZartbP6FV7HAyH57lFQDAISrdOJ
 Q5zdcnmqpuikXB4tfHYMKa8/dWd+JA6XZzZNdwWSeI4NC3n+Hmkk1VdfDg4t9GRqhbMW7LeU6Pe
 Q4baGOgnLbrozgtW5erSmXF1tf2/Z/iZ+FrMmqVEyuxuAsESxWImWFzikgv7YbfBU5G7yxyl10x
 6gmcxGBRUVqLXIOqheI1j571R6cVZ8uwVPHwrjHkXDewJGssZdsOWuc5WAIS9KOXAV4BzpRdVyw
 65BXIfDsnCyre6rVQJw==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de4ce5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HxGML4-F7vsqb9dMjnkA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: AoaHsSMaCLcT8vASJsPzBseS4QC0-9pu
X-Proofpoint-ORIG-GUID: AoaHsSMaCLcT8vASJsPzBseS4QC0-9pu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103144-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED76A3FB0AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 10:51 PM, Vivek Aknurwar wrote:
> Add support for the TCSR clock controller found on the Qualcomm Hawi SoC.
> This controller provides reference clocks for various peripherals
> including PCIe, UFS, and USB.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

