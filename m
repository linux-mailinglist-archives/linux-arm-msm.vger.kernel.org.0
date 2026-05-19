Return-Path: <linux-arm-msm+bounces-108468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GvmE+tEDGrQcQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:09:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9F57D3A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF32830610E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7E3480331;
	Tue, 19 May 2026 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgN5964V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAq7OFpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4BB481227
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188390; cv=none; b=IiLC8nH20Cp3JZaXaXmmiifhfjW19rraUYgDSnwm0TsQc48Bq5UDtz6QyRFGn6x0MLe3pvLNQoKYjTwH60YbLay2cn0P2s9rj1vQRwGHLqsxFyyzC1JQRDgaaeED/dVG0QWMhSKJKtR19hL9cKlbDsfy0J+oK0NCHQSyL4JeYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188390; c=relaxed/simple;
	bh=pYndXf2KAGQT4uraSK0I2EebaLVY2dqZbM0fqBUTB/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nrq4tBgCzUbkj8KrPlzlBPPEHB8fRvrqvOYZr0pzWrHH6kTSckODppDgIa7nYBVbuj/92FwRR/lKh1SkvgJPrMjyRAZ0MdB5h49voMtO1f9dAxvTnRd016XAhMmqFYyLeiQ3cc/WxNYR+7mvUQvANakW0EvAi/KEgNd+YRG618o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgN5964V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAq7OFpX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vFuw1055038
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3GJB/k2ynxWxGVEV1RFSKNfi7UMFKJzz6+gNpmDXEA=; b=MgN5964VrMlkwu3o
	mQtLMtF/QdtufHM6bYJkRQObsPCzDl7u3ojwpJjlvhUEXypr9U2hhuJq8KmZzJHR
	AcBxzUv4uSiMG0WDrMnnzsg39z5rIUrdwD4AiLReR7w0qIDwyFjM2yk+bcO26U5S
	c16gDYYKTIMZUsL/XcYGRgaGxO6T51QXQP2+sPrxEff30dy5lXhdPhI6/uZBkwI7
	72D1AnZyFBw//yg13cXLjivUUrhRN3u1V9IiuBhQXpeYk8AdfYgcNKOEzMKTDnmd
	x7CcY8YY+I3qLiSVBXUzouZXkD8zu5FDJPw2D7DAYj25LjePCf6miUffdayib3wW
	razlOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npar7bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:59:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662e7756f0so2634527a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779188384; x=1779793184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3GJB/k2ynxWxGVEV1RFSKNfi7UMFKJzz6+gNpmDXEA=;
        b=PAq7OFpXZ9X8D2eOnmixVo8tw6Gjm1vIA6lAcfRxYsk1UHrj2qNySplQooy2xWKXJY
         5HgjExk3AdU1J5DnVz9DUs/K6dsB93e4fqtemo3VYQ9DS6ZsroUNaQq+AtnzaCIDdkK4
         OLVdLmomVDUR1ytTdQOsYBRa7E9Jdt8dWC94XJ/WDgSFVetGwC54+56nbVV7DIV19XGm
         unwVXOKgie2xwYT/Aj8oSYc7TWOdTmgHmwYtByHZ8ciIFXj2LSFdgGO2Ry3pqpmRr/xq
         olf58xcX77U48niwXLaNM5ZszJdIzmacNaWdYWjxq2A/61jtWLHOtXGdy0NMzZOu4RrQ
         Yoxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188384; x=1779793184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3GJB/k2ynxWxGVEV1RFSKNfi7UMFKJzz6+gNpmDXEA=;
        b=GPb9LkwZmy20YoWw0Trs68xLSeC7xTVgkNZ9POw+RuF69AZMyfzUMnVZ9NQjkapxKh
         wtdxKWnMgrJzIWiVTjEdx2ZNYyEY2l+mZpgTfqsjc0nafS/moRuXgENOD1Dh9ajtKhsB
         lwOnWKhuJBqIII2tg8e/W+y7hsM50XvZSU+wVcmNbsb/2TDzW+RjTV1tWhdclornWf3z
         GZ92J+vXD9MEPlxn9djX1MzOdcv3kJTmfKSWdJl3UQo46n81bhXS0+WOUpbtpC02lCde
         9pn8FUz21Ry6Vc+1xpM05eiHCEpkEExNu9R2AAjrtXIz/raJUMevse4Qw5G1IuCv7ITR
         Gvgw==
X-Forwarded-Encrypted: i=1; AFNElJ8tK8ci6Ur5RZ5ygn+XH92nEB7MNXl7LbazLjDW+9f/X845T3DCaWC9ZLD3WgGY1QhoqEvu4j1ezPDa2bQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YyfgP63DCAP76ON8hPqjLul/QyyvvGQyjhGl4aRFE3qE3MAqdIZ
	rqYfFm3i+X6l0FguF8MqT4NaD5dpOBvOAgXDVRQGnLlOLJYaTCOsrbIhlPx+MQrIQc6DxNTY3BB
	Cy7wEssHAxGNB037Q5LDc56XOzRcQP+4WFJcYR1BeHIX4sg2TfA+hihzNfUJ1cEO8USKq
X-Gm-Gg: Acq92OFkpp6MdKjyxeDcNZlmwOAUz43OZK+gwCP/EpyfwOV0yoo7gmNoD/hr9DPiL74
	pBtBLw/opuHKQQ0k90qzrl0oVtY7NyoRRxmsCC6CKVPDa+kuv1JoLAJOqRGLkEGwsQ9WgdsZn9S
	uunlCVJHgIrhncmVprBcWN/Le1714C1gc4VbBUCT6M3f5WNthCwJnlxlfegkSCzSGwep8PKJX8x
	kRJyCN3viG6KgaaCQMj0i6vP3t8ug6j1RF9tSciDkquSZcpTtpPz+4D3QVwPUqeFq5ufTRxnpsL
	n34GOBSwi7JAbWxR2UyZckXUvcgvB8EabJ/+zJaMA0UA6ZCAiPs88RAlL9LfE0AYIQWku8RnLbW
	B0X/ot4wZUsdxR8BCjsdNThz6ggdoCI50oEfX/MkL1Tk5dDUj1Jx6ymXQ4RkAR2XLzcc=
X-Received: by 2002:a17:90b:1d84:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36951ca51ecmr18877729a91.19.1779188384469;
        Tue, 19 May 2026 03:59:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1d84:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36951ca51ecmr18877703a91.19.1779188383967;
        Tue, 19 May 2026 03:59:43 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514361b6sm13809344a91.12.2026.05.19.03.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:59:43 -0700 (PDT)
Message-ID: <12d8da90-f092-449f-af6b-14b9dd851f1e@oss.qualcomm.com>
Date: Tue, 19 May 2026 16:29:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Add trace events for Qualcomm GENI
 SPI driver
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260518-add-tracepoints-for-qcom-geni-spi-v3-0-7928f6810a79@oss.qualcomm.com>
 <20260518-add-tracepoints-for-qcom-geni-spi-v3-2-7928f6810a79@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260518-add-tracepoints-for-qcom-geni-spi-v3-2-7928f6810a79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwOCBTYWx0ZWRfX+/50YsIp+2Lo
 zHK6SkH7fHvd6q+2VLK42+WcGb+Q96cQfRKhevBuOWhVBLEu0ha77t+TLh6KmImEuCWxA/v8Q8J
 vJkldOo5bxc3XYoHnZ+ypkir/cetttBvT9Q7VhXFmAmO16HMxNNkOqzXm40TowUEHo/2I5I/e1f
 Fju3FKQ2Zud2rUnR5RqhkGzAfBaFQFm3iGNEfr6UDkg2boctrqv3NBzMbMXu7ygnTFvnL0sIjNO
 xP7nKBNw0Ml3Gau8SxIAD7YgUT8kJWulyvnTul/1hTCUI9gkOUh0lL8sYaT4LHFNHKKLMfTQdej
 3R7cyq4bGTVu9Ki+HD/VHp2TMD75euRsgD42Fa+ery8z3Ps5E1PCnSQ7yX476csvA/VpXjz72oL
 MUYIidsavkPUpLicVRGc/Lqvbw7Td9z8ijhgt/4aL9WLNh8UEdhFu7F9mLQS0xOPaW9el1DyILM
 U7aMdZ5DrMBpeetZaBg==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c42a1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-fVOaADM36-ZU2ItTmYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: TI6EKKmtNO7DV1e4gjnm-VVDgvag0x6T
X-Proofpoint-ORIG-GUID: TI6EKKmtNO7DV1e4gjnm-VVDgvag0x6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108468-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13F9F57D3A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Praveen, one question below.

On 5/18/2026 10:30 PM, Praveen Talari wrote:
> Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
> These trace events enable runtime debugging and performance analysis
> of SPI operations.
> 
> The trace events capture SPI clock configuration, setup parameters,
> transfer details, interrupt status.
Don't you need trace logs around PM operations ? ie. runtime and system PM ?
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

