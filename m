Return-Path: <linux-arm-msm+bounces-101915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI61NeUu02k5fgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 05:56:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FCA3A1600
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 05:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2DAD300EFB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 03:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3E131B833;
	Mon,  6 Apr 2026 03:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/nE2zdJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e533O0J4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EF82DD5E2
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 03:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775447765; cv=none; b=Fsmc97zK+6RujhG7PMKJDFtSCxvXkh0UuxYa+RwWnsvVM51ahdDyfkJrPPAnJKymX3jfrPfcec82Ww/yOZC1FM4KvyQ/3ZZK2ki3Nhtm7qRbF36mkxYuZlNdZFcIqAQnItroBLBEUYzi82LRZ9Hn9cOcAY1iAD8P0GUM55aW4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775447765; c=relaxed/simple;
	bh=p1vY483HycGMnejrqOpyVYB4eBSMq/pYkl7XqVTVeQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IuoYHH5E6IUXCH/fnJiZ8vRsdBupfNWMtDRLX/ke7sNgPalWpKllO66AIYcj8KB6jc3kES7dgBcuVNrFyshnZVzkk1BBo95dItaf4B4QJEhkFmOzGhMYLAVMTkZVUerVys9zzD6fPjHs3NRxx5huvdwmBKBQPk50Xh4M93zVVhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/nE2zdJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e533O0J4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Nj7jo2792356
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 03:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJrcXiZ7T243FVJ3L4ZcD67EASI1BaR85JnQX28OM34=; b=c/nE2zdJhfqKWlI9
	Z5jpxNAaFSJkmwq85a6wevjR8GRgyE8cx+mEjHEHZ4jS4pMWvNZFn4hBFZvs0xI3
	VSKYm+DQP3EQbu7I+YaTLZQB+0dJgHfirE4fwdnuhtEOlfXHM+b33cHyAQWFQ7JL
	r6GC+GplkgCY9VPvAELmOkfBrJKgIdcUyBm7H6YMbsaOOGMP1HMyOnqUzG6p7Kfy
	r+2EaLzUVtUdyKRrAcS6GHrcBw0uInaddkMBbZ5PeOpMfOVRdZdyf3LfK3ThCdzh
	7YOUPg5pA78wDpO3NcpfaTD9XiEB1a2uZP85i46ApAia0rE3ETSBaU4Y3pa1sZql
	Cnj7nQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfky7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 03:56:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76dbf0fad3so818276a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 20:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775447762; x=1776052562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CJrcXiZ7T243FVJ3L4ZcD67EASI1BaR85JnQX28OM34=;
        b=e533O0J4AvU75kW/tPp+QIEnZmqz6e7Qr+IJdNuKEIhK35KNd8g0Q4INuxNcq72W6Z
         mEJLMnue9yQhOfXI50dP9QWZi7cMvIZphmSWKGXqmMo+zt7Dj0/PnOftxRG7bpBHd9YT
         r1QRms5G7my+nmybY0zf808DtlMGd1VEv4Pn+pYiOQnPU3MWcpaxaG4JobRbc21WTKbe
         cyyyBdVPFGULQiOKPCiYTBv7WWM6y2k1LFYmIbcRlWhUtUaH8q114pJxyq0FxxTm5m7m
         +3DLX4En1SmlsFX8fcN+EkKA0c4guY79WP+oa0UrYOiY2h2vQ/ajAhptLIE3Etajk4Vo
         AQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775447762; x=1776052562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJrcXiZ7T243FVJ3L4ZcD67EASI1BaR85JnQX28OM34=;
        b=lxVJVJCR0rOc2e/rTTamg57FEy1nVKCbyBl614R7+0++E7exWWetAQDaz9J7XdULI3
         2VWmQJvnnGmC3iwdUJamvp7/CttlS/7PBgtQFhDP7goc9c22Is4JkVp41GU+ZLe2UZzw
         lJPF0kr2M0d3wgUv2bVYVt0hTA18+ZMDFQJWmmanJAYM1KXx1k+UuJQxZ+VMcmIQ37LK
         KKdEYJ1avkInz9iTs9ieehxA1tDdd98dMsysIHijo9/GjXi51MtRg8glCtUXp2rVNbKr
         I5fOK8juKMg1zbWVkZ6ihy6GLg+pjwxWXif6ojN5MMUZY3uvRX8LFHdW9vs5BR5BylrI
         b/cA==
X-Forwarded-Encrypted: i=1; AJvYcCViQQIVnkgYqYd7lxtQ2wyh44EFvuHBOuv+eCecw532km7yXQHpo0iVjso0FqlWa0207onHUT94p4VsWk6T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb8nzj91m1s4gX3+rsUC4EaTwYBAbM0d9FxD8JDsgXnV3VmVtI
	QHrcVwtWsS8xIjCvOLgdTvJEKCdn2NBxiJnWiQHXfNx4fLYGjYjlObucNahcmJWZdD2iX1AF4/I
	TDjkCkSrcASnQNS4NzWCRb/p6PYFLHlYuZ35icHCvDxqYyHBNWcP2Ipe+V5xWMLHjLI9qeTZdlZ
	D3
X-Gm-Gg: AeBDievvj6uZZ1M7I5A6rVp6xPT2L3m3+/0Kl5JT2mMl1ylRU2t1/dj6seUvW/sBt5L
	su7KJBJHSzKy7RmgdbYekh708umuh1Eefb95GyBJ9LXrjdzHdYTL+kEeF7XWlaekG2ZT9M5xWLn
	KGA1pSqNccP6lf/vMXnqhj1qlPn5GMqhQifIUXxPhUNQt54Fqvl8MggExWSZtCeZPGKQsgnTjpv
	y1N09sEk1nqp/CcKOkYhA28lBVX0oPlCpd9Xc8SrR5MUQEdlo8radPCz+trBhVdQoUeORcxzODG
	dkhKKzkUQcnVLr+yvr52xzhEi6IuxkGd0rjisUBSmxzzqRyDVgGOLZJB884DBnRjB0bKUyLKCVd
	qWJycHH+krKw/UKxXmUM1UjrchtuFEO62cOnvL66gIQ4OkKd9mg==
X-Received: by 2002:a05:6a00:1950:b0:82a:153a:c133 with SMTP id d2e1a72fcca58-82d0da4ce80mr11068328b3a.17.1775447761753;
        Sun, 05 Apr 2026 20:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1950:b0:82a:153a:c133 with SMTP id d2e1a72fcca58-82d0da4ce80mr11068305b3a.17.1775447761294;
        Sun, 05 Apr 2026 20:56:01 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm12799494b3a.29.2026.04.05.20.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 20:56:00 -0700 (PDT)
Message-ID: <ac3a08a5-8eff-46d4-b1f3-5d98a951d637@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 09:25:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly
 use additionalProperties
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAzNCBTYWx0ZWRfX1N0mQauGnO0B
 24LotLJ/P/0uVgrI2hkIMwB+eO2xFs7CJUJtyFn0eUMGT9byRDUGTip/KSX34mSs5Pt5sw1wd3h
 /jTK9c1f1sOQmHVJjj57YgRbRfD3WMIRjszaaIK6yCxWiYtKOM8A5X7fLPWBptCv1lQGoG062X9
 Lyo2Batq9sDk8y8Dl/6qI2+W7w0P1a1km2l548b8bpPv9qzbRwSZZfiLcUqe8S5r3BcO2T1XpG0
 fCQCqidPfz3CT6hi8FmpeSmTnhEBvJg4w6db9kUpsHSLxeC8NEBfSChbK4IfawRY7DrxXX9sthz
 UDvhrzgtokkMBpqby/lNUZlK+Dk8twdo1Cx36eB4k29yRP4lI1xb/JlZgYZqre+ZvlNRz5o7mLa
 F9CBIeulJJUFfgnSfrkviGlthMmgHns2Z4Ao+gjBu5Idgw543KwGv+ePo26lZzEIwhPaz/ckWsS
 dC+VLiA2tC45JeiLeiw==
X-Proofpoint-ORIG-GUID: 0qZtaktteJvtahHb5WdtfrnmHLno5SuR
X-Proofpoint-GUID: 0qZtaktteJvtahHb5WdtfrnmHLno5SuR
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d32ed2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Yt71NFteXPjXTNy6dsEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060034
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101915-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52FCA3A1600
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/4/2026 4:24 PM, Krzysztof Kozlowski wrote:
> The binding does not reference any other schema, thus should use
> "additionalProperties: false" to disallow any undocumented properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


