Return-Path: <linux-arm-msm+bounces-101494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLu2Oi4wzmnIlQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:00:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F10CB386661
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F994307E092
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88ED3A3E74;
	Thu,  2 Apr 2026 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHEtuPpY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWQWpcZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809372E1722
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120025; cv=none; b=tv5pje1+jv3aOSQ2+yiuc93Gorba5gx8QAOIjCxjYXkhF7W5ZoU14ActFx3apC5az4TMZsfOIlL5HHoTYUtaZLb8C6NeBTXeHVTsQQTrV6zyGv4/umH92BMHd0wMvYOd9qeToB1M51GUpvoaiztMkgttXHquuroXbmWH82ntfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120025; c=relaxed/simple;
	bh=/L/55QsQk5XVTOb0Mmu7Wa+Epr0aB+oMAJaJWmg20+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RPQdo5+hJSmf44dWzO+7l/+siG/8XeN/NnOtzLiZfPV1nzQAM4mXykUIf0JO7ocz0uLoiZi+FCS23PCMGxHf8AdxR+9YsvLDf2NCicUGafe5tRXk3xaDw21B6TzCnBfExi9ZBjPLuOtH8VtLIE/O5Sg2IWLcXK4FVaUWNWa1CRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHEtuPpY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWQWpcZj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325ViaP091717
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOfOsCa/8/cf56UDdjek7yVDNOhEZCTfTTjBxRk+G+Q=; b=kHEtuPpY1/HjnTnr
	D9KQQTMjCHsTBFjMSkV4NBJpLV9Ty6JqD9PlCLy+cHOsd17mJVFMO8ySvd3MFKnP
	B53Am1oW4pbX5zhddDno1YMPrCa8KZrdLWfqs7JnL6aNd/vzf+0Q7BcLJVKFpEXv
	BjzBg3GIbPHpyA+fq9E/ON3YHufzP5Kkt752sZqXYEoa4hIVWE0HRO18S585F9Lc
	HIE8Iopljmb3u6M8neZqIM0qvTLLBlI1ctCwoEhjbP+97iYESe7PnEKaHzAEN+eO
	nds+ZmgmG7JDgGRmXtI3ai2axyEX7t7Rf4Co0lNa1zAjvE11jUZRHqMG/7ooJekZ
	+99enA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu8tg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:53:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89e9d327913so2566786d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775120023; x=1775724823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOfOsCa/8/cf56UDdjek7yVDNOhEZCTfTTjBxRk+G+Q=;
        b=TWQWpcZj+DCLxu0vICQ/SrWDcYl1xf+6LNYnmX4cwUksJ40GEQkBpEetNv6Nxs5lNT
         RPFZEuk5Yle8iJDxYyZRP0xZPIbATl18wGnC1huhV+z9RZ/OyoL4eO5+iXlNVvNyxVhJ
         B/tYib8zd3FmbrLIIzPBrv7VY3NjXj5opeDz/EbQtUjSS722H7JkSIOoUJU/x36zDTVA
         nGKYeH47B8xiNW6ONagKusPaRCL+Ij4PzrN6flJlou2Hgyeq4Qr9aXoGrhHq1z3dWYeL
         72COdrVrmbsmai4RRdPs/QH8zVoAMsjb+uUm3p0o9fbvS+iaxiARSTXePDQo+sJ5ckKc
         RWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120023; x=1775724823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOfOsCa/8/cf56UDdjek7yVDNOhEZCTfTTjBxRk+G+Q=;
        b=CvMUS/nZn7JsolV9AdXinwcV/z1vvT8f3RvYDIV92AIyKKe4tI85qPJuWg4+1nMb9v
         0QzN1sWnBdOAYDbJDlGI0g4y9s+qFlDwsRiznwkHc8xwiMaH7BkaEoZdPME4yRojXwjl
         idhIXFBGZkWX+cHtmrdkQvQacIA/dnjTQ+Lt0fvOEba1GNuVG3fsJ8R7gzjcYEorHU9z
         U5pfH3uCcW8KKXmDCvpbAeiGnLftyKvNFBDE1M4JgUrcvdsTfnZc3NCmYA0Ng24E3fFz
         vkYTlbmmyIykKEPZ76rbhiHOVd8BUDH7hvpuF635DD8o7HQK8H25BcGlcv/MFQucAF65
         LH0w==
X-Gm-Message-State: AOJu0Yyy227OOKhaKvAm6b50NmiTu/+vwC6RJmiNBKfzZYHKYM+qeXED
	4T5aUUR8bss5dYa/sYbV037Q3Wsbsw9mlease2BVCoLBcIiX/Jf66SWG/eBLCXor4U4oT2fWa2m
	Fn8iOL5DgAmyjLRiltZOIGHNHLQzua9eTjUNnhSnYSeiz4NGJqqBCazxguXlwyIWPySpr
X-Gm-Gg: ATEYQzyZbU04HLwwE3NLKbusJYhu00XoK3YI8PFT192kCAbpxg3GA4v6um3WjKAY476
	xKhzEi4nq9eWKBfd9Egc1uIhyG7GXZhCh0DbqUzygBU3WuIDnVWHWGR+rnR8CliYYRi7+8dILfA
	Zbb16mMyDILAv8DVf4i8GtZLR/uuvUPZQGQz2SkJr4R49AjQY0nt23Gqf5Rw1OKVcB1T1Jrqgdw
	PjZkWlSbGjEvTUnr/2jkAAdO63zdImSLmYlquii4mLtb6XJyxDlSAEfQyA69QmYFDvJX5rN8mHc
	lH+Veax5k8gfUzH55ATsclYNNj1zvVqxrMsSF07j+c3UiWP+e6iB1x8uRrvInXyj/tELE6PExPs
	jLdLepSF/q4PKX7GgSB4PbWvHbxCA6WfcPTLk4LOdYIiKZ7L5JojfqckBM6dBW48hlZZw0OC21o
	GUxro=
X-Received: by 2002:ad4:594f:0:b0:8a0:6b11:68f0 with SMTP id 6a1803df08f44-8a436f14bccmr70244966d6.2.1775120022872;
        Thu, 02 Apr 2026 01:53:42 -0700 (PDT)
X-Received: by 2002:ad4:594f:0:b0:8a0:6b11:68f0 with SMTP id 6a1803df08f44-8a436f14bccmr70244846d6.2.1775120022499;
        Thu, 02 Apr 2026 01:53:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99f80esm68895366b.18.2026.04.02.01.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:53:41 -0700 (PDT)
Message-ID: <b4fe49f2-b820-4049-8533-c6cd8b2127ba@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:53:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] ARM: dts: qcom: msm8960: Flatten I2C pinctrl state
 subnodes
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-2-9674cfc0b5a2@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v3-2-9674cfc0b5a2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3OSBTYWx0ZWRfXwNtCDmKh2oLf
 +LT07qfp5kobKxWBh1ahZy7+d2sXaqImFAUPt+TDg5Xbr/dfevu27REM3VaHx5te/gw89Etcoin
 gYxdwIjLIsJcJRxU5a7Vk+v20WMQHDUNTwd6u3jll85pPrpb1phM9Xqv9qg36d3OfQQhyf1grNN
 sEbx8f91eTwWXHohZZQEgl6WfW1WxZQKoNr7AtGtVYo3Qj/22RK2aBkxACgwGfi/aH/RaMZHOS6
 ej10V1b4Uo2TKc1K8gJy408kkQp3alG0NF2J0zXhWNefki+ofIFdc/lDmnX9cja34viTl8xrLA4
 oUShIIBJnKQjOEuXX1EXg/rmFiL9C5wwlCG6V2iuN9NJie0k3eSV2dZUfuwJHZRhwSDVoOMfscS
 cjSaUB7OalOOckvyzqhjhn9LDd110XbRsEsKHroMUYwnUUnkGT82I8EaJbi9n8TV1/EdwV0q9Ba
 /8Hub7lpmupv8HuC5Nw==
X-Proofpoint-GUID: DFUEyPWWM5yS6Rwk-1ik73AiILoE-8OV
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce2e97 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=BR3Sq3niNDMq044gB-MA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: DFUEyPWWM5yS6Rwk-1ik73AiILoE-8OV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-101494-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F10CB386661
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 10:32 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Remove unnecessary inner i2c*-pins {} wrapper nodes from the I2C
> pinctrl state definitions. Properties are moved directly under the
> -state {} node, consistent with modern DT style.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad



