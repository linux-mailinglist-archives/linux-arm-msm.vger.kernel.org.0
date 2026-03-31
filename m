Return-Path: <linux-arm-msm+bounces-100957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCBZIPZ+y2mLIQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:59:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5468365A45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34B3A30990AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F8B3CD8BE;
	Tue, 31 Mar 2026 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfVvHcPw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfrUzR/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265EF3D6CB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943535; cv=none; b=cEZBHIuFdwCnrPFsbo75W6gz4FK6VuYIJJa4FNS4O5sN3Yu32mN7sOlgzjfgmtFS05gVi+xB6TIgBE8kWMpATwRwXv4tu8hdWCH9fqhAAuyFSPr7yMN+3NOOEMWLqqbCaazvivTAcASJQ6mcy2mpY0yXdFjLDUkMDnZh/SJOc3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943535; c=relaxed/simple;
	bh=wA78j3kMngBreWSYtMlUJcKXyLiIrYfMXx8sDqogr8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUvj2RrxrA0OhDldufKM6alPHYlK2sn71zxWxGGXpeYLG1lr5aoltixx/qUHV2DHTzgEarTWaKwi2tFH0G/08XMzr+hOyv/xLdoamB2eArNsHlMl4NXXpV/yMyeJgE8HCfyL74CKd2OKV6pT3NIOYCtmKKD2EgrYiOlLX0mpaqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfVvHcPw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfrUzR/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6klrP2391218
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnMbIIIsYMeq5NgReEDiM34tKVkTHQ7N0Rwb8NCEU2c=; b=mfVvHcPwpzLKI8o9
	NmIVT/KgHr8c6WAxjcAcS+UsXT4TLRDhLH8LkZYaBzoR0pYXG/eheSb876ZwPfw8
	WzZt0d/4ov1kSOSET0IJ+UDnIjNdJLVYKBmCgC8pYmxjTkcNbJQ2lUjpmHraHe9f
	XJ79Q/j0SXrxPsWx3rJmd3kiuPKPTqUfPk6sSKJzX/QqlsHqg4J42eiU8U4/yDP6
	Eu6TZFKFQW/E9I+iN9LrMwDfjmVKfOKEcyOAEomeDiw0h3c1uZ0u+0UoLcupY5Hm
	dmUW9u44bZfmMlLUg66VErkJy82GT7XkBhQPBFIFLtGKn/fEe8oQAiR7+dX+9Fgz
	Nn6beg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7kd3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:52:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so157664985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 00:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774943531; x=1775548331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnMbIIIsYMeq5NgReEDiM34tKVkTHQ7N0Rwb8NCEU2c=;
        b=WfrUzR/6HKlO/c7KR8h84LwklBWuCm+XN0T8AdGD5cG+XfJPu4nG/kZNmxyF4yvg3P
         WkPUAX2DkldOie3VP5jSOnLhS9e2oV8CXLfbMbPbccUdp6g6PJ2+zykRX9/yFfzg+1/r
         MR/l4C4JWWkpfufd2tZVzb+sQlz7nNvF6dJcD++FbeCiLCv/ZxNOZMLm18WpAJnSQSwd
         gda6gLh+KOS7P2RHOz+g1SNe7CUHmXJ8grxYh3rOD7K29N7GmMuTW7ItZkNrf474KIQw
         y+jsgnHRLBITPWAOwp9lAbLbT0X6ZIdKEnrEbQz6S323h4dPbaohe1QK7OD+ZUY4ZAdy
         ydHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943531; x=1775548331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnMbIIIsYMeq5NgReEDiM34tKVkTHQ7N0Rwb8NCEU2c=;
        b=bIGCZv1EpUZhweygXq0Q8jLPjYIPWzGbcITUJ8Hzb9sQ64jrnQDJdX/EtzBaof2HxH
         V8gfuVsI2Tl8SuKsx0R9Of77voozCqkvM2H/ruWWmOgfks/CngJIszbxj27JCVrECdMZ
         IQjqvgFk8/qHeoEeK/5iBhS7nroMLolj5IElMfTDqzFKtGdRD4+QPWPxVstR5q/nYmvf
         SixF7cVqhydHYFhFqZNgw4zFxAKgKwo17UPgiBYiEnZX02oFXeO0daOzGrqwr3voXNY7
         RGcjUGE6XmARaH7Y6Pf062V4AF+81PyzgcM23CNsGxx+VuNfgMmAD2qqhQS2lZdy2RHL
         sqTQ==
X-Gm-Message-State: AOJu0YwUfCd5wBeLV9zmRZktdggCkohWGZJoQSSuqCoud1BlF3BMfOMA
	6nG2mPDe49Wa76bAcccyd5/wTtjiek3oDWqOmBmRGKWBvQJHAALO2/NqzmvT9wbnoEuAZcibzg7
	DpXidvHuSlFN1qUr5y1dcvE7RSBAESKAu1GVMSUGRsIxjxTlZSWkYFnDa6s4MFYRqC16G
X-Gm-Gg: ATEYQzxNB/U9yzpPRkcX7DLKnzO7tE5YIxaMoXpMLFON1XXVk1xQZWdOAvgTI86GvrD
	bTl/J6Fh3tjYbgpt6ifXswwI/q7zYXUmsYnMQtJHGhEOh/Nx9oDAsduBJoQIHkAIW9ohiHN33i7
	gtZGyoN+WkeNeVvntwN7ACygfxANXK984n+wLFMNB+jXX8Pa/8j/1L1XH1UP99OHDVkoUfj21Z0
	xgMRxYeHRCs7hikjYNvjtGwgnldXRlBeODxEpn9gBskA6Kr542eI3kmjQ3FiEookQNUJyDsaskN
	qa0aMpQgoQ6juMgF4aN+jESukVpml+5ACkXkD4TUfc5XGgPeLMbTpoUGnjygXW0Ka/hGZzG3fG8
	7E8sEyO0SWTW8ZUkFqoSviHJrR6xWgpZE5zCrSBpRDtzzecdIqWKCBihQLMI4TIzweokeKnnAQM
	xm920=
X-Received: by 2002:a05:620a:2a04:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d01c379c1dmr1563077385a.0.1774943531455;
        Tue, 31 Mar 2026 00:52:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2a04:b0:8cd:91f5:7a13 with SMTP id af79cd13be357-8d01c379c1dmr1563075885a.0.1774943530931;
        Tue, 31 Mar 2026 00:52:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72a6ec5csm3226000a12.9.2026.03.31.00.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 00:52:09 -0700 (PDT)
Message-ID: <46ab9ef3-bb66-4506-99f7-caccbe99e7ad@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 09:52:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: add Hawi interconnect provider
 driver
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-icc-hawi-v1-0-4b54a9e7d38c@oss.qualcomm.com>
 <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-icc-hawi-v1-2-4b54a9e7d38c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3NCBTYWx0ZWRfX7ytLzanKPMZl
 7DW3JV2Vip/zX4moUs+F8g4K1Eif6M2D9aT5+ncJxHjXdxD3YgENF2DjT7wDi9StTWsbgixJqpA
 uIhJi/zmzlwsJFhzuXBktnaCnuRCOL/3XO5uUAihiGWHVgJzzO3ICslE/tB3Ubkr9az5PNIzury
 RLWFIp5nNkInngwbpC5canpY8wtf64/3HzCBW5hgjZNJIYyGnbwJLrMGIXtnFzzQhDnRcXWMHbD
 aVAtXnq78oq+9PMjz+h7tFVT8Z0GRghS8az3lCaDoLeB3ZnKZlXoax0WP6VVZrY2PpiJYeFWMZr
 xOeDe5sIwbuq6wuskaQr5ttdWKpw5GU9WEqxK2L0ZJntnLCNEZKRQfgMkYMmJcKjxgzV26pdIbO
 qF0b61GwTbkqDlUGrGSoEPjy8Bjb/wkKb6bAuCKv2yhsxMdcg0MzzshQuVVxv+89ftRHqas/rUF
 SNk0jtYnOFZHjK3TYpg==
X-Proofpoint-GUID: 3xlXsqvkaYL12CAGcplKS98KLbjp8v49
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb7d2c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EHExEHXSfcFrU6sAQN8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3xlXsqvkaYL12CAGcplKS98KLbjp8v49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100957-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5468365A45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 2:40 AM, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

