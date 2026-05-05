Return-Path: <linux-arm-msm+bounces-105938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD/JDrrL+Wn3EAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:51:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B9A4CBDC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC368312CD17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9FA40B6D3;
	Tue,  5 May 2026 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWf12EEh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGTLwwqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80552335064
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977793; cv=none; b=jK32DXSiJnv5nTQqj5AQXXYSCVWLtx+OoRE62D0rlbVI06kHfw+ZBP0OaeoyapO5P67Wrww0Y5nhT2176aWdhwB2oGx2EYYQyNsMJeJ/BGlz1H6Wt5ihGv9HSfrXQXMN45fGe86XPHVWlZQ8gJTQBfslWO5weUcLWH/iRzHuQYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977793; c=relaxed/simple;
	bh=qLKMIz8TXQV4dDb+2h8/+Dn015sw+5ZKiMQgZmxMFPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BST+obYAr37V9YeeGEEMyPbfFw+r+kywl4L+qB6gYv0YE0MHpOKX31IaK2067wAo3611kJFx8U2q/sUYPhdas9+ZHwjiSmrp7/dk+MRirgc6QGtoYsTq/d+urEDMyysyNroZh506jkRHr/s33CZFZ0ptdp4/D5b8SCW3RDCt2zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWf12EEh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGTLwwqA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457Ubj21186923
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdAS9bDyHzrpA9q0/nXURMOh9VypQ92s5/qXeLLLpYc=; b=RWf12EEhe6DvwMYq
	JZUn2nyQiJMgYrGnGBYacxKAE+Ub8mnaJkC5IyT6+rhbNDhyEDQ0fVvRSnm6oVUk
	88NSnV4IMCNWe+Q6DM/zEp3HcNs9xmMSISPK0/rCkmLFlYUqb41+GaIWgVNyK73Y
	MA9yrwNnnOc0A1k5l6Oj5zQlRkrgTncjRkh1yH3nUiyMn5oNsThnFD929cxlVOFU
	molrpf5xi0HN/y2NsIuwMwAuEmmI193tgByhDOe50Guq39hZfKtNER2QfjVtiiuz
	JJEkzf29LGFIcPcPuH7CiAM7crbxm02HvT4MenFRDtIvXXIaJlA7/Yzvzy6KvHN6
	JviZ3A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgby38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:43:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5753c3390b3so159543e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777977791; x=1778582591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdAS9bDyHzrpA9q0/nXURMOh9VypQ92s5/qXeLLLpYc=;
        b=BGTLwwqAqIG+RPIoy27AQFUxcEk9iGena1mVQmIA72/TA/nAMa8uO7WJE1Pe/jYsg/
         Sb4fiKZOfhwCfVhV/ZpaxGUoqM236ITeS1qJaaehUaggG+b4gOBTGO6LM4REfuUBRzij
         hxGo29QhasTnb4lL8dqCifK2c1HI8DMuAIxNA/BZL0xvB6ONeebXPp8/e3FWiTj4DPSm
         zVnH2Vw+q4Zy9TKNz5qYmzoduv7fvCPWLGIWfo21tqeLaYGwH9qsk5YP3HOWgUWTXWhY
         3xzcNCcE42i6MBCmmwfCYXG6+yz/4Jdn61d0LBA8wJvhai0tHlu0LYoXlNRKS8+bHk37
         ++KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977791; x=1778582591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdAS9bDyHzrpA9q0/nXURMOh9VypQ92s5/qXeLLLpYc=;
        b=tQ9D2p1Qvq4vGB/mh41iWKaBcBleNKCRSMY/OizhQ/RO4tAvK05kMsOwkW9ej7vEw6
         dJEoOgMXHI0/O1fZ9p7JdyMZZqoW7TUPXkFzkwy7ZBTutPrzix/ER4bCHwdLUXx4u73/
         kmdVyLYD8If3f8Z+DF8xeK8ENawo6Y9toPbVITFtRSFRjIFBSJodh38JbTIGRG1/ABhz
         DsujzTONy8I9x2WxfVM31+4Qf5WShB5ozG0zMACKCuXMLyUFO6YX8CET0B0Vse0Funed
         5drc+1DUb7gk2scclTrTN0/kHflmuC7Yk1vDKPfu80saf94shssNB0LtRrXohJTaDfZB
         ZhwQ==
X-Gm-Message-State: AOJu0YyHZsxH8nKsaZzKcNWicYOv+RaGUjUE5un5hc3tBaDSCOzlx8ri
	fXQ9peytpiTn0QtfWzl8rDvIe0ff3kAw9+Y88Y5CfTwo6LTbujC3AfCXk+0BdGPC1a2l1D9DEFe
	Vxpu18t8UgGrcjX9p4QmOSD977tFke2t+K6hWpZf8F1epdv0miy1vL2YWY69Hewnq/HoA
X-Gm-Gg: AeBDieuBE4dsQndFFaWwheSW+XY7xK9Ugo2r891r0pdS8L2NfQ3JXCj8AAjP1sjGmTj
	ceICzePNc0c3WkP7VIVQCpLwt7wtTLhzzWHQ18F6pepo1Z5SodqcxHoCyQ1dmCSaePLuoOLVCt3
	OTKjlyyRGduKsWFEHlicb2dyQS8KdwLQzx8lTcQmKQ/yDcILRvcla7p3p3wjhjRT2yFb7/+xUNg
	zvOBR51BGWS3hFsOqE/tsQHB7ERXBOrWN3BwNUezZ8bSenAmn8wvb8UVqT0Hux79KKSwsDIqePa
	Re/NWYwvEawwjIlJfrQTS/UWKS8RMeEh85KshVnrPR5lGCda/muBWxu9+FC+tKWYLBaPD+w2IM5
	4Kr2mx55nvzN9K7wqkE+p+n66dWoyimHLqsNzXi+aOg1/Ez0oSzNJFlr4Hb5sfBnJwsnTRO6Bf0
	DOmwqjLZ6119+4JQ==
X-Received: by 2002:ac5:c772:0:b0:575:24c1:f67f with SMTP id 71dfb90a1353d-575482bc392mr261813e0c.0.1777977790864;
        Tue, 05 May 2026 03:43:10 -0700 (PDT)
X-Received: by 2002:ac5:c772:0:b0:575:24c1:f67f with SMTP id 71dfb90a1353d-575482bc392mr261802e0c.0.1777977790386;
        Tue, 05 May 2026 03:43:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc28c4ea2casm170282766b.53.2026.05.05.03.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:43:09 -0700 (PDT)
Message-ID: <03cd1bbc-6d8e-4819-8cb5-a46a7d58b1b9@oss.qualcomm.com>
Date: Tue, 5 May 2026 12:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 95vj-vIMLnZSwRL_mLNfzZHBIRITrZQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwMCBTYWx0ZWRfX4QpPOIeKjIIn
 vrfwQsa7WKcx8gmT6fvKfdJDmiExRa/Gbwg9/CnPoUPxjE8o9zH6REpCvTAA1PR21LSU1K0ZYWQ
 JimvtF/WEKwqiTr6vbdgLbzgGN87BX3YCofDMto+fQcWjyp4deSIunZ2WhzCkYi00CPViU4Ddy+
 OxICbqdSccbj+nK+FTFH9DuK1ThiV5HFgo9qbTZlMq8r9g+54aT/c4ndC6+pf6EeKvJmEpJfNmP
 e/yS3CpxNQE83+gd0gJroj9toXkjcjDTxtSI4CtniqxHsCRlDaXplVSwmkRv/nSpTC2n/jmpxJv
 UcFcZdZuLjztSmHmP2ijMIKkd+HIxXe0RiVcaL1rrhrxgfkGBH79dLCZ5H+jlk6s/hFxSanARVt
 Rp2DSXafO1Z3WwY/GuasWgGAClWD1f+aB6/0iufUppQIn0ckKuUQE2ERvickL7a+mHXFPbk3OF9
 +uLArhJs5f7CMYogVLw==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9c9bf cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=LNx3DaDb6K_AIgL2L64A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 95vj-vIMLnZSwRL_mLNfzZHBIRITrZQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050100
X-Rspamd-Queue-Id: 94B9A4CBDC7
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105938-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 7:54 AM, Sneh Mankad wrote:
> The wakeup enable bit needs to be set irrespective of the SoC using PDC or
> MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
> to parent irqchip.
> 
> This is set only for PDC irqchip using additional check skip_wake_irqs
> making it impossible for MPM irqchip to detect the GPIO interrupt during
> SoC low power mode since for MPM irqchip the skip_wake_irqs is always
> false.

This describes the impact, but not the reason why this happens. Please
expand on that.

Konrad

