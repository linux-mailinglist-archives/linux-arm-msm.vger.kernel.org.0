Return-Path: <linux-arm-msm+bounces-90261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J/kN/h9cmmklQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:43:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D76D29D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE90B300C0CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0D938886E;
	Thu, 22 Jan 2026 19:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwBPpL0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPaOOQG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E789F38551A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769111030; cv=none; b=g3lCqnUfTtQnoibgZLKiXmem9aX5BFuO0h0hiZwNPbJwKaKo70n1GMnvnPsBIHPEFr08ORjk0YacU5I98jULkAhvfWPFVE1GW4dGrwpcFwcWqPjyOw8wb+U2ji3571JYlRlNQyJMGriQTpmzgECFeAVZrD6Q7tJF0TmfvFtxs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769111030; c=relaxed/simple;
	bh=9rsKXIE31gTBR0x7TqIbrMufINopJsjLamejzKyRKKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tm2L3PC2S5iRXBay2lYgb1qaVKrTSx8g5onBAAA+QCNg5Y9isPxQXuTlwVAH/WHNZt9hWqE6CASlxOmabB1raiJIoZc9pBdZL+JaTiG0wP1DCfouFtox+rfo2wt0IzR2aW55m4n8AJTsjEVGSzIFOnIUqSactKr9V/neyIwO2BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwBPpL0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPaOOQG0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MEaTgp724970
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 19:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fk3pUDgcfEz61b1Sxdo+ROI51s1I7AiQwz+sq54t1DM=; b=JwBPpL0RHrYWf5l5
	3nrdkp8ljx3hGWSD2LxEleSChAQOovVIl4EGF96H7tH2y9lxDHTNH+/22hjR0034
	fg1Es0X3OFl/UI8zw5Ql/fVvzTq/Po5G7hFf0CXZUDGF912uaCnglhgRneksZuBJ
	COUj0EY7CfJOh4efGDLzvcfy5GrcLxitOMGaU3GT8C4ipeUe5mvmlJFL9vE8+m59
	FG2ZL7asqxoVY6WV6sbIAvTaOc2N0bf3MCFdrdssY6HCeJ7k7PM4L/VEn/doLjPj
	p2o/Ieqi6Tm5aLSYJk9N5qpJMMhFQXuM8tAGCrS8xgxPok9jG7QkbYv1DTgTc17c
	MyvDRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buf1bjkff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 19:43:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so34812685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 11:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769111023; x=1769715823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fk3pUDgcfEz61b1Sxdo+ROI51s1I7AiQwz+sq54t1DM=;
        b=TPaOOQG0c+a30w+PAaGcSmJnzR0QXXxfkyIZZ/FLv+n8P/CDylje4noYVTAYMEMB2v
         Zz1C+Y7GifgeVTqMAcD3Zrn4Z02ZtpxOa2/AAbSZR9m3SAhUL4eDrbfhjbJ9oJLEPsDn
         diUWBDVMtymH7HiVRWLe1PJubAzPRaXSaIityPS1f6xjzwCw6sz7AZdj/VNkSw11+MBh
         aE7w0k7YRySL3JR4zMKqQDEZD7XiAdrviXsJkH/L8I24l/qEm5J/WXT72WUsQ1hfwQrS
         elLKtMBHPi+ZmQiJ9l4m56/0QZ+/r/OIMNNrRAjqJcrYlCecdCwnCLEK322z2enJ5tEp
         AqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769111023; x=1769715823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fk3pUDgcfEz61b1Sxdo+ROI51s1I7AiQwz+sq54t1DM=;
        b=S6QMmHz2RruUPaUspDVnavN8+KwvfPcDojGf7v9k6rzl7oVxnI8GoemHx3L79eZOCT
         qsR0JldQindYQf3WPPdgIHBlXUxzR8m7tumrgBgMC/44WF+CWQ2yftLF+dTfOH5VYHTR
         IY2d37vc/lRM5BxGGY18YWsVWASHP9ZkO6ebvTWQVreMgWUC6l1rPhuHzUrHewo5O/1C
         p/m9MCt7BhtKO3E+ltuy7jtlNg1NBBUCoNcD/o0nb6meVo+/CrpkMXMczHZ7N41ZmOu5
         Y/X7RQBTQjKadb+sdazYvpdYkhstbOG9YqFl096KCwFG1G8XLkdi3Lvj0CprqrO2BIsV
         hTig==
X-Gm-Message-State: AOJu0YxoF4ujczIRD6oi7SwqyKID+jLqH/s+INg6lHXHP11aKXhif2a+
	I7mfXDDMCtpNjoFSOn/JLoDpyaPB7g8amf+L3ep7lEcGM2T35shiScwr0VmPKVsgDJjrc4kB4Gj
	ctwsX1vqh5o98zTw0x2NnMYi462yWyuBqvlVPbua1ChIFzpSntr07TsebHQvK/Zu/33X/6zsTg0
	Kb
X-Gm-Gg: AZuq6aJeX/RWiVvuSx8PQq+6RUm9oGkXVVHmCkonTn521JlmBt9n5WtcYvj20Cm8DZj
	LGoT+qW09i+CcVmubBRBzAU/nn+6Vv1NSg6euqydBPP82Ca/9yI+j3sRCuCcjGEB6QT942PexqQ
	7g9JiDMpLP6Z7v8NPQcS/C2HQc/Q7haBcQLU4zb6kGRxIHGrk7FbQlEbwXD68Rn330ExEksTrX1
	h0q/n5PxNUFERGL0O/GpGpvy5KszAiavsK4nk1oifi5L+LNqiEDEXLrDEiGZ4lHb0jIJs/DeMvF
	DguQbg+ht93NUqcSv9YM3UvlBKkw3NShY+sFCNaj5E+8aiYPHH7SwgwKtGTd1qnOD5htQMe2jbj
	AxCc3ZqL/ejC+XN8tjBOsUzBYVHr6w18qTdUF+U9QY1tHkH4nQgDD0VYvIGI9QqeMxl0=
X-Received: by 2002:a05:620a:45a2:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c6e2e1d328mr56827185a.6.1769111023089;
        Thu, 22 Jan 2026 11:43:43 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:8c5:33bf:524c with SMTP id af79cd13be357-8c6e2e1d328mr56825685a.6.1769111022620;
        Thu, 22 Jan 2026 11:43:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3db257sm11079966b.6.2026.01.22.11.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:43:41 -0800 (PST)
Message-ID: <466605a7-c860-4691-b84f-5d1486b49bf0@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 20:43:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: msm8974: drop duplicated
 RPM_BUS_{MASTER,SLAVE}_REQ defines
To: Gabor Juhos <j4g8y7@gmail.com>, Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260122-icc-qcom-dupe-defines-v1-0-eea876c2d98f@gmail.com>
 <20260122-icc-qcom-dupe-defines-v1-2-eea876c2d98f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122-icc-qcom-dupe-defines-v1-2-eea876c2d98f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xg0WtAt-Wd-AESPSGBRp90tzO-_6t4jA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE1MSBTYWx0ZWRfX+rTPyU862igG
 gHzbQvD7fUsiKcxp/QnYpBzXc6TUDmUSPBcXI6mTZtqkwm0uAuDWts8uSAVdKotE5h1IjxsMp6y
 SRyuJ8Nw34PBL2YvS6tq4lg40m8uNAv6cgYwhkTjIIN20aNr02pFFliJ8oR6Cli/aTc6FcSlQXA
 F6A74DnIKsNg0wqew7ZxgZtlET8ZAdWVqSkR4IRblRiIncVPDXTgX1z57FwE18cbQCeGIxZp/ev
 Q6XZkzXpgeKsbSN7vgT1waW1ZRERehbX6tjBiwOlAj7/iWN1f3KQnQ2r05j8NW67UsJ6yAuNBZS
 /+sqaJijZYE+AJ3uIcEx0yVw77f6ULex0NnnNFf9oT+GoNivszKnmDElDSriPo8N7MT0nNwDOvL
 lm7gH8kqTb2SsF9eZhsRkaMRUvmd75Zzioo/RNEUlNPYhQ95lVOw7maGrdZZmUJVOKg0zVmSX3d
 gLXO0Ho8vAlaC1Ahktg==
X-Authority-Analysis: v=2.4 cv=G+0R0tk5 c=1 sm=1 tr=0 ts=69727def cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=PErah1Q9QXaL-jeRjzYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: xg0WtAt-Wd-AESPSGBRp90tzO-_6t4jA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90261-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E9D76D29D
X-Rspamd-Action: no action

On 1/22/26 8:34 PM, Gabor Juhos wrote:
> Both the RPM_BUS_MASTER_REQ and the RPM_BUS_SLAVE_REQ constants are
> also defined in the 'icc-rpm.h' header.
> 
>   $ git grep -nHE 'define[[:blank:]]+RPM_BUS_MASTER_REQ[[:blank:]]'
>   drivers/interconnect/qcom/icc-rpm.h:16:#define RPM_BUS_MASTER_REQ       0x73616d62
>   drivers/interconnect/qcom/msm8974.c:176:#define RPM_BUS_MASTER_REQ      0x73616d62
> 
>   $ git grep -nHE 'define[[:blank:]]+RPM_BUS_SLAVE_REQ[[:blank:]]'
>   drivers/interconnect/qcom/icc-rpm.h:17:#define RPM_BUS_SLAVE_REQ        0x766c7362
>   drivers/interconnect/qcom/msm8974.c:177:#define RPM_BUS_SLAVE_REQ       0x766c7362
> 
> Drop the local defines to avoid the duplications.
> 
> No functional changes intended. Compile tested only.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


