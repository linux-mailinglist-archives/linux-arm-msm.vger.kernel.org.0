Return-Path: <linux-arm-msm+bounces-109344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id clxsCGFqEGrnXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:38:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AED945B6446
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E62430A882A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9545402BAA;
	Fri, 22 May 2026 14:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQGjtB+b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbmX4QM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912CB400E1B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460193; cv=none; b=hLrbj4B3/b4hfIJba/6BWgTx1U2BKriCRpfdvXZAjkjcn6LmFvAnEZUP3Z61wOhNK6AU/Vvh31rqcOJ7o755hIUEvHQ1M1KYhNJKb0W/Xk93IxpL9zXNuWKVEkrohVT5/51ZxPi6edhuE3cDKsEbLOnpPoTpaH6B5WjH9lA9GAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460193; c=relaxed/simple;
	bh=g7YJh6S3LOw4N2D0kOgN8qAMoXO76noYCCbV3Z7SoKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzPYIarVHzHx4V5rWNYvfxOD3f2DrFYvx3kqOE9P1BQuAffLO2BZ42HrVjWixJ+to7E3meuMcpb06L3HGAmcm/5XOX7Gs+RPsWrRuZIYdb+GKzyk8bElVH0uGGiSBWazkUg3g6ewGPAUKsqBx5vQHnwqCDAoIY3ryr4pztWlOHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQGjtB+b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TbmX4QM/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MB60ar776932
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g7YJh6S3LOw4N2D0kOgN8qAMoXO76noYCCbV3Z7SoKw=; b=fQGjtB+bC9wPyIXf
	jE2JEr6EZab8eezHxz5Wvofhi41Zb1oT5FYhFigpWRCGTMQMoZnGoolykRl2zYtS
	UPAiqcxedSUPm42BzGtyVYXmtdeHVrCnxjvDAr6kIRlanZw08nq4J+lGpRfKGHfZ
	nBOqcbqk0OPBXIJdwJeHbxc3iez9BfamD4DW0hayb7zK/djWNUfwjkZTNK0JGsgA
	fZhJVfY2zZ/dBUDtpcwTyMVNhGII569jz7yumZQxqbWx0SnkKetN9QfIvr6Hs+lY
	PJypSsVdoaym6Ehj2Cf2EWouqR47dO76kIF/IBpIl3++Sva+MnIqzXPzB/p+vQHe
	OWBI2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h3w1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:29:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba054e0304so67045345ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779460189; x=1780064989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7YJh6S3LOw4N2D0kOgN8qAMoXO76noYCCbV3Z7SoKw=;
        b=TbmX4QM/ScQTDyR8eIGQR8cILH3Vb0q9AAmO184YSlZOsylyLWhnXi5M1Iuoq0eh+t
         udarkDjGXIDOKCLzzj351yVGKaqFIEu1lCyTaOTo74Y63exNr1tO3j8VTqRkuVPNOwjA
         65AlL7XfAgoE4n+s2fTEtw2VBzStwssKGspKUILJMVvbBqUYmFY8IKBXlM1AEG/3GLkg
         LQcckxBk3P0BOg7f3tGk/k8xN4FcnURPTaCZrv9nSWjjne1ACcsbdRDGflhqjbCzW5f6
         S0jW/sVVRBFbn8aiSEUSEsVWlAJQl9XtJVJXp3dJGXZXP7XNp4ZaYp8VFe7OkJBWBkom
         WAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460189; x=1780064989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7YJh6S3LOw4N2D0kOgN8qAMoXO76noYCCbV3Z7SoKw=;
        b=knVBQ2msmHSHhFs2f64GMo2sVlgOsf+7fDPfyANJx2yIkm6SFYJedEVJENOC+4kwb6
         auxHbvBe/+C4H7lewib/aRF4I9EGge1aD33Wu9+EAsSUIAIp+q/9j1zu1fg5VEozli7a
         t85OrPwQRKdYaF6ndyseXT24npIQOSao1hfeNBjI+OZUSM7NlLp5l87CpoVR/wYUW9te
         9GGR6Du0aPuXqCxWt+d6WMPZxNzSHET8HGTF9s+osvRnTtjW7socnNvWsvOXAUpJHeZr
         KPiXfJ+tAf2Ma0r7Pfda5EPIgrOHn+Yt0JMHTfgZNs+fgGCDWxms0iYh2C8NTD6eULUb
         OgoA==
X-Gm-Message-State: AOJu0Yymn2H8KepGBDlZYv8t2S1djXfnHI4iTwSPpY607HjJuhPaJNRg
	fC8D9O2ZX3wFG1j1TBOuvIITvVAJ85TpS2aQmmEcpyKIn/urDTkcyHrbRQT3m49yUVD29jeDP2X
	sHyPB7orFXy11fEsVa6LhoNgSOw06PO416vN3MVmyQB2gWR4/S7J/5dgRbPdHcLscLORH
X-Gm-Gg: Acq92OEuAomPkJRr7V2wpK8+gpsZ0Nlb3DtqIokIys0IoexvSJSsKf3+FLEDH0BOqtq
	atKt5l+NHyrwOqp0t1Zd9ZzTQSqZSG+k3TlmhZxukW4VFft3fAqusvaQeRrS7le0V0FlFLn16AD
	3XDSd7FMzbuNlMhXXEseW3i9j2CiEj/TjZOaq3XBohyyreJWeDzgQPN+Xkmir5fEDP51qTEdVzs
	GiUZuJGK8S95G8eCuBnqwEKG+x3O/9NKuqYkDBNjQNi2fWin/XaFEyTpS9GRHsYh2Kaa5ZZXckK
	Hn65ISeldNIFHRbIJVxyMpWGalAn3O0p7Ahgh/Ibpj+5NCrUoZEu9ELUnIz3SmpB18+HE9o5CTp
	6oT2b1AU32VkkV+jLFwfnS/SoDPbzV4FBt3ytzwJqgtarW+Uc
X-Received: by 2002:a17:903:11c4:b0:2b4:6597:44d9 with SMTP id d9443c01a7336-2beb082545dmr32146965ad.8.1779460188799;
        Fri, 22 May 2026 07:29:48 -0700 (PDT)
X-Received: by 2002:a17:903:11c4:b0:2b4:6597:44d9 with SMTP id d9443c01a7336-2beb082545dmr32146545ad.8.1779460188216;
        Fri, 22 May 2026 07:29:48 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695c4bsm18520165ad.15.2026.05.22.07.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:29:47 -0700 (PDT)
Message-ID: <293cd6ff-3b69-4448-a493-d2e72a358cbc@oss.qualcomm.com>
Date: Fri, 22 May 2026 19:59:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add Shikra CQ7790M SoM platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-0-c01b90fb4395@oss.qualcomm.com>
 <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
 <0b1c66ba-d841-460c-b702-8b4530d56f73@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <0b1c66ba-d841-460c-b702-8b4530d56f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kjyDtvqyXS2fLsoZqo7bTNxESiTwwRde
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a10685d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=rqZrXzn3qAiNiV10lkEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: kjyDtvqyXS2fLsoZqo7bTNxESiTwwRde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0NCBTYWx0ZWRfX2Ztku6GsjWIb
 3lkDNo7brWCr0r0Ydnv4hOGuAMcGR8kwHJSMmcmqsX7WPsc7Hvqk0Y5VUXlmVaELVrIoPlbiF0s
 kqkbZ44qVPWq0MP27mPXgXf6nRw9sqlGJZ+RNI4TfhKy/zsFDsoixbry4718dT+Xwoqh08JoytA
 gmd2TY46XUNpcD3YKYATIgkVwY1/Zn2jtiGMWcIVW5fgN51tnBqLLPHuxfDBSyk+YEKGllBAxYP
 KhLZ2sS9nSqrGgIMuFEFHjj/9rxEmVnyDWBVENlMxbZb5fX6JUmlyVtr3Dj2GurNelf7GdOv4f2
 eZuu4+9ml+EFH5lZVa7AG90NWJQJbZ8kG3UiKXQ8Eoj95aXv55Sr3KbsuEUwd49h/Y8H1g0uvvk
 5JcGhNz9b+Vo7UPUT1cr4sQCRoVMxTiJBAPub5C2MciMUFC1ikQMiEACdVRVipx2E0exMLKfrx1
 RSvoVAi63nxULPwh9HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109344-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AED945B6446
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/19/2026 5:21 PM, Konrad Dybcio wrote:
> On 5/19/26 1:21 PM, Komal Bajaj wrote:
>> Add device tree include for the CQ7790M variant of the Shikra
> I don't think CQ7790M is Shikra

Thanks for catching it. CQ7790M is Eliza. Will correct it.

Thanks
Komal

