Return-Path: <linux-arm-msm+bounces-107743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k8+9GUXqBmqCowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:41:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B818854C9C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A01CE3168B75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 08:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956503FB049;
	Fri, 15 May 2026 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOUHPxAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQb2gON6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD58D425CFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835438; cv=none; b=dFvbpnmrEWe5Mlb+rXDOhbzcdAMX3+hemv1E7o+Nd8nmOCMIGFSX9M0/Ay1Qozo5hr8z+poAgfg5YKAIy9hsaOX7TZyCqHGiwWKJipPBq8DYrbEeTMzkCWd3xiND74KiLtGg0/3nfS6T5QI7ze8mAf6buqtaQG+f70Uq7Ip3Irw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835438; c=relaxed/simple;
	bh=ZutffpRLB5SDhN+mUU26V25VuwfZSRqg5Iua8cnMPPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEEw0IikTclhdV5Pc7WAugHFapM+8GdYQUz1G4kBywypL5KfU0kVKKVUCSGFcl/zgDkdItwbd/A4DBroUutrBQwoOH3dgqK4Gcu53y6+pMPHiXsoYPdYQ1xxA2ecaCxSf+SYdiAN7K47R8RcBdB/3+FFk8BFS5qEZxdG36sbuIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOUHPxAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQb2gON6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5H3BD4020769
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCfMxiflEQa0XgpzXYV1FIJskJxw98fMvTJvf9TrZpk=; b=YOUHPxAot4ra3Ic4
	ElkGH9IGrmYL+dIha8lshBlE14rluGH6f/tYNEwHq/nVVOX2eJ3QouFQHOKTeI9/
	qIwDg5EgRnBmft66xrCAwGjLeXifEUpmq0IWkKw55v9JfZpu4mwDSqXvPKn5ljeo
	Cl7MjuP5uyTNTC/46ooYGn410KKzWc6RG4x+8f9DhZIYQ/fnEbt3PMKSurWoDaDD
	jlZnEC46NpCUrsUh/EJunQ84ZfOYOXGconAu5Ku2fprUJ0YMI2LeX4nDjFCVK9B8
	ZVg8lx8Aa3dx8Gi9AK07RDkDap016dMxCXSVFWErTtAAdz4ztrxvFMXLtTuLPXfC
	N1Y2xA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtgd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:57:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95192ee0b2bso426389241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778835432; x=1779440232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCfMxiflEQa0XgpzXYV1FIJskJxw98fMvTJvf9TrZpk=;
        b=dQb2gON6FdrGSBp5wXrYgo+etvDAkL69W0o7GhwtqPg52C2SUdyzkT5FvZCT65OasN
         u2HrHQYevhZzq27saq+F+kgKxL6dmqKghJq3uR2ew0IW+xZS8/vjOsdL/n8HuiDc0zl+
         gafovvjIywDbopD4NXUWWAWBl/O1D1nRocq4fp6reao80EF0jBOHIfuRmaPIZjR11IJU
         vUBmx9D8LIDIKxbW33o5BeRANBuil8huZINpfHAQnIle7JiWJxWsTK8MW4/vavtGZ8Ii
         IctA2gtYXX2wdzmtQjIT6HLlwFC0PwZuzqFfYtV3gLkvwhSB/XcmCgcxntzt8vB8Aqbg
         mBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835432; x=1779440232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCfMxiflEQa0XgpzXYV1FIJskJxw98fMvTJvf9TrZpk=;
        b=O8wn7eTYhpYPGg4BtrA0Ax1ZMLoPpBzNMdvxg2Kx1jyvCIj/FtYB9xDM6ArXshNwZs
         i8j5E082h2wUynZNBGgRSG+aALRNwLfW9qrxd3zcwNJwokXXvpkhucs5ss/WbrGWoxG6
         sHxSsEi2FHZt9CgKE/8y0XPg1axEtKNcYHonX6JhjBxafN+r7CvceZ2MXLB+moe7LdoY
         mdWvqCC6e/zHq/vFNfGXD7/ma84W9O8V+eRwBOWwCtdV5ObbsSxRZW2A2wEgsE5Z6gyZ
         TMYScWec+cfpDnOmvlNqbuD8bW+5q/dwMUCdVt4mEM5EJcw/3y1Sy6nvSMVk0czaQl/K
         IXQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GJqxOvxSr8GkcFhjuMcs1HkM0dFa/NrUMnELwwVlAnSPjzsaNSxOwZXHOV1uVEh9sRRzZUXMhUlBXxtZI@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwMF4cn5rUpvTdQzeCns+Fh3u5/Soq5m6mI3y9XrpHsnGrDjB
	nK9+v6ZrGFiCyGNrdDP4i0MmIqwuXWFcKbz+eZRCtuC0BiyR8X5bPBC70MylM0rfiTXU3sFouH1
	JjthE0UE6QtV9CESQz0MZgxZCBlpD9iyU5vE3z9IXXVTxwdbjcRkrTHEnDks3mZLMrhSc
X-Gm-Gg: Acq92OGdcL+PySBK4BRbNRiZnjMB3xS0dmJKUv2iz5XSnJvr7YXQ9DwXjB4OnlSfzFI
	Fn1Qn6WSr9fpZdzT0q1hv4vLo31QhLAFDy1S71cBQThQIG+6dj9Chw8NiNG5gnJP2oGo3grxwTB
	cOdPMUYCjtM7Ifgw0j/TrDPKbrs09X0igUo2Zx+HAtbD3GRnAqokrzgWo1IRFOA7hCOfy2Gkd3S
	yYl3VEuHgfQNHUuSO1pWH1rIoAcVt1snj59SmISNa572eaR4Jgqyyk2rkhITGrKTeLfmo3QNFbr
	Jtec/71yMwg3R7Zy9nf7Lj+tkoXBqx4BirTQV9jeObAMZ8mbjq1+hc5OASkfqmu1uEbFUt+imZX
	dGU5jGAHdcGxpwLEG2HlxVTFRxiEFyJLjqy+J2kSs8ubqyPk17vejKpiIzcU7Ui6pwCaqEaz61Y
	yS4TeJCqZM7Y8J+Q==
X-Received: by 2002:a05:6102:312a:b0:631:bcfa:39d2 with SMTP id ada2fe7eead31-63a3f898767mr353618137.6.1778835432446;
        Fri, 15 May 2026 01:57:12 -0700 (PDT)
X-Received: by 2002:a05:6102:312a:b0:631:bcfa:39d2 with SMTP id ada2fe7eead31-63a3f898767mr353615137.6.1778835431947;
        Fri, 15 May 2026 01:57:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c28c0asm199971666b.17.2026.05.15.01.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:57:11 -0700 (PDT)
Message-ID: <e0180bcb-e8d3-436f-95e4-2dad13ba18a6@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:57:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: eliza-mtp: Fix the debug UART index
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-0-05814d24f4cf@oss.qualcomm.com>
 <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-1-05814d24f4cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-eliza-dts-fix-debug-uart-and-more-support-v1-1-05814d24f4cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K-DLqzXbKqbiwBhWGtGRXQVm4__m75mt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MCBTYWx0ZWRfX2+oDYtByo4U0
 nX/ZS0r9P0YN/HH0RVYgspzum7pv/Fqj9s+gEUTBxC+8PRtSlHLzQmh4j6RBrBUxp65eNuajLZB
 qjjd82kfBUGl4R3+mXxJpsNE6N0FGQpDJllNY2BgTgug8FdW/ZrSoJy9Czi4YxtJO5TZkAW0GVb
 hZs883zP64UdgiOgDHT+I5TbNm0p+EDAFqIdg07qPLafPUj+wNnWZQnv1mFJZLU0wKvALz+BLy4
 NkOGX6GcD7WMYGtzWjUquEN1IgjvsdzW8iUfuzw1i8wltzxTVXzu1IK53hbmmDXOTLd0fYnINQl
 7sLGSvQ+w33ROj1xpf7mADYxro8Q+3swoxdsYC/A1QNpITIoxrZQY/DbROHLBcXDzAYepOo+dsV
 GUktGUzEV5cRlKRmDsyHTLPflEgo2edUotqBLVXSg61r7zvl5Zc2GM/JlrO/q+isWY69f8GXzLV
 bhu9UVOwxF8g78J1EDA==
X-Proofpoint-ORIG-GUID: K-DLqzXbKqbiwBhWGtGRXQVm4__m75mt
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06dfe9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=29xFfix4AnVnQwLTjrEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150090
X-Rspamd-Queue-Id: B818854C9C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107743-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 2:33 PM, Abel Vesa wrote:
> The Eliza MTP debug UART is QUPv3 WRAP2 SE5. The existing DTS labels it
> as uart14, but the serial-engine index for this block is actually 13.
> 
> Rename the SoC UART label and pinctrl state to uart13 and update the MTP
> alias and node reference accordingly.
> 
> Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Fixes: 2a5d4fc6f3f7 ("arm64: dts: qcom: eliza: Enable Eliza MTP board support")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

