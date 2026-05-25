Return-Path: <linux-arm-msm+bounces-109656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDQoHMZGFGpTLwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:55:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D15CAC79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DE73F3004D9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A56A383981;
	Mon, 25 May 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSgAGunF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRQq9WR4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA11383321
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713727; cv=none; b=UnEih1wAnLxqcRm0Ds//xxaryfvEmc+Gjfn2bAuas+92kcNO1ANm5MoWvmglvLRxzfdhQQDiABynnW9WO9OQkObkmakbvfYw8wIevQ/oxYF0mQSlaANk7GArb7Z4zbSd5JxQJIMzMN4RcFoqahg2i6DoBTeDAzj+iHJLRbp7aY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713727; c=relaxed/simple;
	bh=gRAzx6snyvOg0Ujex7rxFmLVCGMYSZjgFR6sMgNyQyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3710Uu+cI0fXINpk//QbFsEI53D/1uK3YZ6e+3Y6Z4YuBHqpQYD75amzC5rSveJOZp4NaD6G+j85qI+KEmjkDWOCW/YhSiq7C6holx4WQ4htSBUx+wYAHFmg1QVbHpfuqksFb3uk1yQXddvX3GFKvnVBK6c/kHGhpFftncSpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSgAGunF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRQq9WR4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9M1A03580685
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gnk7ppNQ/8EXsY1yQ2ox1VRVu95Teavo3cDhuUNeAMU=; b=NSgAGunFSmjE5KTe
	dWCiTWYNxS4fjpGPcVkXOdlkO+witeoau1sSNojV8PQUSDpHC/KvnW8kgUvfFM9I
	N1S7xDapOlRbzbBUK6kKgZEB5i+FCK/SHlzf2TIdpK64Vu/vQ75w9YvMPS+cwqgi
	ZJzw4LFr5D1/Sz/E7+h/FgdvVC1GJMxI0HcbVkIClFGz7zacEEeROhiKzS7kLm1Y
	WaMcTrTYeACvCRoLvy8rh/6SWyArpBB7/T332zKfX7kyUY0RdFTOD+e8TtSD703e
	0d8X8OrZsFei6gO/KvIyyiw2LMD3HENWNScOI54bm3zoMEa0/LMB7tazNQFnmzVN
	LmEGuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txpq4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:55:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914ae409b05so80320385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713724; x=1780318524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gnk7ppNQ/8EXsY1yQ2ox1VRVu95Teavo3cDhuUNeAMU=;
        b=TRQq9WR4jIDiYisb1lV8rWc4zgcZD1jOBiy3Wz2pVgw6zjWoW7VI32dernKhqQ/jaf
         kySXtly0ZoUR7VPirfAqNS36cdR7wf51Xs+bjPFtbpkEWJnCbvsuy+8I0ZCEoCQjpZxe
         SfAwYJXQKTJy9NKpCiPHlGFU/NnrNoUcymv1Cegu/af38wBN2+ccNRzXXh2SS6d0AMPs
         rwYJTS+FdROWEZFziEs4FVl58uyXl1qYx6TYuTa6KrKIpO+ioUBs7vcUz+dwVzfr4jZ/
         9JU26AkBZnUgTfjyJGaDyPZxjtAN1yHaC3n99qCfWQllr3iLipV9G1uHceiscen+BgKF
         Z72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713724; x=1780318524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnk7ppNQ/8EXsY1yQ2ox1VRVu95Teavo3cDhuUNeAMU=;
        b=knjRINYolwO790Vzdu8toNKcM6OQrq9nxPAHm3xsN4PIvU+nUTdBCUSrVMQyTlRsIb
         A4SMBA03Zte4s7PgtxIfDge9ljef4oFYgqGkCfFtTc3X3Fpy38RMAGgfFgmxaLn22MvR
         iIwadl7kVyK1oSOddsWmJJJK91hSGGjbg1atEHlLMmoA0ReDY0ocr1r0pK0Rge37NCo1
         YugyAfyroltjbypo806dHHvxsY3I6oG4/7bm8cRUEGYy68qWzzLCUaHcF6Lp4jZp3Em/
         /Xy5IZKe3C/mpr3/Gcx+ZVwxuRxNL4c1S8OA81SFcVfq22YYcVS1IrBmzfbZ1K2aKrBU
         sF9A==
X-Gm-Message-State: AOJu0YzGiggYfanxHkMFhvTSbcfkCaJiMzrXYjbeQlSUc9i0hL3PCxab
	pbyrLdaE/b8CPNnzho5UQi62FGhuGA8rsh/RsUGh1J29LG1J5HJaxiASxnWMjdC07/dgavutfqM
	bMAqBpEeB1bsRsN1i2xcQ2ALjfcU5GyebahF75u0M9ypsxxnuqtDq35/fEXyLr5mKGpTp
X-Gm-Gg: Acq92OEjxedQ3aZhEetrlSuYVikAIDVTmWQ5dE2hkloHBs6P7dqXXDDiOQyrPnLtXmP
	2u7yqzNo8sC+lYzuSpMqcoCnmzYB4aOHWjhH5XB8YEEf9PgomaAPEVgDE3FH9exUF4CcWA7/EZg
	l4tfhqEkTBmODkezJTNaj/e60v1w4jpC7YEzYKUfavkBPlP0RsC1hreh6N7tbS6RUY0HIZ2GHEX
	dv13H/f1XNT6bXPVEbhmkwXtRvbUFJNz9HVzZOFw73AMnT1DqNNcO3FW8UYZAbSOlQuJlU1fWBH
	IBbJxLAd16vWIy2ZAryKxBcCNiQQG8ZvZBnnqNQCVzVmCMNKVreLqYzHosUe4SAjsES6QJmeAjH
	D/cw+AWPRIE6hBkka0qwJ0RXTXQQYgnGHsMnIz8q2m1+u+g==
X-Received: by 2002:a05:620a:172a:b0:8eb:605f:6ccb with SMTP id af79cd13be357-914b46c19demr1368225485a.2.1779713724515;
        Mon, 25 May 2026 05:55:24 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:8eb:605f:6ccb with SMTP id af79cd13be357-914b46c19demr1368221685a.2.1779713724068;
        Mon, 25 May 2026 05:55:24 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bd00e751sm3897925a12.27.2026.05.25.05.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:55:22 -0700 (PDT)
Message-ID: <af16ce41-7db4-40ff-a722-a95fd014970b@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:55:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] arm64: dts: qcom: shikra: Add DDR BWMON support
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-5-f51a9838dbaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-5-f51a9838dbaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMiBTYWx0ZWRfX5ACW38Vv4qB5
 /4oy1fCSCdl3gNLgexYe2jdnvrf+3Ww21FbHDOKF+rRNyaL8sMWDM3VRaQnatJumkbJ3NIfvEf/
 +s03Z5cj8Sx4h2ck7XlfFQGtdHJcllkkJ4jJX7vwUTtvEviLbYE6+QafpJUpx/P5Ln6a+1+8yVt
 CrUI/4CzjDVsxpAzb1vNSxLSUlulEe0g/dowst3HH1weqnB5DhBI5a7t8Dc9d4tjKRTC1us/MvZ
 2NHzIkHBbrjpi6PxFchcHE0FT4F4FWlq+cWfSb0iowmLN6S6GaOZBo6Rev+92rjYRTWUgwxK6NW
 W0Yd0qttiuurf+CL1MJGIu5CJVUCapHBPKDKtkEQMqghskfvkMBjSLbLQFvfwcI4RPuMX7AmeXi
 FQEZQ88KL7bTnojsTRqvQWnbhBrpEPKT4+i9k1iWwipfPDNLmiJqN/AUhlf20agzHWKLjlbV09A
 8PASIC3jNxZ2LdZK6gQ==
X-Proofpoint-GUID: J7-h8ie-Ed5jRknH_8LKx9T6UqVGhpjW
X-Proofpoint-ORIG-GUID: J7-h8ie-Ed5jRknH_8LKx9T6UqVGhpjW
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a1446bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cJf_ainsN7bWJEJn368A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109656-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD8D15CAC79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 9:49 PM, Komal Bajaj wrote:
> From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
> 
> Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
> Shikra SoC. This is necessary to enable power management and optimize
> system performance from the perspective of dynamically changing DDR
> frequencies.
> 
> Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

