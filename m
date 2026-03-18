Return-Path: <linux-arm-msm+bounces-98455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGk4KvqWumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:13:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5422BB492
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 13:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 881953005594
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6983CE484;
	Wed, 18 Mar 2026 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjnBL3I8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxnMA3Xn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FD339281D
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836022; cv=none; b=nJf9zSbZMtCTLhaJ1YrfVWXi0EsVzVWBfPj1lMK7KX+r9tM04I8fHu0EgPoHI0EmajYucNWAgN0f757LSxQMhpdKe/qtybNoWGm8vrUUyNrhlHp9lbWUBiKitFLLrqCpAG80j0Y5uFjFBHtL6n8lIsJPOY3qJ0SfSuIMIan9F5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836022; c=relaxed/simple;
	bh=numMzAxjNcq6OV9qlgyBnkx6yP7suc7YAlCHG5Id7UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhuRb0WQe4cIz3oNGxmzANs5/9Qxo9bvLSb3B71nHob71wfnea70yYAtn0g2MkI0NC/z9xfQ2w3vG726AUoFZEenqRl1w9yotbes6g3y9sprJ1S7Yz9g4hhdNdb2hskkl2tRmUCxTA7x54T7M92egfKSlIUWsouXvX7Yr+T7T5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjnBL3I8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxnMA3Xn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I98aYc403286
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlnyTVAErGv3bVCG7sgbXnSAaOD/BICVCDgc2Q22BbY=; b=KjnBL3I8oHrg8aRC
	QjuheSDKVRjXPSAxFw3zHTtXhELCyUiL2PRoQLMoePi84m89RVjVkRjNuyh6aWfo
	rHWUkbTIHKR6rNffxWW/MmDJb2WZZd8xLjo/DnsNAgfgcrzQAijZgVDO3unY3Q9O
	C5ZdDCWBu9HPxR/xXEW329344AN7XiOdUHZPCYcw56QfxSa97RgRouj3oJzv5f7y
	dN8O9COMWdnC0NpER0c+jUwr3VBSqCp+/UONFCIg3rUaEqHDlrFDpCG7RBY0+93l
	6l0ooQyo64+2PEQ9qR5MMNNFIXnnsVgGL6yYt0WVW1u3sd76s6aY0FhLElrrL/54
	MyNMEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dunph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 12:13:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50918b9bcc5so43522331cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 05:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773836020; x=1774440820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IlnyTVAErGv3bVCG7sgbXnSAaOD/BICVCDgc2Q22BbY=;
        b=jxnMA3XnCBxPv4nymZvIqQb/wKnWtBPlVT0Bma18g1TGU0Av9hOg8DtuObkKHRtO74
         agbynJyDIqhqhpkaet7L6YTR1L7VxSMLmabTE2GURIBCpcEGTHM1yoPoaC3Yy7crO/TD
         6q42GQqEC7DPQvByKznVsBf9FNOsE4BTGyQZ9II3NGJ9zHmA8nH7DlRuUgVIAsuw38cI
         aw/0pzCAbC9dHRJmgE6Q3jf39f3Asyx4UdbxXtrPqt3lpjDr2tGqx4nudvfpVQpnEUAe
         vizbdhIGYZzHWjj7j2Sf7KKmwsQ1SwQl3R/j19vzIO5BxRaBjLAgTsersYm6TgH8dL4R
         nnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773836020; x=1774440820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlnyTVAErGv3bVCG7sgbXnSAaOD/BICVCDgc2Q22BbY=;
        b=lEQTBAwP1fC0jOVP9+1sIFEMDPuetyuxwroFaHA1Lrz979+boICUkFSV+O/cpYLppb
         b7sOYERH0rh5KqUZ0w49pQ9KNhzMTdpm84+wQ5ax8JDH0d7/8DfntIKb7xjp7qzLwjxQ
         HzgJvxZpb15OLztAtZt0PHaJLwZ7OAceRa9/TuL5aC6XpzcdPu8MflDQlw+a3E7xxgs8
         Qhf9oQab9XHCOhE+wUoMNe/Iab4EIPpoxVaFmPHs97x/VQBH6EBYwbzQwmgFwa87EEpT
         ockEMPmj9bT6Puh5J6YW4IOBe8OMvJ22ZrlUSfOwaIJkZ7/FhO3VXHfwBozl9NgfPch4
         fEJw==
X-Forwarded-Encrypted: i=1; AJvYcCWfrqdczX7ForOMQbljhXc80OkOjNiSXxf//zuQ8/4Me9nGJGW95Tuo1wcu8DUpQtI8H0KMETfuFgKwC07F@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6d0bFovaPoq/R+3QqKUcVjfTujJajJOvA+4IRCdID64v8yw65
	jo3xh6w6yQb8tNroCEfq8+8MY9sHX+wD0fl3Pm5Mxy+iy2DvAimrYNxaxxzMNLVtOnO0wCmMjV3
	a4GGjDgPXkY7R5g2EOwSB5FKDBAt1jsDXapvUp/dBhDUHmD0ZycBAteMNnZiYmqoq6U8F
X-Gm-Gg: ATEYQzwFCvNXxVVM94AQfxX3J/U1mkD1L0TrfKhiSkQvogmT/oUM68eES88kpmkwl3i
	LvabHrM0fPakzvXDGhy2sL3Bm5WvpNv3QOV7zgH3O0xMWjrlDQZk2hUxa/w6OUSbDk6GF0N2YH4
	c2ps3fCJrrvyFx+Fp2mU3wK4K+BDjYv5KZvDvvsr/Cr2EsQuTK9wSOm6esweU+7nCnSU5ZGSQ0S
	cQjr93MH8BdH5kUbuttOeUZ1DuUnMhca9xxsXMaQgLmJ+bdgH5UgAH2qJG9F6l27Uv5yxXhFFBd
	ZAV6EHSlMJgxbOrAKBGlrwkILaFZ4xQdl5CtovtlleebsjBwzilg2UOJoCMe8HYxvivomW+FPk0
	Zoacyxr0G6B1tM2p9Wac+dAuKyFUGKKZaxK0L9p2+VbnBOjxCQPI+lXFx5QDzJIOtCewUu9U5Ot
	walQE=
X-Received: by 2002:a05:622a:4d1:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50b14864758mr27745911cf.4.1773836019803;
        Wed, 18 Mar 2026 05:13:39 -0700 (PDT)
X-Received: by 2002:a05:622a:4d1:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50b14864758mr27745631cf.4.1773836019427;
        Wed, 18 Mar 2026 05:13:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f13ee5c0sm201928566b.5.2026.03.18.05.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 05:13:38 -0700 (PDT)
Message-ID: <a38b6a8d-835d-42b3-aae3-c813f033e100@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 13:13:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, mkl@pengutronix.de,
        mani@kernel.org, thomas.kopp@microchip.com, mailhol@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com>
 <20260316131950.859748-4-viken.dadhaniya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260316131950.859748-4-viken.dadhaniya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEwMyBTYWx0ZWRfXwqNSg0pWeQTl
 LpsNKGGPOr0bmwRyAYJ51Ijdz8xHFl4g5T0mUMMO/KlHp1ymbTjp5qx8IdGFEg5Lhty3lHDEMvL
 04jIq9L4+gVgiHHY0fuPqAWpfKsyE2jInedEQqi9MiCkOwK0Z7OPOWcvNzJzhhvMlHdERZPxTOZ
 oxI6Tt3t7RjA2KOYpDg0BDOOh3nzJz0NPtoLym2qlBTonpMUzl1Elo+Prquf+8g+ZHOVdUxe+HG
 XuBhHMZmXHI3ylRhNAXn5CxURILCsfLbWAKtlI0wOBg6kKXnH+WEL+FbL3YtSjM4KZg7w33jPea
 p/wKkE9hQPaKlx0o2F3jwc7hSJtwp+8gyqCarKOAJLioqIdyXN/YWlO+482IWdHE1wS/b64Q9zc
 pOVwSX5v0i4XCMB2fdQNepgdHLFRATQdH31qqAjBFRNnr/zbOC6Eg6l/n7SXESTE2Eejv1VS1YT
 SuvgW5XH4xPkjHg0z1A==
X-Proofpoint-GUID: HwCPGe0bwWZc8xUVe1NkrH7QAAndaQpl
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba96f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vACuA67BaHBskHqVUk8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: HwCPGe0bwWZc8xUVe1NkrH7QAAndaQpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98455-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A5422BB492
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 2:19 PM, Viken Dadhaniya wrote:
> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
> The controller is connected via SPI3 and uses a 40 MHz oscillator.
> 
> The setup was tested with CAN-FD loopback and actual data transfer
> using an external PCAN-USB FD adapter.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

