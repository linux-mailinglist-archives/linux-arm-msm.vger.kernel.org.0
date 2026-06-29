Return-Path: <linux-arm-msm+bounces-115180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2YzdLHiHQmre9AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:55:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 125166DC572
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:55:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q8uKzxwA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V2oU69QR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115180-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115180-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84CFD305B738
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3B842317A;
	Mon, 29 Jun 2026 14:48:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E444D41C31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744529; cv=none; b=E9nzT+wTp/ZkNKzsVM4Lg+5kLvYglaIlSqLq6wPppsFa2aT+VmtEn4PUfThRTLfCf6T7EsI9aH+aYd/U2B925L0z8M4asBIOaeoAZkkNYkHw/ByFWqMhCQoF1ZTa964ov5aiFAwFLmQFQmrOYklim8rRIvCob/PNWf2Quv0xASs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744529; c=relaxed/simple;
	bh=Cs3QIOvflvCrcjeDTiLoWqYrAKt3UNUaD/sCKGjx5v0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nFK5y4A5QPXGaYePGXZjjZgTJ4UUkJFmatEatsf6E/v6fIn3pOq5ZLNXhV2zmxMstdkLV/GrxXbrLIgem/KxdyTzZ4useTr60x3+cLl54d5kLUsam1SHEvFSeAaEYA6aecaC4IOqeuNrdFGdoXBYu3+v9VGIUjz5JUz3YfcUv7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8uKzxwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2oU69QR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASqss2601127
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYQHKrNAuY55Xo4YAYBwK1+PtQbR+3tl/cQx6YHt1j8=; b=Q8uKzxwAGrj09eX3
	D+NNartPaUyAzBh5IHVLtFMjezGieFgm4Verrsr/aMCI6Y6+2pcf8wno4/4DMoXC
	mD+nmnJZ1OMiV2XKq89idAsYnHBQy3D1oj4/OcIojM4o6od3J9HE7V1tiSFYRQvs
	PcVpwGspfgoOHaVUpwTPLHsoBQmw5aQcT61ggtU2K9xS99hUBl+8YOU48Q9T6IBl
	D25ppjDmYO2N++SwQVYk/UZYGKz3bl+ZU2I75Hpt3ZAmNrBVFFlUuVAguC5rBsoy
	qw9DVI/v5M7OV6dKmCMMKX5E5Zh3Ib7yK9MhRMzD2GEYkLACbu7SE3WQbAcI7CXw
	5s3UbA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw9d57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:48:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so15210434eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744526; x=1783349326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYQHKrNAuY55Xo4YAYBwK1+PtQbR+3tl/cQx6YHt1j8=;
        b=V2oU69QR46b7W/MPkpR9Z1IQv5HJHd9ExoudYxfoQRWlciGf8ZBvV/I+RbhAsuh9XS
         MwYARaPyqrIdjsoW+PcpYZBeM3nTFfEKCVdWS4mvS+3jQQ7eQ3qVN14hquumPMbXwD4K
         Ubvbua+qpARVl2k/smA9IMbmW2wYtZjMv16k3pF1CfXrQ1pv3RZiLL91ZQNUEyHw9ZKM
         gJYerim57KEDLvzd/UciY0kkY266mnYeT4bLL1EXUtVHWCJEo7o+sN0RQWnAl7nxC4HJ
         552579Fb/OIdTS9rLVUr5dmD1rCRNw2QOK3faaOXhv4ySW2JmeS4txir1Yb2G1Cm4wI1
         gkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744526; x=1783349326;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYQHKrNAuY55Xo4YAYBwK1+PtQbR+3tl/cQx6YHt1j8=;
        b=k/xMZhvzHv5/qatkkiurWC15d/CaZe4iecjSXEojumMoyngpCx8L1zzYBPK9lbIiRQ
         LUwUbmgo7+60i4Q544xqS6RjBYg0j+M4FeNgpF2QkqHF/eyotDG+8SAkid8xHOubBx+U
         w0ESOe4kzmw96awekJWkoF8gamrC3vWtcuXW8bUFh2FcAlrfm6UawYWYMF10IyHKiuHs
         AnHdkhhNOyP66Xyv1wAEvw6MuxvnIcXAk/etUnXKBFhTUpQUKCdPpNz4ZXT+Jl344ItA
         vwsehpNFao/vtXnHlJ4Rehw88AQQ5nMxpx8b/+t2Hy2ZTw5Lb0uLaTeUEEsg4FNNW7pW
         jW+g==
X-Gm-Message-State: AOJu0Yxur49M7XikzhSfUU90jdjZDgDe80h5nPfPxbmDkZsMjir8ATQ+
	8yz4G9s8FTefhJjgdjR4Eb5Z5N+zuWh5G59hahS438cqVLLrXeIlAmcDJQdW1nJGqsx7eRT1c1f
	V1rX+MY+ZaI7TbX9vC3bC7ub9TrEgHl0ndpp6imM9HN1lHwwPkq/s/9Wo0vYjXSxVya8M
X-Gm-Gg: AfdE7ckiXcOhVviSCXBaE4ON8SPaS6hzH1kiUvu0J28XQDVLVdg3VSIn/A2CS7blsV7
	T23wMef0fTdY/F+vxWF8XFw3NeAhm6HmP2dzUELJ4cNT//yo0I9qzl+H1a32z6ztmMY9An7QnY/
	SNlzaUEGFMFeKgiPHcSGe5p14UGZwuzTfYdEobNc08AQzTIYZRhaQ+mF3Z4/0HNOihrQZ8LmvOT
	mQWGgZ7aDv760v9833R1vewUQwv8fkOXFnqsKv/xBw45nx65SOUxxmBoICf1XXyLOCCg25q6VDL
	qOJNRpCAL5KyGjSxb5mtsc5tlPLtYYMRZ2DVk/JbXXZX1hCp9n06+bivEigwAw099T5aktJPgyP
	JkmnmceFqHUr3luPWWIaemN/Ig2SXkKJxQtCrq00UoDLpamR8N7moOqEmq0lmU4400irxe3evH8
	gNLzc=
X-Received: by 2002:a05:7300:2316:b0:30e:952b:ddf4 with SMTP id 5a478bee46e88-30edd1ae37emr686685eec.3.1782744525285;
        Mon, 29 Jun 2026 07:48:45 -0700 (PDT)
X-Received: by 2002:a05:7300:2316:b0:30e:952b:ddf4 with SMTP id 5a478bee46e88-30edd1ae37emr686667eec.3.1782744524668;
        Mon, 29 Jun 2026 07:48:44 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:853f:f554:7d46:88f4? ([2603:8001:7f00:fc12:853f:f554:7d46:88f4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm54673511eec.16.2026.06.29.07.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:48:44 -0700 (PDT)
Message-ID: <35348aa8-f878-4ee7-bb96-a1d9203bca4f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 07:48:42 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXw4yjnlcfQy2G
 dZPFc2ERo5EZKeOgLVqYXk02hH1AlKWEcpb6jStaCX8I2eQAZEW+I5pKWFm2UFijO2SpmjdKsyJ
 ihyJTEN1oS5mZoXf48cxydIuH2SVD3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfX7/Q97MhvGSXX
 N1Au3OweTvw5bbNWz8NT25Oa41qcegm9Ws4CFhA6I5tHQSao7SZRTpohtLTw+demjFFuw7Lc/kU
 G5V2QPNbHT12YGcMIM/CpQEMHzB81UICDvm/WlR8e64lEwZLwVPJ2vzHOR8TTkTxxlP2PmWuF4Y
 8/dY/CXI0kgNKct6HeAeXd4kkMfdNWm9VjqwSlyjU+E53gNudQJ7MH3FWU3RpH3SVJat+MmTGpk
 U85/fkb833WJula0U5LfTR67QK96ItlsOD3Id3jfV1XkXyE8HpWhSfJ/4EDopUNZAE1/yqTU95N
 4GOejoZ96HKpZFPSQn5iTegITX1SiYQzPlYGpH+fTYsg15374ydHJkKXl7THqhQIGpevz4OZ4zn
 hdiQAkEcK/9UKoytVsAStBwWiLFGIIHleLiydDaOkVotoiZe/CqRZtHYR9G1nKwb43X7V+JWsDN
 uJCRhcVM8aajz9rpyfw==
X-Proofpoint-GUID: eHAihkU9Ytg2EPn_tPkjXdrw2qxTmFpj
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a4285ce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=oEN8I4j559GpTlrCs2sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eHAihkU9Ytg2EPn_tPkjXdrw2qxTmFpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115180-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:url,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 125166DC572



On 5/1/2026 10:06 AM, Elson Serrao wrote:
> Note: This v4 revision introduces a design change compared to v3.
> Based on discussion and feedback, the binding adopts a child-node-based
> model while preserving the legacy top-level 'ports' property. The
> child-node approach is required because EUD needs a separate OF graph
> per UTMI path to accurately describe per-path role switching.
> 
> Link to the discussion leading to this decision:
> https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> 


Hi Dmitry,

Just following up on this series.

Could you please take a look at the updated design and share
your feedback? Does it align with what we discussed earlier:
https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/

Please let me know if any further changes are needed.

Thanks,
Elson


> ---
> 
> The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
> provides debug and trace capabilities on Qualcomm platforms. The current
> EUD driver, however, lacks essential hardware resources such as PHY
> references and support for multi-port configurations. This series
> addresses those gaps and introduces the necessary device tree updates
> to enable testing and validation of the enhanced functionality.
> 
> Below is a high-level block diagram showing the EUD and its connections.
> 
> 
> 			              EUD Block
>  	                   +------------------------------+  
> 			   |                              |
> [Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
> 			   |                              |  
> [Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
> 			   |                              |
> 			   |      +------------------+    |
> 			   |      |  EUD Debug Hub   |    |
> 			   |      +------------------+    |
> 			   +------------------------------+
> 
> This work builds upon an earlier EUD driver submission:
> https://lore.kernel.org/all/20240730222439.3469-1-quic_eserrao@quicinc.com/
> and extends it with support for multi-port use cases and proper handling
> of EUD operation across different USB roles.
> 
> The series has been validated on the Qualcomm Dragonwing Q6 platform
> (RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> ---
> Changes in v4:
> - [Patch 0001] Restructure the flattened ports representation to a child-node
>   based model.
>   - Preserve the top-level 'ports' property and add per-path child nodes,
>     so that each role-switch path is described using its own OF graph.
>     (Dmitry).
>   - Link to the discussion leading to this design decision:
>     https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> - [Patch 0002] Use explicit port names when selecting the active EUD
>   port (Greg)
> - [Patch 0003] Use a scoped iterator when looping over child nodes and
>   drop redundant EUD path validation checks (Konrad). Preserve support
>   for the legacy top-level ports description.
> - [Patch 0004] Register role switch per path and forward the role switch
>   notifications to the USB controller.
> - [Patch 0006]  Add host mode co-ordination based on the role changes as
>   per the new design and drop the custom API that was used to get role
>   notifications.
> - [Patch 0008] Described the UTMI path as a child node with role switch
>   capability.
> - Link to v3: https://lore.kernel.org/all/20260309203337.803986-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in RFC v3:
> - Replaced the per-path (eud-path@N) model with a flattened ports
>   representation based on the feedback.
> - Added port@2 and port@3 to support dual-port configurations.
> - Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
>   and role-switch information is obtained from walking the OF graph.
> - Updated PHY discovery logic by fetching the PHY from the controller
>   node/fwnode, and exported a new API for the controller to report role
>   changes. The dwc3-qcom driver now uses this API to notify EUD on role
>   transitions.
> - Updated the DTS structure by moving the EUD-to-controller port mapping
>   into the base SoC DTSI, enabling EUD by default, and adjusting all board
>   DTS files accordingly, including adding the usb-role-switch provider
>   link on connector nodes.
> - Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in v2:
> - Improved commit message of patch 0001 and 0003 with historical context
>   on why EUD worked without PHY references on single-path systems.
>   Expanded the usb-role-switch property description in the bindings file.
> - Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
> ---
> 
> Elson Serrao (9):
>   dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
>   usb: misc: qcom_eud: add sysfs attribute for port selection
>   usb: misc: qcom_eud: add per-path High-Speed PHY control
>   usb: misc: qcom_eud: add per-path role switch support
>   usb: misc: qcom_eud: improve enable_store API
>   usb: misc: qcom_eud: add host mode coordination
>   usb: misc: qcom_eud: fix virtual attach/detach event handling
>   arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
>   arm64: dts: qcom: Map USB connector to EUD on Kodiak boards
> 
>  Documentation/ABI/testing/sysfs-driver-eud    |  16 +
>  .../bindings/soc/qcom/qcom,eud.yaml           |  55 ++-
>  arch/arm64/boot/dts/qcom/kodiak.dtsi          |  35 +-
>  .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
>  .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
>  .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
>  .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
>  drivers/usb/misc/qcom_eud.c                   | 346 ++++++++++++++++--
>  10 files changed, 446 insertions(+), 66 deletions(-)
> 

