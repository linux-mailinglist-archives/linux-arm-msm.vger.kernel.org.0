Return-Path: <linux-arm-msm+bounces-101229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ID2hKoawzGlzVgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 07:43:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E25C9374F07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 07:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26C033005D12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 05:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FA1317167;
	Wed,  1 Apr 2026 05:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gS+87nU4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJmGQwTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A6C314A84
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 05:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775022202; cv=none; b=J449r3DMVobmvwrAsS1vIFuYJrVVY5BpaQsD6HC5HuMbgJj2l+U+b1XdSkYT14Nhc0XV5J4UxfnKQQECV1BEh36pBi/+i1c0WLH5s5n+e5vEzS1QEiBupRWSJeAXnuzkHZw9KwqAdIa0cCNryhsJlRL6kz1ubPIXKMgTAjHwGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775022202; c=relaxed/simple;
	bh=Mh9atjZ3vWCFgxqhRAOyKjH+ZWbXXCe8gyF45fWZt9s=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y9QKSeYU2Yvx5uHBHuDP2BI21ZYYXuCj7xdCifl8SBZw1tTUKuWtbl9BbzJKuXgY+m5Zv7sZAqczDdxHdZ+GjyCvfB2E5blI09BrfMfODLkoB1HRrGh1AsxqpQDHfZHXT6vIS9L/4HIy7Cbch/XN9CeRdWjG00mvkgsVlisWXpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gS+87nU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJmGQwTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6310BUZp639076
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 05:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0+jdnxme2hDijRq1AfMX9cx1Hmd+xEJTiwAquw1psk=; b=gS+87nU4AHpcqyOR
	QuMxPY9UvPBvdVaYLwuCHLeiU9GeA0Cic78v6+O5fJrmCw/bvtDLQpUr4kXRNSBF
	CC+sjMeT3g6lkSPR8T3ehjfDO5lJpl25fWmIa+P11SnUUT9Zz+djNFDcabC/zd83
	kcm039I8dPEqtJCfHqaXOxnjFtrC786vlES3C/m5PdwFI+2I0xvIjtpX7HDldG+p
	vduMa3cUQkPyMHv3p/5MJTpO6DbqLkrhGJmxP24BRUXKDIQu+WdogpUz7vcJKAde
	E/ib3sWjAYeMfpO1L6iR/3d4vo47A4hoiRXAYz0jtR5VrD3UsPkPEly5IfImYV9K
	dLKDGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8g2auheg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 05:43:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b250d3699aso88814555ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 22:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775022200; x=1775627000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0+jdnxme2hDijRq1AfMX9cx1Hmd+xEJTiwAquw1psk=;
        b=fJmGQwTRUC6jadn0yBqw2Ucvx064tGwYxMCb/UFSpRLn2zIBrgk0uaEs4E2ORkCzQZ
         KKH5BCt64coqHBrUtEp7HrpR4yyb/qgSQFhCHNV0wfZGxba/18pnMCWQaC4SXyKtVuMU
         gP4gzPj/GMT+wbvPRmgSDHIwkbi8aU+jApcpmp2eVRx83QnvO+gcHs6G5gos8rfuUbe4
         eEiCiOOxxiv7HwRYNXRT+u1m6vlKA+UoZ+oiBsDUsu6rpUDvE3b3Ghjy+1JiEwtSIPF4
         Yr6A1DkzEASw4zG0r+1rp5QLdnrosR0/VCPOQbNYbRx2pZ/9BThVmlVGYTSNfZwmmRq6
         Wm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775022200; x=1775627000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0+jdnxme2hDijRq1AfMX9cx1Hmd+xEJTiwAquw1psk=;
        b=IH1OOtOppFjkvDM08zri83W2Mwg4mX4irzU8EsMSmS0uoGT11IulIlhZN+aGCeiqQx
         LPUv60tcPkfYDky7SMnVtEjkXFxtbOq2OnJFWdZpmos4lxia9DFzwntWhTwR3bu5i900
         lQQSOEI6bs17Cw08+BW0V7RPEMS9lJMRt4W1pkrgiHwwJ1GkKf23VX7G2Njw4gY0eC5i
         nMr8Ko4kDymNK8XsGLudZLNO16JNvXZl2Gq1ohpAkOaDc2txw/3w2XDL6VzS2uM0KuDm
         qDA7Er22SQLpivVUNx484TF0GSf9CwZR9PTt9ZiWpSmOC5Kj9F2kUx09J/rwO2+6M9nW
         XmrA==
X-Forwarded-Encrypted: i=1; AJvYcCUmNBoNWcoPRX0L/i7yfIBuUwC+3EbPwgMoDiefejXgUJ7nDQpXiZB8DKfinSoK9URojuBVSvLv2fIRJN8b@vger.kernel.org
X-Gm-Message-State: AOJu0YwmV5486+cxHOVkxeATPayuuBKVaqOJFxGrODmlMHml888a+lGw
	KOhHl58bwkGWErjDF9ogm0RNYmznI4DsGkYB8+sUybfUKa3n9tdTmiLw4IqBjrQNA5daSE6Ihh3
	kJhJap9NEFeY05+69Zi6Q25h79RHjArpfe6a4X225sb06dJhkJU9+V25EQ2YpFOi7UW0K
X-Gm-Gg: ATEYQzy+Niy6XdnBpnyRZDp/LaBVPzYIiR/8VJXtyU6r881frMit0l5Mnv1nLzwhVVK
	wI/E3LOuwAcAGDc2WLdluSxE7M3uc4bSjXIaINYxuugdum5uXG2lZjPE2U2XMU6mrx+CAEz2d2/
	ouy1jFMOUXUpWBrI5kjwLDpEPE/G5eO5+SGgn6Ov112ORj+vetFGeVcGU0/BDoGh43EYDqPVfzj
	WeaapLZRDpxtqRhz8zjVdhRicHbxyseii5+PkGqoX3fAqiXEkHprRqQ9fEwSP6qqTXEZkwQUsUp
	4FhMheO5ackB7jnJAymF1sd2UzT+LDwvY9YWBxusv+xopEBqfINU+v3pZe6ylJtBEtDYDE0KE4k
	kuaKbyo+aks4cTuJ39u8V1GGk9Uikrr1YDgmjXOAiabt/+kdUD198Gi0VacZHpA7cVimJHPbY0o
	IErH67qGZ4k+ueTwlV
X-Received: by 2002:a17:903:1986:b0:2b2:4728:aa6f with SMTP id d9443c01a7336-2b269c4755bmr20430455ad.26.1775022199729;
        Tue, 31 Mar 2026 22:43:19 -0700 (PDT)
X-Received: by 2002:a17:903:1986:b0:2b2:4728:aa6f with SMTP id d9443c01a7336-2b269c4755bmr20430105ad.26.1775022199254;
        Tue, 31 Mar 2026 22:43:19 -0700 (PDT)
Received: from [10.249.16.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242766396sm130136685ad.45.2026.03.31.22.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 22:43:18 -0700 (PDT)
Message-ID: <9e8d56ec-bfb0-4e37-971b-aea136373bd6@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 13:43:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 0/6] media: qcom: iris: encoder feature enhancements
 batch2
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260401-batch2_iris_encoder_enhancements-v6-0-7022af3401ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA0NyBTYWx0ZWRfX4TesEVThdZzr
 JQJx9nLxMZ9t3+ObjCzvPWZF1iAlb9hEF0XJu6xKosRrBEPsHCvymiPCrLR+xhMvqimb1jkw8WC
 09yAddUWIhvBEp7uhm4LAwKAqLdsiz519wVYNyq9Lp6lKmgzEtZfFEDqQ3PVTdCt/KQ/I8xg/IC
 W5hT2IJC37cjWW2IdqXwintLs4LVp6oAe7HA7Ye5NJ4pzR5Si42f2EPEllsLiC/msr1qEcrSTAu
 qQxnyA2bDAo7xxvffyRPEEGRL896duqCfqPEkObeqN8ZUDUSZo6nYL/hTNcxOT71idTTVFIVk1N
 myvQkw1Ag+IY3VBZWynsFy20EcR44UyakqixcdMoaXFnP/xlgvkSPpp9c4GO+2giPvHLb9ZV2xv
 jX8S7bSyC7xz/EACMknlXj65yj+96kkEAR9pHs6KHK5QfGA5e28tFwzvdC0hMEVzzBcdKvhHxC4
 lpbWuQzasI7uA5weBYg==
X-Authority-Analysis: v=2.4 cv=G4ER0tk5 c=1 sm=1 tr=0 ts=69ccb078 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JiXDhBHymGWixQE-QVsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: E5KFRVapOpacNPKOAgniElVxVo2uZkYu
X-Proofpoint-ORIG-GUID: E5KFRVapOpacNPKOAgniElVxVo2uZkYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010047
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101229-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E25C9374F07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

I’ve rebased this series on top of platform-qcom-7.1 branch, and it now 
applies cleanly.
Could you please pull this series for the upcoming release?
Let me know if there are any remaining issues.

-- 
Best Regards,
Wangao


