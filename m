Return-Path: <linux-arm-msm+bounces-104693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDW5OEA472nV+QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:19:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 621F4470D45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6937130104BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974C3169AD2;
	Mon, 27 Apr 2026 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iE5EtpGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7lj18S3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333E62ED848
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285168; cv=none; b=mtQW0PBvUegHz/bMtReA/VksYSyNAlR6mzvKIKnU3XmFH2vgtrzuDTpQUm9+0GkwqoNHhvxV5Ma5Q65ckZ9Apm6Occppr8z+Cl/mQXy8btldSHNmE+OoRtC99GuXO8gqfkri2VVwjZevM/vQ2wXzM5uFG38nMpThaiWk2kZ2xJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285168; c=relaxed/simple;
	bh=q+PN25Yvg4Ok8USmVhfqsDHkq7AJ6+ao8HG4QYjNvvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmjUnxkrTO4bG1BjgNfzjkWPH0cmo4RUOTX+JICT6vFGvJm9cBtb6U71Y1Fci6R8Oo6rC2ini8L6KgyTIEAtoM9x0aDLni7MJLq0H9fkk4biLbCaLjUd2IE/6irGTEGTeYX9qQTNcXC4Eugyh2efKVg5mxCN9Q+ar/4yN2Iw+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iE5EtpGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7lj18S3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9OgEo3825281
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geeJ1PgRAUITajyl5+KfQOhgNzb0SKv4DzQGaAN/Ny4=; b=iE5EtpGLry0peiWr
	vO+bGTkpXwRb6jmdZsZNiqGCqRlRsRR/wf4CuGR2yNok296j+tzHPqfeIupvCvjL
	qzo+wbGTisfMaP1G/WuSsoOj0exkIBFwcj0lKotP4NnbOWvwjTl695jhpVMAF0yp
	5G9rfz5hsNqj0foTKpws4r3o4vAqxDbsGlakNyASCY8bpTzFHWW+CV6XhKKQJ78N
	kIC1UDrk/w21YWmsXFZWiUTZUWg8nLWyKiZrB8hpNfLBsTYVoAliMG35xLyeVWWF
	yvNNi/yCTk/nLT3cB1B/HZhpfKQwXqrRPtXo2ZYZ5zHNXlyCZWR+3+irpBQaix0n
	y+pMaA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt55508j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:19:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso95694141cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285165; x=1777889965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=geeJ1PgRAUITajyl5+KfQOhgNzb0SKv4DzQGaAN/Ny4=;
        b=V7lj18S3EMqqXaOUx6T23ySw8kQIT9CxakoAlvuz8DRrDnkX4Idlz5aqDAADX+oytu
         YsMk6TU1Z3DPkBim/ZAAbooZxVXdPe3s05BED1LqOYH2Ft/ddbwKPjs6IlJU6wS4hh6Y
         q3uYUWFn807FwTG65uxgS7RIjJ+d9Gc1tZUez+wqCZgm9W/VJx4eV916F+CDLC1al8V2
         QgiAvWcMfXb8zZityTpcActUNjokQkKt40rz/FNKZXXxy6W6BQTE7+1Eu6I3zUlq0wM3
         jhRBkjzflYRmtbe1xAlUxpOpIjaMVgw5uvY6YD1bX7k/NviWPHiqelXw8hhXjvHfFf8C
         68ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285165; x=1777889965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geeJ1PgRAUITajyl5+KfQOhgNzb0SKv4DzQGaAN/Ny4=;
        b=kQNqE3JtOdPiHquAImASSAV9vMisWBBK0CXBL0wRbItU3Bd9rUj4kX7f3pNX4Y86Rq
         7D4SViY/kiKeVdpmCq68VBM6rE0GPIS1GZXMWTxyChhS31vbqsuN8rq6E5pzaYcLf1vx
         lZa61A71yUgjiFe38njJveTMYr/Zk5zY02FpadkP3Z3+dc+ljFImpvLp4PYWKx2cekFD
         ZE91DkS9cgw25TLl9WN8FLpjl1wAPruId9zXrVcgJwjH4vsPIbxgoFpjXvzhVHoQw6WA
         hC58Su34jfOxiXvzc259NdiO4P79D1pQrMm6wRt+fIwGmx8u5LTatg0Z2LNrll6G1RDK
         UidQ==
X-Gm-Message-State: AOJu0YzJ43KcaMSRXS9xWLVuoGAIbZ0peNknTL4M2toI2EqgYx9IX5CN
	03zSALT0HRSnpU8QulZfsWOkn8hW1G1uX9ak7jH+2ddUtWLmLBaDhmpRzBrnnjxit1wABqxmR8q
	WLbyJd+lg5mmSJQfD8IFQh6BYFoxP3eReOt7y/sJidq29hr/zqS34aOf2UlOLPAje2gwd
X-Gm-Gg: AeBDiesnhtmLzGD2GUi4Rf8N+YanQHKFR9ZswvQivUqllLm7/c7QN0ys1OB2SS4QY3J
	wdBOVXRDQTxe6SCgFjz0A9qR/Vewqq7sRTF7pGpnh/+RiYTT1FAFJ9Ik4X7rZnTrRXSxlqxLRY6
	cgkSXg/4Pl0sLQp/9h9pMOjJf40s+KFr0OdS8i2RZ+IVC4ZqvjQjYwFSfIaULiZo6dldwkv5/Y1
	RvZbMr4iBEwVNiAOdQen7ss6rFRmXPnRe4M9jrvCl4wTR1tjseHoAkpRYhAVO2cJ3tBvVPL918Y
	2FN8zlBA1lJG36S9KHlSbjQXSz2uxU+NSgXB2YI9ZU81BenKIiL9y8xR/lBXmyOQNd5na86m6Hk
	Ldz/Y6nSq00fuvTVf+QxLNCKpBcccZM0XW+5znHe7wZcyDhaZZaLaM+fFdSKRM4mAqnMdpIIfdQ
	1ocTuMKx0OpW4bTg==
X-Received: by 2002:a05:622a:598e:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-50fe5a12b4dmr98356571cf.4.1777285165580;
        Mon, 27 Apr 2026 03:19:25 -0700 (PDT)
X-Received: by 2002:a05:622a:598e:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-50fe5a12b4dmr98356271cf.4.1777285165235;
        Mon, 27 Apr 2026 03:19:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e3dsm1092021566b.2.2026.04.27.03.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:19:24 -0700 (PDT)
Message-ID: <547f620e-905f-4090-8ebd-eb9f010d67c5@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:19:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8650: Add missing CX power domain
 to GCC
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V5dvceweUy-N3xC2rEc_wf3V3lsbIkQO
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef382e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOSBTYWx0ZWRfX+NC5Nv6IYjBi
 09gzDSsOih5XLJAQWjr6lpbtRjeRmjbrENHTMWNWyFEJXKN+xwHNohlaRFEEuWTcXmapEBYORsw
 BClIZ5QarwfolcaABz3rhFmlNZ2ZftihCF+OAG9jS60zZE8EUPwcq3Brp7ha5ik/ucj5EK+VBFe
 7t75Xi58sc0kS/JocxZv7JCEFE69FJj0fnU6PxxmVbVRnHUHcGi9iw27XO4+Vlexkx6Zj6Rbug7
 VpGDzgpTitxsK4hrjYxfcNwhImZLOoiNd+s//7LrfOqjU5KdeGUYabZKUdhMSAkRpuFWO0DwkqT
 TMxyRv+otGT1EDHUA0H7R2IBMFSvAQSVTcssUAP4NfvOAhhQnYayw/V12EVRtsJ/hX9LHGgk6Sj
 F0oRZX2dxIJU5CHfnygnl/5mTDBN0XDdSCFB/EDts61bTQJ9AUTab4ADT+Gpj3lA+qvzRf+nWOl
 FMPCfMFWoPod25G2W3g==
X-Proofpoint-ORIG-GUID: V5dvceweUy-N3xC2rEc_wf3V3lsbIkQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270109
X-Rspamd-Queue-Id: 621F4470D45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104693-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/24/26 11:08 AM, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

