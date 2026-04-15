Return-Path: <linux-arm-msm+bounces-103251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GZgJktX32n1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:15:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5F402716
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2ECF315991D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B963318EFF;
	Wed, 15 Apr 2026 09:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvbVJdaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDx92XQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6D431AF24
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244191; cv=none; b=KKhO2AOFcESIJ2QgugeTyUB6XHJbv/YiXz4XsUfTF6u9YLUy+UVtfj8jaCVmm1UkP0qVI62S2AibgDQgyvUr57fcVquwal9JbhxpLbBHs+fiGrF5gn1FOiIVPAYuh56n8wZfSGcBAIviOA+bCJgWV0qCjrZjFhe+C+NmMoVKQXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244191; c=relaxed/simple;
	bh=zSp3ZEs32LHBIB7fH5TNXRrAs0ep4nZTBZCp3RXODbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNOvQhthAgc0Rx7w9vaaPE9rMd/e9q3TQFT2bPDv2Fq8UWOHOcAGwbNgMHk6Ggk/YOFZbYK+0wNmKXZk5CZXRDmw79INHhb6a8q1q54x2zFYA3AKi11DamONqxYqiHg9ZVb6gBnvHTI+7g+VfrOSLJic5CB2ntjT/yWpUuajQNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvbVJdaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDx92XQq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F4A2Gq3126733
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c5CT1Jp/CdKTDY6Qft+lN/F8XFsY9d2RcRwPpRnUkDI=; b=MvbVJdaBirpNMH1H
	Qd0xP2cb43lG8iJF+zyx08lBmlrYDKZPCGOzhpQW+lSRlGYAfhb8BXiRBxTyYRyo
	VxCb1GvEN6Hw+8QORCoZidwGft76gjxYBFwtMZ+CSBDIPsH2zV62bhGFhZBQ3XCe
	/AV6se7FlW6PtEEbKzMJUGqCPXs1LFqYltFZEpaHxZw8tU8cJRBtf4PuTAif05Gj
	CMxekpgJIYHZ5JHkSIJDIBExAkziKqHK1tn3VKC0/XMyafI/epg0KUk/bfLI3ysX
	+wEHi3/R4LFeN/mZdVRth5pnWy1WY1wJfSPYJCeYa3boaeW9o+EaVTy9Hn/CaS7m
	nayFBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56tjq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:09:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so6232857a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776244187; x=1776848987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5CT1Jp/CdKTDY6Qft+lN/F8XFsY9d2RcRwPpRnUkDI=;
        b=FDx92XQqSMd1Zgj24O3YqebQluGWtWBsEOvCKr4eIg7JZWN7bf4Qe3CkCPGwgk4QzS
         P/UfjoGXqx0eUwPyY1yolZS8HjLPbAHCndSEazlGKusO8MHxcNuySfWYPQkTKPd2JBMM
         vcjnTglOR8skUMi8orOdvvS3YI9m34Ck/NnKHPg0b/SfyCywFyYgFey37NHNNDgbQM5L
         U+xcqHTPeK3FY+UDlXbWzMu7hx5JLB1A9LPBWCRfM0pvZOaRih1SHevEJi26srEPnBej
         qf5CXFpo+i0fG/jNdy/gOxqYQP64e72gdSMahPXT1e7rbywAxG+K72ETTEZvdOJgrhOs
         jmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244187; x=1776848987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5CT1Jp/CdKTDY6Qft+lN/F8XFsY9d2RcRwPpRnUkDI=;
        b=sIoerJo57XWLjmC6tubgOxKIX0bWyCr7HKeK007QV98PDoF7U1pldgNqBvZ6ITWfzy
         hhkyStljKbC1uLOgXTSpQUC+uS8O+vi7rqxXwUgFNJrsjATS4f8fLWaeXBgZde8sIiNS
         OczviteOvKzd3/+6dZGXC5S4PxMeJMsWpmtI5Lf7+y3pTzChdOM+TPY2JEWzmCkDi6nR
         5fgdIEMC58ISCx3137WtoAF0a045dJnrzSW+EFTa1IRMHpJs3mAC/l2H8ymbA/2zf362
         P6csr6iDZlA8msLne1JXSKUsiAaa76qyYrSyokrDauYLIOf9Udh27TY+J4fBg+4YWrfW
         fMcg==
X-Forwarded-Encrypted: i=1; AFNElJ8yy5quCAoYctyOxTmw334GajoCh9i5IAK3HH4mHGHYrABEY7S0giMbGsBQ58F9cWSmtEpwazUe4Y5wlHAp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6gR7IlHtm3GnN1iEXXMlcH1acxCawJSOD8pqIot4ySupztftD
	oDahdv3keS0sPWnYPB0Po1z2P1tWtGWvQ/wZIyFgRrC1FZ/WAkEC7aYfyN7NwlYTZx6MOPeEbSF
	3lT58KFJtbnjDERCl30ACp/SPUSd3ZBJ5SyMZ639aLJ1T2miS6HmUIsJMFc/JAFsQu+x5
X-Gm-Gg: AeBDietwBo8q9y+gMDw3E2RKojC1yRd44p5uaR+TEvu/EEMxMFyMAAoPJvKAjv05KR8
	s9+g6VyKCk6mx/DCSMuno+nnTZArn7dk/Gfv+EUhEPTYPCeNlC5EB1YKaanppR7Rc98n3coqVvq
	n1x6/77y4U/4iYTPAM6G77EJbzlryvJTakoCjovO8pHz88fGWbhmTbqfOFec1aE/UCCyLG0vYIh
	4rsaUMrDw3n9DAATzlh+55SGL39ik1K24WFarBVp5i/hOYacJxsddik9HB8TS9jeiGNT8x9Br8a
	OdhLoCaC7cunf58n6B7qeHIUfS3J1k5RI9Z44VJrXOEO7Mjyqr4oK4d+g5eOptFD9kqsxt9MePd
	kBy+es6bjcMtriJUMySfk3jT4QKV4+8m3rYv4rYaIob0WckkQ+vyjd9w6Y0mo
X-Received: by 2002:a17:90b:33ca:b0:35f:b4c7:b626 with SMTP id 98e67ed59e1d1-35fb4c7bb12mr11763264a91.18.1776244187379;
        Wed, 15 Apr 2026 02:09:47 -0700 (PDT)
X-Received: by 2002:a17:90b:33ca:b0:35f:b4c7:b626 with SMTP id 98e67ed59e1d1-35fb4c7bb12mr11763219a91.18.1776244186933;
        Wed, 15 Apr 2026 02:09:46 -0700 (PDT)
Received: from [10.217.217.166] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd2010246sm2343736a91.6.2026.04.15.02.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:09:46 -0700 (PDT)
Message-ID: <bf8a56f6-d7f7-428f-ad95-801eb16f1cc5@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 14:39:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: common: ensure runtime PM suspend
 completes on probe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-3-4bb5583a5054@oss.qualcomm.com>
 <c72e02c7-57d8-4353-a6d8-9dbf4f7a7e37@oss.qualcomm.com>
 <38aa8c0b-fb29-44c9-a346-363220264c7c@oss.qualcomm.com>
 <8d7baebc-db38-403e-b724-d4b214b5a51a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <8d7baebc-db38-403e-b724-d4b214b5a51a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LuiiDHdc c=1 sm=1 tr=0 ts=69df55dc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=rYsFMFq4sQQjBG46XAoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MiBTYWx0ZWRfX3tRDEBre7ymv
 nM4cbsQ/NZS6I2EPwmLWOpZ6AsxfDa0RxXexotLqDYwaRnTm+pr03y+c2FcU39jW2eOKYc2PW57
 mUprcPGDsnG/4leIn34gPx1SMFYpRIbv+lqyfL4L8mf/FeQz5S6dznAnmH15LC8TpgLslsTtDOm
 PJ5GQFvwCGjWrReqlZvIv4SJ4yygdRJtk0HALjwfBXrbbLDm+5DZY7gEgEybsyaJ1E0QNWIWeoh
 tYbDkE7Iq8gxgdnSXACkc40lhDveDWDByqsDCxKwr8HZql9w0dNi0xuGPlqMTwxRBtSp5xUumkE
 CA1NN4xtLhNxTu7nhJ2jBU9EZ3IDiUXFZ9pB8X2dB26pxQzqYtzmIvS+PNqZ6EVNIE4y+W7IZG5
 /rOW1i9xSsBg8LYsReRJXt6bMA6Cr2k5UxMg7UWfr8X5ayWmo0mbP2AtaM1CVK8UBON6cqScD6k
 Ii9uHZi2VVERuPoiM9A==
X-Proofpoint-ORIG-GUID: r6E6WrNzyEaYWryv3hUDH7V6vFMzG-T3
X-Proofpoint-GUID: r6E6WrNzyEaYWryv3hUDH7V6vFMzG-T3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103251-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6D5F402716
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 8:12 PM, Konrad Dybcio wrote:
> Please mention that you want to do it on a clock controller device
> registered through this function, because currently it doesn't seem
> to have a functional impact on the existing paths

Sure, Konrad. I will update this in the next patch.

-- 
Thanks,
Taniya Das


