Return-Path: <linux-arm-msm+bounces-102685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EF/LKeb82GnvkggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:36:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA573D82BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E125302AD35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 13:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12AF3C4559;
	Fri, 10 Apr 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJN23wLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyFg6G3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEB5271450
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 13:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827974; cv=none; b=ACVjWe0GFTgdBFrne1NsY0l8rsF/32GcALam9JPH4T4WuZuVTkuMQH+sYsIgC9cGDXvskzClGstcYjrxdPgQbPE0Zraf05b3yUCSaQ4cClxD4CApRjwTdCpjzPOHfBgLAJc4G4Q/pGf5sL0FuakVB474FiCMfAV41CDmHNFMtzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827974; c=relaxed/simple;
	bh=p/F/ubJz4TnePeuUAPFWFIpOn4leIoXpjB86p8c9qi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNPcrMMnC4kckyb0muPlmaTWkzv7nVDpQtMDH476Q1Tkq5I/cqQ9E1OoPUOPppnFqg22g9M4suViSuK+jQWGj+Tt09Iur8arpPP2ZpTGMWu5W17NOOheeJn6T2FFw9GvUWI8Q7O/3wucne6rNCpze5VSyg0963PvdOn+ZyxjSt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJN23wLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyFg6G3j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA9h0C2047692
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 13:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROaqTpJVwuOL0zdQ36pjCLyEmqKk88M6hTtVA5HSexI=; b=HJN23wLN1XvP10pn
	pzb0hFcTObTIZ/4vpTdykvyWGv+DVyboLJX6PEcfO0wTtt5BS/6d8oZhDIbOhMXO
	6xnEcsxskeJi0v30MPAquDTxLZnwPNdZwhB7lD4JStYTge55vcgeq4wGFTeCUc9I
	4IWp4uJWRguw+0Qq8U6l2oN+KSw3AsfDX3yaNl3gqTOdF07fx9kzIg28TaOXodo+
	AMRI2wLovsG1qV0oGFAY7hAadSRYMlZAUSUczglHoH3a1dPLo4PVFFm5wqbrDRX1
	7+yBbVJkotFqxlNFGdnMGAzsBmnjz/i4JnmipnqAko/FFfLoDXHF5tedzTzsedp+
	ZWvr+A==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey778kev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 13:32:52 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-47203023537so205705b6e.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 06:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775827972; x=1776432772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROaqTpJVwuOL0zdQ36pjCLyEmqKk88M6hTtVA5HSexI=;
        b=CyFg6G3jjLkFSyxKzTqcuCrokea8WKm/sLpYFd/2IXmUhMKtBfmWhZ2HBPzW0kOMRE
         CygePEejEaFE1AOpv2j1p1ppfDnfv1mqu+ukK7G8awl3LP0bLL48o4Ckt30Q0RZgFcAc
         e890YtyuJIlU4VHPJHG6uHwBvMoEyX40a/eKxYriFQu5QHtKXkVqXG3OfjY6gwi7vD3y
         RHrBCMS1q+Xxk04KwUVMBm6bfzucAI9VMTbXT5I/9ls5caVhl6dTLo4MjYNe77/F9R10
         EREOcXpZcGroJ7DKujnRm17P2dJyLHKtiMywThf1WnK8YM+xsy+OX0CoJdjQXvIJqOTQ
         XvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775827972; x=1776432772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROaqTpJVwuOL0zdQ36pjCLyEmqKk88M6hTtVA5HSexI=;
        b=hlCariUgDKqkSs76DxFqnZnTN9bw0SM9GRzotL28mXy0qjBrN7c5PtB0F7nicFdBSX
         QkXaSPkl8nzbdHxrnmB7r4GVh/RQVFL8COHqoa1aNh8FUZyoO5ixUhBbuyTZYVuos/fT
         boLa6zZh/1pz4UnqzB1K7m8G0u5Wdwj0ukjNaM5pDSLSjB7Vo4qMeiNUeRb+DIVXZkSt
         XUBfCwITe/w9HznTBW4CQ3aVmsod9t8fJQt40z+nx4tV7UYm+NK36xYpYaOT4CHU5Gwx
         ESiWegbNSAxwnGpDbqnHffNqxvUYTatwuKh2DTHZik55rGFeNCc/ZiOyDBeDFGRqHW4S
         rC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXacsBn7yjiNQzatiuOpl/Vri9ORlox0G4cy4FtuGvf7legSQVyJHg7gl7KcBsREc0+bPYUjfI8jv4ZfKn+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh2G752IQsvJjOENstkxbOTGszoRYCR5wbi3RIBS34u6aPX9g2
	k7sostf/K+D7aBwRY1+rU0mz13tiyvYCZa+mC5dm7uAlHf6SRqhg+7s+1snnjJ9oEGYy1EhDt9m
	r4AlsHyMQCtkHp6ahi+6jovmTkYuWpErVZryjZzL9bvudZyMFyZZgZMWyOBVWMn6w85bF
X-Gm-Gg: AeBDievcTt8KQ0JhGXtMFRdh50+XccyeQqiEJXDr4Tf3140tBVtofyq/Sr7FdgajN9n
	9ncvJRVtzoOwePwgd0Au+rKMJtYt5rboGSOvoA7loMez9PL4qwi0b7FxnFjauMrDP4ayAapn4cN
	Y2nQAVYuAoSaGO31c8D9LPY/yPlUbMvMHEUFIBhe9khqRisE4rLPpgvZM6eaWC6GAhMBSu20Ud4
	Dg07yaFpgjyxJ2UIZwRrB5BcJ4ZLlcJ+GAzVrcCb6IfjpBtA9kNlO1GRlbHBuu2O0cQxt3cjXpP
	XlKWtIRePw8cKuJ6EXxRIw9pvLoIC4LJdWstbvwVJi+CSqFZJZ7vLTOsNeCgCIZseDUo9YJnT45
	Ty7QfNAayh+b0jLt+qO2RAytjqidhnTc0BCeTonqcK+0ZXVVhlIh61vqet+3g6zT4uSno4Kaonx
	PXhTI=
X-Received: by 2002:a05:6808:1907:b0:467:272e:883 with SMTP id 5614622812f47-4789c740c37mr1031518b6e.1.1775827971854;
        Fri, 10 Apr 2026 06:32:51 -0700 (PDT)
X-Received: by 2002:a05:6808:1907:b0:467:272e:883 with SMTP id 5614622812f47-4789c740c37mr1031493b6e.1.1775827971342;
        Fri, 10 Apr 2026 06:32:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a13sm77991466b.53.2026.04.10.06.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 06:32:50 -0700 (PDT)
Message-ID: <c78fd260-ec2f-42db-82e6-6663b4ec9420@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:32:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: milos: Add IMEM node
To: Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
 <20260410-milos-imem-v3-2-d215385fa5ab@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-milos-imem-v3-2-d215385fa5ab@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YcY5asXbgCCcSPXlArMfu9IcOXoWrWI1
X-Proofpoint-GUID: YcY5asXbgCCcSPXlArMfu9IcOXoWrWI1
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=69d8fc04 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=5k3XNHiivogdNy7buJ4A:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=efpaJB4zofY2dbm2aIRb:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyNiBTYWx0ZWRfX/Dvv6ytjz+SW
 5n7pPuFYrWFP3rChItkZ5yOkUZNj17K1FFtEgTgOGZQw8Fs/VXso986vVA9xM7CFiMSDG5zgtyn
 6h1h8UTFbuByJRBFhuuPuibnZcbHk/hynqWMUJ452PtnPqSDw+tdJT6XcYCz7+i934oxcK5oh81
 FFk0SDoQwRxoQx39wDt+9v1IUJrrL9/5GuvGG8K58Ofm5Cl3HWxjmHGC1cW6V/E2tN62UXSs78+
 +q2NipJZ2m8D3D8RfD4hrH0wx0iTSYeHlaJh5LJw/77s7/byHisFO4j1dVz/RJsJL7CfERggGc2
 UnZLwRr8clDR7ONaYatCpORFFxW2WB6u5FbAroSQ/4jh13YF4QQ6nC+0YHUMe0C7ZatoX9XK4PV
 0WyXAAxVBIUIBC6wWWNDGWWJSIO1mPWxL71SOmT0xWxSFxXscyxlMcQanABiqRBO9WBZMgz3JJT
 SuSzzlo1CzcMJnvjuOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102685-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0AA573D82BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 9:31 AM, Luca Weiss wrote:
> Add a node for the IMEM found on Milos, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

