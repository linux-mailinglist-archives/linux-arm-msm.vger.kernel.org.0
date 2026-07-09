Return-Path: <linux-arm-msm+bounces-118092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IlpwNFH1T2qDrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:24:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62800734EBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 21:24:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KNheesOf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jv600KhG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118092-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118092-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCC77308027B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 19:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48625357D11;
	Thu,  9 Jul 2026 19:13:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5AB233921
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 19:13:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624427; cv=none; b=tfhapG3SkvE8K3hpH9TZ5wriWsJAMAiUwoACUQOIVTRxUPXmloj3i+S2jLACpGYTkBbMaa8r216JjQ4UGwpor3WUdaVQP98ImCaTritcKH1ceRXkWEeRW7GaGHR3tEfssGnbk3YmRvwEXvLEKeAgSMo+rZPQYERIN0J5L++1PDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624427; c=relaxed/simple;
	bh=BUKK0ZC2pEiS4Dm4MMXPIkIVgQy8fsNEZuYUy1kPR0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9xhMWohX/LPkusGr5DgctK9OLSjFZ1DxY/8WOTse4sJUCtQIOf1MADO7hFp37Hhh1/6p/tWRgo/IMxb/khhOdh8C0P9URK+mFzYHItPBM+la0I2h8NgEjDojXqIYQ77v9LFQPDJ7sc5pqbqjZAOM4e0AbI4A0qZ8u+nv1Zd86Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNheesOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jv600KhG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWqWZ2563404
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 19:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=; b=KNheesOfomsVUduc
	CcvE8SZac96fJwdfD/TF5VQoEEcRgWj7I7Frf00hqvY9YqdBKm+Q4GHzmND/guqL
	btUvlew9kmRNw+mfAP2J5jKDtmluhG7B4jpcDaecLJDHLua6GQA6kXhzFr+ldrb5
	jq0mhLmSnUMZWsb9Obz8avq6lEubhe6hzOH4+7RJzLx85w70UhKvzl6DAzRxb0So
	b/XFXEOcEn+TUYyz7rsBbLtMnbUfuTClcpfLx7lfS6duopKQc1jj+ivBPNAwOUCh
	ZWXzokrJCv4KqAa8umDnUVMD6E43C8+9lcMn7+xCHPtCFduKmq8bbtZE1nNfKuRt
	Jz7J5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3h27h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 19:13:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso2885985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783624424; x=1784229224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=;
        b=Jv600KhGq6mbOgNttUM8RR/c7rrElUq6MO+CxXen2XIq+7y8P7qx2fz7rQgSDQXB1Y
         iUtkmqG5dPNNtWMzsMHeI67Wzm40NNixF6Ky7fqSNZMs6TrL9pErwple7LkAjFhI+kzO
         nNCP3eGmA8dlKynAeYv2hLpJNoS7ING48347e/BYKXBwFnNKGMd7l5e+OTvPjygrlDio
         uQ6q6EO4XEOWzg08eYdcP+u7tLBiPUqxIBP8bsuBq+pLIVGncu18QxwDZmSayRQxI0sS
         mBf8UDpTka7hjhDA3DMDy7aQH+QWGDze0Y/K+f22Vb7TbwAWozbdyqqzAgftO6hXwWL0
         YYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624424; x=1784229224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ukg8K27ZNplR+yNjefMWINfSHgjifpE3C2eq9F7iWjM=;
        b=C466KnEeawiYhm0aHnrhmFDJNCuZZNUk+AnTLKfjtjAyioOo8zLTQPJt2inyxpwHCE
         DH7WvjS0u3QjnKdxDm9J0xPWl+JPEjZgcvnYeSmZ5aDvoiPx5EQzyWwD/M2emxP1y24c
         Te1yqD3g9apVSqbfVea386w3LYmPeXmuPrO+s2D0OYlAh4clb56c068Hk28gSgXmyvW+
         mLUpfqO3DNqGx8IZxBBlSXxsPIETXUOOQFNXmoprTnwjRqs+/HCQbG6m3lpUQHlJ13Is
         QAR/t21xeCaU+Al4oJWLmnMkyMeo6NCC9FfE4csUcUM2JEgUOYX+4A0qSqcTgcE8/RnH
         X/0g==
X-Forwarded-Encrypted: i=1; AHgh+RpnjT9e642cejqmVBBmP+EskntyHbwvRhYKwQIZb5wJ46HQheU/ExcPM2j1Jm2aQuorB0qaLG1qznCjLdbD@vger.kernel.org
X-Gm-Message-State: AOJu0YwPbod7J5u3cDXY2E8IUXr/+cJPDIvbuSSW2LZLNl2WnLa5+DHw
	MDxzCtNC6iOlF1L0dFwZcsuNv6OUK9BavIxzY7+wGMjbjLb/DUReTfoQZzguRjq98vblZimH1fu
	mZMJbjpO4ctkHj2mky20eyTMwR9vekR4cFsZ283AI8/tSyg8kM/P5zfeVad/sCSmd5hM7
X-Gm-Gg: AfdE7cmJK9IFejFra0dREpz88SLr1cuFNIlCYnr4OpFSa+qApVO0+knfOR2Qg2Q5N/1
	y/1XIlUDNE+/iN0xm6oaxzjXWdw2euuTyzMktfme31YQBtgUNl5wdL3njChLjojkEbzdrgSI3/y
	ine7IiXOriFxrvAESrV+J8sbdfFaHIWBaha9/P/aHFc3RB41XQFQPR9nYNJORjuVNORC4rFjun2
	q6M1v/e0l0gPu68FyuE+NqpZ1IKR1mKZbfOvFrqINNTXHztOzJKAw12NwtGPF2T0G/Bm7uwaF5p
	/hHByw5ub1+Axz5ECylax8dtwVlyGh2ATCcb4kDIYopK+OiK4SgENsdNHFBfMisk0RnfbHCT/xG
	2kDJxvrKdgWxvNZv/24NwXCTu+reFdLF2Bkw=
X-Received: by 2002:a05:6214:529c:b0:8eb:1061:552c with SMTP id 6a1803df08f44-8ff941c2fc6mr52515926d6.5.1783624424252;
        Thu, 09 Jul 2026 12:13:44 -0700 (PDT)
X-Received: by 2002:a05:6214:529c:b0:8eb:1061:552c with SMTP id 6a1803df08f44-8ff941c2fc6mr52515356d6.5.1783624423732;
        Thu, 09 Jul 2026 12:13:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69c14972fc7sm595785a12.22.2026.07.09.12.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 12:13:42 -0700 (PDT)
Message-ID: <88edd673-1220-43ca-805f-675890be0cfc@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 21:13:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] arm64: dts: qcom: shikra: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aastha Pandey <aastha.pandey@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
 <20260710-shikra-gpu-v6-6-b388ec5dce77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-6-b388ec5dce77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfXyYLLoedfEPwK
 E99iIBnL/R7p8/wfMtr5QE/2S5Mjs8Q3BDU7Ee2YFTg4ezsxrD5EY+EwF96ob/hEuvz9LKBLFBj
 WGhAGs+doDp9T2dS0+FFhXEPYU6tPLYdHVJ8qSZDczdo15GJVx1NYqwgKX0MVbHnK7n48uXCgtq
 saMP4jAdO6+RGFxrUgpZnqzubAvQXXKZWK5q5hqRy/LNLSxGDfD//UhORJxUHpAu0FLZ1zpl8RK
 Zo5R27+9CHIypkNT6ZlJ1XYzhL5yJmfNkt1JFGup4BPJZRakeSrttfWkgJJtce1oxq99omyUWPE
 IwSgr2rshVLdT554CkYM3nnia4BIPPFb1IEFswA8WgzBDeBd4MQJJQZ1bTD3ntFRmH9VhRS+Pcu
 VYvGCftdNCCioEeYCjMMjSCNm70Nr0FhU+XfAB23WP9bTNQzVg7kv7/v96BO2okgisUvwiGeTVn
 CG6khpXH2viSFKQb0Ig==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a4ff2e9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4OSBTYWx0ZWRfX6wuYA+4srvTz
 rHUVme0eTTo0bxeKijrV2EUOj6UGFNzvLJrsmFpvXLQ3PtucK3biQycJ1Fr+Zgc3pqNifq7WrNj
 qQ/hBdW43mTTeGg/i1bSjvQuEJ8viJg=
X-Proofpoint-GUID: zgPRa3SQMXf2y1Ha2uuNZYsAbC9L6xgT
X-Proofpoint-ORIG-GUID: zgPRa3SQMXf2y1Ha2uuNZYsAbC9L6xgT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118092-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:aastha.pandey@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62800734EBF

On 7/9/26 8:42 PM, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures. Set up GPU cooling by throttling the GPU speed
> when reaching 115°C.
> 
> Without passive_delay, the governor fires only on trip crossing
> interrupts. Temperature stabilizing between two trips generates no
> interrupt, so not all cooling levels are applied. Set passive_delay to
> enable periodic polling to ensure all cooling levels are applied.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

