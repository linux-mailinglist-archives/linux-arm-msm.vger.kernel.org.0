Return-Path: <linux-arm-msm+bounces-107383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAQFNNSZBGqwLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:33:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C5536372
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F224A3074274
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EF848A2CE;
	Wed, 13 May 2026 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXE7vLj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6cNbe9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482844279ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686165; cv=none; b=Ml32J5HJWeQKO0o1cg+xRolFL1x65Ctpmtz1eM9LLfzhgrWjZAnWj3h4CQe/ffvWjWPy1ztl6cvuNG5SA+WJFgKk+li/ARnDU/z1S2/icAuB760DVRvdroVdPDdtZK6JTlou5n12mVEPgO8muwd1YlnUoNtZnnyMKQatZ5mY1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686165; c=relaxed/simple;
	bh=/HC0rRJ7UJC1OFGA2sIIA2bvHGwVrJfXIcgr34IAgqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHJy2rXWx6eI90t71HHhtS2PZiByIrr32XJsB5EDy8wp9RmeAoPTmr3lXE8x4EKMfKpsXfteouNXFex0RvpJYXYhNLb0qTRqpVIiTk0zKJd9nhbnAk3m+g6iKmTsKzOdHi5lFuEefKgaLCW9UhZY8o9v9/wyHzMLsGogTk9e43w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXE7vLj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6cNbe9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEf9X52888500
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=; b=hXE7vLj3yu7n94+G
	2NSWc/Fje9lZq+7gEbw4ryS8rUQZeq1Jnkz6s9BIeQgmQQboDMIpATq4fN7WEAHi
	lDUwhBnUF+LXUiMGZmyWsR7eWTWh6jDUrkLuHqnlx0jtMV4uGw+/RknDesx24Jdt
	VqSsU+X3fWOvt+lJC7fSW96xxijDGr5oj3DkAzJtaf27PByg1ZO5P1pO015LWGqB
	9fOZpCbZDYnT1nSpdMWhQ2J/s+4bdSzfEyGWocGG7D4At3DJBt0QXUiwTgXOGQUH
	wOLDA/GoNbQYa+6cg0SN28f6OkYLLWLXIK85mKr0MzaFGG/WrSNVjrY4GQK4R1cv
	zea15g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghk9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:29:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc6899bfb1so55421495ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686163; x=1779290963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
        b=b6cNbe9msD0sJxJCWsp18UZSeYQWh5mSIf/ugcLExqRzQVodpFRA+kFSeRdQeADlYG
         Tr8HDkP7j7fPJKGRwHhCE2a42pghdt/gpPIItQP+fKD7lzljwYIVtWfBPaDPsjtfDY9h
         2YBpLWVQkr1hhGJXF22KlPqf4OhudBV2u4VsckVF6t0Q18s9QiezMpTyNKjCYrvYN8a+
         HZvEa5R6noWaJFiZ/3FYNw5i1lYDvkrTz3hxajqeHYxf9sm4SwsKx7aOrCmOOHJzqGFY
         XwDKchajq0zmGgMjjzatb5BdjzktFQsmoW88bWrM6zRNxVus7e5RxDQX1BcPTFWN/2sZ
         56yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686163; x=1779290963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
        b=C6Gg/0pGpFzaFB6sm1bjrN6wiQnwdnx1QtxnJ/SIdsipMBoMD2+HeVlG4kiTGJc3CY
         0FYGHyLCtWOI1yHFulzCIgNYVk1aQPYJ1tFEDjiepSFrNQd/MEeaM2N5TvoSRnxXAzBe
         sJOXpFCBc1im+Zguij/cir6zWF712aic0Um8LVS9dFnosCAhTzdwukp0ioQEykTiGl8u
         /4STvq/Yeym8h8IuUCxJM+nAHf7zwLYAGkf4rMYHA1iECnHeubd8gbFIYU6mfIe+XOHF
         U54Fwf5n7VqzEbU96iDmJU5W0UYqUZuweo1CLjgYLwgeJ6TFeahJFRXkDy3GgtICJH8J
         m5UQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UkoDQ+1WLPRnDEhbdSXv92IAuDGKMcK+ND5JaaodTpOMSA2TIyMKfzCpaSAVmUPyAA47s4yRgupPp6fak@vger.kernel.org
X-Gm-Message-State: AOJu0Yzygp3hWUrIZqFV3SW0q4fWGXowmGF3ctxVfs4rWXj0J9UIW8vz
	9MNu40a1/yrqgqc2U3cuh/hSI9YtRoBiDvDQILDvL3UD6BMEyND25dkysYrSTkg0AF4zZDZ8evQ
	hdkZjeqBM8P+A56d4FkFcIytVDcd2Habk3oBycMobuk6MgEeT82rXmpNDlalczZuUsiCk
X-Gm-Gg: Acq92OHIyjrKZrmXS+MwirxSD83VLO5BoK7WYvkkX+lk2PjOsyVkjqg2SeCoCFzAc/4
	b168VsRyl3wwwrfUxzfRVk+auHrZE2WSYIRHc6t24OLT6SMD2oTMUpb0hPapXEHm524fMb+fRGW
	n89a3vBEjXrK66wQlDeoHcI67Lh2ISZJdatzSHmswuf5npe6UVH6DQqIqvFhThivFgGpdG/EpZ1
	WcCtlsolLvolHYUUmEx7k04H6lFegxI4X8Duo55K/Fx5AFQ2nnnOOBHZiBWZydsArnsa28LZDVe
	ADGzsf4DATmlp4tvssCIo37rqgGIODQ/2fJaMOOdBGhYr/U91vj2iHiky1odZMtpInpi50NLsXF
	WCnRvOwet7DKJgDQGbvf9HhOpdMwMOPpSDcAAxFCDLIFfkFIehQ==
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd276e23b7mr45318995ad.34.1778686162692;
        Wed, 13 May 2026 08:29:22 -0700 (PDT)
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd276e23b7mr45318595ad.34.1778686162197;
        Wed, 13 May 2026 08:29:22 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bcfsm168295585ad.38.2026.05.13.08.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:29:21 -0700 (PDT)
Message-ID: <dc78ab37-c62f-489d-9497-998ec11080d6@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:59:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hed8Sd73gajjpjSZ7bM9Hl0DKe5JEucH
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a0498d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=QCtv3gAnLEb/jX3y9W1wMg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DeNt0BJpUpdqGQuxoTYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: hed8Sd73gajjpjSZ7bM9Hl0DKe5JEucH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfXyfZRlkeyV462
 3topx1DN9vX5COE6MTvUqM3rcxuXrTro4Xso3N3XHYD9yLDy+LAgOuSE0cZkzheroO+4BVCwPFF
 LdbrKDaCtke7g+nThk+k085iGHLj9Jg1Y+qvFb8w1ax0K+espw/6fkr+G7yJqCSatrGHd4EAySy
 7V7QlinLzbBXgfLSUxiWEOLRv+Vesx3mkdGpy4aDg//ZndaIDEGVCie5iilwO7r4sSeuLP2ZYTb
 rKzGy8Y8MQYdoBZTgpmxUuPXxDg9mI3MhQ46jFCm9Vy5nFu2pQwydTP6AFl9v9aZM9CBJxETgQk
 USK5ISulyvNkwyyPz5+q32L31l8tKJXKf2AwMDRWQMvPMtjRrb6n8FgrIVkHmTaFt9iWpQB/CHe
 rS8hg1tr0fRyhCe/En8+nNFJmgT6ln3YeqgjXl3CyjkJ4FslQILHsOuMkgbPGUiLMx0Dn4W0+Qz
 7KP2ZhROAaf4IAj+6hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-Rspamd-Queue-Id: 6C8C5536372
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107383-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/13/2026 7:53 PM, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Since CX and MX rails are already ON when APPS
> is active, explicit power-domain voting is not required similar to Milos.
> Hence extended the Milos camcc & videocc documentation bindings for Eliza.
> 
> The patches have been tested on Qualcomm Eliza MTP board.
> 
> Changes in v3:
> - Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
> - Dropped the defconfig patch and included the drivers as m from Kconfig itself.
> - Update the header inclusion in the milos.dtsi.
> - Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

I missed the ordering of clocks in the milos.dtsi. Please help review
with the latest series.

-- 
Thanks,
Taniya Das


