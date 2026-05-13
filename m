Return-Path: <linux-arm-msm+bounces-107367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH/4J5iQBGoVLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:54:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB0535867
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09FF83012CB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B324438D401;
	Wed, 13 May 2026 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtfFiIIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiGpxnTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8699F38C2A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683877; cv=none; b=dVOnXC3NI4nfyIpYy/ZxcIxh6fFCBg4ycLKIDJ13CgY7m5FeX9D//DTE9i4J3Aa71l1Ni0fAy3w52qYdPNyLhhc48tzufb892bUJLaOLx6V7QYfH21pXasyhVPjXI6OZIlXmUbklQBaYbfXcf1d6VoKog8NzJkOX3Q8TMvL7nWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683877; c=relaxed/simple;
	bh=X533S4orIOcyH6d6QqDplEDIo0eDwal2V08+BLKYfKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pvr7IHbvnzE0DJQSFmpdWwyDTP2dMVu2MwMR5O50ato4n9KvsHAp4N+vmhuMzJEEzMLXjtIjN+ZAZuiZVXrk/Rb3Jo1Uqf0+9GM8n3rdOKZ0MLFEilRz/j3ftDrlHzQFEfEeO/2qhcGvrpG+k4KmpIDrt4iLYH4TijZjb0EaxIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtfFiIIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SiGpxnTO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEiRAC4082484
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzfLZa8B0chDGUqP+XPMbNKLlQOwhpMumklJOcLO0d0=; b=LtfFiIIyCCGAxDXm
	11yr0oW0B3KX7VliSYCsHTsLVFrLJ+SLP9i2QjTR1XhKXV6rNQIdqVXn78AdtHYB
	H1Ewqi8ZPZJCKKlO1z8URkbPXDi+vjKYO6cG1E9x2zumkfhSHD4K/6hrUMEJoqqL
	WTKXvt0JJgKLmr//e9XQp8+aqyufNFLB0MyoVz8NgXt9kpSUM9stMNIZxsbWeBmU
	l3m2X7K60GDp4pVIn6aJ0ny/2SIXCx7hVl8XtfpyhiVxobOJMEq1un0e6Gp/vmJz
	LBLwl/TGocix3Gd/Ys+jgV0hiBe+ZPD0YpPslOf21hJqz7mlZKR+Eim1fhrxSObI
	fOkN1g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e1c84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:51:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-631bec27874so241480137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683872; x=1779288672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xzfLZa8B0chDGUqP+XPMbNKLlQOwhpMumklJOcLO0d0=;
        b=SiGpxnTO4IPIUXnFJLbXLdQXQVaRpz9mzdPvNhgJvOwcjDTBkXSsXmlUamcdriSO8L
         fGH7MUoEK/BUiK3b7Kiz+R2IoA8C0/GvIvq37qImcVw0xeOkDMUX2zIT97BJxFEW8V5W
         Muqm5bxTGy/jBtY1gyxvPhTmEVU0qoFFp2oFm6Wokv7W+mwKapr7+qsPKNYpbhXYgPft
         1NlSIOvnvLUGoSgVb862kq98mjK3Iz6uEUOmTUZHg95PVNramNRAeDuyYFxbQQlnUIfS
         RDja5y0Ye6rWGbYkuZTc3I689uzN9oKME1S9uJI+NZ2k8G5GtyTnH4Ylt2OQOMghNQKb
         KrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683872; x=1779288672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzfLZa8B0chDGUqP+XPMbNKLlQOwhpMumklJOcLO0d0=;
        b=hEnB2t9hF5owYdSXvvs1jdvdXYDdJPiUAPH9KwasvplDip96emGqVO+27TOQO3UBTX
         +2envlRge5cVm5yGkklzaw71Yf+T/UgUTyP5f9xyyg7P1hfNdSRKynTgFrnWsV0Pds+3
         3lc1DsLx51kdSJALeylDanUXgZPvYOtrTsQkzXkS49QhgnFQ2U13wYLTb/7sWcDeFPU8
         ETsudQ35DcOydio1ngWW1usXugH5kqXCQ+erZ64unONiP8Hhp7QwNiOsIDQypt1LiS4k
         Ao4VGXz4LSzStLPEd6Be8ch4NIkwSklTY4azPrLLknefQxoOEnENFAvK0IjYhmh/3lFE
         SbUA==
X-Forwarded-Encrypted: i=1; AFNElJ+Mg1q6IXrYBNnL03Gsb3XNQrHww0VO4jkC7uqSZLEI/Y3RLO7QrdVtBHeYA6KtqyfdrTJkk7XHZog4RO4r@vger.kernel.org
X-Gm-Message-State: AOJu0YwF82u+CjZboVJHXP2UWi580OLl/FawXNTxcl98e9io0Kf9csj8
	p68L8RrcK/NRcPHQLmZ35LseeP+bAxsxif8txQqDyDTJqJCbmSf9Z0AK1LBQhUFjVM1JfKcR9Tp
	Q6JjWmVp6SH9DFI+ZQggUxd+eK7fHOKc1eJlwwyzB2VucKn2gdCSvsScV0eOXnTnPalc8
X-Gm-Gg: Acq92OEgIW39uUjTef2TSlluOI6+ARdMEk4iWqXqzghq/k9gQ2m41yMEbMbQh3pCqv5
	LNWp9Le8j3YxYrPRjQxIJzZ1Ez46E73Wn9/fVq2n7aDJAlu9awsgdlSRdp4an/44/yFY6qR8vTY
	w470unL/GzCB4LDu74ZV/7RNtB5wIJGa18hyTiFSC14nJbvRiwiyw2TaphZ2Q9lF/Wz/jOHTT8U
	YbTYIGmJxHHvbQ2szxqzVyzlhDl4qgiLlVY79C8LaIx0YAqLn4sTCs2pPgcqYUg/yX62dmosAfi
	k9SFQpeu0asIm3DLZkYKL2nj1xYoQwAJmF28tN7lyfQx34Mz8OUBtXBLBdY907WXngy7STreh8C
	ojRZHd+3iGWwJv61xZ45wftGfLfryggse0W+7m9tOCSUgGEi8S3C/UiUN4crAPf5tCX4x218+oY
	hUVbI=
X-Received: by 2002:a05:6102:4420:b0:633:3bf6:976f with SMTP id ada2fe7eead31-6376f0b4e32mr751908137.0.1778683867156;
        Wed, 13 May 2026 07:51:07 -0700 (PDT)
X-Received: by 2002:a05:6102:4420:b0:633:3bf6:976f with SMTP id ada2fe7eead31-6376f0b4e32mr751892137.0.1778683866700;
        Wed, 13 May 2026 07:51:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd3716f396esm170614966b.48.2026.05.13.07.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:51:05 -0700 (PDT)
Message-ID: <1cf064d0-14b9-489f-964f-614aeed4fcbd@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:51:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
 <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6pFfWcv5NoKf9ZTyWX39GuUflW6elfw6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MiBTYWx0ZWRfX6K5B0enXtdAD
 nnS5iWdJwL8x2NFq+7kQAiOLPm+ocIq0KdLxeacB8g5iHYLO4BAZbnB1juWXBxjNRc4NdxogLgj
 WZKszpZAHqRp5yLsmYrpLctg2uI6JhUGZmNP0agOXsQ0OvhAGRLRHRd4I6JRT8bifEcG2Gw5be8
 HAzYrWx3jb8UUfWI+3j7YGMGH7aDoYr0sHmviTtezshQ6pEqS9Sr8sgtsv5lwaVtOeqeK3FHI79
 TbwPOgRn+rkNe8u2HVd/a2mw+upgabZH4/hIC1ZQMY5kzQ4JvYdrxkzMc9dyub+6gKJ8VGdRUUX
 cjVA2fytfk2MWC1XZpccJzzIEbUSww9lrOeIuah6UwdYiLbboB1UIYqaTaxarKQ+tBmM/QXgVnD
 t2vyFuP9Yl8SuHbgZVw9PlXQ3kqd7dmD5G4DDiFjyK1oeDRMZqqNsJHPouZeSAXcwWOAiZPjJqA
 Ypn1pmxOFfjMwtPh7Ew==
X-Proofpoint-GUID: 6pFfWcv5NoKf9ZTyWX39GuUflW6elfw6
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a048fe1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hpvrPbskcaH-GHovVAIA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130152
X-Rspamd-Queue-Id: 13DB0535867
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-107367-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 4:06 PM, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
>> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
>>> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
>>>
>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>> ---
>>>  drivers/clk/qcom/Kconfig         |  10 +
>>>  drivers/clk/qcom/Makefile        |   1 +
>>>  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 576 insertions(+)
>>>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> After comparing the files...
> 
> Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
> clock-indices, but I think it should be fine to use clock-names as a
> one-off.

Or we can convert it to use indices, since those are stable for agatti
too - the names would remain in the binding, just unused by the driver

Konrad

