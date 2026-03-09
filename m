Return-Path: <linux-arm-msm+bounces-96223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKcyIkasrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:17:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8E237BD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 946993038283
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCAB396B96;
	Mon,  9 Mar 2026 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjdhlMsz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZvzDIsJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1176D38E112
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054796; cv=none; b=WsQO4z4IpS1RcVK7gEaKBBqoEVwCOiA4aaPTUIGS3OiEi6CoJgyyOKiy10QlxjueLO9wmQ+KtTxsQWTO+V6c2kpS0lbVo8+eBSgyuXzDWBadkTfoJn0AhkJOQetDc3MDqo4vHashKSROOalcGOQRe3R4xO0qHhuuiqVfPIYHxM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054796; c=relaxed/simple;
	bh=65dP5WdC5UX2yjnXQwUBb3CMgmtdQEWi7T3vABOE1PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aP4pCY7yMZJRKQq/ic6B7sRVcJRdFV/3xDfvSADWliCl6MmZoY7GZd0naWGZAf6+rWJUoSNK9qg1f5x9esfWGUkPMaDOu3b8BhGSe1XE5oHmLCcoPNULDKQc7fvwkzYG55/4MOOemrh8UbUiOhoogyfcHKLif5gNn4x2icRwSXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjdhlMsz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZvzDIsJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6eOX2195118
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViZa1zocX9dQk4M6JkOKAoaHQXer580SAL6DDAoGSLI=; b=UjdhlMszBBK+MaVC
	5l3h5F6zItBiWf5R8oXbQnYEhYKppH6m87+COcbgFLoeRnnzKH7ZSDvVcpfDCare
	MLK+Qg8IwIqKOlH9iRwNuOYtqe+ZhRZJ0DzAoDtliajGekLvLTPueekw4/TEiQfN
	Kx9DbpC8E2P8O6tBZKQagJvwBNs73MrLMWWZf6848HoMLJOWkWH5ehVSTAGehxXe
	xdUgm46lMu2W41kZkLEou8zq0ZLJ1PU6BiqM3C0D46YEMpFafQZEm3cUAOmz+EDE
	DM76/5lZQ56UZ5NqAh0tQyC4SOB/6S5j7XffeZH/BItcHrZJDX/C/LNG6JS7oWio
	iewesg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u86t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:13:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cb31bcdso761633285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054793; x=1773659593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViZa1zocX9dQk4M6JkOKAoaHQXer580SAL6DDAoGSLI=;
        b=DZvzDIsJuAtB6gKiFjTYqmcxYfw2PdNOmh3FWzQYRRUza1ce6LVVUQNQadR/2iv+js
         mHzYwIYZY/r3Jj0zx99YqWyJSqNtMbs9Cy7gEajsVvjdrdXnfXq3qEsPiLHijqrwGXO1
         m96EvRpDeW2lSX69V+T2qkg0qfjXtov5EjMckN1ofJm3DN9pmkuJgHU11in2Jnsci6DI
         waB2B+8ffvkHrYuGcTC5rMjp1DYoDHe6gCc4B6yAfPg9NYNn7ybMS+XaF5QI8XEqBa+o
         DyUjKlm1LfTaOa6DNI9mP1VrS/k2mSnN6wcLBFK9FQUmLQningb3COaRLwsQPVQiNSlP
         wEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054793; x=1773659593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViZa1zocX9dQk4M6JkOKAoaHQXer580SAL6DDAoGSLI=;
        b=dYD33dLtUtpONqy3l2lLWjzdFsQNZNbRC8J3XlVOc+/3U5pPrbzBIdaI3+mtphiwlW
         jokljeREmNqpCF8pTpEEt21RlSYUcjleH80AQeyJ0K/TKxHNfEUaWhG2ao836JScj5rz
         ugkrjCQr8JaFnUoTQYkJ9jQ/p/ivxJaWmcd/6dzyJZ9fNz4tpbhqphNlV5Kpw/A++GVh
         faGLN218szN4+ywRahU2oiLQRQjCQg5Fh/2EpfuNy9ZGtY2RolEvYltTlnEBqh5enl0b
         APBnRWAlo0HefvbTi54fmT5dxIqmAuOzk0ZznkWrqfagYt3W6LKeJIcAxrY45S8oWegV
         cH5Q==
X-Gm-Message-State: AOJu0YzFpwm/ljhWy4Oaxt65J37UYcbdu1+/nIpDr7Ox/w9Q/+n6lokJ
	53YKOSF+Z9ZWddqL55BuV6qkSn0iL238bYNtxJPu9/YKyl2SH9jCBtOcKkYDPmzQCGJ+4wbbCDh
	oBuUz+FeNRnMVTLvnfjgmXOkxfWh5xll0MVr2OYDYjPJKIlPcKHbJjEdAbBUgj7l53t/I
X-Gm-Gg: ATEYQzw1tFLPllK0p8UggAVAvrv2XuZVv3Ujsiu3OHMMsVSX1wcOJnFj/WwWxM1XGlg
	g5IRpEnWUFQlbnPi/wEr9KKco/2e/RWB+u8aWPaGp8kXkxTiw+8OojyNISjg1CeRGuBSUS44tbz
	In4V3ZpKZaCzhbPDLKfjZ0xqgPAJFA+LqkZGH/GacniUrjtL2tM8tsve/Z8gP/wd/g5UGmA5TC7
	1Nzq96i0jbqxwPEhRXUiEdg3x6mw6NyL4isUjzVd/VC5Yvhdy3s7c8gUyJe/cIvBrfk1MdCj/pA
	Jhm+C8y2yeen/T8IIRftWlw6r87CB2NaZcpJ94IlYbvHChyDNwj8uu4VHpp+qU0bHxCaI1SR8qz
	qRMi+XmZOUQKNz0XXLc00WjOfIiT8+ZseAGnQX1zfU9fvhsNKqTq5mnl2JFMC++WGgjfBOXHq8v
	bB0XQ=
X-Received: by 2002:a05:620a:45a0:b0:8cd:8d50:16a0 with SMTP id af79cd13be357-8cd8d501f65mr150786985a.3.1773054793399;
        Mon, 09 Mar 2026 04:13:13 -0700 (PDT)
X-Received: by 2002:a05:620a:45a0:b0:8cd:8d50:16a0 with SMTP id af79cd13be357-8cd8d501f65mr150783485a.3.1773054792899;
        Mon, 09 Mar 2026 04:13:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b7dbsm347172866b.24.2026.03.09.04.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:13:11 -0700 (PDT)
Message-ID: <a683dbdd-db32-40fe-b6de-95edcd6c6962@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:13:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] soc: qcom: ubwc: define UBWC 3.1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-2-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-2-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pIiHCpAG-kZ-1ernFj3awgIu4hly9EMH
X-Proofpoint-ORIG-GUID: pIiHCpAG-kZ-1ernFj3awgIu4hly9EMH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfX4khoW2bWve5F
 MUPWARwP5gOAZyecNuvm9LOnAAtTIcpnzVTjbJCpa+YC2QoY4fKkeo7XHFIfMbvutwoM5hVzy2k
 LNIyHXQ2DqnKf9xG9ABw8I1tgg/VHK8P6NkDXo20XhBZ2SOIXoVffR0GiIVjED5pfUQe23bGjeO
 JKG8wux9Kpf6kn9hEcXQTPWAq8+tzWJOQrkIJviHTW0K+N47KPyExkpauj7Ni4zHzU1vRfTqv6L
 ONUhkrWr8L4PoyCCZA0VXLM4IGps2pWFm2YS8JlNXp3DtqCd6boSFLEumIW1QZMtthHfWQwPFAJ
 x5j75uxDlPlWKLBZZkXQDLvejvfegr8gdnwwtyXjDAa52BD+P56RTSg8wp6N7SOPkXONWM1F3SS
 7IIgxjYh4f0YvrP43KCKAVoI2uXFlDbGeL5lTEaFiO3I8S2BSXzWJYV8ehIt1wr+1VYa1oyviHY
 MOwyo1phyAjLXdjU/0A==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aeab49 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=H6PoK_6MoztC_fAPAd4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090103
X-Rspamd-Queue-Id: C7F8E237BD6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96223-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.936];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> Follow the comment for the macrotile_mode and introduce separate
> revision for UBWC 3.0 + 8-channel macrotiling mode. It is not used by
> the database (since the drivers are not yet changed to handle it yet).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

