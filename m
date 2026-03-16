Return-Path: <linux-arm-msm+bounces-97971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHwxKUUSuGkkYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:23:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 541CB29B416
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3372C301DBAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726512701BB;
	Mon, 16 Mar 2026 14:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhciJ8UU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNxqV+Og"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DDB267B05
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670864; cv=none; b=lhy83P4x9XZSxiuOSgY4kCfY9qqvp5ZrkQaWzPsZAtfIQAxdR/pfRk2fXCetvl0HIzgVjmngdKcDz+apETG2Uw7K54yK4PEdHXCDxaQdJP+vyJtKtGq8NNOXxTxTvonb0u/vZ5Exxtnz+lcCBKA1HENl1yOWVxTaCq+kOFzag3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670864; c=relaxed/simple;
	bh=7Zo832r3CAxZlBSgtHVQyTnKGCjFCF2//i7OeB8wa1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MHvbTe3g7Tga4QeG3AuxSuQLqKGUrIidT8QG8WSOk+fhZLb9RiBrni1yxSLAJXibrg6xsdPz5a2i17Tg4CNj4ibefk4XS34KblHd7jfO+4scI+yCz4h3ZoNcSlzVDVF4IKSJUXoxx98qvRdqtel2tR6SH/cwZJN+qF1hWiQQnJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhciJ8UU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNxqV+Og; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBht5O2672154
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ET7+pRVfXFEX2ZQozQ5kNkMYM+mjYrCSj9KRGYyuCJE=; b=IhciJ8UU184mtLQn
	uy/mMqqJJIN3eg3YcNUuJiOX/jReszs8kC8Kia0ZjqFPZXZbAa2/4wjnNmtK3aKh
	AB2V1wwEnogIGTsuc87mJhqGmUe1YQI0uq3hlg2Xh8A9jT/MOswRca26CDeZOlCX
	vJ1WloxTclL4+aCBf/FbPh0id74gEtdoxU+k/k8tFexN2sAwCh6RDpkhmp6OKccW
	pDkRF8MMkbFoXH2guIz2AtId26gleQ1S0ZbezCLXezXBFiEqzPHX6qNYDvBdgqzn
	LcND3kpsXRp7FMxaYxbBSXHGKn7C/i7rlK4HN3g9khSX9+rPy51HbqXot2lg71ug
	rQ5vuQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xp63f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:21:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c49436edeso12352156d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773670861; x=1774275661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ET7+pRVfXFEX2ZQozQ5kNkMYM+mjYrCSj9KRGYyuCJE=;
        b=hNxqV+Ogg/N9Hd0l5NdgF9sdSs5DAYR71pbfGSK6mSiKpO7ACnXJz/y78Vo9Z3JAWs
         P4KrffUnL8B4slAYTfMCNNqxMRxldrnUh94c9AazajRO1n2qMd44fJwFbXqo1j18r45n
         gWWp86kN4AF3tGcLpeX4uYt+Ai76BOOO3/XnHCHm+ErpIoTTF3jztj6DST2ll63vQRdb
         plSBiwMcgJQDmEBxcXVFKVKCgOp0b7sBINcEdALKovoZ69DYEHRWvxYUv9qs7OeQrIC+
         38doHXLYUHxsR9XuVrxlmlcOJwsf6TEvVt9Hd3a2hQOE2qi7K2m+3hIlHGfXhZw5jIqQ
         THZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670861; x=1774275661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ET7+pRVfXFEX2ZQozQ5kNkMYM+mjYrCSj9KRGYyuCJE=;
        b=Ru7ETTnSufhuyAEWwSE0Vt4pLj+XI5jlkMPZ2Ouxd/VMthkPsA/s9BW00e4qnSW7R2
         ypr6RmYOpi41QNwjuwVOciQBzUqSTfgevEzz/LLwvvOyQh6HPKRrnuO8at7u+zdzrYsw
         8JW5LsvNE5pGMGVi8rP/9rMVz5gDxyrz/1E9ClLIgqOv//s4B5FxV51oE6gXZMEpnVkU
         MO00BVp8U40kc1seeneWnvvAC0X4OdFyDfQcrNP4AjXNbyldfs9Ky/KYWuOG1yg8P48K
         S4mdXm8GceQVB5vt/BgWGZHsWLyf5TkE2UzmhRzGensgTLYuXNuXYLm1r/6SnmA6tHHL
         Mlng==
X-Forwarded-Encrypted: i=1; AJvYcCWkYtWh6tm9CVX0+ivBFuI5RTI9TPpHvbD27iTuwSpf8+OuUR7gXQN5UwVlHxYtrH6p61tA5tk/UOk2CwnJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/FFGoK6bK+iiIVT5wkJtwJqxgXyOCl2iB1Id1AXYvOqfC+Bou
	ZKt3bUe4tsKCzQlRwYYMAggPTCAMGeDBQrH3AsV1xkwXKXySM4VXPOaMYvn4g+9055v0REZlIN2
	k8i8aMFVjZgt6xb94sp0G/zlNr5s3ClytHfcqP6cVQaKoj4h9ITzebF6WME+z5YG7K4hb
X-Gm-Gg: ATEYQzzHTDsbKK2Mwa9Iu6+X1lvojVlPppkF8s1rnkuKJQi6LlWiy5j2XVap65MLc53
	7awyVxbONRKJ1xQj39NUn48RqghETk03LcpXT6vXADokRkghV07HuMWpDJgdhRTyd82Q3KnMX0Y
	eCTfm41tHQrkT5aSc9/c+vPAhdp+lO0I+UuQDE3e4c8dnq7x6eSAqed6uNKTm1fPWIJ6K5mCB6e
	/dRN+9ihATeeyCvXsIqqG+9gu1iDkSrfhl1s9mSPVJLAXLa/km33Okn3J16i5T/hRTL1Hn1/+6r
	LIdM5o7LTxEaZC01LUz6uJKxJRLHWRCUs65DCu5J7SNGg8qpPBnuxtmHPH6gAJBYhseK8Ebiqor
	sTqe+S/+HJcN1NJfGGiI85NimAaULCahQ6fyGASrfCQH0fg7qD93VQqfZO1BLPauMZmS07m7iaB
	60jws=
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr130779306d6.2.1773670861547;
        Mon, 16 Mar 2026 07:21:01 -0700 (PDT)
X-Received: by 2002:a05:6214:601c:b0:89a:6263:feae with SMTP id 6a1803df08f44-89a81cce148mr130778816d6.2.1773670860964;
        Mon, 16 Mar 2026 07:21:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9791c113d4sm468691366b.6.2026.03.16.07.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:20:59 -0700 (PDT)
Message-ID: <6e993559-8be6-4dde-8214-9417250b1815@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:20:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: mark gcc_xo_clk_src as critical
To: Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>
References: <20260311182147.30266-1-ansuelsmth@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311182147.30266-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwOCBTYWx0ZWRfXx+MypVWFL7nZ
 unF/KimqTSfunEUO0TwWWUoAjpYZKoCdIqqjArJtnrsJ1bXz8tM8RheKdDzSvcBL7kqftP8GQ10
 +i4X1UkG7YauOdEUhkZ/Ijy1PO9e5PL2f8cDtOWNxyMIixkyIoBY+1UbY4SHiDKDsddM8HpzSEj
 QCeArLq6ozdZp8yAryZePzS0IdCYDETsXFobiWlcL/HWSSLqTXJgS3BIX5PcdaOzV9Qf3QHDEtD
 a/OJOnzxSOyGncZG5d8QL8bTqNPkEghXvzZ17bQ6JiZuavhCqoC2Xl21wtO89hB9hg+n6deGxQ4
 m5lc6Fz0ytgn5QlhrstYYbCWNqT0beTdcTu85T03uoa0zABZHMO1pF3QLP5DXFcFni1KF0jPsYm
 WGyWk0IvvkpbWPThJkTi8toeP83rl3WUnKWskSMpp3eY8m5aLmBnlez9v+tCvd/g5z7bSD6M9uu
 20MEKmI11G9LKf7W+1g==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b811ce cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Vxy2kpnnAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EiN3ZDTDylVKncD3b3QA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=mQL3ssppXrSh16SuiSjD:22
X-Proofpoint-ORIG-GUID: U3khLIL9e9yBV2LeXvNtgp0dJwk59G-o
X-Proofpoint-GUID: U3khLIL9e9yBV2LeXvNtgp0dJwk59G-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-97971-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 541CB29B416
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 7:21 PM, Christian Marangi wrote:
> From: John Crispin <john@phrozen.org>
> 
> The XO clock source is always-on in hardware and cannot be gated.
> Without CLK_IS_CRITICAL, runtime PM of downstream consumers (such as
> the CMN PLL driver) cascades a disable up to gcc_xo_clk_src, causing
> a branch status timeout warning.
> 
> The IPQ8074 GCC driver already marks this clock as CLK_IS_CRITICAL.
> Apply the same fix to IPQ6018.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

