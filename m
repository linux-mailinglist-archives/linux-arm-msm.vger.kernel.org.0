Return-Path: <linux-arm-msm+bounces-110502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJvDLUcWHWqIVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 07:19:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3A6199E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 07:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BA543002522
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 05:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BF7285058;
	Mon,  1 Jun 2026 05:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFrqPalp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRCM/QLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14BB3346A0
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 05:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780291137; cv=none; b=MdM2TgKj1FnrakV+A3+/jbQM3Q0OlmlRDVgP4HuRC8aUhukFyh6vUG2rHncfNuiwOA3UANY9hJt7GkVc32I7/SjiOa4V1nhwr3V+e28pN6NJJIiZLw/JamgClyFSuNFSzcuIdp32p5zMpsp8ODuu64m9Asv7bYps1p6K/GVHjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780291137; c=relaxed/simple;
	bh=p7AWCj1C8bqHYIdpczNIePK8me3XA5oaofDf2GD+x9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyX0Oyj4eenVj0yKnhF+MY7tKRdok4ZyOpctpuv/M/uA3wcJXdG8eEQaJ/fnCm3I4NzgneZ69uN9r5vwsNcmUauI5FZ9IX1dY3/X9WiNj/J29nFU+3Jf9WfNoz6WR5RBqRw+rMN2Rv3Y4/94KtqlQWOlGB430sfusKzSqXaXhvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFrqPalp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRCM/QLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6514fHot1641315
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 05:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlSMMMtaXrLtkNd5wTU6dZS175RnMVkwyaFlPWPKcGs=; b=iFrqPalpV6+rP36x
	ip9iqidrG3pmJD0GKvW+pZ5W0fkc2gxG5r7JwZEvs5sVwm/iGDCuPDLbVJcLAn52
	8KqtCuOXpTat1FIilnO+one/3RAapdJxmWN6KyrAjdfZCQM9ARR0f0JOfiikPe6G
	pb16IcDQKtXAi0fnunbnfSvGEM2wGQzDG0+t41jje1Pln0QYmjmX259GB6Vz/M4j
	roGHQ89W7/3slFKPXsfQ8yIBq2FvgUKQTmyq7Pu3O/nWO4InZdCiJuQTH7OUKGWX
	TlHpxu9zeOTp4ErQ9bhKp86os32UEPecA7N7rea7ednAGopLwHsCTXm/O44oqO4F
	qJ4ZTA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fduwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:18:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so18983285ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 22:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780291134; x=1780895934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlSMMMtaXrLtkNd5wTU6dZS175RnMVkwyaFlPWPKcGs=;
        b=NRCM/QLbaTAZE5s1HIljovU64z8ASTWZVJwhYnP7zagxv2OEo9KefpiFVJWemH7XuG
         0cSRZemKcoHBWIJEbrX/usdD9drhBHE7S6bAOHEgJzYdGevdOCjFm77eo0Eork+sCjtF
         tnrKL2Ac3pxbbGO27JWMoEOH+6kOKPVLTMNPzZOoi32VOsmmaa+hkq02Tb/EYVXsrW0R
         IwYENJBqcduoVGZo5OdCsn9SEX5R1ydlTkRHMIrLu6HAIC0UXYGForMHTz7qIUr4KP1B
         c9uLM7Wz/zS6DGkxjY4QRoakHNEAvr6mCp9OHmw0gJRA5DltfFIkNzBQd+DMm6owXA3M
         /DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780291134; x=1780895934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlSMMMtaXrLtkNd5wTU6dZS175RnMVkwyaFlPWPKcGs=;
        b=UJgJ/I/8b0d/8/rvDfaFj/Eti2iQMpyYOSyH4dRT9Uqfiw8BhaCFNB8gvMc2HwzCd2
         aIKyHiCM29I1L+kiTKQWx8obBnwbx1AJXM0BH0ml2NtjMkb4RJol9I+8pdjx6YPy1E8I
         bKH91+2ZYh3mtlmERi3bdyYHTR1djvLQ1/2zve5zv9FWT1P4C5RHhWTRR0YCt6/XugOM
         cegvDEI/K7m4ajLQ4iPyiLADfTWx0wnKNzr4yt/P17URhpkWeNYKqysOH1gwCn7gi890
         EFoiNZdFL0K74Q4/MC3nOJjdoEPb4KNWj6jizodDiFG+Vr1DOWPB9a1QToY5kg29zSPP
         eNTw==
X-Gm-Message-State: AOJu0YyxTqyfB+Fza+y+XUnFjCIxpgHr071uXeI8/u5TrpJNUanN6aKY
	DwjVBhlTLPl4LcOs+ists2ZG25Bapli9nMI2VFtNPDGD0J+cIX0zgqRdDUOoTtt5dkLKgf9vVd7
	e3WXMvQwRi6zDaFBnWURkb7wUrGFF1lsMfTPMiaSDl4/wDlHrYnywh3zh2nOSgKpp9MMl
X-Gm-Gg: Acq92OHEGBD3zx864bLYBdDeUvC+/x0w/DhL0IV+VXisID306IkvSDDZyk4ILUofZe4
	4AaQB+CAQLiAs+KxpCEY3Dv01QumrA9nTD3bSivflA7SchomS5gMt0KXGgZ8nLCodfHMQ/Gm/jT
	8Ws5illOSZqAcEBT1vnOwLGO6YWsunLEyNcMsgcXfB1vsbhXZMhUAiZ31IOwkQ0cqcZYBDWEM8z
	GiPCWFDPfVIiLcCyhWJWZdX35SXCRGyKVfoqT9/s7bXs2Kj2dZncB1uNwSCaaasI40TnvXsZXUu
	KSFggL1plHjSuAQLGVwkT0ox6sNoEKQ69wglOS3LGcq7map0TFBEnArr2mRqmrOGZhWOLfvtC7N
	2kfGxOV+Nmvi+m1U+eZFGjIX9t/GB/G1ZZK4uZR7d6E6xFVFo0KUSrq763ue/89pwi30IL8N4MM
	KqX+qOdnZFVNdB2yoVmyufZprT
X-Received: by 2002:a17:903:1905:b0:2bf:2188:a916 with SMTP id d9443c01a7336-2bf367a87e1mr110120655ad.10.1780291134325;
        Sun, 31 May 2026 22:18:54 -0700 (PDT)
X-Received: by 2002:a17:903:1905:b0:2bf:2188:a916 with SMTP id d9443c01a7336-2bf367a87e1mr110120185ad.10.1780291133907;
        Sun, 31 May 2026 22:18:53 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011ecsm93533405ad.39.2026.05.31.22.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:18:53 -0700 (PDT)
Message-ID: <0334b4ce-e696-422f-9aaf-42a7b58706bd@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 13:18:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] pinctrl: qcom: spmi-gpio: Add bidirectional
 level-shifter function support
To: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <CAD++jLnK1PwLcjeFuv1sCYhe9WQLi6MN6S8UHO_poh28iEFKVg@mail.gmail.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <CAD++jLnK1PwLcjeFuv1sCYhe9WQLi6MN6S8UHO_poh28iEFKVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: G3Y1Wa07PQkLVhzrahoydD5oQlUt0kRH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA1MSBTYWx0ZWRfX/ekwQxJhpZX2
 UB+TB4BF3Qw+lLLjVmKcnezTMGMNYaPr7C8lHccXcMYH6KRShtpQ8eWeP1hlAcYAupaC6lv8Igf
 xotbjh6OD+h6SXnXu16QrN7qur0Dgz4LHr65BXJHB70rD7xvHZ/x94PAimZeLCPZ0RF3Fz4J8Kf
 S/31fSaQZ+x8yyySBXLRwKXrUE9QHwqw+7tNyOk2yAXZVtDheGG28N6ycFrAiuOQn9iYAx4wCPh
 H7OBV7ckDQBzKHCK0wXGjRwsqcpIPchoO0gpGl3Whxz8g53uX2UGUAh8W0YTyfUODlP3ODYy65g
 AQbd9HuUkhbI8uNjfI8dK+qtpUjd6ipmwGrqoXtP6y2rGe76Ir7cjQI4kRdh2z5FUnTjMixPy4T
 0nGys+Pk4bA1BUoV+a30yiVOYnfg15MEokfWOs19kK6L1g8d7aovxDTMuujBb5zSEZ7SYuhgdTg
 AkDkSp8jrwbghijf+wg==
X-Proofpoint-GUID: G3Y1Wa07PQkLVhzrahoydD5oQlUt0kRH
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d163f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=9AdMxfjQAAAA:20 a=EUspDBNiAAAA:8 a=yr1fWzbWVowEr98sf50A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010051
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-110502-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAF3A6199E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/30/2026 4:25 AM, Linus Walleij wrote:
> On Fri, May 29, 2026 at 3:05 AM Fenglin Wu <fenglin.wu@oss.qualcomm.com> wrote:
>
>> The PMH0101 PMIC introduces BIDIR_LVL_SHIFTER modules that provide
>> bidirectional voltage translation between 1.2 V and 1.8 V power
>> domains, targeting open-drain signal buses such as I2C. Each level
>> shifter shares its two physical pins with a corresponding pair of GPIO
>> modules, and its enable state is centrally managed by AOP firmware as
>> a shared RPMh "XOB" resource.
> (...)
>
> This cover letter has a *very* long text mass, something Andy
> Shevchenko strikingly dubbed "Dostoyevsky commitlogs".
>
> It adds completely obvious descriptions of what every
> patch does breaking the rule of "don't comment the obvious".
>
> This is usually a sign of LLM AI-assisted commit message.
> It also contains emdashes and other obvious signs of AI.
>
> In that case, please use the Assisted-by tag, because the
> LLM can then read this comment of mine and learn from it.
> https://github.com/torvalds/linux/blob/master/Documentation/process/coding-assistants.rst
>
> Yours,
> Linus Walleij

Thanks. I did use claude-4-6-sonnet for assistance. I will add following 
tag in all of the patches:

"Assisted-by: Claude:claude-4-6-sonnet"


