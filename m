Return-Path: <linux-arm-msm+bounces-103582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH3UK3Pc4mmW/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 03:20:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523941F96C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 03:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67E193014D8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CE826B2CE;
	Sat, 18 Apr 2026 01:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eV0LHy/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KX4aWdTB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ABC3C1F
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 01:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776475245; cv=none; b=b9c9XsF+JlAmuJ0OwppD84uOfTUZhMiXnGtmpAmQgLBCV5Ra6SACCruvYnw25q857bKRuMnVOZIKkWqMZA/TvIKLo4SKkfKJclGqyk+F3wjNwfzLO/lMnS5Nlv9EC+a+qeZ0n8if3fn6TGVB0hEaMk+8TuZfWQlQKyfQF8ZclEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776475245; c=relaxed/simple;
	bh=7O8VU3Wkp0Ll6Io/oNxgeHGlwIlafNOpIPahfj5AFX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9ZbfG4rKiIZyWAl++BJJpYHZDUAamJPxkkmz9mLTJUVVqiFlgLkF1tJglnqNoLaiurLLKPvZUphkKVSZ79SUs6ES4pSKDnqs1W1D5hWlKVg/9LE9UWZf9koVNNidvVSzon2v8+UH9O4Mm7LrrEXdXCv/+iH5SeJVDxzjOOVv2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eV0LHy/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KX4aWdTB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4SfK2945225
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 01:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PuuxQyzQEh40fZ/zgKVyvnjh/htTyjAlo98pLfejys=; b=eV0LHy/VO8q9fgLy
	LmA7KKlbEEMH2LddEUcGoga7+MHvA8FSpUHV2DdeDyv3y5dWqUOIVsUJpQ3wLZi/
	ZOsLAIVu2dsdSI0BYAaC7tXK2iU1vAInr9rOktubrHZW7rPxamJtcJvzzqvqIvKN
	R7b3+Ai0spUzis2FsaFGkWB0NCho4diM7KPs2Y90AWUvxwpzrl4SIrgXTojaKOKE
	Nh/M77rI/8APbUXLfLg2LsKxol7BpUkWXnwxhNvHPdHHnLG+iPkBGx2gUJccdnSV
	7MSvzOkLmS10fZ4t2raTzQQSUJSACyTCjOntaqlhaQ9d+GQvwGX3Sl6xDhh0oDo6
	8u9Y/w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkdgy3r4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 01:20:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so1359227a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776475243; x=1777080043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/PuuxQyzQEh40fZ/zgKVyvnjh/htTyjAlo98pLfejys=;
        b=KX4aWdTBtyb8Hheta9s64KKAtbZfHY1GyjxkwNY7fg6ZtI396TJWivqm7HPzos+Qk4
         Myq77jqB6t5doJC6vr3MUZ67H+07rx6XwlnHMgGu8vPPELmD54+Stn5sCSXqlUDml3aX
         XKtfDdZFBSjOya2IdG1QRx2HRl65dAnO0mQPx1lDseH49HncxiFERkDF3aqzPUbymY9U
         g3I7x7hj0OFL5qQ1lwO5csSwzOmvirPUe201ILrs5luA7xyVOSKF4COsSy7zmHucWA2w
         YsjnFxjRap67Z6KPc1kXcMlzSgfSFkKuP7eoBnqkOyI48EHtDaKc6jBblR53BzZX3/lV
         3reA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776475243; x=1777080043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PuuxQyzQEh40fZ/zgKVyvnjh/htTyjAlo98pLfejys=;
        b=EAQTAeN81Pn7X17+6mRl9pJ/qWD6Gvyk+xqXLBzAUFYxe1E8Q0oqnUiDI0pcHRrW6y
         DXwF4R/QymeTAn0sCAFPSlr/8eCE3ZrBoPah6UhTOok5nTgeUp8H5YH7Bo1KHrOCH0w+
         NmH4+ywWt/N+IryJyKDSEQKs9nw/+UtP8D/G061uc3FCufIL0kn1DleqaC7owkpEa2gz
         QivNr3yyjeNlwBIMLG8Pnxsref5FDUGUSYmKyy2GfN84n/RDWgnpMHn4uXh8xth2SXBm
         UsE5kQmBABRbaEtUTNOC3H+YN2H1pz1+JDyaWq7CefdF90wW1Tvs/okExa7AehjchH+H
         +YrA==
X-Gm-Message-State: AOJu0YxbPJtSGDV+YJSzOgvFNlS+O1nPvmy9DO2C/9mZFfDbDFsNV5S3
	ueAuqQPVZ/zYOhjwlAnSv4Aa/L0Q96SYxS54ZSsvnOmtW6znquPD0NFKA4CbM8lgCYv8n6uHecO
	ei/TOabFlGdUJCqK6EhIghUgSDO10dMI/W8HlqbX1edj7kt5BFW7YnFFRV0SjxcumMYTB
X-Gm-Gg: AeBDieslTUL11q4rb+ykFqfa3TBrlBUjbwwgG9/LSottUy2qOZkz7aDxOQ8Sok1hKF3
	ypGzV0T3lSpB3Ne/ouvO//AgqXMXs7s3TuMEc1/nfaYqKmRioN7KN3VdVuO4KLlqjUTIZ/b1dNm
	CGQxeT7RYmbW+cwahewkNgqMgfzOjl3MUq4IByss2jX1fNtrQd4iJpelnOtU40ZoqwoopSAiWRa
	aL4bTgdssA+fheJxpUBKMR+5BM574O+hR9sus3C9IEEM1V6d5miJAAFPGhk0wWbW2+Jj99noUep
	NHlVXUC8uMBH2Ug87Ax7cP4LoAu+mxgRU1tyf2xM6zNaDheGIIvLswDv8IF2cPGoXIG2oRszb/1
	+FbQoj7dSPDlGEvnihPHC+P5t58Uao+CcAB9AzZFcw8tl/F1SrTCMOnN7hl/km//N
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr5172412a91.0.1776475242901;
        Fri, 17 Apr 2026 18:20:42 -0700 (PDT)
X-Received: by 2002:a17:90b:2604:b0:35d:a6eb:197f with SMTP id 98e67ed59e1d1-36140226cfamr5172383a91.0.1776475242412;
        Fri, 17 Apr 2026 18:20:42 -0700 (PDT)
Received: from [192.168.1.10] ([122.179.227.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa16e72sm32535725ad.19.2026.04.17.18.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 18:20:42 -0700 (PDT)
Message-ID: <668783d5-69b3-4107-85e4-c7450cce27c4@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 06:50:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region to
 ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-4-03b475b29554@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-4-03b475b29554@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3kV7SGLDzWkbLAVce66wwQ1V5MxzCg20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDAxMCBTYWx0ZWRfX/Xof/kWEIcHu
 fLIRp/vBCNmU8hK1fDOc9HZiYT5UVnvOqzPXi0KWVDV1scyK1tJgOdqttJJx5lSkJdxb2yQBhdx
 EyMru0PeVa7ZPVjmBE3SBbiLDCsAdV95S4qDemUKu0xV4YC89Py7HPTGddm7qHTyspWKmyx09hR
 18zTPDEnMx05pbNkOJH8aoR2KARE67CLG3OtncAUN9TPX2d8vPnS20BYi/QGiyO2amiF9T3X29r
 YjQvyPzb1PfVVlcDvUOphhjJEzQOCR/AARkX1Q+Zow4ptDVSYTzWSVK4h66oj4wG/Y7YxhzhNO8
 8ydsaEvRljO2TH5Azp0l3tBM/LUOwB+ucoOSjPB9nBjTz56UynZ7qLn6R6LmsYOYLXjyFc4OyrW
 3FQNT+PeN7fkXN8nGdCSFo77qIsN5mL6Z+C0Z4wtlKm17vMoXvNhp3JeggFHcQk+N5ZQLuQEcvI
 Sf6B8JfG8IQaVJvwr5w==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69e2dc6b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xJoAcIQ2wYp4krwY+vXiHQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Gv3PURsRAAAA:20 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8 a=hLo_e59RRG6X6sE6NakA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 3kV7SGLDzWkbLAVce66wwQ1V5MxzCg20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180010
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,mainlining.org:server fail,oss.qualcomm.com:server fail,sin.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103582-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8523941F96C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15-04-2026 15:10, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 13094b5e9339..19d80fbba57d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2456,6 +2456,7 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_mem>;
This memory-region won't really be useful without proper VMID
configuration. Please add LPASS and ADSP_HEAP VMIDs.

Ref:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7501

//Ekansh
>  					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> 


