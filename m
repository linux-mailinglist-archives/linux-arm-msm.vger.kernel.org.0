Return-Path: <linux-arm-msm+bounces-116788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /akxNVadS2oCXAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:19:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F47106C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:19:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pSGTY1DH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="B9/eEf4k";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116788-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116788-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB41B302B59C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F0C42A156;
	Mon,  6 Jul 2026 12:18:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C94252C1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:17:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340281; cv=none; b=rj6Nljck72veVy3ynDz9TxyzIJsBWsYbtd25sse8khcfcYQgHCGbKtvh7Blt979Lv+fU1fajddRwhLi5WAsiZXEbEjguFBRxkhQj/5dO84TO2TXjlHv75/j+tBDQDdqcmxCJF7QgwF5sQimUxBPYTpbHdBLYLmL5uoOK4Hj/CoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340281; c=relaxed/simple;
	bh=UeKAksBN5zfSjZAEQF0JGx3C89v56r7Jblo870pp2qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q87asi4Rqa+04LuuiMPR/NeLO1pbDw5Fqw2io5bihdGyde5qBt5CplmEb7Yyrf04C2qCuCh0NBz/cFI0QlwSjOSzXEE7CWVaN+fZvQIz4M+Nu9brCLqVN3JpFWkeecjzgSBlT4ieI1UvgC/Y9VQ3YqkTE9j7iOgjudlYCUIT92w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSGTY1DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9/eEf4k; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxS1H369581
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9p+Q6R3xGt4KADVRrHfvUBsLdfZPt1kAeyded2iEW8=; b=pSGTY1DH9paxqa4g
	MireXaJaDAQBRHTDUoRhBGqBFV9S66pXXPXdjO/nPLHKS7fSKhhoufzi0L6Bpzw7
	hrviKIewLhTb55VzBJfzVapUG16dCYetqF/K6uqfaRB3LuW2EDIwtglyaSD05DIs
	OMzCpC5Zcoz58xq2eYxl1mpO+cAe/Xkls6qa5WDAuMPdRE8sapyRH94KRfUhzLJG
	nZrIvXS31CTY/YLSEgazaHQdNvwula53Dh32NIoGQ8sAsaYno2pb+uF6vLT8/7sg
	V2F+SwJkymkMzVSnfDKOWgi9dRMwAGcji9/T/RqgIbPhsH9k+a6iaiHJVjRD5aBx
	GyJw0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9905f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:17:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so21958891cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783340275; x=1783945075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9p+Q6R3xGt4KADVRrHfvUBsLdfZPt1kAeyded2iEW8=;
        b=B9/eEf4kOjdaJ0VYm6ivSrokT4Mtv7PZP0hpAIn2Lg8MEoe0zny+hf5Yd8S8v+Cxe/
         9KmJUY5zOwSSyXj0xUfaLf3O6IShuRqEociTQ4feZzayNxi0vvPA3WMlr8b+8z0dJFo7
         n8t8YEbURX1a/VJiYVv7KCdUfhjm9KSSy/1JqAmgRYqLZTM6JHnn/9k8LPiEYvsWZjTZ
         G+95IsHRs4ABGHogFEPJGfZmjA9ZzYdIY21I1mHitOR+VRxr2T11dzNiQneB+7l/0CkW
         g+HDsPVT8vka77DWHETzRqWycq8rBp6cpVbCMzUTd/4hECbtPxkCbqM4DzluesNp4v4v
         MRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340275; x=1783945075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9p+Q6R3xGt4KADVRrHfvUBsLdfZPt1kAeyded2iEW8=;
        b=Dx/EtbFJlVCxno12jroCG3PeokgQ65AZruPFkoliNPpntxhaifdcSMKyZ8iGu7D4Ou
         DMlJLL3BvEajZD5IfmV3VhjbB5m6KEeSyqUAzhqKPnLzMV/kq4Y2lXnoPmIfrlwNgP1e
         v0xGP4ylDwPu7llac3tqbjim5NqBEiE5+Kxwb1sYKvY7pnhvIHiIMgziXXxFaMZb2tlm
         PiDyLDRn339ovfLT68BsyiWlMtf8xxvUZsQmavStIICtlqQ6Ch1Qyx2UJpRSyepi0LdD
         w4KBy+qGltqeS+2r9zEaOz/Wb7FzX58fazlxMln9vjJ5SQNr0XpCt8SmD4NsW2ljAWjd
         TRfg==
X-Forwarded-Encrypted: i=1; AHgh+RqecwVvgKlTXWZ9so3BC5WnV6gjTzN2kw4BePfDY3ir7Rme+17mPOzpmaVyevgaUoTStvkGUtJ8IhJCZFrX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywju+2Lwz2NeNhhDZLsC7EuQc23Es7LREv+An6vm5mU4xK2SBvm
	q3+iIqFD1bUzQGYErWtHw5BMYmnxkhdSP2fmmFG11lhVgXMHBEVUPt9oy7qPynCRq/0+9yVNg4P
	bkgAWObf/5KFIynkjZWcP7M6mMWPAl8NL0NUIzkuACSy2v//ah3jAgOEhYeRRCK5C5PuV
X-Gm-Gg: AfdE7clG9csWM/9Nh0Xm3t1j6Njq/cTnovUEqFZQePqZJ/tEfVA9LfnMSeGXuU7vUSR
	U4kz9HYuM2cZOgrDtOL4z69MeNlTFy0EvnkMsnHSL00vHH30UZvFp0b/CzQhu5oqi2WISnyV+e/
	HjPl4j4pWp56DXzQVIqI5oLZPedMHATKx3fCUXxUcgJqW1ACGGpjQKpeGLtOCAq8MErDWLrPWaU
	xlNFdJ9glg6oOFSnVm5ZhPalJPSlVzjUsSnrBjc+OXMLXp6xNdyVNhuc1e2PYRWE/0aN1UnrF2j
	aDXhHOnnGzeV+bGQz/q7VosGm6mvX04RmugoZX+l2PTssmFSVUGptb3UVAPYOmKA7WBpsZmuan6
	iUcuhNM/3ZotX9pabOQohG7bTzjqSDnvKq5s=
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr86243131cf.2.1783340275238;
        Mon, 06 Jul 2026 05:17:55 -0700 (PDT)
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr86242651cf.2.1783340274623;
        Mon, 06 Jul 2026 05:17:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbedf4sm3998959a12.29.2026.07.06.05.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:17:53 -0700 (PDT)
Message-ID: <19a78410-d11a-4ee2-a628-ea7a93f982b4@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:17:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: videocc-nord: Add video clock controller
 driver for Nord
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NyWX2llYiWqp3xD-3fCcMiZEIracym_G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNCBTYWx0ZWRfXwe1cWifCesOh
 nGkM8DAX5GRgPqmlY41sJV8ZAb5u8lMW2+aYXZibPVcbTvSjMQZI//9EgXezlSPICph0qb/IXlZ
 HjMMml3zWLPPKWO931Az80zseDxp/cM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNCBTYWx0ZWRfX7DvasUq41ViM
 P8T8kEDRanTmteIdTWNalRaHCkWpgm5pa75DhUMj06aErxpB/vgmJ/GTVcbywM7ehV8KeIEVst+
 D704iGHIUiHEezDzBtkDimEQ86XdVQOuo4Tp92p96DhXpHPWIDHu7flBYX9ka5NzrfpELAQ3nxD
 suCtIu3k3BXEbgb80FWtls/3NZEZFeakzpZPjlMTeTIsj/j2yqoDaKcXw5ajVZUikeUxsTm/SWH
 2bsdbKpCfVIOH+LNNHd5geouckz0Cgxfb4q99Tl1RGwZkHo/PhL+Mnt1H+gaEaOxGhEgtMKBC1w
 govy4YengXYKxzc++UU3SJKpU/ktfxo5Jb+HrMnt9Qk//zBj2kqn98yK0zcSG/2R11AvCSOz0Rj
 bgAJjOEa2wuOPtm4YXUtcw5njDarc20HlwzNIXtFS4deXm3+CxA3KCmAkUnkRc90hDwQaJWsy52
 aTyeaIBTCazMm2mUQzw==
X-Proofpoint-GUID: NyWX2llYiWqp3xD-3fCcMiZEIracym_G
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4b9cf3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116788-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 652F47106C4

On 7/6/26 10:57 AM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Nord platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad

