Return-Path: <linux-arm-msm+bounces-110800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANu0EJqtHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 12:16:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D379B62C641
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 12:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B30F30374A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 10:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F336E3D3CFB;
	Tue,  2 Jun 2026 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuZsXfmF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAzd905N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C833C8738
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394824; cv=none; b=FkZSrfmHCfb0302bJl1TZoFzlw1V9nfsxkaC7njgygbzxBKOh16+8MY6KE3p90bNBB2mmgce8VFe6ymWwkUHereZ48U0JwAHOzahU9yqW/d5Y+tM4D/U++ZaHyslNGMtfKv/TgqzzobwwJLAH1OrugZzWelWp6UNmNRGiy6UzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394824; c=relaxed/simple;
	bh=oFckOThZXrtFOIRAKyJfKzFPakfUuQ6fb+vCXkUj+Oc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=u24Tr4tXquyqkOERTnprtN6EHxRPkinfb+MB5EFbfU4ns7MgHs7wlSc+TJLQPIeiyrTO+GKIWWQ7lznlVsI2hxsrXdRNJWTPB7h0QgOV+3dhCWfp/HjvomZT7MSGRHRMLmex8qmfJT6L6J8DqlTMocwnovEM6o+tEuUNs/X12bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuZsXfmF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAzd905N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tZ484012485
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 10:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPVhhMpdgL5m6wyGE3iVUISjPwJWp/frQbyzQW9ovVU=; b=OuZsXfmF6yTSQZkQ
	rbl+81esGrMu29bk4kJnZURUQmWbcaoMbupuKZ45WHKKIRBXF24iGXQgoEeqX0bY
	A73luikRRxxv5CGqsT2pO6sUHC+dJGBLRunhGeQspL0SB5VgqARW7qd4NBQk6AJE
	Ezk2305fodIxEcyBXcP2GY5n+4A+9nTsGpRWpe91UZNWtCT7e9OawYvK/AzCQQ+/
	UaCQqtWK4ELJ/dIZuIsH3cat4d2cj7ZRjtDMM8WJo59xQgSyh1OpyIlK3mGpNhyr
	fKfK6XJHJld1usbZhFqa00sYRL6ZSNFNoqLGFxI2LmocOfN2F0ocCs8ol3jutMHB
	WfqF8w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4h1ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 10:07:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2c0b56fso2561219a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 03:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780394822; x=1780999622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IPVhhMpdgL5m6wyGE3iVUISjPwJWp/frQbyzQW9ovVU=;
        b=dAzd905Nd4dUYE/mmPEKWYvdslNVxUW8I4krm7WXAeZ57OO8nQjiGhDKb0WlkdRhZl
         KnqoGs9J8wlf3AdWOUvKMd8/IWtZ4zzhnrnn77iYubAc3le2bPk628fgNwuexX9icMOH
         KncwNcmVKCcrT83lmEzwKVcUmu9SHAi1lxpu/SbDAzR7SAl5aYCqOvzJB/doOX7sYOHA
         HioiurXVj+syMNG2mNnQYwauhrr/CbLNcSIppFXdxlKoGfsUOZi58am/jntSI2pJlNe+
         XVj36O42HoJysUbBNsgoeYsUO9OOFlseDROM1/lngzPvdmUuV1DbfwPqWZ6IEWX6Ikyk
         K/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394822; x=1780999622;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPVhhMpdgL5m6wyGE3iVUISjPwJWp/frQbyzQW9ovVU=;
        b=CnWW3EXkk1ny+FD5Q1qn6qjzMYkrY5S/8gPEAKySC3ftV1raNXgdziVigr2VClsbzz
         eHFfvJq3seTma8Nv8RuHLGk/0Iae3wX0fUhzgEF8GHLhfix/xTUAlSwMODgkRQYJwqYe
         Evbnxy0H6xvUFKfIYCOa3S7p8rM34V+fGdCHlwxneSyz1pOL4cefwh5QRrIAfpxpIPoB
         CN4IyjE+dWRLtcaOsSlLVWJZVijkcBNBz8udX2N2g2tjCuqV9DSPXZq1BpdoYlNyFGxh
         V8XUV3WvJLlKUjEnS3i89CsWks8l1W5TuPa2ailTLoDgfYiBhQLPB+tcBURgD8VN/16I
         0Raw==
X-Forwarded-Encrypted: i=1; AFNElJ+OkpRQHxVerufM8jdLIQnUtXccIKURCVzLLP68tfLXOX/M0j9kFnRRg0kHRwM25Go0B6o2cwDQVimBDttQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh7iIZaIKqDjf1Krm2HqtbJwNGVQcuIBFzsi8kUM4M+lkE9Tqa
	m2wlcsD3siKwwaW2BRahrRnpzTGMH+zeoXnAYcdVoPN9gnwIcnuzNcTEn5Bl26Iw1TmYFihVUtX
	b/k99gYy5UsXz82AqgWAniG7cOzm/QQDv2414+yDB6vLNLOvO5urhYpAlH7MV5xZwH6uB
X-Gm-Gg: Acq92OGY6rJHxKwM8jXlQaiY3QwOIPZ8VFNYvC99am0BXepKkIlgN8rAJkXmhju3mps
	BzaPdaKOB8ks76wWZzWhXLuOCrnTMWGdYCgET/tZsIVK5GdNtpqWi3+IP4OZm8/X5OiogfbMRn/
	7KCwWwcXrLiv43qxZawPFZRk85dkUsOJTLKHXe+qwB39XnWBQRLEnT43twVLRhqUJqHqJpayJxI
	fjvN5Zv2n/XeMa/enLKVmIh8jrr24HLTdNazEkQJ9LJ+juvoZx+LmFLVNqcCw9hiMus27mkPSAT
	n6Id3xrMsZhncJhsCBxrsD0xIURsPZCnVF8DMMMitMJgizmVzJfSBXBuSCr8APwQyDl05OanBYf
	LLAORYEAv2fad45SainXhXh98Kspzv2IA1/qLpIdIRFtpudbs4jPjgjO9cfhggfG7tMGvRP2TW7
	q4
X-Received: by 2002:a05:6a00:408f:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-842253aaacemr13949851b3a.21.1780394822469;
        Tue, 02 Jun 2026 03:07:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:408f:b0:82f:5034:77a4 with SMTP id d2e1a72fcca58-842253aaacemr13949825b3a.21.1780394822048;
        Tue, 02 Jun 2026 03:07:02 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84238f1ce65sm8784399b3a.5.2026.06.02.03.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 03:07:00 -0700 (PDT)
Message-ID: <d2565822-ab8a-4dea-bafb-addd698cc35a@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 15:36:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: drop the CLK_IGNORE_UNUSED flag
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260525-ipq5424_drop_clk_ignore_unused-v1-1-7ec63e347f2a@oss.qualcomm.com>
 <pa3xr7dqro6yxo2zsydnybu6fomx5su2x2ccawjndzd3yqubly@esevqd5q5jon>
 <005d1637-ec56-4f4e-be99-04386efc2524@oss.qualcomm.com>
 <sv6sja7rdwz6ke525e46zpfmtp4wht2vboxwwpyjnmiezibhhm@pbuvqlpkjpb7>
 <4358d0b5-48ae-49f2-a50c-115a54958505@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4358d0b5-48ae-49f2-a50c-115a54958505@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA5NiBTYWx0ZWRfX08UyybX74SmT
 NZQMpwWpxsyI7SGDa2s9uBviCM0FoxMDN2D2oMscNh90qeW2bAe+MIWBVKiMbPl+AesP7sjh3yM
 JBv1gZAXNF0Dudx8E/pnClyMVTZEbsq5iV2qAN0LS/WmzdLZZHmUA2n18hflu8xwFO/TFZQLKfN
 N1Ro36Zpn4tVNyeyD3og51E3a4LSZ5XPZI0ndZImRmJapWqy6kP317v2aHs5tP5ecqvt1SNIxsU
 dUzbOGAONrNaICDo0z5bFMG0zApwvOdeQTbeiGQZYJhjB109PU8Yigbhz4EW/LQzwDP2QiZryma
 lcfxGAXyNemqU/qE637fZ20SSXChAjiPXZ2e5DwijyhNdNhbXCyNyJ2Pyn43bG3kADtpKaZvh3Y
 ZWeRbgEgxyZZ2P7dUawSocQmC64Cda8qY99Z9vS2dvIyrNa2M0XgbE+6Wkf/i/88HWRwHeYPRpw
 sPiFpvGUuA/ej8wMm5g==
X-Proofpoint-GUID: kimmtDPiTc1POEQN4e0mNieL8v1kDCOS
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1eab47 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=iHNwXCkMZG67nHgW-KcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: kimmtDPiTc1POEQN4e0mNieL8v1kDCOS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020096
X-Rspamd-Queue-Id: D379B62C641
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-110800-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/25/2026 10:49 PM, Kathiravan Thirumoorthy wrote:
>
> On 5/25/2026 8:55 PM, Dmitry Baryshkov wrote:
>> On Mon, May 25, 2026 at 08:35:16PM +0530, Kathiravan Thirumoorthy wrote:
>>> On 5/25/2026 3:39 PM, Dmitry Baryshkov wrote:
>>>> On Mon, May 25, 2026 at 03:07:17PM +0530, Kathiravan Thirumoorthy 
>>>> wrote:
>>>>> Now that Linux has the consumer for the GPLL4, drop the
>>>> what is the consumer? When was it added?
>>> PCIe and USB are the major consumers, which got added with the below 
>>> commits
>>> and landed in v6.16 and v6.14 respectively.
>>>
>>> ab7f31a3830d ("arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller
>>> nodes")
>>>
>>> 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy 
>>> nodes")
>>>
>>> While I was revisiting the code found that this flag is not removed. 
>>> Hence I
>>> sent this.
>>>
>>> Shall I reword the commit message as below for the next spin?
>>>
>>> -- 
>>>
>>> Since PCIe and USB are enabled and consume GPLL4, there is no need to
>>> keep the CLK_IGNORE_UNUSED flag. Drop it.
>> Yes, it would be perfect. BTW: what happens if both are disabled (or not
>> probed at the boot time)?
>
> Until all the drivers probed, icc_sync_state() will not disable the 
> ICC clocks which will in turn keep GPLL4 in ON state. If we disable 
> the nodes, then system will go for the reboot without much information.

Dmitry, Do you have any further comments? Will that be okay if I can 
send the V2 with updated commit message?


