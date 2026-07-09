Return-Path: <linux-arm-msm+bounces-117946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qCzaHKh6T2o2hwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:40:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8838E72FBDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 12:40:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Cqn8z7rh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=g6dxGFUY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117946-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117946-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7701C30F3304
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 10:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA215403B13;
	Thu,  9 Jul 2026 10:24:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B02B3FE67B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 10:24:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592673; cv=none; b=TVjhgn282HO5S69rDuuSVn78ahmAnIx21zqilHDHDfJcS2jGf7uS6fU8fi1gfpVKgyjK6riqBPRWoage6rLya09LpPFmRGTVMHdGQD480u1PiIPloC3ntEP9EQYrUiHj5S+hp8UFmgi1MyFHh5b+kZvk/ERYQkDkAi4/eRWZhTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592673; c=relaxed/simple;
	bh=j57617/J3I07BsqOpi6Z2LaQV/7ikkocYo8s6+1Xb4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S50ITihjBS1pEyqEnfMgdT1kBLTMusDsqUW3262BLlmS2keWs+UzSawUHGDYIFU8/XIKuoGmuXeR/NR7BZngIb0Jc97FtUqmtvOaXFzI4kpx8J7C4r4WLgAbZQXvOhbHc9JeEWM023LYesWM9UbJVu7NxRPrrfQO7LRVUJFQD94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cqn8z7rh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6dxGFUY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669ANd8s1315260
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 10:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x32GW5nzUaHgbY/L3XVJEL3K8MzbpF+CFO/+p4f0huY=; b=Cqn8z7rhQ2oHN5wO
	xDU5fLKebsXLXf3eM/MSTRBIHmDRRE0GnCeLMw7kMg+H/b7ZjQNisAase8PvZHU0
	cYF/zlUGQ1KrNnuXF512s3nBmDc7QsVLtg935r/ozlWUpKxYYf9ZG+Yc1dKLjnlx
	VD+wXBqXraQIm3lJ2ldUt7R8W2yymNoQxWJ0MXtEgxYn5Yixqm/xgG8N08ou25PT
	YgovKbSOWxtloUMpWUGvLF887i5bqfAzcrKbyqKfkAOLBXf7oHzt3+/QfklFIOJ8
	ZaAlj2Up5dz/ZUk4t06n1brGbP+dJ22WtO4ykn6z+J3zL9GF+KflNa2KNoEAqj33
	y7AmzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhb9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 10:24:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9e97b626so985851cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783592671; x=1784197471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x32GW5nzUaHgbY/L3XVJEL3K8MzbpF+CFO/+p4f0huY=;
        b=g6dxGFUYYCtc8a/5GZMQzWxyCt5nf14/gBXkVE8pcaHFiawdxL+4bvHqgzK23pJ0S2
         HpqAIEUidS1EFJLns9We3bsaBUIvlrv0yU91UTJfmIk7O9F1HmDuM1D4xcJbVUuvYnRE
         2pE1pP4Qze224tRStbGNtJ+ggL4wGZ7bk5DHZGvPfNeoJuoJzX9dSdlIGEeFLUaMn6xm
         liCy9aBS3VsMd83D6p4yjeipGVYlCwUKPI44BcjPVPpfxXbSVVd16q7YSC4ipT8rYdi8
         XTkL4YjgspeeB4tyYf/RAc71VPv1wFVLUsn/9mlR+P1ts2hLpQoyFpSaaZiBEOrngsdb
         Jjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592671; x=1784197471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x32GW5nzUaHgbY/L3XVJEL3K8MzbpF+CFO/+p4f0huY=;
        b=Q2clzYXw3px+2uPZsRtJf4s6pm7D9wZY2+TVkFkePEcsBI4H5ElW2EaiZA5FGVq655
         RdXEHQrpZyn7pvJSIex1fqzCb3CAF4pAJ4VO7wQnLkfVQ4qKu0hjgV6lKztk/Uxjp5Ro
         CgGkYNlWFlTLAkyAKuI9cwKGyKAdYtEzTYf3Wssj0uvZ+ZuZ6ICLiZ9yq+gzgv8zkbNo
         SW/OzeB/mtgpp+yi25bf91AIgxjFk+Y6CiH6Yannqg5wXi2F1o6bHAKma7NT9onkNDwo
         NR1/dvVD+Ly5+iollGcKBJRstJXwvyN8tl7v9G5PpNjRmPYGBnw2qd3PPWg0D1P67EP/
         ftzw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7hR9E5jPmlwigRen9L+Xs4MZ5S/uUVUuxA+FK2H0Ep7CLXcLDkgmXu5Khq6U/Gvfs1yHq8ennyl/hd/JF@vger.kernel.org
X-Gm-Message-State: AOJu0YwPl0dctwc6dtO+PFD8gG8UCv8Dh68/ZF4Tut9sAL0NsZD+H2zX
	wxOG8WJaL/spqhNrLO7rn93bksIYEYJ0rSDiJObWAnAJvRxpAp7VezqNy0TBDukxSbuiW0sKsrH
	yRqwpdUcLXvnChxvIsU9W6DNEZ345Pad3drUtUF00Tl1IYLFWPcYMhdWzXp/wMlxIpbm1
X-Gm-Gg: AfdE7ckjCbTROuLRx9iJOmmvJcOhtIX0kqGvwHINbYF1ip+EKkzkTBNNc+e/ac7Ijl2
	z6BUUshArD1jEGLaaBNEuz5RyySYmvFXbVHBqMjymMLSJP0+sYUQL0MHlEsi/VlrhxmRULitoH1
	P27KIQLBh/xaB3utu0Ot6zq+qY4zJMyN0t8J8LkltRq71jWvretYtjzSnXjrk6Za33Zrs8bwvJL
	ACF56yhvnzoo7v6mKWNyquvUJtXjutpJ3coRjOkKi1bivY577GGJGVhWB87aqf0FvEyTa4ItSCk
	qM0l+nWRDI3fLNPAshTuvqpvtzHsdEEA8BXW9SBQ3Jemi6wR158+Mn9OGqI4Fs+L2Jz/o5o3soa
	dVen/qNR43LHAlNySPkMXMO5Q26JGE6dIRBs=
X-Received: by 2002:ac8:57cc:0:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51c967ad224mr29082691cf.7.1783592670823;
        Thu, 09 Jul 2026 03:24:30 -0700 (PDT)
X-Received: by 2002:ac8:57cc:0:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51c967ad224mr29082531cf.7.1783592670379;
        Thu, 09 Jul 2026 03:24:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm285215666b.23.2026.07.09.03.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:24:29 -0700 (PDT)
Message-ID: <45a0cce2-3bc5-410d-87e7-325f3c45afd1@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 12:24:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-2-6e2bfca96088@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-knp-soccp-dt-v2-2-6e2bfca96088@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfX6ImAr4owH48s
 Ygti7L4ADvuhEmCLd5o4pF8Wu3YArj5eTowF58JulqxMtosKnJRs2qW/W68tdO1+kcLHv4ZJpXa
 O6Q+JA/4OOZXCtqux0nBdLbxXJVRyymTqxyZynWlv50BtsjrMZ8+1eitsZ9RtxHs5zvtfHNYxmf
 wEgrmgtwR7Zmmfe5xHMCPUQGp4w0LaaG/yOI//M6W9Wh2SWQQo2rC8IjHvt0Y3T3EBGYj2ROvCX
 uKAn7ferz0IOg7W/kVtrrFY+XiGdKLKefke0AGNGHBZEZdREpAcxLh8tL+cHOYikE/pIMpH1cuv
 MBMrqeJokuZ9EeWyc72wizgF//OS7htpQxEP5eyvuRz0AK728JG3crdWevoSPHplDo0qvIWHSae
 obzNWSKwYCFQ98KRaExtM39c/LxNqKfcrqRwv+TEIUAmozZHyr0Bp8oRrWfSBpkmNsu70/+jz/I
 i7XMmiZwZis9w8qFpGw==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f76df cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MlDfNhLudHztO9DQPjMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwMCBTYWx0ZWRfX7T+akvdpoZGU
 tZmlWoTfxV+XswDjWxO6C2ucFZ3iKyurz/DFZJXXl7bmmtvU3APSyEQAPPIv6dCBcBfhcux/KTg
 0hJCrpHvB5go+rr1UNB2ceLtf0XkHG8=
X-Proofpoint-ORIG-GUID: YKOP4y2NpbM7DsY7uoTioRCOItHtdTlP
X-Proofpoint-GUID: YKOP4y2NpbM7DsY7uoTioRCOItHtdTlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117946-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8838E72FBDF

On 7/9/26 10:14 AM, Jingyi Wang wrote:
> Add SoCCP node on Kaanapali QRD board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

