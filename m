Return-Path: <linux-arm-msm+bounces-112172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SL4CKk4TKGof9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:21:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F19FC6607EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:21:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fkrMf1wO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j1SSJZKv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112172-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112172-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1CB630888A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763E61E47CC;
	Tue,  9 Jun 2026 13:15:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D80B1DE8BE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:15:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010923; cv=none; b=VSvjvRWyUd9bornX2pNzvKgCBDb2ujaGZ64unCRbd8cZGOuJi0dnmJCCOTPviXidbJFBHQlt0wKiXSutr/z4dKHVAMt6P7d/9FYxchsdL9J1SKWRDtEL7wYpw2tanKV3QQD2PEteFcwFUnh9bEWGW3iXo2yIXIJYMTxKXOLAltg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010923; c=relaxed/simple;
	bh=Lb/MZXyMjJM/nnkIwYyOQRhGKpbuBykgD/YE4HiGR+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCU+7MtX23FVsemgo3SYRpgMhIAgFZTEBYakUpGxUBSd1QAGjE+JDuTFXZcMHNLpNu9LCh1ldo2dPoMu7CeKIgIH3ocTf3tBuyxIlIVbXYZz5osgPPy3U9hUxkOWiaI6q2vfTeBTlROVQgiYPFNDUWD28mtfhUu+0tXZG+QQtKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkrMf1wO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j1SSJZKv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClLa6652209
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J36Lv/6KiRlprtNoYGijhIbdhXLKcydnuqjl+rojm0U=; b=fkrMf1wOKUAkVzkT
	Ran5OLFziSmE4WbKyYaeT0mm5NG3AEq9xoPWPg3Efso18tni7lmwHfJIukw1BOEP
	fS7YjRc8lcAZt2pdIGoyVcuohfoke7KvqHoKjSwVNcUYVfifoCXiQQGmnw1G6yH8
	lMtoTmqLYVDNzS01fGqC8Dc4vyfpRIq1oDwltAtJB+Db1xTcwTbGJtSvXQO+UHV2
	gaAG2BxvP6dyQ6/ZGqNTXMXbmhC8o5wsoy8Jy1qzOsPWbeqVh4mpiLQ7Z8Em3uaS
	hj+841qOhYp6I1XJNmsgUo26Nnjsk+iNkeu41nK6XobtlJvMVbeLbvDuhU0/KqF7
	W68BpQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ssass-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:15:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c5a5133221so198654137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781010921; x=1781615721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J36Lv/6KiRlprtNoYGijhIbdhXLKcydnuqjl+rojm0U=;
        b=j1SSJZKvxa1HJF1i9XA/K8YT8jqDg/L6oFkA/p9QC9jIjgmLWSCgWFBzsScjkTLyBv
         w0SVHQFy33an3iBAXmYeqHNlZhHv+Zqro/QRYpQs9VwAWwXNtrBX7aaWwi/3X882NvNJ
         T6bcAQEt1LQCll7P4nKt568yhs5rSz5BCARbi0F09E78tvPp2h2DHMrZ5aZJLky3XEut
         Dr9+tuR8Puv9gmRQaoRThP7ZWS4qsouQCYuJ6yMFSF35jMYkv3NHwcXGQ9YmhtyCrnVD
         qb2U0vwTwXufUzeRREeTu4OP9W6l+e2yMXJGo24Azfqb2dPFWqU8Dw1M0EP7iLr+9iXT
         bJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010921; x=1781615721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J36Lv/6KiRlprtNoYGijhIbdhXLKcydnuqjl+rojm0U=;
        b=mCwoXEVFcWcILLWpJr3Sd+8IDhoojEVUQqnHvykBX+2062lQAO03RJY6+IBPSWneja
         e4XL229Z9/vBgNmLYJVG4AvLmNs/yCeIbFk9qsAtBO8mjlkZ86SOVKROWQpYknHHbMk0
         y9kfHhrsPUf5Kpy6+VWikR16itlXHx173BYzXhnve+Z/lwzGjM+hBnzZ5tWtFjmKV2NP
         gT2NVXQ05K6mTl6u+KTV0lhVlHdDkBSuXENDfJzubRC+yaCYD/OASa/HBc8KUFRz0qoi
         vXpHTtfbLI8jdHyYZIdhGo9GWho/dHpVFXxq0AqspZ0KOBAfrotQyuk+ls3cxT3fcXKS
         g57g==
X-Gm-Message-State: AOJu0YzmbM2CvWPT3Th233KVU6zQuYBGrfVQDPIiFQOKKlJs1qPJWwHK
	1oxGM30QKYSQhDlsfhbRCUDXrLt1nVXa1K3LzugUdI/gcOI9y+TkkQj0oYywuaOnZLtAXK9l15I
	ISy/00eXz4lIQs2RUfTMRlO2bhH+3VLJGY0MTQqXagyeBgHyc0AkNNbfJmfJogqOQZ9yb
X-Gm-Gg: Acq92OGrI2gFdpYRWASm/5oW7nMlCR29Yt9KiZ3PcheihIwzLJB3j5JtttB5sUUM7gp
	83LzdAdcjvQJlWyl3tImtgnf5+f/ZhHcaLts2KEJpgsbua8B4eP8gQ2SDbuT5n89E0WG+ti3z9D
	uu1SZE5JPGFdg0dW89GZJSM7+dD1R3yCEbi4KN2d9Dz2sFfJKR/h6wyPs427As/WSX0uNcHIh3T
	uT+flbXy+Sq+EyIad21wQRG57StD9y/pPPFQHFjgib09xqrXjV9o8v+3tuessVoYWcQ9yqvWSnd
	GmimpGxSPAk7DUsOvFbDxRSnCle6fWn51JRxBVNA1JdFwa8perbxBvwiXNN56I5EMhBxKv4vK+C
	kG6lqf7bk3L9k8TH4efvwnPI0x2TmWYqkK9LFx80rEGdUgEOen4RLw827
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr425185137.5.1781010920629;
        Tue, 09 Jun 2026 06:15:20 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:62f:46c:40bb with SMTP id ada2fe7eead31-71925fa9013mr425100137.5.1781010917727;
        Tue, 09 Jun 2026 06:15:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm1041955966b.50.2026.06.09.06.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:15:16 -0700 (PDT)
Message-ID: <3876e21a-8462-429a-8fc3-da977f732743@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:15:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: eliza: Add missing sdc2 pin function
 mappings
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260609-eliza-pinctrl-fix-sdc2-gpios-v1-1-cce631b7e7dd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-eliza-pinctrl-fix-sdc2-gpios-v1-1-cce631b7e7dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNiBTYWx0ZWRfXyOXI6bKdH8L5
 9ipCDscWTdhygYkfouLPEZVHaLOeokj9/a0ZaDmHNRxwI/VyaRwrj/VC/JNu5AJj/TtEOZKPL/n
 VJW1TfaCR59RLmNpUorE0mrLftrvqiYSlwDjIKFA72kBJcUAg5cLpiF+2dpY/Vs67vmkTZHNg01
 Q6kChCqoeUhdWD1D/ptewtg5t68mWjoAeyOuxhZQJtDkAJtcjktfZweNxvYK2K7benRISlfG73B
 PYByFj9X+ePS5/EMFQ5q6eRbAokgMlgVqxGDHRH0BtX+mnn8JNx9iVC9LV47bFOLzK53/Zd8ihW
 Nr3P45drRV02DGbFQytwTbdnrwvWBX+YlqXwSTY4p8BF/9xtQj9VY5SQoLAo5aIB0sF1FT1xsMH
 jUpeCDl+dZ3V5bn4O0AqDY7ICBRQ30l8KZJJXiwt+c/xm3y5bN6kBRC/kJT2lAm9bSWYmyIE6i6
 KJ1LGiGfbP6G/nVu/AA==
X-Proofpoint-ORIG-GUID: n4LkxJHGtm_oCEiOrPWYZSKPz8AwITpI
X-Proofpoint-GUID: n4LkxJHGtm_oCEiOrPWYZSKPz8AwITpI
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a2811e9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jll_wphTtbybbikUofUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112172-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F19FC6607EA

On 6/9/26 2:02 PM, Abel Vesa wrote:
> GPIOs 38, 39, 48 and 49 support the SDC2 DATA function, while
> GPIO 51 supports SDC2 CMD and GPIO 62 supports SDC2 CLK.
> 
> However, the sdc2 pin function is not listed in the corresponding
> pingroup definitions, preventing these pins from being muxed for
> SDC2 operation.
> 
> Add the missing sdc2 function mappings.
> 
> Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Interesting bit that unlike other platforms we don't have a separate
group for clk/cmd/rclk

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


