Return-Path: <linux-arm-msm+bounces-118235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Y5/LQHEUGoH4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:05:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB057396E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:05:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ncSLyGGp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SFSgnNAh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118235-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118235-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4304630A4EF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C687C3FC5D9;
	Fri, 10 Jul 2026 09:58:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8836A3FBB7E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:58:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677502; cv=none; b=GSEjIFM8Sq3ySq7Ho225r2BtGzcpZbEN7GC+QhY0Vxbsm6cK5ieMshoGFG73jbkdn4Kn/SWGCUnP7JHWQdWQeLnCeS6/Y/wMCq/VEUXM+w6vPxx4YLpD+mF8zEcHht7OguuwZs93OFtz35uP82xhsd2+bd+4yUtAzeYXnUtSsIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677502; c=relaxed/simple;
	bh=qAjInHkeUeHTU5/obRlVXmq4HSKxkWkrqTV+hOURKFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bi17k9nTijxnZQWWeZnZMN5A9KClsOoh+zWhWR0cOTxZdl+Yz/VOd++sdnpEjBYQc59nAfGoQZOkfBeIrGc/TLPMte1+pEvERbnWdEj1OmRcUbfJAkhMSZyI6xSORw8I+9WDWCvu/UbVkMB8W2VMrGOROaHLgXFrB7VIkRjerQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncSLyGGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFSgnNAh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dUQm4156533
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODeSgPG8MhSR8ou+9lD99WLW4a/i5wJARDilaJz3tTw=; b=ncSLyGGpPvbrnftc
	Wz53y84iTBPH1QfzLRYrhx66/kSb3qmWwPwSTSST4N9jozoowWhT7NSxkncZuBov
	MpoxUWJe8kuhpTlwKHknrLt9RSvaVoS94jC3tuVtn7E6udHhjCTsiTWsC06Q5VZm
	Z3AxoBSrlVJnU4ZgqXzt09FJscXqAKWvL8m912Qi9roObpVAgOvdsFKVMmHrkOpa
	Fy0VSv+iuBvuzcyfD2YMXySYqqAbbUACOFtw/OhI0cO/D2DzOgL3aBv1Yq01YmTD
	XaWcP6bayY+1jgISD6ReKFfgKf+weW0eNZAVTKUvbPkdK6m6EVR/eTL+QFuyrGwD
	wJeGtQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8jr51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:58:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so2351731cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677500; x=1784282300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODeSgPG8MhSR8ou+9lD99WLW4a/i5wJARDilaJz3tTw=;
        b=SFSgnNAhjuVoQ/HRNOTZGSdq7nX4kVpIqLQTLGEly84tlFe5RNUbgKnDudYryvFqR8
         fqnOleLtKA4QccfyyJEG9qWFtK7GE262g9K8fSpFRW4Htuq356/YM/sAOhivSVPTuXNu
         lNmU5Eq+76FtqHCFilKdPTaXr7xMCGXqSVMKObeyxYKWx/Z854nYwLPLvwdwJtl9fIId
         x93rmKHB53hjJ40emz1gFkN8AEd7PO3t27SlSl7L7290r/wNv4tE5Mal7LyVKYrjEE1G
         jW2niDMSit7PD+d5S+8fDj8zEKO90xp1BqXsiyeeJ92BbfuCFqq0Hdo9gR7fnkV4//yr
         fqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677500; x=1784282300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODeSgPG8MhSR8ou+9lD99WLW4a/i5wJARDilaJz3tTw=;
        b=mM2PzaGtKa6lP38x56lBuGSNNK85bvje1qP3dZr+ydXPUIe4Hu0Zi7UG0ShmSUqJy9
         UReG8Ltg0CTYZhKeF812ZW4lquIzWzM8jh4VpNvC9PJSZZ9jzX9y/rjuEX3B2JykuqLO
         8kGOBhs6WNDM1dKyzbXZW2o0pBjnFjaoFoGUuaxzxQuVkTTrO/T2iGMqaLkhPMJmL071
         iEG2TtiboG2+kKIzBg8x/j8/igrGIOy6WjhrTxON1pUr16ZMRlmpAjoFHW8dd4R6Qo8i
         P/BVpnQIT8kJsCTLbDTRMt5MUoY/jRA0QUaIV0cwXcc1MKzaaxPqLYsai9nchR7VV80I
         B9qQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrg+BxqPEFat9wPxsyucwAGcYI5TvXSt9vbiw50U4EFvYTUYhytPDDhNzzfCs8FF4QOjU/zzo8Ol5TtkczG@vger.kernel.org
X-Gm-Message-State: AOJu0YzZCWGi/DcSaRH89+CiAcSgOil934ilDsFF+CaeihM0Q4ljZHqq
	ALGwam3KJR8TpVHLz3U1Xs8rzEqhu5CHNpkTNZJ5pdHm7/UgYKC/pHVrgu3YJxWej5VBygcc2t+
	ueTJiwPWtRBBo2osinlUqEE2TBSsfYHy6wQ16uKwBqOfPH9s3VCk8/HuYj7vvBYkVoVsT
X-Gm-Gg: AfdE7cn8eyoE0JnM6D3mldRt0dMa/8DSdBhPkXbfU0oskmkdR8vECqS7Uw88IXvyil7
	xVy+Y013txcTnaczBeMTUjYjnz2MJzab6wOZB622fCU0FV76XN/tw5h87meVJ4rDnetS58yy8Dw
	AMMyN1O3hWImOAIfMjzhu9xidrw834NYr3Cte1tvDvZHyqshXdgMVzwwLNfqmsFJFxsAkOplFfd
	ZnEzYTkCsGXdMSGQZmbzKBtbtBauGAFE+2c99oNIhMhDtU6qwO7/7pmL2RmvIN8FgEjTdlx89zY
	v8qyerXyE8nBKc4gQz9BaMxyemwSRbLgtIebBN6ygjJKAohgu/XPHaHEWRkY49k6tbvHzuW26B0
	WVLEPgvuX76Tv0QeZUghV3By3JrLl889LZp4=
X-Received: by 2002:a05:622a:28a:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c965f67ecmr66969401cf.2.1783677499928;
        Fri, 10 Jul 2026 02:58:19 -0700 (PDT)
X-Received: by 2002:a05:622a:28a:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c965f67ecmr66969141cf.2.1783677499587;
        Fri, 10 Jul 2026 02:58:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e6286a5csm225060266b.11.2026.07.10.02.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:58:18 -0700 (PDT)
Message-ID: <8e4a1fad-3b77-4dc0-b4da-86781ea7e571@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:58:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yYjaTJFSXLvtfP22mYHTHSaYbyFhzYAo
X-Proofpoint-ORIG-GUID: yYjaTJFSXLvtfP22mYHTHSaYbyFhzYAo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5OCBTYWx0ZWRfX4H+CthpUAVzk
 t6GCJc4ebGZf/R9kFO9HF7Adxg1xawkTTWmEC7pdfkQ92eHmUzTlU0t6gwbaa6WPC/A5gMJu14G
 RiikvIlagpfEhDGiD89nc/q/kvyFjlI=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50c23c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=DccJuX7HoWOZ6YIWSGUA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5OCBTYWx0ZWRfXys4BsA9TAcoE
 xYOUkUctY/CQI8djLqRVs/LpMLekLOmILgJhr3gDyCw7z3SyVphvLwXP+lhmtzjx+natyIbTMeO
 CpnDm9B2jB7aWqiDF1SZrhIQS9MchaKypy4NVE0EIgkVg7tScTk/agy3X+kuFqW5WEU9bJmZklg
 cg8ZY1+N5jXKjFvflWo7WzSrxx5rPYCo/yNPo1EPiSFi4RBwIjWhMTqXAV8QyO1Jb6XHf06iViH
 SD3Gc05pDCSYWWkftDUdkdHOtGaaMNOBgxS5iKS0rEWVp3Uhl9euOizU2dKZljxNCfSaheJYa7b
 vDjbMGSPE/3yQhNJEYUfV522gPYKxD7Lz1BjbPQqGcp/p2eUTMoAWJKqf/WbmKOGgxaCeTjFhVq
 QepiXUzowflrZtc+qlFQPdNBihATlQ3Ciuyd6RWRXDLDQFGcogNuP7Mzkz6zpUUvucjEdQUkdEA
 1UH1UrTXEiii7onUPhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118235-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,fairphone.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEB057396E6

On 7/10/26 11:53 AM, Luca Weiss wrote:
> Add the missing reset (BCR) for sdhc_2.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

