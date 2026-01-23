Return-Path: <linux-arm-msm+bounces-90344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM0+L0Zrc2mXvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:36:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFE75E5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEF5F300E70E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4112BDC33;
	Fri, 23 Jan 2026 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7A2FzM1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBpIns05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F66326ED35
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171755; cv=none; b=G2n25FEJk417g19Qqn5362Mu7YOGh0/qU5tZ2pZLveTP+BVG435oX0IQ5TbfmE2zgI/SKuUbsGx5LiIyovyI7nlbl6Dv8aENnpYRx9aMmNvj/IuEREOyF7gQ2nWUk/IFDXiFIj/OT3lH1GT9HpRnaCl1knBrDH6kswRJyCSXvWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171755; c=relaxed/simple;
	bh=rdThuJb9LxLDAy865A1PnnTw6bKg+tJt2zlKK1yqx3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTJCZp9PoczfuHtBRCeybRGMoxavM5zutH3FjYn35mKUT8KRwbN4NRyqF2Yt0HBGTU8r9OdCsqRU1AHOdStWcMwYD2SvHooA5dU8WLKTmbiCqcD6zQe9eWdZzJJQXQrRjakcdaRJ4K657f+ohAILSsFxeTrjW+4+w0xW6HrllNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7A2FzM1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBpIns05; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N7W7Io2909018
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSwpNOBLoGtq8gfXP6URVakFfQLR/Vgz8IFVlrSrCaE=; b=L7A2FzM18F47aDOD
	spVUZc257HYL9iMkog+HPTo9RGlofP9GvvlpM8E5fsZ9iebMz8vHgfUOXnw/CYE7
	T1FHJ60oCFlOra6A0adPvGtym+cP/wXdUKjty93ZtW6sFnoCujSl7DR/gYg7HTey
	MIcIKb/UgmMTwaLtmpVzLHQRcSWBf7Q04GGPMJcr0JAHgCj3lXhz2nbF2O/ZX4eW
	OJoJs2latQT/ogRn9umgp2OpymIeegAulqtW7aT6vsIRi/7gGFEI2qaoJsf+izxC
	akhnmQFlgBJVIXLCdZMPWMCrH+QOaFJ3xQLK43luotzszSax7oV3fm5LI+xKDIJM
	KYJu1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1tp76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:35:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so46856085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769171753; x=1769776553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSwpNOBLoGtq8gfXP6URVakFfQLR/Vgz8IFVlrSrCaE=;
        b=OBpIns05IvfzaI4XylHy8HDTfvqxfkG/2C1VF9HNkY4jNB/qnHZuiEOOkleMeLELI7
         qYzNABcJImz0rN325uu59BTOAeCnZq/9D/8L64/pKihniAYC0B96IKNf48tuHelDKVcn
         4/P+D7TaQZGKDLcvBIKjldk0edCGmP/y16Gb24HXjGzJ1qgZutVi2PNfkc341Pshc5w3
         JVtmZQCDMWtXgyayI0QtlLy0CsWfCVXyBhcY8mbtuHKhiM03wAtSg7y6P8AotzumNcUv
         rClJPVFN8Q210uPmIL/71RcHQA/l0rcKjA29bnMMdBqFBpou7E7T7+cZFaH2+hstL0HV
         WA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769171753; x=1769776553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSwpNOBLoGtq8gfXP6URVakFfQLR/Vgz8IFVlrSrCaE=;
        b=R1uYlP3kZcQ0qccahT7yamhbXBC4Asw48Mwmk2AmBwfz4cK9B0J1yRHZxVDP7LQe9W
         OfKg7FQfiDMYpRjBKoZITQRvlNy5v0HA4ELexcNMl3mlqYrXDvfFbUWJOGhScouwBe7H
         SA6gpwlf1yaO7aTuoYTD6cm88Pmm5pcluNlB/0NiybRWIg7pxqpoxH0J845df/evnJxZ
         lcE34wOIgU8vmt88qSaaikjBrlJOmZifbRG2YHmaHE5j8x0eaSeE229rt4OhEYkaTuRg
         dkj4ZjcN/4j/ohSU/41XbziRWsy1dMPYh6MVUxsIFex5UAmD5mMRIf6GDJC1fjAy41uI
         iSBw==
X-Gm-Message-State: AOJu0YySowvP+Z8Y5+AP39RrM2/gP2T+lnYmhDyJ0S7m5uzjPo7i/kYr
	7YTlVJS1cCpe9bnSfVgWAdATOg5GjaHnHVJxEBZAg7yPSchzKGjRg/IvjKX8lngkj/TIb7uKdNT
	EwrOlL3dX/NjvMtU05Zo6VsYZ7t+aJizvQoF0lv0EfqAU5YiuJzypuiBG8xtOKNmX0MSg
X-Gm-Gg: AZuq6aLD361qXkCqUeNvOhm+sgz1N3B0lhHYZ1/6Tl6QXUI84v5ib8RoTIMdUL5bj+K
	/Zs074nHH3SkbH7gBLfcblkuqJ5kmqjd6q3ZZvNClR2ASrvK8WVtMVfu0RWOLP2XaIfYomFOALE
	zEBseWDns6WCUm1LRlQjrkTBd+Nl+HsI7YDQK0j4qihehLLR708I4YC03Q9SBRTlMLXbhW1zcmp
	cWQd2SS92ujU2QxmB5/HV/4d2mSIQOa6yMP3X4MTGSssdsrL2w8yV789OkghGuev3UdET/gXkZb
	JB+azbFcr7yxpC1zSD8zTJgpnM5p/g8i8W5+k394YerXEF3kf1m0B/osUr+OParc9p/XGMv5jK/
	mU7SrsrmNV3+woXpJnWtk+nEmdDt3KBh7EfL0WhK2kI5s/g7Ry626bn76yQ7RpgMuYLI=
X-Received: by 2002:a05:620a:1991:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6e2da3ca5mr280044085a.1.1769171752710;
        Fri, 23 Jan 2026 04:35:52 -0800 (PST)
X-Received: by 2002:a05:620a:1991:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c6e2da3ca5mr280040385a.1.1769171752180;
        Fri, 23 Jan 2026 04:35:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b7661f7sm98326066b.54.2026.01.23.04.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 04:35:51 -0800 (PST)
Message-ID: <837022c2-0e0f-4b20-af9c-de04d8d08074@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 13:35:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Fix PCIe1 PHY ref clock voting
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260123-fix_pcie1_phy_clk-v1-1-38f82ea01792@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260123-fix_pcie1_phy_clk-v1-1-38f82ea01792@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PDKTgDsi7Jw14i6HhTesC5kzgcYqITOC
X-Proofpoint-ORIG-GUID: PDKTgDsi7Jw14i6HhTesC5kzgcYqITOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEwMyBTYWx0ZWRfXxjpphQRcWEbw
 oR2FKiVdBnjR9Xhmg2gFkl03TlK/FrX8Md4jqfUhAIAhyWFCv6oFjBsHqbZTQYUTMlk2FSIs9NH
 zm3TjwvXZLqU98W3H3OqS73NTyADlEJGu5G8h95YJ02HI3puSEOVknXV6L4q7GEBCTj7RVLiTFF
 pOrG0tqES/nkxCwMnGMlECqMm9UEWko3hBU3SRfVKWYWX3Lu3Gr5HGpyKlRhcg8/BqKurpKphXB
 o/Lo2EReY7rpFOblRl4nbs7jfOnWBtsf4AdnkodbloOjX0IqEvIUIJZF7tdrS59ZjSixLcLqmt8
 72O7sx957xNA6zoTx8cmwKNKeih1ewhD4mdMDKQbABCn0WKZ8gH2LUEjRhZ9ip8zLjEkSHBjEy+
 7R0QD5DK/QzeEXKAlXfHKD4YHzKk2fSQeWIpoeO0GxuSZR+LB1jmnvodmPI3xPpeRFMRX6s6MSI
 ffdTZ044DBLkJj2b3tQ==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=69736b29 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dkODpQc6jYzLo0hoCJQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90344-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10CFE75E5F
X-Rspamd-Action: no action

On 1/23/26 1:12 PM, Krishna Chaitanya Chundru wrote:
> GCC_PCIE_CLKREF_EN controls a repeater that provides the reference clock
> only to the PCIe0 PHY. PCIe1 PHY receives its refclk directly from the CXO
> source.
> 
> If the PCIe1 driver in HLOS votes for or against GCC_PCIE_CLKREF_EN, it
> will inadvertently modify the refclk to PCIe0 as well. Since PCIe0 is
> managed by WPSS while PCIe1 is managed in HLOS, there is no mechanism to
> coordinate these votes. As a result, HLOS may disable this repeater
> during suspend and cut off the PCIe0 PHY refclk while PCIe0 is still
> active.
> 
> Replace the unused GCC_PCIE_CLKREF_EN clock entry with RPMH_CXO_CLK to
> reflect the actual hardware wiring and prevent unintended changes to
> PCIe0 clocking.
> 
> Fixes: 92e0ee9f83b3 ("arm64: dts: qcom: sc7280: Add PCIe and PHY related nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


