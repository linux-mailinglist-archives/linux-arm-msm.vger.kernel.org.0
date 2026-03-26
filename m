Return-Path: <linux-arm-msm+bounces-100067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CgwMqn9xGny5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:34:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B6333266E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98D233042395
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7336437417D;
	Thu, 26 Mar 2026 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeudyJRk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2Ppfx1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D0B36B047
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517396; cv=none; b=Hp5v1y1nAAu9AeZO11hMY88X0udwYwdToBPx7DJuyWTSpf9giP2wpmuMkWhDYOxMi2OV/Daor/m39dAyCS6+0oC9bHMo3lAdj1A7UD9V8ol3rHsVP+scANTb76q9+7tb1MSeazHx5PJyWLd7PGAUgK5qXgCcHfqEaFheQLRqBT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517396; c=relaxed/simple;
	bh=OEtA4jyMZvL9PeaZrYIy2+s4yVitbGhdxbY2yo6rOmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfiRbJYedEr/ukKpXTzCbIclPeEI3wx2CYFnPIfSolZMln6xOZ8YC8eXwh4u2H6XCabDBtjDENnzx7kX726Id9zKIPzjqCuY/rzY/F25zi2/Der0fNzomxUZgSPIm0nvcvx/tBfYao+S7uD6wT/ctTK6ClTrS3iaBYcO+1sDmLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeudyJRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2Ppfx1s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8OHV13959349
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=; b=jeudyJRkSOQY19x2
	scimtqrtUx79HPyLXNhLQaaP5m93jInrdrxg300dv0at+Og6AeKLaDOWe64O/WXA
	6uJER2RJkChjIRxTHyN8t5D7xgagPTBW4JpeA8Xvfc/qaHUeiNcXqd4jyeZ8tRoW
	eHS7E4hKgFUCXVAjZoO66sZRwu2zjZ9RuJ0F8YAZiY2kXMsz1MlzyTurBkOcVkHo
	yfXxLmRzweQiOyyz4nkTmIMg+27ej6Bx62ku8sFQ3ECnLFjXrCt2oDIgc3UkEKHP
	WQzp+tUGABYHDxAlNWxab/9eVMHEtPFbArsUHsKB5BDgZWfisC7d67h0EO/l/EKd
	wg5jQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjahj65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:29:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2a1f123fso2479681cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517393; x=1775122193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=;
        b=J2Ppfx1s+ssL1DErG3AOxOYcGDilEV+Nw6mEw5wpO5sr82ZjTTRloELL+VUMyMbYY4
         Lpow469U2vOUB+wDyCqPKr94aiJMIds3CV4cvsDgiagrnd+SMbQoJpSFws0VOpqqoMEh
         2MknHw+EHc49LC97gXLFDk8XKqJaUvn50S6FPUyacmirZpVd3TUJHkfgxRQqB8z+HkOO
         e7YNQmD+4sin9q4PZF0YLchYSJH6sDadPN3l9eBTustuyCmUFSASU4M9S2T4efNKzfVD
         5ClvYh03kao5I8xoVkjjKUooo6cXdKPwBqvCDNpDgDsLi35jgBlsiaIEDz4kws3syBSM
         DOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517393; x=1775122193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=;
        b=kcVkEY5epOLVwuTA6rplP6VLvtBILBu6TT5h5tMrRPBwPJnMY3LLBaWghdj+6oOEB/
         zdI52EfnpoQR1ojFrHWXFc4HJhycmhKdtr5zxLRPtOuvlHln0PqfOOCo9EHTZ4qK4tf2
         iYsvOflLshFp4/RrSCqaBtQUtw8JV4dhBW2IQDDd6jaaLQCjWBpXv/IDKb12QnauhxjZ
         cwktaNg8jjO+z44vvyke55nTfTlWiGBTxfNTfL5JmGUiw8oh7GsjRWHwLSqjfKVjHgZ8
         klrGSYKsnX7fs7/e3xncSwe0nAX3FndRF6SYziW9CymEVb8/OuCsrRazE0DK4o+qieZw
         nbWw==
X-Gm-Message-State: AOJu0Yxm0CevlE0dB5Gd3DYEpaTqwLq/wtdkhzdOY3kzVDW8UEykMO5Z
	h1kgwDTD0mRPJ7Jac4YF/miVm+cE6dJxjNSOoF3pnccBMkhjvPNdIY+smSxA9GSyI5ucu0/Dtmf
	EzFZpKCPKEEYVBh+A150EQfDPc1wnjC1e0wNkegFznyM6N9OR1lz/FDqg7nag4cYLqL8/UMIRsx
	au
X-Gm-Gg: ATEYQzzjs4pAjCMQ+jezLuAgW1u29LFH8mewMzZuJsiuuHKM9YMtkO9XWvkYsLCMGIn
	EPhP0QwsgAlcGXJqkjIQ8rsVQg/5ZKTQfBjN5KdrX8+4nrMzAc9PCDBFxx2QeO6rzQvh6P/LqJN
	BssfkKtQWz+jIt5HbEA+VjS/ZIIcSAyR4A/n9ALgeQDltQ39PCzIAuF7X6KPI/Q702ggy9fEVNO
	kUe/iJ0yyxgV6ceNbLAw0hBLSAdmUUDCRTa+rvfDkPX2ztC04o3FeVbDN2+MIEqjskp8P1SNphL
	IdixszxR2zvvZLtved1KV+Kxgzk1mdOUBREUPCndzp7Gg2cmq+JbosIdVGis30g/qYagannZIm8
	NGSEMCwP/8nObVPhNbt4E9PfWil3Y/kFI80lGkv2+/OMMfXvQxlI7IPPDTkUM6zIrLrPXiiChTT
	NGsEE=
X-Received: by 2002:a05:622a:848f:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b80f42a88mr55691411cf.9.1774517393513;
        Thu, 26 Mar 2026 02:29:53 -0700 (PDT)
X-Received: by 2002:a05:622a:848f:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b80f42a88mr55691281cf.9.1774517393028;
        Thu, 26 Mar 2026 02:29:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef86csm92027866b.49.2026.03.26.02.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:29:52 -0700 (PDT)
Message-ID: <dd71e35d-5dd1-4341-bcdb-d082dba41d3a@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:29:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A0m447yl9zE-t_1B-sUTCWAC1n_VVl-w
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4fc92 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=RfqWXZ9bYgCeT7nH-EAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: A0m447yl9zE-t_1B-sUTCWAC1n_VVl-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX+cE7hGglu2la
 1D45mjddlhMGh6QLfcm1OlaQOjqPjiTTAfw/7cnx0Qt1R1ycmU8PfsD/aHpsVn/IIffuLYNlk/M
 SmI9X4KAE4T8BpLJkfbWmQNLDae6S1g6GJgCeBGUhgDuz7ZL88VFcUvoU+3saZ799+r08n8yiqj
 Xeh7vWWTokRIIyXcL9k/DJgfdtztnXzqT95+d5ChYRSY5zg7Sbjz6RW3v8cvjuQcT6O0lJz1k2U
 S4j2ohpow6SRsABoa+YjROMCbQOd+FPIq6sTmlL/F4IdpdE/sh+mWEKA+MEIgnTlNGXutHvLsgu
 OuyHeyzUEhxBuPi3HSQyJCQ+FaiURRjQFQFMxtI0i0PfFjYZ2J6o+qeTM9yVKlAyIm2ENQPGwch
 c+a7Ek9ia+jW4WNhPd6jAEUH/nMKdqeal668NxJ8dNJY0NgOAJmRFTw2euLNjss3JzKDX6GC6dV
 zuGQQKpOeFNJVcGSh5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100067-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1B6333266E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> The IR transmitting LED is connected to SPI8 controller.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

[...]

> +&spi8 {
> +	status = "okay";
> +
> +	irled@1 {
> +		compatible = "ir-spi-led";
> +		reg = <1>;
> +
> +		duty-cycle = /bits/ 8 <30>;
> +		spi-max-frequency = <1000000>;

I see the binding allows a power-supply handle - do you need one?

Konrad

