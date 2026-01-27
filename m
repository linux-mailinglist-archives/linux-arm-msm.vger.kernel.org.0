Return-Path: <linux-arm-msm+bounces-90730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDFdEBSieGljrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:31:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5624939F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 576A530058F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DB7346FAA;
	Tue, 27 Jan 2026 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9C+DKUG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fe6+npIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD73348860
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513480; cv=none; b=Y29omLm6lo32G3sp/KTgzP5Ul59LJcu4qENG0HMefPXRT5iV37ChTQprusVO6/Y/2Re3iKh8itq/c5w2V+/FHxvWPqJLKv5lGs3KM0cn8Ah+XfZNebrQAxbO4fAsOX9SjtcZDGEXqVmotDfgxy9NiryW2WyoS6YN6gAl3PwR6PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513480; c=relaxed/simple;
	bh=Urol0pYuPxPGC2lQX1EPUImulHMLveUGZZQ3278uW6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ey+URMRp36o3366IKOsEgyo2Pd3KPKC1hm6f+b4h43ZAv2Gip6pnr1oPYBQmeZ0H7T42fP9foA0JbVv/EQiZZqyMGrW42Sx7ka7Ej1goHatEEAoxWKeWZwqdvwfgtH6GTesfwUVlXQ91ueaxdahTObb4JhcOderG7F2H0j/fbsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9C+DKUG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fe6+npIo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7QGFc658432
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGZRYHdhTWMe6g6Ra+PVr8tG4M/ZgyWo32nxuKBhByY=; b=P9C+DKUGbD1/hbbr
	V06HODOPKujtUIiUx3QZEiL2v/BSdYRRo48jOW221M499xib8v5zVrdvy0WJ2nG/
	vxNal+012g6ZAIP+NfBgSFN3FrGdUc2WEKrgAvv7/OvhEPGt4g6uwUtRzRPjy7o6
	mWF4KhDe54/CXHbBnIO+UvaSwBVEjOKnbJ22Iq8gN/cqdLw5Y1Px7ag3Q/6olTq9
	CQXh89YwP/J5MtZO6sUjvEEp4m0j5sYT+7mb5qHCKWAYK0EZxwT4D2HV0c69DEHp
	GaogkTWyNMIYNmX0OftgbZYYuUhDp5y8Sr7AaKYKEMze7PPKlc3fGhATfpCY8Rtp
	1yv84w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn8umr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:31:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso10208085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769513478; x=1770118278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGZRYHdhTWMe6g6Ra+PVr8tG4M/ZgyWo32nxuKBhByY=;
        b=Fe6+npIoJfFU9/OrFNizgsDXIASXQ98vQ+Aw/QUh+bqFXmCuksz2CwQIqf3FD/rBc3
         +zsAjg3e8A0bsciC3KUO9MQLmVou4bt3+X82FK7gyvGUPHg7euV2lVC045+/DvN8BPMI
         L4/e5ds5YdFvRruyeRcXe6ffOt0YOBwuGqhCA97C8gj1wona6y8ms8IjGkUEJPL7+YPL
         E1Kdh1ecEFxVpDrKxMe/5rhK7+fOz6/IR5xY7hTZppt/bMbeYpDlCP48aQwVKejuRHxu
         htVOkqSaUbILARaLJwY0+drzBrdLl8RfB+FMj6Djs/L3B6UbF/ucfAOBrFBlYsFBv/yy
         ezTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769513478; x=1770118278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGZRYHdhTWMe6g6Ra+PVr8tG4M/ZgyWo32nxuKBhByY=;
        b=laAbU79ZDQsgEWGxeIjJ9hpaoGBaJnxOqgnf/cX0XntSe55cIsqaXGXi4nAuTxX99y
         mgkhjAdHDWWg8reu4jEJx5cn6l/QuJxT2X/OTueoo8A2rPON6l6w7eVMNFCxH8wXE32f
         vM1AMflDSE0OF6WoASzOlSiIH/QEi/nHim8Q7ZSKVrUVGj/fKQxuIxHwr413cRpQwu8h
         XoXIhA6vpTHehONn/T/iuwlY6cobruweMQieBC9zgZYNVfTV7+Ao3rorpVW4lf0tlgZS
         GfnRYE87a1zUKsw5/+RcsqJgVXiqbWrh9o31Zl/PRBsAaXy7gQMyAWNSAOL0wh99LF+8
         vcYA==
X-Forwarded-Encrypted: i=1; AJvYcCUv5I3h7g6Eog+rgwZfyui2mbHnknPIQrw5e6KzKrSqQaC9BTO81C9i+meo/QZg8GHkXDsAb22E0HNePcvI@vger.kernel.org
X-Gm-Message-State: AOJu0YzbYjhJSLI2YToh5MxuOvB3PPTk7j9CsLiWJtsmPIt4UB7PHWio
	/YTj2vUb+Xn5Kr1iu4P/38LYh0tQHh9k5jxz1ca5oI3kJl+B5K41WhLvvZ/CMv/xh46UiG2y7Mq
	7OBjuwRLfB6zlHSON8R06iRz09vNPgwHaswc8BS9ksWMhF7Xc87hUi36MSWgi0nmEyKOV
X-Gm-Gg: AZuq6aK6FdF5oOIqrS4lJNKsXBOrwRDb2yZgzCQwEWuzIaa54G3XBuvVQxGOPKobz0g
	QL+A9F2GKEVmRi4IfxOa4fkqf7mnr1yjR2MxCx7fvkIYsEc/xCK9va7N8WG8mvbYHFy3W+9jshq
	ir+63HkzW5MjLkyapFK9XF84ioLmhQ6tC/jBtNb8sABk1TWpL0M4eT/cZJ1Yq/nIo7ZkR3K8oL3
	p9lNaD7j28NqpUghR2GIlEzOTxHo3QdzgQn7QPCLqivWOgAXPHMVyVIM9goK4j2Pi5L1cAzf9tk
	dfgAdAOqrofOxuF3giOuHb0xJQJKwiIipnOooVwZCf9Xcv9a6r6tB0cORWEoduQq/AvCka35Fy6
	ink2qfawRmIfpt/LHnFhn+PDMXZKuC9X/1e1zqiP9pQTB5eZ3TJIGKSL5rE4/q7DBoz0=
X-Received: by 2002:a05:620a:f12:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c70b7413acmr114769985a.0.1769513477893;
        Tue, 27 Jan 2026 03:31:17 -0800 (PST)
X-Received: by 2002:a05:620a:f12:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c70b7413acmr114749085a.0.1769513473873;
        Tue, 27 Jan 2026 03:31:13 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8877581a03sm634706866b.43.2026.01.27.03.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:31:13 -0800 (PST)
Message-ID: <df4f1934-7366-4ded-bc8d-73189769d967@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:31:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
 <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-glymur_gpucc-v1-2-547334c81ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ItNWojI5q5sxutRx0wBPuASXdX3BjuWb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NCBTYWx0ZWRfXwVG7G7Sk7V7S
 17NVHAk///JFxMOVBYDl4Mjq5ODJ6FZiLL+dI9e+QaYjt6tHjvAUK2bw0NWGAnRaQblSigsHU4M
 RK7Y6zLFzviISb2uqFpbBmMJ/GOEvSAx/pn+XYrRa4HY9AaqNmTb/c3bE9N2nIhnGvLqdtwmwkJ
 3IXvIx8kstPuy1XxhJ7xiwNJ903o4BHrWQrK+TxdA3emKJCftxzgTMX/bzmmBWvR9Sszo7ihkgg
 clD74mGNYQdKL0iBMXy55kRobdJ/IHF9I4tgZW1zYMEo1doP24Wcf//ml0RCBSv9C397Kto1PRN
 /1Vq2qWfzM97wka9VYSWM5EHrZDPRpCDEsFVgYPPO09XD5srCpi4Bl9ODl2n8dcCcCjLMqIPuxY
 V/FXtgJT8MJlLOumfsdU9vaRkKKaRnIHJqrl2Y4E3W59Ov2YLJmnAScuiQp7Nyhm7LrN1sfVsmp
 /XEIM0inNoSoi4Y2d4A==
X-Proofpoint-GUID: ItNWojI5q5sxutRx0wBPuASXdX3BjuWb
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978a206 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=91OgtvA7_0Jf-gwRHFQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90730-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: D5624939F7
X-Rspamd-Action: no action

On 1/27/26 8:15 AM, Taniya Das wrote:
> Support the graphics clock controller for Glymur for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Update the compatible for Graphics GX Clock Controller for Glymur as the
> GX clock controller is a reuse of the Kaanapali driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
> index c209ce5fe4f003aabefd4421eb4f5662e257912a..3ee512f34967f1b165fdc5481bb28e1dadee133d 100644
> --- a/drivers/clk/qcom/gxclkctl-kaanapali.c
> +++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
> @@ -52,6 +52,7 @@ static const struct qcom_cc_desc gx_clkctl_kaanapali_desc = {
>  };
>  
>  static const struct of_device_id gx_clkctl_kaanapali_match_table[] = {
> +	{ .compatible = "qcom,glymur-gxclkctl" },
>  	{ .compatible = "qcom,kaanapali-gxclkctl" },

I'm not sure this is correct - there's an extra GDSC on one of them

Konrad

