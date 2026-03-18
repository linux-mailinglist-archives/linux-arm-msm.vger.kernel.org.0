Return-Path: <linux-arm-msm+bounces-98403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJQnM9J/umldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:34:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E612B9FCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 743A13015A69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DE736EA9F;
	Wed, 18 Mar 2026 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="piPaVyre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aimiD3UJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345E5364E98
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830032; cv=none; b=CGehc/gWohA6Sh4u+pCZSPw15Ovl/kbaMw7v1hhVqxRZlhM1t2cGnCiwqYaz6L7sBumAY2oQ658Uvy2OEKkrvuZBrx9ox5rf37BwQqvmCNki1WIAW1Cnh29l1OUVaDjuRd9ILGBBkfPCG1pOSK9tTAS9sStW0BN1u/qShnJpGyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830032; c=relaxed/simple;
	bh=nrzA0Q0Pn4h2XNPHNWL6htCI40600vr76gMy0MZB15I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6KInV4VtoNpgCazSxn0rrQMatvnwXmuXbdnVUoBu289SJmskjudPCk+cArtfWJ6IgBjsxMVaYzfTAya/2/c6LTko71j6134JEPG8xw+77MxNnwkbkF18febGlkPvoFFJhcAW4lVgom/TsnlJrIhtFav+KAc5KiUEeG4NaIBhsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=piPaVyre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aimiD3UJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9Dbgc402517
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OkZs03EOkQ3sZ7bZ2/BT7q4+P0uDk/ykrOdFIVHGRVQ=; b=piPaVyrebycrV8GR
	SLWZjm3O1wJb3ZMSB0s5KVKTBlpjGPdG/tYNk5+i1wsZVYQwYQIaMZRZd6eUIJsf
	jkps7h8QYObugaMeYk9TzZSbgBMC9l5d2WN/P7Uz9D0r1R89EVZiEr4tP8edTsDG
	PDq/jH1aYRYM5CrxQpysi1rtxedmqyAknFlPMddPpT5+cAa28CLLC+i6gNChJFnM
	MXxJ+vIlFjMvKYebp52U5/PQbGiSJDV6+59oVEWm0pFWh8/hiMFqxqHWLQr9w79M
	rWQdOUmLMm0W+PGZV+VP7IlY6wDGmtWYzb9NlIav03F1JpUb+sbL7d6hPe4rRZQG
	jpgbmQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dub19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:33:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c73781252edso28083737a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830029; x=1774434829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkZs03EOkQ3sZ7bZ2/BT7q4+P0uDk/ykrOdFIVHGRVQ=;
        b=aimiD3UJOvcN2YGlZo94xDFGaBDcK311pwJ2Q9lJ8vn8ZHtSDY4AOSktO0MpaeHbHN
         /PNrXE/IM8mwnc/2yUgfrDtbDe7os1X/gw9S0md7mtfwA6dcbbNA/FaQiLGKwrYL/K7V
         RHCRrDdm/OMoH0/vUtChg8rxQpiV2iWBKBJmX3gGVifn79oGv5YPwVcNMAJLEq50UCNx
         zUezw2vUwzk7GneHIPrTSPUmTb9tKOBwzWmUiJorqXI4JWL8xCPxzfDG08T2R+R1U9Vw
         x1//iaPcAIttJsvyTo9I+b1J0USl/jJ2RPqIXNS7W0nC1PxAuHOazpuiLxUd5NywLXXS
         MYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830029; x=1774434829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkZs03EOkQ3sZ7bZ2/BT7q4+P0uDk/ykrOdFIVHGRVQ=;
        b=eIPb9FhnpwKxQSD4Ga9xW0NQ8YzzPZIcfJGqvS7rBt9CcPcC+ApDdhqxdm+GATjSyn
         fgbdB01NIIfTLsdUxejTSg01mTu0f9GLJHQudIFlhR7slz9DeUqa9iJvBlZ94HjohXzh
         GvdDky7NPK+u7lh5geHohtqU7ZnSNppFBHorBjIW6TJsdYxfFWOx6hYZYOIkxBnclDVz
         9TapGjbu16QgynC3L8bEQr12JwG/6rqXVjeUXODHHgpXNPK4y0nFtm2AyPp66kO9dTWS
         c9pK9V4HSuZTHuDu/bNTFE0R0r1m4k4ZxNQsxWEOR4p6GcpYolIzatKtTob4q05bN8c+
         8Qdw==
X-Forwarded-Encrypted: i=1; AJvYcCUCHO8E+m5KZ7bRCasCuBLzP3dNNJi1qzOWE8GWu8Q99FeY6owKnaSR/4wX+6zawsPH0MgOuNKBf+NtT3Y4@vger.kernel.org
X-Gm-Message-State: AOJu0YzwE1hn/DatmB6DEYUtsmMgi0e1tBQoKYLIPq+nM2g+VgZ4Nv+3
	gmFtP72wwxg4s8va8tPxznkCAE5G5HrLDFeWeJbW7A3gHws0fUQECwY52mBS1JONvknNK2PO9aV
	lsH+6w5jibbtjmWcsmaZeBVGj1HVke7KbEBjl2UTgqhqw/Oz94Wl3lJ2kZwfFWRLRzsL0
X-Gm-Gg: ATEYQzyyEvWWIDBJvQrtH9HHFRvEGm7JvU4fMw4JiGuvQNHYL45egpBdDr07DI9Die8
	yYPPxa7qhVSZ5RFcqOJ16jK+PQsCfUbBdmQd55zPxC66/yYdYmxWflp+YiSnaXvqMC/2fNrq0iD
	0isSQPlZdajuUfWJyi0Tzt20vxy2NBJKkYNTchQODO/ilag7r9RlZalbNo+SqA/PNcltP6Q0O/l
	OgBTtb43/z6sDHRNz/2wFwrdndjM76TR7ITSO1Q+Ok0AR+QDl97doxZSUAG3Wnap0Y52a8lz7FQ
	aP0RZqkNZdr3b19h1cvQLKcmawDsK5XVJReAc/XFxOfwOs6aftRZdK/I3FhrFRlmXakTIDibxun
	gL63AnuAmGySRX/Um0b5DIZHhgkvFADYz1xMRatfIKMn3P8jhctI=
X-Received: by 2002:a05:6a00:990:b0:823:1c5f:1c43 with SMTP id d2e1a72fcca58-82a6ae51517mr2674235b3a.36.1773830029100;
        Wed, 18 Mar 2026 03:33:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:990:b0:823:1c5f:1c43 with SMTP id d2e1a72fcca58-82a6ae51517mr2674196b3a.36.1773830028623;
        Wed, 18 Mar 2026 03:33:48 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b56df09sm2355266b3a.21.2026.03.18.03.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 03:33:48 -0700 (PDT)
Message-ID: <0ff641c7-4218-48c2-b93f-978a3915c5a5@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:03:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: crypto: qcom,ice: Require
 power-domain and iface clk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
 <20260317-qcom_ice_power_and_clk_vote-v3-2-53371dbabd6a@oss.qualcomm.com>
 <20260318-precious-qualified-oryx-ef619f@quoll>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260318-precious-qualified-oryx-ef619f@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX8zyd7lwqH8ba
 RhtDXcyMQ6fDwMA+nwxslXjkFNmeGgGXxueSVTVZuq3i/5dPAqINFZSgnGegzhjMyt0ZHK9H0yd
 V3i1hZIXfHUK3lshA3oKCz4d47VAAP441N2o8w3qU0PdJrz7VdS67ITXizyXZQWR/tzJaRFY/Hl
 TdjEbgwmJFOwdZ+/BAWaSvCggG4A1TD3x8dJTJzdW9OT/w7NzTWKWqN/S5glZ4qnHcV3quWmvMh
 KphHJHGKYN5R9JXxbOig1J4SJQOGwH8jqdg4SWHdiVrUjj12qwVNi8TmZg9D0o1EH3mpDo0SCD2
 MBTyhntQTzrj3RLXexo8ocFs0t5rDWXz101XygO0+JAKJiuhMeRwPZN/LMv01q6ybYvvYiUOFCP
 d+MM5Lob0NrfLBdGvbMCzoGosFCWqCy4hR2ja9JMuYYLuaxaIT/NDELf0MIwQgwIqipD4//OZ2h
 +k8Y6uKeFw8hLxYwWrQ==
X-Proofpoint-GUID: hCXP83AIZ0Opuy-fFpMy5hnKp8JAMekM
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba7f8e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=RpU2Pg236iwgMI6ZwYcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: hCXP83AIZ0Opuy-fFpMy5hnKp8JAMekM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-98403-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85E612B9FCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/18/2026 12:53 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 17, 2026 at 02:50:41PM +0530, Harshal Dev wrote:
>> Update the DT bindings for inline-crypto engine to require the power-domain
>> and iface clock for Eliza and Milos.
>>
> 
> NAK, pointless patch. It makes no sense on its own and it cannot be a
> fix for earlier issues, because as a fix standalone is simply WRONG.
> 
> Where did you emphasize this is the fix for current RC?

Ack, I will add explicit emphasis that this is a fix for the current RC in
the commit message after merging this patch into the previous one.

Regards,
Harshal

> 
> Best regards,
> Krzysztof
> 
> 


