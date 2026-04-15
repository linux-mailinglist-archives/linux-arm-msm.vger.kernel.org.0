Return-Path: <linux-arm-msm+bounces-103291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEArLDl732nFTgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:49:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2D40402C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F30D23012324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5653537BE8F;
	Wed, 15 Apr 2026 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExWWm9lP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kj2Hcx2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1694434214F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776253749; cv=none; b=K5t8hSGFLHOKhCu/xsYrXh2VkxkZvYqymzqAcUIYiOjAqlfbu17H45aQ2T6q6j4/GChmRKQFb+ZHE93Fync9t78gSsHG8TmdLgQ3anQoiUZmIORn9o0FpcEWADuJXXWeleFFHnT1ZvI/5wlTDiAaF1L7a7T05cvHjMTDDHt51Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776253749; c=relaxed/simple;
	bh=BeVIX3+yXifAg92JEMF8fUzLL4UnEBRx9jVpPwh7GHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ar+hfJR9s3pCY34QEYhA9R8VHuloC7Jd/b5YUz4rJIZ4kG5aMRJGROFFv5wC49+OnqI7jlXrMBOf8Z2vPNulCi7I7ckBknUxLpMT+2Fq6BoyRrVzwb27mOC0IU3WWw/eG/NnNGnzAKcGCX1KKmguc0H8HUEVcf+x0zgwG200yNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExWWm9lP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kj2Hcx2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FAlqia3126736
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRcoJaQFefkka3dgm84pE6p9Dhtaa4IjHa4M9jG6T0w=; b=ExWWm9lPlPQ/JcuW
	93DIZScSvgW45NLibsE/zelVjAxyPDiSWQzUqzK2pxSGN21tElvrsGfklWWw2l/d
	aePGDoLVsXRoEze9WqnaL6Npb2S4lOeGifV/B8igR70NISQrbepafgo5zozGhhtn
	ApWBSLh2Ka9Fj10sKEG6ZYPDK26iu+j1iV+jmqH9Zj76HeVQq6KI0nPdVrPepDfk
	0VoihgM+4h5JplA+Z580TeFYKjcRIPnyaIVoCkSxJ6C5PLrmWu4TakaqS2dILdpj
	KJo8n2g1ubuBOCXM60Z3QrFepB+JeQa9zHsPVoLQaeIX7J/oxhFJumGogDrVPemk
	NXHfXQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56u3ra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:49:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acb3741d12so8839056d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776253746; x=1776858546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRcoJaQFefkka3dgm84pE6p9Dhtaa4IjHa4M9jG6T0w=;
        b=Kj2Hcx2xpfCDHufeoZF8DD1utZxIsTPC4fUNZ9mtML1RP8p7henXAtRUdQ4Tikwghu
         U2rGIEv3cs1qVXYy8fYdE4taSXabS3dV65wIEVIjOLMjcw1dFjCkSLsRTC1Eh9BMR7sY
         hOBVS5aXuuVOeGt/myOypw6k99Y/RLfYWsPDAtBK84rK75gj4E6+UX1podYlyMjxJhWW
         m+0xezZRowFCR5E4abNMhyLoIb9iGk0j6HvaSWy03Ulgvr2TTMZpRXdoIVH9nTPdIYa7
         b6ylb3Vg5BgivP2g3iPnIqC0Wh/XsiwwGqXVNi09AC0IfWrqCN004R9vvWX4K7RJtqUu
         BOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776253746; x=1776858546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRcoJaQFefkka3dgm84pE6p9Dhtaa4IjHa4M9jG6T0w=;
        b=B7lqlc/WOs1pDN528XAN5nXHHcBwxcGpvVoN4fYmi+Y8anoVEnjRROH6CJWzHbS3zZ
         26GV90Xr0bK3CalbxWKxZJBUmZFIj6KyvvNSMKJPrpJT3kyPsGQbtq+1hhb8Qk+ZJsge
         huGn6HOT1eYiT3c/aMfMMAdxBwjzW9vZdSZNqhX2oOBYetwzr3NjsY1ZYnmEUc9BdW94
         fkwgVHQUKkyZ8vWGyHrIUZ0PZwixQIJKCMgc29kWzv6FNLVd6K0i3SBgl+M7EsImYdEc
         HmaerCd7PqjkD4v49BkuMDZUkZi3DUCTYYLvboPtJ/MyoxUPsAmjIPjWnu8atfT8cA+r
         v2Kw==
X-Gm-Message-State: AOJu0Yzn4YZqSCnHM/nT2Ipttox77P8VSvCZ03ZGfUONUWRF+vM2c1nJ
	CZCxpVjt7IVatLAGBk4ohjSv80capbsr+H2TEbmZcdpjF+9T4sBEqD/02QLtj0kTS0II4J1d+9t
	sf/0U3MVFsmYhreXle445K0uifOE6z5faUIiE7mi5lNi6znBykV1IFAVmx6Ynn+tIv1/N
X-Gm-Gg: AeBDieuK4iogJU8JwILPnxOawy6sne7egf67ALG64txguQBDSHmg+ouxLLuVXbAEYSw
	zQr4Ymkz2wZOU1JCKCI2WqM+jCz4hWVRJEv7o0kyezy2z0YwUtScJ4+2jCoMxC4hiYTG5FLonI3
	GYIJP5wGwXmmcYmxJa92kiN36iJ/1pwSH8Y6bhje9jYmh+2LYx6R5U6mfAbkANWTIOu6yWesY7/
	/6QspitPXqluw7Z01i4MdTDbAayPbR2WOw40AzkzLkbiGLrKxN6e3dAy3IkBc2GY7IqemE0gd+5
	IWWg6v7mnM1KpwyE7QZOjx44XIkn2heKvL0VYITw5wkCPPyOLXBItXpCaxIK2fjw1mZqL4In3y4
	seCp9PGg9mWgvJxMMAUXYlqfaSKVAdMVDX2imgbj0KqqRf0/dZMMO4PHX6cJewmEAItOgdQcolq
	UkJiyxvNrql2mPNA==
X-Received: by 2002:a05:6214:d6d:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae6a8ff4dfmr26026926d6.3.1776253746439;
        Wed, 15 Apr 2026 04:49:06 -0700 (PDT)
X-Received: by 2002:a05:6214:d6d:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8ae6a8ff4dfmr26026566d6.3.1776253745984;
        Wed, 15 Apr 2026 04:49:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba170629d7bsm50353666b.0.2026.04.15.04.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 04:49:04 -0700 (PDT)
Message-ID: <de0b1b6d-caed-430d-b152-0342ae4388c6@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 13:49:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: Introduce IPQ9650 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69df7b33 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=okxuOKQQA2PoeQeDH9cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwOSBTYWx0ZWRfX7QDGlU/YPCc+
 axOIYBWNVPaazv7Amak4EkjCCdRJk1tu8HYOZd4bPRFFGlRyo6EyalFWj/lRQvrOkS0EVX2Chdm
 duvcwUJVOEtosO54W8dJlVp7zkjr0r7DEY9OP9+OPG7kiyVqLMVZddKneUiUyeWzm9aoeHhU0UT
 uA/HpPGzZaTcXBH0Y44V+WIkfq1iSCQZ0yFQtvdH3ZXTOdSPnfSVemNvz+JMeOCWVcyBbIQPLVa
 O2EKA6KSNXbyt9kMaezMdlDmCe7seczL5daUSkhMl5je9gDF4XtE39aPVzzgKQoO5lcmoSwqmyR
 aIL5bdol3yZrsljpCoM05zxuQl6ivU4vyIoSFnmgMPPiEHX0CzEd+gKUeCwRhG+3GLRaql7Q71K
 dtQB0B/AWKSDvh9DlaHMonpA6Vf6cmZSL4My0DNpvYMache+BpJpyo5dfFwMgDtpLV/TputTjdm
 kHOaHbXx75/lLoP0Eww==
X-Proofpoint-ORIG-GUID: 5EaTz7wTtBGtTWyj7KUr2KXCMct-nSkO
X-Proofpoint-GUID: 5EaTz7wTtBGtTWyj7KUr2KXCMct-nSkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150109
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103291-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CB2D40402C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 1:29 PM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

