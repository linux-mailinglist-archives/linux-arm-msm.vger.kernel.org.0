Return-Path: <linux-arm-msm+bounces-92063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDmiLC4IhmkRJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:26:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD6FFB82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 16:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5983300A3A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 15:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB3D3EF0B7;
	Fri,  6 Feb 2026 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOswfVlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFQw/Efn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ED2396B72
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770391593; cv=none; b=XMQH8cB8TCuUbtHfLQX1+Act9wBgSwIcEe+IrQBueDS3lJLCKYfrju2dzK6AHHaCZusOoCMojbZXz+ffbpWK24rnMc4IV9TWMw/5J5a43GT2BtOrtQzAdsCkJIRIuuAHF3VHoeQ2f5j8JsOcIlQBPg6eMLLXZWKrdypM3KXOEN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770391593; c=relaxed/simple;
	bh=F2pMvrgnr7gr8SAN+VWJre+begr4FTTkY5pvgKiEH+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G791IpKq8vqhsc7SX1SqWYa84y1LGus18aDTzYJ7JKY3qcopzX9qARps/P7Qdwuf3D3Rc4faUF9rCAQr3Ks7Mrpc5MuQUaCDHFkBmv8KAH6cLZU14TLK+bvNzMzu6eLubd7CHAjqcExrJtEFL2/KW4Zq3edH8XowPjXuXWqrAOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOswfVlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFQw/Efn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6169QOBm2228023
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 15:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhEwypYyXQ2CWRuV4HPg1mZGF/7TNUgGMD98pUNLjr0=; b=gOswfVlTWWiK3HxM
	NeOF8pxkn+OpzAo+IIakCBitznMoTtXW91iW6t+4Cv/RXgW3o49VWPHnYdJI9gs1
	ahrDc1IlpV1J8aFmjUyBAVCEmzKi3r4TikiIqURJIjh1dPxaa7pas7g6TdvbzwIt
	rMetDs0qjfrtVRvrXYbOCNeYMRC0Fr/ki1c130CVkWWvRb8C5gc0fa6Nvk+JkQDQ
	GUdwDrMj/GXIo4uQDgCbjiet6TIn7FOqGWOnhR7WaOPNvuE+0H/C2q+1mryRMPRH
	qKcZTNXqvTEmC4cIpZ+Y2Bm3yuNagCCHJnL01+wYPz0mxTg7qWfQxId8zDUc+VNH
	RYhN3w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5dnyh0th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 15:26:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ca3952cbb9so89760885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 07:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770391592; x=1770996392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhEwypYyXQ2CWRuV4HPg1mZGF/7TNUgGMD98pUNLjr0=;
        b=aFQw/EfnvI6EEzLteRoXzb+mN8iOogJ1VrWC/MkFJlcqmCog3X5mm1yNHQIgmKza0Z
         Lk+/fdf8dg8Pno+7lB6ipazSXjqR9g75WpxtiA8KqhGOoIogING89wHyqsQvX7nySgCr
         DE2tnbfexLXWEemPCBj4ToUchQzFwoygc5yegyp2mQfRAJfyJ3riZS4Na7KiA96guGeJ
         txRlfuz0mSdTl4Ht3bzgagaRlm4aHiQpxzLlpH+b6zs5i0H5VKN0f5OOPBmwVoQ+zjOr
         XT/iRCqq4SByT2DNjosjsG++v6CGHT3CVTCNDWbjwIo9aMn8G8+kbcqZXSyn8mCWvGdC
         ZErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770391592; x=1770996392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhEwypYyXQ2CWRuV4HPg1mZGF/7TNUgGMD98pUNLjr0=;
        b=NEjLQIT+LGPg4IqxqoarTvN4mhsSV3wdAuAj7Y1nAjG23unDq/oDBv1mBn/QMmWEIi
         u/KsmYDBNRWviklYsQUC/odLjU/IglHLYSIECZxQwLLMQc7kocreYVUHfQClERjq4fOo
         7IVajG1xMEJOVj1j/Y4miW0sw9Uwg3ZLUWdgNm9JFeilyPwlRrmJ3RbOxqNLa7YYnYM4
         ZLSPOH/i2JPqjD1Or9IdTB19yoxYcuo/dxLUm/JYIb643nh8By3GEAP64D/OQ+lVOBe5
         ki26l6tfRYAvfAEQjLMJlJ4leRsD+/Z7KNFCiYxiMM+/cISywTr5ubVB7+ovfeck4IHz
         WM5g==
X-Gm-Message-State: AOJu0YyaBbsjL83M8B8FFD7mXf1Y8ZAM4Duj0Ds94gPpPbxErOgM07yb
	22zFAXKxMlvS8pnUcxMrwo6NMCv5qRJz43QZJQXD1PTUrbXJOS46rMET++VS8GKX8fHnIjWXmtF
	/PEsJmYZiBlDVwd9U+ZBg/SFnRRiTkIGeIU/6Cj4rcpiUyXVCPDFsfnjpiLpMaVIc+99E
X-Gm-Gg: AZuq6aJxezECsxBN0r4XRl3uU7+WxdRhdvzSAmPY0ivE7CqiLihCBXm8QGt4zrHRRtF
	5yJsRGJdIQplZYgPRG/kmaXq3t8F58PDHQ0MCyCIm2fYinIbyWdR32UHPeBNO6zsxRKumgQnkY3
	SSAjVw4U3YSifC3PV4SCnhyHryvZj4eNQOAhFTPfBlRNflpvUfog+pDm99+FrkM/fhOypFJ/dyQ
	TqoVtD8XZqmstm4P5THc8CGT6BvMVwvHcu8yjV60megF0ez841MOKyBRwRxKsNqUiR/JP07qaiA
	bmz2PBEwLSTIscCT5jEPtq49Y2xGMbY5SLyalVtOuSUMPPGtYIGkcQ35L3UJ2ZkOJhD+6kwhRAY
	nXKo3tKKtMWYLZjwLI/Tqpb1dwbT8ODkCZpfWXraXCOWiG96xt61fO2rZNkIxsbK+iz8=
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr309437385a.1.1770391592092;
        Fri, 06 Feb 2026 07:26:32 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr309430185a.1.1770391591126;
        Fri, 06 Feb 2026 07:26:31 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a5a31sm91511566b.24.2026.02.06.07.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 07:26:30 -0800 (PST)
Message-ID: <bf735fc6-3410-4b9f-a0e6-7ce18d8cb74b@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 16:26:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: remove msm8996-v3.0.dtsi
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260206134506.72679-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206134506.72679-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S1VBdhsvKvt-8QRva3PbOL7vgfUhmgbz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDExMiBTYWx0ZWRfX24ZMwcTivu6x
 YPfbyCX7LiEnxud0evySlF9O+YBpqEXfhnG890oU+2x5Mugx4F7FlEa835Ar+zjfnlTEp0Xe4Qy
 +MYcNdrOVmFic/sNQtqzza/Zp0Qd3D6bxe6QHU7p0w0B8sjBEG/UNfVydwtMDpA9Avn47EZ0Mwx
 czdPXQ3V+xS4Ld64uPWa9ILlPw5Zc1Mu07LQSbxJpTX/xBrOcFZT0QHdHz/z5YqtDo9MsX1KO9y
 1As/jPLtjVYxbj7x4kYe89aOFtspfMZ5oSCUvXzc/E8uQmxT8uHumKweetG2C3lJYO0KEIhdVJ+
 U17Ynq18l4Wy0DOueN1NXfv6em8qMOTmnaTqSinHH4/j+OkHUCpZHF7YQvj1sNrR2+uYHQRg5CE
 vsSOvu+fEUdNQOZASBCDg6ZLCPBiEXpJ3XGhYabwZ10vThlyebnIDLZT89X7jg7Ji4lYoUSHes3
 n+MPADZ8KFtHDhhnNFw==
X-Authority-Analysis: v=2.4 cv=C73kCAP+ c=1 sm=1 tr=0 ts=69860828 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=f7huj6fBRboNw7k9hUQA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: S1VBdhsvKvt-8QRva3PbOL7vgfUhmgbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92063-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BAD6FFB82
X-Rspamd-Action: no action

On 2/6/26 2:45 PM, Bartosz Golaszewski wrote:
> This file is not used anywhere. Remove it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I think it's the nth attempt to do it, hopefully it finally clicks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

