Return-Path: <linux-arm-msm+bounces-109007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOqyFSPZDmqfCgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:06:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E80135A2EE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A20F7303C299
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D6B328B4B;
	Thu, 21 May 2026 09:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNb3fa0j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0FE5I92"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547D37F754
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357491; cv=none; b=k0L2NDkMB/sqhA8Hf0lA0nUIqui+tIX2GqoBHGE/68Q67RQA97A9t8dfSgGHk3Zw8Tr4wc4TFinXLzK8Kezdc5IFD2SLmXdsWST8LYjxtK3ebeazFtJmkd1c9NQD2EzT1PDkYC1Y2m0dRJXuXW/FFjW4ZEVJgaE9j6LD71FSpYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357491; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZ2H67PLVKwfkPkocjnFhVLWu4dVY/X5NdlExKS1dghHTvzjvf95nbVysW7znVH4yyp415vhvLrNu+q4h8YwKWoY0DyyP4WIu0hSSpPoEGeQon6Zk0V5V0T7ywxOuocvBZqYbP6fsOdu+bX9VL8kIdw8g9FjebHtg6ypC4y24HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNb3fa0j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0FE5I92; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMYF620580
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=KNb3fa0jJrjbMBUu
	oGAh2ja9IPbOFC4a4TePR6g8pRkA8SYM+XpgnRrVTs9p9fgIEru3jZiTA4kl9pCb
	Hb07tcuZPhLeRhP/P8DeiZV8oGBSv9/lWRNyCAS5RB5eImwjAzwTxC7BwUrE4yWp
	EesNw1XL+Bau/2SnHUJ/KOAtenDiCge2sRxkIZ3so4pzK65QkAv6rW8vP3GtZkuG
	iNjHAlA339jPgf+HwXUhmuElkdhMx5xYJILPjsZv9CaDeOcg4ACdvLwMXAaPHmfE
	LN3POsflr8lM0v/pF/RBvou4xQwb69MdJv2fA2C5bpUqV7U0yF/OkBMqK47srkix
	1b9ksQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4d9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91345d517bdso124625485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357489; x=1779962289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=B0FE5I92lr7OgifxUKaZsZ2sp8Wo8Yquttf+nibr67QyERa9Vqr8RAaOriDT/47QUO
         /Lik+bz2OOg2MSe5JFAZ8vOFmgOGTSCJBkEGfGPvw6phxoO57hg7yrnDbRnSnm5aSiQA
         nPzio8gw4YHA3Iv9xNevU5fIKoRYxWP37da1pBwfMOyn65+FSDN/iNYp1rwFMB7DwgqO
         cLWd4ki8YTNmNnNpC8rCidCAX6Z114WYES0VYla0equA63cYq3ChMvNiOK/htTQJcWlj
         anpHN/snR7c8t2UfpFljpYpuRtFTS2WY0WggIoG++gVojd6Z4cieNth/OZxAM9nNuXv0
         v60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357489; x=1779962289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=Hm11QUX0n59FZypPdk+yTRy1oMsLsYcu07kEQEsFevlcZllXbcc65cVFdFCjqZOWzi
         heHDFDR0w2Xuc1kp8MYp3lbQMnq5J7fCkTbZWfrF8Al61qod60e/lQ/NdFvBvhtmPQmA
         C1eExMqNUrDbepIMjLJvfmwsM+ahb/W+Q59IwM2r/mXwzk5BdSHosbkMdAMsNFew9THn
         aQi3GzftXVxeoByb7bBo+boGGqdXi6rtf/OXH72RheSO0WDZhuqP4QYXwHP/Rkg2Fx49
         ADM5Hahfm8SLXCbO5dZsAKyazoOn5du+W/wkmZTpJ+r0jjZ/MXXihe4vCNOSnOK+c1cn
         FvWw==
X-Gm-Message-State: AOJu0Yw1XqtWqToW/Gg9/+rRYpldEUmP+EjA46WduWTzTgGVO5sHGtLy
	neXWel6J9MQIKwPVP1nYziFffzasCjildE2jFNFseNYUYThXUeh1L5PL+tqURjraiwNC53guVsp
	75TOyAOKnA/50O1bo9uAcg4KmrhQRlVNKQ+K68DNTotMJiqM8me8V+0cy9iwE4z01UklK
X-Gm-Gg: Acq92OG3nvVWcAs9YNaRtVc2QK2R0EmfJ2DCJoQzD3iWJK9KtRUp6+D+6zKse2R7l6M
	PZ7X0Q2azwr4ILW6qt6YdwLGvhwCP5njvh8gmAeCdnuQ10XkqGfhtNmJrR5Sj5byrsbUrcHUysw
	8rmKKR1aMtwDsDgXsZbIGXxiTDfT+qmOzp6BjhHN3OO83SqVB5HvV9OBwTnmrjRsjUrhwW3aiRR
	hjnVP0iKjmuhLw3BZeXxePreMrSB58akRoD8vXNCn6V3UXViVrUxr3VH9FvFNM70UZvlOsFYUkA
	wfh8igcwrrepo2fi0888b6pXJhJk7cU6CT6RyE/+gcLiupWWteqjAs+SGwaaTamK9zonMmoLM+J
	HpUIPGtSMvmoxZQnFNRGDln+0snSqnvfBRLK3KPNHSk7yHg32QS1qwcEj5fp6bqFwWHroUBlL+Y
	NBUj1kuku6gJehNQ==
X-Received: by 2002:a05:620a:4049:b0:8f3:5988:f97c with SMTP id af79cd13be357-914a2cc83e5mr168307685a.3.1779357488723;
        Thu, 21 May 2026 02:58:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:8f3:5988:f97c with SMTP id af79cd13be357-914a2cc83e5mr168306385a.3.1779357488231;
        Thu, 21 May 2026 02:58:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87e79df9sm24655866b.17.2026.05.21.02.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:07 -0700 (PDT)
Message-ID: <6a8c1779-202c-4ade-8a87-cf42618adde3@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sdm845: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-1-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-1-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX/Cmypq9Mvk5n
 2K0oTGIluO8Ugzm6PA5LMFFuMhWexfHeTOkF/e3EB3knf9oAy8aghS/zqcB5qEm+KXgAW8MqZOc
 uSO0WzZ9J1qVnPLWabjgY1is1KEiFvfKchWa2G+InOWoMQrT68V9so1ZGPv487pfwmS3MEqp+YR
 AwVi7NRAFSIWExjxzQKrh7cFUF3MDWdY47nXPV6IWRH0FXon4Q5RJ10U5pWdyArZGR3eblHxt/o
 xu6nnnN+tr4NhODomkW5uWYGXwgq7snAXcwCcnC29EXNoRPx7HnpvP21ZSa6yhv74Ab5x2IjFYl
 b2oYvj7t1HcPQpxWYaUXs3D7kbCtcWvuQJAPQtjN2oSfS3zVOjw88LIafUBwNgRz8ePRl/2G2aZ
 m45VzAlNZf0KJFRnEA9bvwNwFuCSdwCjcLYE/3EIySk/L5YpAyvZPFwQVVbnWoWl/4V3cjoRhqQ
 /+OUwj/wjwq6T1MsqOQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ed731 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FHbJj4e0qvqWVXluVRgwyBWCwL53g8Mb
X-Proofpoint-ORIG-GUID: FHbJj4e0qvqWVXluVRgwyBWCwL53g8Mb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109007-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E80135A2EE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

