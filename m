Return-Path: <linux-arm-msm+bounces-100734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFlzAvpKymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:05:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E49358D4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B01730616E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D7C2DCF7D;
	Mon, 30 Mar 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhRZgcL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7SOma+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64027FD6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864679; cv=none; b=Mzgc27D7DeyrWwLQgAxKfvmcR7bQy6ylaBIryzl2vYsd+anRFDCNxcRcReKCDQRj0dT4dyBESrJDagGMXY8Eu2ca/M36M2SFWcQGNNrlJF8xKrfVKs3/IYe29pRc3wIeh31rlEwNpm33xSvt52LfquJYSl1+jejcIGUX+ze1Gdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864679; c=relaxed/simple;
	bh=2ifJs7gc7gVPHAVt9Jm0cpGJG/pAeeCc4k4Q8RSvtGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lamt1XMtm9RqPa3X7YgC++qIhu0FKsMcFXRnXMM2Q7We3bJuUWzM/4PC5dOzT05bAZevYUXUY95pVyc1Fj7GolQm/4zLspApi+/9Jl3ZV+wa77v1HIr5z6hycKT1TFAJXQA0G5YhrxqICKzAQg/NpcaIvBsmMmP+jATQiOOn5hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhRZgcL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7SOma+U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6sYDu1955475
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/ZDUJpLIQ0YrU8RIdv7Hhr5acIYUY5Mwi2RdHf0vHs=; b=BhRZgcL08VNwsQK3
	GiPGTMf6p7ZZfwzw/PONUuJTybvcvjuuydvrLNb7Nku2leem3edl1qhMLmPOxiCu
	oy7hf1fjtwpS8Ui+SThTvpdb/xAesQZs92btCSdCKPwuoEyz9bLERqEpU9t1qOre
	YgHi9G4EKxFdMsDzyqbAQDFk9qf/lSJbKN73K9zQUQwmfY7jSNuedaWt7PpdrVVJ
	Lre4czxcfTl36Yn1CUBtWZ8h8DG3zTJY6KUWD4eFGl7lyLcgP/oy/oCJvjNe8s+E
	2rR11oKxlLwTcfGGYZpWoIBeKAbOt+vPbnGAizXgIEuG0Yd3Suhgu2nxUs3AHGB/
	IGbIQA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hdgx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:57:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89eadc12c84so9841426d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864676; x=1775469476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/ZDUJpLIQ0YrU8RIdv7Hhr5acIYUY5Mwi2RdHf0vHs=;
        b=Z7SOma+U7uMZO0JGy4qMOd97bnNFaHX+JhvmUwVCK2udpfoJ8V7u0//MfNofvCEtGu
         LAd1c4umyHt7oBTjlr51bGrmwt/5LZZ0jmyk91dao+Q/SbF3xDRd9DyhpFm6OLKqLis/
         TO/stwGFUgEhNeIgD4DinH0PTT4tEUi+YxBvj1ksQy4qNU94iqI0hv6/Cm3bgVX13dlE
         qlDqkF5uc1ZXZ5PN4wMIkPGDRE2rzRfoVEJvBuN4ydPbB/Fmcozd1uAbASr82BKu9K1Z
         uWpIvzw8Pjoo/N8RVOZ/Z98ZcvRKMM7Mx+t1pcV74Wmyw2f5JkQ+ec3lTP/ciWfqdg7z
         ht4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864676; x=1775469476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/ZDUJpLIQ0YrU8RIdv7Hhr5acIYUY5Mwi2RdHf0vHs=;
        b=STgQkDQPl4eHdTZ3pOQEVn51H5km6mcCt8bC/LuqdXlQ1aV8Z5elh7hMxUwWXcQdhS
         y9jD59T1IeZoB6Jc/+NpjrU/9wU+QiIuIwwiRZbGGcGoTcIb3vy0l/re6/5nDok9Z7aM
         U+MK+quVCUPlw1LHYGjfRy3ACOvBwMHQYw3YSJ085HmJ5eFcDAa81TMAlo0bWnFP6JjZ
         nWOCWA5YxDNKXwyEs5SUCDe5Uu2txS/ci8OsIQRLvwM0+wqq4Iqb8EwlGUoL3IArejAi
         k42tMKYhbnCLU1uawvWbky+uM926xMIpImGWN5cMiL7Tq7/lGnDujmJxVNgxUR8qHVpO
         9cFw==
X-Forwarded-Encrypted: i=1; AJvYcCWG60o8F+FtaZ+87NC6QIghmiNYlsps4lQTiwzHH/sR0BIAUWqBEvC9duDmaB6ucsAxhwkydiQin+mCBf1M@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2CjKvivLIQ5l1n7nbxfNdsQ7bE89Gq3fK66IuQieTCD3zBCDj
	iSTWe8r2YbFVGXQOtQkknw0YE1f78oRf+kLOumqqToJ+QWzBe2opfBD5JwDbrEq3qFKx0U1VRlW
	B64sEHDBpy/HGAR3KWNhs3EawEQSkdbYRFu48FXubjkuF+gJ0OB4g1k/3xBfV/dakHMVr
X-Gm-Gg: ATEYQzymmWPtnPf8nuKTczT36ux8/NfTnEGyohRg21LhbJsGUEm+TWeuLAJKn9VpduH
	LTPqZ8fdaiSshjAuDlWNNye1cZO/VJgIRxOmkp5YH1gtzv37r/iEfrFEQyxcjNnSSDRTCdqJdws
	trq5tvxqs+hv7bm3VNLZTDIs/AGX+GVkMLZ4JnxUoHiIkP9/x4n06ZJONpWpdGkSkFoaz7nGE59
	B6OsiJh/FvAqlZVlznWNm/+xoBaF0ou7OaqE4lVhoI3LqSYxWRbf7IFtZPpv2LeQoTi9ybULTuU
	AxBlQSI4mC6hvoom/Cu35dUOYJBhnuGBvjB5iYX0erFh1vv4THU0Fj4b8zS2MkrirSCChd00Ib/
	9K2kc+VJba9QHKwJwmk8eOv8IXWgKbkqXSmwnkv+eqj2KblEgtHsY85DOVYQy4NIyEPgIr4WH/R
	vEElU=
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89ce8f96a82mr125530416d6.5.1774864676513;
        Mon, 30 Mar 2026 02:57:56 -0700 (PDT)
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89ce8f96a82mr125530216d6.5.1774864676089;
        Mon, 30 Mar 2026 02:57:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5676sm270868066b.29.2026.03.30.02.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:57:54 -0700 (PDT)
Message-ID: <e42e7f77-b82e-4349-8dc6-86397491c09b@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: llcc: fix v1 SB syndrome register offset
To: Alok Tiwari <alok.a.tiwari@oracle.com>, mani@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260330095118.2657362-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330095118.2657362-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca4925 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=yPCof4ZbAAAA:8 a=EUspDBNiAAAA:8 a=EnFlE1Or2fI5cV2hC_MA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfX46ZECoxmU2DF
 dICIATCnbIXEEmfh30wvZaQZ49gYcV1AVwyYAvN6Rnesb03xbUHf+Xmd7ArSMsx7+lrbv2Gltrq
 sA3X+gPExyVJmMuQ2rT1mNmzr1eT7umlmfyQ7KRBzGNHsv/vQ02hvy+JcfWwHEvV+AlwJ65+iqF
 OdlrvOhI/y0mvDtin+CoaAgvO6NO1IXUHs+LZsla6kbOKeQVywYoHxMf40UxXSd6saEOFGntx09
 vnxsaXBkDIn4oT0gcs7AvtLm0YtDn7uo6HLmf2XgN3HgyIioY49A07ksxWYW2Pe77cucFLVscyF
 fgZtHOk671edGIT1wNctzv85d2Xjarpu+QaCUDKONdYnuHlLEjphSKGOCgSEJSvmB6hq/rILiya
 nv6xpZUKySYs3CnHwpiE/6pNytFaGfqe/fz9Sm1Vi5lEWH8d9Lh8ohZ+AauMl176hvGg2Dc/85a
 ppdedVBU0Ruw33BLTxw==
X-Proofpoint-ORIG-GUID: g7qbIbkOu7kip7P17yxWkS4c_XRfA1Z9
X-Proofpoint-GUID: g7qbIbkOu7kip7P17yxWkS4c_XRfA1Z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300077
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-100734-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oracle.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54E49358D4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 11:51 AM, Alok Tiwari wrote:
> The llcc_v1_edac_reg_offset table uses 0x2304c for trp_ecc_sb_err_syn0,
> which is inconsistent with the surrounding TRP ECC registers (0x2034x)
> and with llcc_v2_1_edac_reg_offset, where trp_ecc_sb_err_syn0 is 0x2034c
> adjacent to trp_ecc_error_status0/1 at 0x20344/0x20348.
> 
> Use 0x2034c for llcc v1 so the SB syndrome register follows the expected
> +0x4 progression from trp_ecc_error_status1. This fixes EDAC reading the
> wrong register for SB syndrome reporting.
> 
> Fixes: c13d7d261e36 ("soc: qcom: llcc: Pass LLCC version based register offsets to EDAC driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

