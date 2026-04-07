Return-Path: <linux-arm-msm+bounces-102118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG2pNU/d1GnzyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:32:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BB93ACE51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC81430911FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9284E3A8746;
	Tue,  7 Apr 2026 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BI/sB+re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VysHY567"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADDC39C01E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557673; cv=none; b=WLeXCXL8Qs7StWns4zesSkjk6SOg0PbTeqeF7HwqTNxGB1BAy/0NqRUtokQpaCyATc4pumD+w2d7sY2fbAWINyILKZoGaTIzq7KPq8WSE+l7xx6L1vSvScxtiXLg9tLrNT9g4HcNaxioso3YuSHELDViHlJlN6PiW/EP9ix0jio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557673; c=relaxed/simple;
	bh=5fYHO3KqcPgzl901ddbUgPijAI8fEqD70vuVnZOSgxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smy/h4MkRVo/u7Nk49IlONuabGqnjNwq1mpWbyVQeKfcmv6ZoT+0JCVx5rmUTwv2Gvs25AdR45vtRhiwoaDZC8V08YDIrKkTWyI+62NPebhlq0pby+MUjyPmfNJgV7ZvUHYUL1zt3NaaUzRZG5WanxKjE0nwnPsprdPqo+s3Dss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BI/sB+re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VysHY567; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376d5bL1584282
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=; b=BI/sB+recpRIGuvU
	z4cMdzyams4wWOkId1FO7POs3U9mGnNpC/r3N1sz1+3LYX0LwEWX/N1eWu+fQEY4
	RGSfXspzScpGdljG7IinuXEQpGJFI75EpKu+031EzmVHubspP0LCd1lIWQp0XkQU
	fqw1OiyXLcr6V9pSei9kAOkpgcVn581iNbn3Yc3wd+oV9+zxecIJFJh7vVANoB+z
	El12ovq/tTV4oto16mnT0pVh5MVAk1IyDbAiz0nS8GRgwJYVX5NMLyy1oS1ZaeQ2
	xA10lO3tef/iDPNRWtgzeQo0OGYamer+4rI7fuJkAv1Qj+A9ZkSe6v/8qs3tUV8C
	2ky0rw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9t9c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:27:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-895375da74bso19006766d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557670; x=1776162470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=;
        b=VysHY567AVQbmEzYLi3kd7FIi+rW866LBBQRe9Psf5xvEd0vD+c0C7Rj0qlAVPNEDF
         wUeAXJymSCawJne75U4FxwNiR/wrWebjxxxq9DOFMW/k6t50QPjhVKHwIwq/kPMEQgwh
         9n2anwXyAuISTzcF8W9HK8ihlrwD675zcFOb0BYWGxWLDrMnyMPLQmJCaFtp1cdxHbWX
         o01Ojg1WaiwSIKihQhd5TNVgnUz+ply8ShxUykFjt99nWuy9Za/xA+dHeykvvOrDFjlT
         9RMKRiMy5G4UfdPexUYIx6dzBvc/CVWo5Cs6qHJrwR2FRyAxHu+HaJ6SON+LY3c6P9ET
         4vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557670; x=1776162470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zj0IO9lWzmhdRtyXS4a4wWkRws93YqSUsMLLkuCBpk8=;
        b=TatUj57cGD9MMsKaOMgomgL8eVIwQAg0VCypGzm0H5OEHqdlhhOvg6FcS2zyr0LcgG
         36VsmoC/AVvTiW2XmC4sQcVds/H9yjUOQU+xlhBwc7oUAivfCc0L4umMkO9byu5Mklgv
         kS8TctNpzzbFP1r9mIumHPkD8r2UKS0VBpxpX85yliRclQI8dlmiFvA3QUc20iLJNLPI
         ONoq98IUeXkUZxrRwP9dto4uNTaEvk35iqMAYvl4S1lSgxHgAaFVBGI+m40MFx9pcIsL
         pdrbWHsclOACR5k9ZFMqfNPMtzIcBOlsJT798G3hSDcdTzfqYsCeHKWdV6fubDYoLC/r
         Z3Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXhrsI9XHrwySkDSk73Srf1Zu7Eu8hgnTA3P0bBzznxScseLjbL3XZEU0CciREA6bn+BeJhyPl+TMKR1Lr6@vger.kernel.org
X-Gm-Message-State: AOJu0YzXASOwbhdngK+CJ/m9prcjE7N2NDO7HQFndJv3XzNxLIBj2te5
	e+Gvxfo65HTs6AQ8Nvkd5cWwVdnJrWQW1iZZcreI/3cX0uzwiCeLUHD1Og9niLt7eW0hzdgwvYj
	2T/l5OfRbgDWjaZGqBlAwJcuzoG6QXBtOLGcsE7gCpvbXJG7nyQd45/WqbL1QIpLmecJQ
X-Gm-Gg: AeBDietunm1YTsnlRgJiGSXB9CJExkXoer7giwS7eDjxzAVFtyu/oA9I+/gRvcE19WO
	0YhbwERPYcGs00DJnqwej7B9kqx5Gqt1fN+NdtnkadxjP0U2qF/d0TGwJHaq2unLtLQvwNXWJlb
	kO3a7VydnSLWXedBjmlOSgIH2OX/R5uqS9xPM00MyK7cnmjwGRQ07VQv3t01wdsfjWl/K/dsHLP
	xdvNT/3fTbVrCHcUfaboK8Cc+uL2bYWk/UpUa9Ja1zvPmxjf6o6yHirIhwgEOKpxHtuH0adPUql
	dvvhLBFFaZZjzRllHyKFNY9XousLgc/dNEEc8vIMItdEyFzHDX/YBmz2MGNUjOBjm8wNB/Zf7D9
	Kc/qoFKzOZs/vqkaYjHfq2bOPNNx4DFZ4J/rsVrCJPs3iVr71KgWtCKqANrL8J3RYvPeNq/zoHf
	9sfTc=
X-Received: by 2002:a05:6214:f06:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8a7048cce76mr188034556d6.5.1775557670614;
        Tue, 07 Apr 2026 03:27:50 -0700 (PDT)
X-Received: by 2002:a05:6214:f06:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8a7048cce76mr188034276d6.5.1775557670133;
        Tue, 07 Apr 2026 03:27:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c11sm554038066b.30.2026.04.07.03.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:27:49 -0700 (PDT)
Message-ID: <04f8e384-9e18-43ca-b277-d6dfc5513303@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:27:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-2-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-2-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4dc27 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8poMKPHdAAAA:8 a=EUspDBNiAAAA:8 a=iV2YkS5aR9AJb_P5GS8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX2maNNqUYxKLw
 6YpSUumnxqr+tlL9YD14U+RO7cqN9kidlSQuVa1uNYYqU7WJ05IZjcn5diOYeVgNn28FtREuKZd
 9NmXiaCqf6r8eIlewuyJgBZLT6+BHl+RF4DXv4tJwfK00dnuLYypkhGwH+meXv6vmYwx1kfkPcY
 KryW9u5ionSWISyg85PKGXfw6LoJ2FXubrYOQterQsGN9do6EDH8uP/kJgY4zwItYWBQrODA5EC
 Dnz8jj9PZiLUkjQInapSc3e0PNGxgG7nsd0pnYXTlBklAuVMHrhpRlN8ASlfs/9VK1hLYKMhQg8
 0ADIXaxrRSpZqK+P7b9cjpE4nuujjYvYMj663BUPECT5wl3vf8NjCQgZMdAUop9e/tao9UmEqy1
 hjqpHFOXF0BHtNTNoFnuA5cO1wBue+kXOb77QDFVKfKWjgeW2q1lml/SkI0RNafKaLrB9IDvwIY
 4s+NPUM9SJ/BTg8B6pg==
X-Proofpoint-GUID: OjAhZVuOm1qJk5SaQNEsaQDh9eWX3UWB
X-Proofpoint-ORIG-GUID: OjAhZVuOm1qJk5SaQNEsaQDh9eWX3UWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102118-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ssier.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38BB93ACE51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 7:16 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the NFC chip used in the HTC One M8 to its device tree.
> 
> The downstream vendor kernel used an I2C frequency of 384 kHz
> for this bus. Use the same value as the vendor.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

