Return-Path: <linux-arm-msm+bounces-90192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F3SJwQdcmnrbwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:50:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7786866D8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 79AEB74915A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 12:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F05B3491D5;
	Thu, 22 Jan 2026 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vkdz3M64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8Fj74vb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA6A35C1BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083674; cv=none; b=eOFqPaGUdUhBsiob/4BoJK+WpvJQ/iPmLN4YLI4DDoc7R7v3D6DKgP+ILKSq5XM2g0bPoyV4QsKfR0RfkzyKyXGa0/8POvXIj3BrfHKP+ljuVJAWMJpS/a/fsvjE1gOzequE4/702MahWO5tUntwwI6Dd+R0EBh4n9VH09gIa0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083674; c=relaxed/simple;
	bh=N3SQyAH5dhXY/OVyDDoOYUWAecT1iwZO8mm0vi5bLMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfLTLTrgh5VxwFcmOUGTQnYntm0K6FVi8lNLF5ompVVOV8gpKJIxBrQRFsuW2UGUk4SfMwOkkgrqk2cMzhuWSv88N5etkPKJIDqOJzk8UHoGxuNgLkLgHGNj4fZ80v4VQsfBz2ORwIwr0sUKrhtyjuakuyHlhvdwB3OtUdEp+ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vkdz3M64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8Fj74vb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8wkKg646154
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf6AlWtEixYoWG0QVik5maTtsltlOipwfbf0mJrpgUo=; b=Vkdz3M64DR6S5U5A
	J90oAp5A7p2CRHJDls87w4HdndSt/bL15xhtkqmUASWmgYMXSZCslSFS49SWvkHS
	crUEqwZJGbj1z3S8tpXbFRWCV6Bkp5nnljuI2sWCjGYa1oofn13NsgoEIRcgXhYW
	VdQAMZrqPuBIw9v57l8OHgYv3x0+zAGjjVkESwTc/epZPLMruQLeLRuFZ+aG6LcK
	ZZr/Ryw6hR5GDa4j7FkIdSCTJJeo0WXPGp6zi/Ecv5kfFy4q2t/xKeS9fe7ekZPG
	lliEl8M2R327XYHbck/dxOKIWgOuA7rXHdrdynJ5hg6+WnJZ2wOe6m3/R/fF2hxT
	MvuxOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu8j9t1jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:07:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c69fd0a87bso68483685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 04:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769083670; x=1769688470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uf6AlWtEixYoWG0QVik5maTtsltlOipwfbf0mJrpgUo=;
        b=V8Fj74vbEeIwzTmRDLrQc1ooFZ9E3qqGejVsH05kB++ghJfSPAuD3Fqf1Pms3l+DMn
         cJuRp+c+Z6x8TKSxST6jdSaMAKd8ViyeBasZux9CEDHMKmBxPbvAAPp7urIn2+M+mdtr
         uOI4Fhxu99KBRP+ZG31tJwQCeZMJxpIfgGAi1j5RKHQK/2eeVQMfMasJyk0cLmyKp2Hq
         GhcGhgR68rh6SzuhIW4Uk+G/DmI+fSSVVmhO6TkOiDy5MUzUuAT1bOnIjR87wUoyvYhf
         wrJXkCmguqZjQckA0NV+8euOY/Jc/Oy5b3QFAQmPKp9rTR80388+tdtbwWJZbqqsMp+l
         PQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769083670; x=1769688470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uf6AlWtEixYoWG0QVik5maTtsltlOipwfbf0mJrpgUo=;
        b=MXoqQBRtquZHmtJ7sS7VN9z/+foTh8fK2mUOnSrpHAC3XEt502FrkItwspiFUfNVfV
         Ycl+7jjRuiwKGm7v40fs+YFjRgvjbbOJZcoUMCqZQGGMFRIacUeBVDaT9GPhvTDtgUnM
         IPfoWBcdv2Cjzg/RG7KyANOla+uR88rtBNzi6uudszPaMOKYjvhsOEOi7ZGkdUXYQaAx
         IGfupS0GnFaoDzWnXlfPZzBS/v3wN7cxEN7BpZYlfpRBHAF3VjpP6g2FTSjCTh4BCU5o
         I2P6y1sy4QpxVwYJ4QvAxev6ERL1euscEHwt272sANED+utx4PA6cgPQcwXO3W0/rQ6p
         4bLA==
X-Gm-Message-State: AOJu0YxcgWwk1fjy6BNrS1exIEy6eXeNhjZSgE+4GDu6wxheytMiaeSt
	GZwxg6EGWt3Netf/YZib3h4dmJUZmhSN87nKOuc82/88jtYKwd8Fz/kdsyAzj9dBcuDKHtC7TIp
	TXxYqNEaEEPdNPvnX7JAgeksv2LIU0C0HO7rDlOA0pl8Frre3gnSQOoJ7KT7/tRCjQOZC
X-Gm-Gg: AZuq6aJ9Imc87fLj2rzX7kTO98dd5mAmaeQcSdsbtxZWy8ZraXGI2pIoQ63NyHHJeA+
	gU0HvwVF5Abs4kzWyHtyYc1abJpCV7nAve+4Oduvsp9oAicXaYSzjWfDkDD05MxHT9mAegz+4J2
	B0hGHIzDZvRDuf6B53krU4inpiXv+1hGMUNHJn0BMRy81oh8sRKfD/91l00FdR6NyabsrJcPdnS
	xWyV+x21cgiRVy458git861zAWMfHq3m1+6n1Hie6NGLhCJjN+g4G6NpOxe0LSkq0rzC4iW4x/n
	G0CzwGn/yn1ZhIkU4etNo7Cc82wH49dStK9RBs4VmYN6Ya5cPLyiHmAatYHlHs7gY6RNpXIldqA
	NN0MMDIBKepYZDqbWLvmvGsu8VT7J+jR5/JKL+n+BGNHE+A732N1/eihwAzwzDda67sA=
X-Received: by 2002:a05:620a:1995:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c6a6799061mr2017088785a.7.1769083670294;
        Thu, 22 Jan 2026 04:07:50 -0800 (PST)
X-Received: by 2002:a05:620a:1995:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c6a6799061mr2017086485a.7.1769083669859;
        Thu, 22 Jan 2026 04:07:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a18c3fsm1662949566b.58.2026.01.22.04.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 04:07:47 -0800 (PST)
Message-ID: <913bb253-f040-46d8-ad27-51d7485a8ddd@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 13:07:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: qcom: pd-mapper: Add QCS615 power domain
 mappings
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260122111318.500262-1-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122111318.500262-1-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MVB9QeP3aPiOeZNEYV969nIRL65HpHuC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA4OSBTYWx0ZWRfXxE975HNGvlKb
 uEY075I3JTbOy8avuMtv+DByw8U4uya4j01wkZP1oX6srf75qhahwdOsLEOZ7EvbQFNIXXriggU
 RFfeQsVRG6rDow/Tsh6Nsa591uYkOLcAVHhRuDj6q5zpZiJmau5e8Sks3Z40jQOaRGas3MXYYfg
 UhKk1BxL9cNyFM/HzfUf0v5lKCW5EsbIeBTh00NCKZdiLYPLfVDvPUcUHrcwJKoFTN9I8GHcVUD
 xzSkaYH+6+bGxs4H2e/VvXp5S2k0GG1j2L8dKWQNnbvkx71AOZAGET3VXkz1hBYWrcfmEh9YVcI
 AXI5yyZZaCWiZMgEq5q9cnF5fsj0yX/Y0mdOsF9Yw/XO12Ob0545kU6cYb8LE0BycSuSXqQ3K+K
 q2VcazY3WTJzDZwQ+3KPtcy0XbKXm3YzoZQgzW4Eer7Dp6FAB8/1HoyvBzgi19yGRFy03M6chYR
 U+bgA/efwu5ABayhfpA==
X-Authority-Analysis: v=2.4 cv=U4CfzOru c=1 sm=1 tr=0 ts=69721317 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RHlFKEJBIYxiosyniWQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: MVB9QeP3aPiOeZNEYV969nIRL65HpHuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220089
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90192-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7786866D8D
X-Rspamd-Action: no action

On 1/22/26 12:13 PM, Le Qi wrote:
> Add the QCS615 domain table to the in-kernel pd-mapper so that audio
> subsystems no longer rely on the userspace pd-mapper daemon.
> This enables proper initialization of ADSP and CDSP domains directly
> from the kernel.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 1bcbe69688d2..884a2db9bb08 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -401,6 +401,14 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>  	NULL,
>  };
>  
> +static const struct qcom_pdm_domain_data *qcs615_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&adsp_sensor_pd,
> +	&cdsp_root_pd,
> +	NULL,
> +};

No modem_xyz?

Konrad

