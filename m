Return-Path: <linux-arm-msm+bounces-100127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFy4FotWxWl39gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:53:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84A337E9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 16:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FAEF302D763
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 15:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34DC3FFAAD;
	Thu, 26 Mar 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eW17fcup";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NuugipBh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B435C195
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539960; cv=none; b=Y0KEsPxdtIDEzYS3cGNE5l7sRugErHbUKErHHpJsza7D3KhyadVqFIyYDjaHYsvLLdF875rOK5xawJkFUk8pcGQ/tTL5B7WPK7MsNolALEZ6xi/Dy49qxw5IsoD8MTRAQAKrao/v6NYtJIcPVny71CKuSz4fnrQVvo/s3FTw6TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539960; c=relaxed/simple;
	bh=F3eTEyyX8vqYgF6JpQmVhqOM/J7F/hWIelPIekPRpr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gisnd5ZcrlKY0NgT3Ehum7nwDRX7KPAtSBmOFYXexrULJZ04nfCtREtjG4Mb4VEYvkW0rywyOvQmBZjQYFHA+7h8hHcuuYHpe1cHqqKX5DyljEOssEpI1nfIMpFWs0xvJ/RULrjD+Iyw333mH144RvwG1Py0ssy6qFMoyh5WtaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eW17fcup; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuugipBh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9hnb3849965
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 15:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HP/KSnHmsoNZJmmczSRBs8L6e8y2zB6VvhL4IVs3YvM=; b=eW17fcup1Q5slPZw
	BcDq+ojHV9j+4CCxmyQSV/amf05RDF1uAuWPKMXceBB/QESwDByPCO8VtoU9vl0v
	v/oHEDhf8T0y3OKk1Hi+Q0akVXDrN8nFLrfPSMZMs7rjF8bZeS6sjBkEyd065bH+
	pTYG4U9yNe02BZCZ9W5EdVJTq+W03f4JE6LWUZ0UgPrnvHFCBEJtNF2L9PnZ5MyQ
	Vi8UkDxF+0yIR2y8XICHSDBracfmsvo+0MAhKQH8y6CjqJ6XJ6dqT5YShHriuVpS
	rYOm7j4ygiJ2s1xDy/yHFE8x15F2UaFOEWKLe/kxCtqxFlDJQ1Jqe/GGR2F3SduB
	/QFgHg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q76uf9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 15:45:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-600061ca5edso1771932137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774539957; x=1775144757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HP/KSnHmsoNZJmmczSRBs8L6e8y2zB6VvhL4IVs3YvM=;
        b=NuugipBhQLCZHIzZKXsqjLOJnSNe0iR35egr0WO2T/oUlZp2G371pztih+nXW+K1JG
         29ClCKxPkXMYULCnTFPXYWyIV08ogIKn+5B7O2skuf7H2leI/ytyPbwCzwMnhHv4IANH
         HDPHQRMDmmMtBFLzj4JxZKgy6JDCSsi8uol4rQjlhSij3GNKpAkGc4/2sSmJYLKbq8/c
         MLQagV8nyVkaigt9sJIHH75KWfDPGL1I0JPozm3c7IhE4pE0ntnsAlgqCmZOwEHo31yc
         AoWnQDFoXFzyctT40eN25AQ48hsc6Y0Wxz+eUaYskdY3xL7sGk2xGrWTuCEKAj/5X8H7
         TfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539957; x=1775144757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HP/KSnHmsoNZJmmczSRBs8L6e8y2zB6VvhL4IVs3YvM=;
        b=jm7R/U9s3GTuwxUsnb/k7Omqh2diltCYreFbiR3M8PiGLa2ejxISo8gFyyFfuXAuA2
         nJOKMRPoGLINStm+TQOhqp1Lr001ZqKAHL5rLbc1RrEFj3M+2WA7ik/Rvr2Laeb/HJkT
         6LFiZDJzXnivIyNgBp1SrNq1gopmerQUHyuL62cOn8yHJjMS4f1Z527jIEjRRtPWoisi
         oZ64c/C7IoQ1ed2lY3jtN0i8bg+xLkGtXEYfH7MlTf2+Ooule7FxgrWpYDssgUd45QNC
         paI0WYgWUjMISHSQiTmpOYlHlj1tv/fBzZFX/v9K3zauS4kZE2b0qVmMK6w95E3H3F+n
         Yhtg==
X-Gm-Message-State: AOJu0YyNZG2czKULzYFebIVJ363hnoJZHsnkVqhnVtiLa9N8ktu8bm5W
	ZeOqrZOJAhCtlZsebCve7xo4CL+0IoB0oiVSTB3yzlbYDEUf8tq3Pek/uObsCmzMxFfxhxBPz3/
	yvplj0sEw2Zv9H2hqiXRr6xGPF9vNunTlOdC3dGFgChBQ3TbSL4hE3tFaU6VG31mtTWSf
X-Gm-Gg: ATEYQzxnAcv8daJGNpIelou0bdNjrQ/tCMtgul64qORHfywm7nLC+fMZKBvtZzxxPR/
	XG++++L/n8+QHo6c7zUdpnkJhzJwdMu0vPXs9T4ekI9VbIbaZ0wQTZdbOMKnrcnaJzHbXG9V20j
	ATw1dke2dSg+Sa5qlAPw10rNIVu8BH0PwhUwC8oUGrlqPbgDjGqlIYBN+e8xq+VkEFPZThaYLel
	Q7bJEO3gV/GJbMY4ysK0hmB9okh1sQ5oglGhIicE0qwiDrUtVIg4/mHE+ZSCcRsunvX6jC0jO+b
	6Swt1bpWh91sl6AWOS5bLjRCePbyTrcp4VnUaDvvWwXtCRvX7lHslpwZQcOgpWJG/t8YwtFZo69
	yc4qv375+UknjSSzA+rJ/+v+RN8IPR/TK9oSsHgR4m/4gRFXo
X-Received: by 2002:a05:6102:580d:b0:5ef:ac78:3c77 with SMTP id ada2fe7eead31-60394891e72mr3856998137.18.1774539957027;
        Thu, 26 Mar 2026 08:45:57 -0700 (PDT)
X-Received: by 2002:a05:6102:580d:b0:5ef:ac78:3c77 with SMTP id ada2fe7eead31-60394891e72mr3856968137.18.1774539956563;
        Thu, 26 Mar 2026 08:45:56 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm71694155e9.2.2026.03.26.08.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 08:45:55 -0700 (PDT)
Message-ID: <8475743b-5439-40f3-add5-f179c1044889@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 15:45:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NOPYOk6g c=1 sm=1 tr=0 ts=69c554b6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wzoI1WLMGo6dYPb-mgEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 6CRoo6j534q654ehGKN9leFOiVCPfn-1
X-Proofpoint-GUID: 6CRoo6j534q654ehGKN9leFOiVCPfn-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExMiBTYWx0ZWRfX3WiS/Yt3KU6N
 gftFLZynaSbNRU+Qgg9SSDau0kZtu/Jn1E9FLv/lDBtLlsFQ/jnP6nDlSaGXI/cMgSxsHih2/0l
 jba23+/C0uhpyMT0rJBWks36t27rJLTeM5FV1vknlGFjvap2l4UjGKAYabR47kYF72dCjGLrXcF
 BRcPGwyE/LP9W61Ok1zMAxzP6Mucw/vUP43M1wcy2zln6nFIR5onx1YbWqTiQlGLExC8ugOZu0k
 kslBh/KLfXkwWGlLQnyAV1Bvl6MMzl5ogBFkZv9hKn3kkFm8P4E/RyHalHYrGj5QzA8Xf+yaL6N
 NO8WNLF0lYFSj+z9gd7VSpUBitHdDjeQhHVfLBYMxmTfTTCtkONKdKGOO15/NcWUX6/p4x72tvj
 PiC6G3zFCBAB92t5++TuQ4URo7UbY0A0I8f3P/vlG+pvyhL9l16soVt9/rvBT8I54OEoV2evUGG
 WWr+FaC05fEjkDuFIMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.8:email,0.0.0.7:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100127-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.9:email,0.0.0.4:email];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF84A337E9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 3:41 PM, Srinivas Kandagatla wrote:
> For some reason we ended up adding only 4 out of 11 compute cb's for
> CDSP, add the missing compute cb. This will also improve the end
> user-experience by enabling running multiple AI usecases in parallel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Changes since v1:
- renamed the node names to be decimals from hex.



-srini

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
> +						dma-coherent;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x19c6 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +						iommus = <&apps_smmu 0x19c7 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@8 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <8>;
> +						iommus = <&apps_smmu 0x19c8 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@9 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <9>;
> +						iommus = <&apps_smmu 0x19c9 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@11 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <0xb>;
> +						iommus = <&apps_smmu 0x19cb 0x0400>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@12 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <0xc>;
> +						iommus = <&apps_smmu 0x19cc 0x000>;
> +						dma-coherent;
> +					};
>  				};
>  			};
>  		};


