Return-Path: <linux-arm-msm+bounces-117913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YHPbKKteT2pqfQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:41:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FF272E67F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:41:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Y/kfQZxf";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=igsaq55I;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117913-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117913-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8955D3017508
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7243F1640;
	Thu,  9 Jul 2026 08:33:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1544E3E7BB1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:33:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586020; cv=none; b=cyVh221zgW2CcJ2d5epZVUONWOzzOFLyU0gri6eo6jsm0rR6EuGnomCRt2wR2Q0hikt0XWINUW5WzwxLrh2gBlzSBMiQqPIRcGzH2yTQ2lnBqJR7w6LvaceBq472EMmjvaa0+sAHcO+gnT+WtJpKM+lLhcgjCrl64cbCnpy/Nyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586020; c=relaxed/simple;
	bh=ePU5jrsIVrDcHmoQ1k9d4UmtDw4N0bDMh1X5hcTiDV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cllcawsMePnyxzh8YLhkF/fygcPYvkORjsk9cf62QWHmOVrCLWalm00NsGaw9+UINI2d/oXwMNnJPo2O4seCpXncy6P2OWykB8vQg3iKCscDaJSa0X0yOz1Jpyci2v2FNVGVZFPV9ZGcJ0Rq3R1hSTZVCZWXV+WojgyT/nNiUNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/kfQZxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=igsaq55I; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696kflq1020634
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNS6l6IyyVH86AVRFbznu6IwUQfciQynPWNDIYQzfBM=; b=Y/kfQZxf1K5VQSQR
	xPFjswwffLPEVXgqA8Rfx84vvWV39twPKcZEoodieQP1qhNvXPLuNY+Jot4IrBsC
	3xFZozwqzQ/H35+W3KPQ7FIt91xANzaWIeHXDT2qoCxOnyAzGyMlD8bHaVRv/5/D
	QwTXrSxHq/7DaSRIXwqRyrYti4CJgS/eUeJAaRyIZRILrLnsfpM7bemEQCYzXTHy
	DUOJet1uNUd4ty6k08UVhsOcjIlBsWIDRRaaLp1esTNVXdKkxlXke2j3I/r1M82U
	kBDyivYI5DLR48wbgCAXAJHQPq78kj9nnDKmc41lWBVqgJYZr2/dhU/Fzxkau6v7
	AuJWVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3rf3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:33:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e57e56ce9so29471285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783586016; x=1784190816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNS6l6IyyVH86AVRFbznu6IwUQfciQynPWNDIYQzfBM=;
        b=igsaq55IgQa4j17z//6CfAKL24u+IE8Hz8UAGJlNr4kRVuIbSFAoBjmpeLLYUJ8GnQ
         EFDfhsi72WaTd74HuyK2dcCKwPaZDhiAmgtR8hzKSsOHeqy0e9RBa3eddE5Axj95FhWV
         GlF9XqvDt9ZdEZm0RHwe679O3uKiKUs6lMjzwY+c7Q/8kzhMZHBDRNJYfUXRxZhQv2iR
         MwLbmJ54Z7vjn/RfZGNaSi8fPzpR+MU2awcBtNcCEpNCKmHxJHBJSVMqxzVDFVfseMC9
         bwpo+bdhzQIY2R/dy9JzeCIt+hzjUzyd/B1AalEDcmSojhxSorNARj6/ec/rmFqEQmJn
         1a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586016; x=1784190816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNS6l6IyyVH86AVRFbznu6IwUQfciQynPWNDIYQzfBM=;
        b=hH1Nzrtg/g6/TbXMcxVGXcJeLPXMxqUbOWynHk2GY/b+xZ3oS6EYgnpdwoScyivo5u
         RDwFvEB8NWB1aL/EZDUqQp2pNQAaXk+G3QXmhEicTqZLlrJSNtEdRrdO0ZZyS/GtqSAb
         pPeanzEd+1inEpvJrlTs00gq9kO7DOwmy5pU811ppJtsF+dHMMPy0EeN51H2if3G0yIT
         gz+kI8G5a6oRURcxBPhI0gtpDOGq3ETOtGIQVxwRA2PSd5Vazi70vN4IOTy+U2bRe3h/
         oqEiTpLtQH7TbOlSBI+9gYJ2Dxo1aCXXhJH/Z1t9l3WBGZ9hTEMJjOSBNq7BIOrqH+1P
         UBEg==
X-Gm-Message-State: AOJu0YxZgt5jXby6y7NKOa6jN9TCLWHPSz2wGOBNNRlS0AKnEEzh5Ejb
	7FwrcxE75W4V/3a2+Uc5i8i84rbz5QvtUMYiNTNU8UFwW9bVH60S2UnnF5yT+qwBZAPUw4tYi5S
	SQWt7v6Q9Qaj8Vny03bnfXVmBtiWzP0HEeb7rxd0/jly8dFpFtbUSdz9UcGYwQ+kaccO7
X-Gm-Gg: AfdE7ck0g0JwHqGnzWLhhS43hWtK7BXmi6OWMCa/V010FDcGwzdZa+56D3JFU3qnWDf
	vICJIFUXc+lIjCQBQGdvutw7p+jlwhW9jUybj/YnUO2XnnZplfeGSwxMDCdhuWL/SAnGx/EJldD
	wBNcj33H8FqPYt6q0CtR9A6J+NHRM29fKlisJQKEr1vjF5oeU+yj0bI6bHp5FelC9tg1xvylvJv
	zfL3YXey0y/MQuFYCL4L0TVmBXt9R0DypR85pV5U/t6eex56dG/DA7DlI6jpzb6Z5wNkOmDUziC
	K3CVikV/nLD1cc/IZBeeyQjMAAddjKwJbEVRiYlwQfrxCAJfESnh7zyPdeh+Aqo6Pn4Db7DShpC
	O3FAvKqfNTQgv4B+1g6jKJCLpRCkY0YMR5go=
X-Received: by 2002:a05:620a:1a15:b0:915:4ca0:1210 with SMTP id af79cd13be357-92ed799dd18mr267324885a.3.1783586016463;
        Thu, 09 Jul 2026 01:33:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:915:4ca0:1210 with SMTP id af79cd13be357-92ed799dd18mr267323085a.3.1783586015951;
        Thu, 09 Jul 2026 01:33:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e05ebd6esm95956566b.31.2026.07.09.01.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:33:35 -0700 (PDT)
Message-ID: <6e630189-5148-4345-9bff-f72596df27a2@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 10:33:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add sleep button
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9nJB_1ogIa40t1xmjWvWcvUtmuXj3TIz
X-Proofpoint-GUID: 9nJB_1ogIa40t1xmjWvWcvUtmuXj3TIz
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f5ce1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfXyiExgNNQCfG6
 pbSB2dky6/pip8VfKUKU3oXaEAVImQWY5/C5aIlXrhnI4h7gCdgAIfgAXKvXReqHuk1s5sTw0oU
 yv+x6hGaWw9lbGEtXc1EQY1J0AMjBHI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfX+S3kNJyvyI4I
 jdD0m+Edl1eJrNUVQN894WglXelTeBTJcmUr9qaz6efBjvp0bsJqNxWqFD/JIBiC1tysZFmmLlh
 JhBGIGupzzLcZno0bO8M4Wm8YnP3TthPcfRI63G8B+iEcrNsLSNFTHZAvmDSBtzY1jSSps3DIdr
 Cykxn0mvHQE7l4eG2qxAP6LdoCi7BZ7YaXkIfYFfSx4XJNocakRP0WIBgYwVFX6rv/5GR2OJNGW
 I4SNgLn1gkXyt7qypyFiQe8LA1C7BLrE4SpZwqbCjR2FiKIxbWYv7n8NpRx9gVi6xArJlFRSx/7
 EYgq8i+heMgU/xSsPYnepVLapEkw6+ZgnwUjCe9/HZVYcSX2h1F6mhJsvi7fHDUjjlJrgvo4QSX
 0OsaLT1TJty5RTEgmWvMAt/zc+BihVn+6Hi0Us80Jj+75/CPZTHKO3zt7NyqcCR3m1Upmqck9d+
 djTePixMfiAKD/b9sKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117913-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1FF272E67F

On 7/8/26 5:30 PM, Loic Poulain wrote:
> Add the board's horizontal button connected to GPIO69 as a gpio-keys input.
> The button generates KEY_SLEEP events and is configured as a wakeup source.
> 
> Note: The button is actually connected to the onboard MCU, and forwarded
> to the SoC via an active-high GPIO.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

