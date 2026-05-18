Return-Path: <linux-arm-msm+bounces-108211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEoYHKEZC2o5/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:52:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0724C56E0AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AADDD301903A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5701F371045;
	Mon, 18 May 2026 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zcos2jyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g10XehZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1755040584E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112327; cv=none; b=MoYHLeFcVd4c0rIHbFwzXzRs8l19QMW/WisNiUrrH1pzToKjNvrAqye5hKJjId0M4xNKv2r2SC9ikSNpZcrUSHuvM83RCxrsZiSxhTInAsDdd1vYWokWn2OlIidGGUiDNvnnAEfgNtcZ7hzjfXvrxIRXOtoy/V3hi7a6q1DEAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112327; c=relaxed/simple;
	bh=FXhGhOfVmiifdinaXiHti/cDAtje9UjLdnb0z0rownw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duLyQYbSjfV0bXPq7CLN2W14NOaJippSni1RzehjdN9xMeR5z1s8V8ILbsBvmeOhcU12qT5sUoIumBjqFlsxr9ADB5g8/ZkN0PQtAEP+OFfIGSx5BXqAku4xbzHkdclMso3DGndXocLocv4yyxUjmYidLE8JDJNGcGXXOa2HUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zcos2jyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g10XehZf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7e8Rm2892872
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uU2wIgRqMngwr2W89vqJZIY1+RqMUaLtCS9xdc3xMlQ=; b=Zcos2jyuQgUkjOle
	EY3dTgsDMJNrQrNrgTvJ3MlLq5lTRgvxO5QZbxZHmXtH0srRs6cSAEjvE5sGEYnR
	+cepdzwWfybZI3ffxBoXqly/IZA6SEkM81HqIwKYuQDAlwCsrDclVrsv/qdyy24p
	pbbg9W5ZUIMH9mITfuSJovmP4pJc82cFoxXIUGSaxPHYHcFyOSqmBy78SKInICrH
	4SjsTFn0d2ECxvCMMnO5g2L5/o+5fs3K0WJM4ifxV6Gc2Rre1YhAPS2PEn5cmIlp
	uvpcs50hYs4uNSabCNCLB/JT62Q9xT7TXu4BfI1n4SkIUO9rsoQVKPM98IhuyVoZ
	jyTA7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk19g8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:52:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fad7b0ae2so8803121cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112324; x=1779717124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uU2wIgRqMngwr2W89vqJZIY1+RqMUaLtCS9xdc3xMlQ=;
        b=g10XehZfCNW2jypL1KNwtjEzQv/CVXpusEYGFrtS2Le5iMIfgWGt9qp1j4j06BJDe0
         W/pzixhJ/G6emM2zVjJit6W0EsaZzPChMenCeRLPpFxks0RJayC/8r+IrYIDoPUpYaE3
         yA2l4cesYYxRW6zZdiJmFRIY+HFtHHSJDttTwGs1/mgGO15w1qO0QQ/qDhJnh+8WK9tH
         zz6acmboj8kgyfdjB0wXtkkloDyTJSlnUF6nZ1UVwloYvxLBh0cJ6SLsr0INRO6EsteO
         /6MJQAn9jccj5y82UzX7btQpeDTdgeRW3ZjhyPt58qWEfcG9TiYQDALuKp4M4a2rkdqp
         ofDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112324; x=1779717124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uU2wIgRqMngwr2W89vqJZIY1+RqMUaLtCS9xdc3xMlQ=;
        b=YKjc2/N38pbRgqCXHh91ei1Uz6z6AIOIEjRxvbH6z3pgbLgp/XnGGJ8zIGenzuOw4a
         dDCXbR4f0PWCym/VaA/G8TySgPtKhBrr2PJYXunuWOgeebmSyOjAEpWcRuWddyVUnAwd
         y+Bi4XCuyka8+cdIKjJykuMa+e9bq2wFytx7D5P/5JEJJi7Mx2QDTpX8/ArdviS8jv3i
         nEBEaVwbHQMIevnuPxkgi0FfnD55gqtt7gj6cl9cKpPA4vG/CTXbZHjbNvSY5ZBj5hNx
         EYmHejBLPwolcwpufUsNnGK+L0t9dPv9UZBJ7X15lVC45gMqIjBg9hx78FPzEWFjwHyu
         PgEw==
X-Forwarded-Encrypted: i=1; AFNElJ+ocS2bzJwgPx0bqQynUfjUwfpkpLTqPGablPxFzoV9MMuYTntxiX6mlQd1D9GD4sS42KG7+NylIME1vzCr@vger.kernel.org
X-Gm-Message-State: AOJu0YzeMSSPehxJXUXMr5Bsv0jUowgd2NwNIqRXWtmJZreYu5DNC2HK
	sPRmgfr0FitrrlaXK9ZTLgfeRA8Y3aRsKGj8THiZHXcp+Aw9Ib2KulE0Clrz8s6UoCp8NPcrGkF
	CBRbM7/Hmf35hTM2s3xHRhRuZL1vt5f5ZaBZVR6sBuEj4Emshe/6UB5IGNoJKFouZgu2M
X-Gm-Gg: Acq92OGnzazBiXjaqvGOFeyguiw2XKfQdheI8/kvQCW/LEF9o933+vvR2sGTQMatvj+
	qOBYG+2+ndTxYUOC9EWv2ce2SUc6FDSgEgG9wVpL3sAYVE/2qfH4DKtMyh55osaKkR1ODnfdnkW
	OF1lncjRh1YOXo64NFTmMJ295c+Ek7Uz0sezJJz++3+8eGg6Qw1UyxVtHHKZNk1IsOz62H1JY4J
	Lxz/GqSU54aD6J9vJ7cDN5AYs1CzgVx6m9q/5qNKZBd2Z7poff9xuJ5TLJQYyDetiCqcXpWNbi9
	H/PMtTXmrK0nfQcrs+oFQVm8kgZy2DkShH2sx/J6Uwnq+iH2w2lccaZMVqks0sRy0VnYyagabxH
	Zk7zWr58VfgKVyceaoLcqRNtPVvhqWEmk87WXxA1b10QrHGhVqPk9zP3fy0BccqrsjT43L1C2Pe
	CS81Q=
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr167894181cf.5.1779112324234;
        Mon, 18 May 2026 06:52:04 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr167893831cf.5.1779112323677;
        Mon, 18 May 2026 06:52:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec7c4sm584341966b.40.2026.05.18.06.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:52:02 -0700 (PDT)
Message-ID: <72203cb2-b010-4468-be71-8be4af570acb@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:51:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: nord: negcc: add support for the USB2
 PHY reset
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
 <20260518-nord-clk-usb2-phy-v2-2-17a86cb307c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-nord-clk-usb2-phy-v2-2-17a86cb307c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6rXRAxOOpOqfwAXAGM5Vsl9gIqMfLKuo
X-Proofpoint-ORIG-GUID: 6rXRAxOOpOqfwAXAGM5Vsl9gIqMfLKuo
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b1985 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YZby4nD4H5Fmm8mScNEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNiBTYWx0ZWRfXxX1hSiYUlaua
 hoCI/xzB7OTvduvkwq5VSw+Rb4P4RHH9xbqyQnAdC54Nb3Z7zThG04I3cC8uTHKzR0CFbYHY5v1
 lruD0AkX9h6w2YqiXoafNTKki2eQWL5B3Z79+gHR1Tv3nkdxeEgWWfC+1V1QrZ2JwtvCA5w1TqC
 CzyuLmr5zJG55SU5g9Pou9Zo514E1svft4jukBP6xIxHnp/CffpgVwu428Uff4m898ndtvKvsli
 ZG7jwI4UUEqEOyXrU/7qY375IVCPsPIZP78AsV3jssJUK1H+ioea8dTb/jxUUt4J30FhDzqYA7a
 6vv8JYbxS0WqJeM6YyFxLNTKDbPixXlMfBwupo389PpGSq3KYzgXXPhrAc0aD+1Zd/TGmMiyuZ/
 pO01k0FJmT5L0AxyKe0z2VptpgMdB32jXDxh7ilMQaSi28cGc4YmC6mCFVY+O06qsG0szei3Epz
 thkm3Klge7Ve5OX2MSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108211-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0724C56E0AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/18/26 12:34 PM, Bartosz Golaszewski wrote:
> Expose the USB2 PHY reset in order to enable adding the USB nodes in DTS
> for Nord.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

