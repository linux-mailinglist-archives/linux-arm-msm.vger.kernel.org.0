Return-Path: <linux-arm-msm+bounces-110578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAPPDwBwHWqWawkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:41:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE9961E7E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 13:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 462773005AD5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 11:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B190363C53;
	Mon,  1 Jun 2026 11:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oX3KzpYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGmc2PNy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D482369D42
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313898; cv=none; b=nJY0dDIVCSJlCAh2gHQwlNgalGWi9NitPwwd8HQr6dPetVMwwMXlySCe23gYzs6ai17BMQ27zTnEECRf+h1HAIQQ7HjqcBApUS1sx8aUVzQXfAalKWStu9496IB3mk882jWWIhNRIVLYSTsRj2w4XUbhNSLPBCRWhDCPuzkfSEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313898; c=relaxed/simple;
	bh=SWTIaQyUE0hLCUIIN5L1msdquqlW/MHKkBotVFsNjh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9DjqHaYCLN+WwWyWblAxvbL2uep3dTKQ4JZNZ2RS/lmPDO3jh3OGVXjyQ0RiXwvMzR8Vep4p57/McHm+RKGISXwP1fg2ZVtdJfOEjZMaUKH+hmnQHkHkfV5wV20s5wPxZx2m8EBDGdpc6EEBDRfPZ6al11XWGLmf06HP2TOAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oX3KzpYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGmc2PNy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BBQcj3128747
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 11:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U2uhUbSn+d0+wL/JaSPYQdq7
	U5EkDujpLJ0FBYZnkRc=; b=oX3KzpYVOqj2ALE5wZmlP8c0N8xuuhE8BR7mwEzs
	s+ufXextn5U5hNhtoeqlYFZsZJycNhDXJMGvQo650tiGUgOKgEMOv6tvyrT10uPo
	zR3+OEE64UWnW6mMzhlMgejt//eXZktSoYLoqlDW2R0jhuxF46E6PIx8Nz0D4aB2
	oUi8xAWL0FQgf24uMvSSsDtoNy7/13IcL7eRRbmiyIzKXRbKNLP5Z2LQKOPIaudw
	dshGRd7FOFzMtU7NvyRb3qD2wZv3MGGyyjcP45PYGOfOXPrJIN/ZPcf9qeHsGaBA
	sBojjBC6mMv8m9wRJtw3vD4V5EQiY9+dKCN+sSvXmbb1lQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh901037u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:38:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c69c788ce7so551415137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313895; x=1780918695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2uhUbSn+d0+wL/JaSPYQdq7U5EkDujpLJ0FBYZnkRc=;
        b=WGmc2PNygVeB+sju6wa09j9LzH9ySUhgkUD3+0nxbY81sa+zICSOgm1lHUihBLL3vH
         Y2gJoKLnVbB0N0CYr7/l8Wu59S2IF1IGimQnev99QPxUaWNT50YPcmKocmQTwVO+T63m
         MUWBgKsvC7qz/s7tSN5BiwxTF+3t0ZCZ5Pk2PW5wjIljcy8pELAUiYpJNTfKk8u+QrlJ
         PxkeReTAd7BdxLHp9MYbF5icm12U6BHVaWldOnJsXJ3GTpNKNx0lKX0CnST+L+EZiIYT
         RFefdUDiGqUeBfvNO2gQPgciwQCMRUj+NjZMTurnIgok58JGyGErmmiMWUD4pqxvHtlT
         9Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313895; x=1780918695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2uhUbSn+d0+wL/JaSPYQdq7U5EkDujpLJ0FBYZnkRc=;
        b=TMmOTmO8KX9ui7MIjEaM95aV19FEUYiUOqHh7iYZ4G3ObjFJotoWPT8xrZEoifOy9Q
         LzXM/wsHuTdeldlvdcaJXrz5VzujY8t7ZmY3flwhl63ZJQ1xcloOifNuU+yp6xd3d2ZG
         kkX7dCLRKaScwzuRAKkXtnR7Zs9EWYiINzabnTKdtFkoXw1qO/RHVHjbVw/ByorHsr/B
         NxuUODeDOxGdzJujiI5DVbYqLUpDej9mCa5+o1uKOsmi43C369sp6JAwRBc0m9i17mX0
         86+xNyuE3iXJR19t4O1k7CcvANRCCDIitGJ9oa/FR1716BWiohn3n8VijUdQMOZTCysG
         H2cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7n9UaW3PdBXwVvgzFzNhnr6YNX1/lIbTGgglOtktvV/que6Mdpk0djoWF0MWLQC8vJs+z2AILSgi1evU7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlkw47lrwqqdI2O71U65qLjVgdza8l8ndlSMei+bq+gVu7rx2V
	i2zvcnwHiiXJpHqQAJeFS+Bc1wq07dDrvOoWE1S25XTwTrSJj7GKqF2Hn7mDSAbUoUeLIQrnJH6
	it6MrtD5vrRubOhsYbxX+mqZ44igUAthDPTtXgoY3wHLKZcE8nzFLojLtW3uLqXt9p+xY
X-Gm-Gg: Acq92OFIJkpM7VwBL9/WfzkWlIuE0uvF2un4VJaOG7wnWodFuK8cBN8YEcx7q1ndh4B
	exB7jR0WD7w8GXmp5jYij6UKZ+dx/RxjHGzAKY5dtZ+PEtpogGNJ0bhjzs3I+P59gdpx67xsbGn
	+cM9sJt+mNWKLLxPNRGhdzET95UflbXqvndjuCCu3fmbV5toZJ0FxJlZLJty/svmIMzEgEoqAe5
	TFeydGq3IypizRPu0kMyY8bOkwBnyWso2/7s8JtV7J7roRD32GJYXxMI32lZNjjOiOYad/uEq/M
	liSlZ9UJUZ9aV253cmlzsTxCRIP/SQe9hyHfXHBb1IaPRj+hPV9mcI7YuNZ7iYSOuZN3RViNZbC
	MrqPX4xkRVIw5slmo8BW5c3ZpgwWYE4sBGTcqkhhX4K10PfyP8pE0m79HdS4F3Q/oSfx/lrP82T
	dUsMmPR7lNAhDpqX2lZfckR/sTgHagQfmSb6HU5lmjtUYX4A==
X-Received: by 2002:a05:6102:3e22:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6c69b078cbbmr3454937137.26.1780313894876;
        Mon, 01 Jun 2026 04:38:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3e22:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6c69b078cbbmr3454894137.26.1780313894373;
        Mon, 01 Jun 2026 04:38:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b06879asm2022024e87.7.2026.06.01.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:38:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:38:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1d6f27 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: m2VxGG6-bcL89ZzehwU43aA-zr_AkvcQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNyBTYWx0ZWRfXzFaokSNt7iWY
 z0ooQcapehixx+q0kZO/9ocWumGo5cZJoe8dmQppCTZ6LdL9ixqQPvAwdwiqFyem5+R1AUrH4sP
 4wJnaU1dq2/t6nmUp4SJcVcU7lUImUanKvDuMb/OKIzLVZD87r59efJP+1Gjbg0U7zm07IQi4++
 c2HJ6OX2sNI2RvSvwTBjfAwEsZ71QQV3N72w15olHADpKTP0/jp03rieeZf6MFD1YiMZDb1orTF
 UhhqFZKux2KeJp02FPHi0NP0u4y32W1QiDdhIz0WAWAUjEgSXCRs5pRg4CN2bHGk3/HySyG8WeC
 dqJeVFc7cE9nHbVHb+l/TdSrQfc90YuCoXRT/Og3PScTF8ICWht9s/GjmG9a8vO1GoeXQ4AkUp6
 OckK/1bZTD2YM8E/dunVER/wfm5at3r/Qb/cZEewF5NJTBt44dHWBQZ3TUx5kZ5GXrwh4Z8qsxt
 IKqwnK4eVQnbfjWMEFQ==
X-Proofpoint-GUID: m2VxGG6-bcL89ZzehwU43aA-zr_AkvcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010117
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110578-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,smankusors.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9DE9961E7E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/clk/qcom/clk-rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

On the other hand... You have added APQ8064 strings as a fallback. Is
this change really needed until you actually have SoC-specific quirks?

-- 
With best wishes
Dmitry

