Return-Path: <linux-arm-msm+bounces-94843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKhTOdhkpWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:22:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB18D1D65ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B0693001199
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF79C399025;
	Mon,  2 Mar 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQ03lgPk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ORT+6zeZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E791239B97D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446621; cv=none; b=WIla8okFMoJw8LNUOZxAQDOR8SKMW1dZm3FaC06hq2+ABkTl6p/Nf+DrWLk88YL/Um+EoL2vw+3OifUhJKNJuti3w3yd8Dn6gJbfjKVRmLbXeqWOCiPG/ridUXOWXMlmasDVUwJ4MdKfLFG2yuZmbSkvF55OIZoxcXGA/a2iNas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446621; c=relaxed/simple;
	bh=l6qF56iWoRGNqI069v47BtcgH6zLg4aJRqOCSG0CR/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+IGM7rN619BQElzAO+F4YWjfNqFP0C/MbCM/vlYxRyQYNKL+mOQwuW8JwnJT8fYvJngsO5jDplZzcFI2LN+TGH1L5kcxggudUaIBTTkw89HcetLcGFgmN0jlOjlmWnVSxHYQ46kzd44L+dhYsnMIleVv4gE5HOsuUdNlWuDWi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQ03lgPk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ORT+6zeZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JYxB3741845
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 10:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fhbisyq0Dy2Ld9ToYXKJFdDHy1ZBfIVZJkoz2FtTZeQ=; b=kQ03lgPk1DE5gUGb
	C9AVFOjftCdMWNJFhY1UooycvvJPSWzpVDFepfNUEa1TOr9tn5VJLFwAAZURLNUQ
	Hj3bJ4yM29uxWte3LwRbIH1fTcvNXphH1MifJMY8C5XpHglO+I6aGoxvnrRJVxJT
	ShxUnHB4wTvfM75PFWMstEJIgkmIjFbU2WLn5nGZQ+ujiGPPfcJXpbhGmdlqSg8h
	2lTC7UkH44QOblScP/cbmw1Nm716a/EHhDQcfGnDMypJCbB1iG3u6PfaWagDFbJx
	5poGl9ZfYxp/fVOv8d0Oq30KjdmaE+fy+4D+q+0bakTf9mQeSa2L5EnFgu0K4qiA
	MHZKvw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trg775-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 10:16:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a012f8ab7so2489186d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446617; x=1773051417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fhbisyq0Dy2Ld9ToYXKJFdDHy1ZBfIVZJkoz2FtTZeQ=;
        b=ORT+6zeZwKTiOBORjWPsBqxtktLYa8UjWYX4vc+ddRQ9RGWv7OGem+NXLvWEEFRwYL
         VVyuMFWMQyuvHbaSh+l/S43axDSfRsPWrh/oSGyhGk2MiwQnvxlZ6okZU/IzIeHvBKV9
         sqysnllTX2pLgrvb9fXqTsMsqdZ1zb5ix7jg0yp2AeL8/o+oPIgjhjDDLqJExYTb/1V6
         xilg+ua62BVcl2jfhvpgfVQen/RGNqy4X8He2oaCTlERJQoPP/ykswFX/Q1pfH9GEbPf
         UmDHtFzhTarLKeQzmBRE0cKLgUICqkcs6ikpOcSjiH2xPsgEd0XWWE9EcLVIuCbA+9RY
         ivkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446617; x=1773051417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fhbisyq0Dy2Ld9ToYXKJFdDHy1ZBfIVZJkoz2FtTZeQ=;
        b=KYyWyfc7O1+SkkOMch0g2m5mvBtSXEW0TJeFSP1OHhszf21MCsEejnslSrk9OEBnKe
         njdWbbINaSI70D4eTCerf8GxWBjsdEmjX0skBVZrdkbK2eFYHT9XLdBrGXNroVRg4e8E
         JlAFrbctGyWFPmsImsu+40PGFHVWEY5fqbnIowtNLmtVRHa/4R81qNb68xMyZndI2xAh
         E1ewWs4FC+5L6yxZN6vFSkiylgETyOMWWtgyQ5P0KIOGsCn3RLoJQKV1ZtDUAAkUNum5
         VEziUxrAFwAxfB4uljWOvf11WwLVefSbEVch9sfkBDWRRNqhEcK6J9wCvyuBnV6/wjMG
         ysIw==
X-Forwarded-Encrypted: i=1; AJvYcCUybtfqgX6XMS7xXJ0gCGZgJU6RGKBv7psW4BW1bT5iA84/EacozVGgoWYJeapLqVVKsro2uVfSGPNtjsnU@vger.kernel.org
X-Gm-Message-State: AOJu0YwadZyeINIjgKpIKEW190wfmZ8GiWokSMIqzfRlTFttgC1jssQs
	yrpwjiGJK8Eh6ypkB9Xa4JZ3kZERi/zG5eLJFYAWaR51wyG710gEtGzfdXZQ10qT5Ie7X4wYBtc
	ozUS3YB16EK9U2tOq65lEsEo07cbgvCa4VqQ1gJ4AeHEZ1Ay6RVVtgIQWCDF3q31TLsrS
X-Gm-Gg: ATEYQzynGgxDrsGNB7rIM5FYQaD0LvGPo7V8IkYfa+RS1s///T8qUqgGPZnLyddOiHj
	Rosi01NebYilm4rZCih7yqB/Mg10hR/37ZoOIrIoWBOUqY5CrPfpvcl72lfM2z31mvQpRJiHMd/
	ZspW6OcRvu+vY1CiAnyXrH146GS9ded/4jbKMrikBIF0WeJZRs1u29SZdh4hkP2zJx6HN0/+gkc
	8XLQMftEDHqMIUJEhmhovYwi0JydXd3Ikeactm8TSEy4Okh3A1SNxahCjuKCnsHPLzsbBO6Thkd
	wNX7rSbCg51HPZoA0Q0irhLXsGtLoJAvrPR3dvxGsFXJHwEBjKrDwOFqlRF2SZRxIxkPqONWyNv
	R0RInP8pZ9CEjzK1LTcfOmBUHQ0m+sBWIGHiL6tmUzdPJuvaUAThRF1/uyWTOOoSOrcAF4ObkFp
	PHSyU=
X-Received: by 2002:a0c:c24b:0:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-899f3a91c31mr32541596d6.1.1772446617104;
        Mon, 02 Mar 2026 02:16:57 -0800 (PST)
X-Received: by 2002:a0c:c24b:0:b0:899:f3a9:19dc with SMTP id 6a1803df08f44-899f3a91c31mr32541446d6.1.1772446616697;
        Mon, 02 Mar 2026 02:16:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae612f7sm465697266b.36.2026.03.02.02.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:16:56 -0800 (PST)
Message-ID: <62fcfa0e-b65b-4c72-a113-54f8769d719d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 11:16:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] media: qcom: iris: don't use function
 indirection in gen2-specific code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-6-acf036a3c84c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-6-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NSBTYWx0ZWRfXwlRvfGKnOmxW
 1CHw69Vi4/OLAVZV4JTCqK64d/elKonon2jEXwMb+PZ8uuzVl3KjTThcp/qlzrEmrvDmp94XF+Z
 wIEPHxw6aP+lSJMtDOY2fw+r6pfCWsS9lipxbJcHeLPsFfl7MEuMqMeh8FLMwQF3PLaqr79YTox
 Do/Ia1CPumZx3Q3z1l3haTuPjV5cIxMIDznt50CX5vIlcGY+eDFZzNcBYUoE62nY3M5SP+H1c56
 MVYZo2UmfTpHH64YlPSQu5IFCRgWY/vWkPSp7SfY06nAcs4QKa6b6TSvpefk8re6YABr5Z+5t74
 coOPQX6IYj1oUCbEZPIKJQohKN16s1205cEYqSxYxG5RcaI06tsR9bceM0XFI3/uQQ3Wqke1nqZ
 xaI6vP0cYweJSJuE0CV4VPkB6VYbmuvwN1dnS7jdVRYR6WuWAcOZAu32RPEp8qXV6yQYI+g5on4
 +R3CbQXOvfzRQ6OhbZQ==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a5639a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r0tmI6SDdCBRctQ-yBEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: is79K55EmQ2QhKdtshRCLJJPFBA62-tv
X-Proofpoint-GUID: is79K55EmQ2QhKdtshRCLJJPFBA62-tv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94843-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB18D1D65ED
X-Rspamd-Action: no action

On 2/28/26 4:26 PM, Dmitry Baryshkov wrote:
> To note that iris_set_num_comv() is gen2-internal, rename it to
> iris_hfi_gen2_set_num_comv() and then stop using hfi_ops indirection to
> set session property (like other functions in this file do).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

