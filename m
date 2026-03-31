Return-Path: <linux-arm-msm+bounces-101011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO8PCD2Vy2nMJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:34:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05878367261
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 910A4302C989
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0CF3ED5D0;
	Tue, 31 Mar 2026 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqJ+blb3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftKnBqdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7D3E5596
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949444; cv=none; b=tq9SIXgfWWP8IiYCITgB04Vm6iI2Aj97DMRbdTIPqzi1ze896aqF49cJL7vh84cgg5n8Tgliqr9BdHDXGQSwa2KF+zoJtVTJLZQ/I4/bJnwL6alRgkwFtLzP37Yr903cNLjHl6D/ViyDXIx2u9NZWKj4xu1bgEVICKKvDJzFhaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949444; c=relaxed/simple;
	bh=8M9y2N30To5Lr2+deWpaIvEJet4IUlwh5IdXUd7GB+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMlocBEbW4CZvFzrmbXvJRr8HkurpDtuZeKKS7FYzW5B7nu/Wz1e9faE4PrWnMu/GxHLmAR1B0UqfbyKbGJCcPO9tWl2oOo1ysAHpDAek/oVpBiKVNDHZdH6rQ70KTFgcOuxP15wA+A6nSE5dKLyZ/bRRkVecSsnL2DxNnUVmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqJ+blb3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftKnBqdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jseF2049373
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l6hIJt4vRVNIKdR1Ny7pJjCMEd9wk7RkRYpFUUYnL2I=; b=cqJ+blb3ibXuyvwb
	bnVhFyNPDY32amR96u8G41Thf73MTJky0wZkq8LM0g+bRxpjoGd7RS9QPvrHl0/E
	xXl8Tn44KZxUedGitkXlZ9uO/E/0DeMbcKRmdkv8Sp+Aa/CCycqgKDkYRThxoFZE
	7CI70ZrXZjyux25UAaklKENh7/tEyS6AzQ1zt+VcFpxva+LODCQ+BeSlEA+D2G6m
	HVpEI/2dk8wRYBErmBlNv4X/CE/jklK43YFBfYuFdUYy2TdU3Mp76/fTKjpPXbj9
	LPZGus2sbRKmOnl82pVnqswI8c73N1ExPP6v/8tTX0zvIwWqu4kjZLSgHgMZO+Kl
	fx9g2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yr63e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:30:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfc4ba4de0so165967385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949441; x=1775554241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6hIJt4vRVNIKdR1Ny7pJjCMEd9wk7RkRYpFUUYnL2I=;
        b=ftKnBqdUvxnFo4nOMPoc9GOqhPJPCn7XMI+JYvy53bcwSt+n2xI8H0tY/U3h7KeH5i
         0Xv5guPMzVq3Rfr4l8aQ67G4ZDpHEH5rDCGO+/rXfXzWxw/KMA8nH+lFJP9OKg1puMif
         SDVgIH2Yl+jGE/dtCWm/a+stAO2IBRNCULn6pQxz0J633oujFoVbuerHVGyZr+lYoQ04
         xOpnBqZQQ4DxmOYSluRJNqHdsiqBwpyFuW4dnyy48MFb5tuVcMbZh+WEegpMpEi1RuPa
         ssptQF0bILflWtkN3GhcruPaHyWpSmhe7uh0wqQei2tT9dmxWde925g+nQ6pe1HSZFyH
         Pb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949441; x=1775554241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6hIJt4vRVNIKdR1Ny7pJjCMEd9wk7RkRYpFUUYnL2I=;
        b=YxgSbYDkNXTem7HswR+TTKPfBm7xvN6DhF9q9A1tAua8roxjHPCsOLpB/IPonbaccp
         OVGvltHUlD49R6JQ1eKWpLHRkWY7FzVOptvet1cSf4Yq1LjuLEYXs8BS4K7ZalboTSqf
         K1fN0EZNWF/30HODCDt/XUskLROo0rP8+aGankmOpdSDltct0S3Rc+DyO7it7yOyZQvL
         GIjI9P9IaxrElQbPX+f9LpH6ZbEEENJ1eyIY40DTWDJldaH7fdzLkk4WxiVFpTkqLodM
         4RQeLq6DQfhe27cF3ArzaD31vKRmL/7h2qU5DDKnKT/muuD6BbwvNEdhP6+RisLz8Ljm
         wtnA==
X-Gm-Message-State: AOJu0YxsufiPKjePRq94KUr/ID5mHxU1ukUUv1DeKxKrmELJfpjgLWPU
	j8Ohy+ij38A353sbImAtbFfN5/ts4dzb1JHS6f5S99YCJGlmfTVM1rEa4nRaQlpihae1fYEVJYf
	G1jDlWWEEfSsboAFscTmx/eIT2Me6t8I51WjIdP6mKglfqufZpmeXXn7MQ5mPC26eiK2u
X-Gm-Gg: ATEYQzzldKkHOagfQVthbxx37SkJ7C6vfEg8B/G8p2x26Ou4ijE7+gr19q1NChw5QK0
	ba5ISey4PaboOUq6Zzq7qTI3BRkdpMM5ek7yOB4wE5snSPTzB1ffnKv6+F4ynFXttdIkOm752g8
	wOusoPX38MUY4Dv7lSPSFUqr7O016qCtqOJr4D2ZjKSULj2vtDSg4UiEph8/u0pfQiRq8I/5G5m
	0neoDXQhzdSVEipnP+N8CyZZlhiidXu2CvEZ4HNFon8gtxwQGd4HZSrbzU7aG+EvzRXrQG09wrm
	ujEnBpeTDVeSe/3cCDrQD1ngRj7Pay0Vuo/JXcion3Vj7c3ej8P4/2AcST30zqYbG2CMa1HJ6Og
	Z6ePi6Xwu80hZM4SyTie+tku+j/DehR3Qv3nn9Vsq0HHm3hD5/4ODkSnWRv5XYoQtrHhui83OjZ
	8+9UM=
X-Received: by 2002:a05:620a:4491:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8d01c7e3733mr1459686185a.7.1774949441181;
        Tue, 31 Mar 2026 02:30:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4491:b0:8cf:db7b:6229 with SMTP id af79cd13be357-8d01c7e3733mr1459682985a.7.1774949440675;
        Tue, 31 Mar 2026 02:30:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72963f48sm3445325a12.7.2026.03.31.02.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:30:39 -0700 (PDT)
Message-ID: <0055915e-4ac0-442a-adff-a2c854cce474@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 11:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-4-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9YmExi295WhJRY6MOVpIQ69mwbXnR7qB
X-Proofpoint-ORIG-GUID: 9YmExi295WhJRY6MOVpIQ69mwbXnR7qB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5MSBTYWx0ZWRfXzFE38Cgp1rhi
 avbwvY3ORUA2ekOw1EZpK4omstG3SDLwPwGlN9mv3/kotyI8R3O366AUVQUJt/SxLalLzSN9PGW
 vnfbAJRSLPrKWsfvTEIJeAfUuzMrn2B5arby01uMkPlIU4JAEYRr7ohbjYAHxH70jG9u1gnKbST
 53Lr/cWADg4B1RNjZUlOTjkIWKEchAbJz3nI2lic45yK1hi7NlcrfSMLEDd6dzbJWmiJh2JaiMn
 59kSu09UHC9s/rYvJw3jvgHp9W25f9XswVp6zuUoC9+yMhx8Zpcf8PEGLxMY6Tc12MwuVIenAFl
 36Tmx81eP2Hr+1cHguTqhBrRDKK4Vsz40eRSsVUT/wcYSH1B7Bv4KLfWKxuh9reoi6/kPGmaAEC
 iP6X+A72aqsFHBSvZkijA/T518Od647tP1ovRO6KbPjcO+Py3Dl65bjldQCDZ5umnuD3S155sA+
 BnyXI0IxbYfeSdYyniw==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cb9441 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VI5jTiJbDvfuYzbrj9AA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101011-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05878367261
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 2:34 AM, Vivek Aknurwar wrote:
> Add RPMH clocks present in Hawi the SoC.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

