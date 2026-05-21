Return-Path: <linux-arm-msm+bounces-109006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIxoHaHZDmq9CgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:08:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F3E5A2F67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2BE631BF63F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB16A2D7DF1;
	Thu, 21 May 2026 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+Fh9Dyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="davHOCtR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA773806D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357318; cv=none; b=KbB7ZdhWqoRe7FKVRVqY/G7rNfJ5pgg74fv8OevYN+3Eb6f49Nqia5ONNpnH/FDQI2qHSH2Z8NmyYmdGqZimIfJ4T1q3JjR60dRWYzpsFvxzXXhIG+dWcSYoQf2Ykpsn1HnFxO3Uy5Isgsa9X7EGwa1HHHhatEm+2EzfBSef/hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357318; c=relaxed/simple;
	bh=acZGlIX+KXcHtOOGMD6pjNe+wuSPLmh6mZ6H9ohkhfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pft8LmUKf4DNQVH1nO9oQtBFeDDkjyT35bJ6m5ntBo61KFKp8ZZVheJbMwf8iTEmf1W2QV/3zrpOQNyXnD6hufQQ8ZHkkd5UNdqOoTkZvtCA+W6RgZi8Z+amyUW5aDlkNn8WfJjpaSvNMrk1ZSs4nU86BAWZ0hqpgIg6NKyCD4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+Fh9Dyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=davHOCtR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99vmC2491861
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0j+pvHdvitas62dgDJHr1H+ijvn6S0ZrLgrBvSkCvG0=; b=R+Fh9DyqwH8ZNOp/
	4W25sBa2l0kCVUiDGgjTbmtXW4TWg8h3xo45PGjIvvZVsQ04nKGTVlNqDfVixU+d
	7jeX8pjDNKqTtyP+lq+vIgyHsOZmmkq+PO/W5qsALm5B4G9AWQwJfNDbzitNw/sK
	jfTC2B2IU7xtD6uYHhTNpBmN8W8VYUB6IAqd/ZCtsqhPr4H5sB7V7ggZK1YgBFW4
	ovWoF7X9z1TtRF/GCJcWrJI+2I2oMNjUP4UfcfqJEPCcavp6vhjLWlfhW8KCUUXe
	p85oPd6ErvEdQ2YNzd3iWNm+8DOUBDC4si67JuLQf0JnWlfIvMnY59GJMt3mVx4O
	iZ9kaQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j4c2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:55:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so19010871cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357315; x=1779962115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0j+pvHdvitas62dgDJHr1H+ijvn6S0ZrLgrBvSkCvG0=;
        b=davHOCtRy2u1cI9D4hVUGOlu6muhSdgwkYg5WTN8QvaalojifJb2ug+QboVm0+2yOw
         w1E+c/5Y5suBukrTWCI8vsofAPCDgr3rjrxgsrYaP7WHt+9lyGO+1Dxkv8BVM3/eTN0a
         85uiOwXA9cl0QSbbO31CsjqsIfWtG9XoOGflQ5bx1ML+QyBwV66/XDS0EvEC/ZCUPfuL
         fEibsH0FZtH220/linyUeIX2J3h++TtDdjQS3SypuEa2m5JXPAC6Q3s5SIlFvxA+xtrG
         GOJZOWbNdSYuV8qH5tszBPBEHEekL45gZ/33OnUyvjRNK6BzNrkKRcqdZqgFHZV+DM+a
         rIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357315; x=1779962115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0j+pvHdvitas62dgDJHr1H+ijvn6S0ZrLgrBvSkCvG0=;
        b=WAUaciecuWR+0pSCmsqGLq6EFvkDpT5sWhjTY3SXLLMseJ+XljEx9Ap3A4Mxq24sV+
         bMG9u9blxfeU9ZLWmPGJBfHHefKP82DmHcUnZXc1CS0dH9o50RF9u+xdJhW9zrLgn07D
         kIqN1VEa3h3svmTOX+OGQuA9/ZvuNXzdTHCebLtdzOTHXh2f7wYjKeHoO9Xs1MKvW/O1
         eEJxlz+QUKjljc7ZqeGkZxTcDRs0ZV5hcVm2rLRfvCtM/Icv0f3FIY5Qo7N+6ljea5RF
         3Ogys1KffifbdwmcR2mU3+LNrhtQpT3n/S42lbF/DLu1n7mJkBW4lEzhnY6/yxsZqPf/
         N/bQ==
X-Gm-Message-State: AOJu0Yy1qOfyjy3OBR6RQeZhDqFWaN1u1xuudXj8sBK8cYsyl1SBywpE
	qJigH4vNvvgqhB5HIuvKtzwBPc+JMKIQxk9EhDiuSvm9OSyjFxHLJG07157YedIkI9ijKNrxL15
	RlVfU8X6IEgFVlh2q/BdSyx7Q20EMqgEol8p9Uvw89lTihsbi1G/RG8luHjsWlCCgL9mc
X-Gm-Gg: Acq92OFYMHDxdJLd00U+wT8FvYELg1QCyOxHORey6A3puupxDaFgUyTMIKO7C9QNUpW
	nhvir6Ga3OJs5i9u9XCKez7PA/EIebMFT/B4W/5qRJuKRCEwRgdD3EkoJKP4txjUo+oQcDUQNcJ
	u76Z+NEExdfY11EoQ/qKjOyd3pdgl9no7MwBAVsD7p8iXuR/KgyzVDymn7Yisxkz++QbBcQY3NI
	4Qmy4WVcdwqrEgIgItq02/LoM3ADs4DyG4uOsQEd73UMwbpa7t6NY3EanxZdvc7Bq0cgLUv9Lu7
	KZPIK24YY6hVkmdNXr4xXFCSvFz6aUM5mGSAOB0NKnlC35JLqo5Q0819UHZzo+emiIohBeQ8LUi
	twGrl09xlbGRDVhKxdT4MIG9+lxvErMnSnWSZJs9clKj+SH+nsZGzS5nSQU7d9zyAmDJ77cxr/h
	cbtHI=
X-Received: by 2002:a05:622a:607:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-516c550fa2bmr18614961cf.2.1779357315591;
        Thu, 21 May 2026 02:55:15 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-516c550fa2bmr18614691cf.2.1779357315109;
        Thu, 21 May 2026 02:55:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc878912e9sm25044766b.1.2026.05.21.02.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:55:14 -0700 (PDT)
Message-ID: <b8ca632c-310c-4647-b91d-0514feb50fa6@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:55:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency for
 everybody
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ed684 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EUmBB4W1OTKWQytM8RYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XQy8S8iQpgwm76tRMCabSwkmRfVt0Xsu
X-Proofpoint-ORIG-GUID: XQy8S8iQpgwm76tRMCabSwkmRfVt0Xsu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX82J9EC9QqeNY
 uhK8nwCbhvk51Nv6EraPI/5tCFHtHa8Z9BEXESswUwlL18QQdQmfNxlrYgGN4uyFMVlNbEzFjHu
 fCm6dkXrAbMLjHdg7RZfrzyZfg/NUuYr0BFO1uf668QP1Z60Di+t2UpVi0vqcxezJyYCuHNCM1D
 g3Cc5rpQQe9UP0pwYJ7/IVn5KOddXhpWQNtoiBqkiRuxgPcDXf+onyzjs+BwfOfBo0dKiS4XKVZ
 b9sbZl+ezCdhDbYY+lxAbJMxGB89O4LjE2ayKMlysW7B+3HWamrpgHaNVOA688EXMr7CraytyiH
 YLfXDwPzSFsPI8XRRku+x1cT98F0daVDCw+pH5i2KvqYUsuB2pC58OWmo3N8Ky+KLP53kj/G4Dv
 0oLXUHRA4j/anO+tahU9hssoemaA4s1syk5LrgcevV8PFq29PgkAz2yIk2N2dOjdiR25AtYauAZ
 2kQBcXK/o0sIcVBYKfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210098
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109006-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0F3E5A2F67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 8:51 PM, Dmitry Baryshkov wrote:
> Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
> clocks into the interconnect providers. Stop inferring this dependency
> on everybody and set it only when required. As a safety measure, make
> sure that the coresponding clock description fields are not available if
> corresponding Kconfig option isn't enabled.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> @@ -395,6 +399,7 @@ config IPQ_GCC_5210
>  config IPQ_GCC_5332
>  	tristate "IPQ5332 Global Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> +	select QCOM_NEED_INTERCONNECT_CLK
>  	help
>  	  Support for the global clock controller on ipq5332 devices.
>  	  Say Y if you want to use peripheral devices such as UART, SPI,

There's a number of entries where there's spaces instead of tabs,
Krzysztof fixed that up for interconnect earlier today

[...]

> +#if IS_REACHABLE(CONFIG_INTERCONNECT_CLK)
>  	const struct qcom_icc_hws_data *icc_hws;
>  	size_t num_icc_hws;
> +#endif
>  	unsigned int icc_first_node_id;

this uint is also only present in drivers that use icc-clk

Konrad

