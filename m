Return-Path: <linux-arm-msm+bounces-104632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEMRMQEM72kq4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:10:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C3946E223
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C6053021B33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D064E390CB8;
	Mon, 27 Apr 2026 07:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQ3GIHZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeEZb0R5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD4390992
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273367; cv=none; b=UPWAsXTdlhf6fuK2C3R37iyBWvH3plCkgcQTgtjLjdr2SNj7oql8tkJLQ3Nl0F75wCgaVEmmYLv3lmgSa7G/l6Iu83pneXl3XG6yHx2gR9b31wGqYdPT7y4Bff45YcAbiqeUCnWQ72sVuQs1xCLO6QMclH10+35DPn+qKaWXS7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273367; c=relaxed/simple;
	bh=ORZJohmK5TJwKjIgcSQwFdPYkt1hqJn+bhGVxAAdAq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIOoL7aTsUWdjViuTKmTIhF8+1io4PAeCrxyULQpeJU8Troq3o34AK/ogUgCSg88jVoikHNVqZqQPxH7t/vOLomJY7qQdEnC/XbrO7kNSDMAT4vFu/OMpp9nKNVeFBovuF58bTyHW78+o/pylyGG1lJrdC42Q61QBpJ6QiRWDDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQ3GIHZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeEZb0R5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R3GG5d733749
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oajbEDi6AH8TeUdZXd3YtGc5zJi3hNKy8edrrTbGiuM=; b=aQ3GIHZcs17YKb0u
	U0eBA69BeL6R4GoA+CulkE3V7ta5fG3HI1aNc5Jd5Z685bIG8i20AmgM54sXpfzj
	5E4FmxnF+T/cmt1FyJZSiOFZc5/cMOuUXCheUFV3rhLOsvZwijWfeQoXhduJIimJ
	Y9OpQzg4+vg4TJRz+TNQhFb71wKN7HXP8Vov+7ql8FcrWIMdcriPKKvpU1AGatmI
	7Immk7Oy38ZIe41ZjfyRrJjUurUhTO3kuvwTwwYf878G51otJf3I33LBak2KjutJ
	gKzwqgYE2Zd3/dXXOaCW9RlONq2H1gfHNd4Xe0a5IasPXteKohaGNPpnBlJXcjuk
	UuYs6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtcvv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:02:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4678c6171so95057955ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273365; x=1777878165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oajbEDi6AH8TeUdZXd3YtGc5zJi3hNKy8edrrTbGiuM=;
        b=YeEZb0R5ZZ4VtXlVX+oK4dMN72Kmm7uVv7we+5q+G0+CEPvnQS20jwMTCK+b8XjTNN
         yqJ2C+G3MI6t0PvpHoySalZZb1qd5t9Sdc4Xa0P4pBTYmh7rgTHCk0LN2wEFcV9S5h+u
         nd8FoNC5qqrUAJYG7W3g6wZSkGK1pduXQtiG27gGAhiJRmgmy44iouQjz3tPTxyhnHy3
         ohQooAfoX4AxrpRyu7Rp9eh8PxOImXwp+KQZYYKI84zF/QHwggLITzM4XFdjSIK5dA39
         02zTkVr6g/B+F6fBY2FbX8PktuzocnzArUwOuPrHI8XJTet3pvy3xvAOblBh05npv8YV
         ECZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273365; x=1777878165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oajbEDi6AH8TeUdZXd3YtGc5zJi3hNKy8edrrTbGiuM=;
        b=CoYDw89Fumg+IjU05NVjwpivvI1/MnQWAXc0dash4THNTUKeZCwBCHnSvyGO+c1TYu
         egMUR0CL8jPf+qIHD3wzcrIsd2ldXTbUBnZiIec9gyxR7ISf48pn3xmOW96L9PFZT+sF
         +SlfIaRxQqRyQhZz7qepQJ2ZsQTY0qZFPGvs3u43foGOqcQvXQCcdJLHKmBGeYMXT5DV
         06nH/TBdmQQzFqmwJRRRH/MM3aey455nRxKFbvvs2Rpc6Z6sZUAjy5in9+xeCDwbPq+L
         SVh6i61hO5mDI8uZYT17bAMbm8BL3YkrKtdZRCpGFgBIkXjYUVIwbYkFoj6iqde1sJz1
         /bGA==
X-Forwarded-Encrypted: i=1; AFNElJ/wsCX9nPG/0r/ClHZou0txQ6VFc7dumWJxagHgLFxyzQKelcBMdX9BjumUVyn2uNY2megSS3z3BqGBEqFx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8fbJ3d8KZ0o1xUJnMvpA8K54IkCPrJ/OMpkApLcpxjeSJXqLD
	S3N2cOFufnpO6gBDZQQcqV0tW1XfL03OEluDPyKGpkBb3AoJ6fdAs6SFTAyv/s1Bqkicr0x5ZmX
	Moxqy8ULQEaY43G/gS8nStU/naJ4FgTfvbucYbL0IznOZ3blxdxjWgmCmRCZhYBWHgqlN
X-Gm-Gg: AeBDietIB6pJn7mwKApDg9Ax70xNxV9BbzwmY54k4lK1B9O1o1PIlabDwW7rwezgatU
	3SCsFbb55XxRKOl2NI6fBj7u+KOAeOl+PRh3V2/u7rysjL4bKihNS8fjooJlYQubsO4xqdEHgtK
	PpNM2ZxXctckBkzh/KFDtNCJJdBuPKwKVq5ppbqtFHoHRREl+eYhamgJPVGEF34nQWxyxC+pMmc
	yWALJ8MkDet+Xs+fQDFcXcIUDMYa/KJe9mnby/cF78Tuth4CdEmzvnI18cUbZ/J83tbqCMo8iRM
	CI/f29NER+ec7XyLTzMIGLMGTt3WrxPl/93qhwExHCWUpsR+jqTeKI6BZvpoQ2rO7pzUDFQOBzs
	YW/LzQS54dEmjH/P0GZ4qCoJQHyfha4NPBJPz+CLnWT1PaAABvUHKTCjrqn3U
X-Received: by 2002:a05:6a20:3d85:b0:398:7912:cb05 with SMTP id adf61e73a8af0-3a08d8a3841mr48577481637.38.1777273364988;
        Mon, 27 Apr 2026 00:02:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d85:b0:398:7912:cb05 with SMTP id adf61e73a8af0-3a08d8a3841mr48577432637.38.1777273364492;
        Mon, 27 Apr 2026 00:02:44 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f94204ac8sm30251203b3a.0.2026.04.27.00.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 00:02:44 -0700 (PDT)
Message-ID: <d71b1267-11f0-47fe-955e-b1183a00df0e@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:32:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: camcc-glymur: Add camera clock controller
 driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
 <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69ef0a15 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_NJzdD1rvWRe6gqTKVsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: EV1fAbKqGisdstj2ztrzkR83gA8bfmNU
X-Proofpoint-GUID: EV1fAbKqGisdstj2ztrzkR83gA8bfmNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfXzKyO5rCmmecD
 b0pUD1PoTaMZkMOVVKLNYsNpicdNr+YTzPAfewOmZJq/yMC3ovicxjvkgkqo18SeYH4VbA+CrFh
 E1RqbD2AZyMsKgBhjJAUwXcNbDKZ3SMZmPpBVAPRLEFU0jAtjclavEQySjRKwSdiMu8tG5zi7TV
 51g3kAtG+Hs11aZ+HLKLPH4zSEr7eGe7zxLkhzBHWztIabV2PcpQmZQ7Fk3MNNIpjOrdxYrwljM
 8LJPbVEmAmR2th5ziAf1duGuj7hXtNmq+QkwrPavWRNCvnAkEw7MAAhPlEbmZoGlkFVIvNygCc5
 V/WGEIGLrEYVwRqcBbmOhW+angtFlSlzShGSxtJrwve94N9SdlFKQbAD+CHLgALXY/rR9Y2lI8+
 gMycL49q/EO08SROQELRPner6iAdkDlpo3kQD0gXuz/JFV7nT/yxbczSSoimHHnPw2AMi43BpQh
 tqYkR8+j7jBVC4lbj9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073
X-Rspamd-Queue-Id: 36C3946E223
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104632-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/2/2026 11:45 AM, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |   10 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-glymur.c | 2280 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2291 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 22eb80be60ad3bde897f2c507ac9897951fbb8fe..b8306c89ae89867a8f72e02a3c64bfb47bd672f0 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -45,6 +45,16 @@ config CLK_ELIZA_TCSRCC
>  	  Support for the TCSR clock controller on Eliza devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


