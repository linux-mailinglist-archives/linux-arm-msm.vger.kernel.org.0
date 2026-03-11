Return-Path: <linux-arm-msm+bounces-96894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDK0OqUUsWkZqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:07:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D3925D419
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C54B53041B70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC76379EE9;
	Wed, 11 Mar 2026 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmtRKDbB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhxIKYPM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504EF377035
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212775; cv=none; b=Swa8I3wCLPMAzM4J31496CiDzc79CBE9d7Tn1Lxl9JZoOSIoEoTLTLqB6MTjFHzUlxNnskzfprCD7MNcYkzZh3lc8yFuK9ERlHIyW1XfwJ2dhXXeGePl9S+l+SvYTt/5Kn7lSyKQmkpdhqmlqEJjyp0y07fl7OgEA+6sbu8oSK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212775; c=relaxed/simple;
	bh=6VXxvIuvvMlo4m6X69FTioZO/RtWTFaG63vSd5YaV4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYLjUfvgq9uzLO6oEcOpDifPAvuWgPeqmGCNEEGlijliALO6NbNeehbJOT0pI3zdlR16Hfcup2kqa+RpzI0lDNH7CXquyMaKm3AEuV/J0QaFy89KLZ1iUFr9+kbCdhKwJpayFH9BSkNKKdxfELCOZRSk2LwMIyY9BQadGba8/44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmtRKDbB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhxIKYPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6h5CW2676242
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5qTUOBpAjQI0yxNIruKIROet34mfvXwPkqMtzZLjsTE=; b=CmtRKDbBj94rScLX
	l1V9ddI3EVoAbEwyUuC9cJuum9QoEI5Dq6U1HPa2j/AjPPg6azuH6TWgwu3N1m1C
	uGYFwlHaKVx54ES1b0H8FaBX4ID7NjkrtXarJOGmAGrh2e+JqUZh6MN4gd93GU1O
	LLvhlrfX127Z1p4YAF9YHON8KNgaLVwTK8zYfAOTQXmc8EIpour9blg6rZwGuOUa
	MRuBdNDleMCmDZWUI0d99OK/Rj+O4bKrediVmEr0BxulZcNC1lxAeRJD/Z0PDeHw
	EX83JNMMNmrBTNl76lc6yh9RGFw+oY4fcOodFXcvwUtX2+pk2Q2jNd1aYNBIyPrL
	HsnEyw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd02gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 07:06:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b7ed8964so2890533b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 00:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773212773; x=1773817573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qTUOBpAjQI0yxNIruKIROet34mfvXwPkqMtzZLjsTE=;
        b=bhxIKYPMuzspn9Wg/IXjkDENTEncEuuT5dyfMk716XUxnhkUM4yrQQ1AVHBIYuSvBW
         jAouZwhqcsKZxO+lvEvqFguKWbPXUYQWrLgFlagRV/682mHz4edB/pZbMd/l9oCpDxrT
         2Yjg4EvLrs7Hqb9ufe4McRmfcFESXdN4QPLOjo5ibbU6VT7KtdaQUeb9BL28AIYWR+Si
         p1001rR4QXhEq/lktRuRcl8RroP4GL9EEZhQmgDqi9Uf+519RU3uGEbtT62RIH2IYAPW
         FrjIcH8t9Tga5BO1KeYmvReeMvY7g3/Kxz/9fh+bScbLrOB7hPOMG5hjtdVcfBlrBkfM
         cgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773212773; x=1773817573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qTUOBpAjQI0yxNIruKIROet34mfvXwPkqMtzZLjsTE=;
        b=pnGptVx8uKXMLqsmv6uhm+2NDrSR5QCiW7zAnfE4hOR2zPRIV4CToCqovdP/edwPx2
         EPi0F7rYurHESWA61QHdpWDDrMPGeBxhpU6/5/ghjucPm17FmgtHKlWn+Yt6y82HFwvs
         0VMCDkIfsWDziH0BegVrGtMFaaco5GGvnf8BfQo6pNeoCsOaDc0jyOxaE8dVf4f4FZKW
         UwHtfOJ/omgy0SYvqi6bXY2mJikdxV/mX+esUlZwVXyJAwhttE85bqLnwtsay7iazbVS
         mjWfn+heVRa6tjYvtboUvzwuQOnPBGZpZZA9EKCRV8whukc7ajEC3MsiTXad901uAQSv
         n8pA==
X-Forwarded-Encrypted: i=1; AJvYcCVoKYlNbeFg1ejVY+CsRTpxld3kWjmh/kz6EAWwYfguHhjW6EbbdGGX5o2OhwLLUm8yMwSdl4U/LV7HiZON@vger.kernel.org
X-Gm-Message-State: AOJu0YykNdVuwTn4Rahe12iS7a5rJK1C88xk4vDo414tslHrn0q0j5wX
	XpwnXmlHppvQSXPiklMAssXJ+vZeAt4ySYWIrVy53tLByZ0b1sgJFh1kSrhEjcWTQOkWgOoObR2
	woLg0wDlA5gAtU5U7/QjRKpVGgHyTR8KrHiiuZLmLjS7rEend/V50iI9SwCRar9w36n+A
X-Gm-Gg: ATEYQzy0CXcf5eDt2elUJWHXOZGlUSx5Fe5dNbbvvbe5tVKYho8K4gvf6nIaq1AXMJO
	wnVaIubovakemDGnRl6GehbxdvIymiku/SH0JpUykO6NA4mKZPbnGLHc1NxA+s6cky8GvKjUP2+
	n0ipKwJQS5znNGYZbzxXeN+FvfCU5yfrMCd67WknEULcRDrkDOImNypaRVN77IcRJHUcnCXxVXE
	f8p+nTSpCEhOfqUlx7kZDgmGJ5Lt76V5LeKD+otnlHu4+lyFHUzIcuY9v/8SoAKxqAnqMloQkel
	cghDJ1Nepy/47SIwJWtWeA5T+r6d0YYAuPVgtChdWZT0P9Th4/BE/y3yG7xpsNEi+B20AEA+tq9
	qkz7656GajKewo0vdFxi/93R7KH54/tQDkTdjCLnD4H1552pT
X-Received: by 2002:a05:6a00:9485:b0:829:862d:6b46 with SMTP id d2e1a72fcca58-829f707339dmr1327331b3a.6.1773212772911;
        Wed, 11 Mar 2026 00:06:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:9485:b0:829:862d:6b46 with SMTP id d2e1a72fcca58-829f707339dmr1327308b3a.6.1773212772409;
        Wed, 11 Mar 2026 00:06:12 -0700 (PDT)
Received: from [10.231.216.91] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eec127sm1364084b3a.30.2026.03.11.00.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 00:06:12 -0700 (PDT)
Message-ID: <7aff8a49-ac47-4d93-8028-2710ba4eb2d7@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:06:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: disable WCN6750 and WPSS
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260311023219.2284643-1-hangtian.zhu@oss.qualcomm.com>
 <20260311031145.2285056-1-hangtian.zhu@oss.qualcomm.com>
 <wy46mrybpvnicmv2aljkyh6lu2gnzz4axl66r2efmfy6pr55b2@phsj7pghzd7r>
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
In-Reply-To: <wy46mrybpvnicmv2aljkyh6lu2gnzz4axl66r2efmfy6pr55b2@phsj7pghzd7r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA1OCBTYWx0ZWRfX8ZgwRVOEN3/H
 DJReUMKxeM/AqQe/u8y9XmAZ+ZitC7FIwNxml2ZqFWDu4Vy3oz0hVIjg2UK3KoF2es9EU8mJNlG
 /QnX59XftpLgWuovGomuD0k35+TWIf6NQPUo+NQTvcLYFU6R/1tAKpfbTm4HZpb3oHsgyCcWZ2D
 1jBMnWqj7wtEzxPwIQtBde5JCj/6Er6Vy0uAjc1hqydG2drCHLrB592mQ/2UbpvGSPBc5V05nIX
 nHgiL4B3tS/xfSQcer2XzrmA7eyVMQgtDQsPGVOOfE6xztaka7xnebQuDuuR6MzaN5kYCs7WatI
 NBNszR2clLmEEN5pk/XFyXz9/Tnz4R5FBctUNWrJN0AL6M3GmMGWZnEuSu2BL30MJMeasXBoybj
 +yDzGkefQEkEr2FLN5O8N9gVmsbrMXxa/6kHlDqpay6yK/uTnBdKniUFXkqSDdVBzM6Amu0g9jY
 5yZDR+0v66dH7CreZwQ==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b11465 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gk-v6F8X2pB81-9XRuQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: _td2rPvcCgRvHV78K8pudlQdFoU4qaT3
X-Proofpoint-ORIG-GUID: _td2rPvcCgRvHV78K8pudlQdFoU4qaT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110058
X-Rspamd-Queue-Id: 02D3925D419
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96894-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[hangtian.zhu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/11/2026 12:34, Dmitry Baryshkov wrote:
> On Wed, Mar 11, 2026 at 11:11:45AM +0800, Hangtian Zhu wrote:
>> From: Hangtian Zhu <hangtian@oss.qualcomm.com>
>>
>> Disable WCN6750 and WPSS on industrial mezzanine. On RB3 Gen2 industrial
> 
> You can't disable these devices on the mezzanine, they are not a part of
> it.
> 
>> mezzanine platform, pcie0 lines are moved from WCN6750 to QPS615 pcie
> 
> PCIe0. How re they moved? What triggers the move?
Please refer to: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com/
On RB3 Gen2 industrial mezzanine, WCN6750 is not connected, instead TC9563 PCIe bridge is connected to PCIe0.

> 
>> bridge. Hence disable WPSS and WCN6750 nodes for industrial mezzanine
>> platform.
>>
>> Depends-on: https://lore.kernel.org/all/20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com/
> 
> NAK. Don't invent non-standard tags.
> 
>>
>> Signed-off-by: Hangtian Zhu <hangtian@oss.qualcomm.com>
>> ---
>>  .../dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso    | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
> 


