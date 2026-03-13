Return-Path: <linux-arm-msm+bounces-97435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCCFMB3rs2n5dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:46:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A7281B54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F8EF3014C21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAF734DCE3;
	Fri, 13 Mar 2026 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzYYXxiZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIUM9p76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02697367F40
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398791; cv=none; b=oxN9Rz2FvVmd1AQzCW/RK6qp6GxwRWbeX1V7WeP9kY/kjWyIaUMhJ8NsuhBK7Fxzn/RK7FtPvBYfaytUv0hjtGeMqmIk9NtfXo/LdXyAYQGAna9XlCtUTLMhrxbc+9+PuPOIFgD4qux/s9W6we5xbd4gEteOfqfgOSiZhu8sQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398791; c=relaxed/simple;
	bh=Q4wE2D/Z/Ep+mMePquJMAr1ovxZ6c+4Ub9tu0h8wEuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n163D2EM+EngtJc8FrWWCQPtf1upYbSVJ7iTH4f/awHENEmeYGSDiNEexVdf9t7AJ532QRnbEpKJYXgcS4408rivQ/k+xAyH5pEyFG3pRb4PkespcoOMWqVFuHHCtDsutnyY9dw1G3+tF4u7NRclQzfhXfc5NGOyizuH5njoh00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzYYXxiZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LIUM9p76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tYSu3229721
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=; b=SzYYXxiZIfSySzdo
	hYGezxV9hYbNIAguWpSnB/Rkhl2t3OOYckliZjWVmBih7KP3RDcoSlRDLc5AVAvU
	fPNn3iqi0jgKQmgHZEybPnIpiBw4ECB43LqZBCorAXSwA1FWdY///Lpm1uC3dUA4
	kazSeUZZ+FwdzWu9MvXN1hhYAkha5tsQOM1i7R6QxPL0w1jwCf8IjhXBAizOVPwm
	BPrszsVP6ANfIYulME7SjMko/J89oCDbCeJMoFI6Q46TTfI8Ap/ad/KPnG23uym5
	Px6cVdjntvhc3FQb1awzOXUIMA+zfJwxmSHFZxAa7UpJHmDRuF4NGuBY84EtRS1X
	bHvu6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7hsu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:46:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8198fe16so128659185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773398788; x=1774003588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=;
        b=LIUM9p766ImOhc/GYMzyiAIj7oHMQ/LfolPK4el6LLwBo6gXton2m2kSrZ4zPaAWqa
         35itTPfvRBGwN0lML1tsvuo04xWatwOqOu+S1qv3/XJx5u1sxGudhzhx5DUWmNTXM81b
         VkEmRKWiSStG2aYEx/sBQOiuA7TIidZgG3pJ0Fu2YTQLpfdVYnh3/XNvoZ5BUg6vwTnf
         ZQWoq3ELg+OJ9942Y4qMQ/+9PubfMyuESYwvFqy+BaNZ+K4kAvkxU9pmbOehECQuGxOR
         6EaJPP+qKZ3loG3ZsiDZd/jsbK5SyQ+NdpXHwbQQcr+nTy4noApSvcuLw9yz0EEc73a1
         HnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398788; x=1774003588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga5XM4ig7X1yij/1NcuFJ+hcBYWphbWpSNqJbDsqXGE=;
        b=lVNV/r+y6MlmOaT6tSLP68ln5l5IUM7kQW4lLAoMiqO1uRwv4EODbVdz+b3O4JaDCM
         t7D4GI8nZ+W16VjTgKjk/TNwGEbdT54JxSRyL/pcIh6VN868bTc34zd90jRhXTMhf7N7
         ZQd7oCNVX64KxEGflIawlEdxe0YRf48twN5+0dz+O5rmm+g+bKWqD0ty3hqThkdNlk/0
         gyW3wjcCfipjSqCVbHbvoESgO3uAkdjw7mm/x4OYimtpqVt8QQng8EhO9OOfJeTl0w1C
         7JOzxI01Eys98mnhZ28lVMTUDfyavohLbpLtsOkcsaZCuQqZNo/ulDFeUOemGKZd0ke6
         iWRA==
X-Forwarded-Encrypted: i=1; AJvYcCXhJk0D+gW3zrqMsxrFivY7gpmXGe4eGJcy+c8QwIuoH6TrI2PQhQTJcbXYsqKBWj/X0aedGplwlP2XeJWn@vger.kernel.org
X-Gm-Message-State: AOJu0YxZRGe1rB+j6vpxDKDbg05wcU6bShiu/LD9AKYWuZDxLRxWWNf5
	7ArebZJR4d3VqTCZHMcVbYmHgCsyfnZ9r2+ytBUHYEGSfo1A8VEJfauuvfgT6GMymKw0XsF4GP9
	euqQJlkeqBLaCYdUJLmM9NrF9BFxa3ng+ujVDXGx4fws89SHV54RSlZDEvxkNC/MVa3LDM6cKLg
	PP
X-Gm-Gg: ATEYQzzTJkCG5cI7msk/v55XwXH5vqwewQ8F7cP5FfdSBSYLO/NVYY8zEIT59g5ztck
	kmukol2yvdo4IksJX89FNNwW02JZ8SYL77u75Glwhe4QR1gjdS4+gBGTeSRQZQgrheiAUhwJlKo
	5xtAmcdz3mNme7v3YASc0LxLDmVyHyz4CEvNKob09c9AbCKEpc0sGUsCMh+/Scw/5hqFMCgjLk8
	/4lmebFaiLpILauvvWiMXSk94QFIBRyAIkBJ4xh9I1f1KKAQiB22ZfwHUnr0gl8QPUgiJ+o6fHz
	DLrc1gYbk0xZtC4CewK62fv2J0kBj8xJZjfxOfAnioSNrjCO16HvdtMCdH3/Hb8VmH5cCodNvRm
	LQV67uCtsa1aqDKuO1AnmnLF8yNXHAVxAfV9U8F6mzC6ZRwCjKYE5ES8fC3fTBUcOUJYd0UNqYU
	E59HM=
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr163543485a.6.1773398788300;
        Fri, 13 Mar 2026 03:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:8e17:b0:8cd:b6e4:81df with SMTP id af79cd13be357-8cdb6e48634mr163541285a.6.1773398787898;
        Fri, 13 Mar 2026 03:46:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350b85f3bsm1144968a12.25.2026.03.13.03.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:46:26 -0700 (PDT)
Message-ID: <189c2ce9-cec4-4bf2-bab1-9e05b9fccfdf@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:46:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] clk: qcom: camcc-sc8180x: Refactor to use
 qcom_cc_driver_data
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-12-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-12-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xjSHANkrfGNv_57zkf-J9DFLZ2oLZ88m
X-Proofpoint-GUID: xjSHANkrfGNv_57zkf-J9DFLZ2oLZ88m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NCBTYWx0ZWRfX9jy+k6/gtqJD
 kOubSL1E1qEXNiYlJ+b0JQizQXc9YnPG4Pr41HCMX2ClT5E4mmFmA1eHYNqOklylj2/SbTP3vEQ
 FkqN7Kf4jlCEnViF5So7+9yZIL1MvmvzCfk1PUCUfUhCbe8/XFRZFPAy6f606CKwuvO89MldBTV
 HxS8EtG40Pu8ku1N8zTsN4Fl7kvfq3ECzGWHCRQIBJKKOMJE8RII0h6wtEPg/GnuJQ02WmnYuTD
 NsdablvQAZMqjIkdVT4nUFzgZJUCUQT26YHy6WIZRB9QZaLlm3c53QQJvLNaQykIKe4F8kFGsNB
 A3K58z2zoYDP7HJuLbxAJ7F9FjFPbo8HfVwl3h0z5m+0UIz9/B9nfJfU0gE6KuqITcwlfNJrIU2
 Bdlrqlz5MsHPQBjX5Td2Rq9eCt03+cxXXUTBo7Fc+qCkFn5fNnLvWNszkklMwrXqYLfMnr1FCWm
 aVEu5C+fIcQ2HUZv/Tw==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3eb05 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ma-uBWqLQOsuroI5m_MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97435-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 647A7281B54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:12 PM, Val Packett wrote:
> Use a qcom_cc_driver_data struct instead of a long custom probe
> callback to align with modern qcom/gcc-*.c style.
> 
> No functional change intended.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

