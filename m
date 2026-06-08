Return-Path: <linux-arm-msm+bounces-111777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aqYdHyiMJmo6YgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:32:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C294E6549FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:32:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XB0lkR6W;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="VSyoD+/+";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111777-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111777-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C151E3045477
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5972A3B52F0;
	Mon,  8 Jun 2026 09:25:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BC3AD51C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:25:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910758; cv=none; b=VQ1PStXzcTQZJ2SjdHGFa1irXdA0jDapLxsvAfSVkvGGyU4t2x051L0KBvI/pWNqbqaZ5Lobj9sA/aWXSjo2zAjtGuHO2VeZyCI7VigsKnYJqq0jaT/cTDnA04SOe2k3yrPG6IqoJynmo6JyKoUfqVvPmMbuU4LyUdLvS4FdS8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910758; c=relaxed/simple;
	bh=n+HxEF8s23krUqBRK2DhOq+YTzm8ThGv/OBjsqP9PQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUKWLgG+YfQ5YhjIFUxo5rWfcTVBK44kNLaZP+DiyfaRiX/JPY7TMAUrosIcDybuMVddxQYt0OZBuxl6xl0RarCvmxeHdr7WxAvJn8FcCpbu3jh6LvsRONcoFNJYsq2Ma91hNZkZpZpHKfIsmIDhzPlv7Mwn4kDcEAfAIBL4gWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XB0lkR6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSyoD+/+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OrTP2274544
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgjJxa5tRylVDlpuu/EUPaaInG5XWGvclHINkZ9vI6M=; b=XB0lkR6Wis5juPTp
	ebZUfdPr0JCbFo8sapXxtVOHdJi7r23PrVoBPenSsSlpbsW0FYdXUjsKrusi2Lmh
	fMJMjtqJkqWYqLALG+udLcjRHmnyPBkqB/KSh8A5FsuUPU8aMpy1NX5aO9aKAbEd
	IwNpKdN5tE3I1QCEG6qSoeBrGHUbJgRAKnQxLIbHpIhfGH5ElqY49jogJf3u2QFN
	wLV+JXztl2xbdbJAK61+Aq9b+Fho6enQx1e0hle6oLPixWpItnsQjD4zmnxClcKt
	hFfH+UdYrWpEQeNLtIkj4x05j814aemhBHj+HFk+PQKsb0hVWx08Fnon2szDi4hL
	LgvMbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgxsb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:25:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915827fb1a3so86518785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910755; x=1781515555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CgjJxa5tRylVDlpuu/EUPaaInG5XWGvclHINkZ9vI6M=;
        b=VSyoD+/+SC42Gtq8xDmzCet7KXcW8sqSVgmN7XB9MHgQbFmBiIdhRPaCLef+6YJifM
         T6uEum1ocmCC33PE83aY1uNdVd4WBxbL5tIfvK9lOYvpz9Hn2rVGfoVUhqfoXZSMpAca
         l6YTxQ6bVT2yRamTOCIpa5e7fkcKzeluVX3KRJsk42tAhX7802SYSMkO+s+iWSchLWd2
         WABffPXDA+O/7UzI0e1FWPE0qkLqI6UvWu71isP8gwSHw2sxT+7rUV3FFiq6AvCUfUnP
         oxfaMR14w2ty4l1mDd0ySXRqgRJrPT6c6AKaSub2+DhTnh/Qy6kyHEJPNvYaOum9u63/
         7SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910755; x=1781515555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgjJxa5tRylVDlpuu/EUPaaInG5XWGvclHINkZ9vI6M=;
        b=U9U6h2EU8Pak/Cj0f+JnKPIM4fPuzrnIxCLvpXJdGm+dBcAbXblFVlyXP5uVfskJe6
         49jgqeDSmx1H0mcpIPV/H3030hotIaQiRlQsV/MN9cFVeNR4CGfRD0xm6kX7IC85pQ/T
         t63yMUXMTI0tk0J//ibvdvtinkDWwwQKVlLYhio7YdAVov8mAS2FUXKVQ5qM9XZZoKnw
         bqFx/bKJe8MPNKsurNCHbmZ9AXtDzJbHBKTI8q3D0RGucqnSdLGzKvVMilGLuA6HEPf/
         Zeat4BKW+6zL+Te55vMxRKgeYOoeRCcXHRDB6+cPAS61Q/eXwM0IZl5SvXNtHdId5ufV
         0Tzg==
X-Gm-Message-State: AOJu0Yxz5IEmRvnTSssiEf6o+1PItCHyEBArBPV5sbY3OnOZXYi/Ym/v
	5oNycWVxYDcXPb/aU616qpfyjNDffwcGfGOKVRRjedsK4qih74uO5xUioDH4ggM6j0BexeMihUO
	qWrXkdP6UZAF5AYGGqxYS5UuwuHdpF0CCVkZMMtfU1BikhSD0ZGU5Cncl1A5mmfssaeT6
X-Gm-Gg: Acq92OGAEgCoyoOGXRkKegu9LE4pS78Qz5iNIJn1tKkF2N4vm6wHNnn9RVO3Bnd85vX
	qx3ZTdmPO02K5QSVX8qh0OAfEl5vWLx9l2kq6hi6XRJjdhLScqNRv3VkVlYD/ZJjjYxJ30mur2e
	N25hfiWHxI/k29jfau0rJMbs6D2mt8oXe+pjev2Hg4YQeu3n8Fpj6RUR0AHuVmoyhQ01R2CDc62
	s8MlbdyvHBXhnW03G3hWFZ2S9kEE5degCpgGuJ5BkgtQQmQgS1zWcmC9S+DsLjfUeMJTkzLBL6I
	zO5Hb4tLSRaYDC+BkEw8jn1i6nlzOo8akzyZ443t97Vd6R0qIZZ1wYC3JdVfbrZPDgz6Faq2Jz6
	cbBOl1v2deyVnHllb3EuXAluZMjhWcSr1SZkkDVPP+8HLS9rbk26I9hcC
X-Received: by 2002:ac8:59c8:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51795c56077mr125571131cf.6.1780910755468;
        Mon, 08 Jun 2026 02:25:55 -0700 (PDT)
X-Received: by 2002:ac8:59c8:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51795c56077mr125570981cf.6.1780910755043;
        Mon, 08 Jun 2026 02:25:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm833303366b.43.2026.06.08.02.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:25:54 -0700 (PDT)
Message-ID: <46cc26c4-601e-4273-8c57-02b9d07e6826@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:25:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: qcom: gpi: set DMA_PRIVATE capability
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Kees Cook <kees@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602070344.3707256-1-zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602070344.3707256-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a268aa4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CYxUhL7LI-M9hzDX5WgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yKhJfaHftlAq0QU36VaFPQrr6meA3s3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NyBTYWx0ZWRfX5m8902LIe79C
 0VIbxpeqeFNYPINskgQ2A+3BvlDKAdxtm6kNFyNBwclGCzIHBWg5U7Fa+IZDnDsWPnljOzGADNx
 gSv5ibbZDS7nyUAcawISb/XliACiqG1PYtfoHPfftkbr3ylo5qeo/NSE3aL4vz2orUX9XRPDjSi
 3Cp+O007b23G10Xoj42WRr4x+XhZr6Jf+kJElZxsvfI+rSLtZBNSvEsAADFTjhgqkzTmoPHTVQJ
 BDclRKkRw+iKnv+un+DX70nVTtRORJodHMnGjaqouaD40hfEyb1GfCrLHXMsbP1jfP3niV2qIEr
 qutL7TSws+u/uIFQd7ydMyfzHL8bfI2CXL6jZGkEAVLnXQQsEqu43bbJhY6fS2+YIkANb0vbkLt
 s53cqprZpvQi9T48aSQJyOAz/jWJY6T/yws0Sr7vAWxLswxZQ9b7B1f6bkZg5rDdjL1tu01iz47
 O36ZnBJbt/be8iB61mA==
X-Proofpoint-ORIG-GUID: yKhJfaHftlAq0QU36VaFPQrr6meA3s3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111777-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:kees@kernel.org,m:krzk@kernel.org,m:quic_jseerapu@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C294E6549FA

On 6/2/26 9:03 AM, Icenowy Zheng wrote:
> The GPI DMA controller is only responsible for QUP peripherals, and
> cannot work as a general-purpose DMA accelerator.
> 
> Set DMA_PRIVATE capability for it.
> 
> This fixes error messages about GPI being shown when an async-tx
> consumer is loaded.
> 
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

