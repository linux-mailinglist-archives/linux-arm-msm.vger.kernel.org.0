Return-Path: <linux-arm-msm+bounces-92666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGrhLwWsjWkK5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:31:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2186D12C850
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 136BF300B9C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2122C08CB;
	Thu, 12 Feb 2026 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nYQ3n9lV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3YRVBjn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0FC2ED17C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892248; cv=none; b=nAhJ4lgzlOBrdbqrjfiBSel+hohFZhTc4gt51WrLPMF7Lbiqg8IKyRPzuPfLQ1RSmtUpOoe/cUkaJgNaLWqt8dEmkTXscAVY0PiYyy2K52XXaIF4xbcTAT8xbxwWZQvDdRvIFmlopHT0n2h8rpV5XWCQViSErvM9z8FqrjogOgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892248; c=relaxed/simple;
	bh=iMbpaAeK14rlqepdD3Yto9sUrMv1iTcnRxa6G6CD56Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSnmsNcWUpNVCjwlmS8cQcKvhTzntXRm8lTpmhX2y2T7CoDvqxKS3WVLvLfCEvc90UkRIs/9tJhHrl0ZhRfAo/n0AUmUcItLYy6Q0A0shqXFJjZigmgE9UAk5w3/0euTAyvwMXpMlDY2AprIYKZNz5zhgwGoy8GAeGMUJFXKRWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nYQ3n9lV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3YRVBjn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAGFgi4112091
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aa6M8IvkT51MgHJ9Y9GX/isOhRijULHWDSLbPiUBeCU=; b=nYQ3n9lVA9XS8uPF
	50P4Nl1PY3l9auM51+Drw7rm4x8n3xn1GHIxJKeFv43VklzW291otxRBixwNZE5/
	ZtIkNpBSvOrKQczDy3cUPr4qTZxwUryZg1qaYJqFbHFimWsL0W5nVEfp51J2BCmD
	ORmemoto8xTIvbfOQyz8CTwQfYzMT7PoNFb20ZkzTXhG8dERltYK0uMJ6q6aCdBC
	LoKO3Y/JC+8HgZg/ZRVJA4Um7TUoSgk4wbR9drkucDeSYW6SIRAS0/INcJMFW+K3
	XLbJICkMx9c/v89H3G2YIU3dXUmvU01E9Lzh5TKEspwWL8+YZyqDtLULuj+aUfZj
	BzVSsg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cya81kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:30:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c522c44febso225536185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770892245; x=1771497045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aa6M8IvkT51MgHJ9Y9GX/isOhRijULHWDSLbPiUBeCU=;
        b=d3YRVBjn1mbLXiyKu3c1PLTSkItEM1cAqNTOyP1O/qyrh0pbKdhAMfXTFDVWDFWM5G
         sqqO2izcoYiOhgxm2o0HWNPcm2DuP1iJi978lpyt04ntkfDvAeyYKvXIbnJFIBP3/6UO
         9gZx5K3BE6DJU+eup93CwBAwBftP9O5y9olmZDehIzbbuycqhjct9WlFsMHpBbgFin8B
         E1/P5yNt5icqOSR5BAcrHIcK+dvwBiVQo/1UalzC/4FP0aYO89/iQE9dYG5VQGn68juN
         I70bcnSpNEQOuwOxjXuMJkx4oPqeHptjeAGKGK/Bn2t+l5JYx+ZYhphX1DEfTmfW7uDI
         xmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892245; x=1771497045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aa6M8IvkT51MgHJ9Y9GX/isOhRijULHWDSLbPiUBeCU=;
        b=Pae7C9cdr39xkJvMY12DCSpiiqnsHvLBZ31lHiAZxnGJbg/IkXWoq/3TpD32BORqTC
         TbEgv0gdil0KyHm/kRJxN9ThngJeyD+YkupJLACjY8tUcNQDl2S5XzYFNdQYJELHSpTd
         Pp7xtHc3aVs3qEmXyiPG+6y80NMHRZv5bil8YSCWEBIrJSBcZepWnYvJafkD1yt+QFhs
         Sxe42Zv+PvxOvGSmN3qMpaBHEwSMC6B2u1n4dGrAXZucuvpyTioOyV6bqkzL19YEcbp/
         rEYPO50z/zRAaQGAt0WYY8rWCebve4bA8Dp0QKuOifhe7bfJ/BfOGhKgtB3wUxNQGjOQ
         zheQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMwhfNMf763hWznCfO6ZRJfA+PntJ+C0UsHZSVxfmK6iK/LxyXDSplGE/QI5N3/blNzL4iaICUSUUchv02@vger.kernel.org
X-Gm-Message-State: AOJu0YyZx+4c6ZT60r7GSMKe1iJQ7PUunpIPYNgJwSHsLXGy4B3yD94E
	hxUiSYt/CLAKs4xF5JTMwF/UW9Udl9g7tdRet1TXOyo2w30JnbuFgPSiMn6HRY2BXjfSlqQbM+y
	ocsv1AE7yFLaU9QaRfjagtc2RbNQYYu3oxuYt53zUdXJD+pm5JD36dNwRtTTTPPI0X096
X-Gm-Gg: AZuq6aIaOwtsN4jKUnX16j75hTulVRFeUbGmF9QkIGIZkBUjdOCDbKZMY5GaxExN6XV
	5GwCxPF15clWwTdEeFtf2x0t2uw0aaYIiS9gO9HwGo3FkcifRzey6Hkcyjiclsj0nb0jfpiW9fI
	/IPPEdhgct/CB7yZ76ESt9DgFTT6XhMq4U1sA6erH5EZGvPGZWZaRGszRk6SBjsDinMmoPt3Ncv
	z7CCnQU4Wnqbjgn/BxYvf1NGp+v7cnk1oQaH8mePMvyCAgFjm5JNALyKezZolM5Y+nHA6A27d9z
	WKxsFBwnL+ELd8Zpkj9W8b/iRpTG7ojmIbeb/ZhVLKAmBuA7w88Z/1PSKsWdpkn3wEQrknLHZDq
	m1VGc5kjZXXj8TdKcoJUWT40roDsqztYidKOHsGIbYxwDq3QfOj7/VJ7jLq73fIs1y0N74Ks2iv
	9OU4Y=
X-Received: by 2002:a05:620a:4407:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb32f3df9fmr219596485a.0.1770892244869;
        Thu, 12 Feb 2026 02:30:44 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:896:ead2:a657 with SMTP id af79cd13be357-8cb32f3df9fmr219594185a.0.1770892244508;
        Thu, 12 Feb 2026 02:30:44 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e950070sm150863966b.6.2026.02.12.02.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:30:44 -0800 (PST)
Message-ID: <a2b47800-0c4b-4d94-8fd4-1e2f832de298@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:30:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sdm670-google: add common device
 tree include
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210023300.15785-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZxRwlhHk4nr3a06xJCe_TGi_FjOasZ_T
X-Authority-Analysis: v=2.4 cv=OrBCCi/t c=1 sm=1 tr=0 ts=698dabd5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=bx1Af-bPBxMGZxlJJ80A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZxRwlhHk4nr3a06xJCe_TGi_FjOasZ_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3OCBTYWx0ZWRfX3fOIWRYoqCQc
 WAFTj1p+WWNU9sSgcLvu3WmkfbMbbXXu3apHBLuffdXufC2Fq07DY2K1RsIEgoIb80a7PsNcXP/
 5FSh5grjX2jChNLq4FTr/1msc0nLZ407el+BXPoyRqHx9cXXoVyintLT7dghvfG19X8zmTqIV4L
 6Xn/jPExhP7gWhj5mygbLOw50sfnzxglye7PE5CfkmNPlmZ6OcKnmSdJWBfwoRnAHmgKuueSixo
 isx71tZsZMcxdmZFfY3Z16+vdWbYEB0/MVicUEZqSfF9vs073gzUz9EiZ/6M+gFuRE9dZsMOppu
 aaUgx1r0WbAz566WkufOEc5Pq3iFX3FvyJb5fJP348TG5UzQveYVBWw1toDyJyoOYp0dhwZYXN4
 /oj0d9SUNdR5kiGaPRW7WlygBbNPqfb+sBSp5OZlUJCrg7HzmPEq4ANc/RjjfG1kZlwNK54SSuN
 sn1U3mKmrfhBRsSuq1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92666-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,9c000000:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2186D12C850
X-Rspamd-Action: no action

On 2/10/26 3:32 AM, Richard Acayan wrote:
> The Pixel 3a XL can be supported by reusing most of the device tree from
> the Pixel 3a. Move the common elements to a common device tree include
> like with other devices.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

>  
>  		framebuffer: framebuffer@9c000000 {
>  			compatible = "simple-framebuffer";
> -			reg = <0 0x9c000000 0 (1080 * 2220 * 4)>;
> -			width = <1080>;
> -			height = <2220>;
> -			stride = <(1080 * 4)>;
>  			format = "a8r8g8b8";
> +			status = "disabled";

why?

[...]

>  	panel: panel@0 {
> -		compatible = "samsung,s6e3fa7-ams559nk06";
> +		// compatible is provided in specific device trees

/* C-style comment, please */

lg otherwise

Konrad

