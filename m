Return-Path: <linux-arm-msm+bounces-116692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Vn8ONJtS2oRRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:56:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C809570E5C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:56:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bq1jokot;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="REil/aQI";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116692-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116692-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DCF930242DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252143E9C33;
	Mon,  6 Jul 2026 08:41:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEAB39E194
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:41:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327264; cv=none; b=OmeSzeD+X6InUITVeYI4iFbKf1pVV+pxdcXAjHbS1vIBHkDmhG4lM05pgcOeGgdm4Y+wb0t0J+rshWXVE1uZ6zt4nGiZTmwf7B8XF0bI4z5lFm4lECIQG0ad/X+kbp37+kfZmd9WJh1RkIXFYyhPdnsoSMSGSFnq5wsIWcQ1yJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327264; c=relaxed/simple;
	bh=7HIufWt9gVRK5+mC+4O9yuMIN8y+dLQ4wRKFYCYSneM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c593uKNhLEtPt+KiIitOAIF2Fc/7MsUpY1ZJqfLn+xnCDutEITLCWQbkydJxClN6Da8eG40UHpUaeu12rLU3ap/PIFgJ+qsMBJY5MudoImNb/r73H8WbZ2ImYOGVZKLJRzTKHrrWH8M3VhLmsbipsOKRMn+nAGKxsZQcoQKZNyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bq1jokot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REil/aQI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668dGra048595
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=; b=Bq1jokotQ2I1ybSW
	pG8Vbjp5cmexg06ZgOo7HnUcdoz++VQPK9jPrlOoDYzoLaJSiP00gdk3RZV0dGdl
	HcnOpMe8UkqIBbOu3ID5mXiOSHkWrGbn/o4RaCjxI7TUE3YgSMVyeOJwObJIZWFS
	L6e5Dw8FpN9uUp9oYfh03/1X7e1Pt8FYvReYZBaqUJaha7/g0J1nEXVeTp/lerEH
	7XARdYrlxEjVDcYf3Fy6sF1V4rU6mnKUJk05/6VmOOVk7oPy1wh80CgeekGFEm9o
	MGKW5oA9Usfw+0K616ZdPkKF8aVVNyBILDw3nWtqR7P0oqKYiMrsCQD7d8G0vY2b
	yeRsBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur073-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:40:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9105991cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327249; x=1783932049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=;
        b=REil/aQIioLZU2Hxo8kNMEIrh/fh8pxg3/1gFdI6jSX2SkiIiZFcWN8Soz+tqdl0wT
         /znHbMrYW0I9tQTo4aVqBKDSAqcRiKlghlSyhMNcAUi0m7oRZUGbKzs9dl7EHFZ66IpK
         7rWpjTtJsUJ93omy32ld/3KtC6mWqV+f+xP0o5BOmyt5+jM0wxqyXqQBKgta3pXoFKbX
         hbbGNsj6px6UxTSn12c09yChlWjYXI3fnAZaoniNOC4qbG6Q9lW92/CTzAxjuqmfoYhD
         x8NTdwqPG1X7EAKrtjajmW4/Q1ztg4BvcoGH68UC1WLfdirIVH+zWRZUCvp+MaXzfkK7
         RyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327249; x=1783932049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzwaTdZYc5k39HsbyB8BJpnbkvc/a1QYt9rl+x/9154=;
        b=FtjqaQeR0Z1DqtqkYCZVKTJX+b8tRj5X0cksXEwKHmdGzhoX8tJksS5Bl2dzz5Q81D
         eBIBIN/9PCD5b7aqxPxXf44V+/pICLeqlPGrhu+6JNiW7s5wjBtO40RbFuxlkK5PL07J
         PHxEgLq30MFtBgK+jTNTS2BobfCNqln5T6LCbVhFd1A2IfKtTf7nHIeGY/Qk2naLPPZS
         AnMsatzLArU9el5hROCNmWY59zhhzPwePDPh7d/NTpJ45O2CG34nY7KQN14vTR2zRDwC
         AXpX9B/D01ES0B6nRvMfnahqE9E9s6nNClfcYH9ZVy7pi+YJCJuaiz2z665Pc3V9D6Eh
         GCqg==
X-Forwarded-Encrypted: i=1; AHgh+RoY8C/x4Cr9J5lqb4sMToW5RAUcBNW5H+07fEh0Tu/fDNJVRytuvIXUx6e87hZHtkmXbJfomJyEGVpM8KjN@vger.kernel.org
X-Gm-Message-State: AOJu0YxedMnFkGHkdf9PyC3oW6/XXqvyCRJFMeUqDDYSt/rCJuK4H0EO
	lrApbyh6rpORgzef6m380nuMJ4Q0wMn73vhM17ayCXJ33/DM5dErVm2AfI6v9PkwTSpo3YDwJWS
	NIT19uslWiAHf6R6r1QE/FE/8IFs57Of0joARYFOnT9V2QsA9mtB8Tl525EwG0zkcS2Do
X-Gm-Gg: AfdE7clQD//djaymlEI1uIEhqqRmGhRnxwEqI7CWL9VO5MdnBoQDO2ef8ZFcYfwwXa1
	STn+TqeWPIGn0tBU6jXd74/PFIxGMj9h+wdKstcCnYNeZEBEyHxLXwA102Fd3TauyjwpDURG2Hl
	2qWFTPwnmkL91h4zai0McgpkpCxbnE167UElcL9CiwqCEKVtm8NByAVlkBGwl3jNsHHDrxnXDR+
	cylrPSDcPgQtugu57en6yoJ6+KpBKfH+Yd3mVVRnaD+cLe1T92s3aFg2w48U5wtBkjyFv2Ka+lv
	mUjjcDS91b7bb/puzI1Q/Ndt2uDF1MqIulVxZh6zcMe7hPARMebNJFe/zo0bM+Kj+zZqX+Il7LU
	HeZQkCO/WaHATj/njGKODvkoRDlYwmrH75ZE=
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr84324551cf.11.1783327249005;
        Mon, 06 Jul 2026 01:40:49 -0700 (PDT)
X-Received: by 2002:ac8:5910:0:b0:51a:8c9c:7f58 with SMTP id d75a77b69052e-51c4bf4718fmr84324361cf.11.1783327248523;
        Mon, 06 Jul 2026 01:40:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4b52sm690724266b.47.2026.07.06.01.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:40:47 -0700 (PDT)
Message-ID: <0ae3a788-2061-4bee-835f-d08ecb2a1d39@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:40:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/13] arm64: dts: qcom: sm8650: move smmu sid 1 to
 new lpac device
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-4-01d50c3e0c99@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-4-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fn8w7O_AcoBS4B01yBCu7N1knLiikfPY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfXwvBpP/ze1KXb
 iSIev65cYGzqfgvIMNWLuv4kjogEia5rf93ZYs11s+/Iv5RglxBmuk5q/iwLtSle+eGb9bhTxlc
 Eo4ccHn22faOkymKM7ODWoz+NgJkaSg=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b6a11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=cDqsbA2g2SHu6s1Cd_QA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX9GFWwrZztb1w
 N92Sll1DETGQhfswkS2SDDoQbrUG3K+tH8NgVQtQho7z2ZqDBwSN96G1tQPSQ26zG+4q5ywaS/O
 xdx72t2Ob/ITBaXbJz7qbCLuk4vArQI1HXPSC+S6Wseu2j+zQCxY7CtW0O8vnDSMQEYnYpFJcrg
 rpyRDJ8EqdVtw3QIKv2Kegty7f5ZpmPKb3wlVtjI14gFMqk441PvM6MqBxEwg8Xaj5Q4CEsbozW
 bVwJCGNxlJDIKOKkqA5egEptY2DuA0YMLyhL8C3mfpahoVLmn41+3DbWATSm/NVVCXnEwZNsJfz
 B5tbVB68f1v74BfPHxOfrRunFx9mm7BbHbTIYjVQJCDQVgguQid1fDGDLL64O5m04mck+WAVTzw
 tvIBlyZlpDz/8iLHPY0FrBFfJYKgs9qiwkDcoTr+9YIkJAFPI/lBSaVuBVOVVjVUOMORAB+QMC8
 R9qPBpRKTLhPfzUKrYw==
X-Proofpoint-ORIG-GUID: fn8w7O_AcoBS4B01yBCu7N1knLiikfPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116692-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_RECIPIENTS(0.00)[m:anna.maniscalco2000@gmail.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C809570E5C4

On 7/5/26 9:13 PM, Anna Maniscalco wrote:
> Previously both SID 0 and 1 where associated with the same domain.
> 
> When LPAC is not used this is needed so firmware can acces memory when
> initializing using the same page table as GFX.
> 
> To use LPAC however we need to move SID 1 to a different device.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 1604bc8cff37..44e5f9d4b335 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4133,6 +4133,13 @@ tcsr: clock-controller@1fc0000 {
>  			#reset-cells = <1>;
>  		};
>  
> +		lpac: lpac@3d00000 {
> +			compatible = "qcom,lpac";
> +			reg = <0x0 0x03d00000 0x0 0x61000>;
> +
> +			iommus = <&adreno_smmu 1 0x0>;
> +		};

I think this could work better as a subnode of the GPU (or perhaps
if there's no "actual" separate address space, maybe just iommu-maps?

for something also making use of the latter, see patches 1-5 of:

https://lore.kernel.org/all/20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com/

Konrad

