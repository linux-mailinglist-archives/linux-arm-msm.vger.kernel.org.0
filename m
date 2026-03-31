Return-Path: <linux-arm-msm+bounces-101039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFquNlKty2kpKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:17:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3134F3689D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C38D300A8E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532543AE1A4;
	Tue, 31 Mar 2026 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXJhfNax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+i6bGL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA443ACEEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955556; cv=none; b=pjoRRl1yOxLsOoTimlHgVd+Wy8woa9XIGisBXHNurTvY37DRIKSZnl2farV36cmDFD/f4A/qP1Nlvo/tJm6JfzEQLdA+Vzvc7pTlOZgd9UQj6vHCesj2BwFz1tpZHs6aBN+vCW3D19Eg8pyzBBvVKUMZL9c3Q96dPWspTEbFaZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955556; c=relaxed/simple;
	bh=S8WYJIegKzqxKEqLKgVZrlVshD6nky7D1THTCIKqmUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEhSpb1HDdigmyr9gfjnN3WJPMkShp37XscicF9FKrgc+3KxWe84+RAwVqo2CykC1egMkwzrvdjMgRVUth3AxJFrqRq+FPaFbFMnTzDqjoEeHBNnJGitxkSqpioe+btSp7b9q+am0XgQsJd2nY8iqSQA5k9TYsp4KdJ2gmpR+P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXJhfNax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+i6bGL9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VA3XnM4053489
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmaWKZZFLKiiY6+iwMb1H/NOyseBVqgFFD5Szt08KwE=; b=aXJhfNaxdLCsDxnU
	mdg26J7N/Vt6//oMdzPefP/nsUr9tprlOS62MgOH1+WulkEBY/QCnUoDSZkb4Q9z
	XHs+CiM8r2AU6GBDKsQyZYEdl88Net6Cn6mrPulItSuHwSIPNWxgMiqOyTMhhebC
	vxLVuEHhLm1g6KxeaDABsaIiV4Vf3xfeD73jKem8MvKEsOUxJXuiAqFMs7Z3AI/1
	fYtcKyxSj2A6Qi+VO0Ld1w253dUYBdJvI5qqo96NcLaXWukgj5lCCJ5E6SjokHwn
	Kuvhj6feP/jzSFXIr076tPLLI8ca6jfq9S3hxOWUJkm9xLBbRaEeP6XYIvZ9VAxx
	7ejDsQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3b8nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:12:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ed6f0c71aso12206926d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774955553; x=1775560353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmaWKZZFLKiiY6+iwMb1H/NOyseBVqgFFD5Szt08KwE=;
        b=W+i6bGL9JkrsqSEDFIQAwCDKRIC1YA90sXvG9ndQkmX1bFs0w0k+4n6jZNPpTwil93
         ZddQ4P3XoXXXgcGNcT0aGJfeesPMTU0TwQOX5GllPgbP6VM1y4xow3pdXpGQg36elh5K
         ktP11cIxEK+CGzEl0t3OcTYMdph2k8JL/ReWQmh8GcXfeHesCYzeCE3HeK/TRaRzRuqi
         RRze+m5awDKRiFDCy1seJ4LZVtPCH3b06w0wkFbEPy/RT7v5FqxvVtB1e7/s5Qtv0KES
         2X/e+ooGWfN6i4aCGslYDSIRGLmwq2eS4u9tgTUriAz7L2CGXV4zMAIBPPeVip1WY6Y5
         Lilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955553; x=1775560353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmaWKZZFLKiiY6+iwMb1H/NOyseBVqgFFD5Szt08KwE=;
        b=iFRDSq8mMF299eo7OVLZuogK6+bQ6AjPdK4Buw+SYoEoZFT+a2fN19EeaKi2xDOxul
         +wHfr6IOfCfpZGymY40kdESlEagqgFa8a9fxoHKRwltlvJzjwnBMQyKv9xUFQqZVm/Lt
         9av4I18u4xoz9XbBCd0m+k2IOG4TVi6OV3FkJZbz6J7lw8q7SLQ6YsRWIi2MGHfY59ZP
         TXgmmRxvLLPew64XijGjoNjo8FWIBM4oYMseAMqr6uPUJxidMPcJNyzAYu7DYY1wJt6u
         M2yoBn255vdA6gp1u5l3mAGKavFPrsu4BlYaUC4m/Zq9Jy2dTsVQKzOSpc4/OKOmZPVz
         R3Qw==
X-Gm-Message-State: AOJu0YzFc/6FrPkc02wGjpuHPhzC8yXYe0Bl2QYJjJdKU+GEK+uFy4Km
	P4MORaTxrzt1B+0NnOHnQall9sWvuQRTBavIEf9CnWYzcX2A1hrghjWe0xIdUjsWeLhSIaqaHPa
	6nvbGLC0g6O/qbQ3kiu0XV9yy6SByCS6jPxyOja9gUGLqLe+l/JGB79snQhoMhfqCB9g3
X-Gm-Gg: ATEYQzwl53dmQfnFhgIeIfC6FCiGVMm2aEKZCYuj9eilDQedC9KW+fqEeCuySAyTZHJ
	v/dFJhYRjX17KRe327ZZ0N16Tj+S+vvz9EjtUDWnIoRC7BxC9NWAF5X5MtEx3vWE5ao6OY92m13
	Fl3t5AqjzT+6Pw9QBzjfsBVz15FBAz+Er/8VgPMmXQgtnyf5dYeiDZ4S2g32js81AL/Rjpzk+UJ
	/SsKJ4c2rPnACwVoglSdc9sHHbOeUVAhAXl5Xen/Zu95HN6/kgRfjR84YAcTwzxzVZaDWJ3XPi3
	qgIzxCrCc5mnf1+R33XUs5XVqzm8OmkA111wUg+Bl8gxSNzJOnRBNGfWKeENtJS14szCzbFe3Gi
	ExOHWiRni6lRvNJSxfJUz+7zN4fvpaV8mix+Fgvew91jobxJPYN8L8WGOxcUD6XW/pYyaYEDobA
	2Qnj0=
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8d01c322c10mr1460637085a.0.1774955553407;
        Tue, 31 Mar 2026 04:12:33 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8d01c322c10mr1460634785a.0.1774955552916;
        Tue, 31 Mar 2026 04:12:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66bf3e16f80sm1875977a12.25.2026.03.31.04.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 04:12:31 -0700 (PDT)
Message-ID: <82bbe04a-b853-4dfb-a937-e1db643a4403@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:12:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-3-d8a251be20c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-eliza-adsp-usb-v1-3-d8a251be20c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cbac22 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZJD1sKBUCcyTPMDnx20A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: _6EX8A6pWRgXNTtnJ8HhgEiUuHQn_6VV
X-Proofpoint-GUID: _6EX8A6pWRgXNTtnJ8HhgEiUuHQn_6VV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwNyBTYWx0ZWRfX2efJFCRHLnnw
 EhkJmEBISNyalMHGE01JZ7sl0rVP6+V2lM1kjsG4OrWW+IVKVx9cBUzcpqtQb9n9gSPPLaLz6/N
 8IWeZ3Z0xd4g6sbzJWZAM3h44ssKBE2D7yHr9FNbCzBSKn7UPHF7wOKIWLBjPZvaczk8HI0K3ES
 p8PoOsdDbdbF5zQfnw4VhkGZy3+STfefuBWVE3kpyhM+HLYfl9YOldh0XOg9eHGcFu+7EjXmOGO
 Fqsh4WAb1tyZSlRhPRbfb5l4B61lPYDuzTN5Xl2+sGFMEIXKCExKMfHpkeTLfiPopQzD4xFXC0a
 ewHaf4Vfa52Qg37h60RSlrfgrHQRIyO2VzWEJDs1CN1YYpKDlSJegZsIaq7ZLgcnDJG13wP6sS3
 eYNfYM0HCrNZrp2jVNd+bpaY3p25PIskYMdMp5apuYdVy2/oyVpqDu3moNxNvVRGAizmnHe1kF7
 iO8FrBH/aM9DfGRi0QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101039-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3134F3689D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 12:37 PM, Abel Vesa wrote:
> The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> 
> Describe the port and repeater, and enable the USB controller and PHYs.
> 
> Also specify the ADSP firmware and enable the remoteproc.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +&usb {
> +	dr_mode = "otg";

That's the default if dr_mode is absent, drop 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

