Return-Path: <linux-arm-msm+bounces-102215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNKiNIlO1Wla4gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:35:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 432C43B2F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 20:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 697B3303DAF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 18:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E60633A718;
	Tue,  7 Apr 2026 18:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEhcCZO+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzW8Dej4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11EA2BCF45
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 18:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775586939; cv=none; b=c3474elEWhDm4umz+25v0i06syLQ367uJ0vri21qh24CN8vUbeQm8BW4YxNAX2FV7KX/IMprPV7gknE+SbOUKXfJI0vc5UIFgA+g+iGIqJ+4ojD3H3v/3XTn0uvhkMwLWKnw+WJR5Z2n7du4QGjNVmRk72PVAH2LqksNEDDOB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775586939; c=relaxed/simple;
	bh=MHJGXcxA6ApQp3i+FMoqVdeIvWaEkLC2LUn0bLLaJRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RMz/c0DnHcCM85R4Nx8LqaaZTc0RtAErYYQEabWzi5j+cpK5IIKvLCqpUTBdBE+gCrLuldebjGGHOu8INnckvT6lbidyrC2eX8t2wB+JpecdLapg88svl5Za8GInsdCOYJdDR1rhvX0zcd6uk+7hRYkvcDnH6Ro3G2HnW6hqABs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEhcCZO+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzW8Dej4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637IDwji1584596
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 18:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1riLnPbcor9bSi/ogWna6Qb1k0gWNO+Fsg1bPadaaLI=; b=UEhcCZO+HwrUUwAX
	8AjnUVwwvm7F9s3RJuZ5nBARKFRZbAUUWcf/xdTj7UTzdDqiyB0S5b3Nvmbvfr2y
	FwH5fjOZ0w9qHZ20iErDhRx31kNRaCybb/IHRq5Kgr5woy6JY/TSslXWh0+ps/g2
	EeRJoCigCfFsKeO8wWqNx98JIb3D2PdcobjSO90UQE9f4l2dEGrT+YC5BfDd1slS
	5cAAhPZt6zYPTZIxFRJEPSm52nX25CHHMn37Gmk/dPhlGqTAdtsDaNXcVr+oHzmf
	8/Je5fi+Jw4Bc65+XAFR8wWEHtFW7tJG4709n4zOhxSdrjjLAW2Ze98puue3EXqi
	QSHPhw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9v4mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 18:35:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so3801024b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775586937; x=1776191737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1riLnPbcor9bSi/ogWna6Qb1k0gWNO+Fsg1bPadaaLI=;
        b=bzW8Dej4tlOSDZq3yC/XsY6mHwd+yjZ9mj698iWOXuBCpMZPasfZ2CdWN4kw2T4dtW
         KHHM5PTdY/N5C/EXmxfLm/yYH0bwA3PKcP1CQaP9RHdjLqtMsATuG3modBf7yzNgCAyt
         3cuEWOv4vy/AJq1B8uk2956ovess7qSD1idrSoydkkUk9uTE3PMZvbypqLODJZPcULR0
         r2o9AbQWdER23vK9N8QOA7zjkOQJBYvmZyys3Sb6gThaXo5KwH2Js2IlHhmgGLBW5ti5
         AexAVURI7RtdTpcp2CyzSTLgQd6UjbhZYAXDqQMfvtak+4aGp0q284dpFQheHeqbr2PV
         oEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775586937; x=1776191737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1riLnPbcor9bSi/ogWna6Qb1k0gWNO+Fsg1bPadaaLI=;
        b=Ph6YCqKsltP6eeTbwh6DcgfEuDUs7vk/Z5YBTgJi601Pv5cY9OFjn9KKFCUpmuqMRD
         h7047uMAdrsUvfTcLud3wmrQr1rxqpcuG8cjqO23y8BViTBEQuAlC1MZtJcOLl5jtIJb
         9DQQznxthaA4jbjQN+nf68k8mijoir3M7r2JZP1v91mNdrfrkYvrihI+a8GOWT/syKIP
         ScIkIY+HcMMB7WxA2I3woWetS7Axjph9MkMkIpNgfFgClX3f91cLtPPvzqOuXDj2PbF9
         txEDM5VhFdWVuNdKO1ItocJt148pVMa4D5X3MaZNs2QvsiSrdYqGN1jXCcHy9ZBPLkSK
         znSQ==
X-Gm-Message-State: AOJu0YzySu8PtRHRjyKRJnr3vt9Qff7EckEmqPsy07OZRJtfOWI+fHBC
	aWpUYHubXdjQaDLPNye4dKk+wKtRTWWM0BZDVqweccjRerBcEd5AqPQpnQECh4Q6xeQyP7w3nIj
	bToKIHbSnP2ZOVQUjW5IpLfE6o43Vf0z/irOf7rKNsRbmPpyRfBxvfxL098gpv8O+uflE
X-Gm-Gg: AeBDiestR8w9gd+LlgzArgWsN6VaeWhC5F3fTw6LAvsV8wWPJ7XppMemkE8oNzhjVzi
	GAWHtV5qLDuWaIen37IMIyLIQ0Hwk5YIgSIVyKr/EAoifbSzkXi9UpLApRJwTcQosYRk1HepV3p
	TUmv5BzFWlK6ghtB3wdhNQCmQut0ey2t/2546wSQ+RYX0bUdIuOQPJ3ui7IejgpqK9tBKkNJ5FN
	uWoqy6HP8pt+MNs4hRJJUYRjhwgIz4JwdocyZrwKeKWvPkr0GwKgIL+jhQRxh2qoIh4vtXi+KAr
	bOmNUnUMoVTvZBIPaS/xeecTbsudkD/4BIgWRuKQOnGrtkBXAeC/+W1UcovTa5Nu2gqznl/JClX
	lsk0aE4UhM4BUcK5F2Jk3N3SM5yZknKG95q7xeYVj+BALrMTswg==
X-Received: by 2002:a05:6a00:4fd6:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-82d0dba9c80mr19478622b3a.42.1775586937443;
        Tue, 07 Apr 2026 11:35:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd6:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-82d0dba9c80mr19478584b3a.42.1775586936950;
        Tue, 07 Apr 2026 11:35:36 -0700 (PDT)
Received: from [192.168.1.58] ([49.205.241.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3e169sm18775152b3a.18.2026.04.07.11.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 11:35:36 -0700 (PDT)
Message-ID: <6f3a593e-9537-490e-bea4-72ee20c5372b@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:05:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add QCE crypto
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
 <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d54e7a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Rz+oJFlrletnL8nt2WZDKg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9nldhgvQxnsrbX0ZkhUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE2OCBTYWx0ZWRfXx0esqIEZHWwo
 gsijgL/GBTIgKTO8LTL2ZpmKzYcZe+l/CzLm8dMSU3GwNcjhf/CTeD930ipuCe91XFTY1X/Ceuq
 jsUdZLXr5RCdHFJuVt3WVHM7PEMqg+tX0/5a1O+a/JI2QptA8kWk0daKGHmQzpM4ArwMhoDpy5D
 kyXZvcitLtSZDivTwgUxWkjUIl3j9wEKEK0whhChji5z5HB08UteMJavVqNzFSg3Ta8ufA27c/k
 F8+6gedt1F1tpH5guGeYnIR8YaCaxix7YpdbAZwQtn67LGMS8awH3+dnZ6PKnzidJBKU+4QW5hZ
 NeVO+RqZIMO1j5h30toPL2GVVaDkCk1uQ49b0x749pMzbmszf71boYYAC8qISQzGP/sAPi1OV4/
 Bm0RJESMXYsEvLpZFQGuYyZsT5B1hdo+Di/2f8KXWl66Sc3/Cp5PTaecrPhhIWFEfo7LWxHfL8e
 Up2vPWvNk03oDtuYe5g==
X-Proofpoint-GUID: hqBLwpP9PmabEtes2_fQM1-POaqKMY-w
X-Proofpoint-ORIG-GUID: hqBLwpP9PmabEtes2_fQM1-POaqKMY-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070168
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102215-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 432C43B2F63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/2026 7:21 PM, Krzysztof Kozlowski wrote:
> Add nodes for the BAM DAM and QCE crypto engine.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal


