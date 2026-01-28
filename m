Return-Path: <linux-arm-msm+bounces-90911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MHsN5jGeWl0zAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:19:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C1C9E264
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42F023010B92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE02337BBB;
	Wed, 28 Jan 2026 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2/VZT2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FaO2937T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8280329C70
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588366; cv=none; b=NjtiAc/XIhXKuJoibytBxZ1Ub9UN3OCE0gpRkURoZlqnzMfWDY5k1BHPpvhy/EfR6uZln2xA2GWfMq9grRQQ+GpfPsvxif16XK7Km/0w/X0nwMS7Zles87TJS6biGLb2PRHdN+p1h4Gz0wGJi2u5J78n/sz3UpQ6KpwYfvSM8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588366; c=relaxed/simple;
	bh=3Wyw3SAGNuSalyR4UBy85YKmiqKR1HcCfdPx4/6RuHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uuz+Y91A2lbJjXEWQHFIAxq8KkwnmCuRGL/Yo51/AZy+ezaw+vLbIIR1rWmtjrRTF6eVo26VExPZozta+xFpcNYxk4amldGbeYqcePmoRLeLxj4y34rb65YI1ejOFPf3dyHhFGjEeJtc8lXCQ+Y9htO/2QuqAXvQej4TGBUvtgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2/VZT2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FaO2937T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S6ilw94002605
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k51npGhFF6R2OtGNT7VVc7h5
	xVQp5l2qHkrh59jczko=; b=M2/VZT2VPKI+wizyemjda+Kq5xNDl+lyp/6inxIW
	nEBPSNcCGvteuuaRHwPpRp0d/Hmp3xBhW7sZOYl/rCR7kYcOccp/L5Zsc1vUDoDs
	DmGYhGerwUVONsFgugrGLMXFLRHf/M7zxtkWh3fizxotn49x0ZQba0vx33qghXDK
	R5Ru7Juh/nInqgpFxsPZ7OqkDYkzkU/0p/+MGL50F73yfrofhx7aKlaI+/DXkkAa
	hg3NZZbx3r+0OL6w6TvEhiSjdmm0xkSihad3dDM6b4Cn+BW7BAk2tKM1BHwSfTzi
	iIvmrZ/4eiuT010zBjLjrTZE0A1EJmv2m7vv2DWmyfn7kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4dyswuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:19:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70fadd9a3so333687385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769588363; x=1770193163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k51npGhFF6R2OtGNT7VVc7h5xVQp5l2qHkrh59jczko=;
        b=FaO2937T6TyKePeQMkKsJ0gshNKf2FchbIvTfYqWknnItWIh/TEd7nriy7QOPQHREb
         p8p13bw8+8RKbBOHbqlFvdxWwjOa6g3Qm2CVraDaRZxyzU8vn+GrtFeCig+FwI8+XnYN
         1BhT8LW+QExnFOhPRsQYp/dEUfCmo3HsPmqeL5zfhnST9aOCmesEco/UwaCERZMtb6Jd
         h8Wj1RBFJwuQ3QviLwchyChdv2l2qQ2wZdXUUhxlUyOxgbEK4a22BJdU5a4+XwvCFMYX
         FR4UAVCHPTxA17TAhTK9p7c5IX9SepiAGjEfjB2UDkj1jpN+PChRfTjkpzSUb0Go5+D5
         gvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588363; x=1770193163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k51npGhFF6R2OtGNT7VVc7h5xVQp5l2qHkrh59jczko=;
        b=NJ5yjuIdIJ1mUR08uEX2y/ayJOKOWs+l0V8fVTcd4nYngWaTo4U49qSw1J26k2FYY/
         VvP7qiFMZchftbHkn5XEPhwnkLMjoIaWdLJ7rBR5JFXVIJK+H3JYhQi93Jt5zx+Nuh8y
         yB68y/FIwjbUlKlLuHttX3cleGDWoeAQsSm7OYY+0p1oK4OnBYfxS0BErl041wcb8tfQ
         joj0QAtn1XI8pfmjpKk6SRWlHx9jRsrNL5LY8cy8FFKUvpt2c9atxnoEC51svId7fbZ7
         FhdMR2NY6mKv93Im/NBV0MVre08QSJ5vvmWTOarF6UXkBPhiPf8GH57j1+c3XWdV5RWK
         mBZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnOXpG+NjjVowxuD6fcS1OXxUmQ20KjjAM3ashAVI8LtOqOHk6hvmNlFA8ZkEEyiht63GfMwFXIYoCFr6f@vger.kernel.org
X-Gm-Message-State: AOJu0YykNrxbjIvjItUNdm6hCtnudtjgbv4DfbSyNxAj1YgQAPgw7XA9
	3vCfd4CGejoDv03fRbBV8/1SGPoQ/eq/cldsktD9vMn4X8CQ/z8wdk86dQLzEBTzjbZviB1x+XU
	YkzvKIkO/N0V3XS6oiivNtdeknYX0zzpNKBZz9mcz2YUW5opeE92ema8Ecu8GVDEpHcES
X-Gm-Gg: AZuq6aIkGQaAnrLliwbF33NCIm576sRtrNyvDvidGaAEJGOrhZkJitD94QIZAE8JRqg
	a5QUtLgdfdhvdjS3nQpVvDPOjCbnKxY5jiBajRDMnAAuprDJ23I/kQRqNtvW1oCxmORHCjxpRrG
	dy7a1b7Hk8w1QpRprwCsdM3TO4cw/Z7pbSW/qvfqzgRKBjbnVZahr1Hcf/J+EPxqQPTyPrXVwwU
	HbZS02OVAMIZbtktwOSMyH5OVYyh3vz9vz+OTef1+XC/2jXpcrrDMWpiGSbi5Z2ZxibGoC9pe8F
	lejTdiJXI25TruRzw0MPXepWoHENB8aRKr1LIl8HIMFUqc5d8kkxwTN1G1ZR7NVOEV3jXJkZ4i6
	JGclUgLIBW6kEG5AEuHx2vIW+
X-Received: by 2002:a05:620a:28c1:b0:8c7:33:cc97 with SMTP id af79cd13be357-8c70b841397mr552348985a.13.1769588362772;
        Wed, 28 Jan 2026 00:19:22 -0800 (PST)
X-Received: by 2002:a05:620a:28c1:b0:8c7:33:cc97 with SMTP id af79cd13be357-8c70b841397mr552346685a.13.1769588362315;
        Wed, 28 Jan 2026 00:19:22 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e490esm5004005f8f.9.2026.01.28.00.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:19:21 -0800 (PST)
Date: Wed, 28 Jan 2026 10:19:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 6/8] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Message-ID: <lccj743lus7hhn76xrcajjnms52nzm4zlul3n55l4dxyicr5yx@2upvvfapbjls>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-6-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-6-b23de57df5ba@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XqT3+FF9 c=1 sm=1 tr=0 ts=6979c68b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wZ8H7fhid0mjBLlCKuAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: m7b0Wyf3mJsI-Djr2mNmRjLJuFTQkDXz
X-Proofpoint-ORIG-GUID: m7b0Wyf3mJsI-Djr2mNmRjLJuFTQkDXz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2NyBTYWx0ZWRfX5HCOX694j2kZ
 5hPqCnYiJ8+n+cxzC0toOT6ee0MNUI+Hw2AjZA8gA3kJ+FkaBLPe6gXubmGy9q+1hb0OV0qxPrW
 W4z2H88Z07CVYaQDu0W/2zWzp7hLEUFKnGY0X6bgUTav78KfME6da9MJl8jb1ntuqWm72CHgr4B
 BulLlGqdv7RSNjpUrK/68HYVKOKffxAW7tbYh9GZFEPRbrnx1e/sP6QtW11b0ewhCeImfUSRj6x
 x2TYvUV1Wlk9fUYhHoiEj6gYuntd2ttzKkseup95lJACq8ju/ynIXfQEh6WS2U0Hn1/50EpSBdD
 5i7vne+bxEtObGuvopoZcpM3WxOS+hBXZ8kPK5lAFS0oM6tWkLgukOwlU+9x/cRPY41BpX6nN1F
 EQa3naP2CTrXIK5RZO5x/DDCJS3h+UxRxb7/ikezTAHd8wQsHF7zWrX6d7f1XqdZSW9F3DEGptm
 McJpZg7fnG4TILY2sVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90911-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85C1C9E264
X-Rspamd-Action: no action

On 26-01-28 00:56:37, Jagadeesh Kona wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

