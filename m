Return-Path: <linux-arm-msm+bounces-98414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UINRF3WBumldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:41:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B58EF2BA15B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B82F300E249
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D463932CE;
	Wed, 18 Mar 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kq6Ja2HA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/YgvSle"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922853A382E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830511; cv=none; b=DQNXgCwbigEkHdqwBHVk3tyYqNBpH8SbFabviPYeiTyZoOY3SSTghfulkARIj3LZtkEJURyVHVCRzofdlDzYvnJ66e+6b8T/3OrLthRdA3FpbFI5vmv9iJILWL7DMBscM4KNwBcdQYZERjNOVKRhENfeVEevsH22shNFMRMHMVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830511; c=relaxed/simple;
	bh=z8AZoCpOuAlJW8XS+8oFqlaUsdqC6TzfLRME3kPTvHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgqvnJFXwSyY6wdHYGbBB+yRpbAh1fzVf5OBkn9bfT2esS26E1zjIP6nLcqoCEVXGWPUmonIFECek4cI5XJ+Z3+3lwIM89In6XyRIdX8KgIEZu3N4DeG69inM3/W+lMpiMmBjM7V7xv28KxnUo6WldoQIo+wAFXlso324bWc1qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kq6Ja2HA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/YgvSle; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9DZx32730128
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7JvTp7hmLFziG0oBbkdI/EukWfFdhSsnVbiUF2XlbY=; b=Kq6Ja2HAc2+l893b
	Bl1fRjPOl9LPR7QwpqNWM2D5kGttOc0pxKDCx/lp0IN2K7A/ceeq+NPnezV4w/jt
	Xxgr59mVNMfCz4ce9CgcXpAPpBQ8CoI4qHhY6XXTGbgdxtHZ1wOEdQI45YBGFjHw
	DDQpuovSe4EwpVSoBHPvs1Q99VPWv6NzCd/8isRSDiaTCIEJ8kuj0rEcnRxfPBMF
	cdIMO60jmLNHY8f8PxEy5YKVYRX4d/3FWrbaXR/uszCQm4B8Iiu1lNuQ49wOKKf6
	+4D1BDrHkkKxH2gBwljbMvY7YuKlfHuePV14//kuxlvS4yQ98KVy9TPlHnBntHQm
	KEPBpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvemk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:41:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50923a9bec8so17766561cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830509; x=1774435309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O7JvTp7hmLFziG0oBbkdI/EukWfFdhSsnVbiUF2XlbY=;
        b=L/YgvSlelzZ41VqjkchOZwOExrNRkHkRYHDHtSTGT53vdKBM32ICs7MRZ5AwvT1tWO
         q2yRYHJ8CqZyMlsu89nTsf6vJBk3lzyoeoC0SNYEz5pBTrGev2bUEJ2fRCu+QYY4XXY5
         GNucK6rlVFB7UtbfrEqLpz7usjBQUSEixZoUQ3CkhlJ4JH5TV5QugXUFcJi6TXJN6HsQ
         aYinCN5hQPVIqF7ukNWQYDB+2MgkPlLiV92UCdusM5SDJ5C84+0zBITRs+ElHg1kglot
         BPoojOAAboFStQXNfyOWyAxpXUOILO6NXQAHDCSvqQvmtVcxaPJ8lhqCqsChklZnYinv
         vFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830509; x=1774435309;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7JvTp7hmLFziG0oBbkdI/EukWfFdhSsnVbiUF2XlbY=;
        b=tCKwHMY6+pjQfpMIRrDAXSc3I35F1O+qo3PZ73vGrn9/NvqaATqiQcZszB17UdvDYi
         ayIryBoMg6ky6/T77liRaUcU0kCCkkD0nfHDu9pbSS2jTORjw68dYAFlQbM1AJ6um87P
         WVV6t6O4pO9ZvFVxIedXSUEIU+QfRS9CeNjlmFQx1strSidXmLsCA1wwNN+bMBGWVuPI
         zrH5/vp5u+901DUC9iCEf81fQ6hpnoHVOVe8k2xp28khTEe6pPm4/73i6dpSYns8WVcV
         BKUS+G1cT5dGSaAB/tAEvtcaGjWn0Lx1CZv+P4eh7pC/ijt2eyrb4W7p+ioLnaZFgQ8X
         iSSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb9WJIZ2+yhuo63fmVGuklRS/XO7JFGaIv5mkhCSRhh9DDzWQAHIdQ4B8ypnbcX0cRjFUBP4rCdzG8yiT9@vger.kernel.org
X-Gm-Message-State: AOJu0YykXtC8Iu1tPf5J+/ac9xT+FoVBlPg6IbNvofMxLekin/hNfwSM
	/Xt9c+LGDS1/reiFxHNfWsGsUJGhg8FRpG+N2H7zS5Z5V5THvewjGsbSn/fTZwq4Vo77YtjHB8c
	d9Rbp/pCqqDlWWm2WnfKGzeJ2VND6+fkXeaJwhnyARwRQ/Ta64Lm824FGbx9nUV4fGgpOD2z8OT
	5o
X-Gm-Gg: ATEYQzywMMBaScwZ8hGLbX/VqWZbS/Vd6POPLRfqM+YULVtLhFlkCswlsahEOFaUM0V
	RnVBPvc39R8k444shPRzuO2fCOHPPmz89JSyOBVyme/Tok2k67aSy0bB27Tdrm5NaogEOvoteNj
	KCS55/v3dtPpasKOL+Zj98b7OH4rJhDihABqYlq+DYuP33oSIDObbh/2FXMd5wCO/XrLTMWZL+d
	1LrGFSy/S8/XlKz3hzFhsEWcuhzqEINo8VVvzsTaB6esWKLh9SYlHf8uvnc0vAVCAKSIXjviNrf
	FkscnfMlJm3TnE81/ujjuA2+0q29HvRlONX/e+TNd6zi1ntQ2fsflnqV1UrRyne+hQ8T0cqvDPY
	+4/9ST/c7KlGaR1NIWRpSePdE6nZCSUUDZzfzohcsqQFV5fQE
X-Received: by 2002:a05:622a:a:b0:509:3025:ff59 with SMTP id d75a77b69052e-50b147947edmr33568231cf.20.1773830508721;
        Wed, 18 Mar 2026 03:41:48 -0700 (PDT)
X-Received: by 2002:a05:622a:a:b0:509:3025:ff59 with SMTP id d75a77b69052e-50b147947edmr33567931cf.20.1773830508283;
        Wed, 18 Mar 2026 03:41:48 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518a3d78sm7471280f8f.34.2026.03.18.03.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:41:47 -0700 (PDT)
Message-ID: <0d3f8293-f38b-450b-900e-45e7486ad3dd@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:41:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza: Enable Eliza MTP board
 support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-eliza-base-dt-v3-0-8a50bd2201ed@oss.qualcomm.com>
 <20260318-eliza-base-dt-v3-3-8a50bd2201ed@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260318-eliza-base-dt-v3-3-8a50bd2201ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MCBTYWx0ZWRfXwW2TcFWEFA6x
 E03//6Z9RH41dTF3HSCra9jmRFGIYz3Gn723xgVPfLRS3P4Z3aLmH6pieQ5uiZ+kDUTHLsR9ekL
 eU35iFDA0WwyaWKq9H8ZkPR8T8zbrV5vZyT1BA+yI70fb5AoOecU6w1Z0t7Bs7UDfHwMDFhOncY
 BYP7f7nfA+i0eAD9mVO07nP1UVAv3UoGd5tKi63sXNs7DrRcWmeqmuLP7FQovfc/+yCyllSCae/
 k2aXtkwfIJxy56ANVSeogTb13xcumXybO9QWUKCqyC1KbQPW6v7uSwnUJ3e8xHYZSF+preCQ+Pm
 wdySNwxN7eVYkMH+sciUSJizm79gj4XHjV5Y1lt8+jL4YY9rZmpEN+6vJorNpb/WheXYRIKgkjN
 oW0W9JARQrTwyDTJUoVFNyiqkwb+5jSen+EUUmhbJ6NUJgn9cCxdKOCTznAoUqxsO5Ak3oBYRPv
 e5J52dK44/0f0NT1GbQ==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba816d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sHhZwoeLBXywSJo5pqsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: qkTMdkAo2AoXtTPHbxkYpY-Xd0TfJ2pd
X-Proofpoint-GUID: qkTMdkAo2AoXtTPHbxkYpY-Xd0TfJ2pd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180090
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98414-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B58EF2BA15B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/03/2026 11:19, Abel Vesa wrote:
> The MTP is a one of the boards that comes with the Eliza SoC.
> So add dedicated board dts for it.
> 
> The initial support enables:
> - UART debug console
> - Ob-board UFS storage
> - Qualcomm RPMh regulators (PMIC) and VPH_PWR
> - board specific clocks & reserved GPIO ranges
> 
> Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Parts of this is my code, so it feels odd to provide review for own
pieces, nevertheless I still believe they are correct thus reviewer's
statement of oversight applies:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

