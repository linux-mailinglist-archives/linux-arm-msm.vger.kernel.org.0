Return-Path: <linux-arm-msm+bounces-90511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCDWIKM/d2mMdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:19:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1598586ADA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 11:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD882301626A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 10:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED91230E0DF;
	Mon, 26 Jan 2026 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVmiwDSm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+cCoWBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7830330DD3A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422556; cv=none; b=m+9dc83MmfFOC2z26G0FJ9DjAM822zgolJqEXd6+7CwUV05t8msp4SS2vHHEmmBjoDmYHX0wgvvz+rbenDVkXGuoy6y9d5AiJVBHRUWJ/xHYl6KKU4VvwMN+4HmpuT2CZ5kFn75XIJzM0hG1g2ubWt154LAvONQjPfL83NOiFWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422556; c=relaxed/simple;
	bh=w9LCNeW7lpkYh/R2cbvAh58pli0r0lbau1nfmHvl9TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6+IWMZDQ9bnoSDfDbxDfyfPSo063Y4LeDNR+XvtDn1eBWlGjxayAoLmqCzyu+J3J2QuJ9hxKxMChXo2kT6+qHGtwf5wafJZq96qIwCPup4vcitDsCmzrZETAuc7xyOtXpdxmEG6NgSUUJ867f3MeLoXq2Vf0IXwQQkx2KUiGfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVmiwDSm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+cCoWBl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q9ToCo1651315
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCqQYvIZ2wi3mCTpHwqt6AgcdFQloV81RmD9nm256kg=; b=SVmiwDSmnL5xb12I
	lhOpMo5/eiyJSauvUrLEPLggeIbZ2NZ1bWFT0SalKRYSreszOAnHEeuZqmzKh7Hy
	49Y6eYMXL5znTlTrC3Zxz/PP+WsHAxOAXlm+O22e1WKtXvlG6jjH6sYes7XBzvLv
	R0RMepzWR8HXafgvl30hUQN2cA/E+E+ntWGCdXrNj32ji1JaDCt9z9zuLUvei9hi
	w5DGz0BGJJgMrHpqo16CR8IjPHwjiSu95FmmdO1JwkeD8yWqdq6LwjbXcyZ5nDZa
	h6F3+wVBpuaM9PNGr1BpQ7J350rh27yHZ0qnFcBpqpusBV0pbT8FtQZbzBvOreU9
	OuSOQw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq2q44md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 10:15:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946c23cf90so16977616d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 02:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769422554; x=1770027354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCqQYvIZ2wi3mCTpHwqt6AgcdFQloV81RmD9nm256kg=;
        b=e+cCoWBlLwdztcmRxjCvkXrHlco8u9KqPA7YQzceZjV/CE4cPBniW7elHkSI0cQgCt
         LjJdxuRvcbtfdEu+Bm+Ff89VD5qNka4SyZh0/As6TrhTNjvq2VtCz1Dq4nIG2CjU9D7p
         MiccbvxLJ3U6gdDPU99G+Mdjy22fQbc4TiTvGUDK6JlJO5oVKw6JXptLoJpkvtlCThUN
         v6bshKSg3GQXiv+HZgj7CwmEtYWQFwsfIOQYvMxfrHnV154H8LrB7w3BSO+j5ptfDfbQ
         DA/nLV/B/PpxSHl6BUboVxF6hSHfgPxTxO8cors+CjAxOew69Pky+i9KxYBshwRm/pZf
         UlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422554; x=1770027354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCqQYvIZ2wi3mCTpHwqt6AgcdFQloV81RmD9nm256kg=;
        b=JydGGgmXIlNpBMGQFNgi0EfEaxl0k87QprFuXvhvn7hcjHz2hY2pUrMxJnwETkXKWF
         EasWkFqVv3fhkld8KB0Y8wDMwW9xIMYR4KrnlPJhXiFw88p/MEFPEfq7WsuiK9+NjLnz
         Nw94vBIdWWPx579V0MABdRRu9SWgbGV6ZKQ03gWeN2ZY9E/lVZEGPPfLZkGKO9tde0QX
         eq6XCQAXQ2cZk7uVbW4Yiwe2RT44r9680b0KnvcN7KfmfNmSxDtYCMZsq8qyVCxO9jsb
         kRud3PaZKZN76AlNNOpIjCV5p6Ii28jlde3bLivggyzevuMe8kKPre+G/DryxVOnoJqv
         aerw==
X-Gm-Message-State: AOJu0YyKzYEK1uVIxXceRrYVPoqWpVDJY8LSkeA/b/wI9e1g8vXkCn23
	aOuu7TQggGX2Qrn/jqTF3ak1RDFtAnOaX3rV+7ZBvg3PwHks14wal+N6kmw5st9BBzCW/WCrAkF
	zU2hXYYxRkB2+f6g0gr9PHHIju1dKav7O3moA114VlF+CTjcB6z9gvfwGNW6BPBt1121k
X-Gm-Gg: AZuq6aJUnOxfo0Pqj6yZxsVLtQcYLSKu8YQqnZQnqYgfru0FmsbpKBJe1fiUbXS/DOa
	ZSa7DVlbvpIZ5wt/GO+Awv8oGwx4xGUxSCTxMBcP2jfiR55lfguoOw6Sy+rqXtwULfDDEJNc5zL
	ZuUG3cAeAVbP5fxmGU//29AXtnD/cAZaHGXahp4dRCUcqbSbLjWC+UsrsOV3ZcoZBCTCzNhKBVO
	+hATs2RsNiWsU4eURXHqCWy1yUMACftzosuR//UEIoHVu6IqW8m5pnuE4REDclympo1Ku/rVOzb
	D12WS7eAQDxFFwKfX+Iu4RJ59slKr5qHqKIeBuT8FfU83mqz/FEqw4V29CUo8hBIUc5NB9MibpZ
	ZDT3a3mPLBDqJhTvdLI7GsAuSrMWBY8ymUvBFKX87tBfUbsYVKbhb9Esq9Up9kDLCT2M=
X-Received: by 2002:a05:620a:3199:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8c6f959a49fmr335703385a.3.1769422553849;
        Mon, 26 Jan 2026 02:15:53 -0800 (PST)
X-Received: by 2002:a05:620a:3199:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8c6f959a49fmr335700785a.3.1769422553360;
        Mon, 26 Jan 2026 02:15:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b965d98sm4962415a12.32.2026.01.26.02.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:15:52 -0800 (PST)
Message-ID: <6f356389-9fdd-4d2c-8d37-82cd974d251e@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:15:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: remove MP5496 regulator
 references from SoC dtsi
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260123-ipq9574-mp5496-cleanup-v1-1-9fa86f72b873@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123-ipq9574-mp5496-cleanup-v1-1-9fa86f72b873@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 80h6e4Zj0zxqJscr6DzByf__NHgTx2fS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NyBTYWx0ZWRfX/Jr7cW7XvGvB
 EYFGWmX9knudcHlelaRQE+hYcx7OwOn5wW6zyziCuTxAo+4FTS7md4Q/vJKwzqJl18gHdOOIzq7
 bnfYR5fQ5igetE/fXN5WVtUo5YwskXLL9SN3zlPEzPROwf2hIafSeDVqFz3vNuNxYHqpOFIY2h+
 wk7SzDgYPt5xGfzYXRlC3CGZssrdjJ+quLIwtCBrptG8xHGTx/PKtVClewvlqtFYLt3qxL7s+RQ
 5EbGRR4uQfJzE2yabYdF4hK+XibIBLfBqTikIIJXVDh1RqOwu/M8fsuwqxzBBjzwJ1SJqbM/m3F
 v5DglSc0hrgN+HAo7eIDpnQNVWxOywxTcmuoOV2F4imIF/Ax5U2O7u8Ci519XcxgOVgdBBLEvUD
 AYCZs3oKLD4suEImkPSjgWe0HIUeTBK8s7KUKOJppM+5L/8nfKgvX40RSIlFdQ1V1hvfzcptr8I
 CibQPRKLDEvEJn7a/DQ==
X-Proofpoint-ORIG-GUID: 80h6e4Zj0zxqJscr6DzByf__NHgTx2fS
X-Authority-Analysis: v=2.4 cv=POECOPqC c=1 sm=1 tr=0 ts=69773eda cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=msZTsC1DfymdlqH7oGAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90511-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1598586ADA
X-Rspamd-Action: no action

On 1/23/26 7:16 PM, Gabor Juhos wrote:
> The 'cpu-supply' properties in the IPQ9574 SoC dtsi are referencing to
> a regulator provided by an MP5496 PMIC via the RPM firmware which's node
> is defined  externally in the common RDP dtsi file.
> 
> Since the PMIC is not part of the SoC it should not be referenced from
> the SoC specific dtsi, so remove the properties from there and define
> those in the common RDP dtsi instead.
> 
> While at it, also change the prefix of the label from 'ipq9574' to
> 'mp5496' to keep it consistent with the labels of the l{2,5} regulators
> provided by the same PMIC.
> 
> No functional changes. According to dtx_diff there are no differences
> between the ipq9574*.dtb files built with and without the change.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


