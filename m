Return-Path: <linux-arm-msm+bounces-103879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIehDqn/5mmc2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:40:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 800E343645F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15C5C300FC5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 04:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0AC282F09;
	Tue, 21 Apr 2026 04:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAlaYkq8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7c/xuNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378AC1C5F1B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776746406; cv=none; b=VYyPrG/E5TAlxiqGiMuogZ3ar++Gy8qXHjQ3XRxY2jZfmm5WrRrkQakydTZYHIf+NK9sot8MZF4sonuDiJg9J3zrgK/P7LUZZiihTJ8dU55ZQM2u4Wk/i5h9cEElgFptoeyjsySxnsRqFJnBkNnx1VXoy/4IcJpFTLbzoNXEGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776746406; c=relaxed/simple;
	bh=l1hLwGTzUQIgc/1bX7GBrlEwTlCX8TxVzWClqq4NY4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9uwYDlGxbqDKANptxjt4ghs2PP8nUX3Cof1SNA9/dG600gvvr74AYVRJ/k3RUEjcG7lC01OflQO4A656d9RbRwpzQoe4yl/P0pUryuFVe+cFdE+nX/Oy+R3cz5N6uuPuNVW3KJ7xfSJCkGwELYo95NCndXyb4tiSOc1/rwvjp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAlaYkq8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7c/xuNr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L3Q9PA4168833
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tr8825yytIorPd8JENJPxBVEwgt50vut82kIS3f4fNE=; b=XAlaYkq87eXVkSAc
	W1Hz8pfZe4QPO6bhL1j7nzDE/4Pojp27vIQKlpkH1hjVWchGsaDkX6Y8b4j4/PV1
	eDiWDPWOHy8/YDp0NkFyUIPBbi/mVfRstFbvKfwU6OakEmF9429bgDEbNdCKpkYu
	8XnAn+yV0SqjD6RWYZ9GUbUle1OAVnWHJDCKoXLQuxvOJTq3t8bCNhvCvZKgv1T5
	OpLNHwR/GlKuh6vN0Lx5SBIdiSEmT9YOWvMtiVBQc1ycSwSdr07+RtrWqBkOeQ13
	I+eZ8+Ncc+TdQNjNb4uU7cznGoSOaGJ2q0ZQQ0anIVv0eTSFUsDNx7wLVoZnu74u
	zJ+Fsw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au06yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 04:40:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f543bae3cso2008524b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 21:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776746404; x=1777351204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tr8825yytIorPd8JENJPxBVEwgt50vut82kIS3f4fNE=;
        b=U7c/xuNrpNGu2habUf0jVDS3ucpEMNe2bcIfRck+kdnkQSjUpnErFuW/ifugST++KK
         8LTrMEOAUPHaCyYc71VHHfNvsvN6DLfBWpfzT26kZZCEYH7rBPeWZ4EiUkUI6ZTvIOUY
         vL1dHLSkPZmvBmdGvZnipd2u1vbHVEvbZtyq8B3zf8RYeuoPgZW3jVpYLrWVr/si9YV1
         RpOhmezpQHDOsDQ2T2NrMITn4F8G5invOhijeEFfEBFpKZtdru1HjZdS8khvY6zSbnkt
         /ejtTlcIi/WUR973AEt+Z1FGcmNrIwyAmGQrFW/C2N4kpxR99hrOvBiJQTWYSHYSKFTR
         cwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776746404; x=1777351204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tr8825yytIorPd8JENJPxBVEwgt50vut82kIS3f4fNE=;
        b=pMRqE7LP1rVQF5cJ3rlaln4LGgGwkrcr/m+zlNU5KtDuyAaCS2GVCzkTbKs6d4eCSi
         gDJk+q+DgZdzdHCD5h8h08WV04YG0MfBrdXKtyXdpY6lfeU/m8WsKCRA5o8NTTB1sK1U
         3MOnBSyOhQWJPb/Rlpp+Y1rJiRyQswoflmvck25wLz7ebpO4N17jIiSVi7h5YJPp1bJO
         QWk9zNPRihzi99G1RlN51P09MDFH7ic98NbnixAvjfRXQg2aAZIQDrXs1BSf9zDEMFxo
         QPP4At1gf6uDsZeQOYMxcDSV96F1x1ZrHvGMd3vDvnkoZ7HYI+ttGwBqprKmGk6kXcyF
         L5EA==
X-Forwarded-Encrypted: i=1; AFNElJ/inEv+HdDJkULPIEmXSltGacRFrF9eRwifoSZXBCMdaYNog3UJapkmmSV86jBOCeBwz4IXHC1GuFSnaJIa@vger.kernel.org
X-Gm-Message-State: AOJu0YxiEB++9T1cC6L6OsX05uGk/c5JysDTEtxDG3HHfSGKXXZ9+sWl
	mb5VBBQZKjIgHK9VC360tG1fhqchaWKGZFSmfwjGxtqiMGkg6RTfHIDaVbcwWEu3pLwJ7HPiFV/
	m8uN1n9K0T9/sU+Ri1UwA+Sm5FTthQ9cQVJeDHQoACuDPXr8ta6xVZTsfCzpAq3sv4ZWs
X-Gm-Gg: AeBDietIJBTVw04tReSq4ybzMdW5/CEwd2ZvxzAyvAnq2i4FrK9cfPjju1BR/glgz1b
	prYUTLDj1XgDF2C0S7023cPF8qUER9u1+ETAzLiOLdt7uUCkCMh8VF8t9VmhBoDYeqYoJ2KmIn4
	oXuI346K0+lolkudFmDmhYpFy0nDPDxZir1X50kTbgBWPZRQw5l0WsXEPo/h6sfvkCALSQ+Fc0U
	a+TmjGviBD0KOvOWHZ91xAl+/kQbu5aPdTihxHrRUld1ep1TQT1G7xXUcaE3wV/VvHkntglWDWs
	Ye4/EYyL8GEYhF1vj1sHvYXBj8sWh6gIbNyIBc+vAlTyVCiseGauLiZErsakguHp4Gfyavlz44p
	sbiIPVSH1JzNuY7qgoUWjn4/F5Ut+yqiViZca27TGQxdEFyHoZdsdkRHiMq/3dlm6
X-Received: by 2002:a05:6a00:181b:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82f8b389d04mr15077974b3a.8.1776746403694;
        Mon, 20 Apr 2026 21:40:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:824:b304:2d1e with SMTP id d2e1a72fcca58-82f8b389d04mr15077947b3a.8.1776746403173;
        Mon, 20 Apr 2026 21:40:03 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm12628440b3a.60.2026.04.20.21.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 21:40:02 -0700 (PDT)
Message-ID: <ef46f228-5644-4137-a117-201fce7b8481@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 10:09:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: talos: Add QSPI support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
 <ln66k6kv2jakmoi7nzvoven66ugd4xiagpazgpnxaw2u2ytdtm@42eikb6kyvs7>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <ln66k6kv2jakmoi7nzvoven66ugd4xiagpazgpnxaw2u2ytdtm@42eikb6kyvs7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA0MiBTYWx0ZWRfXzenoP5RgCsV1
 N6Z7UfwKpd0xmbNlHeygguda9r2nqm8fbnauZeY1FFjHiE5amiV3D3W0qNC1rt2CSv1gd7g5qYA
 4/7TuFLz+7sy9YyqQjD4hy5ETO0NWmVgehvEDlESjQ7zaMeA5ZK7c6HNICedo0u4MeUC75RZMe6
 eElrgEWrquwSlQqKvuZHhq0vntn6Y1OySgkse8TiAvHv9hSnb7jdXaUc0YCWKtjSjmHx7ckBpvI
 urxwZeMVkFHbGsy8cj8VIFLYz3UZq0o7oXJOaefCbI1hnKn6yppWJqgFfftPlrdjAO4Y+x8ItRV
 01Qj7KAy9T3cBKmYHWtC6as7r8d4Cq/TlU7NgWbu2rtA4k6++fMDZRj70OdUpmSpzFE+wpnepQt
 MBdwblNW1YpuTyAvIHoa+mGKEEqNS0Lwui3xj+PCOeIQwsam1Db7q7xqUlFbxydW/fA7llUUw0y
 s4xszPzxOHR0Xju2P5g==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e6ffa4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pflzKVUtcQ7LZN8AbZUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: yt8l0PVlpYBv2Z5zOYrtKCxCFWUEzPlQ
X-Proofpoint-ORIG-GUID: yt8l0PVlpYBv2Z5zOYrtKCxCFWUEzPlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210042
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103879-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 800E343645F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/2026 5:59 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 11:42:51AM +0530, Viken Dadhaniya wrote:
>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>> the QSPI controller node to enable support for this hardware.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
> 
> You got r-b's for v2. Looks like they got ignored...
> 

Reviewed-by tags from v2 were not carried forward due to code changes 
suggested by Konrad in the v2 review, which were implemented in v3. 

