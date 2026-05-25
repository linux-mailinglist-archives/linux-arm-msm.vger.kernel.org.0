Return-Path: <linux-arm-msm+bounces-109664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEFVKB1NFGqnMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:22:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2FB5CB0BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D50C530059A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E68384CE8;
	Mon, 25 May 2026 13:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYL+PzNg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxVc9jFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28A43845DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715353; cv=none; b=AxSaVB111L/TyD9NfE0GqnVVUCeSdVoH34AgTZIX2gBaHg9D3h9/fzhaaPSEPnWPuRuMo5jHtJbhEKBw2QI1xpazfKvPZ4Z28gmqUgLxkzdeA8xoPWngHeHhYg7m6hFTU6a3VWFZt3rxJFyRdI5WaIHwEbqyfRhgtN8nxVxX9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715353; c=relaxed/simple;
	bh=jHcvSbCExWIjtKMV/pU6kDsotLo51wfwXJuDRGLN0fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgPx5lisxEZo4t9zyWTWa9kt1eX9bxwW2FCoPbJ6uzHLjfhB6zaUzjDxm15piRB7R7ZDSb4HOKBfGfH55tKpGRI14vG6Qxbv1Xw+ZfGBUO6yf6xrK4hG4EhwYy/TsBL5cerSnb+cvPNPgoauiyIhpSnSvw6657iiAVN/4knGcUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYL+PzNg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxVc9jFi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7PO1U1518829
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mNLHKeI+fmqdA2wW8OAxLJgnHeG5GiRRwaHW4yuNhU=; b=ZYL+PzNg7sbUtSEA
	xEEf0E84lelx8VBwfN/3jR1IcPBn6G4q0HHjRlvhG07OVO96/sRbFLa2050iz5x3
	4SGLk8JwIU2358zn+sTflirrz35I0LG91P80eSMISNVoB93zFvwmuqQ1d7cPU198
	JyJxOxN41/dyU0T7wE9MGtLKwrVD8kVeMLCdacbHudv3phE2lvbHRkdzslJrAogD
	cBfk46ei7nASqBuRVjqW2WR+xK8TiMX2WTfH/u4Xa7n+OUFx5q/yMps4rmbbtOZ8
	Km5mpZat4+yeIDArRAEING7oI8ILAVgBrXXhqu9/eMZPBY6vGw5m59WBIraPH+wu
	sv0D/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txptb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:22:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d1349cc6so6435841cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715350; x=1780320150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mNLHKeI+fmqdA2wW8OAxLJgnHeG5GiRRwaHW4yuNhU=;
        b=OxVc9jFig6FFphwZBVQVWffkm1OYk3jwa4Xl39OLNDoodADcDGOzRqOVypx3/+Jxh/
         AvO4ZNYhOzl+3CqZQoSxe2P5j4q6OfJJQLd63OogimONbGQJneALm0fqk+QTqTlJN34o
         a3k8gvwQVMYoHWnDxdLwkZS5TBfwUktHRG+qfeQDOs3YkSrJ4vqbSBwOzuYiY8JqOw8I
         Fi4Cdpk1pp7jje3zU2Hc3b2FBuUcU9lBhUTO1APXMUEW8mi1/hBXqiSkw0GiGC67rs7w
         dMlZGYaSkrsdZyNjhmoTWbjCXnzrO/Cy0Heha1Clly9zDMaFT+GC614unbex+/qMJ8Vo
         ZjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715350; x=1780320150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mNLHKeI+fmqdA2wW8OAxLJgnHeG5GiRRwaHW4yuNhU=;
        b=qq+wo1TuVLj6HQpLLEoXIAe/6bQjBmFRepPGKa7UbPdkKz4pT1uh3gfKiCfX5/2Ldz
         Pf61XIvKsXhx5FzJiqqbKr42mDlWquZ/qFUBie0TP52o+GhACRv/aWxQCWu/jUHA0s3w
         pB6DTzdeRyiDYnFtPzRbLPrn/4Tr35MzxJZa5WIMzqhimRWoeUzayMh4jpr9cGqsI8g/
         aZGE9/6Rec3c8c2f8IGb+F2VRK2y4J+AfCT+Uj7eWjc7n+MUGngcrlvqLRsZM4RYOEqV
         sS3Kjjginw8NBXsbJZwswj+xsocLLQZrV1SCnlKJDSg8WIEZL5Bhp7AY8KqJVCezpdxm
         jw7A==
X-Forwarded-Encrypted: i=1; AFNElJ81TAObT64DJRY4tRsmJrC1Tf5k54IZ19qcEuHEDekedPFFSsiu0NOToi7tKXqkSS+9m/rcqNyapMMK1f5d@vger.kernel.org
X-Gm-Message-State: AOJu0YzNhW9Z3pwE0sYFM8uvxhzeZ4tjCe2MskNhLKrbZVmBFfMTpwUE
	EHcjANi+sRgiWVU9JweTyAZ807vvE/WIWJIoZ96IXla+f9OJd7DLTYVXOaqqZh2dYRrRi3zopih
	L7gJcr9R7BGXKZ5QUtJg42XIYTrqdJGQmrsgySnEfxuRxvuuTudb3rd6XFEih5gbyxCCZ
X-Gm-Gg: Acq92OEjR2Sef3NaRvp7NPWfZd1nYwtDy61z2JL82NdCCIkCWywYUlvE49C2JAARGzP
	he0HoHL4KGwptYwfRqgEQx79ncFhy0RAfPG03HMXnspBIil7ARRnwfKJxlD3YEigexZsBAtxwux
	qkPyd1+IwwgjtjWTok1Z4ZJG2KfWuFjoSXJgSqa47/rux1SPcGLnWgl6MVV/5jLfG/sAyZBjhUg
	2i7mxQ/CeVBB1SK9yB5PfAJokbJXwkPJMqgcFYQXCvQjBrjo7bvW4q/15gRUyYam5kGDo9qY3kg
	bAm2RqGppmcjpwE/etzelCk7TnnpltoL5Uc4KaZTQHxY8k+Br5Z5EQ056N+rfTPgI9TtF1Jhb9o
	Bg4sQNbS9SB61m5iIqRoZPu65nLte9tcxiKfhZnBpaELpoQ==
X-Received: by 2002:a05:622a:18a4:b0:509:219f:8e34 with SMTP id d75a77b69052e-516d43254b8mr133364941cf.0.1779715350095;
        Mon, 25 May 2026 06:22:30 -0700 (PDT)
X-Received: by 2002:a05:622a:18a4:b0:509:219f:8e34 with SMTP id d75a77b69052e-516d43254b8mr133364441cf.0.1779715349591;
        Mon, 25 May 2026 06:22:29 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd50sm391861766b.4.2026.05.25.06.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 06:22:28 -0700 (PDT)
Message-ID: <0da2d0f1-ce71-4079-8011-cfa501fcd8cd@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:22:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add Display Port audio on Arduino Monza
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
References: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzNyBTYWx0ZWRfX7N41BMvKqPzL
 bMAIeIMEfiNN2qgbPWZiwIVjbUusK30Crk0IPBosfyBcHr50ODTPIz4+AdH6dZTm/QoSPQuhAtD
 dRWyzwyB7fbP0g1UPCkMwAYxaiBuUfIdXAL5DHk36VTORJaqWwbHpCyrCNPX01kbzxyyQJVddR7
 PKQkU6OoopSVz5w0Nhrluf8f9ydAmE+G4FKco4jELJMkl2gC4454oz8fVe26yn3ASlk0FT7dd5V
 0spEDWG3OvSR0amphKBCO9k98wnZXWO38jEX/cTsN/PyP/4u7UX2lvItuDFeX5ujgzIwO4jrESJ
 /5qjcISSP+Xjl7fUiHe1wAkgibo4ue3BePvvg6T6oJNXdq+Lkuqpd8xIr7asce6BiTmv5mtx4LO
 sJq/Hmc9L6+1Xsenv7Rkws6pDVSkGFG0BCqGiYVbq1wKKrU0sXWDVNwSzotPyd+GgBhIaICrKtV
 qpGAEW4WE1azxKAXP1g==
X-Proofpoint-GUID: EzbllxS9RKPXKdlLcEWBA1A_SacMEEHb
X-Proofpoint-ORIG-GUID: EzbllxS9RKPXKdlLcEWBA1A_SacMEEHb
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a144d16 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=j4Rdc6PrbeIUoIXUaQYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250137
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109664-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8B2FB5CB0BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 12:00 PM, Srinivas Kandagatla wrote:
> Add support for Display port Audio on Arduino VENTUNO-Q board.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> CC: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

