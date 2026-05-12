Return-Path: <linux-arm-msm+bounces-107125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNmfCpBLA2pq3AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:47:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9108A523F67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBB983025E44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A33D3C3797;
	Tue, 12 May 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3+m0Z5d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJXvf3+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA49370D5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600521; cv=none; b=gkMeVuOe5VJORqA06xFc17LepcTlJaCsC7+H3n8YDhIAyyboOFIJ9zhrFZ0HIxWBK7zb7WDCm5g4AeoIZxQulnoNnlwSUELdquD0DzRtvukRgrALifnt/HXRWho5ZNOw+jGRQMLMCf/sa+Efts8BoQoi/w5Rf6OSozYVQUJaasI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600521; c=relaxed/simple;
	bh=ASNsGfdU6T1j1BVptVb2ZQaAVqQX9/RgVV0xy4hHAWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JMYe34dZiSq0x7zV2cn6nuQUlF/GuCdxbQ+yN+jNzOwm1d5wImG00yNy+laPq6Mgl6zfd01T1OaPAZ5MgJq0OBl43N6Usi5KmqYbzLFyGt459ULRrMKjT6YfiGBZnZ4iEE52nPhnP/lCK8Nyo4GAI8WRx6s+hTe/5dzfHLbynLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3+m0Z5d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJXvf3+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBcgX1075092
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhVAp6Xj9ZdNGTiZn3SgC0uWIr60z6YXZup+UZ1L3Wk=; b=Y3+m0Z5djiUbsyXf
	SgAkhA6Q47XcObutVLWbH6y2kGjDt6faF6S/M4pXeTtB1iZN8VhNg0DZZA0/CHPy
	ePhQD5s3cRqHkIYKEGwqZRYl8T/yi0+EH9UPtXMdeIMu94O57XIcbfWlZyWyP6Xn
	IOzMu0gu+yrbmNFGk7JXxOlZnSG6rJSTUBnWbbH0/gJYf/QUT6IlnKMfsw6lefIv
	WDmGpODPqcy3XWOyyoIBPsCtD6N9Ue2hxdTIR1IPh/zPLeJgieaZPHcTt4t7Kof1
	2+vzDN5MNsZb26UK/9zaWjOsdvL1wFAKgCDkrpRkEDV+ZEEcQ1yJU706J+cKMam2
	+uHhQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43gyh1eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:41:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366ded3bed0so2888351a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778600518; x=1779205318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhVAp6Xj9ZdNGTiZn3SgC0uWIr60z6YXZup+UZ1L3Wk=;
        b=fJXvf3+TAp3Ut+vdBzUvSA9lj4gjfr7laZViDJBpLFRaXfXyTA/AZWVQIdkpUb2hgU
         HpB3dZYW94TrlTe7OpEZyqShha2aq8nX/acbcX7pdVocapLZZDi5+ewwlVGy2SAWexsF
         4VdMOtEuA+V/+Pjz7O8w+rIwGpwHd+C8UVvlkuMLI7WRY6NJRgoz6F4/WaQ8OGfnWS5B
         rHzLvedFkiJwriHGH3P2bAwwYtTIDpxHXDV9x7Q9PTNflVfKcB+eEyNcQTokW1PGU9RX
         rg0y5CdcW8xUdxSoFM5Bnu4keJTBrDWIyT2Oh5AgB8Mw2/szNHBblySzAxFy9EDKCWPw
         xMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600518; x=1779205318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhVAp6Xj9ZdNGTiZn3SgC0uWIr60z6YXZup+UZ1L3Wk=;
        b=Uvzp1seftzvZCSQRYj6pf5C5Pk6gQ7rpEO6+synKuwK40soDyVYHnpPXPc0jpApAcc
         CVy6eelSLwPdV6X7WBtvfqx3RZBRdme77u9IyNwHhwevAbtgSWYzbIG3HZMKtnNP52nv
         mLGwjKdOsfQ99Mci5dzaicDf8hAt7FOPQVWQpRe95LFKnuMfFI5dqWAs4Y7lxupfoU9h
         zfZtt/MvtWjFaOHZTXdiRGXqmoGSO+usI+YoSGAq89zLMudQD0aWCE7zVFPPVNATolVc
         SPWvwTQyFT0CbJibcYa8FLnBtV3Il0t7sItHXb+NwIE7f9d0fiiUNeongudH6FgGCWz2
         GkOA==
X-Gm-Message-State: AOJu0YwJZ0SIa0mBz2iM8mwIbN2HPfASpwbNT9u+tKqWLuwudCuLrDCh
	gAmr49zz2aUv+b3qKYCyEIoPApLBmjCH7rh8ZLGYEfA4XYrnnFyCdU6uJSz2JN4Ct9KdjsYFunj
	291oUbQmInCtFqpoj+OXF/w/ONmM9+6TcO37AWrBMVM2Q1pRkssZ5/D5zbqfL4LO8OYT5
X-Gm-Gg: Acq92OGmIrlSZ0o9cNDliwVUX44m8SSGmtLVwfMlLkic7ktdZTjEMMzakV54B6kGqwt
	+UXozjww0WTDspwFBz62MaNtEjSd+OdgWCei2lz09FDmXNe6hZ6qVdI7akd5w2KVIuNAfzm3I8E
	wmQJwhYT26rb/98SWP16YcGHSDWhBnxzxR9vfNaZSu3PJ+3U+QDSx2UE4s3APGh51+g4Zyw76T/
	zmwPvC3Y2kuI6rp7wEs6z9PUpI/13WBOj+EOcw03vPWmN4MrnueUJSN9CqCaZsXcP9t3O1Xg1pZ
	dW/c546414ZAxSEBCMul7Par/IpACaauH4vWLjUQzA39uop4pKArF79JCZg6SVQKqE7lTG5dTR1
	EWyBfHc3gaNZ2sucLqDOkkOzsp3bwNhw2baRxjGqkdBN54M6L/2S8e5RzS49RGWF/Ew==
X-Received: by 2002:a17:90b:3c06:b0:368:4a6f:28f8 with SMTP id 98e67ed59e1d1-368ab827fabmr3941271a91.1.1778600517885;
        Tue, 12 May 2026 08:41:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3c06:b0:368:4a6f:28f8 with SMTP id 98e67ed59e1d1-368ab827fabmr3941235a91.1.1778600517373;
        Tue, 12 May 2026 08:41:57 -0700 (PDT)
Received: from [192.168.1.3] ([122.164.84.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf7a1edsm232693a91.12.2026.05.12.08.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 08:41:56 -0700 (PDT)
Message-ID: <e2633ae4-9fa0-4972-904f-102c139966d8@oss.qualcomm.com>
Date: Tue, 12 May 2026 21:11:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add the SMMU and the downlod mode support for
 Qualcomm's IPQ9650 SoC.
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMAJG5ae c=1 sm=1 tr=0 ts=6a034a47 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=trKcrno5vQlz3joPFEC71w==:17
 a=_3c_48eCv6knbha3:21 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pR5C15jJDmVn8rSoiLEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: IgTiISidUwVpmSQ3KvBxFVHPyb4dZdRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE2MyBTYWx0ZWRfX/6jzTFit0TsS
 /1fooYWvQRhHNd33ELnjoDdksB/lVtUf/djoQQ2A/MTJa3TNc0LIMZsYZ9VYfV6MZvAoKqFYV8y
 M4tLvYwPjku/X9vjdQq86lXLKqt7ijHvhz7CRTGVCGBZlvrhxekg0wP47ER/0734HeTPy5fYIcq
 0B9nsLdCTvYQ/kMTyWOqk4wnWZJGdlv2qIcFJUwyMK7/YqFAloxx3EUR7Zz4+M49FK0jc0rK+2H
 MPrCPf6jCeAthynXJH9PgREyocs6dfMIqRbEKEZFvdBNnwnVAXco0loCU6uqyqmRnYk5t+ZJdH6
 3NS5CKcd8WB3SIIFOvnb3A+0x+gAeW05zHP4v9yUjOkN+dQ7iX2IlmlAXgbLFo9ySv73LayJerP
 gVwp8wO4vuLJsu7+XFJgY0J75BRZ/rS0BiqCv2UZ2gxC4zzVwYef2vOL1e19KB7CZqIfBCaXov3
 gbLtb+3WbB9Q3cLm2Vg==
X-Proofpoint-GUID: IgTiISidUwVpmSQ3KvBxFVHPyb4dZdRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120163
X-Rspamd-Queue-Id: 9108A523F67
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107125-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/12/2026 12:34 PM, Kathiravan Thirumoorthy wrote:
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (2):
>        arm64: dts: qcom: ipq9650: add the SMMU device
>        arm64: dts: qcom: ipq9650: add the download mode support

Please ignore this series. I have received some updates from the design 
team and validating that. Will post the V2 accommodating the latest changes.

>
>   arch/arm64/boot/dts/qcom/ipq9650.dtsi | 48 +++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260512-ipq9650_more_dev_support-b64369bce88b
> prerequisite-change-id: 20260330-ipq9650_boot_to_shell-159027d548cc:v4
> prerequisite-patch-id: 16dd91c965e8c4e4c9da7c077f5f6e5f56624149
> prerequisite-patch-id: c74b31333eccd4eba783b927b7eb0bdae27ec576
> prerequisite-patch-id: 940367fceba083009275adfbf26cec848e676915
> prerequisite-patch-id: d00248eca6cd1203ab16aed75a6932581d90321b
> prerequisite-change-id: 20260511-ipq9650_tcsr_binding-70d665950fdf:v1
> prerequisite-patch-id: 12a6b83739dd22ca8a25507dced2e56e5cd2fe4e
> prerequisite-change-id: 20260512-ipq9650_smmu_binding-36dc05d39860:v1
> prerequisite-patch-id: 92f58d1b58fd36313dd488d024e7deb95fc35ce7
>
> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>

