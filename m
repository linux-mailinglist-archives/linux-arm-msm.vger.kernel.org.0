Return-Path: <linux-arm-msm+bounces-99213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELRhIGghwWmTQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:18:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C002F1112
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 570EE30879E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60ED939478A;
	Mon, 23 Mar 2026 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="do8LW9GH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQ7SXKUU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A1A33F5AB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263940; cv=none; b=slKIl0M38Nkw8Cl5ubTdez48V7hePs2g0/UHiwndPlsHeVjUe3MyFHl7qAkWjYKZU5w/imTpw54CvxwGnC5ywySJ2SZDse2EjfTsyynZDixf6vqvVCd/RCazMrn/Fz6gAhqoyGuI9BCHoMS1mo0BuRsjOoj0cnM7zIhqbZzMzUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263940; c=relaxed/simple;
	bh=x9OOzDnvB5GYQePAw/YFLOmmk1AGm6wHhZwblVIQ4z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPjMBd6DqG+32TxxNpCHB4XyXvEDnoaOrPSodmxNX7BRQhD7xMc8ktr/uceGspMP3Zp03WIT2kiP897aw661wDER8o6NCjh9IRpm923zIlSdJsEc4TZx3AVs+51kQ5Y6u/OBETnYhJbDE8gYCZZdI0uoIXGegqsk/UFIlEx6sDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=do8LW9GH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQ7SXKUU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tCGs2291198
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3v0RMqPfyyqTjEKKAspByaGNg3c24B4gWVzItxAZdmY=; b=do8LW9GHI9q9d8xj
	sUI2cL+jHXGIuS4etxBtbGWAlH9vPVvNhJPH2rvHlUyhhV9BjFeIYBehZyjpmEAA
	nLEY1B5zNPLTrQSr3xei4xKpEwmGNMew83aIN6X5DZTBlSo3mAzB3YBsZeFtn9cB
	M0cPIlIndOO7l2ik6ZwO0eG2quh5E1Rvq2h71WKoUGEEdx18WcG20rrpB5CztujF
	qIrht6SJC9cU5IY8PhD0BeArAfqklVbbtlXONjW9H5GwYEFUvlC7vUzcMebWI5nX
	J+A/aNSIfEZKbqH2l3BDmSkciO3YgKkzfcsIQETiDrS/AGhMBQIVx2zl0FA1uhVS
	G3YJug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70nm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:05:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b31f391b8so25392231cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263936; x=1774868736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3v0RMqPfyyqTjEKKAspByaGNg3c24B4gWVzItxAZdmY=;
        b=fQ7SXKUUO0xMu1DCKJclg78Yb1gRITqPIE5+Vg064P0EbyniWWL+n8qPbLouaU8Z9c
         0R6unNAFdP1xQCH+pwHdB1Lqz7/xBhWuYFuClH3sHmz4Hzdjv2Zg650tt5rUl4hhK0OS
         a4Yfz7LHKTLkq0CCd85r4lvZOaNHIt/EfydFCGn/YgH/r3pKaVeIa9e7bHU0SkuznCx5
         HJx39oLAK9U6iEr9SOODjvMEvZUk+zDxPnFhVP4f/elmqm71jbSUW2ze13PyxuqCufIM
         ljqJxq5gZnbDrH4ptTp4gOgeos+yQ/SqkttotPX/HaAnIs79MraFQHlByoPtZJf2b0vR
         lxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263936; x=1774868736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3v0RMqPfyyqTjEKKAspByaGNg3c24B4gWVzItxAZdmY=;
        b=d5QmCEaWrZpeBRPvUb5fSptkljfLqYbB31dbx/GmN4KRGdhWQRKe+KjOVseKvBZ5iv
         WQSB45INK0CaP1tWMAR7X+tVtLDHoNz5DJ70xGV6Hu7/Ym8BomSYMtdzyFV7chA7ozIC
         Bo3I2ZcyLRBZdgmQW/hv5OmoawsNuZwERk++qgmOKkkXtrlDgn0c5wQHT7ZL2jVe1OvC
         6zvxm+TuQBOo7FdtRhYu7vE174w7tMR9ptVvYy57uim+izgLX5db58GMWa2zB5wRh1M3
         CJiQvMoScYqGLHLKjJb8XsBI16jV8smbVOnmG2di5Mnbbe74WPxzDIDPjxMfoK2fadTE
         pz1Q==
X-Gm-Message-State: AOJu0YwcKf+9fKEYhd8bnMeSL5Pf3yS2PuIuma8Fu+3T76lgFf3A1FDs
	2kpqXFQLru00a7bm0/LCqcNlp8G5ZJMVUQ/ieDGYst49WGan3a3CrX9wvqOxxF9vlRmZtPn3Tuh
	mgrkUcivVm864QgCBcqgsrNeGKNIkN4dioEhzM0BSXC3kQlg59QnbDvmvb4mtwuhx+8+K
X-Gm-Gg: ATEYQzzLkTmbdp6A9QgaXd60LnRljj2MbMJhIFG0QqBHWUc5Exln0koVfXiv41YGpn4
	4+QNAtIMOzlRDcrRrYWevzNRvBmoFMXqLwhOMUg8/vj2Lja+iDbs9xOKyUo416A3R/koFVCT5MZ
	PURH7ZnWYzt2y7VZ64Iuh0xob/PXnHG81uiDYJuH0d4fqL/D493wXyZXLFlpcr8s8tqe+o0ISIs
	oIeR8EAiMpSlt9bAUR8o4lqh3kFSQAEJCXldV5tzu/cVBpRU72UqMW+ReglJNb6uZY5MbSVJ9qa
	mYI+Oz5oa/ZVcNzIbNFclQKLNtLC/OpSdYmlqFwAYCLAx6tQz202XN1NHqoU8FP6LUXv2uDlo9G
	J4bviXwTXpDNxrjKu1ufXBiP2pgzY7eDtcb5Iza6SOTs4yjbmZJs88Ou7QuGiSlGNyYhkYvkYHk
	G1arg=
X-Received: by 2002:a05:622a:188e:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b37564ed4mr140702941cf.5.1774263936136;
        Mon, 23 Mar 2026 04:05:36 -0700 (PDT)
X-Received: by 2002:a05:622a:188e:b0:509:38b0:c44b with SMTP id d75a77b69052e-50b37564ed4mr140702671cf.5.1774263935680;
        Mon, 23 Mar 2026 04:05:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm486654566b.4.2026.03.23.04.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:05:34 -0700 (PDT)
Message-ID: <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:05:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c11e81 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aZZBkmzhk5IA7hPeShgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: CN4aT8Jed2qjBc5prrsbLyADvDORui9D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NiBTYWx0ZWRfXx0oIuRBsbiaK
 JaIJ7wEY5UNmhskmcO9o5GrSg7qAO/ozFfENuUM7azN338Agxdw1I/UxAwghHIK9F/4uwDhwtan
 pVrybgs9Fws5pAuWnEtg1kzgwMQjRdQlTcU1Ufkdh8WahdYyP8YHCh+piAqzJKBfyyJtDnSNRsW
 wjL5rrRAFv0QiUDG1zNGRdv59ui+qhww8F0vjHEDYFTAx8q5Bby0jj9k72ebm7sKc737rYRcwHJ
 Xv4Z0TzD59egHsblE9rjs9Oph9+u7K/LA9k/YtHDLbKATk60cikdi/SoWWfK0Z4hOPGZDffhD2p
 4eKj1YDojZ5ceDqEvCSSlwYdotKad3iF0h75My8edorOLRkrbReSAhA1UpmmjG+FdO2ueZPhxTf
 pIdQrYMGmUNA3fGneUybVOX+0VG6onmAX0ihLQV2B7l+9rjJPjuBtyjwnj5tovOVHo8jiMeUJpc
 GIG2WvRh/S601r9+BiA==
X-Proofpoint-GUID: CN4aT8Jed2qjBc5prrsbLyADvDORui9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230086
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,11c42000:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99213-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: D7C002F1112
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 12:42 PM, Jie Gan wrote:
> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
> some small subsystems, such as GCC, IPCC, PMU and so on.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in V2:
> 1. removed two cti devices due to GFX block is down

i.e. "because GPU is not yet enabled"?

>    - cti@11c42000
>    - cti@11c4b000
> 2. changes two TPDM devices to static:
>    - tpdm-cdsp-cmsr
>    - tpdm-cdsp-cmsr2

They were TPDM instances in v1. What's the reason for the change?

Konrad

