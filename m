Return-Path: <linux-arm-msm+bounces-100762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOVmGohTymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:42:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02203359921
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65343301E99C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B823BE17A;
	Mon, 30 Mar 2026 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WobDhBgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPXERP02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5943BE622
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867249; cv=none; b=cQoht0qut5PpHdCuC0RAB2Wtv4rQ+kcopZqN0fHDxDEaAa1XxlQrytcaenENbqdh5Vxma8+x2SRyhgQrZvMliFk74+gbe4/xcFri9zlsa2wEVO41CnThaAdSrERG3VqszS/5EJ5sTXDBk8x3FFW35sQ6PrE4JpZpuXCZd6hQr5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867249; c=relaxed/simple;
	bh=BRcJGS/YsW2nABl/VhbDIQXg1hTmjAWp+etZ3eRJzGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qb86ChqoDbEGFI7wOsSoK/Lejvy8xJNi5RdwW/V4gWnxJmMLHgYxg2aME+uJMVZ+ShkLl7S7e14jDscAJ5Tafk+QRgTQfunntvvB218HEQVxZh94Vmw3EQhSWwxFwzTti82vv69F1RPJa9J+R/8nvIZUXZ6uqhStetXC9ksrj7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WobDhBgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPXERP02; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9iqe04008353
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sk/DIoeVKY0CC0dEsRtNd+7IweHQWp8ZoQvYoaVrBWE=; b=WobDhBgkfhqsbYrn
	RMJnZihJ91N75cHTPhfCxJcTXEAXzh309UfMLFRi6MCrmVKaQPC2q6sbVvs6N7/y
	16OAGEEr5Qs2MfDGSGM6iBdsR8NLTof7PiPQea+vTqOXrXVcgm1qEb7e/b+dLo0Z
	kaKoatMhg7slir8X5CrBpwZOcJiyFlqWb6BhqSscH9KdDTdOD+omDLAbrUngEz7Z
	s4jParQykN0k41yIKts+GRtD7KxnXD2+nFJ7beJN2V+KNyq1aD3VDvgDAE2OVtog
	+aRnlGz04bIdjHDm0P54jRrFG+FrmFR7AKQMnusB8tBNAQS6mo+nBVvP4CHaswe0
	vuF3Ew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm66nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:40:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so17481006d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867242; x=1775472042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sk/DIoeVKY0CC0dEsRtNd+7IweHQWp8ZoQvYoaVrBWE=;
        b=XPXERP02QtRANg5xT08S4n8z4GTU4kGcZfYMjbdAovrHEUG/Th0JFsPcpK9T2Y4Fi9
         ULjTW4fbJKHtFT2MvEnLv+rApOOWVP0L2b7q3h+tOR62Q5n5sWdy1evgZLrAxeoGZ9bw
         K/j92iNt9Qa4IvrYPqaP3QXZDMmghUy354jkoDmtZTHeZ52WMdZsdiJUib155DNgQh3/
         wju0Qk1j54zfjtiiVotzkcW2Pqg+O6inYfYYXta/25cWpCsAfjENX6NqEPmVk0cKqS7n
         XtlvcwIPDwpPwLmbw4qlkD6qTtquHBQj5MA4FeeBtIHYpwjtuuIYL1OhaeNSlpuzLxEP
         xZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867242; x=1775472042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sk/DIoeVKY0CC0dEsRtNd+7IweHQWp8ZoQvYoaVrBWE=;
        b=Qm0Ny1mD/PjgLaan3f1k/YsIj2b7pa0oQpY1tgF/uPeiLFZXsevnWaQHKh1csv6cZc
         g2z4HyOkziVVbMVbnuwlE0ifoAAMw20GNEdwliJKr09Q+gL9A6SOHYh7/9vdMFupdfGN
         x+Jm8bllyKTNZdzUFxreMm4mseo3vrgyw39Syumlt4bnPN6aEbpL5QscFp04TyHiFoeh
         DKL2FvWbI4rpIF4A57gWBtCsl8OuzG4GoCbUA7tZl+PyR9zWRazLYAxfZb/csd5oNWT3
         KZE4rm4ueljjCIahWLITOT3XfVmcCqyHqehkOOFLBr5mMP8WaTThsaAa8oWR5/2iPx7u
         OQ+A==
X-Gm-Message-State: AOJu0YytFnI9+DkSB1zRSeSYVrvj83lMUExVpPcAUTG1Kx/8xAbC/MWC
	rOLW6imjh5tw07F36oxQXfR5wIOAgfxQjMDnD3V1rIHtDctWmbAQ98VEPX9S57c6uPsLBhaa2rB
	Ia7m50KYA0SCKd/PQR96lbd/eQ27zAFJ9GXtNv+5tiT4U19XP/cu7k9PHRE9niHy22LKp
X-Gm-Gg: ATEYQzwrbLzZ5oclfYHb/Wgr0+TRB0BF2z5fd1dSz+ttk7RcnkkQS6U7x6UQayzJHgH
	EQ1brb5ItMnYNx1DfRdrTRvb+f9gYC2YSSAkShquR8nzaZbQ0hFy6JrNBP/kv75HBUjF7FEgywU
	T2EyS0Qk1YXuL6zc6dnfpcQ5WeyT/jYz1pdCT2to7g5t94YrEw5kONVo6Ms+4sUIYkHBY45jhrV
	DASg6ZzKVtluYM7W9MBUlbW2X91xxSeEpHskkY6VmqM2GIf7brnjlNaE3r1yD9PU3W8jrmUoqdh
	QhMd5aPBkPgJ4EggIJRWD3JYTrpKVUnTvO3Yg1cLilOMsMbkDB3aLyEFhN+kevE0pdeYR+ps+XN
	4PnHhEWcRP73SLG8NoQKlPkMb8XIO8NRHEaoDF0YJ8eOzbSQUg3Xb6YgrzHNW24slb+c3IvUAno
	wbW0M=
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr8466416d6.8.1774867241862;
        Mon, 30 Mar 2026 03:40:41 -0700 (PDT)
X-Received: by 2002:a05:6214:250b:b0:8a2:18b4:79cc with SMTP id 6a1803df08f44-8a218b48708mr8466176d6.8.1774867241441;
        Mon, 30 Mar 2026 03:40:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5dddsm277945566b.35.2026.03.30.03.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:40:40 -0700 (PDT)
Message-ID: <f9581412-6ad1-41b5-a484-930b06c54626@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:40:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: phy: qcom,snps-eusb2: Document the Eliza
 Synopsys eUSB2 PHY
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-bindings-phy-eusb2-v1-1-1f8a9ad6a033@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L0b0mhnmcPULLx3cYaCsqaSrHXR9r93L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NCBTYWx0ZWRfXxD5wI+7tQtW2
 XPQ+ZCFBuY+YR7B00yQDpIc0uKtWDFHXZzuJcKThQj/ndHTjAcivp647rD83W4Junn5XPm9I6OU
 JhGBNohg4nZ5/uXtdX3TyDZYaI2wME5Yq2WbcftLSj1SMe4qJiD8s0nZkf3i6S2cD/yvNcv4b1l
 /4hdn+e08LeHzQJZEmHZilcV9w/XxMP4fYobZ2nggXo+1UaF0WM/CfoZ3es/yqPVjmW00kzt5pu
 S6bQwoIo4inEIJ0ZZg844fVW3OmENoEQGLh4AoL1L+3g2yLy+MpBud80WA8FkCozhFTITYHheZp
 BGytQa8Sm5J9/y1P+ACz4hzNBTiHw6RL+rYjCDlMPJXltgNgXbRb3VdOzn7eB2I9mc9nBg2m1j/
 Vlaknuxwasnoiv8bf9wm7swBy7/QYKEeBN/2y2KgBRmQ5uubmBXgvgbph6zt9QVAjzJRJFhPQoB
 2QG9524u448B15aOqZA==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69ca532a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nuVsYHLnq4DG88yNg7kA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: L0b0mhnmcPULLx3cYaCsqaSrHXR9r93L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100762-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02203359921
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 3:14 PM, Abel Vesa wrote:
> The Synopsys eUSB2 PHY found on the Eliza SoC is fully compatible with the
> one found the SM8550.
> 
> So document it by adding the compatible to the list that has the SM8550
> one as fallback.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

