Return-Path: <linux-arm-msm+bounces-92684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO4HL+C9jWnL6QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:47:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E812D25A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA02830DA8E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDC034FF57;
	Thu, 12 Feb 2026 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGWlhgL3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BamOLR+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FAC34EEF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896795; cv=none; b=J7Gss6pHH10/5ZYKaCJd+paZHiW9Hu4wW9a+TaFLq26uHGv8ziLPaSTrhmOB8fADSNlrORxHQJNeBypxjPIyv6p8cKgrZhJYcsPpqvChO8DTbQEJigcSPvE/42RCKJTYO0TnWMOkCXz7nlSHDDkhquR4tAW06ofUCSERHNnZDKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896795; c=relaxed/simple;
	bh=602jFy6coVafTb/vn1a1ZEWgeZBgaljvs2qNyXb1SPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7qrYIu5XdtK/y0U8QBIi/nuh1EmZgDihTMB85cMjX1bs7Ai32DQ+0fvWbpp2+USxDbYiMNTkmYkkxxr04e0PHwi8t6XITKHNF8H4WS1OMV3KOZ6m4z6/aaycHy7vEsEXVdHtUDkgYjjFVrczu6yyf5nOts50lBn7uYvrXgjCog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGWlhgL3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BamOLR+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAGFpU4112091
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	679b3bTwRCV6P+hG8B3eIy5AmvUKTpMaKAMYdenGuEg=; b=SGWlhgL3W5roWxHr
	aLW5/9Im6Ujakr9JxTCwcp6tHd1X+Ans6pJoq4kBCAobvkHI6EZP9C86yf4XjvXT
	GWUduG1KMv6MANiBng3Q5d9nsTo6NBs7J6oX87Pd3dzqRcbVmPluCQV5OgZrVkPK
	b52sIDAN5tFoOyPMQzGkFRRqdojl8j+AUXsAd0qiWpKUvyFPWXvLjvG1RhxLpqPU
	ABuBq1fKgEbD7dnSHdiYlJzmMke0B5gfbeHUrv3QxFdchkkE9nM/SXXWf5Za6hx7
	KlZhDLegRMmkmntZsz6DQw5VpIHHSbUTJd8QLiolFnFKuZRJAEqEPOOKZjlWwhDp
	wFH3Yg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cya88ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:46:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52de12a65so150175785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770896785; x=1771501585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=679b3bTwRCV6P+hG8B3eIy5AmvUKTpMaKAMYdenGuEg=;
        b=BamOLR+Tbp2pGJW04556TH1h+XPnrg3FcExpuTMud0snlHLhOqer2P0cz9VyIidSNl
         lS/9v6Ty/8GIcE0Uie2QMHFBzUwGBMKNBqjLcXDYzLImvdbA8Ef7R0x1g6SbFexbql8f
         FXMpJrCzLtBzwKTLzmobbDR+XyVfg0Y4qgEzcMWla+zor342jQApyDK6z/mLPiFSn51v
         LUTM5jxyRmidcSqYKKQgZTuKr0XmVYdGi2lub3tXqn0scCcKDJrANV14ekC1lUJrZr25
         cLdUfxU8lAusqEqN+oiogQSKDEDMbrwDfo27LA8j4+HLFs3EpOTqDvQp82kEGEpO2EMY
         STzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896785; x=1771501585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=679b3bTwRCV6P+hG8B3eIy5AmvUKTpMaKAMYdenGuEg=;
        b=kZI9or9fcZeP4ZH5xMCwSOdsz5IDkdMFlH96J6EyMt/vT3K7ZjdqBkU0dBe6bLj/R+
         lEiR9993HQxah55E1kUA/mTm3Wi7h87gzSaDcrZ4H9/2sxAfwJzlG2Wf370XUul+DwdA
         6xEyt0DXpd1rDNdMBdgQZA65Kz43eg2UpI7OjoICyW5xFbBlGjhIMEBtwcXOs+7+V5x5
         d0mLbNzljm+8NhnhJY2H9qZsZak5Q4QIoLaoK1ba3st/nCAO9vtr/Lrsv1A5xpGfy/21
         piViNKBCFTqvbH0fu+sUHXF1y0flvqSnEYcwWoGZf9YG5yErrdPisCvCwdX/oFysuq72
         UPfw==
X-Gm-Message-State: AOJu0YxWpbukJcioOVovyPSTtUqnZ9oGCPuwZouP3rh6bXke7wb9xDk4
	6FzWzPqH0N+1deOTIO/ZBLGUmwcScitPC1Kmd9pkRjC+5sF0r1EaF2ttdM1tOXeYcQAuxnoI4A2
	WfQUHteH1bdqMV1DyYXn9k8YnbYEyWowfMn9ZS1YLDpiFA09zCjFB6byhMeUjWqWTXY+s
X-Gm-Gg: AZuq6aK7XvicZCS+lTggqSvRHZuPyuEFAwv+YJIwhklbz86M77mu+xQz62TV8BTqn7X
	e641Ng3E8JrkHYOqxanV/5Mrg1ULLVQQUsQEFcRYNKKGMFDhYKTDrCkUi7hAmi+lnjpAl+mm1rg
	Bk2JOQz455uTy44WAEQ+zaRbG+J0GOsJz8hrE6my6sIP02KmWVROC9xfILHuK+jxoeKWHZ3CBuX
	YJ5H6eY29eofb1ZKpe0x1WnxWHt1KuJNloNY9WrYh1rsgOFc2Bkx3mC4kKBUElXD6+D6dNIqQ/v
	cTO/TU0C/NnmFM+2tWyPyaKnxryV0LpdjJ5penClwB7ndUn5dhnPGEMsbmpnSxeAG5jrh/H0s8X
	wIMOpLcIK0W9N/ZY+yAp+OQxboWDHz6NlHGhFiuClwqVZr8eZTUxuIOcm+aKzNn0mm5EECPe0jR
	QMMWw=
X-Received: by 2002:a05:620a:370c:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8cb330bbca5mr242423485a.5.1770896785005;
        Thu, 12 Feb 2026 03:46:25 -0800 (PST)
X-Received: by 2002:a05:620a:370c:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8cb330bbca5mr242422485a.5.1770896784583;
        Thu, 12 Feb 2026 03:46:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f708e25dasm146980766b.4.2026.02.12.03.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 03:46:23 -0800 (PST)
Message-ID: <97af21d5-7457-4dc1-bd47-2e34e6df094e@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 12:46:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for
 PCIe1
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
 <20260212-industrial-mezzanine-pcie-v3-2-1e152937a76a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212-industrial-mezzanine-pcie-v3-2-1e152937a76a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2bgEOwfn-_cmCjInDagW69_3V3YXooxb
X-Authority-Analysis: v=2.4 cv=OrBCCi/t c=1 sm=1 tr=0 ts=698dbd91 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=0eh1lDOh_YGwDaDwIBMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2bgEOwfn-_cmCjInDagW69_3V3YXooxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4OCBTYWx0ZWRfXwAI2KnToTgWU
 E56pWKyp7B1LtV4IdXhTaWdookGrOTr7zj7dApXJBlJcwTK9FNsHnOLzDu8j2cLXD15lRyy1/u4
 1hbYwsfCUb0xGiP0JE1UmMXrQa/JpLAMWrdWfr98OUlOckY8wJea7jB/NgK9cZnkfJ/+tZzJ0Yq
 wDS4rqp914TUVsXgRAgNb6Ifv485JbRPt1lb/gdK5Spx2GZVaZ6YgtxYkaA6I0r4tZ+UEk3f2vu
 IXjzi7695XcI41S2LICB4MT4wSoJAPRpMZs1HRdO2CfX27BQfW2zPir1IolgP29rXNM80HzP8Dh
 JbsqZ7VHFGrh4MZvj0Zl9xMixg+N1/nUH+THMOzBeVblbgi9B7vn4KkecJnD+ELPQQhhoPiKqNa
 sb+4HVF5bpYj3rrL+6IFEu3POIKN6Jo2ut4mtl7GRgsXzbv4MauriwE0pUxVsLKH+hi2LYmHFs8
 u4Dr8uUh+AWKQmwYM2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92684-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C4E812D25A
X-Rspamd-Action: no action

On 2/12/26 11:44 AM, Sushrut Shree Trivedi wrote:
> Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
> in cascade to the first TC9563 switch via the former's downstream port.
> 
> Two embedded Ethernet devices are present on one of the downstream
> ports of this second switch as well. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> The second TC9563 is powered up via the same LDO regulators as the first
> one, and these can be controlled via two GPIOs, which are already present
> as fixed regulators. This TC9563 can also be configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---

> +&pcie1 {
> +	iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> +		    <0x100 &apps_smmu 0x1c81 0x1>,
> +		    <0x208 &apps_smmu 0x1c84 0x1>,
> +		    <0x210 &apps_smmu 0x1c85 0x1>,
> +		    <0x218 &apps_smmu 0x1c86 0x1>,
> +		    <0x300 &apps_smmu 0x1c87 0x1>,
> +		    <0x408 &apps_smmu 0x1c90 0x1>,
> +		    <0x410 &apps_smmu 0x1c91 0x1>,
> +		    <0x418 &apps_smmu 0x1c92 0x1>,
> +		    <0x500 &apps_smmu 0x1c93 0x1>,
> +		    <0x600 &apps_smmu 0x1c94 0x1>,
> +		    <0x700 &apps_smmu 0x1c95 0x1>,
> +		    <0x701 &apps_smmu 0x1c96 0x1>,
> +		    <0x800 &apps_smmu 0x1c97 0x1>,
> +		    <0x900 &apps_smmu 0x1c98 0x1>,
> +		    <0x901 &apps_smmu 0x1c99 0x1>;

This map is not just an extension of the existing one - is that
intentional?

Konrad

