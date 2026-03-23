Return-Path: <linux-arm-msm+bounces-99238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHSwLjI2wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:46:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 347CC2F22A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19294303A08D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595F93A875F;
	Mon, 23 Mar 2026 12:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajuX0Sab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjUy/ZUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A6E3A3E70
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269703; cv=none; b=aeoJOH2VQuDYtebrkk3rAjUpYw7gRf1w9TVc1n3nhGl3Q3bZ1uBurJSVnQ+cbheXYXqwYc9IR8HSPqJI7QdK4Nx3RPLzvDeGET7g3GZ9FS0EmkvBAGxGsreFGgsrYqBHmcB6auFot8agN1SSl1dHrDX8AiDmTRFxHh5r31Knu+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269703; c=relaxed/simple;
	bh=at7pijiQmc0UKem7dJHzsfklr5nFo712n5Tk4Rm2WQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbOydx0DpDIWiyvwJJ5D10xD+qPjRpv3AIluI5VB8NFPhArklxPQqA1sHp89OQEr1MO1TUls5dKFKo0BSlWOoDVcFNKH06eEvJdr2kDJKrzCdjS7oWtGScQtquhp/HyGMdbIvbfDMh3hvcy3hbPr2+f8DksAFdXzSkuOwUMhJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajuX0Sab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjUy/ZUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCehU02476030
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fceeTStVGYRU6s5MGa/6a9OW8YWr0UiADc/6MC+3UYc=; b=ajuX0SabHe3aggMz
	bfZQ8h/56mKpWC3gKWwTSkE+M6835xHcU/Hez405OoMhxhrkMn3P8H+ElZYcXrmx
	54Bg5Gw3KBMvqQOhwbqmBUZBBaznnsbIKuQSv9wntCQXMN+Xq92qx5WOZcxlNvRO
	aDqAQyiguyhRXhY6aie5CX5YzUacFFVDQigQv8n+CJuS+QJd/pwTfO26lZMbxQxG
	bCpEdvI0E5xEHMJ/qF5uW2WrQHLG5SZmvmLTvrtDkp1mEHHqkbIzaHfFN9eoUhT3
	jgCtjgUChqNKp0U+V/kt9tW4nVwcbYzRYy+gxuJRzLzpu3bRY8v41EfaSfgaAgQO
	6f4SMg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2005d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:41:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b27636835so41655471cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269700; x=1774874500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fceeTStVGYRU6s5MGa/6a9OW8YWr0UiADc/6MC+3UYc=;
        b=XjUy/ZUAeyOKdxC3MVvg30odpKUI4bVyhYjsWhtPDkcKqM0e93hXkiTHwyNTlcfGaa
         hiBuOD4XcnMFq8aet7lBAbtNtMFzjhpRQeL5BRypof+2Dyi0y/zEBcw3+kIE254qwPli
         Z3z2hseZpL63rSnoQs3gSGsyMM1cmZyJ6fL1q4Q81MTUPzg7A7pITLw5Kby9UdFRVFp2
         4hSW3yUW/r5HHQ/nB/wG2yxr20bsXHJYrKq5tzGPls4IiHT5cnut4ZLgslb5fbqAGcnL
         4Uv6KKuAdMTpPgPux6pWGrHyVcTUvO6wiyGRTa0IGm2N9gisZ7GeElfDWXpoMDVadpZ1
         upNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269700; x=1774874500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fceeTStVGYRU6s5MGa/6a9OW8YWr0UiADc/6MC+3UYc=;
        b=AndqD5YqdmHxBwImUGon4ohM5QF80g/tcHgMOvfHCuI4yWRCZPa1ts1pWPtEeKMRCR
         XZz2e+khKcbgajn06J/OWJxd9DDjv0RgKqnmWu1aea8dduSQNPLlXf7pMaT7Fsnucywm
         o5nhNLIsMaiob7ZZmHOYx1zeOjj1cR6UDiI2SrusN04AgFmeOF3vto+YJquFYCjpMl1N
         ZcCpxdmB3DppzM5cdwL/omvq3PJvu8Kac5/NvZfDhVjQ+F3SRRNVY59WtL4Vd/bhxyU4
         pJtz70PHe/R7eRsxz+LGSO4H489EprOFjqLri8Qd0S7cp/LfqSn4374VNKNxOrgHOxnS
         tkTg==
X-Forwarded-Encrypted: i=1; AJvYcCX7oLUJbew1nDFYRJIFBW/Y7F7E2wZOttiNYOo8WY/PlEZEBOGETJl4K1ohmaHGBBg0Azu8Tqhah7/F5xCj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+9fe/2orU/hh/JjNkviHicM1VhR8b8y1JMFtqiXdklLWItmGw
	4KxfdnDsMw60fNUQMiBB/OqDkqBf7BNXbcRhpPFLqhXe+9ViehIawI1KVQxIJVN83pBM2eLCsWf
	6V83NC9v4zFZFDDSMirCKEZG37dVmcfDi885LMrgLQ4r8fVvYPW+6pJNh36T6+1Br5B9vknENZ+
	XV
X-Gm-Gg: ATEYQzwLIL10GOyZOp54Ggffobo20/ODveezyov5IytssRLvR0Gs+gaTZXRu4Hs2OjX
	uXTHQdYXblaZBaAsV/aMfILW1MulxUj/3HZvNDRuWTQCfJL0h8vN3C4QltC1fc1Ge5hYJKRtFjA
	Wzeqa2Qw2p1RYK7/cEgt5S+k++1iBC/FE0+2JyGVrcpBiZth6dI7pvugPD6bUrvgiJaDmLt2som
	wdmQKrxOwTMDJ/o1ptZQmO7/VDD5+XeAs298CzlIPT45bhP3Lw3UmSQjp4/DbiKjSz+Jf+0DcEC
	W9yRpGnqBRq9x5TALj9jrxqXlTkzgA5CgmEmm+UwUen+VfZs6dCTdnL/aL+c8TR9dUMTo4ZbLMY
	RmEQsmpzCSptfNbCNQh1wzCG5BeLqOuDkKcQYE2ukOi/flmaoOw3D8Bnf7oyl8ovIzalZCIJSZl
	/g3wk=
X-Received: by 2002:ac8:7d48:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50b374f7649mr141639371cf.5.1774269700113;
        Mon, 23 Mar 2026 05:41:40 -0700 (PDT)
X-Received: by 2002:ac8:7d48:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50b374f7649mr141639161cf.5.1774269699645;
        Mon, 23 Mar 2026 05:41:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a1adsm485281466b.45.2026.03.23.05.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:41:38 -0700 (PDT)
Message-ID: <33d5fbc0-ceb8-463a-8adb-32bcd3e70531@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:41:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting
 bias pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c13505 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=wBgx0QqB7cFJGvLgnJUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 7pidblk00YIe259tPJfi97foSg9cuwKQ
X-Proofpoint-ORIG-GUID: 7pidblk00YIe259tPJfi97foSg9cuwKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfX94tkf6XG3Mfn
 fDvirD9xcPHNxsGHdH5NWmHFqFyA3a460MMF7/sgQFUmPSfSQvqtOCd62kFu6vw4R0Qx7O66oLh
 ZyQMzFeeM9yGIh01qi3Ys8OAPv6DGqzLBYbBuxgG8Kca5gpmVyWbMb91mofMHUbuCa4n1rmSIcc
 CH+Rac2EjibAX097ckgC3xFkf3T7KqUTh4f/Zy4mqYhgM3bfuxoJASKLWkklvKxlA88yIzi3IJD
 EYVxcm2fppu/5dTiUDirqLtxF9kkmJss/CXza9RBvUzcCm1I2N+va0prP8QnUpZkz55foAXNFTD
 mDRmbdHMNQy2hhqcf/M1Ay4bNc402PjMGvWjEu0tL/HqS6SUzPveSEyhShYx3l/vh6culKSHliW
 3jPsTS3Hq9tJy+1vsbc6rYHH7GF9B6dvmaJ6sYWBybhUtuIITDM8ytkzVzM0X34X77Y/ABUQelY
 NeSJ0DUbHK3/P7KE9Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99238-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,fairphone.com:email];
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
X-Rspamd-Queue-Id: 347CC2F22A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 9:55 AM, Luca Weiss wrote:
> The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
> that needs to be deleted, otherwise the dtb will contain two conflicting
> bias-* properties.
> 
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/r/20260310-maritime-silly-05e7b7e03aa6@spud/
> Fixes: c4ef464b24c5 ("arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

FWIW it may be that almost no one will use this UART for anything else
than bluetooth, so I'm not entirely against just smashing these into
the common DTSI..

Konrad

