Return-Path: <linux-arm-msm+bounces-100307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMVBMSqDxmlALQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:16:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22307344F72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B509030CDC2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB493E717B;
	Fri, 27 Mar 2026 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzWBbzOT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alJLEtac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E498B3E6392
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617058; cv=none; b=gBbVm6zb9O9+fk9lQeWMMqqDCXQtFrmcHHa8rmuHvSAUEqGNE9SA23vcD/T9gC9l6uMq/tc6w1yKr5HDdFdu9rRY3vR1H8b3t9wEVUI/e6X+1fdsukRVkiQOpmW/ozTOBWDy8DKcdSmvEzhzvT0HmBrlYSRVFM1Vi5dUZUN1i9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617058; c=relaxed/simple;
	bh=LigFB/scvWWENXb+KaifkLcfV6EItrzBxx7szDEfxwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrEAfz6ZzqTKOd8jby44AqLZ8Sv4u2woyO41ctELqCTcKR4/SEFAwZOvxGHjnVWEbcE6hKj0D0CLRZVvIvly+ADhHJY7gjkDpOlD3fBgOcsDj6I3s7qDKgKYnSe1wtETibwEH+sdYCYUELp2h3KOwSV6NCuAThhLPz/PGJW9nNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzWBbzOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alJLEtac; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCTaIM1860237
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FoyA/Fbh9rg+dHoluYs9pk0obdjMHMIWnjo6UCQHNr8=; b=ZzWBbzOTYwpsMOyI
	9uFmBs/cWngrz1VX2n10hVXRaVmuTgF8SXJnUrwqWcluDNpkCr5LiKVX4/fe0srM
	UQcabDvHbb1IRCO2u88+eANTSnPtKpGZygEjjxY9SpA//N0fLJKrwdjnKb1/lFBJ
	3GHYLOIqKfK9nmMQ7RhdKiZCXxNMalxrm3lF11/kiF8AyGEAJVMx/cJ30ok3jAyA
	YKXNZ2exmYp+L4zjk5trVUIwGUkdZKcJszul+K9ZBjzfc28qIW4bk7zO2yxRXRGQ
	PoiHOoJHqmzuuSz+Cqdwh6EGdL/gxw2fd8Zp4uF25BU0bnjGotZmN8fKOJSP0hRs
	JwYvJA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv34ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:10:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a081737bbso9000726d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 06:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774617055; x=1775221855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FoyA/Fbh9rg+dHoluYs9pk0obdjMHMIWnjo6UCQHNr8=;
        b=alJLEtacjc2mhh0ZWuCUwViHHUDlQmyVd9BiyDPAM/HXDQ0jNzPqcy3KdJGGAsEzvR
         itLha5e6tzuOmsqqGfsGa7t4B1b3OC9OeaaMkkSCfgfMPApQL1q33ZFSLgVdemFLPhqU
         rlhiB+Y6X6KvqmJ8ntCbc/RkGaZ+bMHNiSvzfktfKTTvX3quYy6ATxw97KmMTJR9Ffsv
         o6zeUC026lAzDHyPxwmyWR2utNq8C1Jgm+LfmfM3BYPwot/aLFYuurExsh6+ZgUBsXiR
         Iue4IDUDm0dNo2fgcYc7AQrygvRwNEbQnRRjLCSB19Mbzs0Eore+mLNg+OMoE0r3x5fS
         x0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617055; x=1775221855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoyA/Fbh9rg+dHoluYs9pk0obdjMHMIWnjo6UCQHNr8=;
        b=Uds3f9lRsXu0efPrGc+zbYsYkHy647DavfVhlIPBcQxUZUegD5yLgX7CZ4ygG0ZLts
         3tc23wWtVcEnpvmw+uFwIAYIdD/TCngD8CQhTHQdfTS/blD3E/AzODQBnDAoQGmCt2lk
         E7UDqR9piEvcV2m8p43iQtqJF57ItJTyrkd9tlhHHpZXR9kTUiXsUOVKZSwE58Xs09U0
         k6CrzdZxtFqTFvDsGMsAedJhU+e7DR1UyVe/L8MT54B7nO6DhAzbIUB9dvMraHUAzZy3
         3uODtrosmwNCVGQcJB1R8RC4av4vuQCxm4pb98xUrvV2LXTwJPLarP5UaKyEdQjTGSBB
         fJYg==
X-Gm-Message-State: AOJu0YyjoMW5qMsJlG2atpVQcWk1IQ7aG+oA7WtEZ76PdUxpw5YHQFMa
	xByowcC71a+GF9q0uLus7ZivNCyeBAR3QG68Z7Im43Qu/B/H73CPIfuA6PU/S+Nm1umIukkeMyG
	fz+TQfPHmqz4sGJyA0cY6PNJcHvZd0sTic9tmr1p6vIHeFxdl5uBDDJl4PBPqYZSpBLu4
X-Gm-Gg: ATEYQzxW8fpBzClvJPoCwuG5ZRab5Ai5OxB2RAs/8FHn5pMJnEyt39DFGnNnlgICnO0
	1Cy0vd/Fy62974JBu7lhYZ/KckXH4wCf46PhEsxF0ivkH9N0UjjbKGGmLfEF9Nr3PU+EobFTudK
	lYadpY+A6lv6jT8xqdmarSWgJf0Pj8NE9MVfvGfXiL6zwv5vAkrNKkZHnPeaiA4DYbFvCDX9mIU
	d7MUS0wEYsCOxGmPN7ZgDMxC+FwQaHgPkGsIRk4RHfzC5ra/8rgaS/v2smDGJ2OAUQOWMbAjudb
	z35n4z7nvv8RvqXLBXB0T8/mr1cJw+OfHFCW+P0EyYPDg7REKYvo8trxyJYuNjzMKQ+viy04FcO
	0TKOsjofgb58KsRGAEKby2j2UdRSpLd2nPEOnFzICLm54PYometuvlXOIXPnq1Ex893Be2Eef9n
	bo6ac=
X-Received: by 2002:a05:6214:501e:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89ce8f10968mr23714906d6.3.1774617055164;
        Fri, 27 Mar 2026 06:10:55 -0700 (PDT)
X-Received: by 2002:a05:6214:501e:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89ce8f10968mr23714486d6.3.1774617054657;
        Fri, 27 Mar 2026 06:10:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c2225sm243173766b.37.2026.03.27.06.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 06:10:53 -0700 (PDT)
Message-ID: <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:10:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c681e0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=W7QrHvp7LSfZ9ocHNjUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: cTBjXAA14orR5DEZHhNaCjEgXuJ91nyg
X-Proofpoint-GUID: cTBjXAA14orR5DEZHhNaCjEgXuJ91nyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5MCBTYWx0ZWRfX58P5Ule6AREx
 Q4dcJ7CMdTVQT/ULIlAQ2i2lxj9Ae1F9ex8O9Ybo07hZo0rv3wyN8H50I0LMsXNNY9aDFFv1Sf8
 wakAwnw6uQadcswtSGfumlrcpV0Acpvl2GzKWVtTOl4z8RNjXU3usJAozr/GdXj1tqDQSWxcsHy
 pe0IupglqKzf6K4Nzv/6pWyiOpiz0ipLPwMc3z+5P9SnCfPBhQ5S2KzkwihixV77ugM2A8sutYU
 jvqbK4h8XTqgoOOHx9smy2XNNMV+XqGNBOuEzRNmm3tCX2DfyKB8DBEIRIJXwy2Va1GXzox0dkh
 lhwxfOaEwONYH3GcpM+B68OGqNNyV665ZPNEMbNhPxwGz3CC35lhP1ZULEzOL06hwzZrJwmE9zI
 +YQwq5Yo+kg4dMgnhZt50K+nk3JUdMFOIRVlGCwFNz/LARPRhqaCJvL40qrCcHrQE20oyceywjz
 hWau/nIoi/xPsvJd98A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100307-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.5:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22307344F72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
> For some reason we ended up adding only 4 out of 11 compute cb's for
> CDSP, add the missing compute cb. This will also improve the end
> user-experience by enabling running multiple AI usecases in parallel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 10e799dd4a78..38fbd44c7d8f 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -7739,6 +7739,55 @@ compute-cb@4 {
>  							 <&apps_smmu 0x1964 0x0400>;
>  						dma-coherent;
>  					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x19c5 0x0400>;

I see that the other CBs have 2 iommu streams, the other one
having "DMA" in the name - could you shed some light on that?

Konrad

