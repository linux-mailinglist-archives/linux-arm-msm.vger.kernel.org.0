Return-Path: <linux-arm-msm+bounces-104939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEAXCoKH8GnuUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:10:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE3482479
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13FE4326BFF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8373538A71F;
	Tue, 28 Apr 2026 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRkrsxc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J1w8iN2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA076388E41
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368518; cv=none; b=ngEvI5izdhyh0F9hIb1wFeupNZZlVEBiO/Ft38V0r9dOCzZUulVdLg4mf1nshQ+Get8++7Q7Vn9mwah0Pux8/RiAgmV+Vy5p9ud4BOnhFl+VB/JOdkaQbv7k5L+9A+D2TGY7NAlAH2ax4r7JQsx/T66ZHRA/p2yGjmxmhKMdKwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368518; c=relaxed/simple;
	bh=oesX8bfLDzpNm/1KbSy/2QzqQU8rVLugkFjCxjd8+ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzY0ZPqxoA0cwwdXALcsTMDKLBzzfOK595l9xJ0LbAWO8L2NO2fIoy0rZjMEwZWmBnw07VDknxCYqzEPxLo1KiJ3idRNLEU+qMgfH89gqnNwSTY0jZVuCscft2IyHpw78vynLn9r4V+LPdK5W/VBkVa8UpoteUY8ayId0UstXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRkrsxc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1w8iN2J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S90vZ83123625
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kFva+OMsaG3w+BC4sr7PkwTKOhEzasA6SoH0B+QAP1A=; b=lRkrsxc+VGDM7DaW
	Z2MVI3auE2dxhH8gA3vpKqI5Qo+KOsSYjPI8ECB9+hRGEmYE9tgjnzM9TF/4Hj/L
	MVLaChNGUcLJcCUGdy3fIgwbsFmzQ7jT2UrBnmxAtNVVcyZrwHQWzOB2CRP9q6td
	/TJ1M2hRaaqDCoFsUdcBRyDOahayKDKPC3+zjJllw4LiCZeTL3rNrReyZZQsLANF
	Tlgi42nGrLuJ1bzXaf7+BK2BfckcZVbnzLvruCdRAfbvzlUCbuGiH8MVOzcb+4mA
	7nPqESWtkg0kPQghB+uKTb9xplelhpoKZCl0H50G7/lvSAHGQRqD6oX5rlMRlUjy
	tmz+uQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgmuem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:28:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso105328401cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368515; x=1777973315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFva+OMsaG3w+BC4sr7PkwTKOhEzasA6SoH0B+QAP1A=;
        b=J1w8iN2Jp8eE+X095DQYtmhX34hn3KMN1N4DHB/iX2KkRfsADOj0mC6df+q354N5zr
         5Np3NPfxsUn1f6efYWHBAlNvsokuMWrcFPvOXT9faT/V++SYVGnHVENHWdUDIWm4Gv+p
         NWIctjiJhfRq9gyEiPweEQ47UYVFqhY1F8HfyE8qa4xPFC+sQUkTDOpxlVTRU6eaLW8d
         L4SBHFpb8EJ0ULsMEK7rz2LZAkjfQghs4yNREA/Lr/wr66srqKqC6DdFSwTm4XfyxGPV
         1sY9iv7cmopeHGBdW9h//w9+4s7ZG2dgOwX5z9HkxS3k+jNcYYk2ofXABphkG2EQyF2Y
         FcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368515; x=1777973315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFva+OMsaG3w+BC4sr7PkwTKOhEzasA6SoH0B+QAP1A=;
        b=kD7gLBXRwcr4oze2pXcqkptVJAq1DxtpiERrgVg/OA7uyMZwxmD0H18aXpL2bB3YoU
         aCUtB1yqgHRYxi3G38HAfJw3lkLwAFWxen6M8mTIbswSg1Fc7g8av7W9b19CQsK4Ivhg
         N+QRa2LeZfrFRnFAmbqbQD09EBmzUnibHrKcmWQoAOhKLDiV8Di18pB8YdOw4HOu+5mQ
         Df0hIGl018ddelUBM2o2wYJgx4eJpGW/94AZpIJs4rapGWytsj9T8Skxj/bht/VcV1D1
         B9O6EHt4zFPnsXn3CEFsbrkzPNLLiK+snlD/FiFkpjb0n0hTqRUl52Yxc401oYxve6GL
         CVMw==
X-Gm-Message-State: AOJu0Yxfogneq2yMvWB9Wp9AP4t6UUh8bAEWj+y7zITfwcq/NyatqL5g
	ciA8IQVPklJxHLx97nB2BEjjSSLUPhpi9s/oPYvik3QAsU9x389rJ+ati2BoUD1IV7QPIJj9ZlD
	3J2UbaU+BMyM1G/HKW0MiwpbWjdkkmyM0zRX33gpuWJModjzg8zKKmnZhE+XEokAD/4cyYEndUp
	EA
X-Gm-Gg: AeBDiev4EZQun/uCaVjMbKMcoVzjbaiPoSMaRIf8h6bXrFSrGpZU3CJy1fM6mbwdBZj
	h1/SM0zLiLRNaDAiMXue8cjwjSxwidsO4qBPVXWdE6CSxVBawWOmvu6yvGTHBe0prFDTLHev5FU
	c8PiuGDSxW2PT9pw4OAiujTqvCjMhZRcyqu1xlqrqFCDO0WjFWTAWJMnHRNA7Ro2QHgvgxbbFw4
	abdZytqJfyUBjotkSf4dpoGoeTqoAuQ38bUPSKMaPdgeOFglgzGJ+/ux1SLzfkvHb/JfXTcYjYK
	+wv1Ku4wQc/rXtcLdoSbVHkHPjFKu2oNgi2tbK1WeASzBWulrJPYzFihrapV2nedWPPPta1yw6R
	RHqRYv4G055cihVyl09kqG5TDU6gRpvJ022lE5WB+JW5qJrMOJFcvfAI2nokxd8BZUAtwpZA89v
	WnSGNY/OvhElWXEg==
X-Received: by 2002:a05:620a:708d:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8f7b6478d8bmr234689485a.7.1777368514877;
        Tue, 28 Apr 2026 02:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:8ed:d6df:c768 with SMTP id af79cd13be357-8f7b6478d8bmr234687585a.7.1777368514369;
        Tue, 28 Apr 2026 02:28:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b67d5eb1sm509465a12.10.2026.04.28.02.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:28:33 -0700 (PDT)
Message-ID: <a408c569-dca9-4f49-bbd6-59caa6921515@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: fix UART_RX_PAR_EN bit position
To: prasanna.s@oss.qualcomm.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Doug Anderson <dianders@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, stable@vger.kernel.org
References: <20260428-serial-bit-correct-v1-1-9131ad5b97d8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-serial-bit-correct-v1-1-9131ad5b97d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX0CQpIw1yfUNO
 MbQXWGDNTb1oIAj8G7W2DAU+3TvuiOcdUqUdNHhvEu3lir1MgekbMcNn6JpAKihQizIQTN84j4S
 26W4SKDDtUxeNjoJjBUTEDsHXidzNpKIY2xeh/JW54LevoO4WZDo1P6nbrs7o2c46eUFgKhEuDW
 gWl+v91XImch1TfjtEWS8ux9ZV9PnNWaEIbzbpr7FL8auXsTqLO3Va3sMgWfhs4v0RDVmfrIZIk
 jtJar0MhRSEfTExR/O4TyIOa0HzZp9n2cTWYNNRTOMAZrMLGcjP2dueGVHIfXBAyi0Vu0u8gM+A
 DY2mgkmF3FcexzjTsR1tZt2mDjZzifK0DikFqhsO7RJ2SQg0BDRxgofJotVqwp+YHAcv/QcD8FO
 HlqBjXKtLJNWo2rq8xy/dTJe3uB0mT/yLUY1qGlf59p1PYGQ3ECLssZRhib12y0i8853RRuNF3L
 I2MywPJRrHvZHnkSYew==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f07dc4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=BX9ZcpzAl-p6V8_k-9oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: mNlvLn_zzYVvtBPD8jyJ532vasBDWNMe
X-Proofpoint-ORIG-GUID: mNlvLn_zzYVvtBPD8jyJ532vasBDWNMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280082
X-Rspamd-Queue-Id: 78DE3482479
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104939-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 6:26 AM, Prasanna S via B4 Relay wrote:
> From: Prasanna S <prasanna.s@oss.qualcomm.com>
> 
> UART_RX_PAR_EN is incorrectly defined as bit 3, which triggers false
> framing errors (S_GP_IRQ_1_EN) and causes received data to be dropped
> when parity is enabled and the parity bit is 0.
> 
> Define UART_RX_PAR_EN as bit 4 of the SE_UART_RX_TRANS_CFG register, as
> specified in the reference manual.
> 
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
> Cc: stable@vger.kernel.org
> Signed-off-by: Prasanna S <prasanna.s@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

