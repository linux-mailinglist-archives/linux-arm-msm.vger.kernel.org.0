Return-Path: <linux-arm-msm+bounces-97434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HBFOP3qs2n5dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:46:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F407281B3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E6323016EC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4767437881F;
	Fri, 13 Mar 2026 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pkt+qF9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBewJpXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D0839021D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398734; cv=none; b=XYzNTjz/cAI4r2SmWiHNlILSdfHy0AIqn1A8cI8+8HTueDU62TajJatun4rK00RcURFEDDvV+eQSMTswr40GzkHdBQ7ismd2YJaUY0zHxgilPF0kCRlWhq8gLS0aQ7lncyNVclPpw8LIOD+81uVTJpyV1hvRRqF4ffmwM1cbxWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398734; c=relaxed/simple;
	bh=Q4wE2D/Z/Ep+mMePquJMAr1ovxZ6c+4Ub9tu0h8wEuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/HfFTmulecCmWrVdf5K+t/Vgno0LzhglQuy2elBbRKZUE27Xrj3TBQn1gE88pFWpAx7DJ9mbgJqWsnQW8nPG6+sMJoXH6XvoJ+ksP0ufNDOQIjz60ucO2HfUDpwsO5JkJniM2Ev8nwL6sxVZtgKkYjRO/JLMx/k48caMcUznMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pkt+qF9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBewJpXo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7iMos2262606
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=; b=Pkt+qF9DchPUJZLX
	up0hHaSz3nVPz1xxowc7KtOhJXJ3K+bW0aKaU4wn8sEqa0l8vDGgU8u9GunZuFP4
	HYaOtKH8OKumJBCZfyMPJ2/1r1xdxDMqQq81GKZ7LsgIX+F2XiNcYhAD4Vr7Ud77
	gP/Y025cirroUnfixHVW2SYa2nyaH3uBUM9p6NsUfJ9bSqWqU/K2ilZrW+4tm08E
	p/aq1ODxs603Mw0O5f+mevah5tFdWRa42S6kQGJNB3UC7N+uPJZExbUvLvAW3zJc
	r9ywk99FvlCT9pXgZVrBUQdOHuXKukg3L7trVHvmi4WB0xjxGkucy5VUlbMZ5+EJ
	o4KmzA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4rn20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:45:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a04e9d4faso13903036d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398726; x=1774003526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=;
        b=jBewJpXoGvZ33zlCVcJuQq57+lgKF/HLrQS2tgQxjjsMbHTXGAkA0lMYuSiv7p2H+0
         mSZB/jqg8BVte4y+ApcC82geg1+sQk+eX9mbkj4XInG6/f3FPS+1zdMngoKoxlgJWrDM
         kXfp3FIHfq9jDPkQJYY8p7X36JEFz8VHEWJitMoUo90EqIf1pgaRs4ikJiPasSCjpfOi
         M6LVSfM+rfHJYrtGG5En/aK/kKvXxyNqmfeoYyfc6e/OkQB3rLTw5QhPu10ccHFcSr3m
         jTYAD65Eo1TPc4DYgsn6t/yWBo40M7j7URW1UG09Ka1WfzUT38g6W97iqA8zucXFCHfS
         x4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398726; x=1774003526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=;
        b=EHDtAO+HK10z2PIcJ23jgErUkbHxzYOYtKhyWZoNjzL6nvkkIIt/qOwXYYgnD1t8Pk
         OGuWt/wpueSSk+9GB1rkgOkclioiNwZxTR7x5V/exasoDUs5iLYjrs5dgssbyOcp/zO+
         MuzfjVmn3EYNs9EIjXtRbpymWPi+uHFXEV/uVsQQlkEjfe6p7tlwVKi1C+xphO2wTEHc
         7sxdYWzFj9Z7zTvUq5GDKTPY6PmdpKe4bLSb+TIAk971YJ737MWU3DLE34iaK5ekQu+a
         QH3LISgQ0eeSYc0Fv7tbFOODz7jRIL26iYyC/P9U4M5o+tUp9E3SNATNF80iMlGd72Hr
         dFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh/2IVHvrqrAPRY3oUF3oGQTg5G9U9w93zXUX+DNn2Kp6J7gos8bV5rmbBhchpB8mvXN2SM2RGLKnInhlj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7qpYBhcEpD04OwwmYHxvvzzWR3F4pE5GFM8vLRqsWqolEo6IW
	3AgeSR5bNF6es2AAm9iqtujBN3EC6b0lUj1PGaHe1di+2UO16FTnqdjk0pzoWGRRPqFgrMbruNT
	bA+tJwOxE+rQxwsDsQRYnpXC3EGCcDEBHdhsEdebKh2oavpQQCYCF3HxxzTflOFDUxwCy
X-Gm-Gg: ATEYQzyYzmzS/+NSVA/vGLPFJS5XJbjgXJlaE+YWfFtF59vzMnqjkdaiTkBovQNYz3D
	61UOCEveHztzY0COjVptbMS0ADbDWH8LF7GAlwggnU2DqDmWU5Xd5lWv1zK2A6Blqi95JJ993Dk
	glrY4q0T9D0NuvO51sauRiQjUXyONup0nf8/M7cgu8zEJL3t5QguvTjIatSCqPgme4TTIQ2hZu1
	5vmioUcJSm/lzEDfR4FpSHIR4eK5GC+tqA/n8r7l1OZWyNGO4IufxbbAuXl5yg9tJNWtjz6i37A
	Io97rCQqjhE4fJ6UEFih8d7qxnoN3mZDZSMV0gk+dGDlUsiA2r1SCDmhwpWvcCTqzdExFPQFnJf
	8YR1u4TqNTEnEZcDHFgMcmJH3fspy3MHwV7PCW5ejq/qPwbgKpGWTvvbyxjdoSYw138gou5wPp9
	3vV1w=
X-Received: by 2002:a05:6214:4e14:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89a81f51a27mr30450936d6.4.1773398726430;
        Fri, 13 Mar 2026 03:45:26 -0700 (PDT)
X-Received: by 2002:a05:6214:4e14:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89a81f51a27mr30450826d6.4.1773398726051;
        Fri, 13 Mar 2026 03:45:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0b7722sm36376966b.66.2026.03.13.03.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:45:25 -0700 (PDT)
Message-ID: <15d3483c-c593-4fbf-bcae-778cd960b458@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:45:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] clk: qcom: gcc-sc8180x: Refactor to use
 qcom_cc_driver_data
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-7-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-7-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ALmMeo90NSG1925cFRyuGAK7mcOrlC2p
X-Proofpoint-GUID: ALmMeo90NSG1925cFRyuGAK7mcOrlC2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NCBTYWx0ZWRfXxCQPL4w93VcI
 kaEoDYgmbYvb23EjXqK6p+ZG67vAEeK4aOsAUhTXMWdkVME7vw41T4V5OHtbbbJeBdEUNFBzF7O
 4pkdxU7dquYKWPTwP2o5oc806cP0T55QIg1SMqZF0mgFytqXLpedXiuT22/WZGPIlZtEQzmBHBm
 eN4ssOb1ei+xWeW5gWMX8vE3n2CkE2jt7rUn4jbJVtmnLZ5b1IKrfAtSX/0dDybAPj7BkrjXEEm
 b4Ew4mvCWExtZadAXw1euZ98EYz7kSTnCLmjoo++PGpG8M/tWILj8Z1uWqf2jkcMrFmX8UGQC37
 5jyUTOZZ6+RO2APhooNzq6+2OslOytIKhhvuitF0YRMCG3IRBXE0XR6EP+/2QmzE+7IFD/PdTKM
 tpak0C0r4lPImqpSmBJ1V85QXg8FZMiY7JhkS5AIvscFDyFC5el0AAmthF0V2vCNMeM7Wb5UPeO
 5maMqhebRlEfWpFQpQQ==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b3eac7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ma-uBWqLQOsuroI5m_MA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97434-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F407281B3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:12 PM, Val Packett wrote:
> Use a qcom_cc_driver_data struct instead of a long custom probe
> callback to align with modern qcom/gcc-*.c style.
> 
> No functional change intended.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

