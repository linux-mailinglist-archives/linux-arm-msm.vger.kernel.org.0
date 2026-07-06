Return-Path: <linux-arm-msm+bounces-116685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AlIHBbZmS2olQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:26:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EA470E12F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:26:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PoadJ1bN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="RJr/42zP";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116685-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116685-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8712301F5BC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596473E557A;
	Mon,  6 Jul 2026 08:26:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBED3F39C8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:26:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326371; cv=none; b=I4YPk/RFIm9/BvTDLzkT/hOLLzReYaklKwsAapU8XjFrSQ77cpyGDLrpLde7f+tc30jeaQ60pUNR+ttayAEmO4Lbnm/xE4riwaLFI+tGrrL5aWaiDf1KQ5zqtT0JxeDU+A3EZ7Iq/bZ1iQarYlQJ+sjTv5qNUxwt7ZMsM4Kxfjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326371; c=relaxed/simple;
	bh=9TmJTxog7qWFnufWXDa9AB11Ah6aPGB3aFbqJzzK6GE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGdVmuWjxu2jooskKHhRY7q7/7MS2HTxXGrp6BP9Dq8NmkQ5XiFspglaDjWM8lpsS3TlJ2XkM8XC1JkBriraMJuTAfYH/GxWJ8+ofkmgE/fUAGkdU+D7d1KFN+2sZ/Cv/9tEU/KubRCDWByv8Yjq1lh54aKzLQ7pkottlmCzn1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PoadJ1bN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJr/42zP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6667C1Es3844957
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2oFFca8ypbw0NEVe51w5DDl3c9T+p48AMW8pgp02Ss=; b=PoadJ1bNUXKR0cJR
	ikDqu6Q1LmideY/RA94Zvmpg4XGcT7o2+VO/kWzxMy1NfEavXt+IF04c54pKzu9q
	g6WExmCYKB//0H3sUv3gCjDAMcma1fL7GZDkBLM1HlRW6WpidJm3Wt3edaXIsaQr
	9V3nbdK/QyVsHwkPAdVNL9tGJuNXakfANwq0Xc+XaPZ0edlK/pTHnlrW7+Kq7vk3
	D1TCitT9Z1dyHxOA+Ehj20iH73s8WPIhT7548rLmf4vj29JMaETTDX0gJifb3JT8
	cr90RPHFdKMBckozPHW76E0Ha60nrA5ziLXTgjkWnczg9xbUyyEa6PbPR9jYuEyG
	COig6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxr9f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:26:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c069f73e4so9186111cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326361; x=1783931161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2oFFca8ypbw0NEVe51w5DDl3c9T+p48AMW8pgp02Ss=;
        b=RJr/42zPnVyYZ26/zfi26wCH95ZBhc3gwK4tAOvoHya8aPe4yEaOeLPRC4oiPYw6mM
         +Jd0PqSYDl0y7BVUi/ZAF/3kOP4OUfBsM6rjF4/0nojZbacRXQ8Ne+yxArW3/HLFD2O7
         jlpf5dXuBcN5GBcvgWLWp79uQkFe72NzqRfHagg5JFG0PLadPFjasah+tfTm3khIJR/c
         WjWXhjHHfppmQ/0MOBecMurO6ohNNjnasQoNCt5wbWv117aXvlJOTUndbioXgJ/aVOKn
         M/KQy2lrSttbBmwhykN8D0FVkPBsA8be7vMOCkMZivb6H0FTI0cMGET+7WKbIIb8aamd
         l9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326361; x=1783931161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2oFFca8ypbw0NEVe51w5DDl3c9T+p48AMW8pgp02Ss=;
        b=jKVMvRLre0KKyFcGSKzbZW/ockSVD09AuL34BrkhBtB7QvMBAmhkNnBeOa/jh11cHk
         /6jFDtbyfFzok5QON/yFg9zNZVHPYWMqt4mApgROQqQ5hc69O3uJbcW+iTggcYSOspDJ
         G/zNOxUDbjNQxr+3T39z3YeTyE57YISzIiQrrgKGexiHAY0tFEuxOtoA/fV2KH1e2gFI
         27i5+/rikKw8iWmeRsZVvfeke8hZ5xAEvbml5lk+AsndK+fWEVVj0ykr3PFD2TvtSfGH
         ZYOBYJdd5uN4dV9qIe3pM4sAxtVESTegv0CDnxcUJApjDOLT50yIZxgzYZ15pi+8YZsO
         x5Aw==
X-Gm-Message-State: AOJu0YwtPFZTGfibHNZf7xHC+OxbUv/1tF0ch0luCeG4O+BiDiBK/Kl3
	gaF6j2v/L3rVTEuSjsww7uyGnrhsocA2ZIdJgaN/KJdFHCVyhv4aEsHKK3VHeZ2gXrlhZXxfr5y
	D5lBkOkLOeJTyCFkOucafu+r2+s28OWTuxJnNus3r6nbdjrP5Iu2pDAps+rrdYOcaWt00
X-Gm-Gg: AfdE7ck3fjRvIB4LWecnhNFIKFPIHed+nXxcKc5eWx1kmAMZFSJ6DvPnDhS0CeL54t5
	lBS1D3DcSFdxxbHA53CimcKHSDALc5M1EtgFv9FfBzNTU9UZr0l36/nnO1iQJIVM01g/wLaOao7
	9LNdbwxA8s5r9Q7rd9lhG9PMzVBnG/gEbRU5GQPsVGG/+cpfx2pu7BNuiBmBtZ8o3lYYWeMuOm5
	UHmeMraqQYkBeT18RlhqAk1f0LUPk4/iO1ji2IvFm1/sDh468GdTphqXNsZDkX5NnfISvs8vRat
	I54bKOo1gOsEVeJKm9Xu9sV3HY3WI5gT2Z4J+KPHkmVt3xcUdNcykhWQy4n1bUgaPx8zKYM1LlA
	kCLsqwOzC1exfcvSLyrmm1CCpRVvDO9nVhnY=
X-Received: by 2002:a05:6214:5d8c:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8f74a615b95mr78487136d6.1.1783326361001;
        Mon, 06 Jul 2026 01:26:01 -0700 (PDT)
X-Received: by 2002:a05:6214:5d8c:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8f74a615b95mr78486956d6.1.1783326360636;
        Mon, 06 Jul 2026 01:26:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c52sm703064566b.58.2026.07.06.01.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:25:59 -0700 (PDT)
Message-ID: <20105e18-98f9-43c4-b604-3fbad9a37b9f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Use lowercase hex for unit
 addresses and values
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-3-16ce82a2bcfd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-3-16ce82a2bcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _NsZuZlxJ5jUPY3mO7X6zogmqA5qLX2R
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b6699 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EH6yodd7piL4EmllAVYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXxls29DX+ncQL
 NxcXDZGYg0B0XjoGSvVcBMnv02TG+UKaV8LuUTqZXZt/H93UWNAfO1CoqPM8jVEay3bRRSJZ0Xu
 LWi3L3iQo6RKQ/c2bh+406u6DSk9YAg=
X-Proofpoint-GUID: _NsZuZlxJ5jUPY3mO7X6zogmqA5qLX2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfXyFoiCkfrDIFx
 lWRbeuhMcjfZqpnLJRUwG2V0xvkLDjbpHdsuiFQNcWC8htcxafAaIZOi/xL0w1+kqxEjO2THbgF
 DVjX/CJULfi5N2pRZEqnkBDiLqr6a7A/6oO9EXKJZD2VpGG3LBazeuczRXTKuOVdiy1z8OFf7mX
 nYVF1zEzxh+5opF8JfrvYmhmWc820SWBooXHg68Y2r4y8Y6aN7XirZXguvzQBXH90XdQaM/MzOq
 qmUcP/Ixy4/buKZElowIaYs094+GMn3p9SgwiMotTCEUuuu/CWAp0lSXPvZ/nzjF2VbmrkvR+jx
 VuVfxfM4Nmh8x8xIxYi24oUAoJkP0J3NgeKIU/yvHQh0640O921t/PCtgy/rskJ3eZ8W7Sli3I9
 u1FlEEJpZZnWk343x+zlp3tgN19OacCyQn8aOdjwPB/qrA3iiqsHC6wCygjJw2YefAXmr46YHbY
 Q42Ire+VWs8/el1gv+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116685-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2EA470E12F

On 7/6/26 9:03 AM, Krzysztof Kozlowski wrote:
> DTS coding style prefers lowercase hex.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

