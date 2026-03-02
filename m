Return-Path: <linux-arm-msm+bounces-95022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIedNB7TpWmQHAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 19:12:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7621DE4AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 19:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6828B303C50C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 18:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FF733509B;
	Mon,  2 Mar 2026 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WiJuAJR2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjKLlTGQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA026330D43
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772475161; cv=none; b=MrNvCQ3FaMEUw4DLlpM75UhOv1dfCQY39U0zTu4S7zNudkG7ggkHNtXqdYMYXILOczGc+RQvruR40GzSpiqui0ayoUD92rsCmOFj7/b0Gv6OUWbEpfjJtCYtG1Nrb3bVmZGDUV0TQgrM4PRSefmjVJu4FM/WUeE1QQk6dvBpWA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772475161; c=relaxed/simple;
	bh=hOaHl7xgoH9NNm4Pgd22IX+Qx3Mkn1Vn5XBCR/6m4aA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajwCBZMLcNtau+bFchurc5cL/5IkRgQ7Xjxdm71NwJjPwnKOzN5vjeJ+g05U62onotvszoJmu4u3CL6QX00J7/z7c2QqcwPhgtiZ5gB7Pq0Gq1AAG8OzSyhhedFzj5zCIOLGZktRqa2cdzFw5ffM2M9cFHKCuazrIJ8PNtI12aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WiJuAJR2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjKLlTGQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622G914R782814
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 18:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qvs6JsEJEphsd1VfOoRnt/bHD5uhVmAPnhjK60w7nJQ=; b=WiJuAJR2IYvAw+WN
	15TkgRGHAjhTmNd72N+AuMapk6udlXbMUMqlqRM6xzforOKjNGzMpsZoHmWtlccw
	VXK8IrqsIDFw/viH5JYbw+lILDx/nUcI0xAYy/wCoDCbDgywSg9TNLjVrA28JN4W
	Gbf/ywx72vtTuqnrN3KQZwMKrfaHs7MaR8Wzr4M7o/1uLMPC2jJDYO67hE3mhAJJ
	4l+F0cNkr01EnIdjM0KC8vd6Tkn/+E0GWoTEJ8vXZ5DhubOmmSew99H8UTfTlu6m
	QKMu+duUSiW0U1r3Ppxmvpx680tF2ovkPVPJ6Z9kdTgqYsAg1xBxY7XoTl6WBJSU
	iSdWKA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u01tep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 18:12:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aadeb3dee4so291333165ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772475158; x=1773079958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qvs6JsEJEphsd1VfOoRnt/bHD5uhVmAPnhjK60w7nJQ=;
        b=hjKLlTGQNn/tOLvH1MOhiZ+DIjdiX9ik/1AzDTxbVTFUeZ5q2C+H6szu6hck7JcRzF
         3CdU2pZOxhiSiH0nkLU/wdBl3VJ9015pzrxEabBdAA0kUHhFsQirT0jw3Fzp07Pw/2rb
         pLzt0JisPIpWiskSEy/INjjXI6Ql+tuHiAf+tETYZow9thdvg7NpEYE1zmKgYLX0Yt+A
         RdXDs0WHzs7cSALgbimvelrplW4JUUhr+GJcC5auTg1NKNBQeNaRwQYJAt8YE8DDJcI4
         a79NGm350y+K/5YsbTRMMIstYdkFrPqKhqE0OlzXPe57MxmZdAhTfJnJ6ko58tkBHEG+
         rpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772475158; x=1773079958;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qvs6JsEJEphsd1VfOoRnt/bHD5uhVmAPnhjK60w7nJQ=;
        b=ZyTAQqUqTtMFOWa56yt4G5OPmT0yKl8G8CV/3fofk4uUj5N8R19p9b8xlGG0La+C3k
         E1WRC0aXYjlOrhJghfnTFx9ZZhtFJsOeJoX/MkICAzVlqmrZk4F0s9E/tidHUIrAZygj
         3ourvOWqy+gTPWVvMaVUj1sop4VxMxP3UtgRLozPDGS98BvD57OV53LjJ4/iiyumx/Eu
         0e31PSBIEgZ8K66yBWXvoDt6flrCWXS/ful/9JWF3cYz4E37dFv1r7hIXolRuw57HsPZ
         djn9yEcgw4nGI2uhnQCuVGyI22S0V9eeXcMNBbV4cAy0w/waWEKaCbYTvefsq5c/5W1s
         Li5w==
X-Gm-Message-State: AOJu0YwyQEULEep5dc/lIIyE1WRvS0ZiKEmD+V7Xj1b33CDc1ITIl9Nr
	XOeTKiQTyFBI6PnMY0aav3IApilT49fQ7LGiwMGMW9QVJaBthjbe1V61RyoWTBcuCBFT8E+dwZe
	hYzHfZsTKG03dgqiH2kHjrHIJY8BjRR2iO3jm9tc6xylg9kwRut92hL53l6aaDxqt+2iN
X-Gm-Gg: ATEYQzwBWz1g3ht5nsFZpo4KWRazJuCcgIif4Z8qyGrU1z5CUe3SMTkIZQeM73qP0os
	1L0u/6MM98hJX5O9ebdSAiZzMrEkI6F0HdG/SoGAfIDSZhobKK8Eq1+Uoa4rdfv1IdINEz0A2DV
	ztcMEHh76SieWFFsiYR2dAGgagLKuZ/bYA1txdoBKXXAeIE3dczO4VNJN63KBYJwNqMIukXL/0s
	ar3wkHUsJn/LRDFybyvNd6RAetF/7UPyifDaeNvGK76893+IyY0HA6zIEsFJcTfNcLhOg3AQJtU
	BDZbE7mt+/z5Qxk7b/+HxZLiJdrcCBHnLR6P7jegchyVIBl32SCvDE19Npph3G/B7qB4bCbJ2MX
	lGfsEVr/XwiLBUIOaL5xTL9NTYF0eW7IVuK5qSp8PiH0=
X-Received: by 2002:a17:902:c951:b0:2a9:622e:fd46 with SMTP id d9443c01a7336-2ae2e035736mr140778545ad.0.1772475157555;
        Mon, 02 Mar 2026 10:12:37 -0800 (PST)
X-Received: by 2002:a17:902:c951:b0:2a9:622e:fd46 with SMTP id d9443c01a7336-2ae2e035736mr140778255ad.0.1772475157005;
        Mon, 02 Mar 2026 10:12:37 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b9b32sm191491435ad.66.2026.03.02.10.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 10:12:36 -0800 (PST)
Message-ID: <8946c2fa-7b05-4f58-a11e-fa077dc0a267@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 23:42:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ubwc: disable bank swizzling for Glymur
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260228-fix-glymur-ubwc-v1-1-d80e3fe0dcc7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a5d316 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=5paVSw64R4kEUMRm3sSMUA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=IkhWcgckFE4J5cQLOdQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE0NSBTYWx0ZWRfX7PA9XUW0m5SX
 XqnsVd6kLPuplMq7+/Vj0ETtZNzLesy6EswUScbZxRLNTBqHqL/6ARgrRAGETEzsCuZiGg7bTY9
 7ZiVy6Dbqvd0nTceZ+SiI6ZBSrUD7ZB4i1mSq/OJnosYXLC+H0brT4eOoaGRE2VXuATzuZeUmEa
 YRajOCnY1BjfjiGICjZ+8bV+eqwZz8CIOgGBP7K4C+idJhpxMAEQ6N8P0qcTrl7FR1XytfSZJ8r
 32t+yLXaM1l+aUucm1w7Fc+hL6SqxSulJR8tut2lfigj4DmqAXRE5dylYyyNrTDVDADDanLqBRS
 CAOFDrL/H++pAVtfdFpYNUf4mxEDFIFwUM/b46sucDiD6+LF2V6Xxsah2IpD8EEzASl8S1n9INU
 hUJaFxxQp2uv3h9FcUpPw2TCIW/m0J9JmZ+jePZoUlsohWhqJpWgLAuGnSWrC/2xDClZcYy0kDe
 o4RBtOnQPfD8nKN//wA==
X-Proofpoint-GUID: 9lBabwudTvjWiF3COfWtNUPgI7ebb3Z-
X-Proofpoint-ORIG-GUID: 9lBabwudTvjWiF3COfWtNUPgI7ebb3Z-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_04,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020145
X-Rspamd-Queue-Id: 4B7621DE4AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95022-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/1/2026 12:03 AM, Dmitry Baryshkov wrote:
> Due to the way the DDR controller is organized on Glymur, hardware
> engineers strongly recommended disabling UBWC bank swizzling on Glymur.
> Follow that recommendation.
> 
> Fixes: 9b21c3bd2480 ("soc: qcom: ubwc: Add configuration Glymur platform")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 1c25aaf55e52..31e0d55c6d9e 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -231,8 +231,7 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
>  static const struct qcom_ubwc_cfg_data glymur_data = {
>  	.ubwc_enc_version = UBWC_5_0,
>  	.ubwc_dec_version = UBWC_5_0,
> -	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> -			UBWC_SWIZZLE_ENABLE_LVL3,
> +	.ubwc_swizzle = 0;
>  	.ubwc_bank_spread = true,
>  	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
>  	.highest_bank_bit = 16,

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

We need a fix on the gpu side to properly handle this case. I will post
a patch.

-Akhil.

> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260228-fix-glymur-ubwc-f673d5ca0581
> 
> Best regards,


