Return-Path: <linux-arm-msm+bounces-108140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHLFHI/WCmq78gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:06:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6F456956E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE932301EB7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CD83E7174;
	Mon, 18 May 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nU6CK/r3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijCd6pEe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C048D3E63BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095059; cv=none; b=NqRP8gl/TxQzFPsZVxp2eMNEHoHnDjhQTXSmHoblhaYkhRLyBPJ91deNDGIZirrQefNtSbWZuaYss8SYkzbrKCaEPZbma9idnkzFau0vIl/mcMQDLs8UoPGVP5gIMlfb7u1dosKbPmm1fRIFZwDKYxpNXyxDd6aaoH/by0cpKs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095059; c=relaxed/simple;
	bh=0rroTxSIhJRlFSMdde+csAe/MAZIchnUoyYhy0oc//0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRVkUVLG6qVEpFeF/Id1vI0+Hr/DrpzQUM13aXB1bKpsj5CdYi1FH7QMc7v27QAZ1zGqApmZkiqctK12rXHK8KLO/LfzL4mFMWPooLMAjdK+wBLC5EAxBjZZmnXRsZRqWg0Jux+r2RZB2cFZtKythcd0UE4Sz67gLqcAjX8RSSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nU6CK/r3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijCd6pEe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I868QF2343774
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uW6M08hd/qMGhs97ve0wfXDkuHjsj5GTkJq0CacMeNI=; b=nU6CK/r39qv+phuV
	EdrsrZcaia/ygVUH5j8RYZ/8V/W9wP9JlTpa7qCmGjCJNo6HliGo3LO0lvzlpc29
	BRo9imEE3ZdMgrIcc1oxg6FjREmCrc7E6FtArDNn9Pu11PxZjnPF7vyg0hljrqFb
	VgvMDz3TQt+xImTX/HgJ/m/ybWMHb3ExTjde6yfsV6bv29qa16LkJsrXDwGm3AhG
	GudBDnjV3xO1e6BkH1tRXL5zehxs+s50eCtD6086epLO2whg5pvxh8w8vBZgerGk
	XAdWvxtKRruJYjvcT19n0N3osz70gb85LBR0AKISq2ScJ3mMCPjbU2U9nQu+xkax
	AM4jMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6wkqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:04:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e429ba4dfso6607421cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779095056; x=1779699856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uW6M08hd/qMGhs97ve0wfXDkuHjsj5GTkJq0CacMeNI=;
        b=ijCd6pEelNK6zAo7GeAfpoFNgx+DMd6JhmUsBv1fUecR4E298KwFEcRnxCRm8DJvkf
         xMrFb6M75gtKwzYfNGTI68GGOaYpR+BG103w4uG2DjLN3ArGHOiMeknKEPV2YPDVFU3A
         FziWYsWHWldoMiw3Fpmu3P1QNlZgnjw4a65byocQxUYOdRsG/Gz0SmUTKdKmkF4CO9Ib
         uEJm3FBjta+lxHYihrWdDtwhQT9j0xBEF2xRjRH0WwfRkHoDrGg6tsO9tMQ1d99bDq++
         +R7X2Js3lrp3TcUnBjKFM8Fc6vT/6mmKT8dMBZiGwv4jgfsm0CMzW0E8YjvLrXKWJJ8a
         z95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095056; x=1779699856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uW6M08hd/qMGhs97ve0wfXDkuHjsj5GTkJq0CacMeNI=;
        b=sERfSG2x48GkiMEGCIgP1aavukl8z8cNb+F4Ozot5v5RmxcEp4sBB1DhhwpF5PPLeH
         HOrn/SvVywUMc2DdBRx0WtT4BSbDNmtX66fDmHDM6NI2bfHMN7ZyC7n6Xb7FyBhOLnQk
         mpGDfuH8R98fmfr2K1i6CXqldUttGVid0Yo5pkGDJRuweh6D+ZBQ5v50YUvf5eqnVE+K
         cLKLcUmjb8Re9WP9Br9AJ3Yps9KD8JQeuaGI8eLf1bUb48Ksor3ZuOiePF6+AhHlbfbc
         GuxJK5g0WlM+Ed2Jfwqf8vTbfcSIYrsOJQeEGF36e0QYzFyg4Ab0OkQGXzf5F/y8N3i1
         iOFg==
X-Forwarded-Encrypted: i=1; AFNElJ/2Z9fP1tQ+93Z90o20rYxGh39PCr5HMWAB3w6grBlvfda1vInJeDP/dyiZd7l9fmwKVkae/IdB+afJ3jku@vger.kernel.org
X-Gm-Message-State: AOJu0YymnLSq+rGvcLAfwG4bqmJX2isdNqnd/U7WqohV2YuXTC3g1s54
	kQ3o+m1aZ2SfConQqyfAFMNzBfsQBnaJmP+19MnGZtVkvtLoZxc68rKqPgOTv7EDOu/lB604yZL
	/QT87aHhEdvas5/cMDjacAdJ2iiV6CvcN6H+NCItw1mBJNLjvyUo0k5P8brJZ115rwKSQ
X-Gm-Gg: Acq92OF6yGOSlcGRUIB3tiKK0ruFwvagUltw/YhD7rbOz5BLSKsSqHwBq+1JPsGn/Qs
	th4hei4j+QUvzirS9I8lvF+9fWMFSVJJsV3kRdVfEQ2YAce3jxFpGfKhwStwSgjiP0Ur4CBDqvr
	Nbh2XKD9dhmHSadM0qgT32eBAKQSQiZ01g1A+Bd59Gc0sfuLMcmjDslQiapnXmScKuEUzOVj4Re
	wwuiIMR7MVFqUZ1cnbj/3r6mGMNYjmE0UFQ/RWaRqukRhP+0W4KWKX90eDJiysyCf9bEf8cZPKP
	qMPqgDt+1hmf5uvSJTTCRd20W4PRtfCiLF9g/zpW+Ynca/C/iHTsHekjOOusv6mXhXk3qKQIDo/
	WrheK+V/CpvZStU8SD9qVurbCcZLZpGGrJVK9CGW7gN//+FhvwRZfVw1jLLAEEdJGiQO4k1tfsT
	zrsak=
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr137537411cf.3.1779095056013;
        Mon, 18 May 2026 02:04:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr137536931cf.3.1779095055395;
        Mon, 18 May 2026 02:04:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm542723666b.24.2026.05.18.02.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 02:04:14 -0700 (PDT)
Message-ID: <0b81b4e5-37f8-4552-8474-8aa184887d50@oss.qualcomm.com>
Date: Mon, 18 May 2026 11:04:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI
 and LLCC nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
 <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-2-5ad3da81b9d3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-2-5ad3da81b9d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7raF4NvNS8kJ98nyRXMysj-_p54WEBBt
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0ad611 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3AismlQB8zWP_hVqSwIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7raF4NvNS8kJ98nyRXMysj-_p54WEBBt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4NiBTYWx0ZWRfX5c0G6PykTdOb
 dZ2TFUh3Jc24YF4+SDDfzpzazfMo70KmvUHrzxfYItTt83VhAWMz/uslyzz1jgKzcFzZMWLx+j2
 oGDvFnRzIcUjv6zdz+ZStqYjuVt7IwoMu8HMWjLFnly5bGF8GXJbZ7bF//p4igxnfzG6/Humg8M
 6PmtCTdoHsCUNAxwbxh3IV4kOpgR6r9hUFKOfP4nOGbQfm9QSyxJGfTngIPyB5VGjzbUmocIK12
 AlHO/3iIqPdiOBq1IjqVWDy/52/qMXLDFnxsPZrM3Glp0ah6B//j3ldvT4LMKoTaHcrl/ucsWDG
 EoMprtFiuYZAfcghojZbhuXqoc4ljA1o+tYtZeGEmhAq06Xs1lECNG4UdOXPaePJ7+kIsqnOTor
 Pr9jmkVngk+9ZLZIuCqII/072b9J3sZThGn4V1nK6UpgdfgO5B1ZKD5k0rKan6PIIgZIklyUeuc
 JKozGdLO6WF665dP31Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180086
X-Rspamd-Queue-Id: EA6F456956E
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108140-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 3:22 PM, Abel Vesa wrote:
> Describe the missing Eliza SoC nodes for the QUPv3 WRAP1 and WRAP2 serial
> engines, add the matching GPI DMA controllers, the SDHCI controllers and
> the LLCC system cache controller.
> 
> Also add the TLMM pinctrl states for the QUPv3 serial engines and the
> SD card/eMMC interfaces, plus OPP tables for the SDHCI controllers.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

