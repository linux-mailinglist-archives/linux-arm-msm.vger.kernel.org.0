Return-Path: <linux-arm-msm+bounces-103155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA3zFAxd3mn7CQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:28:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113E3FBD1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 734A33023042
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 15:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A202A3E9291;
	Tue, 14 Apr 2026 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcMztV4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxpOAEbM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECB03DC4C7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179263; cv=none; b=RkKGKf2AtLIhXgvMDr2LLAEY2NEj8vTYSVlCb9jLdiTRRviiD9hIP50sK10Ho2DU8njrtIFdnSCe4C4wtckvmR2JGe5pI5vKBUotvXEAfFHcfyaWM1Gtz2Y6VNoE1Vion3hQLnr6Owb256zWeRZNp2cnprX7+/j7krek9uWc1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179263; c=relaxed/simple;
	bh=1Skg35o4gzaEBl/SA0WgGy1u3loyQSqtV+weaqFKwIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awLAx1y7OLHpwaEWQKU9gm/uN3sJBLxdpO7WTMVCC3RGAr91O4p2Y5KFv1eQds2AiCGQx2+qPcCzeeN1/+yERPZsqH3JRl5VT4BVPBsWOs8XJlUbpp18Uatd4wyq/NzxllVFtOnuct1UJppn9pYF2vGSIHQj2CVH/Qn2KiK1ojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcMztV4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxpOAEbM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EC6OuQ3157450
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwHJdsDcQ45697KmlXXjyx2PvzjyhECBzef7owi2Buk=; b=HcMztV4Iinl2W6o2
	G0j0GaG2Bv1W+A/SwN1P81x5ftK5ya2IfVoYBrTc/TTiw3UzDYZkrVFi40NNUXVx
	O2CNvOkd2IVtIgWlUmyUQ4xzzhgz0X89p8ev5ReEQDla+kBJ0ACr0OGE40jRtl6E
	7N5Qa1UU0zEqL5cygWzVAOVTQvjUaVxH8Bb8Qx2qyD5iDQAG4hbnahC6cYwJSV/Z
	PASK/w86s9Lbha2/1Iv+PGx8FnmEZiZUh+L3nxpAzeR10Fimml/N8UeBgwYIvmwE
	SX53WEgGsqRMnYYDVf1EYJ+iEu1687qEFmnZqokXNJP/RfP7rvnsF+zgacq+frPy
	y+MYQw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bb7sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:07:40 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4726bca0bcdso987069b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776179260; x=1776784060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwHJdsDcQ45697KmlXXjyx2PvzjyhECBzef7owi2Buk=;
        b=CxpOAEbM+Rwq0dsX4t7+bUm+8DperOn6VKGhpOgNV5M/IpbJaUYVt3kRzpHn9AKLDL
         6DK78qpRmOM8BHXi7biafPpaspwMEfz6E4XELjpavG2USpVWCg4HyDJMN7tzEUZTuE2J
         nDOf2Vz5n8+RA6/5y7TWG/AY42egoF0/ZCroDup/ZMuMlMXUSj95R5cf1d7WckCWXAIY
         bwTOrVHtt4x/nYtb+MtYheV8kel1kCh4+IVCwPsqvFXlyurw5MjDCzIGJx8gshZllbBZ
         vJzqVVQ6ZAPnZpBtti2NKetLUdstjot25xY6FTidXo2OGgFFS2+MbXpxx/+sU917rcqb
         Ec6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179260; x=1776784060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwHJdsDcQ45697KmlXXjyx2PvzjyhECBzef7owi2Buk=;
        b=ZU9CnXs4mJzbHwe6NCuYWCxatYc5RRZncNCnwNVN/1amvi+T55UbFypNAYLKLdGLlx
         4oIE+BkWeD8c/3S981JixXKTGgcxWZjdEkFy+3Rny2Y+lIrGbDCxDTQjGykMdgZemygp
         j+ISw33GynZhtwe64quqjNICESBwyzkJRzSfYVIFtbyfK+Hv6bFF72ULdK9TIIlNIpmc
         j/8+EdBb7IjoYKWBywmXrfqnU7y2jtxSKsVfJpTvH/Fheqw8e8d81qUiDNiuGKBjDmkW
         b3k7q9xZb7SFrxgYHdvxd0ZVbvy3vqjhpZ5y8I6OUIwiE11p7lrW/EH43FtL0S2LBPuZ
         05bw==
X-Forwarded-Encrypted: i=1; AFNElJ8kPU6kzCi7OoEZyctVBBR7c617fqPlbBkUqoQsz9fpeoSWPwtKsrVmZYN+8viC8x5d7vfizN21pf4Tj4b2@vger.kernel.org
X-Gm-Message-State: AOJu0YzUtt/o03yx7YI5PD2R31Q0jrXtB7VwMpJ6C+R+qFT98iulb35R
	SEKQsBhYb9PcZpJ+vPtv1Khj530GSUs4tgCPQyUQPLOZdIIsg96G4hwc6T8JybuIGDYpAouUvQa
	enUTabH/ljPqvr9x+ZdR6gKfY6ilMTLcK0hupT45/SKjc4aUl4NAyj3SJGsTRXxeRC1EhoO3thM
	cK
X-Gm-Gg: AeBDiesR7njIuSl7mnLTjbIX+MsbObpnlGtY+X7a9sJ+6Rl94QwaktayLRGnjGlqgGW
	W4UwNRdbyhi/p1QrUdC8tbL2WKv9uyQGNVp6XD/eGrvsWzsLq5FZu6FWBXrwzpsbrvCdUZisxEt
	vU+zawDT3nhS5TMQhCaC/fxCSADV/8hZJZ1FnivxQgV9Xe1V46t+2gmhVpSwCAKDwsiMaPaXqEi
	aJGtw4MGnWKIiKjDyYfIgjq8WxelYEnqEkxzzFPTA5perpWCUKO8RKg1hhcln2auBiZgV/TfF94
	mqWp19MLvxv+Vs+nUb26qpFjnPM9oFbAeDfI6ZdxIIr89FgqYINR1/0/P651eslYqArd8JdHzck
	NTB0fpZ6D6j0nxOPhBuvIiTNRIc3EOtgBFL1joMwhwvluXf3U15caLSd3qzl8pte2LnyRzQkvr7
	l5eSqFzF+Lhy1s8g==
X-Received: by 2002:a05:6808:1456:b0:467:df85:e243 with SMTP id 5614622812f47-4789f00c865mr5015500b6e.5.1776179259975;
        Tue, 14 Apr 2026 08:07:39 -0700 (PDT)
X-Received: by 2002:a05:6808:1456:b0:467:df85:e243 with SMTP id 5614622812f47-4789f00c865mr5015490b6e.5.1776179259429;
        Tue, 14 Apr 2026 08:07:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f189esm399575766b.58.2026.04.14.08.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 08:07:38 -0700 (PDT)
Message-ID: <1bf5b11c-620e-4d81-af33-a987136b0f21@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 17:07:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
To: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0MiBTYWx0ZWRfXyJCrgK6rI/9l
 WyHURDIpVdP989k7wJNplWxmWjrCzlw4RK1KQkFY8MZHl7TyubViRNvRrYA7jBmbHNht+VuVOBU
 3aG471HdBlAvz5SYkDiRnkJJPoTTnp5IL2b+hluKzXA4rvf8BBxayti3NtbvaDvzXa/w7Et47sj
 IOdvJDM+2Ki25ddHINXIwqlWqMV8oL4ccfgjmjGlQ2i3T1cjahNXqlDuKC8YGSNdMCSZ828kMMx
 dNuEN/wIyEjm/UatCidBjh2ZxgQ4AinQ5sBgjk6ioOoSHxknlrpEUagyiYHaX0u1slI63U/620V
 zbi+zyW80vKRj8kWhvn3IvvcDcTPUn03KEAWR89MRwfqwNRs5UaeMERWOg+o65bwqMvO4EbdyoQ
 WtdGOjLaqu4a1ptmszEnDo6x996Jt600Wl/NTF6EPQbi1NfdoPFeUVpBxi7PGks/mUMaEKC8NkZ
 QJoPtBbXhOjFg1r5y2g==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de583c cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NDwzWBFMEALbooAduq4A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: eu5R-Rf3bLIeHUCQUyqJB3OrVF0uWbXA
X-Proofpoint-GUID: eu5R-Rf3bLIeHUCQUyqJB3OrVF0uWbXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103155-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1113E3FBD1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 12:52 PM, Anup Kulkarni wrote:
> Few CAN controllers, part of RTSS sub-system on LeMans, route
> their RX signal through a I2C GPIO expander at address 0x3b.
> RTSS subsystem is an MCU like sub-system on LeMans with independent
> booting capability through OSPI interface and supports peripherals like
> RGMII, CAN-FD, UART, I2C, SPI etc.
> 
> Describe this hardware wiring by configuring the expander GPIO 4 pin as
> hog with output-high, asserting the selected line during boot.
> 
> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

